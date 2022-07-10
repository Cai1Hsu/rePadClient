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
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class MultiServerCluster extends BaseCluster {
    private static final Logger LOGGER = Loggers.getLogger("cluster");
    private final ConcurrentMap<ServerAddress, ServerTuple> addressToServerTupleMap = new ConcurrentHashMap();
    private ClusterType clusterType;
    private String replicaSetName;

    static /* synthetic */ void access$100(MultiServerCluster x0, ChangeEvent x1) {
        x0.onChange(x1);
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private static final class ServerTuple {
        private ServerDescription description;
        private final ClusterableServer server;

        /* synthetic */ ServerTuple(ClusterableServer x0, ServerDescription x1, AnonymousClass1 x2) {
            this(x0, x1);
        }

        static /* synthetic */ ClusterableServer access$000(ServerTuple x0) {
            return x0.server;
        }

        static /* synthetic */ ServerDescription access$200(ServerTuple x0) {
            return x0.description;
        }

        static /* synthetic */ ServerDescription access$202(ServerTuple x0, ServerDescription x1) {
            x0.description = x1;
            return x1;
        }

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
            ServerTuple.access$000(cur).connect();
        }
    }

    @Override // com.mongodb.BaseCluster, com.mongodb.Cluster
    public void close() {
        if (!isClosed()) {
            synchronized (this) {
                for (ServerTuple serverTuple : this.addressToServerTupleMap.values()) {
                    ServerTuple.access$000(serverTuple).close();
                }
            }
            super.close();
        }
    }

    @Override // com.mongodb.BaseCluster
    protected ClusterableServer getServer(ServerAddress serverAddress) {
        Assertions.isTrue("is open", !isClosed());
        ServerTuple serverTuple = this.addressToServerTupleMap.get(serverAddress);
        if (serverTuple == null) {
            return null;
        }
        return ServerTuple.access$000(serverTuple);
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private final class DefaultServerStateListener implements ChangeListener<ServerDescription> {
        private DefaultServerStateListener() {
            MultiServerCluster.this = r1;
        }

        /* synthetic */ DefaultServerStateListener(MultiServerCluster x0, AnonymousClass1 x1) {
            this();
        }

        @Override // com.mongodb.ChangeListener
        public void stateChanged(ChangeEvent<ServerDescription> event) {
            MultiServerCluster.access$100(MultiServerCluster.this, event);
        }
    }

    private void onChange(ChangeEvent<ServerDescription> event) {
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
                    ServerTuple.access$202(serverTuple, newDescription);
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
        return serverTuple == null || !ServerTuple.access$200(serverTuple).isPrimary();
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
            ClusterableServer server = createServer(serverAddress, new DefaultServerStateListener(this, null));
            this.addressToServerTupleMap.put(serverAddress, new ServerTuple(server, getConnectingServerDescription(serverAddress), null));
        }
    }

    private void removeServer(ServerAddress serverAddress) {
        ServerTuple.access$000(this.addressToServerTupleMap.remove(serverAddress)).close();
    }

    private void invalidateOldPrimaries(ServerAddress newPrimary) {
        for (ServerTuple serverTuple : this.addressToServerTupleMap.values()) {
            if (!ServerTuple.access$200(serverTuple).getAddress().equals(newPrimary) && ServerTuple.access$200(serverTuple).isPrimary()) {
                LOGGER.info(String.format("Rediscovering type of existing primary %s", ServerTuple.access$200(serverTuple).getAddress()));
                ServerTuple.access$000(serverTuple).invalidate();
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
            serverDescriptions.add(ServerTuple.access$200(cur));
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
            if (ServerTuple.access$200(serverTuple).isPrimary()) {
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
            if (!allServerAddresses.contains(ServerTuple.access$200(cur).getAddress())) {
                LOGGER.info(String.format("Server %s is no longer a member of the replica set.  Removing from client view of cluster.", ServerTuple.access$200(cur).getAddress()));
                removeServer(ServerTuple.access$200(cur).getAddress());
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
