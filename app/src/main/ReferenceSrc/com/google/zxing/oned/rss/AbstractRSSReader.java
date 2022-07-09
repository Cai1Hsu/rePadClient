package com.google.zxing.oned.rss;

import com.google.zxing.NotFoundException;
import com.google.zxing.oned.OneDReader;

/* loaded from: classes.jar:com/google/zxing/oned/rss/AbstractRSSReader.class */
public abstract class AbstractRSSReader extends OneDReader {
    private static final int MAX_AVG_VARIANCE = 51;
    private static final float MAX_FINDER_PATTERN_RATIO = 0.89285713f;
    private static final int MAX_INDIVIDUAL_VARIANCE = 102;
    private static final float MIN_FINDER_PATTERN_RATIO = 0.7916667f;
    private final int[] decodeFinderCounters = new int[4];
    private final int[] dataCharacterCounters = new int[8];
    private final float[] oddRoundingErrors = new float[4];
    private final float[] evenRoundingErrors = new float[4];
    private final int[] oddCounts = new int[this.dataCharacterCounters.length / 2];
    private final int[] evenCounts = new int[this.dataCharacterCounters.length / 2];

    protected AbstractRSSReader() {
    }

    protected static int count(int[] iArr) {
        int i = 0;
        for (int i2 : iArr) {
            i += i2;
        }
        return i;
    }

    protected static void decrement(int[] iArr, float[] fArr) {
        int i = 0;
        float f = fArr[0];
        int i2 = 1;
        while (i2 < iArr.length) {
            float f2 = f;
            if (fArr[i2] < f) {
                f2 = fArr[i2];
                i = i2;
            }
            i2++;
            f = f2;
        }
        iArr[i] = iArr[i] - 1;
    }

    protected static void increment(int[] iArr, float[] fArr) {
        int i = 0;
        float f = fArr[0];
        int i2 = 1;
        while (i2 < iArr.length) {
            float f2 = f;
            if (fArr[i2] > f) {
                f2 = fArr[i2];
                i = i2;
            }
            i2++;
            f = f2;
        }
        iArr[i] = iArr[i] + 1;
    }

    protected static boolean isFinderPattern(int[] iArr) {
        int i;
        boolean z = true;
        float f = (iArr[0] + iArr[1]) / ((iArr[2] + i) + iArr[3]);
        if (f < MIN_FINDER_PATTERN_RATIO || f > MAX_FINDER_PATTERN_RATIO) {
            z = false;
        } else {
            int i2 = Integer.MAX_VALUE;
            int i3 = Integer.MIN_VALUE;
            int length = iArr.length;
            int i4 = 0;
            while (i4 < length) {
                int i5 = iArr[i4];
                int i6 = i3;
                if (i5 > i3) {
                    i6 = i5;
                }
                int i7 = i2;
                if (i5 < i2) {
                    i7 = i5;
                }
                i4++;
                i3 = i6;
                i2 = i7;
            }
            if (i3 >= i2 * 10) {
                z = false;
            }
        }
        return z;
    }

    protected static int parseFinderValue(int[] iArr, int[][] iArr2) throws NotFoundException {
        for (int i = 0; i < iArr2.length; i++) {
            if (patternMatchVariance(iArr, iArr2[i], 102) < 51) {
                return i;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    protected int[] getDataCharacterCounters() {
        return this.dataCharacterCounters;
    }

    protected int[] getDecodeFinderCounters() {
        return this.decodeFinderCounters;
    }

    protected int[] getEvenCounts() {
        return this.evenCounts;
    }

    protected float[] getEvenRoundingErrors() {
        return this.evenRoundingErrors;
    }

    protected int[] getOddCounts() {
        return this.oddCounts;
    }

    protected float[] getOddRoundingErrors() {
        return this.oddRoundingErrors;
    }
}
