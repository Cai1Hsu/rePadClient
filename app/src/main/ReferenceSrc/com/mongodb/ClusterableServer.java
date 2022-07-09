package com.mongodb;

/* loaded from: classes.dex */
interface ClusterableServer extends Server {
    void addChangeListener(ChangeListener<ServerDescription> changeListener);

    void close();

    void connect();

    @Override // com.mongodb.Server
    void invalidate();

    boolean isClosed();
}
