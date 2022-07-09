package com.google.zxing.oned.rss.expanded.decoders;

/* loaded from: classes.jar:com/google/zxing/oned/rss/expanded/decoders/DecodedNumeric.class */
final class DecodedNumeric extends DecodedObject {
    static final int FNC1 = 10;
    private final int firstDigit;
    private final int secondDigit;

    DecodedNumeric(int i, int i2, int i3) {
        super(i);
        this.firstDigit = i2;
        this.secondDigit = i3;
        if (this.firstDigit < 0 || this.firstDigit > 10) {
            throw new IllegalArgumentException("Invalid firstDigit: " + i2);
        }
        if (this.secondDigit >= 0 && this.secondDigit <= 10) {
            return;
        }
        throw new IllegalArgumentException("Invalid secondDigit: " + i3);
    }

    int getFirstDigit() {
        return this.firstDigit;
    }

    int getSecondDigit() {
        return this.secondDigit;
    }

    int getValue() {
        return (this.firstDigit * 10) + this.secondDigit;
    }

    boolean isAnyFNC1() {
        return this.firstDigit == 10 || this.secondDigit == 10;
    }

    boolean isFirstDigitFNC1() {
        return this.firstDigit == 10;
    }

    boolean isSecondDigitFNC1() {
        return this.secondDigit == 10;
    }
}
