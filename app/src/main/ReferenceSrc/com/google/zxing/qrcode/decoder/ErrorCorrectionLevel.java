package com.google.zxing.qrcode.decoder;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public enum ErrorCorrectionLevel {
    L(1),
    M(0),
    Q(3),
    H(2);
    
    private final int bits;
    private static final ErrorCorrectionLevel[] FOR_BITS = {M, L, H, Q};

    ErrorCorrectionLevel(int bits) {
        this.bits = bits;
    }

    public int getBits() {
        return this.bits;
    }

    public static ErrorCorrectionLevel forBits(int bits) {
        if (bits < 0 || bits >= FOR_BITS.length) {
            throw new IllegalArgumentException();
        }
        return FOR_BITS[bits];
    }
}
