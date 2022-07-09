package org.apache.commons.compress.compressors.xz;

import java.io.IOException;
import java.io.InputStream;
import org.apache.commons.compress.compressors.CompressorInputStream;
import org.tukaani.xz.SingleXZInputStream;
import org.tukaani.xz.XZ;
import org.tukaani.xz.XZInputStream;

/* loaded from: classes.jar:org/apache/commons/compress/compressors/xz/XZCompressorInputStream.class */
public class XZCompressorInputStream extends CompressorInputStream {
    private final InputStream in;

    public XZCompressorInputStream(InputStream inputStream) throws IOException {
        this(inputStream, false);
    }

    public XZCompressorInputStream(InputStream inputStream, boolean z) throws IOException {
        if (z) {
            this.in = new XZInputStream(inputStream);
        } else {
            this.in = new SingleXZInputStream(inputStream);
        }
    }

    public static boolean matches(byte[] bArr, int i) {
        boolean z;
        if (i >= XZ.HEADER_MAGIC.length) {
            int i2 = 0;
            while (true) {
                if (i2 >= XZ.HEADER_MAGIC.length) {
                    z = true;
                    break;
                }
                z = false;
                if (bArr[i2] != XZ.HEADER_MAGIC[i2]) {
                    break;
                }
                i2++;
            }
        } else {
            z = false;
        }
        return z;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        return this.in.available();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.in.close();
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int i = -1;
        int read = this.in.read();
        if (read != -1) {
            i = 1;
        }
        count(i);
        return read;
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int read = this.in.read(bArr, i, i2);
        count(read);
        return read;
    }

    @Override // java.io.InputStream
    public long skip(long j) throws IOException {
        return this.in.skip(j);
    }
}
