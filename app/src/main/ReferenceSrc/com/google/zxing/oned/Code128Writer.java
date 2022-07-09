package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.ArrayList;
import java.util.Map;
import org.apache.commons.compress.archivers.tar.TarConstants;

/* loaded from: classes.jar:com/google/zxing/oned/Code128Writer.class */
public final class Code128Writer extends UPCEANWriter {
    private static final int CODE_CODE_B = 100;
    private static final int CODE_CODE_C = 99;
    private static final int CODE_FNC_1 = 102;
    private static final int CODE_FNC_2 = 97;
    private static final int CODE_FNC_3 = 96;
    private static final int CODE_FNC_4_B = 100;
    private static final int CODE_START_B = 104;
    private static final int CODE_START_C = 105;
    private static final int CODE_STOP = 106;
    private static final char ESCAPE_FNC_1 = 241;
    private static final char ESCAPE_FNC_2 = 242;
    private static final char ESCAPE_FNC_3 = 243;
    private static final char ESCAPE_FNC_4 = 244;

    private static boolean isDigits(CharSequence charSequence, int i, int i2) {
        int i3;
        boolean z = false;
        int i4 = i + i2;
        int length = charSequence.length();
        while (i < i4 && i < length) {
            char charAt = charSequence.charAt(i);
            if (charAt >= '0') {
                i3 = i4;
                if (charAt <= '9') {
                    continue;
                    i++;
                    i4 = i3;
                }
            }
            if (charAt != 241) {
                break;
            }
            i3 = i4 + 1;
            i++;
            i4 = i3;
        }
        if (i4 <= length) {
            z = true;
        }
        return z;
    }

    @Override // com.google.zxing.oned.OneDimensionalCodeWriter, com.google.zxing.Writer
    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) throws WriterException {
        if (barcodeFormat != BarcodeFormat.CODE_128) {
            throw new IllegalArgumentException("Can only encode CODE_128, but got " + barcodeFormat);
        }
        return super.encode(str, barcodeFormat, i, i2, map);
    }

    @Override // com.google.zxing.oned.OneDimensionalCodeWriter
    public byte[] encode(String str) {
        int i;
        int i2;
        int i3;
        int length = str.length();
        if (length < 1 || length > 80) {
            throw new IllegalArgumentException("Contents length should be between 1 and 80 characters, but got " + length);
        }
        for (int i4 = 0; i4 < length; i4++) {
            char charAt = str.charAt(i4);
            if (charAt < ' ' || charAt > '~') {
                switch (charAt) {
                    case 241:
                    case 242:
                    case 243:
                    case 244:
                        break;
                    default:
                        throw new IllegalArgumentException("Bad character in input: " + charAt);
                }
            }
        }
        ArrayList<int[]> arrayList = new ArrayList();
        int i5 = 0;
        int i6 = 1;
        int i7 = 0;
        int i8 = 0;
        while (i8 < length) {
            int i9 = isDigits(str, i8, i7 == CODE_CODE_C ? 2 : 4) ? CODE_CODE_C : 100;
            if (i9 != i7) {
                i = i9;
                i2 = i7 == 0 ? i9 == 100 ? CODE_START_B : CODE_START_C : i9;
                i3 = i8;
            } else if (i7 != 100) {
                switch (str.charAt(i8)) {
                    case 241:
                        i2 = 102;
                        i3 = i8 + 1;
                        i = i7;
                        break;
                    case 242:
                        i2 = CODE_FNC_2;
                        i3 = i8 + 1;
                        i = i7;
                        break;
                    case 243:
                        i2 = 96;
                        i3 = i8 + 1;
                        i = i7;
                        break;
                    case 244:
                        i2 = 100;
                        i3 = i8 + 1;
                        i = i7;
                        break;
                    default:
                        i2 = Integer.parseInt(str.substring(i8, i8 + 2));
                        i3 = i8 + 2;
                        i = i7;
                        break;
                }
            } else {
                i2 = str.charAt(i8) - ' ';
                i3 = i8 + 1;
                i = i7;
            }
            arrayList.add(Code128Reader.CODE_PATTERNS[i2]);
            int i10 = i5 + (i2 * i6);
            i5 = i10;
            i7 = i;
            i8 = i3;
            if (i3 != 0) {
                i6++;
                i5 = i10;
                i7 = i;
                i8 = i3;
            }
        }
        arrayList.add(Code128Reader.CODE_PATTERNS[i5 % TarConstants.LF_PAX_GLOBAL_EXTENDED_HEADER]);
        arrayList.add(Code128Reader.CODE_PATTERNS[CODE_STOP]);
        int i11 = 0;
        for (int[] iArr : arrayList) {
            int length2 = iArr.length;
            int i12 = 0;
            int i13 = i11;
            while (true) {
                i11 = i13;
                if (i12 < length2) {
                    i13 += iArr[i12];
                    i12++;
                }
            }
        }
        byte[] bArr = new byte[i11];
        int i14 = 0;
        for (int[] iArr2 : arrayList) {
            i14 += appendPattern(bArr, i14, iArr2, 1);
        }
        return bArr;
    }
}
