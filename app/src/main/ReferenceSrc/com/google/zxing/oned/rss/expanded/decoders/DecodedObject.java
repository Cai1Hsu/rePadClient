package com.google.zxing.oned.rss.expanded.decoders;

/* loaded from: classes.jar:com/google/zxing/oned/rss/expanded/decoders/DecodedObject.class */
abstract class DecodedObject {
    private final int newPosition;

    DecodedObject(int i) {
        this.newPosition = i;
    }

    int getNewPosition() {
        return this.newPosition;
    }
}
