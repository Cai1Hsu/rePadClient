package com.mongodb;

import com.mongodb.DBPortPool;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class MongoTimeoutException extends DBPortPool.NoMoreConnection {
    private static final long serialVersionUID = -3016560214331826577L;

    public MongoTimeoutException(String msg) {
        super(msg);
    }
}
