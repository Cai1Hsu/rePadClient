package com.mongodb;

import java.util.List;

/* loaded from: classes.dex */
class AnyServerSelector implements ServerSelector {
    AnyServerSelector() {
    }

    @Override // com.mongodb.ServerSelector
    public List<ServerDescription> choose(ClusterDescription clusterDescription) {
        return clusterDescription.getAny();
    }

    public String toString() {
        return "AnyServerSelector{}";
    }
}
