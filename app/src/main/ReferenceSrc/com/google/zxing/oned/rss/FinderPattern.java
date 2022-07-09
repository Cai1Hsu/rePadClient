package com.google.zxing.oned.rss;

import com.google.zxing.ResultPoint;

/* loaded from: classes.jar:com/google/zxing/oned/rss/FinderPattern.class */
public final class FinderPattern {
    private final ResultPoint[] resultPoints;
    private final int[] startEnd;
    private final int value;

    public FinderPattern(int i, int[] iArr, int i2, int i3, int i4) {
        this.value = i;
        this.startEnd = iArr;
        this.resultPoints = new ResultPoint[]{new ResultPoint(i2, i4), new ResultPoint(i3, i4)};
    }

    public ResultPoint[] getResultPoints() {
        return this.resultPoints;
    }

    public int[] getStartEnd() {
        return this.startEnd;
    }

    public int getValue() {
        return this.value;
    }
}
