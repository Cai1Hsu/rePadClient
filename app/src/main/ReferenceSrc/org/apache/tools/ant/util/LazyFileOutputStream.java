package org.apache.tools.ant.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/util/LazyFileOutputStream.class */
public class LazyFileOutputStream extends OutputStream {
    private boolean alwaysCreate;
    private boolean append;
    private boolean closed;
    private File file;
    private FileOutputStream fos;
    private boolean opened;

    public LazyFileOutputStream(File file) {
        this(file, false);
    }

    public LazyFileOutputStream(File file, boolean z) {
        this(file, z, false);
    }

    public LazyFileOutputStream(File file, boolean z, boolean z2) {
        this.opened = false;
        this.closed = false;
        this.file = file;
        this.append = z;
        this.alwaysCreate = z2;
    }

    public LazyFileOutputStream(String str) {
        this(str, false);
    }

    public LazyFileOutputStream(String str, boolean z) {
        this(new File(str), z);
    }

    private void ensureOpened() throws IOException {
        synchronized (this) {
            if (this.closed) {
                throw new IOException(new StringBuffer().append(this.file).append(" has already been closed.").toString());
            }
            if (!this.opened) {
                this.fos = new FileOutputStream(this.file.getAbsolutePath(), this.append);
                this.opened = true;
            }
        }
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        synchronized (this) {
            if (this.alwaysCreate && !this.closed) {
                ensureOpened();
            }
            if (this.opened) {
                this.fos.close();
            }
            this.closed = true;
        }
    }

    public void open() throws IOException {
        ensureOpened();
    }

    @Override // java.io.OutputStream
    public void write(int i) throws IOException {
        synchronized (this) {
            ensureOpened();
            this.fos.write(i);
        }
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr) throws IOException {
        write(bArr, 0, bArr.length);
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) throws IOException {
        synchronized (this) {
            ensureOpened();
            this.fos.write(bArr, i, i2);
        }
    }
}
