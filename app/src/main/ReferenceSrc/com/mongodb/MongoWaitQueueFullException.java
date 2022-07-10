package com.mongodb;

import com.mongodb.DBPortPool;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class MongoWaitQueueFullException extends DBPortPool.NoMoreConnection {
    private static final long serialVersionUID = 1482094507852255793L;

    public MongoWaitQueueFullException(String msg) {
        super(msg);
    }
}
