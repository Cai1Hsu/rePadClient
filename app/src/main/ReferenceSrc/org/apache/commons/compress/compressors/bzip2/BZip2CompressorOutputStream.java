package org.apache.commons.compress.compressors.bzip2;

import android.support.v4.view.InputDeviceCompat;
import java.io.IOException;
import java.io.OutputStream;
import org.apache.commons.compress.compressors.CompressorOutputStream;

/* loaded from: classes.jar:org/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream.class */
public class BZip2CompressorOutputStream extends CompressorOutputStream implements BZip2Constants {
    private static final int GREATER_ICOST = 15;
    private static final int LESSER_ICOST = 0;
    public static final int MAX_BLOCKSIZE = 9;
    public static final int MIN_BLOCKSIZE = 1;
    private final int allowableBlockSize;
    private int blockCRC;
    private final int blockSize100k;
    private BlockSort blockSorter;
    private int bsBuff;
    private int bsLive;
    private int combinedCRC;
    private final CRC crc;
    private int currentChar;
    private Data data;
    private int last;
    private int nInUse;
    private int nMTF;
    private OutputStream out;
    private int runLength;

    /* loaded from: classes.jar:org/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream$Data.class */
    static final class Data {
        final byte[] block;
        final int[] fmap;
        int origPtr;
        final char[] sfmap;
        final boolean[] inUse = new boolean[256];
        final byte[] unseqToSeq = new byte[256];
        final int[] mtfFreq = new int[258];
        final byte[] selector = new byte[18002];
        final byte[] selectorMtf = new byte[18002];
        final byte[] generateMTFValues_yy = new byte[256];
        final byte[][] sendMTFValues_len = new byte[6][258];
        final int[][] sendMTFValues_rfreq = new int[6][258];
        final int[] sendMTFValues_fave = new int[6];
        final short[] sendMTFValues_cost = new short[6];
        final int[][] sendMTFValues_code = new int[6][258];
        final byte[] sendMTFValues2_pos = new byte[6];
        final boolean[] sentMTFValues4_inUse16 = new boolean[16];
        final int[] heap = new int[260];
        final int[] weight = new int[516];
        final int[] parent = new int[516];

        Data(int i) {
            int i2 = i * 100000;
            this.block = new byte[i2 + 1 + 20];
            this.fmap = new int[i2];
            this.sfmap = new char[i2 * 2];
        }
    }

    public BZip2CompressorOutputStream(OutputStream outputStream) throws IOException {
        this(outputStream, 9);
    }

    public BZip2CompressorOutputStream(OutputStream outputStream, int i) throws IOException {
        this.crc = new CRC();
        this.currentChar = -1;
        this.runLength = 0;
        if (i < 1) {
            throw new IllegalArgumentException("blockSize(" + i + ") < 1");
        }
        if (i > 9) {
            throw new IllegalArgumentException("blockSize(" + i + ") > 9");
        }
        this.blockSize100k = i;
        this.out = outputStream;
        this.allowableBlockSize = (this.blockSize100k * 100000) - 20;
        init();
    }

    private void blockSort() {
        this.blockSorter.blockSort(this.data, this.last);
    }

    private void bsFinishedWithStream() throws IOException {
        while (this.bsLive > 0) {
            this.out.write(this.bsBuff >> 24);
            this.bsBuff <<= 8;
            this.bsLive -= 8;
        }
    }

    private void bsPutInt(int i) throws IOException {
        bsW(8, (i >> 24) & 255);
        bsW(8, (i >> 16) & 255);
        bsW(8, (i >> 8) & 255);
        bsW(8, i & 255);
    }

    private void bsPutUByte(int i) throws IOException {
        bsW(8, i);
    }

    private void bsW(int i, int i2) throws IOException {
        OutputStream outputStream = this.out;
        int i3 = this.bsLive;
        int i4 = this.bsBuff;
        while (i3 >= 8) {
            outputStream.write(i4 >> 24);
            i4 <<= 8;
            i3 -= 8;
        }
        this.bsBuff = (i2 << ((32 - i3) - i)) | i4;
        this.bsLive = i3 + i;
    }

    public static int chooseBlockSize(long j) {
        return j > 0 ? (int) Math.min((j / 132000) + 1, 9L) : 9;
    }

    private void endBlock() throws IOException {
        this.blockCRC = this.crc.getFinalCRC();
        this.combinedCRC = (this.combinedCRC << 1) | (this.combinedCRC >>> 31);
        this.combinedCRC ^= this.blockCRC;
        if (this.last == -1) {
            return;
        }
        blockSort();
        bsPutUByte(49);
        bsPutUByte(65);
        bsPutUByte(89);
        bsPutUByte(38);
        bsPutUByte(83);
        bsPutUByte(89);
        bsPutInt(this.blockCRC);
        bsW(1, 0);
        moveToFrontCodeAndSend();
    }

    private void endCompression() throws IOException {
        bsPutUByte(23);
        bsPutUByte(114);
        bsPutUByte(69);
        bsPutUByte(56);
        bsPutUByte(80);
        bsPutUByte(144);
        bsPutInt(this.combinedCRC);
        bsFinishedWithStream();
    }

    private void generateMTFValues() {
        int i = this.last;
        Data data = this.data;
        boolean[] zArr = data.inUse;
        byte[] bArr = data.block;
        int[] iArr = data.fmap;
        char[] cArr = data.sfmap;
        int[] iArr2 = data.mtfFreq;
        byte[] bArr2 = data.unseqToSeq;
        byte[] bArr3 = data.generateMTFValues_yy;
        int i2 = 0;
        int i3 = 0;
        while (i3 < 256) {
            int i4 = i2;
            if (zArr[i3]) {
                bArr2[i3] = (byte) i2;
                i4 = i2 + 1;
            }
            i3++;
            i2 = i4;
        }
        this.nInUse = i2;
        int i5 = i2 + 1;
        for (int i6 = i5; i6 >= 0; i6--) {
            iArr2[i6] = 0;
        }
        while (true) {
            i2--;
            if (i2 < 0) {
                break;
            }
            bArr3[i2] = (byte) i2;
        }
        int i7 = 0;
        int i8 = 0;
        for (int i9 = 0; i9 <= i; i9++) {
            byte b = bArr2[bArr[iArr[i9]] & 255];
            byte b2 = bArr3[0];
            int i10 = 0;
            while (b != b2) {
                i10++;
                byte b3 = bArr3[i10];
                bArr3[i10] = b2;
                b2 = b3;
            }
            bArr3[0] = b2;
            if (i10 == 0) {
                i8++;
            } else {
                int i11 = i7;
                int i12 = i8;
                if (i8 > 0) {
                    int i13 = i8 - 1;
                    while (true) {
                        if ((i13 & 1) == 0) {
                            cArr[i7] = (char) 0;
                            i7++;
                            iArr2[0] = iArr2[0] + 1;
                        } else {
                            cArr[i7] = (char) 1;
                            i7++;
                            iArr2[1] = iArr2[1] + 1;
                        }
                        if (i13 < 2) {
                            break;
                        }
                        i13 = (i13 - 2) >> 1;
                    }
                    i12 = 0;
                    i11 = i7;
                }
                cArr[i11] = (char) (i10 + 1);
                i7 = i11 + 1;
                int i14 = i10 + 1;
                iArr2[i14] = iArr2[i14] + 1;
                i8 = i12;
            }
        }
        int i15 = i7;
        if (i8 > 0) {
            int i16 = i8 - 1;
            while (true) {
                if ((i16 & 1) == 0) {
                    cArr[i7] = (char) 0;
                    i7++;
                    iArr2[0] = iArr2[0] + 1;
                } else {
                    cArr[i7] = (char) 1;
                    i7++;
                    iArr2[1] = iArr2[1] + 1;
                }
                i15 = i7;
                if (i16 < 2) {
                    break;
                }
                i16 = (i16 - 2) >> 1;
            }
        }
        cArr[i15] = (char) i5;
        iArr2[i5] = iArr2[i5] + 1;
        this.nMTF = i15 + 1;
    }

    private static void hbAssignCodes(int[] iArr, byte[] bArr, int i, int i2, int i3) {
        int i4;
        int i5 = 0;
        for (int i6 = i; i6 <= i2; i6++) {
            int i7 = 0;
            while (true) {
                i4 = i5;
                if (i7 < i3) {
                    i5 = i4;
                    if ((bArr[i7] & 255) == i6) {
                        iArr[i7] = i4;
                        i5 = i4 + 1;
                    }
                    i7++;
                }
            }
            i5 = i4 << 1;
        }
    }

    private static void hbMakeCodeLengths(byte[] bArr, int[] iArr, Data data, int i, int i2) {
        int i3;
        int i4;
        int[] iArr2 = data.heap;
        int[] iArr3 = data.weight;
        int[] iArr4 = data.parent;
        int i5 = i;
        while (true) {
            int i6 = i5 - 1;
            if (i6 < 0) {
                break;
            }
            iArr3[i6 + 1] = (iArr[i6] == 0 ? 1 : iArr[i6]) << 8;
            i5 = i6;
        }
        boolean z = true;
        while (z) {
            int i7 = 0;
            iArr2[0] = 0;
            iArr3[0] = 0;
            iArr4[0] = -2;
            int i8 = 1;
            while (true) {
                i3 = i7;
                i4 = i;
                if (i8 <= i) {
                    iArr4[i8] = -1;
                    i7++;
                    iArr2[i7] = i8;
                    int i9 = i7;
                    int i10 = iArr2[i9];
                    while (iArr3[i10] < iArr3[iArr2[i9 >> 1]]) {
                        iArr2[i9] = iArr2[i9 >> 1];
                        i9 >>= 1;
                    }
                    iArr2[i9] = i10;
                    i8++;
                }
            }
            while (i3 > 1) {
                int i11 = iArr2[1];
                iArr2[1] = iArr2[i3];
                int i12 = i3 - 1;
                int i13 = 1;
                int i14 = iArr2[1];
                while (true) {
                    int i15 = i13 << 1;
                    if (i15 > i12) {
                        break;
                    }
                    int i16 = i15;
                    if (i15 < i12) {
                        i16 = i15;
                        if (iArr3[iArr2[i15 + 1]] < iArr3[iArr2[i15]]) {
                            i16 = i15 + 1;
                        }
                    }
                    if (iArr3[i14] < iArr3[iArr2[i16]]) {
                        break;
                    }
                    iArr2[i13] = iArr2[i16];
                    i13 = i16;
                }
                iArr2[i13] = i14;
                int i17 = iArr2[1];
                iArr2[1] = iArr2[i12];
                int i18 = i12 - 1;
                int i19 = 1;
                int i20 = iArr2[1];
                while (true) {
                    int i21 = i19 << 1;
                    if (i21 > i18) {
                        break;
                    }
                    int i22 = i21;
                    if (i21 < i18) {
                        i22 = i21;
                        if (iArr3[iArr2[i21 + 1]] < iArr3[iArr2[i21]]) {
                            i22 = i21 + 1;
                        }
                    }
                    if (iArr3[i20] < iArr3[iArr2[i22]]) {
                        break;
                    }
                    iArr2[i19] = iArr2[i22];
                    i19 = i22;
                }
                iArr2[i19] = i20;
                int i23 = i4 + 1;
                iArr4[i17] = i23;
                iArr4[i11] = i23;
                int i24 = iArr3[i11];
                int i25 = iArr3[i17];
                iArr3[i23] = (((i24 & 255) > (i25 & 255) ? i24 & 255 : i25 & 255) + 1) | ((i25 & InputDeviceCompat.SOURCE_ANY) + (i24 & InputDeviceCompat.SOURCE_ANY));
                iArr4[i23] = -1;
                int i26 = i18 + 1;
                iArr2[i26] = i23;
                int i27 = i26;
                int i28 = iArr2[i27];
                int i29 = iArr3[i28];
                while (i29 < iArr3[iArr2[i27 >> 1]]) {
                    iArr2[i27] = iArr2[i27 >> 1];
                    i27 >>= 1;
                }
                iArr2[i27] = i28;
                i4 = i23;
                i3 = i26;
            }
            boolean z2 = false;
            for (int i30 = 1; i30 <= i; i30++) {
                int i31 = 0;
                int i32 = i30;
                while (true) {
                    i32 = iArr4[i32];
                    if (i32 < 0) {
                        break;
                    }
                    i31++;
                }
                bArr[i30 - 1] = (byte) i31;
                if (i31 > i2) {
                    z2 = true;
                }
            }
            z = z2;
            if (z2) {
                int i33 = 1;
                while (true) {
                    z = z2;
                    if (i33 < i) {
                        iArr3[i33] = (((iArr3[i33] >> 8) >> 1) + 1) << 8;
                        i33++;
                    }
                }
            }
        }
    }

    private void init() throws IOException {
        bsPutUByte(66);
        bsPutUByte(90);
        this.data = new Data(this.blockSize100k);
        this.blockSorter = new BlockSort(this.data);
        bsPutUByte(104);
        bsPutUByte(this.blockSize100k + 48);
        this.combinedCRC = 0;
        initBlock();
    }

    private void initBlock() {
        this.crc.initialiseCRC();
        this.last = -1;
        boolean[] zArr = this.data.inUse;
        int i = 256;
        while (true) {
            i--;
            if (i >= 0) {
                zArr[i] = false;
            } else {
                return;
            }
        }
    }

    private void moveToFrontCodeAndSend() throws IOException {
        bsW(24, this.data.origPtr);
        generateMTFValues();
        sendMTFValues();
    }

    private void sendMTFValues() throws IOException {
        byte[][] bArr = this.data.sendMTFValues_len;
        int i = this.nInUse + 2;
        int i2 = 6;
        while (true) {
            int i3 = i2 - 1;
            if (i3 < 0) {
                break;
            }
            byte[] bArr2 = bArr[i3];
            int i4 = i;
            while (true) {
                int i5 = i4 - 1;
                i2 = i3;
                if (i5 >= 0) {
                    bArr2[i5] = (byte) 15;
                    i4 = i5;
                }
            }
        }
        int i6 = this.nMTF < 200 ? 2 : this.nMTF < 600 ? 3 : this.nMTF < 1200 ? 4 : this.nMTF < 2400 ? 5 : 6;
        sendMTFValues0(i6, i);
        int sendMTFValues1 = sendMTFValues1(i6, i);
        sendMTFValues2(i6, sendMTFValues1);
        sendMTFValues3(i6, i);
        sendMTFValues4();
        sendMTFValues5(i6, sendMTFValues1);
        sendMTFValues6(i6, i);
        sendMTFValues7();
    }

    private void sendMTFValues0(int i, int i2) {
        byte[][] bArr = this.data.sendMTFValues_len;
        int[] iArr = this.data.mtfFreq;
        int i3 = this.nMTF;
        int i4 = 0;
        for (int i5 = i; i5 > 0; i5--) {
            int i6 = i3 / i5;
            int i7 = 0;
            int i8 = i4 - 1;
            while (i7 < i6 && i8 < i2 - 1) {
                i8++;
                i7 += iArr[i8];
            }
            if (i8 > i4 && i5 != i && i5 != 1 && ((i - i5) & 1) != 0) {
                i7 -= iArr[i8];
                i8--;
            }
            byte[] bArr2 = bArr[i5 - 1];
            int i9 = i2;
            while (true) {
                i9--;
                if (i9 >= 0) {
                    if (i9 < i4 || i9 > i8) {
                        bArr2[i9] = (byte) 15;
                    } else {
                        bArr2[i9] = (byte) 0;
                    }
                }
            }
            i4 = i8 + 1;
            i3 -= i7;
        }
    }

    private int sendMTFValues1(int i, int i2) {
        Data data = this.data;
        int[][] iArr = data.sendMTFValues_rfreq;
        int[] iArr2 = data.sendMTFValues_fave;
        short[] sArr = data.sendMTFValues_cost;
        char[] cArr = data.sfmap;
        byte[] bArr = data.selector;
        byte[][] bArr2 = data.sendMTFValues_len;
        byte[] bArr3 = bArr2[0];
        byte[] bArr4 = bArr2[1];
        byte[] bArr5 = bArr2[2];
        byte[] bArr6 = bArr2[3];
        byte[] bArr7 = bArr2[4];
        byte[] bArr8 = bArr2[5];
        int i3 = this.nMTF;
        int i4 = 0;
        for (int i5 = 0; i5 < 4; i5++) {
            int i6 = i;
            while (true) {
                int i7 = i6 - 1;
                if (i7 < 0) {
                    break;
                }
                iArr2[i7] = 0;
                int[] iArr3 = iArr[i7];
                int i8 = i2;
                while (true) {
                    int i9 = i8 - 1;
                    i6 = i7;
                    if (i9 >= 0) {
                        iArr3[i9] = 0;
                        i8 = i9;
                    }
                }
            }
            i4 = 0;
            int i10 = 0;
            while (true) {
                int i11 = i10;
                if (i11 >= this.nMTF) {
                    break;
                }
                int min = Math.min((i11 + 50) - 1, i3 - 1);
                if (i == 6) {
                    short s = 0;
                    short s2 = 0;
                    short s3 = 0;
                    short s4 = 0;
                    short s5 = 0;
                    short s6 = 0;
                    for (int i12 = i11; i12 <= min; i12++) {
                        char c = cArr[i12];
                        s = (short) ((bArr3[c] & 255) + s);
                        s2 = (short) ((bArr4[c] & 255) + s2);
                        s3 = (short) ((bArr5[c] & 255) + s3);
                        s4 = (short) ((bArr6[c] & 255) + s4);
                        s5 = (short) ((bArr7[c] & 255) + s5);
                        s6 = (short) ((bArr8[c] & 255) + s6);
                    }
                    sArr[0] = s;
                    sArr[1] = s2;
                    sArr[2] = s3;
                    sArr[3] = s4;
                    sArr[4] = s5;
                    sArr[5] = s6;
                } else {
                    int i13 = i;
                    while (true) {
                        i13--;
                        if (i13 < 0) {
                            break;
                        }
                        sArr[i13] = (short) 0;
                    }
                    for (int i14 = i11; i14 <= min; i14++) {
                        char c2 = cArr[i14];
                        int i15 = i;
                        while (true) {
                            i15--;
                            if (i15 >= 0) {
                                sArr[i15] = (short) (sArr[i15] + (bArr2[i15][c2] & 255));
                            }
                        }
                    }
                }
                int i16 = -1;
                int i17 = i;
                short s7 = 999999999;
                while (true) {
                    int i18 = i17 - 1;
                    if (i18 < 0) {
                        break;
                    }
                    short s8 = sArr[i18];
                    i17 = i18;
                    if (s8 < s7) {
                        s7 = s8;
                        i16 = i18;
                        i17 = i18;
                    }
                }
                iArr2[i16] = iArr2[i16] + 1;
                bArr[i4] = (byte) i16;
                i4++;
                int[] iArr4 = iArr[i16];
                while (i11 <= min) {
                    char c3 = cArr[i11];
                    iArr4[c3] = iArr4[c3] + 1;
                    i11++;
                }
                i10 = min + 1;
            }
            for (int i19 = 0; i19 < i; i19++) {
                hbMakeCodeLengths(bArr2[i19], iArr[i19], this.data, i2, 20);
            }
        }
        return i4;
    }

    private void sendMTFValues2(int i, int i2) {
        byte b;
        Data data = this.data;
        byte[] bArr = data.sendMTFValues2_pos;
        while (true) {
            i--;
            if (i < 0) {
                break;
            }
            bArr[i] = (byte) i;
        }
        for (int i3 = 0; i3 < i2; i3++) {
            byte b2 = data.selector[i3];
            byte b3 = bArr[0];
            int i4 = 0;
            while (true) {
                b = b3;
                if (b2 != b) {
                    i4++;
                    b3 = bArr[i4];
                    bArr[i4] = b;
                }
            }
            bArr[0] = b;
            data.selectorMtf[i3] = (byte) i4;
        }
    }

    private void sendMTFValues3(int i, int i2) {
        int[][] iArr = this.data.sendMTFValues_code;
        byte[][] bArr = this.data.sendMTFValues_len;
        for (int i3 = 0; i3 < i; i3++) {
            int i4 = 32;
            int i5 = 0;
            byte[] bArr2 = bArr[i3];
            int i6 = i2;
            while (true) {
                int i7 = i6 - 1;
                if (i7 >= 0) {
                    int i8 = bArr2[i7] & 255;
                    int i9 = i5;
                    if (i8 > i5) {
                        i9 = i8;
                    }
                    i6 = i7;
                    i5 = i9;
                    if (i8 < i4) {
                        i4 = i8;
                        i6 = i7;
                        i5 = i9;
                    }
                }
            }
            hbAssignCodes(iArr[i3], bArr[i3], i4, i5, i2);
        }
    }

    private void sendMTFValues4() throws IOException {
        boolean[] zArr = this.data.inUse;
        boolean[] zArr2 = this.data.sentMTFValues4_inUse16;
        int i = 16;
        while (true) {
            int i2 = i - 1;
            if (i2 < 0) {
                break;
            }
            zArr2[i2] = false;
            int i3 = 16;
            while (true) {
                int i4 = i3 - 1;
                i = i2;
                if (i4 >= 0) {
                    i3 = i4;
                    if (zArr[(i2 * 16) + i4]) {
                        zArr2[i2] = true;
                        i3 = i4;
                    }
                }
            }
        }
        for (int i5 = 0; i5 < 16; i5++) {
            bsW(1, zArr2[i5] ? 1 : 0);
        }
        OutputStream outputStream = this.out;
        int i6 = this.bsLive;
        int i7 = this.bsBuff;
        int i8 = 0;
        while (i8 < 16) {
            int i9 = i7;
            int i10 = i6;
            if (zArr2[i8]) {
                int i11 = 0;
                while (true) {
                    i9 = i7;
                    i10 = i6;
                    if (i11 < 16) {
                        int i12 = i6;
                        int i13 = i7;
                        while (i12 >= 8) {
                            outputStream.write(i13 >> 24);
                            i13 <<= 8;
                            i12 -= 8;
                        }
                        i7 = i13;
                        if (zArr[(i8 * 16) + i11]) {
                            i7 = i13 | (1 << ((32 - i12) - 1));
                        }
                        i6 = i12 + 1;
                        i11++;
                    }
                }
            }
            i8++;
            i7 = i9;
            i6 = i10;
        }
        this.bsBuff = i7;
        this.bsLive = i6;
    }

    private void sendMTFValues5(int i, int i2) throws IOException {
        int i3;
        int i4;
        bsW(3, i);
        bsW(15, i2);
        OutputStream outputStream = this.out;
        byte[] bArr = this.data.selectorMtf;
        int i5 = this.bsLive;
        int i6 = this.bsBuff;
        int i7 = 0;
        while (i7 < i2) {
            int i8 = 0;
            byte b = bArr[i7];
            while (true) {
                i3 = i6;
                i4 = i5;
                if (i8 < (b & 255)) {
                    while (i5 >= 8) {
                        outputStream.write(i6 >> 24);
                        i6 <<= 8;
                        i5 -= 8;
                    }
                    i6 |= 1 << ((32 - i5) - 1);
                    i5++;
                    i8++;
                }
            }
            while (i4 >= 8) {
                outputStream.write(i3 >> 24);
                i3 <<= 8;
                i4 -= 8;
            }
            i5 = i4 + 1;
            i7++;
            i6 = i3;
        }
        this.bsBuff = i6;
        this.bsLive = i5;
    }

    private void sendMTFValues6(int i, int i2) throws IOException {
        int i3;
        int i4;
        int i5;
        int i6;
        byte[][] bArr = this.data.sendMTFValues_len;
        OutputStream outputStream = this.out;
        int i7 = this.bsLive;
        int i8 = this.bsBuff;
        for (int i9 = 0; i9 < i; i9++) {
            byte[] bArr2 = bArr[i9];
            int i10 = bArr2[0] & 255;
            while (i7 >= 8) {
                outputStream.write(i8 >> 24);
                i8 <<= 8;
                i7 -= 8;
            }
            i8 |= i10 << ((32 - i7) - 5);
            i7 += 5;
            int i11 = 0;
            while (i11 < i2) {
                int i12 = bArr2[i11] & 255;
                int i13 = i10;
                int i14 = i7;
                int i15 = i8;
                while (true) {
                    i3 = i15;
                    i4 = i14;
                    i10 = i13;
                    if (i13 < i12) {
                        while (i14 >= 8) {
                            outputStream.write(i15 >> 24);
                            i15 <<= 8;
                            i14 -= 8;
                        }
                        i15 |= 2 << ((32 - i14) - 2);
                        i14 += 2;
                        i13++;
                    }
                }
                while (true) {
                    i5 = i3;
                    i6 = i4;
                    if (i10 > i12) {
                        while (i4 >= 8) {
                            outputStream.write(i3 >> 24);
                            i3 <<= 8;
                            i4 -= 8;
                        }
                        i3 |= 3 << ((32 - i4) - 2);
                        i4 += 2;
                        i10--;
                    }
                }
                while (i6 >= 8) {
                    outputStream.write(i5 >> 24);
                    i5 <<= 8;
                    i6 -= 8;
                }
                i7 = i6 + 1;
                i11++;
                i8 = i5;
            }
        }
        this.bsBuff = i8;
        this.bsLive = i7;
    }

    private void sendMTFValues7() throws IOException {
        Data data = this.data;
        byte[][] bArr = data.sendMTFValues_len;
        int[][] iArr = data.sendMTFValues_code;
        OutputStream outputStream = this.out;
        byte[] bArr2 = data.selector;
        char[] cArr = data.sfmap;
        int i = this.nMTF;
        int i2 = 0;
        int i3 = this.bsLive;
        int i4 = this.bsBuff;
        int i5 = 0;
        while (true) {
            int i6 = i5;
            if (i6 >= i) {
                this.bsBuff = i4;
                this.bsLive = i3;
                return;
            }
            int min = Math.min((i6 + 50) - 1, i - 1);
            int i7 = bArr2[i2] & 255;
            int[] iArr2 = iArr[i7];
            byte[] bArr3 = bArr[i7];
            int i8 = i4;
            for (int i9 = i6; i9 <= min; i9++) {
                char c = cArr[i9];
                while (i3 >= 8) {
                    outputStream.write(i8 >> 24);
                    i8 <<= 8;
                    i3 -= 8;
                }
                int i10 = bArr3[c] & 255;
                i8 |= iArr2[c] << ((32 - i3) - i10);
                i3 += i10;
            }
            i2++;
            i4 = i8;
            i5 = min + 1;
        }
    }

    private void write0(int i) throws IOException {
        if (this.currentChar == -1) {
            this.currentChar = i & 255;
            this.runLength++;
            return;
        }
        int i2 = i & 255;
        if (this.currentChar != i2) {
            writeRun();
            this.runLength = 1;
            this.currentChar = i2;
            return;
        }
        int i3 = this.runLength + 1;
        this.runLength = i3;
        if (i3 <= 254) {
            return;
        }
        writeRun();
        this.currentChar = -1;
        this.runLength = 0;
    }

    private void writeRun() throws IOException {
        int i = this.last;
        if (i >= this.allowableBlockSize) {
            endBlock();
            initBlock();
            writeRun();
            return;
        }
        int i2 = this.currentChar;
        Data data = this.data;
        data.inUse[i2] = true;
        byte b = (byte) i2;
        int i3 = this.runLength;
        this.crc.updateCRC(i2, i3);
        switch (i3) {
            case 1:
                data.block[i + 2] = b;
                this.last = i + 1;
                return;
            case 2:
                data.block[i + 2] = b;
                data.block[i + 3] = b;
                this.last = i + 2;
                return;
            case 3:
                byte[] bArr = data.block;
                bArr[i + 2] = b;
                bArr[i + 3] = b;
                bArr[i + 4] = b;
                this.last = i + 3;
                return;
            default:
                int i4 = i3 - 4;
                data.inUse[i4] = true;
                byte[] bArr2 = data.block;
                bArr2[i + 2] = b;
                bArr2[i + 3] = b;
                bArr2[i + 4] = b;
                bArr2[i + 5] = b;
                bArr2[i + 6] = (byte) i4;
                this.last = i + 5;
                return;
        }
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.out != null) {
            OutputStream outputStream = this.out;
            finish();
            outputStream.close();
        }
    }

    protected void finalize() throws Throwable {
        finish();
        super.finalize();
    }

    public void finish() throws IOException {
        if (this.out != null) {
            try {
                if (this.runLength > 0) {
                    writeRun();
                }
                this.currentChar = -1;
                endBlock();
                endCompression();
            } finally {
                this.out = null;
                this.data = null;
                this.blockSorter = null;
            }
        }
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        OutputStream outputStream = this.out;
        if (outputStream != null) {
            outputStream.flush();
        }
    }

    public final int getBlockSize() {
        return this.blockSize100k;
    }

    @Override // java.io.OutputStream
    public void write(int i) throws IOException {
        if (this.out != null) {
            write0(i);
            return;
        }
        throw new IOException("closed");
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) throws IOException {
        if (i < 0) {
            throw new IndexOutOfBoundsException("offs(" + i + ") < 0.");
        }
        if (i2 < 0) {
            throw new IndexOutOfBoundsException("len(" + i2 + ") < 0.");
        }
        if (i + i2 > bArr.length) {
            throw new IndexOutOfBoundsException("offs(" + i + ") + len(" + i2 + ") > buf.length(" + bArr.length + ").");
        }
        if (this.out == null) {
            throw new IOException("stream closed");
        }
        for (int i3 = i; i3 < i + i2; i3++) {
            write0(bArr[i3]);
        }
    }
}
