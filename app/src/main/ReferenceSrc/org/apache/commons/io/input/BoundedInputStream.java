package org.apache.commons.io.input;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.jar:org/apache/commons/io/input/BoundedInputStream.class */
public class BoundedInputStream extends InputStream {
    private final InputStream in;
    private long mark;
    private final long max;
    private long pos;
    private boolean propagateClose;

    public BoundedInputStream(InputStream inputStream) {
        this(inputStream, -1L);
    }

    public BoundedInputStream(InputStream inputStream, long j) {
        this.pos = 0L;
        this.mark = -1L;
        this.propagateClose = true;
        this.max = j;
        this.in = inputStream;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        return (this.max < 0 || this.pos < this.max) ? this.in.available() : 0;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.propagateClose) {
            this.in.close();
        }
    }

    public boolean isPropagateClose() {
        return this.propagateClose;
    }

    @Override // java.io.InputStream
    public void mark(int i) {
        synchronized (this) {
            this.in.mark(i);
            this.mark = this.pos;
        }
    }

    @Override // java.io.InputStream
    public boolean markSupported() {
        return this.in.markSupported();
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int read;
        if (this.max < 0 || this.pos < this.max) {
            read = this.in.read();
            this.pos++;
        } else {
            read = -1;
        }
        return read;
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr) throws IOException {
        return read(bArr, 0, bArr.length);
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int read;
        if (this.max < 0 || this.pos < this.max) {
            read = this.in.read(bArr, i, (int) (this.max >= 0 ? Math.min(i2, this.max - this.pos) : i2));
            if (read == -1) {
                read = -1;
            } else {
                this.pos += read;
            }
        } else {
            read = -1;
        }
        return read;
    }

    @Override // java.io.InputStream
    public void reset() throws IOException {
        synchronized (this) {
            this.in.reset();
            this.pos = this.mark;
        }
    }

    public void setPropagateClose(boolean z) {
        this.propagateClose = z;
    }

    @Override // java.io.InputStream
    public long skip(long j) throws IOException {
        if (this.max >= 0) {
            j = Math.min(j, this.max - this.pos);
        }
        long skip = this.in.skip(j);
        this.pos += skip;
        return skip;
    }

    public String toString() {
        return this.in.toString();
    }
}
