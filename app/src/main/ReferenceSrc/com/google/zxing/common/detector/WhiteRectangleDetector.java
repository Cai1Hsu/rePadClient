package com.google.zxing.common.detector;

import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;

/* loaded from: classes.jar:com/google/zxing/common/detector/WhiteRectangleDetector.class */
public final class WhiteRectangleDetector {
    private static final int CORR = 1;
    private static final int INIT_SIZE = 30;
    private final int downInit;
    private final int height;
    private final BitMatrix image;
    private final int leftInit;
    private final int rightInit;
    private final int upInit;
    private final int width;

    public WhiteRectangleDetector(BitMatrix bitMatrix) throws NotFoundException {
        this.image = bitMatrix;
        this.height = bitMatrix.getHeight();
        this.width = bitMatrix.getWidth();
        this.leftInit = (this.width - 30) >> 1;
        this.rightInit = (this.width + 30) >> 1;
        this.upInit = (this.height - 30) >> 1;
        this.downInit = (this.height + 30) >> 1;
        if (this.upInit < 0 || this.leftInit < 0 || this.downInit >= this.height || this.rightInit >= this.width) {
            throw NotFoundException.getNotFoundInstance();
        }
    }

    public WhiteRectangleDetector(BitMatrix bitMatrix, int i, int i2, int i3) throws NotFoundException {
        this.image = bitMatrix;
        this.height = bitMatrix.getHeight();
        this.width = bitMatrix.getWidth();
        int i4 = i >> 1;
        this.leftInit = i2 - i4;
        this.rightInit = i2 + i4;
        this.upInit = i3 - i4;
        this.downInit = i3 + i4;
        if (this.upInit < 0 || this.leftInit < 0 || this.downInit >= this.height || this.rightInit >= this.width) {
            throw NotFoundException.getNotFoundInstance();
        }
    }

    private ResultPoint[] centerEdges(ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, ResultPoint resultPoint4) {
        float x = resultPoint.getX();
        float y = resultPoint.getY();
        float x2 = resultPoint2.getX();
        float y2 = resultPoint2.getY();
        float x3 = resultPoint3.getX();
        float y3 = resultPoint3.getY();
        float x4 = resultPoint4.getX();
        float y4 = resultPoint4.getY();
        return x < ((float) (this.width / 2)) ? new ResultPoint[]{new ResultPoint(x4 - 1.0f, 1.0f + y4), new ResultPoint(1.0f + x2, 1.0f + y2), new ResultPoint(x3 - 1.0f, y3 - 1.0f), new ResultPoint(1.0f + x, y - 1.0f)} : new ResultPoint[]{new ResultPoint(1.0f + x4, 1.0f + y4), new ResultPoint(1.0f + x2, y2 - 1.0f), new ResultPoint(x3 - 1.0f, 1.0f + y3), new ResultPoint(x - 1.0f, y - 1.0f)};
    }

    private boolean containsBlackPoint(int i, int i2, int i3, boolean z) {
        boolean z2;
        if (z) {
            while (i <= i2) {
                if (this.image.get(i, i3)) {
                    z2 = true;
                    break;
                }
                i++;
            }
            z2 = false;
        } else {
            while (i <= i2) {
                z2 = true;
                if (this.image.get(i3, i)) {
                    break;
                }
                i++;
            }
            z2 = false;
        }
        return z2;
    }

    private static int distanceL2(float f, float f2, float f3, float f4) {
        float f5 = f - f3;
        float f6 = f2 - f4;
        return round((float) Math.sqrt((f5 * f5) + (f6 * f6)));
    }

    private ResultPoint getBlackPointOnSegment(float f, float f2, float f3, float f4) {
        ResultPoint resultPoint;
        int distanceL2 = distanceL2(f, f2, f3, f4);
        float f5 = (f3 - f) / distanceL2;
        float f6 = (f4 - f2) / distanceL2;
        int i = 0;
        while (true) {
            if (i >= distanceL2) {
                resultPoint = null;
                break;
            }
            int round = round((i * f5) + f);
            int round2 = round((i * f6) + f2);
            if (this.image.get(round, round2)) {
                resultPoint = new ResultPoint(round, round2);
                break;
            }
            i++;
        }
        return resultPoint;
    }

    private static int round(float f) {
        return (int) (0.5f + f);
    }

    public ResultPoint[] detect() throws NotFoundException {
        int i;
        int i2;
        int i3;
        boolean z;
        int i4;
        ResultPoint resultPoint;
        ResultPoint resultPoint2;
        ResultPoint resultPoint3;
        int i5 = this.leftInit;
        int i6 = this.rightInit;
        int i7 = this.upInit;
        int i8 = this.downInit;
        boolean z2 = true;
        boolean z3 = false;
        while (true) {
            i = i8;
            i2 = i5;
            i3 = i6;
            z = false;
            i4 = i7;
            if (!z2) {
                break;
            }
            boolean z4 = true;
            i3 = i6;
            boolean z5 = false;
            while (z4 && i3 < this.width) {
                boolean containsBlackPoint = containsBlackPoint(i7, i8, i3, false);
                z4 = containsBlackPoint;
                if (containsBlackPoint) {
                    i3++;
                    z5 = true;
                    z4 = containsBlackPoint;
                }
            }
            if (i3 >= this.width) {
                z = true;
                i4 = i7;
                i2 = i5;
                i = i8;
                break;
            }
            boolean z6 = true;
            int i9 = i8;
            boolean z7 = z5;
            while (z6 && i9 < this.height) {
                boolean containsBlackPoint2 = containsBlackPoint(i5, i3, i9, true);
                z6 = containsBlackPoint2;
                if (containsBlackPoint2) {
                    i9++;
                    z7 = true;
                    z6 = containsBlackPoint2;
                }
            }
            if (i9 >= this.height) {
                i = i9;
                i2 = i5;
                z = true;
                i4 = i7;
                break;
            }
            boolean z8 = true;
            i2 = i5;
            while (z8 && i2 >= 0) {
                boolean containsBlackPoint3 = containsBlackPoint(i7, i9, i2, false);
                z8 = containsBlackPoint3;
                if (containsBlackPoint3) {
                    i2--;
                    z7 = true;
                    z8 = containsBlackPoint3;
                }
            }
            if (i2 < 0) {
                i = i9;
                z = true;
                i4 = i7;
                break;
            }
            boolean z9 = true;
            i4 = i7;
            boolean z10 = z7;
            while (z9 && i4 >= 0) {
                boolean containsBlackPoint4 = containsBlackPoint(i2, i3, i4, true);
                z9 = containsBlackPoint4;
                if (containsBlackPoint4) {
                    i4--;
                    z10 = true;
                    z9 = containsBlackPoint4;
                }
            }
            if (i4 < 0) {
                i = i9;
                z = true;
                break;
            }
            z2 = z10;
            i8 = i9;
            i5 = i2;
            i6 = i3;
            i7 = i4;
            if (z10) {
                z3 = true;
                z2 = z10;
                i8 = i9;
                i5 = i2;
                i6 = i3;
                i7 = i4;
            }
        }
        if (z || !z3) {
            throw NotFoundException.getNotFoundInstance();
        }
        int i10 = i3 - i2;
        ResultPoint resultPoint4 = null;
        int i11 = 1;
        while (true) {
            resultPoint = resultPoint4;
            if (i11 >= i10) {
                break;
            }
            resultPoint4 = getBlackPointOnSegment(i2, i - i11, i2 + i11, i);
            if (resultPoint4 != null) {
                resultPoint = resultPoint4;
                break;
            }
            i11++;
        }
        if (resultPoint == null) {
            throw NotFoundException.getNotFoundInstance();
        }
        ResultPoint resultPoint5 = null;
        int i12 = 1;
        while (true) {
            resultPoint2 = resultPoint5;
            if (i12 >= i10) {
                break;
            }
            resultPoint5 = getBlackPointOnSegment(i2, i4 + i12, i2 + i12, i4);
            if (resultPoint5 != null) {
                resultPoint2 = resultPoint5;
                break;
            }
            i12++;
        }
        if (resultPoint2 == null) {
            throw NotFoundException.getNotFoundInstance();
        }
        ResultPoint resultPoint6 = null;
        int i13 = 1;
        while (true) {
            resultPoint3 = resultPoint6;
            if (i13 >= i10) {
                break;
            }
            resultPoint6 = getBlackPointOnSegment(i3, i4 + i13, i3 - i13, i4);
            if (resultPoint6 != null) {
                resultPoint3 = resultPoint6;
                break;
            }
            i13++;
        }
        if (resultPoint3 == null) {
            throw NotFoundException.getNotFoundInstance();
        }
        ResultPoint resultPoint7 = null;
        for (int i14 = 1; i14 < i10; i14++) {
            resultPoint7 = getBlackPointOnSegment(i3, i - i14, i3 - i14, i);
            if (resultPoint7 != null) {
                break;
            }
        }
        if (resultPoint7 != null) {
            return centerEdges(resultPoint7, resultPoint, resultPoint3, resultPoint2);
        }
        throw NotFoundException.getNotFoundInstance();
    }
}
