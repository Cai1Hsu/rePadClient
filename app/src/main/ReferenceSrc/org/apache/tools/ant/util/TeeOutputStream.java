package org.apache.tools.ant.util;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/util/TeeOutputStream.class */
public class TeeOutputStream extends OutputStream {
    private OutputStream left;
    private OutputStream right;

    public TeeOutputStream(OutputStream outputStream, OutputStream outputStream2) {
        this.left = outputStream;
        this.right = outputStream2;
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        try {
            this.left.close();
        } finally {
            this.right.close();
        }
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        this.left.flush();
        this.right.flush();
    }

    @Override // java.io.OutputStream
    public void write(int i) throws IOException {
        this.left.write(i);
        this.right.write(i);
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr) throws IOException {
        this.left.write(bArr);
        this.right.write(bArr);
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) throws IOException {
        this.left.write(bArr, i, i2);
        this.right.write(bArr, i, i2);
    }
}
