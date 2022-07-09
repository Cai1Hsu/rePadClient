package com.mongodb;

/* loaded from: classes.dex */
interface ClusterableServerFactory {
    ClusterableServer create(ServerAddress serverAddress);

    ServerSettings getSettings();
}
