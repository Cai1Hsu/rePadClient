package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class MongoInterruptedException extends MongoException {
    private static final long serialVersionUID = -4110417867718417860L;

    public MongoInterruptedException(InterruptedException e) {
        super("A driver operation has been interrupted", e);
    }

    public MongoInterruptedException(String message, InterruptedException e) {
        super(message, e);
    }
}
