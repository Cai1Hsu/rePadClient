package com.mongodb;

import org.bson.LazyBSONCallback;
import org.bson.io.BSONByteBuffer;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class LazyDBList extends org.bson.LazyDBList {
    public LazyDBList(byte[] data, LazyBSONCallback callback) {
        super(data, callback);
    }

    public LazyDBList(byte[] data, int offset, LazyBSONCallback callback) {
        super(data, offset, callback);
    }

    public LazyDBList(BSONByteBuffer buffer, LazyBSONCallback callback) {
        super(buffer, callback);
    }

    public LazyDBList(BSONByteBuffer buffer, int offset, LazyBSONCallback callback) {
        super(buffer, offset, callback);
    }
}
