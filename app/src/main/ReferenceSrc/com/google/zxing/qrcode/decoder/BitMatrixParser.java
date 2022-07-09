package com.google.zxing.qrcode.decoder;

import com.google.zxing.FormatException;
import com.google.zxing.common.BitMatrix;

/* loaded from: classes.dex */
final class BitMatrixParser {
    private final BitMatrix bitMatrix;
    private FormatInformation parsedFormatInfo;
    private Version parsedVersion;

    BitMatrixParser(BitMatrix bitMatrix) throws FormatException {
        int dimension = bitMatrix.getHeight();
        if (dimension < 21 || (dimension & 3) != 1) {
            throw FormatException.getFormatInstance();
        }
        this.bitMatrix = bitMatrix;
    }

    FormatInformation readFormatInformation() throws FormatException {
        if (this.parsedFormatInfo != null) {
            return this.parsedFormatInfo;
        }
        int formatInfoBits1 = 0;
        for (int i = 0; i < 6; i++) {
            formatInfoBits1 = copyBit(i, 8, formatInfoBits1);
        }
        int formatInfoBits12 = copyBit(8, 7, copyBit(8, 8, copyBit(7, 8, formatInfoBits1)));
        for (int j = 5; j >= 0; j--) {
            formatInfoBits12 = copyBit(8, j, formatInfoBits12);
        }
        int dimension = this.bitMatrix.getHeight();
        int formatInfoBits2 = 0;
        int jMin = dimension - 7;
        for (int j2 = dimension - 1; j2 >= jMin; j2--) {
            formatInfoBits2 = copyBit(8, j2, formatInfoBits2);
        }
        for (int i2 = dimension - 8; i2 < dimension; i2++) {
            formatInfoBits2 = copyBit(i2, 8, formatInfoBits2);
        }
        this.parsedFormatInfo = FormatInformation.decodeFormatInformation(formatInfoBits12, formatInfoBits2);
        if (this.parsedFormatInfo != null) {
            return this.parsedFormatInfo;
        }
        throw FormatException.getFormatInstance();
    }

    Version readVersion() throws FormatException {
        if (this.parsedVersion != null) {
            return this.parsedVersion;
        }
        int dimension = this.bitMatrix.getHeight();
        int provisionalVersion = (dimension - 17) >> 2;
        if (provisionalVersion <= 6) {
            return Version.getVersionForNumber(provisionalVersion);
        }
        int versionBits = 0;
        int ijMin = dimension - 11;
        for (int j = 5; j >= 0; j--) {
            for (int i = dimension - 9; i >= ijMin; i--) {
                versionBits = copyBit(i, j, versionBits);
            }
        }
        Version theParsedVersion = Version.decodeVersionInformation(versionBits);
        if (theParsedVersion != null && theParsedVersion.getDimensionForVersion() == dimension) {
            this.parsedVersion = theParsedVersion;
            return theParsedVersion;
        }
        int versionBits2 = 0;
        for (int i2 = 5; i2 >= 0; i2--) {
            for (int j2 = dimension - 9; j2 >= ijMin; j2--) {
                versionBits2 = copyBit(i2, j2, versionBits2);
            }
        }
        Version theParsedVersion2 = Version.decodeVersionInformation(versionBits2);
        if (theParsedVersion2 != null && theParsedVersion2.getDimensionForVersion() == dimension) {
            this.parsedVersion = theParsedVersion2;
            return theParsedVersion2;
        }
        throw FormatException.getFormatInstance();
    }

    private int copyBit(int i, int j, int versionBits) {
        return this.bitMatrix.get(i, j) ? (versionBits << 1) | 1 : versionBits << 1;
    }

    byte[] readCodewords() throws FormatException {
        int resultOffset;
        FormatInformation formatInfo = readFormatInformation();
        Version version = readVersion();
        DataMask dataMask = DataMask.forReference(formatInfo.getDataMask());
        int dimension = this.bitMatrix.getHeight();
        dataMask.unmaskBitMatrix(this.bitMatrix, dimension);
        BitMatrix functionPattern = version.buildFunctionPattern();
        boolean readingUp = true;
        byte[] result = new byte[version.getTotalCodewords()];
        int resultOffset2 = 0;
        int currentByte = 0;
        int bitsRead = 0;
        int j = dimension - 1;
        while (j > 0) {
            if (j == 6) {
                j--;
            }
            int count = 0;
            while (count < dimension) {
                int i = readingUp ? (dimension - 1) - count : count;
                int col = 0;
                while (true) {
                    resultOffset = resultOffset2;
                    if (col < 2) {
                        if (!functionPattern.get(j - col, i)) {
                            bitsRead++;
                            currentByte <<= 1;
                            if (this.bitMatrix.get(j - col, i)) {
                                currentByte |= 1;
                            }
                            if (bitsRead == 8) {
                                resultOffset2 = resultOffset + 1;
                                result[resultOffset] = (byte) currentByte;
                                bitsRead = 0;
                                currentByte = 0;
                                col++;
                            }
                        }
                        resultOffset2 = resultOffset;
                        col++;
                    }
                }
                count++;
                resultOffset2 = resultOffset;
            }
            readingUp = !readingUp;
            j -= 2;
        }
        if (resultOffset2 != version.getTotalCodewords()) {
            throw FormatException.getFormatInstance();
        }
        return result;
    }
}
