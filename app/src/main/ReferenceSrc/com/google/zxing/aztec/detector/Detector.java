package com.google.zxing.aztec.detector;

import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.aztec.AztecDetectorResult;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.GridSampler;
import com.google.zxing.common.detector.WhiteRectangleDetector;
import com.google.zxing.common.reedsolomon.GenericGF;
import com.google.zxing.common.reedsolomon.ReedSolomonDecoder;
import com.google.zxing.common.reedsolomon.ReedSolomonException;

/* loaded from: classes.jar:com/google/zxing/aztec/detector/Detector.class */
public final class Detector {
    private boolean compact;
    private final BitMatrix image;
    private int nbCenterLayers;
    private int nbDataBlocks;
    private int nbLayers;
    private int shift;

    /* loaded from: classes.jar:com/google/zxing/aztec/detector/Detector$Point.class */
    private static class Point {
        public final int x;
        public final int y;

        private Point(int i, int i2) {
            this.x = i;
            this.y = i2;
        }

        public ResultPoint toResultPoint() {
            return new ResultPoint(this.x, this.y);
        }
    }

    public Detector(BitMatrix bitMatrix) {
        this.image = bitMatrix;
    }

    private static void correctParameterData(boolean[] zArr, boolean z) throws NotFoundException {
        int i;
        int i2;
        if (z) {
            i = 7;
            i2 = 2;
        } else {
            i = 10;
            i2 = 4;
        }
        int[] iArr = new int[i];
        for (int i3 = 0; i3 < i; i3++) {
            int i4 = 1;
            for (int i5 = 1; i5 <= 4; i5++) {
                if (zArr[((4 * i3) + 4) - i5]) {
                    iArr[i3] = iArr[i3] + i4;
                }
                i4 <<= 1;
            }
        }
        try {
            new ReedSolomonDecoder(GenericGF.AZTEC_PARAM).decode(iArr, i - i2);
            for (int i6 = 0; i6 < i2; i6++) {
                int i7 = 1;
                for (int i8 = 1; i8 <= 4; i8++) {
                    zArr[((i6 * 4) + 4) - i8] = (iArr[i6] & i7) == i7;
                    i7 <<= 1;
                }
            }
        } catch (ReedSolomonException e) {
            throw NotFoundException.getNotFoundInstance();
        }
    }

    private static float distance(Point point, Point point2) {
        return (float) Math.sqrt(((point.x - point2.x) * (point.x - point2.x)) + ((point.y - point2.y) * (point.y - point2.y)));
    }

    private void extractParameters(Point[] pointArr) throws NotFoundException {
        boolean[] zArr;
        boolean[] sampleLine = sampleLine(pointArr[0], pointArr[1], (this.nbCenterLayers * 2) + 1);
        boolean[] sampleLine2 = sampleLine(pointArr[1], pointArr[2], (this.nbCenterLayers * 2) + 1);
        boolean[] sampleLine3 = sampleLine(pointArr[2], pointArr[3], (this.nbCenterLayers * 2) + 1);
        boolean[] sampleLine4 = sampleLine(pointArr[3], pointArr[0], (this.nbCenterLayers * 2) + 1);
        if (sampleLine[0] && sampleLine[this.nbCenterLayers * 2]) {
            this.shift = 0;
        } else if (sampleLine2[0] && sampleLine2[this.nbCenterLayers * 2]) {
            this.shift = 1;
        } else if (sampleLine3[0] && sampleLine3[this.nbCenterLayers * 2]) {
            this.shift = 2;
        } else if (!sampleLine4[0] || !sampleLine4[this.nbCenterLayers * 2]) {
            throw NotFoundException.getNotFoundInstance();
        } else {
            this.shift = 3;
        }
        if (!this.compact) {
            boolean[] zArr2 = new boolean[40];
            for (int i = 0; i < 11; i++) {
                if (i < 5) {
                    zArr2[i] = sampleLine[i + 2];
                    zArr2[i + 10] = sampleLine2[i + 2];
                    zArr2[i + 20] = sampleLine3[i + 2];
                    zArr2[i + 30] = sampleLine4[i + 2];
                }
                if (i > 5) {
                    zArr2[i - 1] = sampleLine[i + 2];
                    zArr2[(i + 10) - 1] = sampleLine2[i + 2];
                    zArr2[(i + 20) - 1] = sampleLine3[i + 2];
                    zArr2[(i + 30) - 1] = sampleLine4[i + 2];
                }
            }
            boolean[] zArr3 = new boolean[40];
            int i2 = 0;
            while (true) {
                zArr = zArr3;
                if (i2 >= 40) {
                    break;
                }
                zArr3[i2] = zArr2[((this.shift * 10) + i2) % 40];
                i2++;
            }
        } else {
            boolean[] zArr4 = new boolean[28];
            for (int i3 = 0; i3 < 7; i3++) {
                zArr4[i3] = sampleLine[i3 + 2];
                zArr4[i3 + 7] = sampleLine2[i3 + 2];
                zArr4[i3 + 14] = sampleLine3[i3 + 2];
                zArr4[i3 + 21] = sampleLine4[i3 + 2];
            }
            boolean[] zArr5 = new boolean[28];
            int i4 = 0;
            while (true) {
                zArr = zArr5;
                if (i4 >= 28) {
                    break;
                }
                zArr5[i4] = zArr4[((this.shift * 7) + i4) % 28];
                i4++;
            }
        }
        correctParameterData(zArr, this.compact);
        getParameters(zArr);
    }

    private Point[] getBullEyeCornerPoints(Point point) throws NotFoundException {
        Point point2 = point;
        Point point3 = point;
        Point point4 = point;
        boolean z = true;
        this.nbCenterLayers = 1;
        while (this.nbCenterLayers < 9) {
            Point firstDifferent = getFirstDifferent(point2, z, 1, -1);
            Point firstDifferent2 = getFirstDifferent(point3, z, 1, 1);
            Point firstDifferent3 = getFirstDifferent(point4, z, -1, 1);
            Point firstDifferent4 = getFirstDifferent(point, z, -1, -1);
            if (this.nbCenterLayers > 2) {
                float distance = (distance(firstDifferent4, firstDifferent) * this.nbCenterLayers) / (distance(point, point2) * (this.nbCenterLayers + 2));
                if (distance >= 0.75d) {
                    if (distance <= 1.25d) {
                        if (!isWhiteOrBlackRectangle(firstDifferent, firstDifferent2, firstDifferent3, firstDifferent4)) {
                            break;
                        }
                    } else {
                        break;
                    }
                } else {
                    break;
                }
            }
            point2 = firstDifferent;
            point3 = firstDifferent2;
            point4 = firstDifferent3;
            point = firstDifferent4;
            z = !z;
            this.nbCenterLayers++;
        }
        if (this.nbCenterLayers == 5 || this.nbCenterLayers == 7) {
            this.compact = this.nbCenterLayers == 5;
            float f = 1.5f / ((this.nbCenterLayers * 2) - 3);
            int i = point2.x - point4.x;
            int i2 = point2.y - point4.y;
            int round = round(point4.x - (i * f));
            int round2 = round(point4.y - (i2 * f));
            int round3 = round(point2.x + (i * f));
            int round4 = round(point2.y + (i2 * f));
            int i3 = point3.x - point.x;
            int i4 = point3.y - point.y;
            int round5 = round(point.x - (i3 * f));
            int round6 = round(point.y - (i4 * f));
            int round7 = round(point3.x + (i3 * f));
            int round8 = round(point3.y + (i4 * f));
            if (isValid(round3, round4) && isValid(round7, round8) && isValid(round, round2) && isValid(round5, round6)) {
                return new Point[]{new Point(round3, round4), new Point(round7, round8), new Point(round, round2), new Point(round5, round6)};
            }
            throw NotFoundException.getNotFoundInstance();
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private int getColor(Point point, Point point2) {
        float distance = distance(point, point2);
        float f = (point2.x - point.x) / distance;
        float f2 = (point2.y - point.y) / distance;
        int i = 0;
        float f3 = point.x;
        float f4 = point.y;
        boolean z = this.image.get(point.x, point.y);
        int i2 = 0;
        while (i2 < distance) {
            f3 += f;
            f4 += f2;
            int i3 = i;
            if (this.image.get(round(f3), round(f4)) != z) {
                i3 = i + 1;
            }
            i2++;
            i = i3;
        }
        float f5 = i / distance;
        return (((double) f5) <= 0.1d || ((double) f5) >= 0.9d) ? ((double) f5) <= 0.1d ? z ? 1 : -1 : z ? -1 : 1 : 0;
    }

    private Point getFirstDifferent(Point point, boolean z, int i, int i2) {
        int i3;
        int i4;
        int i5;
        int i6 = point.x + i;
        int i7 = point.y;
        while (true) {
            i3 = i7 + i2;
            if (!isValid(i6, i3) || this.image.get(i6, i3) != z) {
                break;
            }
            i6 += i;
            i7 = i3;
        }
        int i8 = i3 - i2;
        int i9 = i6 - i;
        while (true) {
            i4 = i9;
            if (!isValid(i4, i8) || this.image.get(i4, i8) != z) {
                break;
            }
            i9 = i4 + i;
        }
        int i10 = i4 - i;
        int i11 = i8;
        while (true) {
            i5 = i11;
            if (!isValid(i10, i5) || this.image.get(i10, i5) != z) {
                break;
            }
            i11 = i5 + i2;
        }
        return new Point(i10, i5 - i2);
    }

    private Point getMatrixCenter() {
        ResultPoint resultPoint;
        ResultPoint resultPoint2;
        ResultPoint resultPoint3;
        ResultPoint resultPoint4;
        ResultPoint resultPoint5;
        ResultPoint resultPoint6;
        ResultPoint resultPoint7;
        ResultPoint resultPoint8;
        try {
            ResultPoint[] detect = new WhiteRectangleDetector(this.image).detect();
            resultPoint = detect[0];
            resultPoint2 = detect[1];
            resultPoint3 = detect[2];
            resultPoint4 = detect[3];
        } catch (NotFoundException e) {
            int width = this.image.getWidth() / 2;
            int height = this.image.getHeight() / 2;
            resultPoint = getFirstDifferent(new Point(width + 7, height - 7), false, 1, -1).toResultPoint();
            resultPoint2 = getFirstDifferent(new Point(width + 7, height + 7), false, 1, 1).toResultPoint();
            resultPoint3 = getFirstDifferent(new Point(width - 7, height + 7), false, -1, 1).toResultPoint();
            resultPoint4 = getFirstDifferent(new Point(width - 7, height - 7), false, -1, -1).toResultPoint();
        }
        int round = round((((resultPoint.getX() + resultPoint4.getX()) + resultPoint2.getX()) + resultPoint3.getX()) / 4.0f);
        int round2 = round((((resultPoint.getY() + resultPoint4.getY()) + resultPoint2.getY()) + resultPoint3.getY()) / 4.0f);
        try {
            ResultPoint[] detect2 = new WhiteRectangleDetector(this.image, 15, round, round2).detect();
            resultPoint5 = detect2[0];
            resultPoint6 = detect2[1];
            resultPoint7 = detect2[2];
            resultPoint8 = detect2[3];
        } catch (NotFoundException e2) {
            resultPoint5 = getFirstDifferent(new Point(round + 7, round2 - 7), false, 1, -1).toResultPoint();
            resultPoint6 = getFirstDifferent(new Point(round + 7, round2 + 7), false, 1, 1).toResultPoint();
            resultPoint7 = getFirstDifferent(new Point(round - 7, round2 + 7), false, -1, 1).toResultPoint();
            resultPoint8 = getFirstDifferent(new Point(round - 7, round2 - 7), false, -1, -1).toResultPoint();
        }
        return new Point(round((((resultPoint5.getX() + resultPoint8.getX()) + resultPoint6.getX()) + resultPoint7.getX()) / 4.0f), round((((resultPoint5.getY() + resultPoint8.getY()) + resultPoint6.getY()) + resultPoint7.getY()) / 4.0f));
    }

    private ResultPoint[] getMatrixCornerPoints(Point[] pointArr) throws NotFoundException {
        float f = (((this.nbLayers > 4 ? 1 : 0) + (this.nbLayers * 2)) + ((this.nbLayers - 4) / 8)) / (2.0f * this.nbCenterLayers);
        int i = pointArr[0].x - pointArr[2].x;
        int i2 = i + (i > 0 ? 1 : -1);
        int i3 = pointArr[0].y - pointArr[2].y;
        int i4 = i3 + (i3 > 0 ? 1 : -1);
        int round = round(pointArr[2].x - (i2 * f));
        int round2 = round(pointArr[2].y - (i4 * f));
        int round3 = round(pointArr[0].x + (i2 * f));
        int round4 = round(pointArr[0].y + (i4 * f));
        int i5 = pointArr[1].x - pointArr[3].x;
        int i6 = i5 + (i5 > 0 ? 1 : -1);
        int i7 = pointArr[1].y - pointArr[3].y;
        int i8 = i7 + (i7 > 0 ? 1 : -1);
        int round5 = round(pointArr[3].x - (i6 * f));
        int round6 = round(pointArr[3].y - (i8 * f));
        int round7 = round(pointArr[1].x + (i6 * f));
        int round8 = round(pointArr[1].y + (i8 * f));
        if (!isValid(round3, round4) || !isValid(round7, round8) || !isValid(round, round2) || !isValid(round5, round6)) {
            throw NotFoundException.getNotFoundInstance();
        }
        return new ResultPoint[]{new ResultPoint(round3, round4), new ResultPoint(round7, round8), new ResultPoint(round, round2), new ResultPoint(round5, round6)};
    }

    private void getParameters(boolean[] zArr) {
        int i;
        int i2;
        if (this.compact) {
            i = 2;
            i2 = 6;
        } else {
            i = 5;
            i2 = 11;
        }
        for (int i3 = 0; i3 < i; i3++) {
            this.nbLayers <<= 1;
            if (zArr[i3]) {
                this.nbLayers++;
            }
        }
        for (int i4 = i; i4 < i + i2; i4++) {
            this.nbDataBlocks <<= 1;
            if (zArr[i4]) {
                this.nbDataBlocks++;
            }
        }
        this.nbLayers++;
        this.nbDataBlocks++;
    }

    private boolean isValid(int i, int i2) {
        return i >= 0 && i < this.image.getWidth() && i2 > 0 && i2 < this.image.getHeight();
    }

    private boolean isWhiteOrBlackRectangle(Point point, Point point2, Point point3, Point point4) {
        boolean z;
        Point point5 = new Point(point.x - 3, point.y + 3);
        Point point6 = new Point(point2.x - 3, point2.y - 3);
        Point point7 = new Point(point3.x + 3, point3.y - 3);
        Point point8 = new Point(point4.x + 3, point4.y + 3);
        int color = getColor(point8, point5);
        if (color == 0) {
            z = false;
        } else {
            z = false;
            if (getColor(point5, point6) == color) {
                z = false;
                if (getColor(point6, point7) == color) {
                    z = false;
                    if (getColor(point7, point8) == color) {
                        z = true;
                    }
                }
            }
        }
        return z;
    }

    private static int round(float f) {
        return (int) (0.5f + f);
    }

    private BitMatrix sampleGrid(BitMatrix bitMatrix, ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, ResultPoint resultPoint4) throws NotFoundException {
        int i = this.compact ? (this.nbLayers * 4) + 11 : this.nbLayers <= 4 ? (this.nbLayers * 4) + 15 : (this.nbLayers * 4) + ((((this.nbLayers - 4) / 8) + 1) * 2) + 15;
        return GridSampler.getInstance().sampleGrid(bitMatrix, i, i, 0.5f, 0.5f, i - 0.5f, 0.5f, i - 0.5f, i - 0.5f, 0.5f, i - 0.5f, resultPoint.getX(), resultPoint.getY(), resultPoint4.getX(), resultPoint4.getY(), resultPoint3.getX(), resultPoint3.getY(), resultPoint2.getX(), resultPoint2.getY());
    }

    private boolean[] sampleLine(Point point, Point point2, int i) {
        boolean[] zArr = new boolean[i];
        float distance = distance(point, point2);
        float f = distance / (i - 1);
        float f2 = ((point2.x - point.x) * f) / distance;
        float f3 = ((point2.y - point.y) * f) / distance;
        float f4 = point.x;
        float f5 = point.y;
        for (int i2 = 0; i2 < i; i2++) {
            zArr[i2] = this.image.get(round(f4), round(f5));
            f4 += f2;
            f5 += f3;
        }
        return zArr;
    }

    public AztecDetectorResult detect() throws NotFoundException {
        Point[] bullEyeCornerPoints = getBullEyeCornerPoints(getMatrixCenter());
        extractParameters(bullEyeCornerPoints);
        ResultPoint[] matrixCornerPoints = getMatrixCornerPoints(bullEyeCornerPoints);
        return new AztecDetectorResult(sampleGrid(this.image, matrixCornerPoints[this.shift % 4], matrixCornerPoints[(this.shift + 3) % 4], matrixCornerPoints[(this.shift + 2) % 4], matrixCornerPoints[(this.shift + 1) % 4]), matrixCornerPoints, this.compact, this.nbDataBlocks, this.nbLayers);
    }
}
