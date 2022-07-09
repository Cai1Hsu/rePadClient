package com.google.zxing.pdf417.detector;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DetectorResult;
import com.google.zxing.common.GridSampler;
import java.util.Arrays;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/pdf417/detector/Detector.class */
public final class Detector {
    private static final int MAX_AVG_VARIANCE = 107;
    private static final int MAX_INDIVIDUAL_VARIANCE = 204;
    private static final int SKEW_THRESHOLD = 2;
    private static final int[] START_PATTERN = {8, 1, 1, 1, 1, 1, 1, 3};
    private static final int[] START_PATTERN_REVERSE = {3, 1, 1, 1, 1, 1, 1, 8};
    private static final int[] STOP_PATTERN = {7, 1, 1, 3, 1, 1, 1, 2, 1};
    private static final int[] STOP_PATTERN_REVERSE = {1, 2, 1, 1, 1, 3, 1, 1, 7};
    private final BinaryBitmap image;

    public Detector(BinaryBitmap binaryBitmap) {
        this.image = binaryBitmap;
    }

    private static int computeDimension(ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, ResultPoint resultPoint4, float f) {
        return ((((round(ResultPoint.distance(resultPoint, resultPoint2) / f) + round(ResultPoint.distance(resultPoint3, resultPoint4) / f)) >> 1) + 8) / 17) * 17;
    }

    private static float computeModuleWidth(ResultPoint[] resultPointArr) {
        return (((ResultPoint.distance(resultPointArr[0], resultPointArr[4]) + ResultPoint.distance(resultPointArr[1], resultPointArr[5])) / 34.0f) + ((ResultPoint.distance(resultPointArr[6], resultPointArr[2]) + ResultPoint.distance(resultPointArr[7], resultPointArr[3])) / 36.0f)) / 2.0f;
    }

    private static void correctCodeWordVertices(ResultPoint[] resultPointArr, boolean z) {
        float y = resultPointArr[4].getY() - resultPointArr[6].getY();
        float f = y;
        if (z) {
            f = -y;
        }
        if (f > 2.0f) {
            float x = resultPointArr[4].getX();
            float x2 = resultPointArr[0].getX();
            float x3 = resultPointArr[6].getX();
            float x4 = resultPointArr[0].getX();
            resultPointArr[4] = new ResultPoint(resultPointArr[4].getX(), resultPointArr[4].getY() + (((x - x2) * (resultPointArr[6].getY() - resultPointArr[0].getY())) / (x3 - x4)));
        } else if ((-f) > 2.0f) {
            float x5 = resultPointArr[2].getX();
            float x6 = resultPointArr[6].getX();
            float x7 = resultPointArr[2].getX();
            float x8 = resultPointArr[4].getX();
            resultPointArr[6] = new ResultPoint(resultPointArr[6].getX(), resultPointArr[6].getY() - (((x5 - x6) * (resultPointArr[2].getY() - resultPointArr[4].getY())) / (x7 - x8)));
        }
        float y2 = resultPointArr[7].getY() - resultPointArr[5].getY();
        float f2 = y2;
        if (z) {
            f2 = -y2;
        }
        if (f2 > 2.0f) {
            float x9 = resultPointArr[5].getX();
            float x10 = resultPointArr[1].getX();
            float x11 = resultPointArr[7].getX();
            float x12 = resultPointArr[1].getX();
            resultPointArr[5] = new ResultPoint(resultPointArr[5].getX(), resultPointArr[5].getY() + (((x9 - x10) * (resultPointArr[7].getY() - resultPointArr[1].getY())) / (x11 - x12)));
        } else if ((-f2) <= 2.0f) {
        } else {
            float x13 = resultPointArr[3].getX();
            float x14 = resultPointArr[7].getX();
            float x15 = resultPointArr[3].getX();
            float x16 = resultPointArr[5].getX();
            resultPointArr[7] = new ResultPoint(resultPointArr[7].getX(), resultPointArr[7].getY() - (((x13 - x14) * (resultPointArr[3].getY() - resultPointArr[5].getY())) / (x15 - x16)));
        }
    }

    private static int[] findGuardPattern(BitMatrix bitMatrix, int i, int i2, int i3, boolean z, int[] iArr, int[] iArr2) {
        int[] iArr3;
        Arrays.fill(iArr2, 0, iArr2.length, 0);
        int length = iArr.length;
        int i4 = 0;
        int i5 = i;
        int i6 = i;
        while (true) {
            if (i6 >= i + i3) {
                iArr3 = null;
                break;
            }
            if (bitMatrix.get(i6, i2) ^ z) {
                iArr2[i4] = iArr2[i4] + 1;
            } else {
                if (i4 != length - 1) {
                    i4++;
                } else if (patternMatchVariance(iArr2, iArr, 204) < MAX_AVG_VARIANCE) {
                    iArr3 = new int[]{i5, i6};
                    break;
                } else {
                    i5 += iArr2[0] + iArr2[1];
                    System.arraycopy(iArr2, 2, iArr2, 0, length - 2);
                    iArr2[length - 2] = 0;
                    iArr2[length - 1] = 0;
                    i4--;
                }
                iArr2[i4] = 1;
                z = !z;
            }
            i6++;
        }
        return iArr3;
    }

    private static ResultPoint[] findVertices(BitMatrix bitMatrix) {
        boolean z;
        int[] findGuardPattern;
        int[] findGuardPattern2;
        int[] findGuardPattern3;
        int[] findGuardPattern4;
        int height = bitMatrix.getHeight();
        int width = bitMatrix.getWidth();
        ResultPoint[] resultPointArr = new ResultPoint[8];
        int[] iArr = new int[START_PATTERN.length];
        int i = 0;
        while (true) {
            z = false;
            if (i >= height) {
                break;
            }
            if (findGuardPattern(bitMatrix, 0, i, width, false, START_PATTERN, iArr) != null) {
                resultPointArr[0] = new ResultPoint(findGuardPattern4[0], i);
                resultPointArr[4] = new ResultPoint(findGuardPattern4[1], i);
                z = true;
                break;
            }
            i++;
        }
        boolean z2 = z;
        if (z) {
            int i2 = height - 1;
            while (true) {
                z2 = false;
                if (i2 <= 0) {
                    break;
                }
                if (findGuardPattern(bitMatrix, 0, i2, width, false, START_PATTERN, iArr) != null) {
                    resultPointArr[1] = new ResultPoint(findGuardPattern3[0], i2);
                    resultPointArr[5] = new ResultPoint(findGuardPattern3[1], i2);
                    z2 = true;
                    break;
                }
                i2--;
            }
        }
        int[] iArr2 = new int[STOP_PATTERN.length];
        boolean z3 = z2;
        if (z2) {
            int i3 = 0;
            while (true) {
                z3 = false;
                if (i3 >= height) {
                    break;
                }
                if (findGuardPattern(bitMatrix, 0, i3, width, false, STOP_PATTERN, iArr2) != null) {
                    resultPointArr[2] = new ResultPoint(findGuardPattern2[1], i3);
                    resultPointArr[6] = new ResultPoint(findGuardPattern2[0], i3);
                    z3 = true;
                    break;
                }
                i3++;
            }
        }
        boolean z4 = z3;
        if (z3) {
            int i4 = height - 1;
            while (true) {
                z4 = false;
                if (i4 <= 0) {
                    break;
                }
                if (findGuardPattern(bitMatrix, 0, i4, width, false, STOP_PATTERN, iArr2) != null) {
                    resultPointArr[3] = new ResultPoint(findGuardPattern[1], i4);
                    resultPointArr[7] = new ResultPoint(findGuardPattern[0], i4);
                    z4 = true;
                    break;
                }
                i4--;
            }
        }
        return z4 ? resultPointArr : null;
    }

    private static ResultPoint[] findVertices180(BitMatrix bitMatrix) {
        boolean z;
        int[] findGuardPattern;
        int[] findGuardPattern2;
        int[] findGuardPattern3;
        int[] findGuardPattern4;
        int height = bitMatrix.getHeight();
        int width = bitMatrix.getWidth() >> 1;
        ResultPoint[] resultPointArr = new ResultPoint[8];
        int[] iArr = new int[START_PATTERN_REVERSE.length];
        int i = height - 1;
        while (true) {
            z = false;
            if (i <= 0) {
                break;
            }
            if (findGuardPattern(bitMatrix, width, i, width, true, START_PATTERN_REVERSE, iArr) != null) {
                resultPointArr[0] = new ResultPoint(findGuardPattern4[1], i);
                resultPointArr[4] = new ResultPoint(findGuardPattern4[0], i);
                z = true;
                break;
            }
            i--;
        }
        boolean z2 = z;
        if (z) {
            int i2 = 0;
            while (true) {
                z2 = false;
                if (i2 >= height) {
                    break;
                }
                if (findGuardPattern(bitMatrix, width, i2, width, true, START_PATTERN_REVERSE, iArr) != null) {
                    resultPointArr[1] = new ResultPoint(findGuardPattern3[1], i2);
                    resultPointArr[5] = new ResultPoint(findGuardPattern3[0], i2);
                    z2 = true;
                    break;
                }
                i2++;
            }
        }
        int[] iArr2 = new int[STOP_PATTERN_REVERSE.length];
        boolean z3 = z2;
        if (z2) {
            int i3 = height - 1;
            while (true) {
                z3 = false;
                if (i3 <= 0) {
                    break;
                }
                if (findGuardPattern(bitMatrix, 0, i3, width, false, STOP_PATTERN_REVERSE, iArr2) != null) {
                    resultPointArr[2] = new ResultPoint(findGuardPattern2[0], i3);
                    resultPointArr[6] = new ResultPoint(findGuardPattern2[1], i3);
                    z3 = true;
                    break;
                }
                i3--;
            }
        }
        boolean z4 = z3;
        if (z3) {
            int i4 = 0;
            while (true) {
                z4 = false;
                if (i4 >= height) {
                    break;
                }
                if (findGuardPattern(bitMatrix, 0, i4, width, false, STOP_PATTERN_REVERSE, iArr2) != null) {
                    resultPointArr[3] = new ResultPoint(findGuardPattern[0], i4);
                    resultPointArr[7] = new ResultPoint(findGuardPattern[1], i4);
                    z4 = true;
                    break;
                }
                i4++;
            }
        }
        return z4 ? resultPointArr : null;
    }

    private static int patternMatchVariance(int[] iArr, int[] iArr2, int i) {
        int i2;
        int length = iArr.length;
        int i3 = 0;
        int i4 = 0;
        for (int i5 = 0; i5 < length; i5++) {
            i3 += iArr[i5];
            i4 += iArr2[i5];
        }
        if (i3 >= i4) {
            int i6 = (i3 << 8) / i4;
            int i7 = 0;
            int i8 = 0;
            while (true) {
                if (i8 >= length) {
                    i2 = i7 / i3;
                    break;
                }
                int i9 = iArr[i8] << 8;
                int i10 = iArr2[i8] * i6;
                int i11 = i9 > i10 ? i9 - i10 : i10 - i9;
                i2 = Integer.MAX_VALUE;
                if (i11 > ((i * i6) >> 8)) {
                    break;
                }
                i7 += i11;
                i8++;
            }
        } else {
            i2 = Integer.MAX_VALUE;
        }
        return i2;
    }

    private static int round(float f) {
        return (int) (0.5f + f);
    }

    private static BitMatrix sampleGrid(BitMatrix bitMatrix, ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, ResultPoint resultPoint4, int i) throws NotFoundException {
        return GridSampler.getInstance().sampleGrid(bitMatrix, i, i, 0.0f, 0.0f, i, 0.0f, i, i, 0.0f, i, resultPoint.getX(), resultPoint.getY(), resultPoint3.getX(), resultPoint3.getY(), resultPoint4.getX(), resultPoint4.getY(), resultPoint2.getX(), resultPoint2.getY());
    }

    public DetectorResult detect() throws NotFoundException {
        return detect(null);
    }

    public DetectorResult detect(Map<DecodeHintType, ?> map) throws NotFoundException {
        BitMatrix blackMatrix = this.image.getBlackMatrix();
        ResultPoint[] findVertices = findVertices(blackMatrix);
        if (findVertices == null) {
            ResultPoint[] findVertices180 = findVertices180(blackMatrix);
            findVertices = findVertices180;
            if (findVertices180 != null) {
                correctCodeWordVertices(findVertices180, true);
                findVertices = findVertices180;
            }
        } else {
            correctCodeWordVertices(findVertices, false);
        }
        if (findVertices == null) {
            throw NotFoundException.getNotFoundInstance();
        }
        float computeModuleWidth = computeModuleWidth(findVertices);
        if (computeModuleWidth < 1.0f) {
            throw NotFoundException.getNotFoundInstance();
        }
        int computeDimension = computeDimension(findVertices[4], findVertices[6], findVertices[5], findVertices[7], computeModuleWidth);
        if (computeDimension >= 1) {
            return new DetectorResult(sampleGrid(blackMatrix, findVertices[4], findVertices[5], findVertices[6], findVertices[7], computeDimension), new ResultPoint[]{findVertices[5], findVertices[4], findVertices[6], findVertices[7]});
        }
        throw NotFoundException.getNotFoundInstance();
    }
}
