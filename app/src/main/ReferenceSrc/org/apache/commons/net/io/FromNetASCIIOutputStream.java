package org.apache.commons.net.io;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes.jar:org/apache/commons/net/io/FromNetASCIIOutputStream.class */
public final class FromNetASCIIOutputStream extends FilterOutputStream {
    private boolean __lastWasCR = false;

    public FromNetASCIIOutputStream(OutputStream outputStream) {
        super(outputStream);
    }

    private void __write(int i) throws IOException {
        switch (i) {
            case 10:
                if (this.__lastWasCR) {
                    this.out.write(FromNetASCIIInputStream._lineSeparatorBytes);
                    this.__lastWasCR = false;
                    return;
                }
                this.__lastWasCR = false;
                this.out.write(10);
                return;
            case 11:
            case 12:
            default:
                if (this.__lastWasCR) {
                    this.out.write(13);
                    this.__lastWasCR = false;
                }
                this.out.write(i);
                return;
            case 13:
                this.__lastWasCR = true;
                return;
        }
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        synchronized (this) {
            if (FromNetASCIIInputStream._noConversionRequired) {
                super.close();
            } else {
                if (this.__lastWasCR) {
                    this.out.write(13);
                }
                super.close();
            }
        }
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(int i) throws IOException {
        synchronized (this) {
            if (FromNetASCIIInputStream._noConversionRequired) {
                this.out.write(i);
            } else {
                __write(i);
            }
        }
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] bArr) throws IOException {
        synchronized (this) {
            write(bArr, 0, bArr.length);
        }
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) throws IOException {
        synchronized (this) {
            if (FromNetASCIIInputStream._noConversionRequired) {
                this.out.write(bArr, i, i2);
            } else {
                int i3 = i;
                int i4 = i2;
                while (i4 > 0) {
                    __write(bArr[i3]);
                    i4--;
                    i3++;
                }
            }
        }
    }
}
