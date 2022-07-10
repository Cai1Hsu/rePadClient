package com.google.zxing.oned.rss.expanded.decoders;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class DecodedNumeric extends DecodedObject {
    static final int FNC1 = 10;
    private final int firstDigit;
    private final int secondDigit;

    public DecodedNumeric(int newPosition, int firstDigit, int secondDigit) {
        super(newPosition);
        this.firstDigit = firstDigit;
        this.secondDigit = secondDigit;
        if (this.firstDigit < 0 || this.firstDigit > 10) {
            throw new IllegalArgumentException("Invalid firstDigit: " + firstDigit);
        }
        if (this.secondDigit < 0 || this.secondDigit > 10) {
            throw new IllegalArgumentException("Invalid secondDigit: " + secondDigit);
        }
    }

    public int getFirstDigit() {
        return this.firstDigit;
    }

    public int getSecondDigit() {
        return this.secondDigit;
    }

    int getValue() {
        return (this.firstDigit * 10) + this.secondDigit;
    }

    public boolean isFirstDigitFNC1() {
        return this.firstDigit == 10;
    }

    public boolean isSecondDigitFNC1() {
        return this.secondDigit == 10;
    }

    boolean isAnyFNC1() {
        return this.firstDigit == 10 || this.secondDigit == 10;
    }
}
