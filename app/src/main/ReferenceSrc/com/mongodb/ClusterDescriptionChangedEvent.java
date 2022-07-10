package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class ClusterDescriptionChangedEvent extends ClusterEvent {
    private final ClusterDescription clusterDescription;

    public ClusterDescriptionChangedEvent(String clusterId, ClusterDescription clusterDescription) {
        super(clusterId);
        this.clusterDescription = clusterDescription;
    }

    public ClusterDescription getClusterDescription() {
        return this.clusterDescription;
    }

    @Override // com.mongodb.ClusterEvent
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ClusterDescriptionChangedEvent that = (ClusterDescriptionChangedEvent) o;
        return getClusterId().equals(that.getClusterId()) && this.clusterDescription.equals(that.clusterDescription);
    }

    @Override // com.mongodb.ClusterEvent
    public int hashCode() {
        return this.clusterDescription.hashCode();
    }
}
