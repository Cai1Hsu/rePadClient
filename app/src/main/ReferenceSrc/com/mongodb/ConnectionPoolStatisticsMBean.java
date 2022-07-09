package com.mongodb;

/* loaded from: classes.dex */
public interface ConnectionPoolStatisticsMBean {
    int getCheckedOutCount();

    String getHost();

    int getMaxSize();

    int getMinSize();

    int getPort();

    int getSize();

    int getWaitQueueSize();
}
