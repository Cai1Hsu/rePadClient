package org.apache.commons.compress.archivers.cpio;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/cpio/CpioUtil.class */
class CpioUtil {
    CpioUtil() {
    }

    static long byteArray2long(byte[] bArr, boolean z) {
        if (bArr.length % 2 != 0) {
            throw new UnsupportedOperationException();
        }
        byte[] bArr2 = new byte[bArr.length];
        System.arraycopy(bArr, 0, bArr2, 0, bArr.length);
        if (!z) {
            int i = 0;
            while (true) {
                int i2 = i;
                if (i2 >= bArr2.length) {
                    break;
                }
                byte b = bArr2[i2];
                int i3 = i2 + 1;
                bArr2[i2] = bArr2[i3];
                bArr2[i3] = b;
                i = i3 + 1;
            }
        }
        long j = bArr2[0] & 255;
        for (int i4 = 1; i4 < bArr2.length; i4++) {
            j = (j << 8) | (bArr2[i4] & 255);
        }
        return j;
    }

    static byte[] long2byteArray(long j, int i, boolean z) {
        byte[] bArr = new byte[i];
        if (i % 2 != 0 || i < 2) {
            throw new UnsupportedOperationException();
        }
        for (int i2 = i - 1; i2 >= 0; i2--) {
            bArr[i2] = (byte) (255 & j);
            j >>= 8;
        }
        if (!z) {
            int i3 = 0;
            while (true) {
                int i4 = i3;
                if (i4 >= i) {
                    break;
                }
                byte b = bArr[i4];
                int i5 = i4 + 1;
                bArr[i4] = bArr[i5];
                bArr[i5] = b;
                i3 = i5 + 1;
            }
        }
        return bArr;
    }
}
