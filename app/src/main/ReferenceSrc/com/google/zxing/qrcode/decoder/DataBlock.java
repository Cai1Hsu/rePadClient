package com.google.zxing.qrcode.decoder;

import com.google.zxing.qrcode.decoder.Version;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class DataBlock {
    private final byte[] codewords;
    private final int numDataCodewords;

    private DataBlock(int numDataCodewords, byte[] codewords) {
        this.numDataCodewords = numDataCodewords;
        this.codewords = codewords;
    }

    public static DataBlock[] getDataBlocks(byte[] rawCodewords, Version version, ErrorCorrectionLevel ecLevel) {
        int rawCodewordsOffset;
        int rawCodewordsOffset2;
        int rawCodewordsOffset3;
        if (rawCodewords.length != version.getTotalCodewords()) {
            throw new IllegalArgumentException();
        }
        Version.ECBlocks ecBlocks = version.getECBlocksForLevel(ecLevel);
        int totalBlocks = 0;
        Version.ECB[] ecBlockArray = ecBlocks.getECBlocks();
        for (Version.ECB ecBlock : ecBlockArray) {
            totalBlocks += ecBlock.getCount();
        }
        DataBlock[] result = new DataBlock[totalBlocks];
        int numResultBlocks = 0;
        for (Version.ECB ecBlock2 : ecBlockArray) {
            int i = 0;
            while (i < ecBlock2.getCount()) {
                int numDataCodewords = ecBlock2.getDataCodewords();
                int numBlockCodewords = ecBlocks.getECCodewordsPerBlock() + numDataCodewords;
                result[numResultBlocks] = new DataBlock(numDataCodewords, new byte[numBlockCodewords]);
                i++;
                numResultBlocks++;
            }
        }
        int shorterBlocksTotalCodewords = result[0].codewords.length;
        int longerBlocksStartAt = result.length - 1;
        while (longerBlocksStartAt >= 0) {
            int numCodewords = result[longerBlocksStartAt].codewords.length;
            if (numCodewords == shorterBlocksTotalCodewords) {
                break;
            }
            longerBlocksStartAt--;
        }
        int longerBlocksStartAt2 = longerBlocksStartAt + 1;
        int shorterBlocksNumDataCodewords = shorterBlocksTotalCodewords - ecBlocks.getECCodewordsPerBlock();
        int rawCodewordsOffset4 = 0;
        int i2 = 0;
        while (i2 < shorterBlocksNumDataCodewords) {
            int j = 0;
            while (true) {
                rawCodewordsOffset3 = rawCodewordsOffset4;
                if (j < numResultBlocks) {
                    rawCodewordsOffset4 = rawCodewordsOffset3 + 1;
                    result[j].codewords[i2] = rawCodewords[rawCodewordsOffset3];
                    j++;
                }
            }
            i2++;
            rawCodewordsOffset4 = rawCodewordsOffset3;
        }
        int j2 = longerBlocksStartAt2;
        while (true) {
            rawCodewordsOffset = rawCodewordsOffset4;
            if (j2 >= numResultBlocks) {
                break;
            }
            rawCodewordsOffset4 = rawCodewordsOffset + 1;
            result[j2].codewords[shorterBlocksNumDataCodewords] = rawCodewords[rawCodewordsOffset];
            j2++;
        }
        int max = result[0].codewords.length;
        int i3 = shorterBlocksNumDataCodewords;
        int rawCodewordsOffset5 = rawCodewordsOffset;
        while (i3 < max) {
            int j3 = 0;
            while (true) {
                rawCodewordsOffset2 = rawCodewordsOffset5;
                if (j3 < numResultBlocks) {
                    int iOffset = j3 < longerBlocksStartAt2 ? i3 : i3 + 1;
                    rawCodewordsOffset5 = rawCodewordsOffset2 + 1;
                    result[j3].codewords[iOffset] = rawCodewords[rawCodewordsOffset2];
                    j3++;
                }
            }
            i3++;
            rawCodewordsOffset5 = rawCodewordsOffset2;
        }
        return result;
    }

    public int getNumDataCodewords() {
        return this.numDataCodewords;
    }

    public byte[] getCodewords() {
        return this.codewords;
    }
}
