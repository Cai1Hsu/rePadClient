package com.mining.app.zxing.camera;

import android.graphics.Bitmap;
import com.google.zxing.LuminanceSource;
import org.bson.BSON;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class PlanarYUVLuminanceSource extends LuminanceSource {
    private final int dataHeight;
    private final int dataWidth;
    private final int left;
    private final int top;
    private final byte[] yuvData;

    public PlanarYUVLuminanceSource(byte[] yuvData, int dataWidth, int dataHeight, int left, int top, int width, int height) {
        super(width, height);
        if (left + width > dataWidth || top + height > dataHeight) {
            throw new IllegalArgumentException("Crop rectangle does not fit within image data.");
        }
        this.yuvData = yuvData;
        this.dataWidth = dataWidth;
        this.dataHeight = dataHeight;
        this.left = left;
        this.top = top;
    }

    @Override // com.google.zxing.LuminanceSource
    public byte[] getRow(int y, byte[] row) {
        if (y < 0 || y >= getHeight()) {
            throw new IllegalArgumentException("Requested row is outside the image: " + y);
        }
        int width = getWidth();
        if (row == null || row.length < width) {
            row = new byte[width];
        }
        int offset = ((this.top + y) * this.dataWidth) + this.left;
        System.arraycopy(this.yuvData, offset, row, 0, width);
        return row;
    }

    @Override // com.google.zxing.LuminanceSource
    public byte[] getMatrix() {
        int width = getWidth();
        int height = getHeight();
        if (width == this.dataWidth && height == this.dataHeight) {
            return this.yuvData;
        }
        int area = width * height;
        byte[] matrix = new byte[area];
        int inputOffset = (this.top * this.dataWidth) + this.left;
        if (width == this.dataWidth) {
            System.arraycopy(this.yuvData, inputOffset, matrix, 0, area);
            return matrix;
        }
        byte[] yuv = this.yuvData;
        for (int y = 0; y < height; y++) {
            int outputOffset = y * width;
            System.arraycopy(yuv, inputOffset, matrix, outputOffset, width);
            inputOffset += this.dataWidth;
        }
        return matrix;
    }

    @Override // com.google.zxing.LuminanceSource
    public boolean isCropSupported() {
        return true;
    }

    public int getDataWidth() {
        return this.dataWidth;
    }

    public int getDataHeight() {
        return this.dataHeight;
    }

    public Bitmap renderCroppedGreyscaleBitmap() {
        int width = getWidth();
        int height = getHeight();
        int[] pixels = new int[width * height];
        byte[] yuv = this.yuvData;
        int inputOffset = (this.top * this.dataWidth) + this.left;
        for (int y = 0; y < height; y++) {
            int outputOffset = y * width;
            for (int x = 0; x < width; x++) {
                int grey = yuv[inputOffset + x] & BSON.MINKEY;
                pixels[outputOffset + x] = (-16777216) | (65793 * grey);
            }
            inputOffset += this.dataWidth;
        }
        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        bitmap.setPixels(pixels, 0, width, 0, 0, width, height);
        return bitmap;
    }
}
