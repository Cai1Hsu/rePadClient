package com.google.zxing.multi.qrcode.detector;

import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.detector.FinderPattern;
import com.google.zxing.qrcode.detector.FinderPatternFinder;
import com.google.zxing.qrcode.detector.FinderPatternInfo;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder.class */
final class MultiFinderPatternFinder extends FinderPatternFinder {
    private static final float DIFF_MODSIZE_CUTOFF = 0.5f;
    private static final float DIFF_MODSIZE_CUTOFF_PERCENT = 0.05f;
    private static final FinderPatternInfo[] EMPTY_RESULT_ARRAY = new FinderPatternInfo[0];
    private static final float MAX_MODULE_COUNT_PER_EDGE = 180.0f;
    private static final float MIN_MODULE_COUNT_PER_EDGE = 9.0f;

    /* loaded from: classes.jar:com/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator.class */
    private static class ModuleSizeComparator implements Comparator<FinderPattern>, Serializable {
        private ModuleSizeComparator() {
        }

        public int compare(FinderPattern finderPattern, FinderPattern finderPattern2) {
            float estimatedModuleSize = finderPattern2.getEstimatedModuleSize() - finderPattern.getEstimatedModuleSize();
            return ((double) estimatedModuleSize) < 0.0d ? -1 : ((double) estimatedModuleSize) > 0.0d ? 1 : 0;
        }
    }

    MultiFinderPatternFinder(BitMatrix bitMatrix) {
        super(bitMatrix);
    }

    MultiFinderPatternFinder(BitMatrix bitMatrix, ResultPointCallback resultPointCallback) {
        super(bitMatrix, resultPointCallback);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v99, types: [com.google.zxing.qrcode.detector.FinderPattern[]] */
    private FinderPattern[][] selectMutipleBestPatterns() throws NotFoundException {
        FinderPattern[][] finderPatternArr;
        List<FinderPattern> possibleCenters = getPossibleCenters();
        int size = possibleCenters.size();
        if (size < 3) {
            throw NotFoundException.getNotFoundInstance();
        }
        if (size == 3) {
            finderPatternArr = new FinderPattern[]{new FinderPattern[]{possibleCenters.get(0), possibleCenters.get(1), possibleCenters.get(2)}};
        } else {
            Collections.sort(possibleCenters, new ModuleSizeComparator());
            ArrayList arrayList = new ArrayList();
            for (int i = 0; i < size - 2; i++) {
                FinderPattern finderPattern = possibleCenters.get(i);
                if (finderPattern != null) {
                    for (int i2 = i + 1; i2 < size - 1; i2++) {
                        FinderPattern finderPattern2 = possibleCenters.get(i2);
                        if (finderPattern2 != null) {
                            float estimatedModuleSize = (finderPattern.getEstimatedModuleSize() - finderPattern2.getEstimatedModuleSize()) / Math.min(finderPattern.getEstimatedModuleSize(), finderPattern2.getEstimatedModuleSize());
                            if (Math.abs(finderPattern.getEstimatedModuleSize() - finderPattern2.getEstimatedModuleSize()) <= DIFF_MODSIZE_CUTOFF || estimatedModuleSize < DIFF_MODSIZE_CUTOFF_PERCENT) {
                                for (int i3 = i2 + 1; i3 < size; i3++) {
                                    FinderPattern finderPattern3 = possibleCenters.get(i3);
                                    if (finderPattern3 != null) {
                                        float estimatedModuleSize2 = (finderPattern2.getEstimatedModuleSize() - finderPattern3.getEstimatedModuleSize()) / Math.min(finderPattern2.getEstimatedModuleSize(), finderPattern3.getEstimatedModuleSize());
                                        if (Math.abs(finderPattern2.getEstimatedModuleSize() - finderPattern3.getEstimatedModuleSize()) <= DIFF_MODSIZE_CUTOFF || estimatedModuleSize2 < DIFF_MODSIZE_CUTOFF_PERCENT) {
                                            FinderPattern[] finderPatternArr2 = {finderPattern, finderPattern2, finderPattern3};
                                            ResultPoint.orderBestPatterns(finderPatternArr2);
                                            FinderPatternInfo finderPatternInfo = new FinderPatternInfo(finderPatternArr2);
                                            float distance = ResultPoint.distance(finderPatternInfo.getTopLeft(), finderPatternInfo.getBottomLeft());
                                            float distance2 = ResultPoint.distance(finderPatternInfo.getTopRight(), finderPatternInfo.getBottomLeft());
                                            float distance3 = ResultPoint.distance(finderPatternInfo.getTopLeft(), finderPatternInfo.getTopRight());
                                            float estimatedModuleSize3 = (distance + distance3) / (finderPattern.getEstimatedModuleSize() * 2.0f);
                                            if (estimatedModuleSize3 <= MAX_MODULE_COUNT_PER_EDGE && estimatedModuleSize3 >= MIN_MODULE_COUNT_PER_EDGE && Math.abs((distance - distance3) / Math.min(distance, distance3)) < 0.1f) {
                                                float sqrt = (float) Math.sqrt((distance * distance) + (distance3 * distance3));
                                                if (Math.abs((distance2 - sqrt) / Math.min(distance2, sqrt)) < 0.1f) {
                                                    arrayList.add(finderPatternArr2);
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (arrayList.isEmpty()) {
                throw NotFoundException.getNotFoundInstance();
            }
            finderPatternArr = (FinderPattern[][]) arrayList.toArray(new FinderPattern[arrayList.size()]);
        }
        return finderPatternArr;
    }

    public FinderPatternInfo[] findMulti(Map<DecodeHintType, ?> map) throws NotFoundException {
        int i;
        int i2;
        boolean z = map != null && map.containsKey(DecodeHintType.TRY_HARDER);
        BitMatrix image = getImage();
        int height = image.getHeight();
        int width = image.getWidth();
        int i3 = (int) ((height / 228.0f) * 3.0f);
        if (i3 < 3 || z) {
            i3 = 3;
        }
        int[] iArr = new int[5];
        int i4 = i3 - 1;
        while (true) {
            int i5 = i4;
            if (i5 >= height) {
                break;
            }
            iArr[0] = 0;
            iArr[1] = 0;
            iArr[2] = 0;
            iArr[3] = 0;
            iArr[4] = 0;
            int i6 = 0;
            int i7 = 0;
            while (i7 < width) {
                if (image.get(i7, i5)) {
                    i = i6;
                    if ((i6 & 1) == 1) {
                        i = i6 + 1;
                    }
                    iArr[i] = iArr[i] + 1;
                } else if ((i6 & 1) != 0) {
                    iArr[i6] = iArr[i6] + 1;
                    i = i6;
                } else if (i6 != 4) {
                    i = i6 + 1;
                    iArr[i] = iArr[i] + 1;
                } else if (foundPatternCross(iArr)) {
                    int i8 = i7;
                    if (!handlePossibleCenter(iArr, i5, i7)) {
                        do {
                            i2 = i7 + 1;
                            if (i2 >= width) {
                                break;
                            }
                            i7 = i2;
                        } while (!image.get(i2, i5));
                        i8 = i2 - 1;
                    }
                    i = 0;
                    iArr[0] = 0;
                    iArr[1] = 0;
                    iArr[2] = 0;
                    iArr[3] = 0;
                    iArr[4] = 0;
                    i7 = i8;
                } else {
                    iArr[0] = iArr[2];
                    iArr[1] = iArr[3];
                    iArr[2] = iArr[4];
                    iArr[3] = 1;
                    iArr[4] = 0;
                    i = 3;
                }
                i7++;
                i6 = i;
            }
            if (foundPatternCross(iArr)) {
                handlePossibleCenter(iArr, i5, width);
            }
            i4 = i5 + i3;
        }
        FinderPattern[][] selectMutipleBestPatterns = selectMutipleBestPatterns();
        ArrayList arrayList = new ArrayList();
        for (FinderPattern[] finderPatternArr : selectMutipleBestPatterns) {
            ResultPoint.orderBestPatterns(finderPatternArr);
            arrayList.add(new FinderPatternInfo(finderPatternArr));
        }
        return arrayList.isEmpty() ? EMPTY_RESULT_ARRAY : (FinderPatternInfo[]) arrayList.toArray(new FinderPatternInfo[arrayList.size()]);
    }
}
