package org.apache.commons.io.input;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.io.ByteOrderMark;

/* loaded from: classes.jar:org/apache/commons/io/input/BOMInputStream.class */
public class BOMInputStream extends ProxyInputStream {
    private static final Comparator<ByteOrderMark> ByteOrderMarkLengthComparator = new Comparator<ByteOrderMark>() { // from class: org.apache.commons.io.input.BOMInputStream.1
        public int compare(ByteOrderMark byteOrderMark, ByteOrderMark byteOrderMark2) {
            int length = byteOrderMark.length();
            int length2 = byteOrderMark2.length();
            return length > length2 ? -1 : length2 > length ? 1 : 0;
        }
    };
    private final List<ByteOrderMark> boms;
    private ByteOrderMark byteOrderMark;
    private int fbIndex;
    private int fbLength;
    private int[] firstBytes;
    private final boolean include;
    private int markFbIndex;
    private boolean markedAtStart;

    public BOMInputStream(InputStream inputStream) {
        this(inputStream, false, ByteOrderMark.UTF_8);
    }

    public BOMInputStream(InputStream inputStream, boolean z) {
        this(inputStream, z, ByteOrderMark.UTF_8);
    }

    public BOMInputStream(InputStream inputStream, boolean z, ByteOrderMark... byteOrderMarkArr) {
        super(inputStream);
        if (byteOrderMarkArr == null || byteOrderMarkArr.length == 0) {
            throw new IllegalArgumentException("No BOMs specified");
        }
        this.include = z;
        Arrays.sort(byteOrderMarkArr, ByteOrderMarkLengthComparator);
        this.boms = Arrays.asList(byteOrderMarkArr);
    }

    public BOMInputStream(InputStream inputStream, ByteOrderMark... byteOrderMarkArr) {
        this(inputStream, false, byteOrderMarkArr);
    }

    private ByteOrderMark find() {
        ByteOrderMark byteOrderMark;
        Iterator<ByteOrderMark> it = this.boms.iterator();
        while (true) {
            if (!it.hasNext()) {
                byteOrderMark = null;
                break;
            }
            byteOrderMark = it.next();
            if (matches(byteOrderMark)) {
                break;
            }
        }
        return byteOrderMark;
    }

    private boolean matches(ByteOrderMark byteOrderMark) {
        boolean z;
        int i = 0;
        while (true) {
            if (i >= byteOrderMark.length()) {
                z = true;
                break;
            } else if (byteOrderMark.get(i) != this.firstBytes[i]) {
                z = false;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    private int readFirstBytes() throws IOException {
        int i;
        getBOM();
        if (this.fbIndex < this.fbLength) {
            int[] iArr = this.firstBytes;
            int i2 = this.fbIndex;
            this.fbIndex = i2 + 1;
            i = iArr[i2];
        } else {
            i = -1;
        }
        return i;
    }

    public ByteOrderMark getBOM() throws IOException {
        if (this.firstBytes == null) {
            this.fbLength = 0;
            this.firstBytes = new int[this.boms.get(0).length()];
            for (int i = 0; i < this.firstBytes.length; i++) {
                this.firstBytes[i] = this.in.read();
                this.fbLength++;
                if (this.firstBytes[i] < 0) {
                    break;
                }
            }
            this.byteOrderMark = find();
            if (this.byteOrderMark != null && !this.include) {
                if (this.byteOrderMark.length() < this.firstBytes.length) {
                    this.fbIndex = this.byteOrderMark.length();
                } else {
                    this.fbLength = 0;
                }
            }
        }
        return this.byteOrderMark;
    }

    public String getBOMCharsetName() throws IOException {
        getBOM();
        return this.byteOrderMark == null ? null : this.byteOrderMark.getCharsetName();
    }

    public boolean hasBOM() throws IOException {
        return getBOM() != null;
    }

    public boolean hasBOM(ByteOrderMark byteOrderMark) throws IOException {
        if (!this.boms.contains(byteOrderMark)) {
            throw new IllegalArgumentException("Stream not configure to detect " + byteOrderMark);
        }
        return this.byteOrderMark != null && getBOM().equals(byteOrderMark);
    }

    @Override // org.apache.commons.io.input.ProxyInputStream, java.io.FilterInputStream, java.io.InputStream
    public void mark(int i) {
        synchronized (this) {
            this.markFbIndex = this.fbIndex;
            this.markedAtStart = this.firstBytes == null;
            this.in.mark(i);
        }
    }

    @Override // org.apache.commons.io.input.ProxyInputStream, java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        int readFirstBytes = readFirstBytes();
        if (readFirstBytes < 0) {
            readFirstBytes = this.in.read();
        }
        return readFirstBytes;
    }

    @Override // org.apache.commons.io.input.ProxyInputStream, java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bArr) throws IOException {
        return read(bArr, 0, bArr.length);
    }

    @Override // org.apache.commons.io.input.ProxyInputStream, java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int i3 = 0;
        int i4 = i2;
        int i5 = i;
        int i6 = 0;
        while (i4 > 0 && i3 >= 0) {
            int readFirstBytes = readFirstBytes();
            i3 = readFirstBytes;
            if (readFirstBytes >= 0) {
                bArr[i5] = (byte) (readFirstBytes & 255);
                i4--;
                i6++;
                i5++;
                i3 = readFirstBytes;
            }
        }
        int read = this.in.read(bArr, i5, i4);
        if (read >= 0) {
            i6 += read;
        } else if (i6 <= 0) {
            i6 = -1;
        }
        return i6;
    }

    @Override // org.apache.commons.io.input.ProxyInputStream, java.io.FilterInputStream, java.io.InputStream
    public void reset() throws IOException {
        synchronized (this) {
            this.fbIndex = this.markFbIndex;
            if (this.markedAtStart) {
                this.firstBytes = null;
            }
            this.in.reset();
        }
    }

    @Override // org.apache.commons.io.input.ProxyInputStream, java.io.FilterInputStream, java.io.InputStream
    public long skip(long j) throws IOException {
        while (j > 0 && readFirstBytes() >= 0) {
            j--;
        }
        return this.in.skip(j);
    }
}
