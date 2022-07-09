package com.google.zxing.oned;

/* loaded from: classes.jar:com/google/zxing/oned/CodaBarWriter.class */
public class CodaBarWriter extends OneDimensionalCodeWriter {
    public CodaBarWriter() {
        super(20);
    }

    @Override // com.google.zxing.oned.OneDimensionalCodeWriter
    public byte[] encode(String str) {
        int i;
        if (!CodaBarReader.arrayContains(new char[]{'A', 'B', 'C', 'D'}, Character.toUpperCase(str.charAt(0)))) {
            throw new IllegalArgumentException("Codabar should start with one of the following: 'A', 'B', 'C' or 'D'");
        }
        if (!CodaBarReader.arrayContains(new char[]{'T', 'N', '*', 'E'}, Character.toUpperCase(str.charAt(str.length() - 1)))) {
            throw new IllegalArgumentException("Codabar should end with one of the following: 'T', 'N', '*' or 'E'");
        }
        int i2 = 20;
        for (int i3 = 1; i3 < str.length() - 1; i3++) {
            if (Character.isDigit(str.charAt(i3)) || str.charAt(i3) == '-' || str.charAt(i3) == '$') {
                i2 += 9;
            } else if (!CodaBarReader.arrayContains(new char[]{'/', ':', '+', '.'}, str.charAt(i3))) {
                throw new IllegalArgumentException("Cannot encode : '" + str.charAt(i3) + '\'');
            } else {
                i2 += 10;
            }
        }
        byte[] bArr = new byte[i2 + (str.length() - 1)];
        int i4 = 0;
        int i5 = 0;
        while (i5 < str.length()) {
            char upperCase = Character.toUpperCase(str.charAt(i5));
            char c = upperCase;
            if (i5 == str.length() - 1) {
                if (upperCase == '*') {
                    c = 'C';
                } else {
                    c = upperCase;
                    if (upperCase == 'E') {
                        c = 'D';
                    }
                }
            }
            int i6 = 0;
            while (true) {
                i = 0;
                if (i6 >= CodaBarReader.ALPHABET.length) {
                    break;
                } else if (c == CodaBarReader.ALPHABET[i6]) {
                    i = CodaBarReader.CHARACTER_ENCODINGS[i6];
                    break;
                } else {
                    i6++;
                }
            }
            byte b = 1;
            int i7 = 0;
            int i8 = 0;
            while (i8 < 7) {
                bArr[i4] = b;
                i4++;
                if (((i >> (6 - i8)) & 1) == 0 || i7 == 1) {
                    b = (byte) (b ^ 1);
                    i8++;
                    i7 = 0;
                } else {
                    i7++;
                }
            }
            int i9 = i4;
            if (i5 < str.length() - 1) {
                bArr[i4] = (byte) 0;
                i9 = i4 + 1;
            }
            i5++;
            i4 = i9;
        }
        return bArr;
    }
}
