package org.apache.commons.net.io;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes.jar:org/apache/commons/net/io/ToNetASCIIOutputStream.class */
public final class ToNetASCIIOutputStream extends FilterOutputStream {
    private boolean __lastWasCR = false;

    public ToNetASCIIOutputStream(OutputStream outputStream) {
        super(outputStream);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(int i) throws IOException {
        synchronized (this) {
            switch (i) {
                case 10:
                    if (!this.__lastWasCR) {
                        this.out.write(13);
                    }
                case 11:
                case 12:
                default:
                    this.__lastWasCR = false;
                    this.out.write(i);
                    break;
                case 13:
                    this.__lastWasCR = true;
                    this.out.write(13);
                    break;
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
            while (i2 > 0) {
                write(bArr[i]);
                i2--;
                i++;
            }
        }
    }
}
