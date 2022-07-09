package com.google.zxing.qrcode.detector;

import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DetectorResult;
import com.google.zxing.common.GridSampler;
import com.google.zxing.common.PerspectiveTransform;
import com.google.zxing.qrcode.decoder.Version;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/qrcode/detector/Detector.class */
public class Detector {
    private final BitMatrix image;
    private ResultPointCallback resultPointCallback;

    public Detector(BitMatrix bitMatrix) {
        this.image = bitMatrix;
    }

    private float calculateModuleSizeOneWay(ResultPoint resultPoint, ResultPoint resultPoint2) {
        float sizeOfBlackWhiteBlackRunBothWays = sizeOfBlackWhiteBlackRunBothWays((int) resultPoint.getX(), (int) resultPoint.getY(), (int) resultPoint2.getX(), (int) resultPoint2.getY());
        float sizeOfBlackWhiteBlackRunBothWays2 = sizeOfBlackWhiteBlackRunBothWays((int) resultPoint2.getX(), (int) resultPoint2.getY(), (int) resultPoint.getX(), (int) resultPoint.getY());
        return Float.isNaN(sizeOfBlackWhiteBlackRunBothWays) ? sizeOfBlackWhiteBlackRunBothWays2 / 7.0f : Float.isNaN(sizeOfBlackWhiteBlackRunBothWays2) ? sizeOfBlackWhiteBlackRunBothWays / 7.0f : (sizeOfBlackWhiteBlackRunBothWays + sizeOfBlackWhiteBlackRunBothWays2) / 14.0f;
    }

    protected static int computeDimension(ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, float f) throws NotFoundException {
        int round = ((round(ResultPoint.distance(resultPoint, resultPoint2) / f) + round(ResultPoint.distance(resultPoint, resultPoint3) / f)) >> 1) + 7;
        int i = round;
        switch (round & 3) {
            case 0:
                i = round + 1;
                break;
            case 1:
                break;
            case 2:
                i = round - 1;
                break;
            case 3:
                throw NotFoundException.getNotFoundInstance();
            default:
                i = round;
                break;
        }
        return i;
    }

    public static PerspectiveTransform createTransform(ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, ResultPoint resultPoint4, int i) {
        float x;
        float y;
        float f;
        float f2;
        float f3 = i - 3.5f;
        if (resultPoint4 != null) {
            x = resultPoint4.getX();
            y = resultPoint4.getY();
            f = f3 - 3.0f;
            f2 = f;
        } else {
            x = (resultPoint2.getX() - resultPoint.getX()) + resultPoint3.getX();
            y = (resultPoint2.getY() - resultPoint.getY()) + resultPoint3.getY();
            f = f3;
            f2 = f3;
        }
        return PerspectiveTransform.quadrilateralToQuadrilateral(3.5f, 3.5f, f3, 3.5f, f2, f, 3.5f, f3, resultPoint.getX(), resultPoint.getY(), resultPoint2.getX(), resultPoint2.getY(), x, y, resultPoint3.getX(), resultPoint3.getY());
    }

    private static int round(float f) {
        return (int) (0.5f + f);
    }

    private static BitMatrix sampleGrid(BitMatrix bitMatrix, PerspectiveTransform perspectiveTransform, int i) throws NotFoundException {
        return GridSampler.getInstance().sampleGrid(bitMatrix, i, i, perspectiveTransform);
    }

    private float sizeOfBlackWhiteBlackRun(int i, int i2, int i3, int i4) {
        int i5;
        float f;
        boolean z = Math.abs(i4 - i2) > Math.abs(i3 - i);
        int i6 = i;
        int i7 = i2;
        int i8 = i3;
        int i9 = i4;
        if (z) {
            i9 = i3;
            i8 = i4;
            i7 = i;
            i6 = i2;
        }
        int abs = Math.abs(i8 - i6);
        int abs2 = Math.abs(i9 - i7);
        int i10 = (-abs) >> 1;
        int i11 = i6 < i8 ? 1 : -1;
        int i12 = i7 < i9 ? 1 : -1;
        int i13 = 0;
        int i14 = i6;
        int i15 = i7;
        while (true) {
            int i16 = i15;
            i5 = i13;
            if (i14 == i8 + i11) {
                break;
            }
            i5 = i13;
            if ((i13 == 1) == this.image.get(z ? i16 : i14, z ? i14 : i16)) {
                if (i13 == 2) {
                    int i17 = i14 - i6;
                    int i18 = i16 - i7;
                    f = (float) Math.sqrt((i17 * i17) + (i18 * i18));
                    break;
                }
                i5 = i13 + 1;
            }
            int i19 = i10 + abs2;
            int i20 = i19;
            int i21 = i16;
            if (i19 > 0) {
                if (i16 == i9) {
                    break;
                }
                i21 = i16 + i12;
                i20 = i19 - abs;
            }
            i14 += i11;
            i10 = i20;
            i13 = i5;
            i15 = i21;
        }
        if (i5 == 2) {
            int i22 = (i8 + i11) - i6;
            int i23 = i9 - i7;
            f = (float) Math.sqrt((i22 * i22) + (i23 * i23));
        } else {
            f = Float.NaN;
        }
        return f;
    }

    private float sizeOfBlackWhiteBlackRunBothWays(int i, int i2, int i3, int i4) {
        int i5;
        int i6;
        float sizeOfBlackWhiteBlackRun = sizeOfBlackWhiteBlackRun(i, i2, i3, i4);
        float f = 1.0f;
        int i7 = i - (i3 - i);
        if (i7 < 0) {
            f = i / (i - i7);
            i5 = 0;
        } else {
            i5 = i7;
            if (i7 >= this.image.getWidth()) {
                f = ((this.image.getWidth() - 1) - i) / (i7 - i);
                i5 = this.image.getWidth() - 1;
            }
        }
        int i8 = (int) (i2 - ((i4 - i2) * f));
        float f2 = 1.0f;
        if (i8 < 0) {
            f2 = i2 / (i2 - i8);
            i6 = 0;
        } else {
            i6 = i8;
            if (i8 >= this.image.getHeight()) {
                f2 = ((this.image.getHeight() - 1) - i2) / (i8 - i2);
                i6 = this.image.getHeight() - 1;
            }
        }
        return (sizeOfBlackWhiteBlackRun + sizeOfBlackWhiteBlackRun(i, i2, (int) (i + ((i5 - i) * f2)), i6)) - 1.0f;
    }

    protected float calculateModuleSize(ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3) {
        return (calculateModuleSizeOneWay(resultPoint, resultPoint2) + calculateModuleSizeOneWay(resultPoint, resultPoint3)) / 2.0f;
    }

    public DetectorResult detect() throws NotFoundException, FormatException {
        return detect(null);
    }

    public DetectorResult detect(Map<DecodeHintType, ?> map) throws NotFoundException, FormatException {
        this.resultPointCallback = map == null ? null : (ResultPointCallback) map.get(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
        return processFinderPatternInfo(new FinderPatternFinder(this.image, this.resultPointCallback).find(map));
    }

    protected AlignmentPattern findAlignmentInRegion(float f, int i, int i2, float f2) throws NotFoundException {
        int i3 = (int) (f2 * f);
        int max = Math.max(0, i - i3);
        int min = Math.min(this.image.getWidth() - 1, i + i3);
        if (min - max < f * 3.0f) {
            throw NotFoundException.getNotFoundInstance();
        }
        int max2 = Math.max(0, i2 - i3);
        int min2 = Math.min(this.image.getHeight() - 1, i2 + i3);
        if (min2 - max2 >= f * 3.0f) {
            return new AlignmentPatternFinder(this.image, max, max2, min - max, min2 - max2, f, this.resultPointCallback).find();
        }
        throw NotFoundException.getNotFoundInstance();
    }

    protected BitMatrix getImage() {
        return this.image;
    }

    protected ResultPointCallback getResultPointCallback() {
        return this.resultPointCallback;
    }

    protected DetectorResult processFinderPatternInfo(FinderPatternInfo finderPatternInfo) throws NotFoundException, FormatException {
        FinderPattern topLeft = finderPatternInfo.getTopLeft();
        FinderPattern topRight = finderPatternInfo.getTopRight();
        FinderPattern bottomLeft = finderPatternInfo.getBottomLeft();
        float calculateModuleSize = calculateModuleSize(topLeft, topRight, bottomLeft);
        if (calculateModuleSize < 1.0f) {
            throw NotFoundException.getNotFoundInstance();
        }
        int computeDimension = computeDimension(topLeft, topRight, bottomLeft, calculateModuleSize);
        Version provisionalVersionForDimension = Version.getProvisionalVersionForDimension(computeDimension);
        int dimensionForVersion = provisionalVersionForDimension.getDimensionForVersion();
        AlignmentPattern alignmentPattern = null;
        if (provisionalVersionForDimension.getAlignmentPatternCenters().length > 0) {
            float x = topRight.getX();
            float x2 = topLeft.getX();
            float x3 = bottomLeft.getX();
            float y = topRight.getY();
            float y2 = topLeft.getY();
            float y3 = bottomLeft.getY();
            float f = 1.0f - (3.0f / (dimensionForVersion - 7));
            int x4 = (int) (topLeft.getX() + ((((x - x2) + x3) - topLeft.getX()) * f));
            int y4 = (int) (topLeft.getY() + ((((y - y2) + y3) - topLeft.getY()) * f));
            int i = 4;
            while (true) {
                int i2 = i;
                alignmentPattern = null;
                if (i2 > 16) {
                    break;
                }
                try {
                    alignmentPattern = findAlignmentInRegion(calculateModuleSize, x4, y4, i2);
                    break;
                } catch (NotFoundException e) {
                    i = i2 << 1;
                }
            }
        }
        return new DetectorResult(sampleGrid(this.image, createTransform(topLeft, topRight, bottomLeft, alignmentPattern, computeDimension), computeDimension), alignmentPattern == null ? new ResultPoint[]{bottomLeft, topLeft, topRight} : new ResultPoint[]{bottomLeft, topLeft, topRight, alignmentPattern});
    }
}
