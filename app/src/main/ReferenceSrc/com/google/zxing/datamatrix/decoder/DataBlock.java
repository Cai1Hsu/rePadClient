package com.google.zxing.datamatrix.decoder;

import com.google.zxing.datamatrix.decoder.Version;

/* loaded from: classes.jar:com/google/zxing/datamatrix/decoder/DataBlock.class */
final class DataBlock {
    private final byte[] codewords;
    private final int numDataCodewords;

    private DataBlock(int i, byte[] bArr) {
        this.numDataCodewords = i;
        this.codewords = bArr;
    }

    static DataBlock[] getDataBlocks(byte[] bArr, Version version) {
        Version.ECBlocks eCBlocks = version.getECBlocks();
        int i = 0;
        Version.ECB[] eCBlocks2 = eCBlocks.getECBlocks();
        for (Version.ECB ecb : eCBlocks2) {
            i += ecb.getCount();
        }
        DataBlock[] dataBlockArr = new DataBlock[i];
        int i2 = 0;
        for (Version.ECB ecb2 : eCBlocks2) {
            int i3 = 0;
            while (i3 < ecb2.getCount()) {
                int dataCodewords = ecb2.getDataCodewords();
                dataBlockArr[i2] = new DataBlock(dataCodewords, new byte[eCBlocks.getECCodewords() + dataCodewords]);
                i3++;
                i2++;
            }
        }
        int length = dataBlockArr[0].codewords.length - eCBlocks.getECCodewords();
        int i4 = 0;
        for (int i5 = 0; i5 < length - 1; i5++) {
            int i6 = 0;
            while (i6 < i2) {
                dataBlockArr[i6].codewords[i5] = bArr[i4];
                i6++;
                i4++;
            }
        }
        boolean z = version.getVersionNumber() == 24;
        int i7 = z ? 8 : i2;
        int i8 = 0;
        while (i8 < i7) {
            dataBlockArr[i8].codewords[length - 1] = bArr[i4];
            i8++;
            i4++;
        }
        int length2 = dataBlockArr[0].codewords.length;
        int i9 = i4;
        for (int i10 = length; i10 < length2; i10++) {
            int i11 = 0;
            while (i11 < i2) {
                dataBlockArr[i11].codewords[(!z || i11 <= 7) ? i10 : i10 - 1] = bArr[i9];
                i11++;
                i9++;
            }
        }
        if (i9 != bArr.length) {
            throw new IllegalArgumentException();
        }
        return dataBlockArr;
    }

    byte[] getCodewords() {
        return this.codewords;
    }

    int getNumDataCodewords() {
        return this.numDataCodewords;
    }
}
