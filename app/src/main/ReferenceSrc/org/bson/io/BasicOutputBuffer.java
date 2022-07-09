package org.bson.io;

import java.io.DataOutput;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

/* loaded from: classes.jar:org/bson/io/BasicOutputBuffer.class */
public class BasicOutputBuffer extends OutputBuffer {
    private byte[] _buffer = new byte[512];
    private int _cur;
    private int _size;

    void _ensure(int i) {
        int i2 = this._cur + i;
        if (i2 < this._buffer.length) {
            return;
        }
        int length = this._buffer.length * 2;
        int i3 = length;
        if (length <= i2) {
            i3 = i2 + 128;
        }
        byte[] bArr = new byte[i3];
        System.arraycopy(this._buffer, 0, bArr, 0, this._size);
        this._buffer = bArr;
    }

    @Override // org.bson.io.OutputBuffer
    @Deprecated
    public String asString() {
        return new String(this._buffer, 0, this._size);
    }

    @Override // org.bson.io.OutputBuffer
    @Deprecated
    public String asString(String str) throws UnsupportedEncodingException {
        return new String(this._buffer, 0, this._size, str);
    }

    @Override // org.bson.io.OutputBuffer
    public int getPosition() {
        return this._cur;
    }

    @Deprecated
    public int pipe(DataOutput dataOutput) throws IOException {
        dataOutput.write(this._buffer, 0, this._size);
        return this._size;
    }

    @Override // org.bson.io.OutputBuffer
    public int pipe(OutputStream outputStream) throws IOException {
        outputStream.write(this._buffer, 0, this._size);
        return this._size;
    }

    @Override // org.bson.io.OutputBuffer
    @Deprecated
    public void seekEnd() {
        this._cur = this._size;
    }

    @Override // org.bson.io.OutputBuffer
    @Deprecated
    public void seekStart() {
        this._cur = 0;
    }

    @Override // org.bson.io.OutputBuffer
    @Deprecated
    public void setPosition(int i) {
        this._cur = i;
    }

    @Override // org.bson.io.OutputBuffer
    public int size() {
        return this._size;
    }

    @Override // org.bson.io.OutputBuffer, java.io.OutputStream
    public void write(int i) {
        _ensure(1);
        byte[] bArr = this._buffer;
        int i2 = this._cur;
        this._cur = i2 + 1;
        bArr[i2] = (byte) (i & 255);
        this._size = Math.max(this._cur, this._size);
    }

    @Override // org.bson.io.OutputBuffer, java.io.OutputStream
    public void write(byte[] bArr) {
        write(bArr, 0, bArr.length);
    }

    @Override // org.bson.io.OutputBuffer, java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) {
        _ensure(i2);
        System.arraycopy(bArr, i, this._buffer, this._cur, i2);
        this._cur += i2;
        this._size = Math.max(this._cur, this._size);
    }
}
