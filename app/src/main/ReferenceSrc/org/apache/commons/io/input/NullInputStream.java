package org.apache.commons.io.input;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.jar:org/apache/commons/io/input/NullInputStream.class */
public class NullInputStream extends InputStream {
    private boolean eof;
    private long mark;
    private final boolean markSupported;
    private long position;
    private long readlimit;
    private final long size;
    private final boolean throwEofException;

    public NullInputStream(long j) {
        this(j, true, false);
    }

    public NullInputStream(long j, boolean z, boolean z2) {
        this.mark = -1L;
        this.size = j;
        this.markSupported = z;
        this.throwEofException = z2;
    }

    private int doEndOfFile() throws EOFException {
        this.eof = true;
        if (this.throwEofException) {
            throw new EOFException();
        }
        return -1;
    }

    @Override // java.io.InputStream
    public int available() {
        long j = this.size - this.position;
        return j <= 0 ? 0 : j > 2147483647L ? Integer.MAX_VALUE : (int) j;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.eof = false;
        this.position = 0L;
        this.mark = -1L;
    }

    public long getPosition() {
        return this.position;
    }

    public long getSize() {
        return this.size;
    }

    @Override // java.io.InputStream
    public void mark(int i) {
        synchronized (this) {
            if (!this.markSupported) {
                throw new UnsupportedOperationException("Mark not supported");
            }
            this.mark = this.position;
            this.readlimit = i;
        }
    }

    @Override // java.io.InputStream
    public boolean markSupported() {
        return this.markSupported;
    }

    protected int processByte() {
        return 0;
    }

    protected void processBytes(byte[] bArr, int i, int i2) {
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int processByte;
        if (this.eof) {
            throw new IOException("Read after end of file");
        }
        if (this.position == this.size) {
            processByte = doEndOfFile();
        } else {
            this.position++;
            processByte = processByte();
        }
        return processByte;
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr) throws IOException {
        return read(bArr, 0, bArr.length);
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int i3;
        if (this.eof) {
            throw new IOException("Read after end of file");
        }
        if (this.position == this.size) {
            i3 = doEndOfFile();
        } else {
            this.position += i2;
            i3 = i2;
            if (this.position > this.size) {
                i3 = i2 - ((int) (this.position - this.size));
                this.position = this.size;
            }
            processBytes(bArr, i, i3);
        }
        return i3;
    }

    @Override // java.io.InputStream
    public void reset() throws IOException {
        synchronized (this) {
            if (!this.markSupported) {
                throw new UnsupportedOperationException("Mark not supported");
            }
            if (this.mark < 0) {
                throw new IOException("No position has been marked");
            }
            if (this.position > this.mark + this.readlimit) {
                throw new IOException("Marked position [" + this.mark + "] is no longer valid - passed the read limit [" + this.readlimit + "]");
            }
            this.position = this.mark;
            this.eof = false;
        }
    }

    @Override // java.io.InputStream
    public long skip(long j) throws IOException {
        long j2;
        if (this.eof) {
            throw new IOException("Skip after end of file");
        }
        if (this.position == this.size) {
            j2 = doEndOfFile();
        } else {
            this.position += j;
            j2 = j;
            if (this.position > this.size) {
                j2 = j - (this.position - this.size);
                this.position = this.size;
            }
        }
        return j2;
    }
}
