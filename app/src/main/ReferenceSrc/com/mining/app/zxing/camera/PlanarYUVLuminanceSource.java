package com.mining.app.zxing.camera;

import android.graphics.Bitmap;
import com.google.zxing.LuminanceSource;

/* loaded from: classes.jar:com/mining/app/zxing/camera/PlanarYUVLuminanceSource.class */
public final class PlanarYUVLuminanceSource extends LuminanceSource {
    private final int dataHeight;
    private final int dataWidth;
    private final int left;
    private final int top;
    private final byte[] yuvData;

    public PlanarYUVLuminanceSource(byte[] bArr, int i, int i2, int i3, int i4, int i5, int i6) {
        super(i5, i6);
        if (i3 + i5 > i || i4 + i6 > i2) {
            throw new IllegalArgumentException("Crop rectangle does not fit within image data.");
        }
        this.yuvData = bArr;
        this.dataWidth = i;
        this.dataHeight = i2;
        this.left = i3;
        this.top = i4;
    }

    public int getDataHeight() {
        return this.dataHeight;
    }

    public int getDataWidth() {
        return this.dataWidth;
    }

    @Override // com.google.zxing.LuminanceSource
    public byte[] getMatrix() {
        byte[] bArr;
        int width = getWidth();
        int height = getHeight();
        if (width != this.dataWidth || height != this.dataHeight) {
            int i = width * height;
            byte[] bArr2 = new byte[i];
            int i2 = (this.top * this.dataWidth) + this.left;
            if (width != this.dataWidth) {
                byte[] bArr3 = this.yuvData;
                int i3 = 0;
                while (true) {
                    bArr = bArr2;
                    if (i3 >= height) {
                        break;
                    }
                    System.arraycopy(bArr3, i2, bArr2, i3 * width, width);
                    i2 += this.dataWidth;
                    i3++;
                }
            } else {
                System.arraycopy(this.yuvData, i2, bArr2, 0, i);
                bArr = bArr2;
            }
        } else {
            bArr = this.yuvData;
        }
        return bArr;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0033, code lost:
        if (r8.length < r0) goto L12;
     */
    @Override // com.google.zxing.LuminanceSource
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public byte[] getRow(int i, byte[] bArr) {
        byte[] bArr2;
        if (i < 0 || i >= getHeight()) {
            throw new IllegalArgumentException("Requested row is outside the image: " + i);
        }
        int width = getWidth();
        if (bArr != null) {
            bArr2 = bArr;
        }
        bArr2 = new byte[width];
        int i2 = this.top;
        int i3 = this.dataWidth;
        System.arraycopy(this.yuvData, ((i2 + i) * i3) + this.left, bArr2, 0, width);
        return bArr2;
    }

    @Override // com.google.zxing.LuminanceSource
    public boolean isCropSupported() {
        return true;
    }

    public Bitmap renderCroppedGreyscaleBitmap() {
        int width = getWidth();
        int height = getHeight();
        int[] iArr = new int[width * height];
        byte[] bArr = this.yuvData;
        int i = (this.top * this.dataWidth) + this.left;
        for (int i2 = 0; i2 < height; i2++) {
            for (int i3 = 0; i3 < width; i3++) {
                iArr[(i2 * width) + i3] = (-16777216) | (65793 * (bArr[i + i3] & 255));
            }
            i += this.dataWidth;
        }
        Bitmap createBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        createBitmap.setPixels(iArr, 0, width, 0, 0, width, height);
        return createBitmap;
    }
}
