package com.jcraft.jzlib;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import org.bson.BSON;

/* loaded from: classes.dex */
public class ZInputStream extends FilterInputStream {
    protected byte[] buf;
    protected byte[] buf1;
    protected int bufsize;
    protected boolean compress;
    protected int flush;
    protected InputStream in;
    private boolean nomoreinput;
    protected ZStream z;

    public ZInputStream(InputStream in) {
        this(in, false);
    }

    public ZInputStream(InputStream in, boolean nowrap) {
        super(in);
        this.z = new ZStream();
        this.bufsize = 512;
        this.flush = 0;
        this.buf = new byte[this.bufsize];
        this.buf1 = new byte[1];
        this.in = null;
        this.nomoreinput = false;
        this.in = in;
        this.z.inflateInit(nowrap);
        this.compress = false;
        this.z.next_in = this.buf;
        this.z.next_in_index = 0;
        this.z.avail_in = 0;
    }

    public ZInputStream(InputStream in, int level) {
        super(in);
        this.z = new ZStream();
        this.bufsize = 512;
        this.flush = 0;
        this.buf = new byte[this.bufsize];
        this.buf1 = new byte[1];
        this.in = null;
        this.nomoreinput = false;
        this.in = in;
        this.z.deflateInit(level);
        this.compress = true;
        this.z.next_in = this.buf;
        this.z.next_in_index = 0;
        this.z.avail_in = 0;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        if (read(this.buf1, 0, 1) == -1) {
            return -1;
        }
        return this.buf1[0] & BSON.MINKEY;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        int err;
        if (len == 0) {
            return 0;
        }
        this.z.next_out = b;
        this.z.next_out_index = off;
        this.z.avail_out = len;
        do {
            if (this.z.avail_in == 0 && !this.nomoreinput) {
                this.z.next_in_index = 0;
                this.z.avail_in = this.in.read(this.buf, 0, this.bufsize);
                if (this.z.avail_in == -1) {
                    this.z.avail_in = 0;
                    this.nomoreinput = true;
                }
            }
            if (this.compress) {
                err = this.z.deflate(this.flush);
            } else {
                err = this.z.inflate(this.flush);
            }
            if (this.nomoreinput && err == -5) {
                return -1;
            }
            if (err != 0 && err != 1) {
                throw new ZStreamException(new StringBuffer().append(this.compress ? "de" : "in").append("flating: ").append(this.z.msg).toString());
            } else if ((!this.nomoreinput && err != 1) || this.z.avail_out != len) {
                if (this.z.avail_out != len) {
                    break;
                }
            } else {
                return -1;
            }
        } while (err == 0);
        return len - this.z.avail_out;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public long skip(long n) throws IOException {
        int len = 512;
        if (n < 512) {
            len = (int) n;
        }
        byte[] tmp = new byte[len];
        return read(tmp);
    }

    public int getFlushMode() {
        return this.flush;
    }

    public void setFlushMode(int flush) {
        this.flush = flush;
    }

    public long getTotalIn() {
        return this.z.total_in;
    }

    public long getTotalOut() {
        return this.z.total_out;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.in.close();
    }
}
