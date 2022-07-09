package com.jcraft.jzlib;

/* loaded from: classes.jar:com/jcraft/jzlib/Adler32.class */
final class Adler32 {
    private static final int BASE = 65521;
    private static final int NMAX = 5552;

    Adler32() {
    }

    long adler32(long j, byte[] bArr, int i, int i2) {
        long j2;
        long j3;
        long j4;
        int i3;
        int i4;
        if (bArr == null) {
            j2 = 1;
        } else {
            long j5 = j & 65535;
            long j6 = (j >> 16) & 65535;
            while (i2 > 0) {
                int i5 = i2 < NMAX ? i2 : NMAX;
                int i6 = i2 - i5;
                int i7 = i5;
                while (i7 >= 16) {
                    long j7 = j5 + (bArr[i] & 255);
                    int i8 = i + 1 + 1;
                    long j8 = j7 + (bArr[i4] & 255);
                    int i9 = i8 + 1;
                    long j9 = j8 + (bArr[i8] & 255);
                    int i10 = i9 + 1;
                    long j10 = j9 + (bArr[i9] & 255);
                    int i11 = i10 + 1;
                    long j11 = j10 + (bArr[i10] & 255);
                    int i12 = i11 + 1;
                    long j12 = j11 + (bArr[i11] & 255);
                    int i13 = i12 + 1;
                    long j13 = j12 + (bArr[i12] & 255);
                    int i14 = i13 + 1;
                    long j14 = j13 + (bArr[i13] & 255);
                    int i15 = i14 + 1;
                    long j15 = j14 + (bArr[i14] & 255);
                    int i16 = i15 + 1;
                    long j16 = j15 + (bArr[i15] & 255);
                    int i17 = i16 + 1;
                    long j17 = j16 + (bArr[i16] & 255);
                    int i18 = i17 + 1;
                    long j18 = j17 + (bArr[i17] & 255);
                    int i19 = i18 + 1;
                    long j19 = j18 + (bArr[i18] & 255);
                    int i20 = i19 + 1;
                    long j20 = j19 + (bArr[i19] & 255);
                    int i21 = i20 + 1;
                    long j21 = j20 + (bArr[i20] & 255);
                    i = i21 + 1;
                    j5 = j21 + (bArr[i21] & 255);
                    j6 = j6 + j7 + j8 + j9 + j10 + j11 + j12 + j13 + j14 + j15 + j16 + j17 + j18 + j19 + j20 + j21 + j5;
                    i7 -= 16;
                }
                int i22 = i;
                long j22 = j5;
                long j23 = j6;
                if (i7 != 0) {
                    long j24 = j5;
                    do {
                        i22 = i + 1;
                        j3 = j24 + (bArr[i] & 255);
                        j4 = j6 + j3;
                        i3 = i7 - 1;
                        i = i22;
                        i7 = i3;
                        j24 = j3;
                        j6 = j4;
                    } while (i3 != 0);
                    j23 = j4;
                    j22 = j3;
                }
                i = i22;
                j5 = j22 % 65521;
                j6 = j23 % 65521;
                i2 = i6;
            }
            j2 = (j6 << 16) | j5;
        }
        return j2;
    }
}
