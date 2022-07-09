package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/oned/EAN8Writer.class */
public final class EAN8Writer extends UPCEANWriter {
    private static final int CODE_WIDTH = 67;

    @Override // com.google.zxing.oned.OneDimensionalCodeWriter, com.google.zxing.Writer
    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) throws WriterException {
        if (barcodeFormat != BarcodeFormat.EAN_8) {
            throw new IllegalArgumentException("Can only encode EAN_8, but got " + barcodeFormat);
        }
        return super.encode(str, barcodeFormat, i, i2, map);
    }

    @Override // com.google.zxing.oned.OneDimensionalCodeWriter
    public byte[] encode(String str) {
        if (str.length() != 8) {
            throw new IllegalArgumentException("Requested contents should be 8 digits long, but got " + str.length());
        }
        byte[] bArr = new byte[CODE_WIDTH];
        int appendPattern = 0 + appendPattern(bArr, 0, UPCEANReader.START_END_PATTERN, 1);
        for (int i = 0; i <= 3; i++) {
            appendPattern += appendPattern(bArr, appendPattern, UPCEANReader.L_PATTERNS[Integer.parseInt(str.substring(i, i + 1))], 0);
        }
        int appendPattern2 = appendPattern + appendPattern(bArr, appendPattern, UPCEANReader.MIDDLE_PATTERN, 0);
        for (int i2 = 4; i2 <= 7; i2++) {
            appendPattern2 += appendPattern(bArr, appendPattern2, UPCEANReader.L_PATTERNS[Integer.parseInt(str.substring(i2, i2 + 1))], 1);
        }
        appendPattern(bArr, appendPattern2, UPCEANReader.START_END_PATTERN, 1);
        return bArr;
    }
}
