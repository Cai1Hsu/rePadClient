package com.google.zxing;

import com.google.zxing.common.BitArray;
import com.google.zxing.common.BitMatrix;

/* loaded from: classes.jar:com/google/zxing/Binarizer.class */
public abstract class Binarizer {
    private final LuminanceSource source;

    protected Binarizer(LuminanceSource luminanceSource) {
        this.source = luminanceSource;
    }

    public abstract Binarizer createBinarizer(LuminanceSource luminanceSource);

    public abstract BitMatrix getBlackMatrix() throws NotFoundException;

    public abstract BitArray getBlackRow(int i, BitArray bitArray) throws NotFoundException;

    public int getHeight() {
        return this.source.getHeight();
    }

    public LuminanceSource getLuminanceSource() {
        return this.source;
    }

    public int getWidth() {
        return this.source.getWidth();
    }
}
