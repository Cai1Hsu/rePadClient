package com.google.zxing.pdf417.encoder;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class BarcodeRow {
    private int currentLocation = 0;
    private final byte[] row;

    public BarcodeRow(int width) {
        this.row = new byte[width];
    }

    public void set(int x, byte value) {
        this.row[x] = value;
    }

    void set(int x, boolean black) {
        this.row[x] = (byte) (black ? 1 : 0);
    }

    public void addBar(boolean black, int width) {
        for (int ii = 0; ii < width; ii++) {
            int i = this.currentLocation;
            this.currentLocation = i + 1;
            set(i, black);
        }
    }

    byte[] getRow() {
        return this.row;
    }

    public byte[] getScaledRow(int scale) {
        byte[] output = new byte[this.row.length * scale];
        for (int i = 0; i < output.length; i++) {
            output[i] = this.row[i / scale];
        }
        return output;
    }
}
