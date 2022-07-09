package com.google.zxing.aztec.decoder;

import android.support.v4.view.PointerIconCompat;
import com.edutech.publicedu.log.LogHelp;
import com.google.zxing.FormatException;
import com.google.zxing.aztec.AztecDetectorResult;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.common.reedsolomon.GenericGF;
import com.google.zxing.common.reedsolomon.ReedSolomonDecoder;
import com.google.zxing.common.reedsolomon.ReedSolomonException;
import org.apache.commons.net.nntp.NNTPReply;
import org.apache.http.HttpStatus;
import org.jivesoftware.smackx.entitycaps.EntityCapsManager;

/* loaded from: classes.jar:com/google/zxing/aztec/decoder/Decoder.class */
public final class Decoder {
    private int codewordSize;
    private AztecDetectorResult ddata;
    private int invertedBitCount;
    private int numCodewords;
    private static final int[] NB_BITS_COMPACT = {0, 104, 240, HttpStatus.SC_REQUEST_TIMEOUT, 608};
    private static final int[] NB_BITS = {0, 128, 288, NNTPReply.AUTHENTICATION_REQUIRED, 704, 960, 1248, 1568, 1920, 2304, 2720, 3168, 3648, 4160, 4704, 5280, 5888, 6528, 7200, 7904, 8640, 9408, 10208, 11040, 11904, 12800, 13728, 14688, 15680, 16704, 17760, 18848, 19968};
    private static final int[] NB_DATABLOCK_COMPACT = {0, 17, 40, 51, 76};
    private static final int[] NB_DATABLOCK = {0, 21, 48, 60, 88, 120, 156, 196, 240, 230, 272, 316, 364, HttpStatus.SC_REQUESTED_RANGE_NOT_SATISFIABLE, 470, 528, 588, 652, 720, 790, 864, 940, PointerIconCompat.TYPE_GRAB, 920, 992, 1066, 1144, 1224, 1306, 1392, 1480, 1570, 1664};
    private static final String[] UPPER_TABLE = {"CTRL_PS", " ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "CTRL_LL", "CTRL_ML", "CTRL_DL", "CTRL_BS"};
    private static final String[] LOWER_TABLE = {"CTRL_PS", " ", "a", "b", EntityCapsManager.ELEMENT, "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "CTRL_US", "CTRL_ML", "CTRL_DL", "CTRL_BS"};
    private static final String[] MIXED_TABLE = {"CTRL_PS", " ", "\u0001", "\u0002", "\u0003", "\u0004", "\u0005", "\u0006", "\u0007", "\b", "\t", "\n", "\u000b", "\f", "\r", "\u001b", "\u001c", "\u001d", "\u001e", "\u001f", "@", "\\", "^", "_", "`", "|", "~", "\u007f", "CTRL_LL", "CTRL_UL", "CTRL_PL", "CTRL_BS"};
    private static final String[] PUNCT_TABLE = {"", "\r", "\r\n", ". ", ", ", ": ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "[", "]", "{", "}", "CTRL_UL"};
    private static final String[] DIGIT_TABLE = {"CTRL_PS", " ", "0", LogHelp.TYPE_GUIDANCE, LogHelp.TYPE_MYWORK, LogHelp.TYPE_HWHELP, "4", "5", "6", "7", "8", "9", ",", ".", "CTRL_UL", "CTRL_US"};

    /* loaded from: classes.jar:com/google/zxing/aztec/decoder/Decoder$Table.class */
    private enum Table {
        UPPER,
        LOWER,
        MIXED,
        DIGIT,
        PUNCT,
        BINARY
    }

    private boolean[] correctBits(boolean[] zArr) throws FormatException {
        GenericGF genericGF;
        int i;
        int i2;
        if (this.ddata.getNbLayers() <= 2) {
            this.codewordSize = 6;
            genericGF = GenericGF.AZTEC_DATA_6;
        } else if (this.ddata.getNbLayers() <= 8) {
            this.codewordSize = 8;
            genericGF = GenericGF.AZTEC_DATA_8;
        } else if (this.ddata.getNbLayers() <= 22) {
            this.codewordSize = 10;
            genericGF = GenericGF.AZTEC_DATA_10;
        } else {
            this.codewordSize = 12;
            genericGF = GenericGF.AZTEC_DATA_12;
        }
        int nbDatablocks = this.ddata.getNbDatablocks();
        if (this.ddata.isCompact()) {
            i = NB_BITS_COMPACT[this.ddata.getNbLayers()] - (this.numCodewords * this.codewordSize);
            i2 = NB_DATABLOCK_COMPACT[this.ddata.getNbLayers()] - nbDatablocks;
        } else {
            i = NB_BITS[this.ddata.getNbLayers()] - (this.numCodewords * this.codewordSize);
            i2 = NB_DATABLOCK[this.ddata.getNbLayers()] - nbDatablocks;
        }
        int[] iArr = new int[this.numCodewords];
        for (int i3 = 0; i3 < this.numCodewords; i3++) {
            int i4 = 1;
            for (int i5 = 1; i5 <= this.codewordSize; i5++) {
                if (zArr[(((this.codewordSize * i3) + this.codewordSize) - i5) + i]) {
                    iArr[i3] = iArr[i3] + i4;
                }
                i4 <<= 1;
            }
        }
        try {
            new ReedSolomonDecoder(genericGF).decode(iArr, i2);
            int i6 = 0;
            this.invertedBitCount = 0;
            boolean[] zArr2 = new boolean[this.codewordSize * nbDatablocks];
            for (int i7 = 0; i7 < nbDatablocks; i7++) {
                boolean z = false;
                int i8 = 0;
                int i9 = 1 << (this.codewordSize - 1);
                for (int i10 = 0; i10 < this.codewordSize; i10++) {
                    boolean z2 = (iArr[i7] & i9) == i9;
                    if (i8 != this.codewordSize - 1) {
                        if (z == z2) {
                            i8++;
                        } else {
                            i8 = 1;
                            z = z2;
                        }
                        zArr2[((this.codewordSize * i7) + i10) - i6] = z2;
                    } else if (z2 == z) {
                        throw FormatException.getFormatInstance();
                    } else {
                        z = false;
                        i8 = 0;
                        i6++;
                        this.invertedBitCount++;
                    }
                    i9 >>>= 1;
                }
            }
            return zArr2;
        } catch (ReedSolomonException e) {
            throw FormatException.getFormatInstance();
        }
    }

    private boolean[] extractBits(BitMatrix bitMatrix) throws FormatException {
        boolean[] zArr;
        if (this.ddata.isCompact()) {
            if (this.ddata.getNbLayers() > NB_BITS_COMPACT.length) {
                throw FormatException.getFormatInstance();
            }
            zArr = new boolean[NB_BITS_COMPACT[this.ddata.getNbLayers()]];
            this.numCodewords = NB_DATABLOCK_COMPACT[this.ddata.getNbLayers()];
        } else if (this.ddata.getNbLayers() > NB_BITS.length) {
            throw FormatException.getFormatInstance();
        } else {
            zArr = new boolean[NB_BITS[this.ddata.getNbLayers()]];
            this.numCodewords = NB_DATABLOCK[this.ddata.getNbLayers()];
        }
        int nbLayers = this.ddata.getNbLayers();
        int height = bitMatrix.getHeight();
        int i = 0;
        int i2 = 0;
        while (nbLayers != 0) {
            int i3 = 0;
            for (int i4 = 0; i4 < (height * 2) - 4; i4++) {
                zArr[i + i4] = bitMatrix.get(i2 + i3, (i4 / 2) + i2);
                zArr[(((height * 2) + i) - 4) + i4] = bitMatrix.get((i4 / 2) + i2, ((i2 + height) - 1) - i3);
                i3 = (i3 + 1) % 2;
            }
            int i5 = 0;
            for (int i6 = (height * 2) + 1; i6 > 5; i6--) {
                zArr[(((height * 4) + i) - 8) + ((height * 2) - i6) + 1] = bitMatrix.get(((i2 + height) - 1) - i5, ((i6 / 2) + i2) - 1);
                zArr[(((height * 6) + i) - 12) + ((height * 2) - i6) + 1] = bitMatrix.get(((i6 / 2) + i2) - 1, i2 + i5);
                i5 = (i5 + 1) % 2;
            }
            i2 += 2;
            i += (height * 8) - 16;
            nbLayers--;
            height -= 4;
        }
        return zArr;
    }

    private static String getCharacter(Table table, int i) {
        String str;
        switch (AnonymousClass1.$SwitchMap$com$google$zxing$aztec$decoder$Decoder$Table[table.ordinal()]) {
            case 2:
                str = UPPER_TABLE[i];
                break;
            case 3:
                str = LOWER_TABLE[i];
                break;
            case 4:
                str = MIXED_TABLE[i];
                break;
            case 5:
                str = PUNCT_TABLE[i];
                break;
            case 6:
                str = DIGIT_TABLE[i];
                break;
            default:
                str = "";
                break;
        }
        return str;
    }

    private String getEncodedData(boolean[] zArr) throws FormatException {
        Table table;
        boolean z;
        int i;
        boolean z2;
        int nbDatablocks = (this.codewordSize * this.ddata.getNbDatablocks()) - this.invertedBitCount;
        if (nbDatablocks > zArr.length) {
            throw FormatException.getFormatInstance();
        }
        Table table2 = Table.UPPER;
        Table table3 = Table.UPPER;
        int i2 = 0;
        StringBuilder sb = new StringBuilder(20);
        boolean z3 = false;
        boolean z4 = false;
        boolean z5 = false;
        while (!z3) {
            if (z4) {
                z = true;
                table = table2;
            } else {
                table = table3;
                z = z5;
            }
            switch (table3) {
                case BINARY:
                    if (nbDatablocks - i2 >= 8) {
                        i = i2 + 8;
                        sb.append((char) readCode(zArr, i2, 8));
                        z2 = z3;
                        break;
                    } else {
                        z2 = true;
                        i = i2;
                        break;
                    }
                default:
                    int i3 = 5;
                    if (table3 == Table.DIGIT) {
                        i3 = 4;
                    }
                    if (nbDatablocks - i2 >= i3) {
                        int i4 = i2 + i3;
                        String character = getCharacter(table3, readCode(zArr, i2, i3));
                        if (!character.startsWith("CTRL_")) {
                            sb.append(character);
                            z2 = z3;
                            i = i4;
                            break;
                        } else {
                            Table table4 = getTable(character.charAt(5));
                            z2 = z3;
                            i = i4;
                            table3 = table4;
                            if (character.charAt(6) == 'S') {
                                z4 = true;
                                z2 = z3;
                                i = i4;
                                table3 = table4;
                                break;
                            }
                        }
                    } else {
                        z2 = true;
                        i = i2;
                        break;
                    }
                    break;
            }
            z3 = z2;
            table2 = table;
            i2 = i;
            z5 = z;
            if (z) {
                table3 = table;
                z4 = false;
                z5 = false;
                z3 = z2;
                table2 = table;
                i2 = i;
            }
        }
        return sb.toString();
    }

    private static Table getTable(char c) {
        Table table;
        switch (c) {
            case 'B':
                table = Table.BINARY;
                break;
            case 'D':
                table = Table.DIGIT;
                break;
            case 'L':
                table = Table.LOWER;
                break;
            case 'M':
                table = Table.MIXED;
                break;
            case 'P':
                table = Table.PUNCT;
                break;
            default:
                table = Table.UPPER;
                break;
        }
        return table;
    }

    private static int readCode(boolean[] zArr, int i, int i2) {
        int i3 = 0;
        for (int i4 = i; i4 < i + i2; i4++) {
            int i5 = i3 << 1;
            i3 = i5;
            if (zArr[i4]) {
                i3 = i5 + 1;
            }
        }
        return i3;
    }

    private static BitMatrix removeDashedLines(BitMatrix bitMatrix) {
        int width = ((((bitMatrix.getWidth() - 1) / 2) / 16) * 2) + 1;
        BitMatrix bitMatrix2 = new BitMatrix(bitMatrix.getWidth() - width, bitMatrix.getHeight() - width);
        int i = 0;
        for (int i2 = 0; i2 < bitMatrix.getWidth(); i2++) {
            if (((bitMatrix.getWidth() / 2) - i2) % 16 != 0) {
                int i3 = 0;
                for (int i4 = 0; i4 < bitMatrix.getHeight(); i4++) {
                    if (((bitMatrix.getWidth() / 2) - i4) % 16 != 0) {
                        if (bitMatrix.get(i2, i4)) {
                            bitMatrix2.set(i, i3);
                        }
                        i3++;
                    }
                }
                i++;
            }
        }
        return bitMatrix2;
    }

    public DecoderResult decode(AztecDetectorResult aztecDetectorResult) throws FormatException {
        this.ddata = aztecDetectorResult;
        BitMatrix bits = aztecDetectorResult.getBits();
        if (!this.ddata.isCompact()) {
            bits = removeDashedLines(this.ddata.getBits());
        }
        return new DecoderResult(null, getEncodedData(correctBits(extractBits(bits))), null, null);
    }
}
