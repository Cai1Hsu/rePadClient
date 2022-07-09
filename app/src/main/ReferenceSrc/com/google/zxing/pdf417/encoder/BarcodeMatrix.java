package com.google.zxing.pdf417.encoder;

/* loaded from: classes.jar:com/google/zxing/pdf417/encoder/BarcodeMatrix.class */
final class BarcodeMatrix {
    private int currentRow;
    private final int height;
    private final BarcodeRow[] matrix;
    private final int width;

    BarcodeMatrix(int i, int i2) {
        this.matrix = new BarcodeRow[i + 2];
        int length = this.matrix.length;
        for (int i3 = 0; i3 < length; i3++) {
            this.matrix[i3] = new BarcodeRow(((i2 + 4) * 17) + 1);
        }
        this.width = i2 * 17;
        this.height = i + 2;
        this.currentRow = 0;
    }

    BarcodeRow getCurrentRow() {
        return this.matrix[this.currentRow];
    }

    byte[][] getMatrix() {
        return getScaledMatrix(1, 1);
    }

    byte[][] getScaledMatrix(int i) {
        return getScaledMatrix(i, i);
    }

    byte[][] getScaledMatrix(int i, int i2) {
        byte[][] bArr = new byte[this.height * i2][this.width * i];
        int i3 = this.height * i2;
        for (int i4 = 0; i4 < i3; i4++) {
            bArr[(i3 - i4) - 1] = this.matrix[i4 / i2].getScaledRow(i);
        }
        return bArr;
    }

    void set(int i, int i2, byte b) {
        this.matrix[i2].set(i, b);
    }

    void setMatrix(int i, int i2, boolean z) {
        set(i, i2, (byte) (z ? 1 : 0));
    }

    void startRow() {
        this.currentRow++;
    }
}
