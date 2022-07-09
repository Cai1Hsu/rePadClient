package com.google.zxing.common;

import com.google.zxing.Binarizer;
import com.google.zxing.LuminanceSource;
import com.google.zxing.NotFoundException;

/* loaded from: classes.jar:com/google/zxing/common/HybridBinarizer.class */
public final class HybridBinarizer extends GlobalHistogramBinarizer {
    private static final int BLOCK_SIZE = 8;
    private static final int BLOCK_SIZE_MASK = 7;
    private static final int BLOCK_SIZE_POWER = 3;
    private static final int MINIMUM_DIMENSION = 40;
    private BitMatrix matrix;

    public HybridBinarizer(LuminanceSource luminanceSource) {
        super(luminanceSource);
    }

    private static int[][] calculateBlackPoints(byte[] bArr, int i, int i2, int i3, int i4) {
        int[][] iArr = new int[i2][i];
        for (int i5 = 0; i5 < i2; i5++) {
            int i6 = i5 << 3;
            int i7 = i6;
            if (i6 + 8 >= i4) {
                i7 = i4 - 8;
            }
            for (int i8 = 0; i8 < i; i8++) {
                int i9 = i8 << 3;
                int i10 = i9;
                if (i9 + 8 >= i3) {
                    i10 = i3 - 8;
                }
                int i11 = 0;
                int i12 = 255;
                int i13 = 0;
                int i14 = (i7 * i3) + i10;
                int i15 = 0;
                while (i15 < 8) {
                    int i16 = 0;
                    int i17 = i12;
                    int i18 = i13;
                    while (i16 < 8) {
                        int i19 = bArr[i14 + i16] & 255;
                        i11 += i19;
                        int i20 = i17;
                        if (i19 < i17) {
                            i20 = i19;
                        }
                        int i21 = i18;
                        if (i19 > i18) {
                            i21 = i19;
                        }
                        i16++;
                        i18 = i21;
                        i17 = i20;
                    }
                    i15++;
                    i14 += i3;
                    i13 = i18;
                    i12 = i17;
                }
                int i22 = i11 >> 6;
                if (i13 - i12 <= 24) {
                    int i23 = i12 >> 1;
                    i22 = i23;
                    if (i5 > 0) {
                        i22 = i23;
                        if (i8 > 0) {
                            int i24 = ((iArr[i5 - 1][i8] + (iArr[i5][i8 - 1] * 2)) + iArr[i5 - 1][i8 - 1]) >> 2;
                            i22 = i23;
                            if (i12 < i24) {
                                i22 = i24;
                            }
                        }
                    }
                }
                iArr[i5][i8] = i22;
            }
        }
        return iArr;
    }

    private static void calculateThresholdForBlock(byte[] bArr, int i, int i2, int i3, int i4, int[][] iArr, BitMatrix bitMatrix) {
        int i5 = 0;
        while (i5 < i2) {
            int i6 = i5 << 3;
            int i7 = i6;
            if (i6 + 8 >= i4) {
                i7 = i4 - 8;
            }
            int i8 = 0;
            while (i8 < i) {
                int i9 = i8 << 3;
                int i10 = i9;
                if (i9 + 8 >= i3) {
                    i10 = i3 - 8;
                }
                int i11 = i8 > 1 ? i8 : 2;
                int i12 = i11 < i - 2 ? i11 : i - 3;
                int i13 = i5 > 1 ? i5 : 2;
                if (i13 >= i2 - 2) {
                    i13 = i2 - 3;
                }
                int i14 = 0;
                for (int i15 = -2; i15 <= 2; i15++) {
                    int[] iArr2 = iArr[i13 + i15];
                    i14 += iArr2[i12 - 2] + iArr2[i12 - 1] + iArr2[i12] + iArr2[i12 + 1] + iArr2[i12 + 2];
                }
                threshold8x8Block(bArr, i10, i7, i14 / 25, i3, bitMatrix);
                i8++;
            }
            i5++;
        }
    }

    private static void threshold8x8Block(byte[] bArr, int i, int i2, int i3, int i4, BitMatrix bitMatrix) {
        int i5 = 0;
        int i6 = i2 * i4;
        int i7 = i;
        while (true) {
            int i8 = i6 + i7;
            if (i5 < 8) {
                for (int i9 = 0; i9 < 8; i9++) {
                    if ((bArr[i8 + i9] & 255) <= i3) {
                        bitMatrix.set(i + i9, i2 + i5);
                    }
                }
                i5++;
                i6 = i8;
                i7 = i4;
            } else {
                return;
            }
        }
    }

    @Override // com.google.zxing.common.GlobalHistogramBinarizer, com.google.zxing.Binarizer
    public Binarizer createBinarizer(LuminanceSource luminanceSource) {
        return new HybridBinarizer(luminanceSource);
    }

    @Override // com.google.zxing.common.GlobalHistogramBinarizer, com.google.zxing.Binarizer
    public BitMatrix getBlackMatrix() throws NotFoundException {
        BitMatrix bitMatrix;
        if (this.matrix != null) {
            bitMatrix = this.matrix;
        } else {
            LuminanceSource luminanceSource = getLuminanceSource();
            if (luminanceSource.getWidth() < 40 || luminanceSource.getHeight() < 40) {
                this.matrix = super.getBlackMatrix();
            } else {
                byte[] matrix = luminanceSource.getMatrix();
                int width = luminanceSource.getWidth();
                int height = luminanceSource.getHeight();
                int i = width >> 3;
                int i2 = i;
                if ((width & 7) != 0) {
                    i2 = i + 1;
                }
                int i3 = height >> 3;
                int i4 = i3;
                if ((height & 7) != 0) {
                    i4 = i3 + 1;
                }
                int[][] calculateBlackPoints = calculateBlackPoints(matrix, i2, i4, width, height);
                BitMatrix bitMatrix2 = new BitMatrix(width, height);
                calculateThresholdForBlock(matrix, i2, i4, width, height, calculateBlackPoints, bitMatrix2);
                this.matrix = bitMatrix2;
            }
            bitMatrix = this.matrix;
        }
        return bitMatrix;
    }
}
