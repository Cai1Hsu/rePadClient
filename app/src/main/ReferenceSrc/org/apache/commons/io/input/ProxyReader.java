package org.apache.commons.io.input;

import java.io.FilterReader;
import java.io.IOException;
import java.io.Reader;
import java.nio.CharBuffer;

/* loaded from: classes.jar:org/apache/commons/io/input/ProxyReader.class */
public abstract class ProxyReader extends FilterReader {
    public ProxyReader(Reader reader) {
        super(reader);
    }

    protected void afterRead(int i) throws IOException {
    }

    protected void beforeRead(int i) throws IOException {
    }

    @Override // java.io.FilterReader, java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
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

    @Override // java.io.FilterReader, java.io.Reader
    public void mark(int i) throws IOException {
        synchronized (this) {
            try {
                this.in.mark(i);
            } catch (IOException e) {
                handleIOException(e);
            }
        }
    }

    @Override // java.io.FilterReader, java.io.Reader
    public boolean markSupported() {
        return this.in.markSupported();
    }

    @Override // java.io.FilterReader, java.io.Reader
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

    @Override // java.io.Reader, java.lang.Readable
    public int read(CharBuffer charBuffer) throws IOException {
        int length;
        int i;
        if (charBuffer != null) {
            try {
                length = charBuffer.length();
            } catch (IOException e) {
                handleIOException(e);
                i = -1;
            }
        } else {
            length = 0;
        }
        beforeRead(length);
        i = this.in.read(charBuffer);
        afterRead(i);
        return i;
    }

    @Override // java.io.Reader
    public int read(char[] cArr) throws IOException {
        int length;
        int i;
        if (cArr != null) {
            try {
                length = cArr.length;
            } catch (IOException e) {
                handleIOException(e);
                i = -1;
            }
        } else {
            length = 0;
        }
        beforeRead(length);
        i = this.in.read(cArr);
        afterRead(i);
        return i;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read(char[] cArr, int i, int i2) throws IOException {
        int i3;
        try {
            beforeRead(i2);
            i3 = this.in.read(cArr, i, i2);
            afterRead(i3);
        } catch (IOException e) {
            handleIOException(e);
            i3 = -1;
        }
        return i3;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public boolean ready() throws IOException {
        boolean z;
        try {
            z = this.in.ready();
        } catch (IOException e) {
            handleIOException(e);
            z = false;
        }
        return z;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public void reset() throws IOException {
        synchronized (this) {
            try {
                this.in.reset();
            } catch (IOException e) {
                handleIOException(e);
            }
        }
    }

    @Override // java.io.FilterReader, java.io.Reader
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
