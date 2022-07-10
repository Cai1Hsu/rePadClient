package com.mongodb;

import java.util.concurrent.TimeUnit;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
interface Cluster {
    void close();

    ClusterDescription getDescription(long j, TimeUnit timeUnit);

    Server getServer(ServerSelector serverSelector, long j, TimeUnit timeUnit);

    boolean isClosed();
}
