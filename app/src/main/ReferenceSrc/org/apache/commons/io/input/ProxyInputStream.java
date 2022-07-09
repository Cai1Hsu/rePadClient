package org.apache.commons.io.input;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.jar:org/apache/commons/io/input/ProxyInputStream.class */
public abstract class ProxyInputStream extends FilterInputStream {
    public ProxyInputStream(InputStream inputStream) {
        super(inputStream);
    }

    protected void afterRead(int i) throws IOException {
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int available() throws IOException {
        int i;
        try {
            i = super.available();
        } catch (IOException e) {
            handleIOException(e);
            i = 0;
        }
        return i;
    }

    protected void beforeRead(int i) throws IOException {
    }

    @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        try {
            this.in.close();
        } catch (IOException e) {
            handleIOException(e);
        }
    }

    protected void handleIOException(IOException iOException) throws IOException {
        throw iOException;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public void mark(int i) {
        synchronized (this) {
            this.in.mark(i);
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public boolean markSupported() {
        return this.in.markSupported();
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        int i;
        int i2 = 1;
        try {
            beforeRead(1);
            int read = this.in.read();
            if (read == -1) {
                i2 = -1;
            }
            afterRead(i2);
            i = read;
        } catch (IOException e) {
            handleIOException(e);
            i = -1;
        }
        return i;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bArr) throws IOException {
        int length;
        int i;
        if (bArr != null) {
            try {
                length = bArr.length;
            } catch (IOException e) {
                handleIOException(e);
                i = -1;
            }
        } else {
            length = 0;
        }
        beforeRead(length);
        i = this.in.read(bArr);
        afterRead(i);
        return i;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int i3;
        try {
            beforeRead(i2);
            i3 = this.in.read(bArr, i, i2);
            afterRead(i3);
        } catch (IOException e) {
            handleIOException(e);
            i3 = -1;
        }
        return i3;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public void reset() throws IOException {
        synchronized (this) {
            try {
                this.in.reset();
            } catch (IOException e) {
                handleIOException(e);
            }
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public long skip(long j) throws IOException {
        long j2;
        try {
            j2 = this.in.skip(j);
        } catch (IOException e) {
            handleIOException(e);
            j2 = 0;
        }
        return j2;
    }
}
