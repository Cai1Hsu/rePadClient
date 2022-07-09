package org.bson;

import com.mongodb.LazyDBObject;
import java.util.List;
import java.util.logging.Logger;
import org.bson.types.ObjectId;

/* loaded from: classes.jar:org/bson/LazyBSONCallback.class */
public class LazyBSONCallback extends EmptyBSONCallback {
    private static final Logger log = Logger.getLogger("org.bson.LazyBSONCallback");
    private Object _root;

    public List createArray(byte[] bArr, int i) {
        return new LazyBSONList(bArr, i, this);
    }

    public Object createDBRef(String str, ObjectId objectId) {
        return new BasicBSONObject("$ns", str).append("$id", objectId);
    }

    public Object createObject(byte[] bArr, int i) {
        return new LazyDBObject(bArr, i, this);
    }

    @Override // org.bson.EmptyBSONCallback, org.bson.BSONCallback
    public Object get() {
        return this._root;
    }

    @Override // org.bson.EmptyBSONCallback, org.bson.BSONCallback
    public void gotBinary(String str, byte b, byte[] bArr) {
        setRootObject(createObject(bArr, 0));
    }

    @Override // org.bson.EmptyBSONCallback, org.bson.BSONCallback
    public Object objectDone() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.EmptyBSONCallback, org.bson.BSONCallback
    public void objectStart() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.EmptyBSONCallback, org.bson.BSONCallback
    public void objectStart(String str) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.EmptyBSONCallback, org.bson.BSONCallback
    public void objectStart(boolean z) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.EmptyBSONCallback, org.bson.BSONCallback
    public void reset() {
        this._root = null;
    }

    @Deprecated
    public void setRootObject(Object obj) {
        this._root = obj;
    }
}
