package com.google.zxing.pdf417.encoder;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.Writer;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.lang.reflect.Array;
import java.util.Map;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class PDF417Writer implements Writer {
    @Override // com.google.zxing.Writer
    public BitMatrix encode(String contents, BarcodeFormat format, int width, int height, Map<EncodeHintType, ?> hints) throws WriterException {
        return encode(contents, format, width, height);
    }

    @Override // com.google.zxing.Writer
    public BitMatrix encode(String contents, BarcodeFormat format, int width, int height) throws WriterException {
        PDF417 encoder = initializeEncoder(format, false);
        return bitMatrixFromEncoder(encoder, contents, width, height);
    }

    public BitMatrix encode(String contents, BarcodeFormat format, boolean compact, int width, int height, int minCols, int maxCols, int minRows, int maxRows, Compaction compaction) throws WriterException {
        PDF417 encoder = initializeEncoder(format, compact);
        encoder.setDimensions(maxCols, minCols, maxRows, minRows);
        encoder.setCompaction(compaction);
        return bitMatrixFromEncoder(encoder, contents, width, height);
    }

    private static PDF417 initializeEncoder(BarcodeFormat format, boolean compact) {
        if (format != BarcodeFormat.PDF_417) {
            throw new IllegalArgumentException("Can only encode PDF_417, but got " + format);
        }
        PDF417 encoder = new PDF417();
        encoder.setCompact(compact);
        return encoder;
    }

    private static BitMatrix bitMatrixFromEncoder(PDF417 encoder, String contents, int width, int height) throws WriterException {
        int scale;
        encoder.generateBarcodeLogic(contents, 2);
        byte[][] originalScale = encoder.getBarcodeMatrix().getScaledMatrix(2, 8);
        boolean rotated = false;
        if ((height > width) ^ (originalScale[0].length < originalScale.length)) {
            originalScale = rotateArray(originalScale);
            rotated = true;
        }
        int scaleX = width / originalScale[0].length;
        int scaleY = height / originalScale.length;
        if (scaleX < scaleY) {
            scale = scaleX;
        } else {
            scale = scaleY;
        }
        if (scale > 1) {
            byte[][] scaledMatrix = encoder.getBarcodeMatrix().getScaledMatrix(scale * 2, scale * 4 * 2);
            if (rotated) {
                scaledMatrix = rotateArray(scaledMatrix);
            }
            return bitMatrixFrombitArray(scaledMatrix);
        }
        return bitMatrixFrombitArray(originalScale);
    }

    private static BitMatrix bitMatrixFrombitArray(byte[][] input) {
        BitMatrix output = new BitMatrix(input.length + 60, input[0].length + 60);
        output.clear();
        for (int ii = 0; ii < input.length; ii++) {
            for (int jj = 0; jj < input[0].length; jj++) {
                if (input[ii][jj] == 1) {
                    output.set(ii + 30, jj + 30);
                }
            }
        }
        return output;
    }

    private static byte[][] rotateArray(byte[][] bitarray) {
        byte[][] temp = (byte[][]) Array.newInstance(Byte.TYPE, bitarray[0].length, bitarray.length);
        for (int ii = 0; ii < bitarray.length; ii++) {
            int inverseii = (bitarray.length - ii) - 1;
            for (int jj = 0; jj < bitarray[0].length; jj++) {
                temp[jj][inverseii] = bitarray[ii][jj];
            }
        }
        return temp;
    }
}
