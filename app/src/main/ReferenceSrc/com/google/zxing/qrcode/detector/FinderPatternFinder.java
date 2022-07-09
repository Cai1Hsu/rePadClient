package com.google.zxing.qrcode.detector;

import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitMatrix;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/qrcode/detector/FinderPatternFinder.class */
public class FinderPatternFinder {
    private static final int CENTER_QUORUM = 2;
    private static final int INTEGER_MATH_SHIFT = 8;
    protected static final int MAX_MODULES = 57;
    protected static final int MIN_SKIP = 3;
    private final int[] crossCheckStateCount;
    private boolean hasSkipped;
    private final BitMatrix image;
    private final List<FinderPattern> possibleCenters;
    private final ResultPointCallback resultPointCallback;

    /* loaded from: classes.jar:com/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator.class */
    private static class CenterComparator implements Comparator<FinderPattern>, Serializable {
        private final float average;

        private CenterComparator(float f) {
            this.average = f;
        }

        public int compare(FinderPattern finderPattern, FinderPattern finderPattern2) {
            int count;
            if (finderPattern2.getCount() == finderPattern.getCount()) {
                float abs = Math.abs(finderPattern2.getEstimatedModuleSize() - this.average);
                float abs2 = Math.abs(finderPattern.getEstimatedModuleSize() - this.average);
                count = abs < abs2 ? 1 : abs == abs2 ? 0 : -1;
            } else {
                count = finderPattern2.getCount() - finderPattern.getCount();
            }
            return count;
        }
    }

    /* loaded from: classes.jar:com/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator.class */
    private static class FurthestFromAverageComparator implements Comparator<FinderPattern>, Serializable {
        private final float average;

        private FurthestFromAverageComparator(float f) {
            this.average = f;
        }

        public int compare(FinderPattern finderPattern, FinderPattern finderPattern2) {
            float abs = Math.abs(finderPattern2.getEstimatedModuleSize() - this.average);
            float abs2 = Math.abs(finderPattern.getEstimatedModuleSize() - this.average);
            return abs < abs2 ? -1 : abs == abs2 ? 0 : 1;
        }
    }

    public FinderPatternFinder(BitMatrix bitMatrix) {
        this(bitMatrix, null);
    }

    public FinderPatternFinder(BitMatrix bitMatrix, ResultPointCallback resultPointCallback) {
        this.image = bitMatrix;
        this.possibleCenters = new ArrayList();
        this.crossCheckStateCount = new int[5];
        this.resultPointCallback = resultPointCallback;
    }

    private static float centerFromEnd(int[] iArr, int i) {
        return ((i - iArr[4]) - iArr[3]) - (iArr[2] / 2.0f);
    }

    private float crossCheckHorizontal(int i, int i2, int i3, int i4) {
        float f;
        BitMatrix bitMatrix = this.image;
        int width = bitMatrix.getWidth();
        int[] crossCheckStateCount = getCrossCheckStateCount();
        int i5 = i;
        while (i5 >= 0 && bitMatrix.get(i5, i2)) {
            crossCheckStateCount[2] = crossCheckStateCount[2] + 1;
            i5--;
        }
        int i6 = i5;
        if (i5 < 0) {
            f = Float.NaN;
        } else {
            while (i6 >= 0 && !bitMatrix.get(i6, i2) && crossCheckStateCount[1] <= i3) {
                crossCheckStateCount[1] = crossCheckStateCount[1] + 1;
                i6--;
            }
            if (i6 < 0 || crossCheckStateCount[1] > i3) {
                f = Float.NaN;
            } else {
                while (i6 >= 0 && bitMatrix.get(i6, i2) && crossCheckStateCount[0] <= i3) {
                    crossCheckStateCount[0] = crossCheckStateCount[0] + 1;
                    i6--;
                }
                if (crossCheckStateCount[0] > i3) {
                    f = Float.NaN;
                } else {
                    while (true) {
                        i++;
                        if (i >= width || !bitMatrix.get(i, i2)) {
                            break;
                        }
                        crossCheckStateCount[2] = crossCheckStateCount[2] + 1;
                    }
                    int i7 = i;
                    if (i == width) {
                        f = Float.NaN;
                    } else {
                        while (i7 < width && !bitMatrix.get(i7, i2) && crossCheckStateCount[3] < i3) {
                            crossCheckStateCount[3] = crossCheckStateCount[3] + 1;
                            i7++;
                        }
                        if (i7 == width || crossCheckStateCount[3] >= i3) {
                            f = Float.NaN;
                        } else {
                            while (i7 < width && bitMatrix.get(i7, i2) && crossCheckStateCount[4] < i3) {
                                crossCheckStateCount[4] = crossCheckStateCount[4] + 1;
                                i7++;
                            }
                            f = crossCheckStateCount[4] >= i3 ? Float.NaN : Math.abs(((((crossCheckStateCount[0] + crossCheckStateCount[1]) + crossCheckStateCount[2]) + crossCheckStateCount[3]) + crossCheckStateCount[4]) - i4) * 5 >= i4 ? Float.NaN : foundPatternCross(crossCheckStateCount) ? centerFromEnd(crossCheckStateCount, i7) : Float.NaN;
                        }
                    }
                }
            }
        }
        return f;
    }

    private float crossCheckVertical(int i, int i2, int i3, int i4) {
        float f;
        BitMatrix bitMatrix = this.image;
        int height = bitMatrix.getHeight();
        int[] crossCheckStateCount = getCrossCheckStateCount();
        int i5 = i;
        while (i5 >= 0 && bitMatrix.get(i2, i5)) {
            crossCheckStateCount[2] = crossCheckStateCount[2] + 1;
            i5--;
        }
        int i6 = i5;
        if (i5 < 0) {
            f = Float.NaN;
        } else {
            while (i6 >= 0 && !bitMatrix.get(i2, i6) && crossCheckStateCount[1] <= i3) {
                crossCheckStateCount[1] = crossCheckStateCount[1] + 1;
                i6--;
            }
            if (i6 < 0 || crossCheckStateCount[1] > i3) {
                f = Float.NaN;
            } else {
                while (i6 >= 0 && bitMatrix.get(i2, i6) && crossCheckStateCount[0] <= i3) {
                    crossCheckStateCount[0] = crossCheckStateCount[0] + 1;
                    i6--;
                }
                if (crossCheckStateCount[0] > i3) {
                    f = Float.NaN;
                } else {
                    int i7 = i + 1;
                    while (i7 < height && bitMatrix.get(i2, i7)) {
                        crossCheckStateCount[2] = crossCheckStateCount[2] + 1;
                        i7++;
                    }
                    int i8 = i7;
                    if (i7 == height) {
                        f = Float.NaN;
                    } else {
                        while (i8 < height && !bitMatrix.get(i2, i8) && crossCheckStateCount[3] < i3) {
                            crossCheckStateCount[3] = crossCheckStateCount[3] + 1;
                            i8++;
                        }
                        if (i8 == height || crossCheckStateCount[3] >= i3) {
                            f = Float.NaN;
                        } else {
                            while (i8 < height && bitMatrix.get(i2, i8) && crossCheckStateCount[4] < i3) {
                                crossCheckStateCount[4] = crossCheckStateCount[4] + 1;
                                i8++;
                            }
                            f = crossCheckStateCount[4] >= i3 ? Float.NaN : Math.abs(((((crossCheckStateCount[0] + crossCheckStateCount[1]) + crossCheckStateCount[2]) + crossCheckStateCount[3]) + crossCheckStateCount[4]) - i4) * 5 >= i4 * 2 ? Float.NaN : foundPatternCross(crossCheckStateCount) ? centerFromEnd(crossCheckStateCount, i8) : Float.NaN;
                        }
                    }
                }
            }
        }
        return f;
    }

    private int findRowSkip() {
        int i;
        if (this.possibleCenters.size() > 1) {
            FinderPattern finderPattern = null;
            Iterator<FinderPattern> it = this.possibleCenters.iterator();
            while (true) {
                i = 0;
                if (!it.hasNext()) {
                    break;
                }
                FinderPattern next = it.next();
                if (next.getCount() >= 2) {
                    if (finderPattern != null) {
                        this.hasSkipped = true;
                        i = ((int) (Math.abs(finderPattern.getX() - next.getX()) - Math.abs(finderPattern.getY() - next.getY()))) / 2;
                        break;
                    }
                    finderPattern = next;
                }
            }
        } else {
            i = 0;
        }
        return i;
    }

    protected static boolean foundPatternCross(int[] iArr) {
        boolean z = false;
        int i = 0;
        int i2 = 0;
        while (true) {
            if (i2 < 5) {
                int i3 = iArr[i2];
                if (i3 == 0) {
                    break;
                }
                i += i3;
                i2++;
            } else if (i >= 7) {
                int i4 = (i << 8) / 7;
                int i5 = i4 / 2;
                z = Math.abs(i4 - (iArr[0] << 8)) < i5 && Math.abs(i4 - (iArr[1] << 8)) < i5 && Math.abs((i4 * 3) - (iArr[2] << 8)) < i5 * 3 && Math.abs(i4 - (iArr[3] << 8)) < i5 && Math.abs(i4 - (iArr[4] << 8)) < i5;
            }
        }
        return z;
    }

    private int[] getCrossCheckStateCount() {
        this.crossCheckStateCount[0] = 0;
        this.crossCheckStateCount[1] = 0;
        this.crossCheckStateCount[2] = 0;
        this.crossCheckStateCount[3] = 0;
        this.crossCheckStateCount[4] = 0;
        return this.crossCheckStateCount;
    }

    private boolean haveMultiplyConfirmedCenters() {
        boolean z = false;
        int i = 0;
        float f = 0.0f;
        int size = this.possibleCenters.size();
        for (FinderPattern finderPattern : this.possibleCenters) {
            if (finderPattern.getCount() >= 2) {
                i++;
                f += finderPattern.getEstimatedModuleSize();
            }
        }
        if (i >= 3) {
            float f2 = f / size;
            float f3 = 0.0f;
            for (FinderPattern finderPattern2 : this.possibleCenters) {
                f3 += Math.abs(finderPattern2.getEstimatedModuleSize() - f2);
            }
            if (f3 <= 0.05f * f) {
                z = true;
            }
        }
        return z;
    }

    private FinderPattern[] selectBestPatterns() throws NotFoundException {
        int size = this.possibleCenters.size();
        if (size < 3) {
            throw NotFoundException.getNotFoundInstance();
        }
        if (size > 3) {
            float f = 0.0f;
            float f2 = 0.0f;
            for (FinderPattern finderPattern : this.possibleCenters) {
                float estimatedModuleSize = finderPattern.getEstimatedModuleSize();
                f += estimatedModuleSize;
                f2 += estimatedModuleSize * estimatedModuleSize;
            }
            float f3 = f / size;
            float sqrt = (float) Math.sqrt((f2 / size) - (f3 * f3));
            Collections.sort(this.possibleCenters, new FurthestFromAverageComparator(f3));
            float max = Math.max(0.2f * f3, sqrt);
            int i = 0;
            while (true) {
                int i2 = i;
                if (i2 >= this.possibleCenters.size() || this.possibleCenters.size() <= 3) {
                    break;
                }
                int i3 = i2;
                if (Math.abs(this.possibleCenters.get(i2).getEstimatedModuleSize() - f3) > max) {
                    this.possibleCenters.remove(i2);
                    i3 = i2 - 1;
                }
                i = i3 + 1;
            }
        }
        if (this.possibleCenters.size() > 3) {
            float f4 = 0.0f;
            for (FinderPattern finderPattern2 : this.possibleCenters) {
                f4 += finderPattern2.getEstimatedModuleSize();
            }
            Collections.sort(this.possibleCenters, new CenterComparator(f4 / this.possibleCenters.size()));
            this.possibleCenters.subList(3, this.possibleCenters.size()).clear();
        }
        return new FinderPattern[]{this.possibleCenters.get(0), this.possibleCenters.get(1), this.possibleCenters.get(2)};
    }

    FinderPatternInfo find(Map<DecodeHintType, ?> map) throws NotFoundException {
        int i;
        boolean z;
        int i2;
        boolean z2 = map != null && map.containsKey(DecodeHintType.TRY_HARDER);
        int height = this.image.getHeight();
        int width = this.image.getWidth();
        int i3 = (height * 3) / 228;
        if (i3 < 3 || z2) {
            i3 = 3;
        }
        boolean z3 = false;
        int[] iArr = new int[5];
        int i4 = i3 - 1;
        while (i4 < height && !z3) {
            iArr[0] = 0;
            iArr[1] = 0;
            iArr[2] = 0;
            iArr[3] = 0;
            iArr[4] = 0;
            int i5 = 0;
            int i6 = 0;
            int i7 = i3;
            while (i6 < width) {
                if (this.image.get(i6, i4)) {
                    i = i5;
                    if ((i5 & 1) == 1) {
                        i = i5 + 1;
                    }
                    iArr[i] = iArr[i] + 1;
                } else if ((i5 & 1) != 0) {
                    iArr[i5] = iArr[i5] + 1;
                    i = i5;
                } else if (i5 != 4) {
                    i = i5 + 1;
                    iArr[i] = iArr[i] + 1;
                } else if (!foundPatternCross(iArr)) {
                    iArr[0] = iArr[2];
                    iArr[1] = iArr[3];
                    iArr[2] = iArr[4];
                    iArr[3] = 1;
                    iArr[4] = 0;
                    i = 3;
                } else if (handlePossibleCenter(iArr, i4, i6)) {
                    if (this.hasSkipped) {
                        z = haveMultiplyConfirmedCenters();
                        i2 = i4;
                    } else {
                        int findRowSkip = findRowSkip();
                        z = z3;
                        i2 = i4;
                        if (findRowSkip > iArr[2]) {
                            i2 = i4 + ((findRowSkip - iArr[2]) - 2);
                            i6 = width - 1;
                            z = z3;
                        }
                    }
                    i = 0;
                    iArr[0] = 0;
                    iArr[1] = 0;
                    iArr[2] = 0;
                    iArr[3] = 0;
                    iArr[4] = 0;
                    z3 = z;
                    i4 = i2;
                    i7 = 2;
                } else {
                    iArr[0] = iArr[2];
                    iArr[1] = iArr[3];
                    iArr[2] = iArr[4];
                    iArr[3] = 1;
                    iArr[4] = 0;
                    i = 3;
                }
                i6++;
                i5 = i;
            }
            boolean z4 = z3;
            i3 = i7;
            if (foundPatternCross(iArr)) {
                z4 = z3;
                i3 = i7;
                if (handlePossibleCenter(iArr, i4, width)) {
                    int i8 = iArr[0];
                    z4 = z3;
                    i3 = i8;
                    if (this.hasSkipped) {
                        z4 = haveMultiplyConfirmedCenters();
                        i3 = i8;
                    }
                }
            }
            i4 += i3;
            z3 = z4;
        }
        FinderPattern[] selectBestPatterns = selectBestPatterns();
        ResultPoint.orderBestPatterns(selectBestPatterns);
        return new FinderPatternInfo(selectBestPatterns);
    }

    protected BitMatrix getImage() {
        return this.image;
    }

    protected List<FinderPattern> getPossibleCenters() {
        return this.possibleCenters;
    }

    protected boolean handlePossibleCenter(int[] iArr, int i, int i2) {
        boolean z;
        boolean z2;
        int i3 = iArr[0] + iArr[1] + iArr[2] + iArr[3] + iArr[4];
        float centerFromEnd = centerFromEnd(iArr, i2);
        float crossCheckVertical = crossCheckVertical(i, (int) centerFromEnd, iArr[2], i3);
        if (!Float.isNaN(crossCheckVertical)) {
            float crossCheckHorizontal = crossCheckHorizontal((int) centerFromEnd, (int) crossCheckVertical, iArr[2], i3);
            if (!Float.isNaN(crossCheckHorizontal)) {
                float f = i3 / 7.0f;
                int i4 = 0;
                while (true) {
                    z2 = false;
                    if (i4 >= this.possibleCenters.size()) {
                        break;
                    }
                    FinderPattern finderPattern = this.possibleCenters.get(i4);
                    if (finderPattern.aboutEquals(f, crossCheckVertical, crossCheckHorizontal)) {
                        this.possibleCenters.set(i4, finderPattern.combineEstimate(crossCheckVertical, crossCheckHorizontal, f));
                        z2 = true;
                        break;
                    }
                    i4++;
                }
                if (!z2) {
                    FinderPattern finderPattern2 = new FinderPattern(crossCheckHorizontal, crossCheckVertical, f);
                    this.possibleCenters.add(finderPattern2);
                    if (this.resultPointCallback != null) {
                        this.resultPointCallback.foundPossibleResultPoint(finderPattern2);
                    }
                }
                z = true;
                return z;
            }
        }
        z = false;
        return z;
    }
}
