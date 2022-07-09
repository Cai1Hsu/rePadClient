package com.google.zxing.datamatrix.detector;

import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DetectorResult;
import com.google.zxing.common.GridSampler;
import com.google.zxing.common.detector.WhiteRectangleDetector;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/datamatrix/detector/Detector.class */
public final class Detector {
    private final BitMatrix image;
    private final WhiteRectangleDetector rectangleDetector;

    /* loaded from: classes.jar:com/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions.class */
    private static class ResultPointsAndTransitions {
        private final ResultPoint from;
        private final ResultPoint to;
        private final int transitions;

        private ResultPointsAndTransitions(ResultPoint resultPoint, ResultPoint resultPoint2, int i) {
            this.from = resultPoint;
            this.to = resultPoint2;
            this.transitions = i;
        }

        ResultPoint getFrom() {
            return this.from;
        }

        ResultPoint getTo() {
            return this.to;
        }

        public int getTransitions() {
            return this.transitions;
        }

        public String toString() {
            return this.from + "/" + this.to + '/' + this.transitions;
        }
    }

    /* loaded from: classes.jar:com/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitionsComparator.class */
    private static class ResultPointsAndTransitionsComparator implements Comparator<ResultPointsAndTransitions>, Serializable {
        private ResultPointsAndTransitionsComparator() {
        }

        public int compare(ResultPointsAndTransitions resultPointsAndTransitions, ResultPointsAndTransitions resultPointsAndTransitions2) {
            return resultPointsAndTransitions.getTransitions() - resultPointsAndTransitions2.getTransitions();
        }
    }

    public Detector(BitMatrix bitMatrix) throws NotFoundException {
        this.image = bitMatrix;
        this.rectangleDetector = new WhiteRectangleDetector(bitMatrix);
    }

    private ResultPoint correctTopRight(ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, ResultPoint resultPoint4, int i) {
        ResultPoint resultPoint5;
        float distance = distance(resultPoint, resultPoint2) / i;
        int distance2 = distance(resultPoint3, resultPoint4);
        ResultPoint resultPoint6 = new ResultPoint(resultPoint4.getX() + (distance * ((resultPoint4.getX() - resultPoint3.getX()) / distance2)), resultPoint4.getY() + (distance * ((resultPoint4.getY() - resultPoint3.getY()) / distance2)));
        float distance3 = distance(resultPoint, resultPoint2) / i;
        int distance4 = distance(resultPoint2, resultPoint4);
        ResultPoint resultPoint7 = new ResultPoint(resultPoint4.getX() + (distance3 * ((resultPoint4.getX() - resultPoint2.getX()) / distance4)), resultPoint4.getY() + (distance3 * ((resultPoint4.getY() - resultPoint2.getY()) / distance4)));
        if (!isValid(resultPoint6)) {
            resultPoint5 = isValid(resultPoint7) ? resultPoint7 : null;
        } else {
            resultPoint5 = resultPoint6;
            if (isValid(resultPoint7)) {
                resultPoint5 = resultPoint6;
                if (Math.abs(transitionsBetween(resultPoint3, resultPoint6).getTransitions() - transitionsBetween(resultPoint2, resultPoint6).getTransitions()) > Math.abs(transitionsBetween(resultPoint3, resultPoint7).getTransitions() - transitionsBetween(resultPoint2, resultPoint7).getTransitions())) {
                    resultPoint5 = resultPoint7;
                }
            }
        }
        return resultPoint5;
    }

    private ResultPoint correctTopRightRectangular(ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, ResultPoint resultPoint4, int i, int i2) {
        ResultPoint resultPoint5;
        float distance = distance(resultPoint, resultPoint2) / i;
        int distance2 = distance(resultPoint3, resultPoint4);
        ResultPoint resultPoint6 = new ResultPoint(resultPoint4.getX() + (distance * ((resultPoint4.getX() - resultPoint3.getX()) / distance2)), resultPoint4.getY() + (distance * ((resultPoint4.getY() - resultPoint3.getY()) / distance2)));
        float distance3 = distance(resultPoint, resultPoint3) / i2;
        int distance4 = distance(resultPoint2, resultPoint4);
        ResultPoint resultPoint7 = new ResultPoint(resultPoint4.getX() + (distance3 * ((resultPoint4.getX() - resultPoint2.getX()) / distance4)), resultPoint4.getY() + (distance3 * ((resultPoint4.getY() - resultPoint2.getY()) / distance4)));
        if (!isValid(resultPoint6)) {
            resultPoint5 = isValid(resultPoint7) ? resultPoint7 : null;
        } else if (!isValid(resultPoint7)) {
            resultPoint5 = resultPoint6;
        } else {
            resultPoint5 = resultPoint7;
            if (Math.abs(i - transitionsBetween(resultPoint3, resultPoint6).getTransitions()) + Math.abs(i2 - transitionsBetween(resultPoint2, resultPoint6).getTransitions()) <= Math.abs(i - transitionsBetween(resultPoint3, resultPoint7).getTransitions()) + Math.abs(i2 - transitionsBetween(resultPoint2, resultPoint7).getTransitions())) {
                resultPoint5 = resultPoint6;
            }
        }
        return resultPoint5;
    }

    private static int distance(ResultPoint resultPoint, ResultPoint resultPoint2) {
        return round((float) Math.sqrt(((resultPoint.getX() - resultPoint2.getX()) * (resultPoint.getX() - resultPoint2.getX())) + ((resultPoint.getY() - resultPoint2.getY()) * (resultPoint.getY() - resultPoint2.getY()))));
    }

    private static void increment(Map<ResultPoint, Integer> map, ResultPoint resultPoint) {
        Integer num = map.get(resultPoint);
        map.put(resultPoint, Integer.valueOf(num == null ? 1 : num.intValue() + 1));
    }

    private boolean isValid(ResultPoint resultPoint) {
        return resultPoint.getX() >= 0.0f && resultPoint.getX() < ((float) this.image.getWidth()) && resultPoint.getY() > 0.0f && resultPoint.getY() < ((float) this.image.getHeight());
    }

    private static int round(float f) {
        return (int) (0.5f + f);
    }

    private static BitMatrix sampleGrid(BitMatrix bitMatrix, ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, ResultPoint resultPoint4, int i, int i2) throws NotFoundException {
        return GridSampler.getInstance().sampleGrid(bitMatrix, i, i2, 0.5f, 0.5f, i - 0.5f, 0.5f, i - 0.5f, i2 - 0.5f, 0.5f, i2 - 0.5f, resultPoint.getX(), resultPoint.getY(), resultPoint4.getX(), resultPoint4.getY(), resultPoint3.getX(), resultPoint3.getY(), resultPoint2.getX(), resultPoint2.getY());
    }

    private ResultPointsAndTransitions transitionsBetween(ResultPoint resultPoint, ResultPoint resultPoint2) {
        int i;
        int x = (int) resultPoint.getX();
        int y = (int) resultPoint.getY();
        int x2 = (int) resultPoint2.getX();
        int y2 = (int) resultPoint2.getY();
        boolean z = Math.abs(y2 - y) > Math.abs(x2 - x);
        int i2 = x;
        int i3 = y;
        int i4 = x2;
        int i5 = y2;
        if (z) {
            i2 = y;
            i3 = x;
            i5 = x2;
            i4 = y2;
        }
        int abs = Math.abs(i4 - i2);
        int abs2 = Math.abs(i5 - i3);
        int i6 = (-abs) >> 1;
        int i7 = i3 < i5 ? 1 : -1;
        int i8 = i2 < i4 ? 1 : -1;
        boolean z2 = this.image.get(z ? i3 : i2, z ? i2 : i3);
        int i9 = i2;
        int i10 = i3;
        int i11 = i9;
        int i12 = 0;
        while (true) {
            i = i12;
            if (i11 == i4) {
                break;
            }
            boolean z3 = this.image.get(z ? i10 : i11, z ? i11 : i10);
            boolean z4 = z2;
            i = i12;
            if (z3 != z2) {
                i = i12 + 1;
                z4 = z3;
            }
            int i13 = i6 + abs2;
            int i14 = i13;
            int i15 = i10;
            if (i13 > 0) {
                if (i10 == i5) {
                    break;
                }
                i15 = i10 + i7;
                i14 = i13 - abs;
            }
            i11 += i8;
            i6 = i14;
            z2 = z4;
            i12 = i;
            i10 = i15;
        }
        return new ResultPointsAndTransitions(resultPoint, resultPoint2, i);
    }

    public DetectorResult detect() throws NotFoundException {
        ResultPoint resultPoint;
        BitMatrix bitMatrix;
        ResultPoint[] detect = this.rectangleDetector.detect();
        ResultPoint resultPoint2 = detect[0];
        ResultPoint resultPoint3 = detect[1];
        ResultPoint resultPoint4 = detect[2];
        ResultPoint resultPoint5 = detect[3];
        ArrayList arrayList = new ArrayList(4);
        arrayList.add(transitionsBetween(resultPoint2, resultPoint3));
        arrayList.add(transitionsBetween(resultPoint2, resultPoint4));
        arrayList.add(transitionsBetween(resultPoint3, resultPoint5));
        arrayList.add(transitionsBetween(resultPoint4, resultPoint5));
        Collections.sort(arrayList, new ResultPointsAndTransitionsComparator());
        ResultPointsAndTransitions resultPointsAndTransitions = (ResultPointsAndTransitions) arrayList.get(0);
        ResultPointsAndTransitions resultPointsAndTransitions2 = (ResultPointsAndTransitions) arrayList.get(1);
        HashMap hashMap = new HashMap();
        increment(hashMap, resultPointsAndTransitions.getFrom());
        increment(hashMap, resultPointsAndTransitions.getTo());
        increment(hashMap, resultPointsAndTransitions2.getFrom());
        increment(hashMap, resultPointsAndTransitions2.getTo());
        ResultPoint resultPoint6 = null;
        ResultPoint resultPoint7 = null;
        ResultPoint resultPoint8 = null;
        for (Map.Entry entry : hashMap.entrySet()) {
            ResultPoint resultPoint9 = (ResultPoint) entry.getKey();
            if (((Integer) entry.getValue()).intValue() == 2) {
                resultPoint7 = resultPoint9;
            } else if (resultPoint6 == null) {
                resultPoint6 = resultPoint9;
            } else {
                resultPoint8 = resultPoint9;
            }
        }
        if (resultPoint6 == null || resultPoint7 == null || resultPoint8 == null) {
            throw NotFoundException.getNotFoundInstance();
        }
        ResultPoint[] resultPointArr = {resultPoint6, resultPoint7, resultPoint8};
        ResultPoint.orderBestPatterns(resultPointArr);
        ResultPoint resultPoint10 = resultPointArr[0];
        ResultPoint resultPoint11 = resultPointArr[1];
        ResultPoint resultPoint12 = resultPointArr[2];
        ResultPoint resultPoint13 = !hashMap.containsKey(resultPoint2) ? resultPoint2 : !hashMap.containsKey(resultPoint3) ? resultPoint3 : !hashMap.containsKey(resultPoint4) ? resultPoint4 : resultPoint5;
        int transitions = transitionsBetween(resultPoint12, resultPoint13).getTransitions();
        int transitions2 = transitionsBetween(resultPoint10, resultPoint13).getTransitions();
        int i = transitions;
        if ((transitions & 1) == 1) {
            i = transitions + 1;
        }
        int i2 = i + 2;
        int i3 = transitions2;
        if ((transitions2 & 1) == 1) {
            i3 = transitions2 + 1;
        }
        int i4 = i3 + 2;
        if (i2 * 4 >= i4 * 7 || i4 * 4 >= i2 * 7) {
            ResultPoint correctTopRightRectangular = correctTopRightRectangular(resultPoint11, resultPoint10, resultPoint12, resultPoint13, i2, i4);
            resultPoint = correctTopRightRectangular;
            if (correctTopRightRectangular == null) {
                resultPoint = resultPoint13;
            }
            int transitions3 = transitionsBetween(resultPoint12, resultPoint).getTransitions();
            int transitions4 = transitionsBetween(resultPoint10, resultPoint).getTransitions();
            int i5 = transitions3;
            if ((transitions3 & 1) == 1) {
                i5 = transitions3 + 1;
            }
            int i6 = transitions4;
            if ((transitions4 & 1) == 1) {
                i6 = transitions4 + 1;
            }
            bitMatrix = sampleGrid(this.image, resultPoint12, resultPoint11, resultPoint10, resultPoint, i5, i6);
        } else {
            ResultPoint correctTopRight = correctTopRight(resultPoint11, resultPoint10, resultPoint12, resultPoint13, Math.min(i4, i2));
            resultPoint = correctTopRight;
            if (correctTopRight == null) {
                resultPoint = resultPoint13;
            }
            int max = Math.max(transitionsBetween(resultPoint12, resultPoint).getTransitions(), transitionsBetween(resultPoint10, resultPoint).getTransitions()) + 1;
            int i7 = max;
            if ((max & 1) == 1) {
                i7 = max + 1;
            }
            bitMatrix = sampleGrid(this.image, resultPoint12, resultPoint11, resultPoint10, resultPoint, i7, i7);
        }
        return new DetectorResult(bitMatrix, new ResultPoint[]{resultPoint12, resultPoint11, resultPoint10, resultPoint});
    }
}
