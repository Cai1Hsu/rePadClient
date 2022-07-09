package com.google.zxing.pdf417.encoder;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.Writer;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/pdf417/encoder/PDF417Writer.class */
public final class PDF417Writer implements Writer {
    private static BitMatrix bitMatrixFromEncoder(PDF417 pdf417, String str, int i, int i2) throws WriterException {
        BitMatrix bitMatrixFrombitArray;
        pdf417.generateBarcodeLogic(str, 2);
        byte[][] scaledMatrix = pdf417.getBarcodeMatrix().getScaledMatrix(2, 8);
        boolean z = false;
        byte[][] bArr = scaledMatrix;
        if ((i2 > i) ^ (scaledMatrix[0].length < scaledMatrix.length)) {
            bArr = rotateArray(scaledMatrix);
            z = true;
        }
        int length = i / bArr[0].length;
        int length2 = i2 / bArr.length;
        if (length >= length2) {
            length = length2;
        }
        if (length > 1) {
            byte[][] scaledMatrix2 = pdf417.getBarcodeMatrix().getScaledMatrix(length * 2, length * 4 * 2);
            byte[][] bArr2 = scaledMatrix2;
            if (z) {
                bArr2 = rotateArray(scaledMatrix2);
            }
            bitMatrixFrombitArray = bitMatrixFrombitArray(bArr2);
        } else {
            bitMatrixFrombitArray = bitMatrixFrombitArray(bArr);
        }
        return bitMatrixFrombitArray;
    }

    private static BitMatrix bitMatrixFrombitArray(byte[][] bArr) {
        BitMatrix bitMatrix = new BitMatrix(bArr.length + 60, bArr[0].length + 60);
        bitMatrix.clear();
        for (int i = 0; i < bArr.length; i++) {
            for (int i2 = 0; i2 < bArr[0].length; i2++) {
                if (bArr[i][i2] == 1) {
                    bitMatrix.set(i + 30, i2 + 30);
                }
            }
        }
        return bitMatrix;
    }

    private static PDF417 initializeEncoder(BarcodeFormat barcodeFormat, boolean z) {
        if (barcodeFormat != BarcodeFormat.PDF_417) {
            throw new IllegalArgumentException("Can only encode PDF_417, but got " + barcodeFormat);
        }
        PDF417 pdf417 = new PDF417();
        pdf417.setCompact(z);
        return pdf417;
    }

    private static byte[][] rotateArray(byte[][] bArr) {
        byte[][] bArr2 = new byte[bArr[0].length][bArr.length];
        for (int i = 0; i < bArr.length; i++) {
            int length = bArr.length;
            for (int i2 = 0; i2 < bArr[0].length; i2++) {
                bArr2[i2][(length - i) - 1] = bArr[i][i2];
            }
        }
        return bArr2;
    }

    @Override // com.google.zxing.Writer
    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2) throws WriterException {
        return bitMatrixFromEncoder(initializeEncoder(barcodeFormat, false), str, i, i2);
    }

    @Override // com.google.zxing.Writer
    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) throws WriterException {
        return encode(str, barcodeFormat, i, i2);
    }

    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, boolean z, int i, int i2, int i3, int i4, int i5, int i6, Compaction compaction) throws WriterException {
        PDF417 initializeEncoder = initializeEncoder(barcodeFormat, z);
        initializeEncoder.setDimensions(i4, i3, i6, i5);
        initializeEncoder.setCompaction(compaction);
        return bitMatrixFromEncoder(initializeEncoder, str, i, i2);
    }
}
