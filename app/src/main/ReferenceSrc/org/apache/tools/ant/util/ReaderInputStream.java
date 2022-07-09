package org.apache.tools.ant.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;

/* loaded from: classes.jar:org/apache/tools/ant/util/ReaderInputStream.class */
public class ReaderInputStream extends InputStream {
    private static final int BYTE_MASK = 255;
    private int begin;
    private String encoding;
    private Reader in;
    private byte[] slack;

    public ReaderInputStream(Reader reader) {
        this.encoding = System.getProperty("file.encoding");
        this.in = reader;
    }

    public ReaderInputStream(Reader reader, String str) {
        this(reader);
        if (str == null) {
            throw new IllegalArgumentException("encoding must not be null");
        }
        this.encoding = str;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        int length;
        synchronized (this) {
            if (this.in == null) {
                throw new IOException("Stream Closed");
            }
            length = this.slack != null ? this.slack.length - this.begin : this.in.ready() ? 1 : 0;
        }
        return length;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        synchronized (this) {
            if (this.in != null) {
                this.in.close();
                this.slack = null;
                this.in = null;
            }
        }
    }

    @Override // java.io.InputStream
    public void mark(int i) {
        synchronized (this) {
            try {
                this.in.mark(i);
            } catch (IOException e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override // java.io.InputStream
    public boolean markSupported() {
        return false;
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        byte b;
        int i;
        synchronized (this) {
            if (this.in == null) {
                throw new IOException("Stream Closed");
            }
            if (this.slack == null || this.begin >= this.slack.length) {
                byte[] bArr = new byte[1];
                if (read(bArr, 0, 1) <= 0) {
                    i = -1;
                } else {
                    b = bArr[0];
                }
            } else {
                byte b2 = this.slack[this.begin];
                int i2 = this.begin + 1;
                this.begin = i2;
                b = b2;
                if (i2 == this.slack.length) {
                    this.slack = null;
                    b = b2;
                }
            }
            i = b & 255;
        }
        return i;
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int i3;
        synchronized (this) {
            if (this.in == null) {
                throw new IOException("Stream Closed");
            }
            if (i2 == 0) {
                i3 = 0;
            } else {
                while (true) {
                    if (this.slack == null) {
                        char[] cArr = new char[i2];
                        int read = this.in.read(cArr);
                        if (read == -1) {
                            i3 = -1;
                            break;
                        } else if (read > 0) {
                            this.slack = new String(cArr, 0, read).getBytes(this.encoding);
                            this.begin = 0;
                        }
                    } else {
                        int i4 = i2;
                        if (i2 > this.slack.length - this.begin) {
                            i4 = this.slack.length - this.begin;
                        }
                        System.arraycopy(this.slack, this.begin, bArr, i, i4);
                        this.begin += i4;
                        if (this.begin >= this.slack.length) {
                            this.slack = null;
                        }
                        i3 = i4;
                    }
                }
            }
        }
        return i3;
    }

    @Override // java.io.InputStream
    public void reset() throws IOException {
        synchronized (this) {
            if (this.in == null) {
                throw new IOException("Stream Closed");
            }
            this.slack = null;
            this.in.reset();
        }
    }
}
