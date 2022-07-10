package com.mongodb;

import java.io.IOException;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class MongoSocketException extends MongoException {
    private static final long serialVersionUID = -4415279469780082174L;

    public MongoSocketException(String msg, IOException ioe) {
        super(-2, msg, ioe);
    }

    public MongoSocketException(IOException ioe) {
        super(ioe.toString(), ioe);
    }
}
