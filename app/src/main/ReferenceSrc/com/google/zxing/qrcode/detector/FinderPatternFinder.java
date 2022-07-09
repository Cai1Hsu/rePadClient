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
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
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

    public FinderPatternFinder(BitMatrix image) {
        this(image, null);
    }

    public FinderPatternFinder(BitMatrix image, ResultPointCallback resultPointCallback) {
        this.image = image;
        this.possibleCenters = new ArrayList();
        this.crossCheckStateCount = new int[5];
        this.resultPointCallback = resultPointCallback;
    }

    protected BitMatrix getImage() {
        return this.image;
    }

    protected List<FinderPattern> getPossibleCenters() {
        return this.possibleCenters;
    }

    FinderPatternInfo find(Map<DecodeHintType, ?> hints) throws NotFoundException {
        boolean tryHarder = hints != null && hints.containsKey(DecodeHintType.TRY_HARDER);
        int maxI = this.image.getHeight();
        int maxJ = this.image.getWidth();
        int iSkip = (maxI * 3) / 228;
        if (iSkip < 3 || tryHarder) {
            iSkip = 3;
        }
        boolean done = false;
        int[] stateCount = new int[5];
        int i = iSkip - 1;
        while (i < maxI && !done) {
            stateCount[0] = 0;
            stateCount[1] = 0;
            stateCount[2] = 0;
            stateCount[3] = 0;
            stateCount[4] = 0;
            int currentState = 0;
            int j = 0;
            while (j < maxJ) {
                if (this.image.get(j, i)) {
                    if ((currentState & 1) == 1) {
                        currentState++;
                    }
                    stateCount[currentState] = stateCount[currentState] + 1;
                } else if ((currentState & 1) == 0) {
                    if (currentState == 4) {
                        if (foundPatternCross(stateCount)) {
                            boolean confirmed = handlePossibleCenter(stateCount, i, j);
                            if (confirmed) {
                                iSkip = 2;
                                if (this.hasSkipped) {
                                    done = haveMultiplyConfirmedCenters();
                                } else {
                                    int rowSkip = findRowSkip();
                                    if (rowSkip > stateCount[2]) {
                                        i += (rowSkip - stateCount[2]) - 2;
                                        j = maxJ - 1;
                                    }
                                }
                                currentState = 0;
                                stateCount[0] = 0;
                                stateCount[1] = 0;
                                stateCount[2] = 0;
                                stateCount[3] = 0;
                                stateCount[4] = 0;
                            } else {
                                stateCount[0] = stateCount[2];
                                stateCount[1] = stateCount[3];
                                stateCount[2] = stateCount[4];
                                stateCount[3] = 1;
                                stateCount[4] = 0;
                                currentState = 3;
                            }
                        } else {
                            stateCount[0] = stateCount[2];
                            stateCount[1] = stateCount[3];
                            stateCount[2] = stateCount[4];
                            stateCount[3] = 1;
                            stateCount[4] = 0;
                            currentState = 3;
                        }
                    } else {
                        currentState++;
                        stateCount[currentState] = stateCount[currentState] + 1;
                    }
                } else {
                    stateCount[currentState] = stateCount[currentState] + 1;
                }
                j++;
            }
            if (foundPatternCross(stateCount)) {
                boolean confirmed2 = handlePossibleCenter(stateCount, i, maxJ);
                if (confirmed2) {
                    iSkip = stateCount[0];
                    if (this.hasSkipped) {
                        done = haveMultiplyConfirmedCenters();
                    }
                }
            }
            i += iSkip;
        }
        FinderPattern[] patternInfo = selectBestPatterns();
        ResultPoint.orderBestPatterns(patternInfo);
        return new FinderPatternInfo(patternInfo);
    }

    private static float centerFromEnd(int[] stateCount, int end) {
        return ((end - stateCount[4]) - stateCount[3]) - (stateCount[2] / 2.0f);
    }

    protected static boolean foundPatternCross(int[] stateCount) {
        boolean z = true;
        int totalModuleSize = 0;
        for (int i = 0; i < 5; i++) {
            int count = stateCount[i];
            if (count == 0) {
                return false;
            }
            totalModuleSize += count;
        }
        if (totalModuleSize >= 7) {
            int moduleSize = (totalModuleSize << 8) / 7;
            int maxVariance = moduleSize / 2;
            if (Math.abs(moduleSize - (stateCount[0] << 8)) >= maxVariance || Math.abs(moduleSize - (stateCount[1] << 8)) >= maxVariance || Math.abs((moduleSize * 3) - (stateCount[2] << 8)) >= maxVariance * 3 || Math.abs(moduleSize - (stateCount[3] << 8)) >= maxVariance || Math.abs(moduleSize - (stateCount[4] << 8)) >= maxVariance) {
                z = false;
            }
            return z;
        }
        return false;
    }

    private int[] getCrossCheckStateCount() {
        this.crossCheckStateCount[0] = 0;
        this.crossCheckStateCount[1] = 0;
        this.crossCheckStateCount[2] = 0;
        this.crossCheckStateCount[3] = 0;
        this.crossCheckStateCount[4] = 0;
        return this.crossCheckStateCount;
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x003e, code lost:
        if (r3[1] <= r10) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0043, code lost:
        if (r0 < 0) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0049, code lost:
        if (r1.get(r9, r0) == false) goto L67;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x004e, code lost:
        if (r3[0] > r10) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0050, code lost:
        r3[0] = r3[0] + 1;
        r0 = r0 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x005d, code lost:
        if (r3[0] <= r10) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x005f, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0062, code lost:
        r0 = r8 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0064, code lost:
        if (r0 >= r2) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x006a, code lost:
        if (r1.get(r9, r0) == false) goto L70;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x006c, code lost:
        r3[2] = r3[2] + 1;
        r0 = r0 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0076, code lost:
        if (r0 != r2) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0078, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x007b, code lost:
        if (r0 >= r2) goto L73;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0081, code lost:
        if (r1.get(r9, r0) != false) goto L71;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0086, code lost:
        if (r3[3] >= r10) goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0088, code lost:
        r3[3] = r3[3] + 1;
        r0 = r0 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0092, code lost:
        if (r0 == r2) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x0097, code lost:
        if (r3[3] < r10) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0099, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x009c, code lost:
        if (r0 >= r2) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00a2, code lost:
        if (r1.get(r9, r0) == false) goto L74;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00a7, code lost:
        if (r3[4] >= r10) goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00a9, code lost:
        r3[4] = r3[4] + 1;
        r0 = r0 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00b6, code lost:
        if (r3[4] < r10) goto L54;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x00b8, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x00bc, code lost:
        r4 = (((r3[0] + r3[1]) + r3[2]) + r3[3]) + r3[4];
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x00da, code lost:
        if ((java.lang.Math.abs(r4 - r11) * 5) < (r11 * 2)) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x00dc, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x00e4, code lost:
        if (foundPatternCross(r3) == false) goto L60;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x00ec, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:?, code lost:
        return centerFromEnd(r3, r0);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private float crossCheckVertical(int startI, int centerJ, int maxCount, int originalStateCountTotal) {
        BitMatrix image = this.image;
        int maxI = image.getHeight();
        int[] stateCount = getCrossCheckStateCount();
        int i = startI;
        while (i >= 0 && image.get(centerJ, i)) {
            stateCount[2] = stateCount[2] + 1;
            i--;
        }
        if (i < 0) {
            return Float.NaN;
        }
        while (i >= 0 && !image.get(centerJ, i) && stateCount[1] <= maxCount) {
            stateCount[1] = stateCount[1] + 1;
            i--;
        }
        return Float.NaN;
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x003e, code lost:
        if (r3[1] <= r10) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0043, code lost:
        if (r1 < 0) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0049, code lost:
        if (r0.get(r1, r9) == false) goto L67;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x004e, code lost:
        if (r3[0] > r10) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0050, code lost:
        r3[0] = r3[0] + 1;
        r1 = r1 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x005d, code lost:
        if (r3[0] <= r10) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x005f, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0062, code lost:
        r1 = r8 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0064, code lost:
        if (r1 >= r2) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x006a, code lost:
        if (r0.get(r1, r9) == false) goto L70;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x006c, code lost:
        r3[2] = r3[2] + 1;
        r1 = r1 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0076, code lost:
        if (r1 != r2) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0078, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x007b, code lost:
        if (r1 >= r2) goto L73;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0081, code lost:
        if (r0.get(r1, r9) != false) goto L71;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0086, code lost:
        if (r3[3] >= r10) goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0088, code lost:
        r3[3] = r3[3] + 1;
        r1 = r1 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0092, code lost:
        if (r1 == r2) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x0097, code lost:
        if (r3[3] < r10) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0099, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x009c, code lost:
        if (r1 >= r2) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00a2, code lost:
        if (r0.get(r1, r9) == false) goto L74;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00a7, code lost:
        if (r3[4] >= r10) goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00a9, code lost:
        r3[4] = r3[4] + 1;
        r1 = r1 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00b6, code lost:
        if (r3[4] < r10) goto L54;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x00b8, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x00bc, code lost:
        r4 = (((r3[0] + r3[1]) + r3[2]) + r3[3]) + r3[4];
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x00d8, code lost:
        if ((java.lang.Math.abs(r4 - r11) * 5) < r11) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x00da, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x00e2, code lost:
        if (foundPatternCross(r3) == false) goto L60;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x00ea, code lost:
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:?, code lost:
        return centerFromEnd(r3, r1);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private float crossCheckHorizontal(int startJ, int centerI, int maxCount, int originalStateCountTotal) {
        BitMatrix image = this.image;
        int maxJ = image.getWidth();
        int[] stateCount = getCrossCheckStateCount();
        int j = startJ;
        while (j >= 0 && image.get(j, centerI)) {
            stateCount[2] = stateCount[2] + 1;
            j--;
        }
        if (j < 0) {
            return Float.NaN;
        }
        while (j >= 0 && !image.get(j, centerI) && stateCount[1] <= maxCount) {
            stateCount[1] = stateCount[1] + 1;
            j--;
        }
        return Float.NaN;
    }

    protected boolean handlePossibleCenter(int[] stateCount, int i, int j) {
        int stateCountTotal = stateCount[0] + stateCount[1] + stateCount[2] + stateCount[3] + stateCount[4];
        float centerJ = centerFromEnd(stateCount, j);
        float centerI = crossCheckVertical(i, (int) centerJ, stateCount[2], stateCountTotal);
        if (!Float.isNaN(centerI)) {
            float centerJ2 = crossCheckHorizontal((int) centerJ, (int) centerI, stateCount[2], stateCountTotal);
            if (!Float.isNaN(centerJ2)) {
                float estimatedModuleSize = stateCountTotal / 7.0f;
                boolean found = false;
                int index = 0;
                while (true) {
                    if (index >= this.possibleCenters.size()) {
                        break;
                    }
                    FinderPattern center = this.possibleCenters.get(index);
                    if (!center.aboutEquals(estimatedModuleSize, centerI, centerJ2)) {
                        index++;
                    } else {
                        this.possibleCenters.set(index, center.combineEstimate(centerI, centerJ2, estimatedModuleSize));
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    FinderPattern point = new FinderPattern(centerJ2, centerI, estimatedModuleSize);
                    this.possibleCenters.add(point);
                    if (this.resultPointCallback != null) {
                        this.resultPointCallback.foundPossibleResultPoint(point);
                    }
                }
                return true;
            }
        }
        return false;
    }

    private int findRowSkip() {
        int max = this.possibleCenters.size();
        if (max <= 1) {
            return 0;
        }
        FinderPattern firstConfirmedCenter = null;
        for (FinderPattern center : this.possibleCenters) {
            if (center.getCount() >= 2) {
                if (firstConfirmedCenter == null) {
                    firstConfirmedCenter = center;
                } else {
                    this.hasSkipped = true;
                    return ((int) (Math.abs(firstConfirmedCenter.getX() - center.getX()) - Math.abs(firstConfirmedCenter.getY() - center.getY()))) / 2;
                }
            }
        }
        return 0;
    }

    private boolean haveMultiplyConfirmedCenters() {
        int confirmedCount = 0;
        float totalModuleSize = 0.0f;
        int max = this.possibleCenters.size();
        for (FinderPattern pattern : this.possibleCenters) {
            if (pattern.getCount() >= 2) {
                confirmedCount++;
                totalModuleSize += pattern.getEstimatedModuleSize();
            }
        }
        if (confirmedCount < 3) {
            return false;
        }
        float average = totalModuleSize / max;
        float totalDeviation = 0.0f;
        for (FinderPattern pattern2 : this.possibleCenters) {
            totalDeviation += Math.abs(pattern2.getEstimatedModuleSize() - average);
        }
        return totalDeviation <= 0.05f * totalModuleSize;
    }

    private FinderPattern[] selectBestPatterns() throws NotFoundException {
        int startSize = this.possibleCenters.size();
        if (startSize < 3) {
            throw NotFoundException.getNotFoundInstance();
        }
        if (startSize > 3) {
            float totalModuleSize = 0.0f;
            float square = 0.0f;
            for (FinderPattern center : this.possibleCenters) {
                float size = center.getEstimatedModuleSize();
                totalModuleSize += size;
                square += size * size;
            }
            float average = totalModuleSize / startSize;
            float stdDev = (float) Math.sqrt((square / startSize) - (average * average));
            Collections.sort(this.possibleCenters, new FurthestFromAverageComparator(average));
            float limit = Math.max(0.2f * average, stdDev);
            int i = 0;
            while (i < this.possibleCenters.size() && this.possibleCenters.size() > 3) {
                FinderPattern pattern = this.possibleCenters.get(i);
                if (Math.abs(pattern.getEstimatedModuleSize() - average) > limit) {
                    this.possibleCenters.remove(i);
                    i--;
                }
                i++;
            }
        }
        if (this.possibleCenters.size() > 3) {
            float totalModuleSize2 = 0.0f;
            for (FinderPattern possibleCenter : this.possibleCenters) {
                totalModuleSize2 += possibleCenter.getEstimatedModuleSize();
            }
            Collections.sort(this.possibleCenters, new CenterComparator(totalModuleSize2 / this.possibleCenters.size()));
            this.possibleCenters.subList(3, this.possibleCenters.size()).clear();
        }
        return new FinderPattern[]{this.possibleCenters.get(0), this.possibleCenters.get(1), this.possibleCenters.get(2)};
    }

    /* loaded from: classes.dex */
    private static class FurthestFromAverageComparator implements Comparator<FinderPattern>, Serializable {
        private final float average;

        private FurthestFromAverageComparator(float f) {
            this.average = f;
        }

        public int compare(FinderPattern center1, FinderPattern center2) {
            float dA = Math.abs(center2.getEstimatedModuleSize() - this.average);
            float dB = Math.abs(center1.getEstimatedModuleSize() - this.average);
            if (dA < dB) {
                return -1;
            }
            return dA == dB ? 0 : 1;
        }
    }

    /* loaded from: classes.dex */
    private static class CenterComparator implements Comparator<FinderPattern>, Serializable {
        private final float average;

        private CenterComparator(float f) {
            this.average = f;
        }

        public int compare(FinderPattern center1, FinderPattern center2) {
            if (center2.getCount() == center1.getCount()) {
                float dA = Math.abs(center2.getEstimatedModuleSize() - this.average);
                float dB = Math.abs(center1.getEstimatedModuleSize() - this.average);
                if (dA < dB) {
                    return 1;
                }
                return dA == dB ? 0 : -1;
            }
            return center2.getCount() - center1.getCount();
        }
    }
}
