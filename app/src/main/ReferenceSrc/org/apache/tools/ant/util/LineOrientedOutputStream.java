package org.apache.tools.ant.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/util/LineOrientedOutputStream.class */
public abstract class LineOrientedOutputStream extends OutputStream {
    private static final int CR = 13;
    private static final int INTIAL_SIZE = 132;
    private static final int LF = 10;
    private ByteArrayOutputStream buffer = new ByteArrayOutputStream(INTIAL_SIZE);
    private boolean skip = false;

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.buffer.size() > 0) {
            processBuffer();
        }
        super.close();
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
    }

    protected void processBuffer() throws IOException {
        try {
            processLine(this.buffer.toByteArray());
        } finally {
            this.buffer.reset();
        }
    }

    protected abstract void processLine(String str) throws IOException;

    protected void processLine(byte[] bArr) throws IOException {
        processLine(new String(bArr));
    }

    @Override // java.io.OutputStream
    public final void write(int i) throws IOException {
        byte b = (byte) i;
        if (b != 10 && b != 13) {
            this.buffer.write(i);
        } else if (!this.skip) {
            processBuffer();
        }
        this.skip = b == 13;
    }

    @Override // java.io.OutputStream
    public final void write(byte[] bArr, int i, int i2) throws IOException {
        while (true) {
            int i3 = i;
            if (i2 > 0) {
                int i4 = i2;
                int i5 = i;
                while (i4 > 0 && bArr[i5] != 10 && bArr[i5] != 13) {
                    i5++;
                    i4--;
                }
                int i6 = i5 - i3;
                i = i5;
                i2 = i4;
                if (i6 > 0) {
                    this.buffer.write(bArr, i3, i6);
                    i2 = i4;
                    i = i5;
                }
                while (i2 > 0 && (bArr[i] == 10 || bArr[i] == 13)) {
                    write(bArr[i]);
                    i++;
                    i2--;
                }
            } else {
                return;
            }
        }
    }
}
