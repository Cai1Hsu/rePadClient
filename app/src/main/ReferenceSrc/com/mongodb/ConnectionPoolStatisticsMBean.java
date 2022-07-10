package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface ConnectionPoolStatisticsMBean {
    int getCheckedOutCount();

    String getHost();

    int getMaxSize();

    int getMinSize();

    int getPort();

    int getSize();

    int getWaitQueueSize();
}
