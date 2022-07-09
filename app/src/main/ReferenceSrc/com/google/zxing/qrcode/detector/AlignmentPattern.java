package com.google.zxing.qrcode.detector;

import com.google.zxing.ResultPoint;

/* loaded from: classes.jar:com/google/zxing/qrcode/detector/AlignmentPattern.class */
public final class AlignmentPattern extends ResultPoint {
    private final float estimatedModuleSize;

    AlignmentPattern(float f, float f2, float f3) {
        super(f, f2);
        this.estimatedModuleSize = f3;
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

    AlignmentPattern combineEstimate(float f, float f2, float f3) {
        return new AlignmentPattern((getX() + f2) / 2.0f, (getY() + f) / 2.0f, (this.estimatedModuleSize + f3) / 2.0f);
    }
}
