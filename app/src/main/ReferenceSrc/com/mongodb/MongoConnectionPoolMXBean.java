package com.mongodb;

import com.mongodb.util.ConnectionPoolStatisticsBean;
@Deprecated
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface MongoConnectionPoolMXBean {
    String getHost();

    int getMaxSize();

    String getName();

    int getPort();

    ConnectionPoolStatisticsBean getStatistics();
}
