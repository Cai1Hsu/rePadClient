package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
interface ConnectionFactory {
    Connection create(ServerAddress serverAddress, PooledConnectionProvider pooledConnectionProvider, int i);
}
