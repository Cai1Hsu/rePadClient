package com.google.zxing.oned.rss.expanded.decoders;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class DecodedInformation extends DecodedObject {
    private final String newString;
    private final boolean remaining;
    private final int remainingValue;

    public DecodedInformation(int newPosition, String newString) {
        super(newPosition);
        this.newString = newString;
        this.remaining = false;
        this.remainingValue = 0;
    }

    public DecodedInformation(int newPosition, String newString, int remainingValue) {
        super(newPosition);
        this.remaining = true;
        this.remainingValue = remainingValue;
        this.newString = newString;
    }

    public String getNewString() {
        return this.newString;
    }

    public boolean isRemaining() {
        return this.remaining;
    }

    public int getRemainingValue() {
        return this.remainingValue;
    }
}
