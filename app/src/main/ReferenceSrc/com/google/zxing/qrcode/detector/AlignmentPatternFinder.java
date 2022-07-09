package com.google.zxing.qrcode.detector;

import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitMatrix;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.jar:com/google/zxing/qrcode/detector/AlignmentPatternFinder.class */
final class AlignmentPatternFinder {
    private final int height;
    private final BitMatrix image;
    private final float moduleSize;
    private final ResultPointCallback resultPointCallback;
    private final int startX;
    private final int startY;
    private final int width;
    private final List<AlignmentPattern> possibleCenters = new ArrayList(5);
    private final int[] crossCheckStateCount = new int[3];

    AlignmentPatternFinder(BitMatrix bitMatrix, int i, int i2, int i3, int i4, float f, ResultPointCallback resultPointCallback) {
        this.image = bitMatrix;
        this.startX = i;
        this.startY = i2;
        this.width = i3;
        this.height = i4;
        this.moduleSize = f;
        this.resultPointCallback = resultPointCallback;
    }

    private static float centerFromEnd(int[] iArr, int i) {
        return (i - iArr[2]) - (iArr[1] / 2.0f);
    }

    private float crossCheckVertical(int i, int i2, int i3, int i4) {
        BitMatrix bitMatrix = this.image;
        int height = bitMatrix.getHeight();
        int[] iArr = this.crossCheckStateCount;
        iArr[0] = 0;
        iArr[1] = 0;
        iArr[2] = 0;
        int i5 = i;
        while (i5 >= 0 && bitMatrix.get(i2, i5) && iArr[1] <= i3) {
            iArr[1] = iArr[1] + 1;
            i5--;
        }
        float f = Float.NaN;
        if (i5 >= 0) {
            if (iArr[1] > i3) {
                f = Float.NaN;
            } else {
                while (i5 >= 0 && !bitMatrix.get(i2, i5) && iArr[0] <= i3) {
                    iArr[0] = iArr[0] + 1;
                    i5--;
                }
                f = Float.NaN;
                if (iArr[0] <= i3) {
                    while (true) {
                        i++;
                        if (i >= height || !bitMatrix.get(i2, i) || iArr[1] > i3) {
                            break;
                        }
                        iArr[1] = iArr[1] + 1;
                    }
                    f = Float.NaN;
                    if (i != height) {
                        f = Float.NaN;
                        if (iArr[1] <= i3) {
                            while (i < height && !bitMatrix.get(i2, i) && iArr[2] <= i3) {
                                iArr[2] = iArr[2] + 1;
                                i++;
                            }
                            f = Float.NaN;
                            if (iArr[2] <= i3) {
                                f = Float.NaN;
                                if (Math.abs(((iArr[0] + iArr[1]) + iArr[2]) - i4) * 5 < i4 * 2) {
                                    f = Float.NaN;
                                    if (foundPatternCross(iArr)) {
                                        f = centerFromEnd(iArr, i);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return f;
    }

    private boolean foundPatternCross(int[] iArr) {
        boolean z;
        float f = this.moduleSize;
        float f2 = f / 2.0f;
        int i = 0;
        while (true) {
            if (i >= 3) {
                z = true;
                break;
            } else if (Math.abs(f - iArr[i]) >= f2) {
                z = false;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    private AlignmentPattern handlePossibleCenter(int[] iArr, int i, int i2) {
        AlignmentPattern alignmentPattern;
        int i3 = iArr[0];
        int i4 = iArr[1];
        int i5 = iArr[2];
        float centerFromEnd = centerFromEnd(iArr, i2);
        float crossCheckVertical = crossCheckVertical(i, (int) centerFromEnd, iArr[1] * 2, i3 + i4 + i5);
        if (!Float.isNaN(crossCheckVertical)) {
            float f = ((iArr[0] + iArr[1]) + iArr[2]) / 3.0f;
            for (AlignmentPattern alignmentPattern2 : this.possibleCenters) {
                if (alignmentPattern2.aboutEquals(f, crossCheckVertical, centerFromEnd)) {
                    alignmentPattern = alignmentPattern2.combineEstimate(crossCheckVertical, centerFromEnd, f);
                    break;
                }
            }
            AlignmentPattern alignmentPattern3 = new AlignmentPattern(centerFromEnd, crossCheckVertical, f);
            this.possibleCenters.add(alignmentPattern3);
            if (this.resultPointCallback != null) {
                this.resultPointCallback.foundPossibleResultPoint(alignmentPattern3);
            }
        }
        alignmentPattern = null;
        return alignmentPattern;
    }

    /* JADX WARN: Code restructure failed: missing block: B:39:0x0124, code lost:
        if (foundPatternCross(r0) == false) goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0127, code lost:
        r0 = handlePossibleCenter(r0, r0, r0);
        r16 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0138, code lost:
        if (r0 != null) goto L50;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    AlignmentPattern find() throws NotFoundException {
        AlignmentPattern alignmentPattern;
        int i = this.startX;
        int i2 = this.height;
        int i3 = i + this.width;
        int i4 = this.startY;
        int[] iArr = new int[3];
        int i5 = 0;
        loop0: while (true) {
            if (i5 < i2) {
                int i6 = i4 + (i2 >> 1) + ((i5 & 1) == 0 ? (i5 + 1) >> 1 : -((i5 + 1) >> 1));
                iArr[0] = 0;
                iArr[1] = 0;
                iArr[2] = 0;
                int i7 = i;
                while (i7 < i3 && !this.image.get(i7, i6)) {
                    i7++;
                }
                int i8 = i7;
                int i9 = 0;
                while (true) {
                    if (i8 >= i3) {
                        break;
                    }
                    if (!this.image.get(i8, i6)) {
                        int i10 = i9;
                        if (i9 == 1) {
                            i10 = i9 + 1;
                        }
                        iArr[i10] = iArr[i10] + 1;
                        i9 = i10;
                    } else if (i9 == 1) {
                        iArr[i9] = iArr[i9] + 1;
                    } else if (i9 == 2) {
                        if (foundPatternCross(iArr)) {
                            alignmentPattern = handlePossibleCenter(iArr, i6, i8);
                            if (alignmentPattern != null) {
                                break loop0;
                            }
                        }
                        iArr[0] = iArr[2];
                        iArr[1] = 1;
                        iArr[2] = 0;
                        i9 = 1;
                    } else {
                        i9++;
                        iArr[i9] = iArr[i9] + 1;
                    }
                    i8++;
                }
            } else if (this.possibleCenters.isEmpty()) {
                throw NotFoundException.getNotFoundInstance();
            } else {
                alignmentPattern = this.possibleCenters.get(0);
            }
            i5++;
        }
        return alignmentPattern;
    }
}
