package com.mongodb;

import java.util.EventListener;

/* loaded from: classes.dex */
interface ClusterListener extends EventListener {
    void clusterClosed(ClusterEvent clusterEvent);

    void clusterDescriptionChanged(ClusterDescriptionChangedEvent clusterDescriptionChangedEvent);

    void clusterOpened(ClusterEvent clusterEvent);
}
