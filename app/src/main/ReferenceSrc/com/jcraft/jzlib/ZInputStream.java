package com.jcraft.jzlib;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.jar:com/jcraft/jzlib/ZInputStream.class */
public class ZInputStream extends FilterInputStream {
    protected byte[] buf;
    protected byte[] buf1;
    protected int bufsize;
    protected boolean compress;
    protected int flush;
    protected InputStream in;
    private boolean nomoreinput;
    protected ZStream z;

    public ZInputStream(InputStream inputStream) {
        this(inputStream, false);
    }

    public ZInputStream(InputStream inputStream, int i) {
        super(inputStream);
        this.z = new ZStream();
        this.bufsize = 512;
        this.flush = 0;
        this.buf = new byte[this.bufsize];
        this.buf1 = new byte[1];
        this.in = null;
        this.nomoreinput = false;
        this.in = inputStream;
        this.z.deflateInit(i);
        this.compress = true;
        this.z.next_in = this.buf;
        this.z.next_in_index = 0;
        this.z.avail_in = 0;
    }

    public ZInputStream(InputStream inputStream, boolean z) {
        super(inputStream);
        this.z = new ZStream();
        this.bufsize = 512;
        this.flush = 0;
        this.buf = new byte[this.bufsize];
        this.buf1 = new byte[1];
        this.in = null;
        this.nomoreinput = false;
        this.in = inputStream;
        this.z.inflateInit(z);
        this.compress = false;
        this.z.next_in = this.buf;
        this.z.next_in_index = 0;
        this.z.avail_in = 0;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.in.close();
    }

    public int getFlushMode() {
        return this.flush;
    }

    public long getTotalIn() {
        return this.z.total_in;
    }

    public long getTotalOut() {
        return this.z.total_out;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        int i = -1;
        if (read(this.buf1, 0, 1) != -1) {
            i = this.buf1[0] & 255;
        }
        return i;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int deflate;
        int i3;
        if (i2 == 0) {
            i3 = 0;
        } else {
            this.z.next_out = bArr;
            this.z.next_out_index = i;
            this.z.avail_out = i2;
            do {
                if (this.z.avail_in == 0 && !this.nomoreinput) {
                    this.z.next_in_index = 0;
                    this.z.avail_in = this.in.read(this.buf, 0, this.bufsize);
                    if (this.z.avail_in == -1) {
                        this.z.avail_in = 0;
                        this.nomoreinput = true;
                    }
                }
                deflate = this.compress ? this.z.deflate(this.flush) : this.z.inflate(this.flush);
                if (this.nomoreinput && deflate == -5) {
                    i3 = -1;
                    break;
                } else if (deflate != 0 && deflate != 1) {
                    throw new ZStreamException(new StringBuffer().append(this.compress ? "de" : "in").append("flating: ").append(this.z.msg).toString());
                } else if ((!this.nomoreinput && deflate != 1) || this.z.avail_out != i2) {
                    if (this.z.avail_out != i2) {
                        break;
                    }
                } else {
                    i3 = -1;
                    break;
                }
            } while (deflate == 0);
            i3 = i2 - this.z.avail_out;
        }
        return i3;
    }

    public void setFlushMode(int i) {
        this.flush = i;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public long skip(long j) throws IOException {
        int i = 512;
        if (j < 512) {
            i = (int) j;
        }
        return read(new byte[i]);
    }
}
