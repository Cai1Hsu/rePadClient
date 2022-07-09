package org.bson;

import org.bson.types.ObjectId;

/* loaded from: classes.jar:org/bson/EmptyBSONCallback.class */
public class EmptyBSONCallback implements BSONCallback {
    @Override // org.bson.BSONCallback
    public Object arrayDone() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void arrayStart() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void arrayStart(String str) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public BSONCallback createBSONCallback() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public Object get() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotBinary(String str, byte b, byte[] bArr) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    @Deprecated
    public void gotBinaryArray(String str, byte[] bArr) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotBoolean(String str, boolean z) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotCode(String str, String str2) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotCodeWScope(String str, String str2, Object obj) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotDBRef(String str, String str2, ObjectId objectId) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotDate(String str, long j) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotDouble(String str, double d) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotInt(String str, int i) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotLong(String str, long j) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotMaxKey(String str) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotMinKey(String str) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotNull(String str) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotObjectId(String str, ObjectId objectId) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotRegex(String str, String str2, String str3) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotString(String str, String str2) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotSymbol(String str, String str2) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotTimestamp(String str, int i, int i2) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotUUID(String str, long j, long j2) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void gotUndefined(String str) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public Object objectDone() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void objectStart() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void objectStart(String str) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void objectStart(boolean z) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override // org.bson.BSONCallback
    public void reset() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
