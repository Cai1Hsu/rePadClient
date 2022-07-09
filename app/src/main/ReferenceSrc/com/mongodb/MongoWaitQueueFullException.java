package com.mongodb;

import com.mongodb.DBPortPool;

/* loaded from: classes.dex */
public class MongoWaitQueueFullException extends DBPortPool.NoMoreConnection {
    private static final long serialVersionUID = 1482094507852255793L;

    MongoWaitQueueFullException(String msg) {
        super(msg);
    }
}
