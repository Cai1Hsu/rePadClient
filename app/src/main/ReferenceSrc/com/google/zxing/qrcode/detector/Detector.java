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

/* loaded from: classes.dex */
public class Detector {
    private final BitMatrix image;
    private ResultPointCallback resultPointCallback;

    public Detector(BitMatrix image) {
        this.image = image;
    }

    protected BitMatrix getImage() {
        return this.image;
    }

    protected ResultPointCallback getResultPointCallback() {
        return this.resultPointCallback;
    }

    public DetectorResult detect() throws NotFoundException, FormatException {
        return detect(null);
    }

    public DetectorResult detect(Map<DecodeHintType, ?> hints) throws NotFoundException, FormatException {
        this.resultPointCallback = hints == null ? null : (ResultPointCallback) hints.get(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
        FinderPatternFinder finder = new FinderPatternFinder(this.image, this.resultPointCallback);
        FinderPatternInfo info = finder.find(hints);
        return processFinderPatternInfo(info);
    }

    protected DetectorResult processFinderPatternInfo(FinderPatternInfo info) throws NotFoundException, FormatException {
        FinderPattern topLeft = info.getTopLeft();
        FinderPattern topRight = info.getTopRight();
        FinderPattern bottomLeft = info.getBottomLeft();
        float moduleSize = calculateModuleSize(topLeft, topRight, bottomLeft);
        if (moduleSize < 1.0f) {
            throw NotFoundException.getNotFoundInstance();
        }
        int dimension = computeDimension(topLeft, topRight, bottomLeft, moduleSize);
        Version provisionalVersion = Version.getProvisionalVersionForDimension(dimension);
        int modulesBetweenFPCenters = provisionalVersion.getDimensionForVersion() - 7;
        AlignmentPattern alignmentPattern = null;
        if (provisionalVersion.getAlignmentPatternCenters().length > 0) {
            float bottomRightX = (topRight.getX() - topLeft.getX()) + bottomLeft.getX();
            float bottomRightY = (topRight.getY() - topLeft.getY()) + bottomLeft.getY();
            float correctionToTopLeft = 1.0f - (3.0f / modulesBetweenFPCenters);
            int estAlignmentX = (int) (topLeft.getX() + ((bottomRightX - topLeft.getX()) * correctionToTopLeft));
            int estAlignmentY = (int) (topLeft.getY() + ((bottomRightY - topLeft.getY()) * correctionToTopLeft));
            for (int i = 4; i <= 16; i <<= 1) {
                try {
                    alignmentPattern = findAlignmentInRegion(moduleSize, estAlignmentX, estAlignmentY, i);
                    break;
                } catch (NotFoundException e) {
                }
            }
        }
        PerspectiveTransform transform = createTransform(topLeft, topRight, bottomLeft, alignmentPattern, dimension);
        BitMatrix bits = sampleGrid(this.image, transform, dimension);
        ResultPoint[] points = alignmentPattern == null ? new ResultPoint[]{bottomLeft, topLeft, topRight} : new ResultPoint[]{bottomLeft, topLeft, topRight, alignmentPattern};
        return new DetectorResult(bits, points);
    }

    public static PerspectiveTransform createTransform(ResultPoint topLeft, ResultPoint topRight, ResultPoint bottomLeft, ResultPoint alignmentPattern, int dimension) {
        float bottomRightX;
        float bottomRightY;
        float sourceBottomRightY;
        float sourceBottomRightX;
        float dimMinusThree = dimension - 3.5f;
        if (alignmentPattern != null) {
            bottomRightX = alignmentPattern.getX();
            bottomRightY = alignmentPattern.getY();
            sourceBottomRightY = dimMinusThree - 3.0f;
            sourceBottomRightX = sourceBottomRightY;
        } else {
            bottomRightX = (topRight.getX() - topLeft.getX()) + bottomLeft.getX();
            bottomRightY = (topRight.getY() - topLeft.getY()) + bottomLeft.getY();
            sourceBottomRightY = dimMinusThree;
            sourceBottomRightX = dimMinusThree;
        }
        return PerspectiveTransform.quadrilateralToQuadrilateral(3.5f, 3.5f, dimMinusThree, 3.5f, sourceBottomRightX, sourceBottomRightY, 3.5f, dimMinusThree, topLeft.getX(), topLeft.getY(), topRight.getX(), topRight.getY(), bottomRightX, bottomRightY, bottomLeft.getX(), bottomLeft.getY());
    }

    private static BitMatrix sampleGrid(BitMatrix image, PerspectiveTransform transform, int dimension) throws NotFoundException {
        GridSampler sampler = GridSampler.getInstance();
        return sampler.sampleGrid(image, dimension, dimension, transform);
    }

    protected static int computeDimension(ResultPoint topLeft, ResultPoint topRight, ResultPoint bottomLeft, float moduleSize) throws NotFoundException {
        int tltrCentersDimension = round(ResultPoint.distance(topLeft, topRight) / moduleSize);
        int tlblCentersDimension = round(ResultPoint.distance(topLeft, bottomLeft) / moduleSize);
        int dimension = ((tltrCentersDimension + tlblCentersDimension) >> 1) + 7;
        switch (dimension & 3) {
            case 0:
                return dimension + 1;
            case 1:
            default:
                return dimension;
            case 2:
                return dimension - 1;
            case 3:
                throw NotFoundException.getNotFoundInstance();
        }
    }

    protected float calculateModuleSize(ResultPoint topLeft, ResultPoint topRight, ResultPoint bottomLeft) {
        return (calculateModuleSizeOneWay(topLeft, topRight) + calculateModuleSizeOneWay(topLeft, bottomLeft)) / 2.0f;
    }

    private float calculateModuleSizeOneWay(ResultPoint pattern, ResultPoint otherPattern) {
        float moduleSizeEst1 = sizeOfBlackWhiteBlackRunBothWays((int) pattern.getX(), (int) pattern.getY(), (int) otherPattern.getX(), (int) otherPattern.getY());
        float moduleSizeEst2 = sizeOfBlackWhiteBlackRunBothWays((int) otherPattern.getX(), (int) otherPattern.getY(), (int) pattern.getX(), (int) pattern.getY());
        if (Float.isNaN(moduleSizeEst1)) {
            return moduleSizeEst2 / 7.0f;
        }
        if (Float.isNaN(moduleSizeEst2)) {
            return moduleSizeEst1 / 7.0f;
        }
        return (moduleSizeEst1 + moduleSizeEst2) / 14.0f;
    }

    private float sizeOfBlackWhiteBlackRunBothWays(int fromX, int fromY, int toX, int toY) {
        float result = sizeOfBlackWhiteBlackRun(fromX, fromY, toX, toY);
        float scale = 1.0f;
        int otherToX = fromX - (toX - fromX);
        if (otherToX < 0) {
            scale = fromX / (fromX - otherToX);
            otherToX = 0;
        } else if (otherToX >= this.image.getWidth()) {
            scale = ((this.image.getWidth() - 1) - fromX) / (otherToX - fromX);
            otherToX = this.image.getWidth() - 1;
        }
        int otherToY = (int) (fromY - ((toY - fromY) * scale));
        float scale2 = 1.0f;
        if (otherToY < 0) {
            scale2 = fromY / (fromY - otherToY);
            otherToY = 0;
        } else if (otherToY >= this.image.getHeight()) {
            scale2 = ((this.image.getHeight() - 1) - fromY) / (otherToY - fromY);
            otherToY = this.image.getHeight() - 1;
        }
        return (result + sizeOfBlackWhiteBlackRun(fromX, fromY, (int) (fromX + ((otherToX - fromX) * scale2)), otherToY)) - 1.0f;
    }

    private float sizeOfBlackWhiteBlackRun(int fromX, int fromY, int toX, int toY) {
        boolean steep = Math.abs(toY - fromY) > Math.abs(toX - fromX);
        if (steep) {
            fromX = fromY;
            fromY = fromX;
            toX = toY;
            toY = toX;
        }
        int dx = Math.abs(toX - fromX);
        int dy = Math.abs(toY - fromY);
        int error = (-dx) >> 1;
        int xstep = fromX < toX ? 1 : -1;
        int ystep = fromY < toY ? 1 : -1;
        int state = 0;
        int xLimit = toX + xstep;
        int y = fromY;
        for (int x = fromX; x != xLimit; x += xstep) {
            int realX = steep ? y : x;
            int realY = steep ? x : y;
            if ((state == 1) == this.image.get(realX, realY)) {
                if (state == 2) {
                    int diffX = x - fromX;
                    int diffY = y - fromY;
                    return (float) Math.sqrt((diffX * diffX) + (diffY * diffY));
                }
                state++;
            }
            error += dy;
            if (error > 0) {
                if (y == toY) {
                    break;
                }
                y += ystep;
                error -= dx;
            }
        }
        if (state == 2) {
            int diffX2 = (toX + xstep) - fromX;
            int diffY2 = toY - fromY;
            return (float) Math.sqrt((diffX2 * diffX2) + (diffY2 * diffY2));
        }
        return Float.NaN;
    }

    protected AlignmentPattern findAlignmentInRegion(float overallEstModuleSize, int estAlignmentX, int estAlignmentY, float allowanceFactor) throws NotFoundException {
        int allowance = (int) (allowanceFactor * overallEstModuleSize);
        int alignmentAreaLeftX = Math.max(0, estAlignmentX - allowance);
        int alignmentAreaRightX = Math.min(this.image.getWidth() - 1, estAlignmentX + allowance);
        if (alignmentAreaRightX - alignmentAreaLeftX < overallEstModuleSize * 3.0f) {
            throw NotFoundException.getNotFoundInstance();
        }
        int alignmentAreaTopY = Math.max(0, estAlignmentY - allowance);
        int alignmentAreaBottomY = Math.min(this.image.getHeight() - 1, estAlignmentY + allowance);
        if (alignmentAreaBottomY - alignmentAreaTopY < overallEstModuleSize * 3.0f) {
            throw NotFoundException.getNotFoundInstance();
        }
        AlignmentPatternFinder alignmentFinder = new AlignmentPatternFinder(this.image, alignmentAreaLeftX, alignmentAreaTopY, alignmentAreaRightX - alignmentAreaLeftX, alignmentAreaBottomY - alignmentAreaTopY, overallEstModuleSize, this.resultPointCallback);
        return alignmentFinder.find();
    }

    private static int round(float d) {
        return (int) (0.5f + d);
    }
}
