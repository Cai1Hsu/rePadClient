package org.apache.tools.tar;

/* loaded from: classes.jar:org/apache/tools/tar/TarUtils.class */
public class TarUtils {
    private static final int BYTE_MASK = 255;

    public static long computeCheckSum(byte[] bArr) {
        long j = 0;
        for (byte b : bArr) {
            j += b & 255;
        }
        return j;
    }

    public static int getCheckSumOctalBytes(long j, byte[] bArr, int i, int i2) {
        getOctalBytes(j, bArr, i, i2);
        bArr[(i + i2) - 1] = (byte) 32;
        bArr[(i + i2) - 2] = (byte) 0;
        return i + i2;
    }

    public static int getLongOctalBytes(long j, byte[] bArr, int i, int i2) {
        byte[] bArr2 = new byte[i2 + 1];
        getOctalBytes(j, bArr2, 0, i2 + 1);
        System.arraycopy(bArr2, 0, bArr, i, i2);
        return i + i2;
    }

    public static int getNameBytes(StringBuffer stringBuffer, byte[] bArr, int i, int i2) {
        int i3;
        int i4 = 0;
        while (true) {
            i3 = i4;
            if (i4 >= i2) {
                break;
            }
            i3 = i4;
            if (i4 >= stringBuffer.length()) {
                break;
            }
            bArr[i + i4] = (byte) stringBuffer.charAt(i4);
            i4++;
        }
        while (i3 < i2) {
            bArr[i + i3] = (byte) 0;
            i3++;
        }
        return i + i2;
    }

    public static int getOctalBytes(long j, byte[] bArr, int i, int i2) {
        int i3;
        int i4 = i2 - 1;
        bArr[i + i4] = (byte) 0;
        int i5 = i4 - 1;
        bArr[i + i5] = (byte) 32;
        int i6 = i5 - 1;
        if (j == 0) {
            bArr[i + i6] = (byte) 48;
            i3 = i6 - 1;
        } else {
            while (true) {
                i3 = i6;
                if (i6 >= 0) {
                    i3 = i6;
                    if (j > 0) {
                        bArr[i + i6] = (byte) (((byte) (7 & j)) + 48);
                        j >>= 3;
                        i6--;
                    }
                }
            }
        }
        while (i3 >= 0) {
            bArr[i + i3] = (byte) 32;
            i3--;
        }
        return i + i2;
    }

    public static StringBuffer parseName(byte[] bArr, int i, int i2) {
        StringBuffer stringBuffer = new StringBuffer(i2);
        for (int i3 = i; i3 < i + i2 && bArr[i3] != 0; i3++) {
            stringBuffer.append((char) bArr[i3]);
        }
        return stringBuffer;
    }

    public static long parseOctal(byte[] bArr, int i, int i2) {
        long j = 0;
        boolean z = true;
        for (int i3 = i; i3 < i + i2 && bArr[i3] != 0; i3++) {
            if (bArr[i3] == 32 || bArr[i3] == 48) {
                if (!z) {
                    if (bArr[i3] == 32) {
                        break;
                    }
                } else {
                    continue;
                }
            }
            z = false;
            j = (j << 3) + (bArr[i3] - 48);
        }
        return j;
    }
}
