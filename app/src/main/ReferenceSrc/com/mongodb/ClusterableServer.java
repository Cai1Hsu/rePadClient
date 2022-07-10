package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
interface ClusterableServer extends Server {
    void addChangeListener(ChangeListener<ServerDescription> changeListener);

    void close();

    void connect();

    @Override // com.mongodb.Server
    void invalidate();

    boolean isClosed();
}
