package com.mongodb;

import com.mongodb.DBPortPool;

/* loaded from: classes.dex */
public class MongoTimeoutException extends DBPortPool.NoMoreConnection {
    private static final long serialVersionUID = -3016560214331826577L;

    MongoTimeoutException(String msg) {
        super(msg);
    }
}
