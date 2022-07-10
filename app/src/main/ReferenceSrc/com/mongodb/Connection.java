package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
interface Connection {
    void close();

    int getGeneration();

    long getLastUsedAt();

    long getOpenedAt();

    boolean isClosed();
}
