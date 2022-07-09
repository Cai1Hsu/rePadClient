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

/* loaded from: classes.dex */
public final class Detector {
    private boolean compact;
    private final BitMatrix image;
    private int nbCenterLayers;
    private int nbDataBlocks;
    private int nbLayers;
    private int shift;

    public Detector(BitMatrix image) {
        this.image = image;
    }

    public AztecDetectorResult detect() throws NotFoundException {
        Point pCenter = getMatrixCenter();
        Point[] bullEyeCornerPoints = getBullEyeCornerPoints(pCenter);
        extractParameters(bullEyeCornerPoints);
        ResultPoint[] corners = getMatrixCornerPoints(bullEyeCornerPoints);
        BitMatrix bits = sampleGrid(this.image, corners[this.shift % 4], corners[(this.shift + 3) % 4], corners[(this.shift + 2) % 4], corners[(this.shift + 1) % 4]);
        return new AztecDetectorResult(bits, corners, this.compact, this.nbDataBlocks, this.nbLayers);
    }

    private void extractParameters(Point[] bullEyeCornerPoints) throws NotFoundException {
        boolean[] parameterData;
        boolean[] resab = sampleLine(bullEyeCornerPoints[0], bullEyeCornerPoints[1], (this.nbCenterLayers * 2) + 1);
        boolean[] resbc = sampleLine(bullEyeCornerPoints[1], bullEyeCornerPoints[2], (this.nbCenterLayers * 2) + 1);
        boolean[] rescd = sampleLine(bullEyeCornerPoints[2], bullEyeCornerPoints[3], (this.nbCenterLayers * 2) + 1);
        boolean[] resda = sampleLine(bullEyeCornerPoints[3], bullEyeCornerPoints[0], (this.nbCenterLayers * 2) + 1);
        if (resab[0] && resab[this.nbCenterLayers * 2]) {
            this.shift = 0;
        } else if (resbc[0] && resbc[this.nbCenterLayers * 2]) {
            this.shift = 1;
        } else if (rescd[0] && rescd[this.nbCenterLayers * 2]) {
            this.shift = 2;
        } else if (resda[0] && resda[this.nbCenterLayers * 2]) {
            this.shift = 3;
        } else {
            throw NotFoundException.getNotFoundInstance();
        }
        if (this.compact) {
            boolean[] shiftedParameterData = new boolean[28];
            for (int i = 0; i < 7; i++) {
                shiftedParameterData[i] = resab[i + 2];
                shiftedParameterData[i + 7] = resbc[i + 2];
                shiftedParameterData[i + 14] = rescd[i + 2];
                shiftedParameterData[i + 21] = resda[i + 2];
            }
            parameterData = new boolean[28];
            for (int i2 = 0; i2 < 28; i2++) {
                parameterData[i2] = shiftedParameterData[((this.shift * 7) + i2) % 28];
            }
        } else {
            boolean[] shiftedParameterData2 = new boolean[40];
            for (int i3 = 0; i3 < 11; i3++) {
                if (i3 < 5) {
                    shiftedParameterData2[i3] = resab[i3 + 2];
                    shiftedParameterData2[i3 + 10] = resbc[i3 + 2];
                    shiftedParameterData2[i3 + 20] = rescd[i3 + 2];
                    shiftedParameterData2[i3 + 30] = resda[i3 + 2];
                }
                if (i3 > 5) {
                    shiftedParameterData2[i3 - 1] = resab[i3 + 2];
                    shiftedParameterData2[(i3 + 10) - 1] = resbc[i3 + 2];
                    shiftedParameterData2[(i3 + 20) - 1] = rescd[i3 + 2];
                    shiftedParameterData2[(i3 + 30) - 1] = resda[i3 + 2];
                }
            }
            parameterData = new boolean[40];
            for (int i4 = 0; i4 < 40; i4++) {
                parameterData[i4] = shiftedParameterData2[((this.shift * 10) + i4) % 40];
            }
        }
        correctParameterData(parameterData, this.compact);
        getParameters(parameterData);
    }

    private ResultPoint[] getMatrixCornerPoints(Point[] bullEyeCornerPoints) throws NotFoundException {
        float ratio = (((this.nbLayers > 4 ? 1 : 0) + (this.nbLayers * 2)) + ((this.nbLayers - 4) / 8)) / (2.0f * this.nbCenterLayers);
        int dx = bullEyeCornerPoints[0].x - bullEyeCornerPoints[2].x;
        int dx2 = dx + (dx > 0 ? 1 : -1);
        int dy = bullEyeCornerPoints[0].y - bullEyeCornerPoints[2].y;
        int dy2 = dy + (dy > 0 ? 1 : -1);
        int targetcx = round(bullEyeCornerPoints[2].x - (dx2 * ratio));
        int targetcy = round(bullEyeCornerPoints[2].y - (dy2 * ratio));
        int targetax = round(bullEyeCornerPoints[0].x + (dx2 * ratio));
        int targetay = round(bullEyeCornerPoints[0].y + (dy2 * ratio));
        int dx3 = bullEyeCornerPoints[1].x - bullEyeCornerPoints[3].x;
        int dx4 = dx3 + (dx3 > 0 ? 1 : -1);
        int dy3 = bullEyeCornerPoints[1].y - bullEyeCornerPoints[3].y;
        int dy4 = dy3 + (dy3 > 0 ? 1 : -1);
        int targetdx = round(bullEyeCornerPoints[3].x - (dx4 * ratio));
        int targetdy = round(bullEyeCornerPoints[3].y - (dy4 * ratio));
        int targetbx = round(bullEyeCornerPoints[1].x + (dx4 * ratio));
        int targetby = round(bullEyeCornerPoints[1].y + (dy4 * ratio));
        if (!isValid(targetax, targetay) || !isValid(targetbx, targetby) || !isValid(targetcx, targetcy) || !isValid(targetdx, targetdy)) {
            throw NotFoundException.getNotFoundInstance();
        }
        return new ResultPoint[]{new ResultPoint(targetax, targetay), new ResultPoint(targetbx, targetby), new ResultPoint(targetcx, targetcy), new ResultPoint(targetdx, targetdy)};
    }

    private static void correctParameterData(boolean[] parameterData, boolean compact) throws NotFoundException {
        int numCodewords;
        int numDataCodewords;
        if (compact) {
            numCodewords = 7;
            numDataCodewords = 2;
        } else {
            numCodewords = 10;
            numDataCodewords = 4;
        }
        int numECCodewords = numCodewords - numDataCodewords;
        int[] parameterWords = new int[numCodewords];
        for (int i = 0; i < numCodewords; i++) {
            int flag = 1;
            for (int j = 1; j <= 4; j++) {
                if (parameterData[((4 * i) + 4) - j]) {
                    parameterWords[i] = parameterWords[i] + flag;
                }
                flag <<= 1;
            }
        }
        try {
            ReedSolomonDecoder rsDecoder = new ReedSolomonDecoder(GenericGF.AZTEC_PARAM);
            rsDecoder.decode(parameterWords, numECCodewords);
            for (int i2 = 0; i2 < numDataCodewords; i2++) {
                int flag2 = 1;
                for (int j2 = 1; j2 <= 4; j2++) {
                    parameterData[((i2 * 4) + 4) - j2] = (parameterWords[i2] & flag2) == flag2;
                    flag2 <<= 1;
                }
            }
        } catch (ReedSolomonException e) {
            throw NotFoundException.getNotFoundInstance();
        }
    }

    private Point[] getBullEyeCornerPoints(Point pCenter) throws NotFoundException {
        Point pina = pCenter;
        Point pinb = pCenter;
        Point pinc = pCenter;
        Point pind = pCenter;
        boolean color = true;
        this.nbCenterLayers = 1;
        while (this.nbCenterLayers < 9) {
            Point pouta = getFirstDifferent(pina, color, 1, -1);
            Point poutb = getFirstDifferent(pinb, color, 1, 1);
            Point poutc = getFirstDifferent(pinc, color, -1, 1);
            Point poutd = getFirstDifferent(pind, color, -1, -1);
            if (this.nbCenterLayers > 2) {
                float q = (distance(poutd, pouta) * this.nbCenterLayers) / (distance(pind, pina) * (this.nbCenterLayers + 2));
                if (q >= 0.75d) {
                    if (q <= 1.25d) {
                        if (!isWhiteOrBlackRectangle(pouta, poutb, poutc, poutd)) {
                            break;
                        }
                    } else {
                        break;
                    }
                } else {
                    break;
                }
            }
            pina = pouta;
            pinb = poutb;
            pinc = poutc;
            pind = poutd;
            color = !color;
            this.nbCenterLayers++;
        }
        if (this.nbCenterLayers != 5 && this.nbCenterLayers != 7) {
            throw NotFoundException.getNotFoundInstance();
        }
        this.compact = this.nbCenterLayers == 5;
        float ratio = 1.5f / ((this.nbCenterLayers * 2) - 3);
        int dx = pina.x - pinc.x;
        int dy = pina.y - pinc.y;
        int targetcx = round(pinc.x - (dx * ratio));
        int targetcy = round(pinc.y - (dy * ratio));
        int targetax = round(pina.x + (dx * ratio));
        int targetay = round(pina.y + (dy * ratio));
        int dx2 = pinb.x - pind.x;
        int dy2 = pinb.y - pind.y;
        int targetdx = round(pind.x - (dx2 * ratio));
        int targetdy = round(pind.y - (dy2 * ratio));
        int targetbx = round(pinb.x + (dx2 * ratio));
        int targetby = round(pinb.y + (dy2 * ratio));
        if (!isValid(targetax, targetay) || !isValid(targetbx, targetby) || !isValid(targetcx, targetcy) || !isValid(targetdx, targetdy)) {
            throw NotFoundException.getNotFoundInstance();
        }
        Point pa = new Point(targetax, targetay);
        Point pb = new Point(targetbx, targetby);
        Point pc = new Point(targetcx, targetcy);
        Point pd = new Point(targetdx, targetdy);
        return new Point[]{pa, pb, pc, pd};
    }

    private Point getMatrixCenter() {
        ResultPoint pointA;
        ResultPoint pointB;
        ResultPoint pointC;
        ResultPoint pointD;
        ResultPoint pointA2;
        ResultPoint pointB2;
        ResultPoint pointC2;
        ResultPoint pointD2;
        try {
            ResultPoint[] cornerPoints = new WhiteRectangleDetector(this.image).detect();
            pointA = cornerPoints[0];
            pointB = cornerPoints[1];
            pointC = cornerPoints[2];
            pointD = cornerPoints[3];
        } catch (NotFoundException e) {
            int cx = this.image.getWidth() / 2;
            int cy = this.image.getHeight() / 2;
            pointA = getFirstDifferent(new Point(cx + 7, cy - 7), false, 1, -1).toResultPoint();
            pointB = getFirstDifferent(new Point(cx + 7, cy + 7), false, 1, 1).toResultPoint();
            pointC = getFirstDifferent(new Point(cx - 7, cy + 7), false, -1, 1).toResultPoint();
            pointD = getFirstDifferent(new Point(cx - 7, cy - 7), false, -1, -1).toResultPoint();
        }
        int cx2 = round((((pointA.getX() + pointD.getX()) + pointB.getX()) + pointC.getX()) / 4.0f);
        int cy2 = round((((pointA.getY() + pointD.getY()) + pointB.getY()) + pointC.getY()) / 4.0f);
        try {
            ResultPoint[] cornerPoints2 = new WhiteRectangleDetector(this.image, 15, cx2, cy2).detect();
            pointA2 = cornerPoints2[0];
            pointB2 = cornerPoints2[1];
            pointC2 = cornerPoints2[2];
            pointD2 = cornerPoints2[3];
        } catch (NotFoundException e2) {
            pointA2 = getFirstDifferent(new Point(cx2 + 7, cy2 - 7), false, 1, -1).toResultPoint();
            pointB2 = getFirstDifferent(new Point(cx2 + 7, cy2 + 7), false, 1, 1).toResultPoint();
            pointC2 = getFirstDifferent(new Point(cx2 - 7, cy2 + 7), false, -1, 1).toResultPoint();
            pointD2 = getFirstDifferent(new Point(cx2 - 7, cy2 - 7), false, -1, -1).toResultPoint();
        }
        return new Point(round((((pointA2.getX() + pointD2.getX()) + pointB2.getX()) + pointC2.getX()) / 4.0f), round((((pointA2.getY() + pointD2.getY()) + pointB2.getY()) + pointC2.getY()) / 4.0f));
    }

    private BitMatrix sampleGrid(BitMatrix image, ResultPoint topLeft, ResultPoint bottomLeft, ResultPoint bottomRight, ResultPoint topRight) throws NotFoundException {
        int dimension;
        if (this.compact) {
            dimension = (this.nbLayers * 4) + 11;
        } else if (this.nbLayers <= 4) {
            dimension = (this.nbLayers * 4) + 15;
        } else {
            dimension = (this.nbLayers * 4) + ((((this.nbLayers - 4) / 8) + 1) * 2) + 15;
        }
        GridSampler sampler = GridSampler.getInstance();
        return sampler.sampleGrid(image, dimension, dimension, 0.5f, 0.5f, dimension - 0.5f, 0.5f, dimension - 0.5f, dimension - 0.5f, 0.5f, dimension - 0.5f, topLeft.getX(), topLeft.getY(), topRight.getX(), topRight.getY(), bottomRight.getX(), bottomRight.getY(), bottomLeft.getX(), bottomLeft.getY());
    }

    private void getParameters(boolean[] parameterData) {
        int nbBitsForNbLayers;
        int nbBitsForNbDatablocks;
        if (this.compact) {
            nbBitsForNbLayers = 2;
            nbBitsForNbDatablocks = 6;
        } else {
            nbBitsForNbLayers = 5;
            nbBitsForNbDatablocks = 11;
        }
        for (int i = 0; i < nbBitsForNbLayers; i++) {
            this.nbLayers <<= 1;
            if (parameterData[i]) {
                this.nbLayers++;
            }
        }
        for (int i2 = nbBitsForNbLayers; i2 < nbBitsForNbLayers + nbBitsForNbDatablocks; i2++) {
            this.nbDataBlocks <<= 1;
            if (parameterData[i2]) {
                this.nbDataBlocks++;
            }
        }
        this.nbLayers++;
        this.nbDataBlocks++;
    }

    private boolean[] sampleLine(Point p1, Point p2, int size) {
        boolean[] res = new boolean[size];
        float d = distance(p1, p2);
        float moduleSize = d / (size - 1);
        float dx = ((p2.x - p1.x) * moduleSize) / d;
        float dy = ((p2.y - p1.y) * moduleSize) / d;
        float px = p1.x;
        float py = p1.y;
        for (int i = 0; i < size; i++) {
            res[i] = this.image.get(round(px), round(py));
            px += dx;
            py += dy;
        }
        return res;
    }

    private boolean isWhiteOrBlackRectangle(Point p1, Point p2, Point p3, Point p4) {
        Point p12 = new Point(p1.x - 3, p1.y + 3);
        Point p22 = new Point(p2.x - 3, p2.y - 3);
        Point p32 = new Point(p3.x + 3, p3.y - 3);
        Point p42 = new Point(p4.x + 3, p4.y + 3);
        int cInit = getColor(p42, p12);
        if (cInit == 0) {
            return false;
        }
        int c = getColor(p12, p22);
        if (c != cInit) {
            return false;
        }
        int c2 = getColor(p22, p32);
        if (c2 != cInit) {
            return false;
        }
        int c3 = getColor(p32, p42);
        return c3 == cInit;
    }

    private int getColor(Point p1, Point p2) {
        float d = distance(p1, p2);
        float dx = (p2.x - p1.x) / d;
        float dy = (p2.y - p1.y) / d;
        int error = 0;
        float px = p1.x;
        float py = p1.y;
        boolean colorModel = this.image.get(p1.x, p1.y);
        for (int i = 0; i < d; i++) {
            px += dx;
            py += dy;
            if (this.image.get(round(px), round(py)) != colorModel) {
                error++;
            }
        }
        float errRatio = error / d;
        if (errRatio <= 0.1d || errRatio >= 0.9d) {
            return ((double) errRatio) <= 0.1d ? colorModel ? 1 : -1 : colorModel ? -1 : 1;
        }
        return 0;
    }

    private Point getFirstDifferent(Point init, boolean color, int dx, int dy) {
        int x = init.x + dx;
        int y = init.y + dy;
        while (isValid(x, y) && this.image.get(x, y) == color) {
            x += dx;
            y += dy;
        }
        int x2 = x - dx;
        int y2 = y - dy;
        while (isValid(x2, y2) && this.image.get(x2, y2) == color) {
            x2 += dx;
        }
        int x3 = x2 - dx;
        while (isValid(x3, y2) && this.image.get(x3, y2) == color) {
            y2 += dy;
        }
        return new Point(x3, y2 - dy);
    }

    /* loaded from: classes.dex */
    private static class Point {
        public final int x;
        public final int y;

        public ResultPoint toResultPoint() {
            return new ResultPoint(this.x, this.y);
        }

        private Point(int x, int y) {
            this.x = x;
            this.y = y;
        }
    }

    private boolean isValid(int x, int y) {
        return x >= 0 && x < this.image.getWidth() && y > 0 && y < this.image.getHeight();
    }

    private static int round(float d) {
        return (int) (0.5f + d);
    }

    private static float distance(Point a, Point b) {
        return (float) Math.sqrt(((a.x - b.x) * (a.x - b.x)) + ((a.y - b.y) * (a.y - b.y)));
    }
}
