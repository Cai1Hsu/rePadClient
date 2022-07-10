package com.google.zxing.oned.rss.expanded.decoders;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
abstract class DecodedObject {
    private final int newPosition;

    public DecodedObject(int newPosition) {
        this.newPosition = newPosition;
    }

    public int getNewPosition() {
        return this.newPosition;
    }
}
