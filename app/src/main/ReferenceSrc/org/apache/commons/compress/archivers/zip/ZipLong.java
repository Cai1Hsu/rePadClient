package org.apache.commons.compress.archivers.zip;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/ZipLong.class */
public final class ZipLong implements Cloneable {
    private static final int BYTE_1 = 1;
    private static final int BYTE_1_MASK = 65280;
    private static final int BYTE_1_SHIFT = 8;
    private static final int BYTE_2 = 2;
    private static final int BYTE_2_MASK = 16711680;
    private static final int BYTE_2_SHIFT = 16;
    private static final int BYTE_3 = 3;
    private static final long BYTE_3_MASK = 4278190080L;
    private static final int BYTE_3_SHIFT = 24;
    private final long value;
    public static final ZipLong CFH_SIG = new ZipLong(33639248);
    public static final ZipLong LFH_SIG = new ZipLong(67324752);
    public static final ZipLong DD_SIG = new ZipLong(134695760);
    static final ZipLong ZIP64_MAGIC = new ZipLong(4294967295L);

    public ZipLong(long j) {
        this.value = j;
    }

    public ZipLong(byte[] bArr) {
        this(bArr, 0);
    }

    public ZipLong(byte[] bArr, int i) {
        this.value = getValue(bArr, i);
    }

    public static byte[] getBytes(long j) {
        return new byte[]{(byte) (255 & j), (byte) ((65280 & j) >> 8), (byte) ((16711680 & j) >> 16), (byte) ((BYTE_3_MASK & j) >> 24)};
    }

    public static long getValue(byte[] bArr) {
        return getValue(bArr, 0);
    }

    public static long getValue(byte[] bArr, int i) {
        return ((bArr[i + 3] << 24) & BYTE_3_MASK) + ((bArr[i + 2] << 16) & BYTE_2_MASK) + ((bArr[i + 1] << 8) & 65280) + (bArr[i] & 255);
    }

    public Object clone() {
        try {
            return super.clone();
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (obj != null) {
            if (!(obj instanceof ZipLong)) {
                z = false;
            } else {
                z = false;
                if (this.value == ((ZipLong) obj).getValue()) {
                    z = true;
                }
            }
        }
        return z;
    }

    public byte[] getBytes() {
        return getBytes(this.value);
    }

    public long getValue() {
        return this.value;
    }

    public int hashCode() {
        return (int) this.value;
    }

    public String toString() {
        return "ZipLong value: " + this.value;
    }
}
