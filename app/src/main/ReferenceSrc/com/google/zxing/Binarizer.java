package com.google.zxing;

import com.google.zxing.common.BitArray;
import com.google.zxing.common.BitMatrix;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public abstract class Binarizer {
    private final LuminanceSource source;

    public abstract Binarizer createBinarizer(LuminanceSource luminanceSource);

    public abstract BitMatrix getBlackMatrix() throws NotFoundException;

    public abstract BitArray getBlackRow(int i, BitArray bitArray) throws NotFoundException;

    public Binarizer(LuminanceSource source) {
        this.source = source;
    }

    public LuminanceSource getLuminanceSource() {
        return this.source;
    }

    public int getWidth() {
        return this.source.getWidth();
    }

    public int getHeight() {
        return this.source.getHeight();
    }
}
