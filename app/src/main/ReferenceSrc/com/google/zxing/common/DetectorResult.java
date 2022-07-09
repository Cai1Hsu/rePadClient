package com.google.zxing.common;

import com.google.zxing.ResultPoint;

/* loaded from: classes.jar:com/google/zxing/common/DetectorResult.class */
public class DetectorResult {
    private final BitMatrix bits;
    private final ResultPoint[] points;

    public DetectorResult(BitMatrix bitMatrix, ResultPoint[] resultPointArr) {
        this.bits = bitMatrix;
        this.points = resultPointArr;
    }

    public BitMatrix getBits() {
        return this.bits;
    }

    public ResultPoint[] getPoints() {
        return this.points;
    }
}
