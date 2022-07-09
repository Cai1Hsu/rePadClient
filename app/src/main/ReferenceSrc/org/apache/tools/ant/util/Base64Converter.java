package org.apache.tools.ant.util;

/* loaded from: classes.jar:org/apache/tools/ant/util/Base64Converter.class */
public class Base64Converter {
    private static final int BYTE = 8;
    private static final int BYTE_MASK = 255;
    private static final int POS_0_MASK = 63;
    private static final int POS_1_MASK = 4032;
    private static final int POS_1_SHIFT = 6;
    private static final int POS_2_MASK = 258048;
    private static final int POS_2_SHIFT = 12;
    private static final int POS_3_MASK = 16515072;
    private static final int POS_3_SHIFT = 18;
    private static final int WORD = 16;
    private static final char[] ALPHABET = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'};
    public static final char[] alphabet = ALPHABET;

    public String encode(String str) {
        return encode(str.getBytes());
    }

    public String encode(byte[] bArr) {
        char[] cArr = new char[(((bArr.length - 1) / 3) + 1) * 4];
        int i = 0;
        int i2 = 0;
        while (i2 + 3 <= bArr.length) {
            int i3 = i2 + 1;
            int i4 = i3 + 1;
            int i5 = ((bArr[i2] & 255) << 16) | ((bArr[i3] & 255) << 8) | bArr[i4];
            int i6 = i + 1;
            cArr[i] = ALPHABET[(i5 & POS_3_MASK) >> 18];
            int i7 = i6 + 1;
            cArr[i6] = ALPHABET[(i5 & POS_2_MASK) >> 12];
            int i8 = i7 + 1;
            cArr[i7] = ALPHABET[(i5 & POS_1_MASK) >> 6];
            i = i8 + 1;
            cArr[i8] = ALPHABET[i5 & POS_0_MASK];
            i2 = i4 + 1;
        }
        if (bArr.length - i2 == 2) {
            int i9 = ((bArr[i2] & 255) << 16) | ((bArr[i2 + 1] & 255) << 8);
            int i10 = i + 1;
            cArr[i] = ALPHABET[(i9 & POS_3_MASK) >> 18];
            int i11 = i10 + 1;
            cArr[i10] = ALPHABET[(i9 & POS_2_MASK) >> 12];
            cArr[i11] = ALPHABET[(i9 & POS_1_MASK) >> 6];
            cArr[i11 + 1] = (char) 61;
        } else if (bArr.length - i2 == 1) {
            int i12 = (bArr[i2] & 255) << 16;
            int i13 = i + 1;
            cArr[i] = ALPHABET[(i12 & POS_3_MASK) >> 18];
            int i14 = i13 + 1;
            cArr[i13] = ALPHABET[(i12 & POS_2_MASK) >> 12];
            cArr[i14] = (char) 61;
            cArr[i14 + 1] = (char) 61;
        }
        return new String(cArr);
    }
}
