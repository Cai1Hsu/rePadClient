package com.google.zxing.qrcode.detector;

import com.google.zxing.ResultPoint;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class AlignmentPattern extends ResultPoint {
    private final float estimatedModuleSize;

    public AlignmentPattern(float posX, float posY, float estimatedModuleSize) {
        super(posX, posY);
        this.estimatedModuleSize = estimatedModuleSize;
    }

    public boolean aboutEquals(float moduleSize, float i, float j) {
        if (Math.abs(i - getY()) > moduleSize || Math.abs(j - getX()) > moduleSize) {
            return false;
        }
        float moduleSizeDiff = Math.abs(moduleSize - this.estimatedModuleSize);
        return moduleSizeDiff <= 1.0f || moduleSizeDiff <= this.estimatedModuleSize;
    }

    public AlignmentPattern combineEstimate(float i, float j, float newModuleSize) {
        float combinedX = (getX() + j) / 2.0f;
        float combinedY = (getY() + i) / 2.0f;
        float combinedModuleSize = (this.estimatedModuleSize + newModuleSize) / 2.0f;
        return new AlignmentPattern(combinedX, combinedY, combinedModuleSize);
    }
}
