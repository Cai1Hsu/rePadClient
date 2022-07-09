package com.mongodb;

/* loaded from: classes.dex */
abstract class WriteRequest {

    /* loaded from: classes.dex */
    enum Type {
        INSERT,
        UPDATE,
        REPLACE,
        REMOVE
    }

    public abstract Type getType();

    WriteRequest() {
    }
}
