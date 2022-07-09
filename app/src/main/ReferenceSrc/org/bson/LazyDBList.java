package org.bson;

import com.mongodb.DBObject;
import com.mongodb.util.JSON;
import org.bson.io.BSONByteBuffer;

@Deprecated
/* loaded from: classes.jar:org/bson/LazyDBList.class */
public class LazyDBList extends LazyBSONList implements DBObject {
    private static final long serialVersionUID = -4415279469780082174L;
    private boolean _isPartialObject;

    public LazyDBList(BSONByteBuffer bSONByteBuffer, int i, LazyBSONCallback lazyBSONCallback) {
        super(bSONByteBuffer, i, lazyBSONCallback);
    }

    public LazyDBList(BSONByteBuffer bSONByteBuffer, LazyBSONCallback lazyBSONCallback) {
        super(bSONByteBuffer, lazyBSONCallback);
    }

    public LazyDBList(byte[] bArr, int i, LazyBSONCallback lazyBSONCallback) {
        super(bArr, i, lazyBSONCallback);
    }

    public LazyDBList(byte[] bArr, LazyBSONCallback lazyBSONCallback) {
        super(bArr, lazyBSONCallback);
    }

    @Override // com.mongodb.DBObject
    public boolean isPartialObject() {
        return this._isPartialObject;
    }

    @Override // com.mongodb.DBObject
    public void markAsPartialObject() {
        this._isPartialObject = true;
    }

    @Override // org.bson.LazyBSONObject
    public String toString() {
        return JSON.serialize(this);
    }
}
