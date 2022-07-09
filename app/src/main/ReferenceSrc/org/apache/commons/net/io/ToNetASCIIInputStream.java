package org.apache.commons.net.io;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.jar:org/apache/commons/net/io/ToNetASCIIInputStream.class */
public final class ToNetASCIIInputStream extends FilterInputStream {
    private static final int __LAST_WAS_CR = 1;
    private static final int __LAST_WAS_NL = 2;
    private static final int __NOTHING_SPECIAL = 0;
    private int __status = 0;

    public ToNetASCIIInputStream(InputStream inputStream) {
        super(inputStream);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int available() throws IOException {
        int available = this.in.available();
        int i = available;
        if (this.__status == 2) {
            i = available + 1;
        }
        return i;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public boolean markSupported() {
        return false;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        int read;
        if (this.__status != 2) {
            read = this.in.read();
            switch (read) {
                case 10:
                    if (this.__status != 1) {
                        this.__status = 2;
                        read = 13;
                        break;
                    }
                case 11:
                case 12:
                default:
                    this.__status = 0;
                    break;
                case 13:
                    this.__status = 1;
                    read = 13;
                    break;
            }
        } else {
            this.__status = 0;
            read = 10;
        }
        return read;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bArr) throws IOException {
        return read(bArr, 0, bArr.length);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int i3;
        if (i2 < 1) {
            i3 = 0;
        } else {
            int available = available();
            int i4 = i2;
            if (i2 > available) {
                i4 = available;
            }
            int i5 = i4;
            if (i4 < 1) {
                i5 = 1;
            }
            int read = read();
            i3 = -1;
            if (read != -1) {
                int i6 = i5;
                int i7 = i;
                int i8 = read;
                do {
                    int i9 = i7;
                    i7 = i9 + 1;
                    bArr[i9] = (byte) i8;
                    i6--;
                    if (i6 <= 0) {
                        break;
                    }
                    i8 = read();
                } while (i8 != -1);
                i3 = i7 - i;
            }
        }
        return i3;
    }
}
