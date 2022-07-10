package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
abstract class WriteRequest {

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    enum Type {
        INSERT,
        UPDATE,
        REPLACE,
        REMOVE
    }

    public abstract Type getType();
}
