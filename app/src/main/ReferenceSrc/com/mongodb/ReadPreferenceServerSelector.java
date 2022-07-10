package com.mongodb;

import java.util.List;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class ReadPreferenceServerSelector implements ServerSelector {
    private final ReadPreference readPreference;

    public ReadPreferenceServerSelector(ReadPreference readPreference) {
        this.readPreference = readPreference;
    }

    public ReadPreference getReadPreference() {
        return this.readPreference;
    }

    @Override // com.mongodb.ServerSelector
    public List<ServerDescription> choose(ClusterDescription clusterDescription) {
        return this.readPreference.choose(clusterDescription);
    }

    public String toString() {
        return "ReadPreferenceServerSelector{readPreference=" + this.readPreference + '}';
    }
}
