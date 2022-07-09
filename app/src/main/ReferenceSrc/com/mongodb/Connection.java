package com.mongodb;

/* loaded from: classes.dex */
interface Connection {
    void close();

    int getGeneration();

    long getLastUsedAt();

    long getOpenedAt();

    boolean isClosed();
}
