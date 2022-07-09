package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.io.Serializable;
import java.util.Arrays;
import org.apache.commons.io.IOUtils;

/* loaded from: classes.jar:org/apache/commons/io/filefilter/MagicNumberFileFilter.class */
public class MagicNumberFileFilter extends AbstractFileFilter implements Serializable {
    private static final long serialVersionUID = -547733176983104172L;
    private final long byteOffset;
    private final byte[] magicNumbers;

    public MagicNumberFileFilter(String str) {
        this(str, 0L);
    }

    public MagicNumberFileFilter(String str, long j) {
        if (str == null) {
            throw new IllegalArgumentException("The magic number cannot be null");
        }
        if (str.length() == 0) {
            throw new IllegalArgumentException("The magic number must contain at least one byte");
        }
        if (j < 0) {
            throw new IllegalArgumentException("The offset cannot be negative");
        }
        this.magicNumbers = str.getBytes();
        this.byteOffset = j;
    }

    public MagicNumberFileFilter(byte[] bArr) {
        this(bArr, 0L);
    }

    public MagicNumberFileFilter(byte[] bArr, long j) {
        if (bArr == null) {
            throw new IllegalArgumentException("The magic number cannot be null");
        }
        if (bArr.length == 0) {
            throw new IllegalArgumentException("The magic number must contain at least one byte");
        }
        if (j < 0) {
            throw new IllegalArgumentException("The offset cannot be negative");
        }
        this.magicNumbers = new byte[bArr.length];
        System.arraycopy(bArr, 0, this.magicNumbers, 0, bArr.length);
        this.byteOffset = j;
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter, org.apache.commons.io.filefilter.IOFileFilter, java.io.FileFilter
    public boolean accept(File file) {
        RandomAccessFile randomAccessFile;
        Throwable th;
        byte[] bArr;
        boolean z = false;
        if (file != null) {
            z = false;
            if (file.isFile()) {
                z = false;
                if (file.canRead()) {
                    try {
                        bArr = new byte[this.magicNumbers.length];
                        randomAccessFile = new RandomAccessFile(file, "r");
                    } catch (IOException e) {
                        randomAccessFile = null;
                    } catch (Throwable th2) {
                        th = th2;
                        randomAccessFile = null;
                    }
                    try {
                        randomAccessFile.seek(this.byteOffset);
                        if (randomAccessFile.read(bArr) != this.magicNumbers.length) {
                            IOUtils.closeQuietly(randomAccessFile);
                            z = false;
                        } else {
                            z = Arrays.equals(this.magicNumbers, bArr);
                            IOUtils.closeQuietly(randomAccessFile);
                        }
                    } catch (IOException e2) {
                        IOUtils.closeQuietly(randomAccessFile);
                        z = false;
                        return z;
                    } catch (Throwable th3) {
                        th = th3;
                        IOUtils.closeQuietly(randomAccessFile);
                        throw th;
                    }
                }
            }
        }
        return z;
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter
    public String toString() {
        return super.toString() + "(" + new String(this.magicNumbers) + "," + this.byteOffset + ")";
    }
}
