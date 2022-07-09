package com.google.zxing.oned.rss;

/* loaded from: classes.jar:com/google/zxing/oned/rss/RSSUtils.class */
public final class RSSUtils {
    private RSSUtils() {
    }

    private static int combins(int i, int i2) {
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        if (i - i2 > i2) {
            i3 = i2;
            i4 = i - i2;
        } else {
            i3 = i - i2;
            i4 = i2;
        }
        int i8 = 1;
        int i9 = 1;
        int i10 = i;
        while (true) {
            i5 = i9;
            i7 = i8;
            if (i10 > i4) {
                int i11 = i8 * i10;
                i9 = i5;
                i8 = i11;
                if (i5 <= i3) {
                    i8 = i11 / i5;
                    i9 = i5 + 1;
                }
                i10--;
            }
        }
        for (i6 = i5; i6 <= i3; i6++) {
            i7 /= i6;
        }
        return i7;
    }

    static int[] elements(int[] iArr, int i, int i2) {
        int[] iArr2 = new int[iArr.length + 2];
        int i3 = i2 << 1;
        iArr2[0] = 1;
        int i4 = 10;
        int i5 = 1;
        int i6 = 1;
        while (i6 < i3 - 2) {
            iArr2[i6] = iArr[i6 - 1] - iArr2[i6 - 1];
            iArr2[i6 + 1] = iArr[i6] - iArr2[i6];
            i5 += iArr2[i6] + iArr2[i6 + 1];
            int i7 = i4;
            if (iArr2[i6] < i4) {
                i7 = iArr2[i6];
            }
            i6 += 2;
            i4 = i7;
        }
        iArr2[i3 - 1] = i - i5;
        int i8 = i4;
        if (iArr2[i3 - 1] < i4) {
            i8 = iArr2[i3 - 1];
        }
        if (i8 > 1) {
            for (int i9 = 0; i9 < i3; i9 += 2) {
                iArr2[i9] = iArr2[i9] + (i8 - 1);
                int i10 = i9 + 1;
                iArr2[i10] = iArr2[i10] - (i8 - 1);
            }
        }
        return iArr2;
    }

    public static int getRSSvalue(int[] iArr, int i, boolean z) {
        int i2;
        int i3;
        int length = iArr.length;
        int i4 = 0;
        for (int i5 : iArr) {
            i4 += i5;
        }
        int i6 = 0;
        int i7 = 0;
        int i8 = 0;
        int i9 = i4;
        while (i8 < length - 1) {
            int i10 = 1;
            int i11 = i7 | (1 << i8);
            while (true) {
                i2 = i11;
                if (i10 < iArr[i8]) {
                    int combins = combins((i9 - i10) - 1, (length - i8) - 2);
                    int i12 = combins;
                    if (z) {
                        i12 = combins;
                        if (i2 == 0) {
                            i12 = combins;
                            if ((i9 - i10) - ((length - i8) - 1) >= (length - i8) - 1) {
                                i12 = combins - combins((i9 - i10) - (length - i8), (length - i8) - 2);
                            }
                        }
                    }
                    if ((length - i8) - 1 > 1) {
                        int i13 = 0;
                        for (int i14 = (i9 - i10) - ((length - i8) - 2); i14 > i; i14--) {
                            i13 += combins(((i9 - i10) - i14) - 1, (length - i8) - 3);
                        }
                        i3 = i12 - (((length - 1) - i8) * i13);
                    } else {
                        i3 = i12;
                        if (i9 - i10 > i) {
                            i3 = i12 - 1;
                        }
                    }
                    i6 += i3;
                    i10++;
                    i11 = i2 & ((1 << i8) ^ (-1));
                }
            }
            i9 -= i10;
            i8++;
            i7 = i2;
        }
        return i6;
    }

    static int[] getRSSwidths(int i, int i2, int i3, int i4, boolean z) {
        int i5;
        int i6;
        int[] iArr = new int[i3];
        int i7 = 0;
        int i8 = i2;
        int i9 = 0;
        while (i7 < i3 - 1) {
            int i10 = 1;
            int i11 = i;
            int i12 = i9 | (1 << i7);
            while (true) {
                i5 = i12;
                int combins = combins((i8 - i10) - 1, (i3 - i7) - 2);
                int i13 = combins;
                if (z) {
                    i13 = combins;
                    if (i5 == 0) {
                        i13 = combins;
                        if ((i8 - i10) - ((i3 - i7) - 1) >= (i3 - i7) - 1) {
                            i13 = combins - combins((i8 - i10) - (i3 - i7), (i3 - i7) - 2);
                        }
                    }
                }
                if ((i3 - i7) - 1 > 1) {
                    int i14 = 0;
                    for (int i15 = (i8 - i10) - ((i3 - i7) - 2); i15 > i4; i15--) {
                        i14 += combins(((i8 - i10) - i15) - 1, (i3 - i7) - 3);
                    }
                    i6 = i13 - (((i3 - 1) - i7) * i14);
                } else {
                    i6 = i13;
                    if (i8 - i10 > i4) {
                        i6 = i13 - 1;
                    }
                }
                i11 -= i6;
                if (i11 < 0) {
                    break;
                }
                i10++;
                i12 = i5 & ((1 << i7) ^ (-1));
            }
            i8 -= i10;
            iArr[i7] = i10;
            i7++;
            i9 = i5;
            i = i11 + i6;
        }
        iArr[i7] = i8;
        return iArr;
    }
}
