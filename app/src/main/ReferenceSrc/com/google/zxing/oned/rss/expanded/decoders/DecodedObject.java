package com.google.zxing.oned.rss.expanded.decoders;

/* loaded from: classes.dex */
abstract class DecodedObject {
    private final int newPosition;

    DecodedObject(int newPosition) {
        this.newPosition = newPosition;
    }

    int getNewPosition() {
        return this.newPosition;
    }
}
