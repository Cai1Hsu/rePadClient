package com.mongodb;

import java.util.List;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class AnyServerSelector implements ServerSelector {
    @Override // com.mongodb.ServerSelector
    public List<ServerDescription> choose(ClusterDescription clusterDescription) {
        return clusterDescription.getAny();
    }

    public String toString() {
        return "AnyServerSelector{}";
    }
}
