package com.google.zxing.pdf417;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Reader;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.common.DetectorResult;
import com.google.zxing.pdf417.decoder.Decoder;
import com.google.zxing.pdf417.detector.Detector;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/pdf417/PDF417Reader.class */
public final class PDF417Reader implements Reader {
    private static final ResultPoint[] NO_POINTS = new ResultPoint[0];
    private final Decoder decoder = new Decoder();

    private static BitMatrix extractPureBits(BitMatrix bitMatrix) throws NotFoundException {
        int[] topLeftOnBit = bitMatrix.getTopLeftOnBit();
        int[] bottomRightOnBit = bitMatrix.getBottomRightOnBit();
        if (topLeftOnBit == null || bottomRightOnBit == null) {
            throw NotFoundException.getNotFoundInstance();
        }
        int moduleSize = moduleSize(topLeftOnBit, bitMatrix);
        int i = topLeftOnBit[1];
        int i2 = bottomRightOnBit[1];
        int findPatternStart = findPatternStart(topLeftOnBit[0], i, bitMatrix);
        int findPatternEnd = ((findPatternEnd(topLeftOnBit[0], i, bitMatrix) - findPatternStart) + 1) / moduleSize;
        int i3 = ((i2 - i) + 1) / moduleSize;
        if (findPatternEnd <= 0 || i3 <= 0) {
            throw NotFoundException.getNotFoundInstance();
        }
        int i4 = moduleSize >> 1;
        BitMatrix bitMatrix2 = new BitMatrix(findPatternEnd, i3);
        for (int i5 = 0; i5 < i3; i5++) {
            for (int i6 = 0; i6 < findPatternEnd; i6++) {
                if (bitMatrix.get((i6 * moduleSize) + findPatternStart + i4, i + i4 + (i5 * moduleSize))) {
                    bitMatrix2.set(i6, i5);
                }
            }
        }
        return bitMatrix2;
    }

    private static int findPatternEnd(int i, int i2, BitMatrix bitMatrix) throws NotFoundException {
        int width = bitMatrix.getWidth() - 1;
        while (width > i && !bitMatrix.get(width, i2)) {
            width--;
        }
        int i3 = 0;
        boolean z = true;
        int i4 = width;
        while (i4 > i && i3 < 9) {
            i4--;
            boolean z2 = bitMatrix.get(i4, i2);
            int i5 = i3;
            if (z != z2) {
                i5 = i3 + 1;
            }
            z = z2;
            i3 = i5;
        }
        if (i4 == i) {
            throw NotFoundException.getNotFoundInstance();
        }
        return i4;
    }

    private static int findPatternStart(int i, int i2, BitMatrix bitMatrix) throws NotFoundException {
        int width = bitMatrix.getWidth();
        int i3 = 0;
        boolean z = true;
        int i4 = i;
        while (i4 < width - 1 && i3 < 8) {
            i4++;
            boolean z2 = bitMatrix.get(i4, i2);
            int i5 = i3;
            if (z != z2) {
                i5 = i3 + 1;
            }
            z = z2;
            i3 = i5;
        }
        if (i4 == width - 1) {
            throw NotFoundException.getNotFoundInstance();
        }
        return i4;
    }

    private static int moduleSize(int[] iArr, BitMatrix bitMatrix) throws NotFoundException {
        int i = iArr[0];
        int i2 = iArr[1];
        int width = bitMatrix.getWidth();
        while (i < width && bitMatrix.get(i, i2)) {
            i++;
        }
        if (i == width) {
            throw NotFoundException.getNotFoundInstance();
        }
        int i3 = (i - iArr[0]) >>> 3;
        if (i3 != 0) {
            return i3;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    @Override // com.google.zxing.Reader
    public Result decode(BinaryBitmap binaryBitmap) throws NotFoundException, FormatException {
        return decode(binaryBitmap, null);
    }

    @Override // com.google.zxing.Reader
    public Result decode(BinaryBitmap binaryBitmap, Map<DecodeHintType, ?> map) throws NotFoundException, FormatException {
        DecoderResult decode;
        ResultPoint[] points;
        if (map == null || !map.containsKey(DecodeHintType.PURE_BARCODE)) {
            DetectorResult detect = new Detector(binaryBitmap).detect();
            decode = this.decoder.decode(detect.getBits());
            points = detect.getPoints();
        } else {
            decode = this.decoder.decode(extractPureBits(binaryBitmap.getBlackMatrix()));
            points = NO_POINTS;
        }
        return new Result(decode.getText(), decode.getRawBytes(), points, BarcodeFormat.PDF_417);
    }

    @Override // com.google.zxing.Reader
    public void reset() {
    }
}
