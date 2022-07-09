package com.mongodb;

/* loaded from: classes.dex */
interface ConnectionFactory {
    Connection create(ServerAddress serverAddress, PooledConnectionProvider pooledConnectionProvider, int i);
}
