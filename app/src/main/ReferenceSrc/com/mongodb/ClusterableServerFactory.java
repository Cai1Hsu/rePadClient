package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
interface ClusterableServerFactory {
    ClusterableServer create(ServerAddress serverAddress);

    ServerSettings getSettings();
}
