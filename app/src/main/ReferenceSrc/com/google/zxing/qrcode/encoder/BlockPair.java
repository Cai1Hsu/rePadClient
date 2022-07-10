package com.google.zxing.qrcode.encoder;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class BlockPair {
    private final byte[] dataBytes;
    private final byte[] errorCorrectionBytes;

    public BlockPair(byte[] data, byte[] errorCorrection) {
        this.dataBytes = data;
        this.errorCorrectionBytes = errorCorrection;
    }

    public byte[] getDataBytes() {
        return this.dataBytes;
    }

    public byte[] getErrorCorrectionBytes() {
        return this.errorCorrectionBytes;
    }
}
