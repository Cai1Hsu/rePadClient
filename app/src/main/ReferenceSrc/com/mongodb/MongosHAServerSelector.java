package com.mongodb;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class MongosHAServerSelector implements ServerSelector {
    private Set<ServerAddress> consideredServers = new HashSet();
    private ServerAddress stickTo;

    @Override // com.mongodb.ServerSelector
    public List<ServerDescription> choose(ClusterDescription clusterDescription) {
        List<ServerDescription> emptyList;
        if (clusterDescription.getConnectionMode() != ClusterConnectionMode.Multiple || clusterDescription.getType() != ClusterType.Sharded) {
            throw new IllegalArgumentException("This is not a sharded cluster with multiple mongos servers");
        }
        Set<ServerAddress> okServers = getOkServers(clusterDescription);
        synchronized (this) {
            if (!this.consideredServers.containsAll(okServers) || !okServers.contains(this.stickTo)) {
                if (this.stickTo != null && !okServers.contains(this.stickTo)) {
                    this.stickTo = null;
                    this.consideredServers.clear();
                }
                ServerDescription fastestServer = null;
                for (ServerDescription cur : clusterDescription.getAny()) {
                    if (fastestServer == null || cur.getAverageLatencyNanos() < fastestServer.getAverageLatencyNanos()) {
                        fastestServer = cur;
                    }
                }
                if (fastestServer != null) {
                    this.stickTo = fastestServer.getAddress();
                    this.consideredServers.addAll(okServers);
                }
            }
            emptyList = this.stickTo == null ? Collections.emptyList() : Arrays.asList(clusterDescription.getByServerAddress(this.stickTo));
        }
        return emptyList;
    }

    public String toString() {
        return "MongosHAServerSelector{" + (this.stickTo == null ? "" : "stickTo=" + this.stickTo) + '}';
    }

    private Set<ServerAddress> getOkServers(ClusterDescription clusterDescription) {
        Set<ServerAddress> okServers = new HashSet<>();
        for (ServerDescription cur : clusterDescription.getAny()) {
            okServers.add(cur.getAddress());
        }
        return okServers;
    }
}
