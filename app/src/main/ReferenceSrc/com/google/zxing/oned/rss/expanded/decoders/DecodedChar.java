package com.google.zxing.oned.rss.expanded.decoders;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class DecodedChar extends DecodedObject {
    static final char FNC1 = '$';
    private final char value;

    public DecodedChar(int newPosition, char value) {
        super(newPosition);
        this.value = value;
    }

    public char getValue() {
        return this.value;
    }

    public boolean isFNC1() {
        return this.value == '$';
    }
}
