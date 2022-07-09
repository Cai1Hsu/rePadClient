package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/oned/EAN13Writer.class */
public final class EAN13Writer extends UPCEANWriter {
    private static final int CODE_WIDTH = 95;

    @Override // com.google.zxing.oned.OneDimensionalCodeWriter, com.google.zxing.Writer
    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) throws WriterException {
        if (barcodeFormat != BarcodeFormat.EAN_13) {
            throw new IllegalArgumentException("Can only encode EAN_13, but got " + barcodeFormat);
        }
        return super.encode(str, barcodeFormat, i, i2, map);
    }

    @Override // com.google.zxing.oned.OneDimensionalCodeWriter
    public byte[] encode(String str) {
        if (str.length() != 13) {
            throw new IllegalArgumentException("Requested contents should be 13 digits long, but got " + str.length());
        }
        int i = EAN13Reader.FIRST_DIGIT_ENCODINGS[Integer.parseInt(str.substring(0, 1))];
        byte[] bArr = new byte[CODE_WIDTH];
        int appendPattern = 0 + appendPattern(bArr, 0, UPCEANReader.START_END_PATTERN, 1);
        for (int i2 = 1; i2 <= 6; i2++) {
            int parseInt = Integer.parseInt(str.substring(i2, i2 + 1));
            int i3 = parseInt;
            if (((i >> (6 - i2)) & 1) == 1) {
                i3 = parseInt + 10;
            }
            appendPattern += appendPattern(bArr, appendPattern, UPCEANReader.L_AND_G_PATTERNS[i3], 0);
        }
        int appendPattern2 = appendPattern + appendPattern(bArr, appendPattern, UPCEANReader.MIDDLE_PATTERN, 0);
        for (int i4 = 7; i4 <= 12; i4++) {
            appendPattern2 += appendPattern(bArr, appendPattern2, UPCEANReader.L_PATTERNS[Integer.parseInt(str.substring(i4, i4 + 1))], 1);
        }
        appendPattern(bArr, appendPattern2, UPCEANReader.START_END_PATTERN, 1);
        return bArr;
    }
}
