package com.mongodb;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
class CompositeServerSelector implements ServerSelector {
    private final List<ServerSelector> serverSelectors;

    CompositeServerSelector(List<ServerSelector> serverSelectors) {
        if (serverSelectors.isEmpty()) {
            throw new IllegalArgumentException("Server selectors can not be an empty list");
        }
        this.serverSelectors = new ArrayList(serverSelectors);
    }

    @Override // com.mongodb.ServerSelector
    public List<ServerDescription> choose(ClusterDescription clusterDescription) {
        ClusterDescription curClusterDescription = clusterDescription;
        List<ServerDescription> choices = null;
        for (ServerSelector cur : this.serverSelectors) {
            choices = cur.choose(curClusterDescription);
            curClusterDescription = new ClusterDescription(clusterDescription.getConnectionMode(), clusterDescription.getType(), choices);
        }
        return choices;
    }

    public String toString() {
        return "{serverSelectors=" + this.serverSelectors + '}';
    }
}
