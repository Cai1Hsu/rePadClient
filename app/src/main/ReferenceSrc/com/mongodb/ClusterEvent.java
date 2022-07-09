package com.mongodb;

/* loaded from: classes.dex */
class ClusterEvent {
    private final String clusterId;

    public ClusterEvent(String clusterId) {
        this.clusterId = clusterId;
    }

    public String getClusterId() {
        return this.clusterId;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ClusterEvent that = (ClusterEvent) o;
        return this.clusterId.equals(that.clusterId);
    }

    public int hashCode() {
        return this.clusterId.hashCode();
    }
}
