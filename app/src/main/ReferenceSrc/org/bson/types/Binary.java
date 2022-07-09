package org.bson.types;

import java.io.Serializable;
import java.util.Arrays;

/* loaded from: classes.jar:org/bson/types/Binary.class */
public class Binary implements Serializable {
    private static final long serialVersionUID = 7902997490338209467L;
    final byte[] _data;
    final byte _type;

    public Binary(byte b, byte[] bArr) {
        this._type = b;
        this._data = bArr;
    }

    public Binary(byte[] bArr) {
        this((byte) 0, bArr);
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this != obj) {
            if (!(obj instanceof Binary)) {
                z = false;
            } else {
                Binary binary = (Binary) obj;
                if (this._type != binary._type) {
                    z = false;
                } else if (!Arrays.equals(this._data, binary._data)) {
                    z = false;
                }
            }
        }
        return z;
    }

    public byte[] getData() {
        return this._data;
    }

    public byte getType() {
        return this._type;
    }

    public int hashCode() {
        return (this._type * 31) + (this._data != null ? Arrays.hashCode(this._data) : 0);
    }

    public int length() {
        return this._data.length;
    }
}
