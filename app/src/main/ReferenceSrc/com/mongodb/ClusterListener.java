package com.mongodb;

import java.util.EventListener;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
interface ClusterListener extends EventListener {
    void clusterClosed(ClusterEvent clusterEvent);

    void clusterDescriptionChanged(ClusterDescriptionChangedEvent clusterDescriptionChangedEvent);

    void clusterOpened(ClusterEvent clusterEvent);
}
