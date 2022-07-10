package com.mongodb;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class LatencyMinimizingServerSelector implements ServerSelector {
    private final long acceptableLatencyDifferenceNanos;

    public LatencyMinimizingServerSelector(long acceptableLatencyDifference, TimeUnit timeUnit) {
        this.acceptableLatencyDifferenceNanos = TimeUnit.NANOSECONDS.convert(acceptableLatencyDifference, timeUnit);
    }

    @Override // com.mongodb.ServerSelector
    public List<ServerDescription> choose(ClusterDescription clusterDescription) {
        return getServersWithAcceptableLatencyDifference(clusterDescription.getAll(), getBestLatencyNanos(clusterDescription.getAll()));
    }

    public String toString() {
        return "LatencyMinimizingServerSelector{acceptableLatencyDifference=" + TimeUnit.MILLISECONDS.convert(this.acceptableLatencyDifferenceNanos, TimeUnit.NANOSECONDS) + " ms}";
    }

    private long getBestLatencyNanos(Set<ServerDescription> members) {
        long bestPingTime = Long.MAX_VALUE;
        for (ServerDescription cur : members) {
            if (cur.isOk() && cur.getAverageLatencyNanos() < bestPingTime) {
                bestPingTime = cur.getAverageLatencyNanos();
            }
        }
        return bestPingTime;
    }

    private List<ServerDescription> getServersWithAcceptableLatencyDifference(Set<ServerDescription> servers, long bestPingTime) {
        List<ServerDescription> goodSecondaries = new ArrayList<>(servers.size());
        for (ServerDescription cur : servers) {
            if (cur.isOk() && cur.getAverageLatencyNanos() - this.acceptableLatencyDifferenceNanos <= bestPingTime) {
                goodSecondaries.add(cur);
            }
        }
        return goodSecondaries;
    }
}
