package com.mongodb;

import java.util.List;

/* loaded from: classes.dex */
public class ReplicaSetStatus {
    private final ClusterDescription clusterDescription;

    ReplicaSetStatus(ClusterDescription clusterDescription) {
        this.clusterDescription = clusterDescription;
    }

    public String getName() {
        List<ServerDescription> any = this.clusterDescription.getAnyPrimaryOrSecondary();
        if (any.isEmpty()) {
            return null;
        }
        return any.get(0).getSetName();
    }

    public ServerAddress getMaster() {
        List<ServerDescription> primaries = this.clusterDescription.getPrimaries();
        if (primaries.isEmpty()) {
            return null;
        }
        return primaries.get(0).getAddress();
    }

    public boolean isMaster(ServerAddress serverAddress) {
        return getMaster().equals(serverAddress);
    }

    public int getMaxBsonObjectSize() {
        List<ServerDescription> primaries = this.clusterDescription.getPrimaries();
        return primaries.isEmpty() ? ServerDescription.getDefaultMaxDocumentSize() : primaries.get(0).getMaxDocumentSize();
    }

    public String toString() {
        return "ReplicaSetStatus{name=" + getName() + ", cluster=" + this.clusterDescription + '}';
    }
}
