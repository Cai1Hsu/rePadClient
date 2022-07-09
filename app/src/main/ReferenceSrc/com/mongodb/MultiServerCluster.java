package com.mongodb;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.logging.Logger;
import org.bson.util.Assertions;

/* loaded from: classes.dex */
final class MultiServerCluster extends BaseCluster {
    private static final Logger LOGGER = Loggers.getLogger("cluster");
    private final ConcurrentMap<ServerAddress, ServerTuple> addressToServerTupleMap = new ConcurrentHashMap();
    private ClusterType clusterType;
    private String replicaSetName;

    /* loaded from: classes.dex */
    private static final class ServerTuple {
        private ServerDescription description;
        private final ClusterableServer server;

        private ServerTuple(ClusterableServer server, ServerDescription description) {
            this.server = server;
            this.description = description;
        }
    }

    public MultiServerCluster(String clusterId, ClusterSettings settings, ClusterableServerFactory serverFactory, ClusterListener clusterListener) {
        super(clusterId, settings, serverFactory, clusterListener);
        Assertions.isTrue("connection mode is multiple", settings.getMode() == ClusterConnectionMode.Multiple);
        this.clusterType = settings.getRequiredClusterType();
        this.replicaSetName = settings.getRequiredReplicaSetName();
        LOGGER.info(String.format("Cluster created with settings %s", settings.getShortDescription()));
        synchronized (this) {
            for (ServerAddress serverAddress : settings.getHosts()) {
                addServer(serverAddress);
            }
            updateDescription();
        }
        fireChangeEvent();
    }

    @Override // com.mongodb.BaseCluster
    protected void connect() {
        for (ServerTuple cur : this.addressToServerTupleMap.values()) {
            cur.server.connect();
        }
    }

    @Override // com.mongodb.BaseCluster, com.mongodb.Cluster
    public void close() {
        if (!isClosed()) {
            synchronized (this) {
                for (ServerTuple serverTuple : this.addressToServerTupleMap.values()) {
                    serverTuple.server.close();
                }
            }
            super.close();
        }
    }

    @Override // com.mongodb.BaseCluster
    protected ClusterableServer getServer(ServerAddress serverAddress) {
        Assertions.isTrue("is open", !isClosed());
        ServerTuple serverTuple = this.addressToServerTupleMap.get(serverAddress);
        if (serverTuple != null) {
            return serverTuple.server;
        }
        return null;
    }

    /* loaded from: classes.dex */
    private final class DefaultServerStateListener implements ChangeListener<ServerDescription> {
        private DefaultServerStateListener() {
            MultiServerCluster.this = r1;
        }

        @Override // com.mongodb.ChangeListener
        public void stateChanged(ChangeEvent<ServerDescription> event) {
            MultiServerCluster.this.onChange(event);
        }
    }

    public void onChange(ChangeEvent<ServerDescription> event) {
        if (!isClosed()) {
            synchronized (this) {
                ServerDescription newDescription = event.getNewValue();
                ServerTuple serverTuple = this.addressToServerTupleMap.get(newDescription.getAddress());
                if (serverTuple != null) {
                    if (event.getNewValue().isOk()) {
                        if (this.clusterType == ClusterType.Unknown) {
                            this.clusterType = newDescription.getClusterType();
                            LOGGER.info(String.format("Discovered cluster type of %s", this.clusterType));
                        }
                        switch (this.clusterType) {
                            case ReplicaSet:
                                handleReplicaSetMemberChanged(newDescription);
                                break;
                            case Sharded:
                                handleShardRouterChanged(newDescription);
                                break;
                            case StandAlone:
                                handleStandAloneChanged(newDescription);
                                break;
                        }
                    }
                    serverTuple.description = newDescription;
                    updateDescription();
                    fireChangeEvent();
                }
            }
        }
    }

    private void handleReplicaSetMemberChanged(ServerDescription newDescription) {
        if (!newDescription.isReplicaSetMember()) {
            LOGGER.severe(String.format("Expecting replica set member, but found a %s.  Removing %s from client view of cluster.", newDescription.getType(), newDescription.getAddress()));
            removeServer(newDescription.getAddress());
        } else if (newDescription.getType() == ServerType.ReplicaSetGhost) {
            LOGGER.info(String.format("Server %s does not appear to be a member of an initiated replica set.", newDescription.getAddress()));
        } else {
            if (this.replicaSetName == null) {
                this.replicaSetName = newDescription.getSetName();
            }
            if (!this.replicaSetName.equals(newDescription.getSetName())) {
                LOGGER.severe(String.format("Expecting replica set member from set '%s', but found one from set '%s'.  Removing %s from client view of cluster.", this.replicaSetName, newDescription.getSetName(), newDescription.getAddress()));
                removeServer(newDescription.getAddress());
                return;
            }
            ensureServers(newDescription);
            if (newDescription.isPrimary()) {
                if (isNotAlreadyPrimary(newDescription.getAddress())) {
                    LOGGER.info(String.format("Discovered replica set primary %s", newDescription.getAddress()));
                }
                invalidateOldPrimaries(newDescription.getAddress());
            }
        }
    }

    private boolean isNotAlreadyPrimary(ServerAddress address) {
        ServerTuple serverTuple = this.addressToServerTupleMap.get(address);
        return serverTuple == null || !serverTuple.description.isPrimary();
    }

    private void handleShardRouterChanged(ServerDescription newDescription) {
        if (newDescription.getClusterType() != ClusterType.Sharded) {
            LOGGER.severe(String.format("Expecting a %s, but found a %s.  Removing %s from client view of cluster.", ServerType.ShardRouter, newDescription.getType(), newDescription.getAddress()));
            removeServer(newDescription.getAddress());
        }
    }

    private void handleStandAloneChanged(ServerDescription newDescription) {
        if (getSettings().getHosts().size() > 1) {
            LOGGER.severe(String.format("Expecting a single %s, but found more than one.  Removing %s from client view of cluster.", ServerType.StandAlone, newDescription.getAddress()));
            this.clusterType = ClusterType.Unknown;
            removeServer(newDescription.getAddress());
        }
    }

    private void addServer(ServerAddress serverAddress) {
        if (!this.addressToServerTupleMap.containsKey(serverAddress)) {
            LOGGER.info(String.format("Adding discovered server %s to client view of cluster", serverAddress));
            ClusterableServer server = createServer(serverAddress, new DefaultServerStateListener());
            this.addressToServerTupleMap.put(serverAddress, new ServerTuple(server, getConnectingServerDescription(serverAddress)));
        }
    }

    private void removeServer(ServerAddress serverAddress) {
        this.addressToServerTupleMap.remove(serverAddress).server.close();
    }

    private void invalidateOldPrimaries(ServerAddress newPrimary) {
        for (ServerTuple serverTuple : this.addressToServerTupleMap.values()) {
            if (!serverTuple.description.getAddress().equals(newPrimary) && serverTuple.description.isPrimary()) {
                LOGGER.info(String.format("Rediscovering type of existing primary %s", serverTuple.description.getAddress()));
                serverTuple.server.invalidate();
            }
        }
    }

    private ServerDescription getConnectingServerDescription(ServerAddress serverAddress) {
        return ServerDescription.builder().state(ServerConnectionState.Connecting).address(serverAddress).build();
    }

    private void updateDescription() {
        List<ServerDescription> newServerDescriptionList = getNewServerDescriptionList();
        updateDescription(new ClusterDescription(ClusterConnectionMode.Multiple, this.clusterType, newServerDescriptionList));
    }

    private List<ServerDescription> getNewServerDescriptionList() {
        List<ServerDescription> serverDescriptions = new ArrayList<>();
        for (ServerTuple cur : this.addressToServerTupleMap.values()) {
            serverDescriptions.add(cur.description);
        }
        return serverDescriptions;
    }

    private void ensureServers(ServerDescription description) {
        if (description.isPrimary() || !hasPrimary()) {
            addNewHosts(description.getHosts());
            addNewHosts(description.getPassives());
            addNewHosts(description.getArbiters());
        }
        if (description.isPrimary()) {
            removeExtraHosts(description);
        }
    }

    private boolean hasPrimary() {
        for (ServerTuple serverTuple : this.addressToServerTupleMap.values()) {
            if (serverTuple.description.isPrimary()) {
                return true;
            }
        }
        return false;
    }

    private void addNewHosts(Set<String> hosts) {
        for (String cur : hosts) {
            try {
                addServer(new ServerAddress(cur));
            } catch (UnknownHostException e) {
            }
        }
    }

    private void removeExtraHosts(ServerDescription serverDescription) {
        Set<ServerAddress> allServerAddresses = getAllServerAddresses(serverDescription);
        for (ServerTuple cur : this.addressToServerTupleMap.values()) {
            if (!allServerAddresses.contains(cur.description.getAddress())) {
                LOGGER.info(String.format("Server %s is no longer a member of the replica set.  Removing from client view of cluster.", cur.description.getAddress()));
                removeServer(cur.description.getAddress());
            }
        }
    }

    private Set<ServerAddress> getAllServerAddresses(ServerDescription serverDescription) {
        Set<ServerAddress> retVal = new HashSet<>();
        addHostsToSet(serverDescription.getHosts(), retVal);
        addHostsToSet(serverDescription.getPassives(), retVal);
        addHostsToSet(serverDescription.getArbiters(), retVal);
        return retVal;
    }

    private void addHostsToSet(Set<String> hosts, Set<ServerAddress> retVal) {
        for (String host : hosts) {
            try {
                retVal.add(new ServerAddress(host));
            } catch (UnknownHostException e) {
            }
        }
    }
}
