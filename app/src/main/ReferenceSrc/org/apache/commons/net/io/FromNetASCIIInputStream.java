package org.apache.commons.net.io;

import java.io.IOException;
import java.io.InputStream;
import java.io.PushbackInputStream;

/* loaded from: classes.jar:org/apache/commons/net/io/FromNetASCIIInputStream.class */
public final class FromNetASCIIInputStream extends PushbackInputStream {
    private int __length = 0;
    static final String _lineSeparator = System.getProperty("line.separator");
    static final boolean _noConversionRequired = _lineSeparator.equals("\r\n");
    static final byte[] _lineSeparatorBytes = _lineSeparator.getBytes();

    public FromNetASCIIInputStream(InputStream inputStream) {
        super(inputStream, _lineSeparatorBytes.length + 1);
    }

    private int __read() throws IOException {
        int read = super.read();
        int i = read;
        if (read == 13) {
            int read2 = super.read();
            if (read2 == 10) {
                unread(_lineSeparatorBytes);
                i = super.read();
                this.__length--;
            } else {
                i = 13;
                if (read2 != -1) {
                    unread(read2);
                    i = 13;
                }
            }
        }
        return i;
    }

    public static final boolean isConversionRequired() {
        return !_noConversionRequired;
    }

    @Override // java.io.PushbackInputStream, java.io.FilterInputStream, java.io.InputStream
    public int available() throws IOException {
        if (this.in == null) {
            throw new IOException("Stream closed");
        }
        return (this.buf.length - this.pos) + this.in.available();
    }

    @Override // java.io.PushbackInputStream, java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        return _noConversionRequired ? super.read() : __read();
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bArr) throws IOException {
        return read(bArr, 0, bArr.length);
    }

    @Override // java.io.PushbackInputStream, java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int i3;
        if (_noConversionRequired) {
            i3 = super.read(bArr, i, i2);
        } else if (i2 < 1) {
            i3 = 0;
        } else {
            int available = available();
            if (i2 > available) {
                i2 = available;
            }
            this.__length = i2;
            if (this.__length < 1) {
                this.__length = 1;
            }
            int __read = __read();
            i3 = -1;
            if (__read != -1) {
                int i4 = i;
                int i5 = __read;
                do {
                    int i6 = i4;
                    i4 = i6 + 1;
                    bArr[i6] = (byte) i5;
                    int i7 = this.__length - 1;
                    this.__length = i7;
                    if (i7 <= 0) {
                        break;
                    }
                    i5 = __read();
                } while (i5 != -1);
                i3 = i4 - i;
            }
        }
        return i3;
    }
}
