package com.jcraft.jzlib;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes.jar:com/jcraft/jzlib/ZOutputStream.class */
public class ZOutputStream extends OutputStream {
    protected byte[] buf;
    protected byte[] buf1;
    protected int bufsize;
    protected boolean compress;
    protected int flush;
    protected OutputStream out;
    protected ZStream z;

    public ZOutputStream(OutputStream outputStream) {
        this.z = new ZStream();
        this.bufsize = 512;
        this.flush = 0;
        this.buf = new byte[this.bufsize];
        this.buf1 = new byte[1];
        this.out = outputStream;
        this.z.inflateInit();
        this.compress = false;
    }

    public ZOutputStream(OutputStream outputStream, int i) {
        this(outputStream, i, false);
    }

    public ZOutputStream(OutputStream outputStream, int i, boolean z) {
        this.z = new ZStream();
        this.bufsize = 512;
        this.flush = 0;
        this.buf = new byte[this.bufsize];
        this.buf1 = new byte[1];
        this.out = outputStream;
        this.z.deflateInit(i, z);
        this.compress = true;
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        try {
            finish();
        } catch (IOException e) {
        } catch (Throwable th) {
            end();
            this.out.close();
            this.out = null;
            throw th;
        }
        end();
        this.out.close();
        this.out = null;
    }

    public void end() {
        if (this.z == null) {
            return;
        }
        if (this.compress) {
            this.z.deflateEnd();
        } else {
            this.z.inflateEnd();
        }
        this.z.free();
        this.z = null;
    }

    public void finish() throws IOException {
        while (true) {
            this.z.next_out = this.buf;
            this.z.next_out_index = 0;
            this.z.avail_out = this.bufsize;
            int deflate = this.compress ? this.z.deflate(4) : this.z.inflate(4);
            if (deflate != 1 && deflate != 0) {
                throw new ZStreamException(new StringBuffer().append(this.compress ? "de" : "in").append("flating: ").append(this.z.msg).toString());
            }
            if (this.bufsize - this.z.avail_out > 0) {
                this.out.write(this.buf, 0, this.bufsize - this.z.avail_out);
            }
            if (this.z.avail_in <= 0 && this.z.avail_out != 0) {
                flush();
                return;
            }
        }
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        this.out.flush();
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

    public void setFlushMode(int i) {
        this.flush = i;
    }

    @Override // java.io.OutputStream
    public void write(int i) throws IOException {
        this.buf1[0] = (byte) i;
        write(this.buf1, 0, 1);
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) throws IOException {
        if (i2 == 0) {
            return;
        }
        this.z.next_in = bArr;
        this.z.next_in_index = i;
        this.z.avail_in = i2;
        while (true) {
            this.z.next_out = this.buf;
            this.z.next_out_index = 0;
            this.z.avail_out = this.bufsize;
            if ((this.compress ? this.z.deflate(this.flush) : this.z.inflate(this.flush)) != 0) {
                throw new ZStreamException(new StringBuffer().append(this.compress ? "de" : "in").append("flating: ").append(this.z.msg).toString());
            }
            this.out.write(this.buf, 0, this.bufsize - this.z.avail_out);
            if (this.z.avail_in <= 0 && this.z.avail_out != 0) {
                return;
            }
        }
    }
}
