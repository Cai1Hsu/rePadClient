package com.google.zxing.qrcode.decoder;

import com.google.zxing.FormatException;
import com.google.zxing.common.BitMatrix;

/* loaded from: classes.jar:com/google/zxing/qrcode/decoder/BitMatrixParser.class */
final class BitMatrixParser {
    private final BitMatrix bitMatrix;
    private FormatInformation parsedFormatInfo;
    private Version parsedVersion;

    BitMatrixParser(BitMatrix bitMatrix) throws FormatException {
        int height = bitMatrix.getHeight();
        if (height < 21 || (height & 3) != 1) {
            throw FormatException.getFormatInstance();
        }
        this.bitMatrix = bitMatrix;
    }

    private int copyBit(int i, int i2, int i3) {
        return this.bitMatrix.get(i, i2) ? (i3 << 1) | 1 : i3 << 1;
    }

    byte[] readCodewords() throws FormatException {
        FormatInformation readFormatInformation = readFormatInformation();
        Version readVersion = readVersion();
        DataMask forReference = DataMask.forReference(readFormatInformation.getDataMask());
        int height = this.bitMatrix.getHeight();
        forReference.unmaskBitMatrix(this.bitMatrix, height);
        BitMatrix buildFunctionPattern = readVersion.buildFunctionPattern();
        boolean z = true;
        byte[] bArr = new byte[readVersion.getTotalCodewords()];
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        int i4 = height;
        int i5 = 1;
        while (true) {
            int i6 = i4 - i5;
            if (i6 <= 0) {
                break;
            }
            int i7 = i6;
            if (i6 == 6) {
                i7 = i6 - 1;
            }
            for (int i8 = 0; i8 < height; i8++) {
                int i9 = z ? (height - 1) - i8 : i8;
                for (int i10 = 0; i10 < 2; i10++) {
                    int i11 = i3;
                    int i12 = i2;
                    if (!buildFunctionPattern.get(i7 - i10, i9)) {
                        int i13 = i3 + 1;
                        int i14 = i2 << 1;
                        int i15 = i14;
                        if (this.bitMatrix.get(i7 - i10, i9)) {
                            i15 = i14 | 1;
                        }
                        i11 = i13;
                        i12 = i15;
                        if (i13 == 8) {
                            bArr[i] = (byte) i15;
                            i3 = 0;
                            i2 = 0;
                            i++;
                        }
                    }
                    i3 = i11;
                    i2 = i12;
                }
            }
            z = !z;
            i4 = i7;
            i5 = 2;
        }
        if (i != readVersion.getTotalCodewords()) {
            throw FormatException.getFormatInstance();
        }
        return bArr;
    }

    FormatInformation readFormatInformation() throws FormatException {
        FormatInformation formatInformation;
        if (this.parsedFormatInfo != null) {
            formatInformation = this.parsedFormatInfo;
        } else {
            int i = 0;
            for (int i2 = 0; i2 < 6; i2++) {
                i = copyBit(i2, 8, i);
            }
            int copyBit = copyBit(8, 7, copyBit(8, 8, copyBit(7, 8, i)));
            for (int i3 = 5; i3 >= 0; i3--) {
                copyBit = copyBit(8, i3, copyBit);
            }
            int height = this.bitMatrix.getHeight();
            int i4 = 0;
            for (int i5 = height - 1; i5 >= height - 7; i5--) {
                i4 = copyBit(8, i5, i4);
            }
            for (int i6 = height - 8; i6 < height; i6++) {
                i4 = copyBit(i6, 8, i4);
            }
            this.parsedFormatInfo = FormatInformation.decodeFormatInformation(copyBit, i4);
            if (this.parsedFormatInfo == null) {
                throw FormatException.getFormatInstance();
            }
            formatInformation = this.parsedFormatInfo;
        }
        return formatInformation;
    }

    Version readVersion() throws FormatException {
        Version decodeVersionInformation;
        if (this.parsedVersion != null) {
            decodeVersionInformation = this.parsedVersion;
        } else {
            int height = this.bitMatrix.getHeight();
            int i = (height - 17) >> 2;
            if (i <= 6) {
                decodeVersionInformation = Version.getVersionForNumber(i);
            } else {
                int i2 = 0;
                int i3 = height - 11;
                for (int i4 = 5; i4 >= 0; i4--) {
                    for (int i5 = height - 9; i5 >= i3; i5--) {
                        i2 = copyBit(i5, i4, i2);
                    }
                }
                decodeVersionInformation = Version.decodeVersionInformation(i2);
                if (decodeVersionInformation == null || decodeVersionInformation.getDimensionForVersion() != height) {
                    int i6 = 0;
                    for (int i7 = 5; i7 >= 0; i7--) {
                        for (int i8 = height - 9; i8 >= i3; i8--) {
                            i6 = copyBit(i7, i8, i6);
                        }
                    }
                    decodeVersionInformation = Version.decodeVersionInformation(i6);
                    if (decodeVersionInformation == null || decodeVersionInformation.getDimensionForVersion() != height) {
                        throw FormatException.getFormatInstance();
                    }
                    this.parsedVersion = decodeVersionInformation;
                } else {
                    this.parsedVersion = decodeVersionInformation;
                }
            }
        }
        return decodeVersionInformation;
    }
}
