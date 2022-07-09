package com.mongodb;

import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
interface Cluster {
    void close();

    ClusterDescription getDescription(long j, TimeUnit timeUnit);

    Server getServer(ServerSelector serverSelector, long j, TimeUnit timeUnit);

    boolean isClosed();
}
