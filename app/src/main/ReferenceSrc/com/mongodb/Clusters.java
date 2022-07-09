package com.mongodb;

/* loaded from: classes.dex */
final class Clusters {
    private Clusters() {
    }

    public static Cluster create(String clusterId, ClusterSettings settings, ServerSettings serverSettings, ClusterListener clusterListener, Mongo mongo) {
        Cluster multiServerCluster;
        ClusterableServerFactory serverFactory = new DefaultClusterableServerFactory(clusterId, serverSettings, mongo);
        if (settings.getMode() == ClusterConnectionMode.Single) {
            if (clusterListener == null) {
                clusterListener = new NoOpClusterListener();
            }
            multiServerCluster = new SingleServerCluster(clusterId, settings, serverFactory, clusterListener);
        } else if (settings.getMode() == ClusterConnectionMode.Multiple) {
            if (clusterListener == null) {
                clusterListener = new NoOpClusterListener();
            }
            multiServerCluster = new MultiServerCluster(clusterId, settings, serverFactory, clusterListener);
        } else {
            throw new UnsupportedOperationException("Unsupported cluster mode: " + settings.getMode());
        }
        return multiServerCluster;
    }
}
