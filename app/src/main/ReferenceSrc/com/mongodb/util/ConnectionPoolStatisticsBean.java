package com.mongodb.util;

import com.mongodb.InUseConnectionBean;
@Deprecated
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class ConnectionPoolStatisticsBean {
    private final int inUse;
    private final InUseConnectionBean[] inUseConnections;
    private final int total;

    public ConnectionPoolStatisticsBean(int total, int inUse, InUseConnectionBean[] inUseConnections) {
        this.total = total;
        this.inUse = inUse;
        this.inUseConnections = inUseConnections;
    }

    public int getTotal() {
        return this.total;
    }

    public int getInUse() {
        return this.inUse;
    }

    public InUseConnectionBean[] getInUseConnections() {
        return this.inUseConnections;
    }
}
