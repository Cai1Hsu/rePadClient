package com.google.zxing.oned.rss;

import com.google.zxing.ResultPoint;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class FinderPattern {
    private final ResultPoint[] resultPoints;
    private final int[] startEnd;
    private final int value;

    public FinderPattern(int value, int[] startEnd, int start, int end, int rowNumber) {
        this.value = value;
        this.startEnd = startEnd;
        this.resultPoints = new ResultPoint[]{new ResultPoint(start, rowNumber), new ResultPoint(end, rowNumber)};
    }

    public int getValue() {
        return this.value;
    }

    public int[] getStartEnd() {
        return this.startEnd;
    }

    public ResultPoint[] getResultPoints() {
        return this.resultPoints;
    }
}
