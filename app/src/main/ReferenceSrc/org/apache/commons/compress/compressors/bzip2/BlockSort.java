package org.apache.commons.compress.compressors.bzip2;

import android.support.v4.media.session.PlaybackStateCompat;
import java.util.BitSet;
import org.apache.commons.compress.compressors.bzip2.BZip2CompressorOutputStream;

/* loaded from: classes.jar:org/apache/commons/compress/compressors/bzip2/BlockSort.class */
class BlockSort {
    private static final int CLEARMASK = -2097153;
    private static final int DEPTH_THRESH = 10;
    private static final int FALLBACK_QSORT_SMALL_THRESH = 10;
    private static final int FALLBACK_QSORT_STACK_SIZE = 100;
    private static final int[] INCS = {1, 4, 13, 40, 121, 364, 1093, 3280, 9841, 29524, 88573, 265720, 797161, 2391484};
    private static final int QSORT_STACK_SIZE = 1000;
    private static final int SETMASK = 2097152;
    private static final int SMALL_THRESH = 20;
    private static final int STACK_SIZE = 1000;
    private static final int WORK_FACTOR = 30;
    private int[] eclass;
    private boolean firstAttempt;
    private final char[] quadrant;
    private int workDone;
    private int workLimit;
    private final int[] stack_ll = new int[1000];
    private final int[] stack_hh = new int[1000];
    private final int[] stack_dd = new int[1000];
    private final int[] mainSort_runningOrder = new int[256];
    private final int[] mainSort_copy = new int[256];
    private final boolean[] mainSort_bigDone = new boolean[256];
    private final int[] ftab = new int[65537];

    BlockSort(BZip2CompressorOutputStream.Data data) {
        this.quadrant = data.sfmap;
    }

    private void fallbackQSort3(int[] iArr, int[] iArr2, int i, int i2) {
        int i3;
        int i4;
        long j = 0;
        fpush(0, i, i2);
        int i5 = 0 + 1;
        while (i5 > 0) {
            int i6 = i5 - 1;
            int[] fpop = fpop(i6);
            int i7 = fpop[0];
            int i8 = fpop[1];
            if (i8 - i7 < 10) {
                fallbackSimpleSort(iArr, iArr2, i7, i8);
                i5 = i6;
            } else {
                long j2 = ((7621 * j) + 1) % PlaybackStateCompat.ACTION_PREPARE_FROM_MEDIA_ID;
                long j3 = j2 % 3;
                long j4 = j3 == 0 ? iArr2[iArr[i7]] : j3 == 1 ? iArr2[iArr[(i7 + i8) >>> 1]] : iArr2[iArr[i8]];
                int i9 = i7;
                int i10 = i7;
                int i11 = i8;
                int i12 = i8;
                while (true) {
                    if (i10 > i12) {
                        i4 = i12;
                        i3 = i11;
                    } else {
                        int i13 = iArr2[iArr[i10]] - ((int) j4);
                        if (i13 == 0) {
                            fswap(iArr, i10, i9);
                            i9++;
                            i10++;
                        } else {
                            i3 = i11;
                            i4 = i12;
                            if (i13 <= 0) {
                                i10++;
                            }
                        }
                    }
                    while (i10 <= i4) {
                        int i14 = iArr2[iArr[i4]] - ((int) j4);
                        if (i14 != 0) {
                            if (i14 < 0) {
                                break;
                            }
                            i4--;
                        } else {
                            fswap(iArr, i4, i3);
                            i3--;
                            i4--;
                        }
                    }
                    if (i10 > i4) {
                        break;
                    }
                    fswap(iArr, i10, i4);
                    i10++;
                    i12 = i4 - 1;
                    i11 = i3;
                }
                j = j2;
                i5 = i6;
                if (i3 >= i9) {
                    int fmin = fmin(i9 - i7, i10 - i9);
                    fvswap(iArr, i7, i10 - fmin, fmin);
                    int fmin2 = fmin(i8 - i3, i3 - i4);
                    fvswap(iArr, i4 + 1, (i8 - fmin2) + 1, fmin2);
                    int i15 = ((i7 + i10) - i9) - 1;
                    int i16 = (i8 - (i3 - i4)) + 1;
                    if (i15 - i7 > i8 - i16) {
                        int i17 = i6 + 1;
                        fpush(i6, i7, i15);
                        i5 = i17 + 1;
                        fpush(i17, i16, i8);
                        j = j2;
                    } else {
                        int i18 = i6 + 1;
                        fpush(i6, i16, i8);
                        i5 = i18 + 1;
                        fpush(i18, i7, i15);
                        j = j2;
                    }
                }
            }
        }
    }

    private void fallbackSimpleSort(int[] iArr, int[] iArr2, int i, int i2) {
        if (i == i2) {
            return;
        }
        if (i2 - i > 3) {
            for (int i3 = i2 - 4; i3 >= i; i3--) {
                int i4 = iArr[i3];
                int i5 = iArr2[i4];
                int i6 = i3 + 4;
                while (i6 <= i2 && i5 > iArr2[iArr[i6]]) {
                    iArr[i6 - 4] = iArr[i6];
                    i6 += 4;
                }
                iArr[i6 - 4] = i4;
            }
        }
        for (int i7 = i2 - 1; i7 >= i; i7--) {
            int i8 = iArr[i7];
            int i9 = iArr2[i8];
            int i10 = i7 + 1;
            while (i10 <= i2 && i9 > iArr2[iArr[i10]]) {
                iArr[i10 - 1] = iArr[i10];
                i10++;
            }
            iArr[i10 - 1] = i8;
        }
    }

    private int fmin(int i, int i2) {
        if (i >= i2) {
            i = i2;
        }
        return i;
    }

    private int[] fpop(int i) {
        return new int[]{this.stack_ll[i], this.stack_hh[i]};
    }

    private void fpush(int i, int i2, int i3) {
        this.stack_ll[i] = i2;
        this.stack_hh[i] = i3;
    }

    private void fswap(int[] iArr, int i, int i2) {
        int i3 = iArr[i];
        iArr[i] = iArr[i2];
        iArr[i2] = i3;
    }

    private void fvswap(int[] iArr, int i, int i2, int i3) {
        while (i3 > 0) {
            fswap(iArr, i, i2);
            i++;
            i2++;
            i3--;
        }
    }

    private int[] getEclass() {
        int[] iArr;
        if (this.eclass == null) {
            iArr = new int[this.quadrant.length / 2];
            this.eclass = iArr;
        } else {
            iArr = this.eclass;
        }
        return iArr;
    }

    private void mainQSort3(BZip2CompressorOutputStream.Data data, int i, int i2, int i3, int i4) {
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        int i10;
        int i11;
        int[] iArr = this.stack_ll;
        int[] iArr2 = this.stack_hh;
        int[] iArr3 = this.stack_dd;
        int[] iArr4 = data.fmap;
        byte[] bArr = data.block;
        iArr[0] = i;
        iArr2[0] = i2;
        iArr3[0] = i3;
        int i12 = 1;
        while (true) {
            int i13 = i12 - 1;
            if (i13 >= 0) {
                int i14 = iArr[i13];
                int i15 = iArr2[i13];
                int i16 = iArr3[i13];
                if (i15 - i14 < 20 || i16 > 10) {
                    i12 = i13;
                    if (mainSimpleSort(data, i14, i15, i16, i4)) {
                        return;
                    }
                } else {
                    int i17 = i16 + 1;
                    int med3 = med3(bArr[iArr4[i14] + i17], bArr[iArr4[i15] + i17], bArr[iArr4[(i14 + i15) >>> 1] + i17]) & 255;
                    int i18 = i15;
                    int i19 = i15;
                    int i20 = i14;
                    int i21 = i14;
                    while (true) {
                        if (i21 <= i18) {
                            int i22 = (bArr[iArr4[i21] + i17] & 255) - med3;
                            if (i22 == 0) {
                                int i23 = iArr4[i21];
                                i10 = i21 + 1;
                                iArr4[i21] = iArr4[i20];
                                i11 = i20 + 1;
                                iArr4[i20] = i23;
                            } else if (i22 < 0) {
                                i10 = i21 + 1;
                                i11 = i20;
                            }
                            int i24 = i11;
                            i21 = i10;
                            i20 = i24;
                        }
                        while (true) {
                            i5 = i19;
                            i6 = i18;
                            if (i21 > i6) {
                                break;
                            }
                            int i25 = (bArr[iArr4[i6] + i17] & 255) - med3;
                            if (i25 != 0) {
                                if (i25 <= 0) {
                                    break;
                                }
                                i9 = i6 - 1;
                                i19 = i5;
                            } else {
                                int i26 = iArr4[i6];
                                i9 = i6 - 1;
                                iArr4[i6] = iArr4[i5];
                                i19 = i5 - 1;
                                iArr4[i5] = i26;
                            }
                            i18 = i9;
                        }
                        if (i21 > i6) {
                            break;
                        }
                        int i27 = iArr4[i21];
                        iArr4[i21] = iArr4[i6];
                        iArr4[i6] = i27;
                        i21++;
                        i19 = i5;
                        i18 = i6 - 1;
                    }
                    if (i5 < i20) {
                        iArr[i13] = i14;
                        iArr2[i13] = i15;
                        iArr3[i13] = i17;
                        i12 = i13 + 1;
                    } else {
                        int i28 = i20 - i14 < i21 - i20 ? i20 - i14 : i21 - i20;
                        vswap(iArr4, i14, i21 - i28, i28);
                        if (i15 - i5 < i5 - i6) {
                            i7 = i15;
                            i8 = i5;
                        } else {
                            i7 = i5;
                            i8 = i6;
                        }
                        int i29 = i7 - i8;
                        vswap(iArr4, i21, (i15 - i29) + 1, i29);
                        int i30 = ((i14 + i21) - i20) - 1;
                        int i31 = (i15 - (i5 - i6)) + 1;
                        iArr[i13] = i14;
                        iArr2[i13] = i30;
                        iArr3[i13] = i16;
                        int i32 = i13 + 1;
                        iArr[i32] = i30 + 1;
                        iArr2[i32] = i31 - 1;
                        iArr3[i32] = i17;
                        int i33 = i32 + 1;
                        iArr[i33] = i31;
                        iArr2[i33] = i15;
                        iArr3[i33] = i16;
                        i12 = i33 + 1;
                    }
                }
            } else {
                return;
            }
        }
    }

    private boolean mainSimpleSort(BZip2CompressorOutputStream.Data data, int i, int i2, int i3, int i4) {
        int i5;
        boolean z;
        int i6;
        int i7;
        int i8;
        int i9 = (i2 - i) + 1;
        if (i9 < 2) {
            z = this.firstAttempt && this.workDone > this.workLimit;
        } else {
            int i10 = 0;
            while (INCS[i10] < i9) {
                i10++;
            }
            int[] iArr = data.fmap;
            char[] cArr = this.quadrant;
            byte[] bArr = data.block;
            int i11 = i4 + 1;
            boolean z2 = this.firstAttempt;
            int i12 = this.workLimit;
            int i13 = this.workDone;
            loop1: while (true) {
                int i14 = i10 - 1;
                i5 = i13;
                if (i14 < 0) {
                    break;
                }
                int i15 = INCS[i14];
                int i16 = i + i15;
                int i17 = i13;
                while (true) {
                    i10 = i14;
                    i13 = i17;
                    if (i16 <= i2) {
                        int i18 = 3;
                        int i19 = i17;
                        int i20 = i16;
                        while (i20 <= i2 && (i6 = i18 - 1) >= 0) {
                            int i21 = iArr[i20];
                            int i22 = i21 + i3;
                            boolean z3 = false;
                            int i23 = i19;
                            int i24 = i20;
                            int i25 = 0;
                            while (true) {
                                int i26 = i25;
                                if (z3) {
                                    iArr[i24] = i26;
                                    i7 = i24 - i15;
                                    i24 = i7;
                                    if (i7 <= (i + i15) - 1) {
                                        i8 = i23;
                                        break;
                                    }
                                } else {
                                    z3 = true;
                                }
                                int i27 = iArr[i24 - i15];
                                int i28 = i27 + i3;
                                if (bArr[i28 + 1] != bArr[i22 + 1]) {
                                    i7 = i24;
                                    i8 = i23;
                                    if ((bArr[i28 + 1] & 255) > (bArr[i22 + 1] & 255)) {
                                        i25 = i27;
                                    }
                                } else if (bArr[i28 + 2] != bArr[i22 + 2]) {
                                    i7 = i24;
                                    i8 = i23;
                                    if ((bArr[i28 + 2] & 255) > (bArr[i22 + 2] & 255)) {
                                        i25 = i27;
                                    }
                                } else if (bArr[i28 + 3] != bArr[i22 + 3]) {
                                    i7 = i24;
                                    i8 = i23;
                                    if ((bArr[i28 + 3] & 255) > (bArr[i22 + 3] & 255)) {
                                        i25 = i27;
                                    }
                                } else if (bArr[i28 + 4] != bArr[i22 + 4]) {
                                    i7 = i24;
                                    i8 = i23;
                                    if ((bArr[i28 + 4] & 255) > (bArr[i22 + 4] & 255)) {
                                        i25 = i27;
                                    }
                                } else if (bArr[i28 + 5] == bArr[i22 + 5]) {
                                    int i29 = i28 + 6;
                                    int i30 = i22 + 6;
                                    if (bArr[i29] == bArr[i30]) {
                                        int i31 = i4;
                                        while (true) {
                                            i7 = i24;
                                            i8 = i23;
                                            if (i31 > 0) {
                                                i31 -= 4;
                                                if (bArr[i29 + 1] != bArr[i30 + 1]) {
                                                    i7 = i24;
                                                    i8 = i23;
                                                    if ((bArr[i29 + 1] & 255) > (bArr[i30 + 1] & 255)) {
                                                        i25 = i27;
                                                    }
                                                } else if (cArr[i29] != cArr[i30]) {
                                                    i7 = i24;
                                                    i8 = i23;
                                                    if (cArr[i29] > cArr[i30]) {
                                                        i25 = i27;
                                                    }
                                                } else if (bArr[i29 + 2] != bArr[i30 + 2]) {
                                                    i7 = i24;
                                                    i8 = i23;
                                                    if ((bArr[i29 + 2] & 255) > (bArr[i30 + 2] & 255)) {
                                                        i25 = i27;
                                                    }
                                                } else if (cArr[i29 + 1] != cArr[i30 + 1]) {
                                                    i7 = i24;
                                                    i8 = i23;
                                                    if (cArr[i29 + 1] > cArr[i30 + 1]) {
                                                        i25 = i27;
                                                    }
                                                } else if (bArr[i29 + 3] != bArr[i30 + 3]) {
                                                    i7 = i24;
                                                    i8 = i23;
                                                    if ((bArr[i29 + 3] & 255) > (bArr[i30 + 3] & 255)) {
                                                        i25 = i27;
                                                    }
                                                } else if (cArr[i29 + 2] != cArr[i30 + 2]) {
                                                    i7 = i24;
                                                    i8 = i23;
                                                    if (cArr[i29 + 2] > cArr[i30 + 2]) {
                                                        i25 = i27;
                                                    }
                                                } else if (bArr[i29 + 4] != bArr[i30 + 4]) {
                                                    i7 = i24;
                                                    i8 = i23;
                                                    if ((bArr[i29 + 4] & 255) > (bArr[i30 + 4] & 255)) {
                                                        i25 = i27;
                                                    }
                                                } else if (cArr[i29 + 3] == cArr[i30 + 3]) {
                                                    int i32 = i29 + 4;
                                                    int i33 = i32;
                                                    if (i32 >= i11) {
                                                        i33 = i32 - i11;
                                                    }
                                                    int i34 = i30 + 4;
                                                    i30 = i34;
                                                    if (i34 >= i11) {
                                                        i30 = i34 - i11;
                                                    }
                                                    i23++;
                                                    i29 = i33;
                                                } else {
                                                    i7 = i24;
                                                    i8 = i23;
                                                    if (cArr[i29 + 3] > cArr[i30 + 3]) {
                                                        i25 = i27;
                                                    }
                                                }
                                            }
                                        }
                                    } else {
                                        i7 = i24;
                                        i8 = i23;
                                        if ((bArr[i29] & 255) > (bArr[i30] & 255)) {
                                            i25 = i27;
                                        }
                                    }
                                } else {
                                    i7 = i24;
                                    i8 = i23;
                                    if ((bArr[i28 + 5] & 255) > (bArr[i22 + 5] & 255)) {
                                        i25 = i27;
                                    }
                                }
                            }
                            iArr[i7] = i21;
                            i20++;
                            i18 = i6;
                            i19 = i8;
                        }
                        i16 = i20;
                        i17 = i19;
                        if (z2) {
                            i16 = i20;
                            i17 = i19;
                            if (i20 <= i2) {
                                i16 = i20;
                                i17 = i19;
                                if (i19 > i12) {
                                    i5 = i19;
                                    break loop1;
                                }
                            } else {
                                continue;
                            }
                        }
                    }
                }
            }
            this.workDone = i5;
            z = z2 && i5 > i12;
        }
        return z;
    }

    private static byte med3(byte b, byte b2, byte b3) {
        byte b4;
        if (b < b2) {
            b4 = b2 < b3 ? b2 : b < b3 ? b3 : b;
        } else {
            b4 = b2;
            if (b2 <= b3) {
                b4 = b > b3 ? b3 : b;
            }
        }
        return b4;
    }

    private static void vswap(int[] iArr, int i, int i2, int i3) {
        for (int i4 = i; i4 < i3 + i; i4++) {
            int i5 = iArr[i4];
            iArr[i4] = iArr[i2];
            iArr[i2] = i5;
            i2++;
        }
    }

    void blockSort(BZip2CompressorOutputStream.Data data, int i) {
        this.workLimit = i * 30;
        this.workDone = 0;
        this.firstAttempt = true;
        if (i + 1 < 10000) {
            fallbackSort(data, i);
        } else {
            mainSort(data, i);
            if (this.firstAttempt && this.workDone > this.workLimit) {
                fallbackSort(data, i);
            }
        }
        int[] iArr = data.fmap;
        data.origPtr = -1;
        for (int i2 = 0; i2 <= i; i2++) {
            if (iArr[i2] == 0) {
                data.origPtr = i2;
                return;
            }
        }
    }

    final void fallbackSort(BZip2CompressorOutputStream.Data data, int i) {
        data.block[0] = data.block[i + 1];
        fallbackSort(data.fmap, data.block, i + 1);
        for (int i2 = 0; i2 < i + 1; i2++) {
            int[] iArr = data.fmap;
            iArr[i2] = iArr[i2] - 1;
        }
        for (int i3 = 0; i3 < i + 1; i3++) {
            if (data.fmap[i3] == -1) {
                data.fmap[i3] = i;
                return;
            }
        }
    }

    final void fallbackSort(int[] iArr, byte[] bArr, int i) {
        int i2;
        int nextSetBit;
        int[] iArr2 = new int[257];
        int[] eclass = getEclass();
        for (int i3 = 0; i3 < i; i3++) {
            eclass[i3] = 0;
        }
        for (int i4 = 0; i4 < i; i4++) {
            int i5 = bArr[i4] & 255;
            iArr2[i5] = iArr2[i5] + 1;
        }
        for (int i6 = 1; i6 < 257; i6++) {
            iArr2[i6] = iArr2[i6] + iArr2[i6 - 1];
        }
        for (int i7 = 0; i7 < i; i7++) {
            int i8 = bArr[i7] & 255;
            int i9 = iArr2[i8] - 1;
            iArr2[i8] = i9;
            iArr[i9] = i7;
        }
        BitSet bitSet = new BitSet(i + 64);
        for (int i10 = 0; i10 < 256; i10++) {
            bitSet.set(iArr2[i10]);
        }
        for (int i11 = 0; i11 < 32; i11++) {
            bitSet.set((i11 * 2) + i);
            bitSet.clear((i11 * 2) + i + 1);
        }
        int i12 = 1;
        do {
            int i13 = 0;
            for (int i14 = 0; i14 < i; i14++) {
                if (bitSet.get(i14)) {
                    i13 = i14;
                }
                int i15 = iArr[i14] - i12;
                int i16 = i15;
                if (i15 < 0) {
                    i16 = i15 + i;
                }
                eclass[i16] = i13;
            }
            i2 = 0;
            int i17 = -1;
            while (true) {
                int nextClearBit = bitSet.nextClearBit(i17 + 1);
                int i18 = nextClearBit - 1;
                if (i18 < i && (nextSetBit = bitSet.nextSetBit(nextClearBit + 1) - 1) < i) {
                    i17 = nextSetBit;
                    if (nextSetBit > i18) {
                        int i19 = i2 + (nextSetBit - i18) + 1;
                        fallbackQSort3(iArr, eclass, i18, nextSetBit);
                        int i20 = -1;
                        while (true) {
                            int i21 = i20;
                            i2 = i19;
                            i17 = nextSetBit;
                            if (i18 <= nextSetBit) {
                                int i22 = eclass[iArr[i18]];
                                int i23 = i21;
                                if (i21 != i22) {
                                    bitSet.set(i18);
                                    i23 = i22;
                                }
                                i18++;
                                i20 = i23;
                            }
                        }
                    }
                }
            }
            i12 *= 2;
            if (i12 > i) {
                return;
            }
        } while (i2 != 0);
    }

    final void mainSort(BZip2CompressorOutputStream.Data data, int i) {
        int i2;
        int[] iArr = this.mainSort_runningOrder;
        int[] iArr2 = this.mainSort_copy;
        boolean[] zArr = this.mainSort_bigDone;
        int[] iArr3 = this.ftab;
        byte[] bArr = data.block;
        int[] iArr4 = data.fmap;
        char[] cArr = this.quadrant;
        int i3 = this.workLimit;
        boolean z = this.firstAttempt;
        int i4 = 65537;
        while (true) {
            i4--;
            if (i4 < 0) {
                break;
            }
            iArr3[i4] = 0;
        }
        for (int i5 = 0; i5 < 20; i5++) {
            bArr[i + i5 + 2] = bArr[(i5 % (i + 1)) + 1];
        }
        int i6 = i + 20 + 1;
        while (true) {
            i6--;
            if (i6 < 0) {
                break;
            }
            cArr[i6] = (char) 0;
        }
        bArr[0] = bArr[i + 1];
        int i7 = bArr[0] & 255;
        for (int i8 = 0; i8 <= i; i8++) {
            int i9 = bArr[i8 + 1] & 255;
            int i10 = (i7 << 8) + i9;
            iArr3[i10] = iArr3[i10] + 1;
            i7 = i9;
        }
        for (int i11 = 1; i11 <= 65536; i11++) {
            iArr3[i11] = iArr3[i11] + iArr3[i11 - 1];
        }
        int i12 = bArr[1] & 255;
        for (int i13 = 0; i13 < i; i13++) {
            int i14 = bArr[i13 + 2] & 255;
            int i15 = (i12 << 8) + i14;
            int i16 = iArr3[i15] - 1;
            iArr3[i15] = i16;
            iArr4[i16] = i13;
            i12 = i14;
        }
        int i17 = ((bArr[i + 1] & 255) << 8) + (bArr[1] & 255);
        int i18 = iArr3[i17] - 1;
        iArr3[i17] = i18;
        iArr4[i18] = i;
        int i19 = 256;
        while (true) {
            i19--;
            if (i19 < 0) {
                break;
            }
            zArr[i19] = false;
            iArr[i19] = i19;
        }
        int i20 = 364;
        while (i20 != 1) {
            int i21 = i20 / 3;
            int i22 = i21;
            while (true) {
                i20 = i21;
                if (i22 <= 255) {
                    int i23 = iArr[i22];
                    int i24 = iArr3[(i23 + 1) << 8];
                    int i25 = iArr3[i23 << 8];
                    int i26 = i22;
                    int i27 = iArr[i26 - i21];
                    while (true) {
                        int i28 = i27;
                        i2 = i26;
                        if (iArr3[(i28 + 1) << 8] - iArr3[i28 << 8] > i24 - i25) {
                            iArr[i26] = i28;
                            i26 -= i21;
                            if (i26 <= i21 - 1) {
                                i2 = i26;
                                break;
                            }
                            i27 = iArr[i26 - i21];
                        }
                    }
                    iArr[i2] = i23;
                    i22++;
                }
            }
        }
        for (int i29 = 0; i29 <= 255; i29++) {
            int i30 = iArr[i29];
            for (int i31 = 0; i31 <= 255; i31++) {
                int i32 = (i30 << 8) + i31;
                int i33 = iArr3[i32];
                if ((2097152 & i33) != 2097152) {
                    int i34 = i33 & CLEARMASK;
                    int i35 = (iArr3[i32 + 1] & CLEARMASK) - 1;
                    if (i35 > i34) {
                        mainQSort3(data, i34, i35, 2, i);
                        if (z && this.workDone > i3) {
                            return;
                        }
                    }
                    iArr3[i32] = 2097152 | i33;
                }
            }
            for (int i36 = 0; i36 <= 255; i36++) {
                iArr2[i36] = iArr3[(i36 << 8) + i30] & CLEARMASK;
            }
            int i37 = iArr3[(i30 + 1) << 8];
            for (int i38 = iArr3[i30 << 8] & CLEARMASK; i38 < (i37 & CLEARMASK); i38++) {
                int i39 = iArr4[i38];
                int i40 = bArr[i39] & 255;
                if (!zArr[i40]) {
                    iArr4[iArr2[i40]] = i39 == 0 ? i : i39 - 1;
                    iArr2[i40] = iArr2[i40] + 1;
                }
            }
            int i41 = 256;
            while (true) {
                i41--;
                if (i41 < 0) {
                    break;
                }
                int i42 = (i41 << 8) + i30;
                iArr3[i42] = iArr3[i42] | 2097152;
            }
            zArr[i30] = true;
            if (i29 < 255) {
                int i43 = iArr3[i30 << 8] & CLEARMASK;
                int i44 = (iArr3[(i30 + 1) << 8] & CLEARMASK) - i43;
                int i45 = 0;
                while ((i44 >> i45) > 65534) {
                    i45++;
                }
                for (int i46 = 0; i46 < i44; i46++) {
                    int i47 = iArr4[i43 + i46];
                    char c = (char) (i46 >> i45);
                    cArr[i47] = c;
                    if (i47 < 20) {
                        cArr[i47 + i + 1] = c;
                    }
                }
            }
        }
    }
}
