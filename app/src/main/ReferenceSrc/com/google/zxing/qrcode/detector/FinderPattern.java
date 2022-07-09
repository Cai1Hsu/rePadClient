package com.google.zxing.qrcode.detector;

import com.google.zxing.ResultPoint;

/* loaded from: classes.dex */
public final class FinderPattern extends ResultPoint {
    private int count;
    private final float estimatedModuleSize;

    FinderPattern(float posX, float posY, float estimatedModuleSize) {
        this(posX, posY, estimatedModuleSize, 1);
    }

    FinderPattern(float posX, float posY, float estimatedModuleSize, int count) {
        super(posX, posY);
        this.estimatedModuleSize = estimatedModuleSize;
        this.count = count;
    }

    public float getEstimatedModuleSize() {
        return this.estimatedModuleSize;
    }

    int getCount() {
        return this.count;
    }

    void incrementCount() {
        this.count++;
    }

    boolean aboutEquals(float moduleSize, float i, float j) {
        if (Math.abs(i - getY()) > moduleSize || Math.abs(j - getX()) > moduleSize) {
            return false;
        }
        float moduleSizeDiff = Math.abs(moduleSize - this.estimatedModuleSize);
        return moduleSizeDiff <= 1.0f || moduleSizeDiff <= this.estimatedModuleSize;
    }

    FinderPattern combineEstimate(float i, float j, float newModuleSize) {
        int combinedCount = this.count + 1;
        float combinedX = ((this.count * getX()) + j) / combinedCount;
        float combinedY = ((this.count * getY()) + i) / combinedCount;
        float combinedModuleSize = ((this.count * this.estimatedModuleSize) + newModuleSize) / combinedCount;
        return new FinderPattern(combinedX, combinedY, combinedModuleSize, combinedCount);
    }
}
