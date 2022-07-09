package com.google.zxing.qrcode.detector;

import com.google.zxing.ResultPoint;

/* loaded from: classes.jar:com/google/zxing/qrcode/detector/FinderPattern.class */
public final class FinderPattern extends ResultPoint {
    private int count;
    private final float estimatedModuleSize;

    FinderPattern(float f, float f2, float f3) {
        this(f, f2, f3, 1);
    }

    FinderPattern(float f, float f2, float f3, int i) {
        super(f, f2);
        this.estimatedModuleSize = f3;
        this.count = i;
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x0041, code lost:
        if (r0 <= r3.estimatedModuleSize) goto L10;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    boolean aboutEquals(float f, float f2, float f3) {
        boolean z = false;
        if (Math.abs(f2 - getY()) <= f) {
            z = false;
            if (Math.abs(f3 - getX()) <= f) {
                float abs = Math.abs(f - this.estimatedModuleSize);
                if (abs > 1.0f) {
                    z = false;
                }
                z = true;
            }
        }
        return z;
    }

    FinderPattern combineEstimate(float f, float f2, float f3) {
        int i = this.count + 1;
        return new FinderPattern(((this.count * getX()) + f2) / i, ((this.count * getY()) + f) / i, ((this.count * this.estimatedModuleSize) + f3) / i, i);
    }

    int getCount() {
        return this.count;
    }

    public float getEstimatedModuleSize() {
        return this.estimatedModuleSize;
    }

    void incrementCount() {
        this.count++;
    }
}
