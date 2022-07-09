package org.bson.io;

import java.io.UnsupportedEncodingException;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import org.bson.BSONException;

/* loaded from: classes.jar:org/bson/io/BSONByteBuffer.class */
public class BSONByteBuffer {
    protected ByteBuffer buf;

    private BSONByteBuffer(ByteBuffer byteBuffer) {
        this.buf = byteBuffer;
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN);
    }

    public static BSONByteBuffer wrap(byte[] bArr) {
        return new BSONByteBuffer(ByteBuffer.wrap(bArr));
    }

    public static BSONByteBuffer wrap(byte[] bArr, int i, int i2) {
        return new BSONByteBuffer(ByteBuffer.wrap(bArr, i, i2));
    }

    public byte[] array() {
        return this.buf.array();
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this != obj) {
            if (obj == null || getClass() != obj.getClass()) {
                z = false;
            } else {
                BSONByteBuffer bSONByteBuffer = (BSONByteBuffer) obj;
                if (this.buf == null ? bSONByteBuffer.buf != null : !this.buf.equals(bSONByteBuffer.buf)) {
                    z = false;
                }
            }
        }
        return z;
    }

    public byte get(int i) {
        return this.buf.get(i);
    }

    public ByteBuffer get(byte[] bArr) {
        return this.buf.get(bArr);
    }

    public ByteBuffer get(byte[] bArr, int i, int i2) {
        return this.buf.get(bArr, i, i2);
    }

    public String getCString(int i) {
        int i2 = i;
        while (get(i2) != 0) {
            i2++;
        }
        return new String(array(), i, i2 - i);
    }

    public int getInt(int i) {
        return getIntLE(i);
    }

    public int getIntBE(int i) {
        return 0 | ((this.buf.get(i + 0) & 255) << 24) | ((this.buf.get(i + 1) & 255) << 16) | ((this.buf.get(i + 2) & 255) << 8) | ((this.buf.get(i + 3) & 255) << 0);
    }

    public int getIntLE(int i) {
        return 0 | ((this.buf.get(i + 0) & 255) << 0) | ((this.buf.get(i + 1) & 255) << 8) | ((this.buf.get(i + 2) & 255) << 16) | ((this.buf.get(i + 3) & 255) << 24);
    }

    public long getLong(int i) {
        return this.buf.getLong(i);
    }

    public String getUTF8String(int i) {
        try {
            return new String(array(), i + 4, getInt(i) - 1, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new BSONException("Cannot decode string as UTF-8.");
        }
    }

    public int hashCode() {
        return this.buf.hashCode();
    }

    public Buffer position(int i) {
        return this.buf.position(i);
    }

    public Buffer reset() {
        return this.buf.reset();
    }

    public int size() {
        return getInt(0);
    }

    public String toString() {
        return this.buf.toString();
    }
}
