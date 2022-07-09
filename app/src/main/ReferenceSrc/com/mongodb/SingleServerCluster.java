package com.mongodb;

import java.util.Arrays;
import java.util.Collections;
import java.util.logging.Logger;
import org.bson.util.Assertions;

/* loaded from: classes.dex */
final class SingleServerCluster extends BaseCluster {
    private static final Logger LOGGER = Loggers.getLogger("cluster");
    private final ClusterableServer server;

    public SingleServerCluster(String clusterId, ClusterSettings settings, ClusterableServerFactory serverFactory, ClusterListener clusterListener) {
        super(clusterId, settings, serverFactory, clusterListener);
        Assertions.isTrue("one server in a direct cluster", settings.getHosts().size() == 1);
        Assertions.isTrue("connection mode is single", settings.getMode() == ClusterConnectionMode.Single);
        LOGGER.info(String.format("Cluster created with settings %s", settings.getShortDescription()));
        synchronized (this) {
            this.server = createServer(settings.getHosts().get(0), new ChangeListener<ServerDescription>() { // from class: com.mongodb.SingleServerCluster.1
                @Override // com.mongodb.ChangeListener
                public void stateChanged(ChangeEvent<ServerDescription> event) {
                    ServerDescription descriptionToPublish = event.getNewValue();
                    if (event.getNewValue().isOk()) {
                        if (SingleServerCluster.this.getSettings().getRequiredClusterType() != ClusterType.Unknown && SingleServerCluster.this.getSettings().getRequiredClusterType() != event.getNewValue().getClusterType()) {
                            descriptionToPublish = null;
                        } else if (SingleServerCluster.this.getSettings().getRequiredClusterType() == ClusterType.ReplicaSet && SingleServerCluster.this.getSettings().getRequiredReplicaSetName() != null && !SingleServerCluster.this.getSettings().getRequiredReplicaSetName().equals(event.getNewValue().getSetName())) {
                            descriptionToPublish = null;
                        }
                    }
                    SingleServerCluster.this.publishDescription(descriptionToPublish);
                }
            });
            publishDescription(this.server.getDescription());
        }
    }

    @Override // com.mongodb.BaseCluster
    protected void connect() {
        this.server.connect();
    }

    public void publishDescription(ServerDescription serverDescription) {
        ClusterType clusterType = getSettings().getRequiredClusterType();
        if (clusterType == ClusterType.Unknown && serverDescription != null) {
            clusterType = serverDescription.getClusterType();
        }
        ClusterDescription description = new ClusterDescription(ClusterConnectionMode.Single, clusterType, serverDescription == null ? Collections.emptyList() : Arrays.asList(serverDescription));
        updateDescription(description);
        fireChangeEvent();
    }

    @Override // com.mongodb.BaseCluster
    protected ClusterableServer getServer(ServerAddress serverAddress) {
        Assertions.isTrue("open", !isClosed());
        return this.server;
    }

    @Override // com.mongodb.BaseCluster, com.mongodb.Cluster
    public void close() {
        if (!isClosed()) {
            this.server.close();
            super.close();
        }
    }
}
