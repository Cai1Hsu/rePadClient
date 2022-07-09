package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.Writer;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/oned/UPCAWriter.class */
public class UPCAWriter implements Writer {
    private final EAN13Writer subWriter = new EAN13Writer();

    private static String preencode(String str) {
        String str2;
        int length = str.length();
        if (length == 11) {
            int i = 0;
            for (int i2 = 0; i2 < 11; i2++) {
                i += (i2 % 2 == 0 ? 3 : 1) * (str.charAt(i2) - '0');
            }
            str2 = str + ((1000 - i) % 10);
        } else {
            str2 = str;
            if (length != 12) {
                throw new IllegalArgumentException("Requested contents should be 11 or 12 digits long, but got " + str.length());
            }
        }
        return '0' + str2;
    }

    @Override // com.google.zxing.Writer
    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2) throws WriterException {
        return encode(str, barcodeFormat, i, i2, null);
    }

    @Override // com.google.zxing.Writer
    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) throws WriterException {
        if (barcodeFormat != BarcodeFormat.UPC_A) {
            throw new IllegalArgumentException("Can only encode UPC-A, but got " + barcodeFormat);
        }
        return this.subWriter.encode(preencode(str), BarcodeFormat.EAN_13, i, i2, map);
    }
}
