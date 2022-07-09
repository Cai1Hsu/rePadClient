package com.google.zxing.qrcode;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.Writer;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.google.zxing.qrcode.encoder.ByteMatrix;
import com.google.zxing.qrcode.encoder.Encoder;
import com.google.zxing.qrcode.encoder.QRCode;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/qrcode/QRCodeWriter.class */
public final class QRCodeWriter implements Writer {
    private static final int QUIET_ZONE_SIZE = 4;

    private static BitMatrix renderResult(QRCode qRCode, int i, int i2) {
        ByteMatrix matrix = qRCode.getMatrix();
        if (matrix == null) {
            throw new IllegalStateException();
        }
        int width = matrix.getWidth();
        int height = matrix.getHeight();
        int i3 = width + 8;
        int i4 = height + 8;
        int max = Math.max(i, i3);
        int max2 = Math.max(i2, i4);
        int min = Math.min(max / i3, max2 / i4);
        int i5 = (max - (width * min)) / 2;
        int i6 = (max2 - (height * min)) / 2;
        BitMatrix bitMatrix = new BitMatrix(max, max2);
        int i7 = 0;
        while (i7 < height) {
            int i8 = 0;
            int i9 = i5;
            while (true) {
                int i10 = i9;
                if (i8 < width) {
                    if (matrix.get(i8, i7) == 1) {
                        bitMatrix.setRegion(i10, i6, min, min);
                    }
                    i8++;
                    i9 = i10 + min;
                }
            }
            i7++;
            i6 += min;
        }
        return bitMatrix;
    }

    @Override // com.google.zxing.Writer
    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2) throws WriterException {
        return encode(str, barcodeFormat, i, i2, null);
    }

    @Override // com.google.zxing.Writer
    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) throws WriterException {
        if (str.length() == 0) {
            throw new IllegalArgumentException("Found empty contents");
        }
        if (barcodeFormat != BarcodeFormat.QR_CODE) {
            throw new IllegalArgumentException("Can only encode QR_CODE, but got " + barcodeFormat);
        }
        if (i < 0 || i2 < 0) {
            throw new IllegalArgumentException("Requested dimensions are too small: " + i + 'x' + i2);
        }
        ErrorCorrectionLevel errorCorrectionLevel = ErrorCorrectionLevel.L;
        ErrorCorrectionLevel errorCorrectionLevel2 = errorCorrectionLevel;
        if (map != null) {
            ErrorCorrectionLevel errorCorrectionLevel3 = (ErrorCorrectionLevel) map.get(EncodeHintType.ERROR_CORRECTION);
            errorCorrectionLevel2 = errorCorrectionLevel;
            if (errorCorrectionLevel3 != null) {
                errorCorrectionLevel2 = errorCorrectionLevel3;
            }
        }
        QRCode qRCode = new QRCode();
        Encoder.encode(str, errorCorrectionLevel2, map, qRCode);
        return renderResult(qRCode, i, i2);
    }
}
