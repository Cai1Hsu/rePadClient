package com.mongodb;

import java.util.concurrent.TimeUnit;
import org.bson.util.annotations.ThreadSafe;

@ThreadSafe
/* loaded from: classes.dex */
interface Server {
    Connection getConnection(long j, TimeUnit timeUnit);

    ServerDescription getDescription();

    void invalidate();
}
