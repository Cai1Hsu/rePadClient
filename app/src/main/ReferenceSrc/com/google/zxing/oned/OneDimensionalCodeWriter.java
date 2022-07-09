package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.Writer;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/oned/OneDimensionalCodeWriter.class */
public abstract class OneDimensionalCodeWriter implements Writer {
    private final int sidesMargin;

    protected OneDimensionalCodeWriter(int i) {
        this.sidesMargin = i;
    }

    protected static int appendPattern(byte[] bArr, int i, int[] iArr, int i2) {
        if (i2 == 0 || i2 == 1) {
            byte b = (byte) i2;
            int i3 = 0;
            int i4 = i;
            for (int i5 : iArr) {
                for (int i6 = 0; i6 < i5; i6++) {
                    bArr[i4] = b;
                    i4++;
                    i3++;
                }
                b = (byte) (b ^ 1);
            }
            return i3;
        }
        throw new IllegalArgumentException("startColor must be either 0 or 1, but got: " + i2);
    }

    private BitMatrix renderResult(byte[] bArr, int i, int i2) {
        int length = bArr.length;
        int i3 = length + this.sidesMargin;
        int max = Math.max(i, i3);
        int max2 = Math.max(1, i2);
        int i4 = max / i3;
        int i5 = (max - (length * i4)) / 2;
        BitMatrix bitMatrix = new BitMatrix(max, max2);
        int i6 = 0;
        while (i6 < length) {
            if (bArr[i6] == 1) {
                bitMatrix.setRegion(i5, 0, i4, max2);
            }
            i6++;
            i5 += i4;
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
        if (i >= 0 && i2 >= 0) {
            return renderResult(encode(str), i, i2);
        }
        throw new IllegalArgumentException("Negative size is not allowed. Input: " + i + 'x' + i2);
    }

    public abstract byte[] encode(String str);
}
