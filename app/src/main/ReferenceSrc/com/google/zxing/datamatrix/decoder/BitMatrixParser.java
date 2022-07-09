package com.google.zxing.datamatrix.decoder;

import com.google.zxing.FormatException;
import com.google.zxing.common.BitMatrix;

/* loaded from: classes.jar:com/google/zxing/datamatrix/decoder/BitMatrixParser.class */
final class BitMatrixParser {
    private final BitMatrix mappingBitMatrix;
    private final BitMatrix readMappingMatrix;
    private final Version version;

    BitMatrixParser(BitMatrix bitMatrix) throws FormatException {
        int height = bitMatrix.getHeight();
        if (height < 8 || height > 144 || (height & 1) != 0) {
            throw FormatException.getFormatInstance();
        }
        this.version = readVersion(bitMatrix);
        this.mappingBitMatrix = extractDataRegion(bitMatrix);
        this.readMappingMatrix = new BitMatrix(this.mappingBitMatrix.getWidth(), this.mappingBitMatrix.getHeight());
    }

    private static Version readVersion(BitMatrix bitMatrix) throws FormatException {
        return Version.getVersionForDimensions(bitMatrix.getHeight(), bitMatrix.getWidth());
    }

    BitMatrix extractDataRegion(BitMatrix bitMatrix) {
        int symbolSizeRows = this.version.getSymbolSizeRows();
        int symbolSizeColumns = this.version.getSymbolSizeColumns();
        if (bitMatrix.getHeight() != symbolSizeRows) {
            throw new IllegalArgumentException("Dimension of bitMarix must match the version size");
        }
        int dataRegionSizeRows = this.version.getDataRegionSizeRows();
        int dataRegionSizeColumns = this.version.getDataRegionSizeColumns();
        int i = symbolSizeRows / dataRegionSizeRows;
        int i2 = symbolSizeColumns / dataRegionSizeColumns;
        BitMatrix bitMatrix2 = new BitMatrix(i2 * dataRegionSizeColumns, i * dataRegionSizeRows);
        for (int i3 = 0; i3 < i; i3++) {
            for (int i4 = 0; i4 < i2; i4++) {
                for (int i5 = 0; i5 < dataRegionSizeRows; i5++) {
                    for (int i6 = 0; i6 < dataRegionSizeColumns; i6++) {
                        if (bitMatrix.get(((dataRegionSizeColumns + 2) * i4) + 1 + i6, ((dataRegionSizeRows + 2) * i3) + 1 + i5)) {
                            bitMatrix2.set((i4 * dataRegionSizeColumns) + i6, (i3 * dataRegionSizeRows) + i5);
                        }
                    }
                }
            }
        }
        return bitMatrix2;
    }

    Version getVersion() {
        return this.version;
    }

    byte[] readCodewords() throws FormatException {
        int i;
        int i2;
        byte[] bArr = new byte[this.version.getTotalCodewords()];
        int i3 = 4;
        int i4 = 0;
        int height = this.mappingBitMatrix.getHeight();
        int width = this.mappingBitMatrix.getWidth();
        boolean z = false;
        boolean z2 = false;
        boolean z3 = false;
        boolean z4 = false;
        int i5 = 0;
        while (true) {
            if (i3 == height && i4 == 0 && !z) {
                bArr[i5] = (byte) readCorner1(height, width);
                i3 -= 2;
                i4 += 2;
                z = true;
                i5++;
            } else if (i3 == height - 2 && i4 == 0 && (width & 3) != 0 && !z2) {
                bArr[i5] = (byte) readCorner2(height, width);
                i3 -= 2;
                i4 += 2;
                z2 = true;
                i5++;
            } else if (i3 == height + 4 && i4 == 2 && (width & 7) == 0 && !z3) {
                bArr[i5] = (byte) readCorner3(height, width);
                i3 -= 2;
                i4 += 2;
                z3 = true;
                i5++;
            } else {
                int i6 = i4;
                int i7 = i5;
                int i8 = i3;
                if (i3 == height - 2) {
                    i6 = i4;
                    i7 = i5;
                    i8 = i3;
                    if (i4 == 0) {
                        i6 = i4;
                        i7 = i5;
                        i8 = i3;
                        if ((width & 7) == 4) {
                            i6 = i4;
                            i7 = i5;
                            i8 = i3;
                            if (!z4) {
                                bArr[i5] = (byte) readCorner4(height, width);
                                i3 -= 2;
                                i4 += 2;
                                z4 = true;
                                i5++;
                            }
                        }
                    }
                }
                while (true) {
                    if (i8 >= height || i6 < 0 || this.readMappingMatrix.get(i6, i8)) {
                        i = i7;
                    } else {
                        i = i7 + 1;
                        bArr[i7] = (byte) readUtah(i8, i6, height, width);
                    }
                    i8 -= 2;
                    i6 += 2;
                    if (i8 < 0 || i6 >= width) {
                        break;
                    }
                    i7 = i;
                }
                int i9 = i8 + 1;
                int i10 = i6 + 3;
                while (true) {
                    int i11 = i10;
                    if (i9 < 0 || i11 >= width || this.readMappingMatrix.get(i11, i9)) {
                        i5 = i;
                    } else {
                        i5 = i + 1;
                        bArr[i] = (byte) readUtah(i9, i11, height, width);
                    }
                    i9 += 2;
                    i2 = i11 - 2;
                    if (i9 >= height || i2 < 0) {
                        break;
                    }
                    i = i5;
                    i10 = i2;
                }
                i3 = i9 + 3;
                i4 = i2 + 1;
            }
            if (i3 >= height && i4 >= width) {
                break;
            }
        }
        if (i5 != this.version.getTotalCodewords()) {
            throw FormatException.getFormatInstance();
        }
        return bArr;
    }

    int readCorner1(int i, int i2) {
        int i3 = 0;
        if (readModule(i - 1, 0, i, i2)) {
            i3 = 0 | 1;
        }
        int i4 = i3 << 1;
        int i5 = i4;
        if (readModule(i - 1, 1, i, i2)) {
            i5 = i4 | 1;
        }
        int i6 = i5 << 1;
        int i7 = i6;
        if (readModule(i - 1, 2, i, i2)) {
            i7 = i6 | 1;
        }
        int i8 = i7 << 1;
        int i9 = i8;
        if (readModule(0, i2 - 2, i, i2)) {
            i9 = i8 | 1;
        }
        int i10 = i9 << 1;
        int i11 = i10;
        if (readModule(0, i2 - 1, i, i2)) {
            i11 = i10 | 1;
        }
        int i12 = i11 << 1;
        int i13 = i12;
        if (readModule(1, i2 - 1, i, i2)) {
            i13 = i12 | 1;
        }
        int i14 = i13 << 1;
        int i15 = i14;
        if (readModule(2, i2 - 1, i, i2)) {
            i15 = i14 | 1;
        }
        int i16 = i15 << 1;
        int i17 = i16;
        if (readModule(3, i2 - 1, i, i2)) {
            i17 = i16 | 1;
        }
        return i17;
    }

    int readCorner2(int i, int i2) {
        int i3 = 0;
        if (readModule(i - 3, 0, i, i2)) {
            i3 = 0 | 1;
        }
        int i4 = i3 << 1;
        int i5 = i4;
        if (readModule(i - 2, 0, i, i2)) {
            i5 = i4 | 1;
        }
        int i6 = i5 << 1;
        int i7 = i6;
        if (readModule(i - 1, 0, i, i2)) {
            i7 = i6 | 1;
        }
        int i8 = i7 << 1;
        int i9 = i8;
        if (readModule(0, i2 - 4, i, i2)) {
            i9 = i8 | 1;
        }
        int i10 = i9 << 1;
        int i11 = i10;
        if (readModule(0, i2 - 3, i, i2)) {
            i11 = i10 | 1;
        }
        int i12 = i11 << 1;
        int i13 = i12;
        if (readModule(0, i2 - 2, i, i2)) {
            i13 = i12 | 1;
        }
        int i14 = i13 << 1;
        int i15 = i14;
        if (readModule(0, i2 - 1, i, i2)) {
            i15 = i14 | 1;
        }
        int i16 = i15 << 1;
        int i17 = i16;
        if (readModule(1, i2 - 1, i, i2)) {
            i17 = i16 | 1;
        }
        return i17;
    }

    int readCorner3(int i, int i2) {
        int i3 = 0;
        if (readModule(i - 1, 0, i, i2)) {
            i3 = 0 | 1;
        }
        int i4 = i3 << 1;
        int i5 = i4;
        if (readModule(i - 1, i2 - 1, i, i2)) {
            i5 = i4 | 1;
        }
        int i6 = i5 << 1;
        int i7 = i6;
        if (readModule(0, i2 - 3, i, i2)) {
            i7 = i6 | 1;
        }
        int i8 = i7 << 1;
        int i9 = i8;
        if (readModule(0, i2 - 2, i, i2)) {
            i9 = i8 | 1;
        }
        int i10 = i9 << 1;
        int i11 = i10;
        if (readModule(0, i2 - 1, i, i2)) {
            i11 = i10 | 1;
        }
        int i12 = i11 << 1;
        int i13 = i12;
        if (readModule(1, i2 - 3, i, i2)) {
            i13 = i12 | 1;
        }
        int i14 = i13 << 1;
        int i15 = i14;
        if (readModule(1, i2 - 2, i, i2)) {
            i15 = i14 | 1;
        }
        int i16 = i15 << 1;
        int i17 = i16;
        if (readModule(1, i2 - 1, i, i2)) {
            i17 = i16 | 1;
        }
        return i17;
    }

    int readCorner4(int i, int i2) {
        int i3 = 0;
        if (readModule(i - 3, 0, i, i2)) {
            i3 = 0 | 1;
        }
        int i4 = i3 << 1;
        int i5 = i4;
        if (readModule(i - 2, 0, i, i2)) {
            i5 = i4 | 1;
        }
        int i6 = i5 << 1;
        int i7 = i6;
        if (readModule(i - 1, 0, i, i2)) {
            i7 = i6 | 1;
        }
        int i8 = i7 << 1;
        int i9 = i8;
        if (readModule(0, i2 - 2, i, i2)) {
            i9 = i8 | 1;
        }
        int i10 = i9 << 1;
        int i11 = i10;
        if (readModule(0, i2 - 1, i, i2)) {
            i11 = i10 | 1;
        }
        int i12 = i11 << 1;
        int i13 = i12;
        if (readModule(1, i2 - 1, i, i2)) {
            i13 = i12 | 1;
        }
        int i14 = i13 << 1;
        int i15 = i14;
        if (readModule(2, i2 - 1, i, i2)) {
            i15 = i14 | 1;
        }
        int i16 = i15 << 1;
        int i17 = i16;
        if (readModule(3, i2 - 1, i, i2)) {
            i17 = i16 | 1;
        }
        return i17;
    }

    boolean readModule(int i, int i2, int i3, int i4) {
        int i5 = i;
        int i6 = i2;
        if (i < 0) {
            i5 = i + i3;
            i6 = i2 + (4 - ((i3 + 4) & 7));
        }
        int i7 = i5;
        int i8 = i6;
        if (i6 < 0) {
            i8 = i6 + i4;
            i7 = i5 + (4 - ((i4 + 4) & 7));
        }
        this.readMappingMatrix.set(i8, i7);
        return this.mappingBitMatrix.get(i8, i7);
    }

    int readUtah(int i, int i2, int i3, int i4) {
        int i5 = 0;
        if (readModule(i - 2, i2 - 2, i3, i4)) {
            i5 = 0 | 1;
        }
        int i6 = i5 << 1;
        int i7 = i6;
        if (readModule(i - 2, i2 - 1, i3, i4)) {
            i7 = i6 | 1;
        }
        int i8 = i7 << 1;
        int i9 = i8;
        if (readModule(i - 1, i2 - 2, i3, i4)) {
            i9 = i8 | 1;
        }
        int i10 = i9 << 1;
        int i11 = i10;
        if (readModule(i - 1, i2 - 1, i3, i4)) {
            i11 = i10 | 1;
        }
        int i12 = i11 << 1;
        int i13 = i12;
        if (readModule(i - 1, i2, i3, i4)) {
            i13 = i12 | 1;
        }
        int i14 = i13 << 1;
        int i15 = i14;
        if (readModule(i, i2 - 2, i3, i4)) {
            i15 = i14 | 1;
        }
        int i16 = i15 << 1;
        int i17 = i16;
        if (readModule(i, i2 - 1, i3, i4)) {
            i17 = i16 | 1;
        }
        int i18 = i17 << 1;
        int i19 = i18;
        if (readModule(i, i2, i3, i4)) {
            i19 = i18 | 1;
        }
        return i19;
    }
}
