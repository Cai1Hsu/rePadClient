package com.mongodb;

/* loaded from: classes.dex */
public class MongoExecutionTimeoutException extends MongoException {
    private static final long serialVersionUID = 5955669123800274594L;

    MongoExecutionTimeoutException(int code, String errorMessage) {
        super(code, errorMessage);
    }
}
