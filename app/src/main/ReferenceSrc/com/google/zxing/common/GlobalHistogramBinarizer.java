package com.google.zxing.common;

import com.google.zxing.Binarizer;
import com.google.zxing.LuminanceSource;
import com.google.zxing.NotFoundException;

/* loaded from: classes.jar:com/google/zxing/common/GlobalHistogramBinarizer.class */
public class GlobalHistogramBinarizer extends Binarizer {
    private static final int LUMINANCE_BITS = 5;
    private static final int LUMINANCE_BUCKETS = 32;
    private static final int LUMINANCE_SHIFT = 3;
    private byte[] luminances = new byte[0];
    private final int[] buckets = new int[32];

    public GlobalHistogramBinarizer(LuminanceSource luminanceSource) {
        super(luminanceSource);
    }

    private static int estimateBlackPoint(int[] iArr) throws NotFoundException {
        int length = iArr.length;
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        while (i4 < length) {
            int i5 = i3;
            if (iArr[i4] > i3) {
                i2 = i4;
                i5 = iArr[i4];
            }
            int i6 = i;
            if (iArr[i4] > i) {
                i6 = iArr[i4];
            }
            i4++;
            i3 = i5;
            i = i6;
        }
        int i7 = 0;
        int i8 = 0;
        int i9 = 0;
        while (i9 < length) {
            int i10 = i9 - i2;
            int i11 = iArr[i9] * i10 * i10;
            int i12 = i8;
            if (i11 > i8) {
                i7 = i9;
                i12 = i11;
            }
            i9++;
            i8 = i12;
        }
        int i13 = i2;
        int i14 = i7;
        if (i2 > i7) {
            i14 = i2;
            i13 = i7;
        }
        if (i14 - i13 <= (length >> 4)) {
            throw NotFoundException.getNotFoundInstance();
        }
        int i15 = i14 - 1;
        int i16 = -1;
        int i17 = i14 - 1;
        while (i17 > i13) {
            int i18 = i17 - i13;
            int i19 = i18 * i18 * (i14 - i17) * (i - iArr[i17]);
            int i20 = i16;
            if (i19 > i16) {
                i15 = i17;
                i20 = i19;
            }
            i17--;
            i16 = i20;
        }
        return i15 << 3;
    }

    private void initArrays(int i) {
        if (this.luminances.length < i) {
            this.luminances = new byte[i];
        }
        for (int i2 = 0; i2 < 32; i2++) {
            this.buckets[i2] = 0;
        }
    }

    @Override // com.google.zxing.Binarizer
    public Binarizer createBinarizer(LuminanceSource luminanceSource) {
        return new GlobalHistogramBinarizer(luminanceSource);
    }

    @Override // com.google.zxing.Binarizer
    public BitMatrix getBlackMatrix() throws NotFoundException {
        LuminanceSource luminanceSource = getLuminanceSource();
        int width = luminanceSource.getWidth();
        int height = luminanceSource.getHeight();
        BitMatrix bitMatrix = new BitMatrix(width, height);
        initArrays(width);
        int[] iArr = this.buckets;
        for (int i = 1; i < 5; i++) {
            byte[] row = luminanceSource.getRow((height * i) / 5, this.luminances);
            int i2 = (width << 2) / 5;
            for (int i3 = width / 5; i3 < i2; i3++) {
                int i4 = (row[i3] & 255) >> 3;
                iArr[i4] = iArr[i4] + 1;
            }
        }
        int estimateBlackPoint = estimateBlackPoint(iArr);
        byte[] matrix = luminanceSource.getMatrix();
        for (int i5 = 0; i5 < height; i5++) {
            for (int i6 = 0; i6 < width; i6++) {
                if ((matrix[(i5 * width) + i6] & 255) < estimateBlackPoint) {
                    bitMatrix.set(i6, i5);
                }
            }
        }
        return bitMatrix;
    }

    @Override // com.google.zxing.Binarizer
    public BitArray getBlackRow(int i, BitArray bitArray) throws NotFoundException {
        LuminanceSource luminanceSource = getLuminanceSource();
        int width = luminanceSource.getWidth();
        if (bitArray == null || bitArray.getSize() < width) {
            bitArray = new BitArray(width);
        } else {
            bitArray.clear();
        }
        initArrays(width);
        byte[] row = luminanceSource.getRow(i, this.luminances);
        int[] iArr = this.buckets;
        for (int i2 = 0; i2 < width; i2++) {
            int i3 = (row[i2] & 255) >> 3;
            iArr[i3] = iArr[i3] + 1;
        }
        int estimateBlackPoint = estimateBlackPoint(iArr);
        int i4 = row[0] & 255;
        int i5 = row[1] & 255;
        for (int i6 = 1; i6 < width - 1; i6++) {
            int i7 = row[i6 + 1] & 255;
            if (((((i5 << 2) - i4) - i7) >> 1) < estimateBlackPoint) {
                bitArray.set(i6);
            }
            i4 = i5;
            i5 = i7;
        }
        return bitArray;
    }
}
