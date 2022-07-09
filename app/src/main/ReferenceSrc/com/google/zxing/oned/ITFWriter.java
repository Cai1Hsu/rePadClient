package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.Map;

/* loaded from: classes.dex */
public final class ITFWriter extends UPCEANWriter {
    @Override // com.google.zxing.oned.OneDimensionalCodeWriter, com.google.zxing.Writer
    public BitMatrix encode(String contents, BarcodeFormat format, int width, int height, Map<EncodeHintType, ?> hints) throws WriterException {
        if (format != BarcodeFormat.ITF) {
            throw new IllegalArgumentException("Can only encode ITF, but got " + format);
        }
        return super.encode(contents, format, width, height, hints);
    }

    @Override // com.google.zxing.oned.OneDimensionalCodeWriter
    public byte[] encode(String contents) {
        int length = contents.length();
        if (length % 2 != 0) {
            throw new IllegalArgumentException("The lenght of the input should be even");
        }
        if (length > 80) {
            throw new IllegalArgumentException("Requested contents should be less than 80 digits long, but got " + length);
        }
        byte[] result = new byte[(length * 9) + 9];
        int[] start = {1, 1, 1, 1};
        int pos = appendPattern(result, 0, start, 1);
        for (int i = 0; i < length; i += 2) {
            int one = Character.digit(contents.charAt(i), 10);
            int two = Character.digit(contents.charAt(i + 1), 10);
            int[] encoding = new int[18];
            for (int j = 0; j < 5; j++) {
                encoding[j << 1] = ITFReader.PATTERNS[one][j];
                encoding[(j << 1) + 1] = ITFReader.PATTERNS[two][j];
            }
            pos += appendPattern(result, pos, encoding, 1);
        }
        int[] end = {3, 1, 1};
        int appendPattern = pos + appendPattern(result, pos, end, 1);
        return result;
    }
}
