package org.apache.tools.bzip2;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.jar:org/apache/tools/bzip2/CBZip2InputStream.class */
public class CBZip2InputStream extends InputStream implements BZip2Constants {
    private static final int EOF = 0;
    private static final int NO_RAND_PART_A_STATE = 5;
    private static final int NO_RAND_PART_B_STATE = 6;
    private static final int NO_RAND_PART_C_STATE = 7;
    private static final int RAND_PART_A_STATE = 2;
    private static final int RAND_PART_B_STATE = 3;
    private static final int RAND_PART_C_STATE = 4;
    private static final int START_BLOCK_STATE = 1;
    private boolean blockRandomised;
    private int blockSize100k;
    private int bsBuff;
    private int bsLive;
    private int computedBlockCRC;
    private int computedCombinedCRC;
    private final CRC crc = new CRC();
    private int currentChar = -1;
    private int currentState = 1;
    private Data data;
    private InputStream in;
    private int last;
    private int nInUse;
    private int origPtr;
    private int storedBlockCRC;
    private int storedCombinedCRC;
    private int su_ch2;
    private int su_chPrev;
    private int su_count;
    private int su_i2;
    private int su_j2;
    private int su_rNToGo;
    private int su_rTPos;
    private int su_tPos;
    private char su_z;

    /* loaded from: classes.jar:org/apache/tools/bzip2/CBZip2InputStream$Data.class */
    private static final class Data {
        byte[] ll8;
        int[] tt;
        final boolean[] inUse = new boolean[256];
        final byte[] seqToUnseq = new byte[256];
        final byte[] selector = new byte[18002];
        final byte[] selectorMtf = new byte[18002];
        final int[] unzftab = new int[256];
        final int[][] limit = new int[6][258];
        final int[][] base = new int[6][258];
        final int[][] perm = new int[6][258];
        final int[] minLens = new int[6];
        final int[] cftab = new int[257];
        final char[] getAndMoveToFrontDecode_yy = new char[256];
        final char[][] temp_charArray2d = new char[6][258];
        final byte[] recvDecodingTables_pos = new byte[6];

        Data(int i) {
            this.ll8 = new byte[100000 * i];
        }

        /* JADX WARN: Code restructure failed: missing block: B:5:0x000e, code lost:
            if (r0.length < r4) goto L6;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        final int[] initTT(int i) {
            int[] iArr;
            int[] iArr2 = this.tt;
            if (iArr2 != null) {
                iArr = iArr2;
            }
            iArr = new int[i];
            this.tt = iArr;
            return iArr;
        }
    }

    public CBZip2InputStream(InputStream inputStream) throws IOException {
        this.in = inputStream;
        init();
    }

    private boolean bsGetBit() throws IOException {
        boolean z = true;
        int i = this.bsLive;
        int i2 = this.bsBuff;
        int i3 = i2;
        int i4 = i;
        if (i < 1) {
            int read = this.in.read();
            if (read < 0) {
                throw new IOException("unexpected end of stream");
            }
            i3 = (i2 << 8) | read;
            i4 = i + 8;
            this.bsBuff = i3;
        }
        this.bsLive = i4 - 1;
        if (((i3 >> (i4 - 1)) & 1) == 0) {
            z = false;
        }
        return z;
    }

    private int bsGetInt() throws IOException {
        return (((((bsR(8) << 8) | bsR(8)) << 8) | bsR(8)) << 8) | bsR(8);
    }

    private char bsGetUByte() throws IOException {
        return (char) bsR(8);
    }

    private int bsR(int i) throws IOException {
        int i2;
        int i3;
        int i4 = this.bsLive;
        int i5 = this.bsBuff;
        int i6 = i5;
        int i7 = i4;
        if (i4 < i) {
            InputStream inputStream = this.in;
            int i8 = i4;
            int i9 = i5;
            do {
                int read = inputStream.read();
                if (read < 0) {
                    throw new IOException("unexpected end of stream");
                }
                i2 = (i9 << 8) | read;
                i3 = i8 + 8;
                i9 = i2;
                i8 = i3;
            } while (i3 < i);
            this.bsBuff = i2;
            i7 = i3;
            i6 = i2;
        }
        this.bsLive = i7 - i;
        return (i6 >> (i7 - i)) & ((1 << i) - 1);
    }

    private void complete() throws IOException {
        this.storedCombinedCRC = bsGetInt();
        this.currentState = 0;
        this.data = null;
        if (this.storedCombinedCRC != this.computedCombinedCRC) {
            reportCRCError();
        }
    }

    private void createHuffmanDecodingTables(int i, int i2) {
        Data data = this.data;
        char[][] cArr = data.temp_charArray2d;
        int[] iArr = data.minLens;
        int[][] iArr2 = data.limit;
        int[][] iArr3 = data.base;
        int[][] iArr4 = data.perm;
        for (int i3 = 0; i3 < i2; i3++) {
            char c = ' ';
            char c2 = 0;
            char[] cArr2 = cArr[i3];
            int i4 = i;
            while (true) {
                int i5 = i4 - 1;
                if (i5 >= 0) {
                    char c3 = cArr2[i5];
                    char c4 = c2;
                    if (c3 > c2) {
                        c4 = c3;
                    }
                    c2 = c4;
                    i4 = i5;
                    if (c3 < c) {
                        c = c3;
                        c2 = c4;
                        i4 = i5;
                    }
                }
            }
            hbCreateDecodeTables(iArr2[i3], iArr3[i3], iArr4[i3], cArr[i3], c, c2, i);
            iArr[i3] = c;
        }
    }

    private void endBlock() throws IOException {
        this.computedBlockCRC = this.crc.getFinalCRC();
        if (this.storedBlockCRC != this.computedBlockCRC) {
            this.computedCombinedCRC = (this.storedCombinedCRC << 1) | (this.storedCombinedCRC >>> 31);
            this.computedCombinedCRC ^= this.storedBlockCRC;
            reportCRCError();
        }
        this.computedCombinedCRC = (this.computedCombinedCRC << 1) | (this.computedCombinedCRC >>> 31);
        this.computedCombinedCRC ^= this.computedBlockCRC;
    }

    private void getAndMoveToFrontDecode() throws IOException {
        int i;
        int i2;
        int i3;
        int[] iArr;
        int i4;
        int i5;
        this.origPtr = bsR(24);
        recvDecodingTables();
        InputStream inputStream = this.in;
        Data data = this.data;
        byte[] bArr = data.ll8;
        int[] iArr2 = data.unzftab;
        byte[] bArr2 = data.selector;
        byte[] bArr3 = data.seqToUnseq;
        char[] cArr = data.getAndMoveToFrontDecode_yy;
        int[] iArr3 = data.minLens;
        int[][] iArr4 = data.limit;
        int[][] iArr5 = data.base;
        int[][] iArr6 = data.perm;
        int i6 = this.blockSize100k * 100000;
        int i7 = 256;
        while (true) {
            i7--;
            if (i7 < 0) {
                break;
            }
            cArr[i7] = (char) i7;
            iArr2[i7] = 0;
        }
        int i8 = 0;
        int i9 = 49;
        int i10 = this.nInUse;
        int andMoveToFrontDecode0 = getAndMoveToFrontDecode0(0);
        int i11 = this.bsBuff;
        int i12 = this.bsLive;
        int i13 = -1;
        int i14 = bArr2[0] & 255;
        int[] iArr7 = iArr5[i14];
        int[] iArr8 = iArr4[i14];
        int[] iArr9 = iArr6[i14];
        int i15 = iArr3[i14];
        while (andMoveToFrontDecode0 != i10 + 1) {
            if (andMoveToFrontDecode0 == 0 || andMoveToFrontDecode0 == 1) {
                int i16 = -1;
                int i17 = 1;
                int i18 = andMoveToFrontDecode0;
                int i19 = i9;
                int i20 = i8;
                int i21 = i12;
                int i22 = i11;
                int[] iArr10 = iArr7;
                while (true) {
                    if (i18 == 0) {
                        i = i16 + i17;
                    } else if (i18 == 1) {
                        i = i16 + (i17 << 1);
                    } else {
                        byte b = bArr3[cArr[0]];
                        int i23 = b & 255;
                        iArr2[i23] = iArr2[i23] + i16 + 1;
                        int i24 = i13;
                        for (int i25 = i16; i25 >= 0; i25--) {
                            i24++;
                            bArr[i24] = b;
                        }
                        iArr7 = iArr10;
                        i11 = i22;
                        i12 = i21;
                        i8 = i20;
                        i9 = i19;
                        i13 = i24;
                        andMoveToFrontDecode0 = i18;
                        if (i24 >= i6) {
                            throw new IOException("block overrun");
                        }
                    }
                    if (i19 == 0) {
                        i2 = 49;
                        i3 = i20 + 1;
                        int i26 = bArr2[i3] & 255;
                        iArr10 = iArr5[i26];
                        iArr8 = iArr4[i26];
                        iArr = iArr6[i26];
                        i15 = iArr3[i26];
                    } else {
                        i2 = i19 - 1;
                        i3 = i20;
                        iArr = iArr9;
                    }
                    int i27 = i15;
                    while (i21 < i27) {
                        int read = inputStream.read();
                        if (read < 0) {
                            throw new IOException("unexpected end of stream");
                        }
                        i22 = (i22 << 8) | read;
                        i21 += 8;
                    }
                    int i28 = (i22 >> (i21 - i27)) & ((1 << i27) - 1);
                    int i29 = i27;
                    int i30 = i21 - i27;
                    while (i28 > iArr8[i29]) {
                        i29++;
                        while (i30 < 1) {
                            int read2 = inputStream.read();
                            if (read2 < 0) {
                                throw new IOException("unexpected end of stream");
                            }
                            i22 = (i22 << 8) | read2;
                            i30 += 8;
                        }
                        i30--;
                        i28 = (i28 << 1) | ((i22 >> i30) & 1);
                    }
                    i18 = iArr[i28 - iArr10[i29]];
                    i17 <<= 1;
                    i21 = i30;
                    i20 = i3;
                    i19 = i2;
                    iArr9 = iArr;
                    i16 = i;
                }
            } else {
                int i31 = i13 + 1;
                if (i31 >= i6) {
                    throw new IOException("block overrun");
                }
                char c = cArr[andMoveToFrontDecode0 - 1];
                int i32 = bArr3[c] & 255;
                iArr2[i32] = iArr2[i32] + 1;
                bArr[i31] = bArr3[c];
                if (andMoveToFrontDecode0 <= 16) {
                    int i33 = andMoveToFrontDecode0 - 1;
                    while (true) {
                        int i34 = i33;
                        if (i34 <= 0) {
                            break;
                        }
                        cArr[i34] = cArr[i5];
                        i33 = i34 - 1;
                    }
                } else {
                    System.arraycopy(cArr, 0, cArr, 1, andMoveToFrontDecode0 - 1);
                }
                cArr[0] = c;
                if (i9 == 0) {
                    i4 = 49;
                    i8++;
                    int i35 = bArr2[i8] & 255;
                    iArr7 = iArr5[i35];
                    iArr8 = iArr4[i35];
                    iArr9 = iArr6[i35];
                    i15 = iArr3[i35];
                } else {
                    i4 = i9 - 1;
                }
                int i36 = i15;
                while (i12 < i36) {
                    int read3 = inputStream.read();
                    if (read3 < 0) {
                        throw new IOException("unexpected end of stream");
                    }
                    i11 = (i11 << 8) | read3;
                    i12 += 8;
                }
                int i37 = (i11 >> (i12 - i36)) & ((1 << i36) - 1);
                i12 -= i36;
                while (i37 > iArr8[i36]) {
                    i36++;
                    while (i12 < 1) {
                        int read4 = inputStream.read();
                        if (read4 < 0) {
                            throw new IOException("unexpected end of stream");
                        }
                        i11 = (i11 << 8) | read4;
                        i12 += 8;
                    }
                    i12--;
                    i37 = (i37 << 1) | ((i11 >> i12) & 1);
                }
                andMoveToFrontDecode0 = iArr9[i37 - iArr7[i36]];
                i9 = i4;
                i13 = i31;
            }
        }
        this.last = i13;
        this.bsLive = i12;
        this.bsBuff = i11;
    }

    private int getAndMoveToFrontDecode0(int i) throws IOException {
        InputStream inputStream = this.in;
        Data data = this.data;
        int i2 = data.selector[i] & 255;
        int[] iArr = data.limit[i2];
        int i3 = data.minLens[i2];
        int bsR = bsR(i3);
        int i4 = this.bsLive;
        int i5 = this.bsBuff;
        while (bsR > iArr[i3]) {
            int i6 = i3 + 1;
            int i7 = i4;
            int i8 = i5;
            while (i7 < 1) {
                int read = inputStream.read();
                if (read < 0) {
                    throw new IOException("unexpected end of stream");
                }
                i8 = (i8 << 8) | read;
                i7 += 8;
            }
            int i9 = i7 - 1;
            bsR = (bsR << 1) | ((i8 >> i9) & 1);
            i5 = i8;
            i4 = i9;
            i3 = i6;
        }
        this.bsLive = i4;
        this.bsBuff = i5;
        return data.perm[i2][bsR - data.base[i2][i3]];
    }

    private static void hbCreateDecodeTables(int[] iArr, int[] iArr2, int[] iArr3, char[] cArr, int i, int i2, int i3) {
        int i4 = 0;
        for (int i5 = i; i5 <= i2; i5++) {
            for (int i6 = 0; i6 < i3; i6++) {
                if (cArr[i6] == i5) {
                    iArr3[i4] = i6;
                    i4++;
                }
            }
        }
        int i7 = 23;
        while (true) {
            i7--;
            if (i7 <= 0) {
                break;
            }
            iArr2[i7] = 0;
            iArr[i7] = 0;
        }
        for (int i8 = 0; i8 < i3; i8++) {
            int i9 = cArr[i8] + 1;
            iArr2[i9] = iArr2[i9] + 1;
        }
        int i10 = iArr2[0];
        for (int i11 = 1; i11 < 23; i11++) {
            i10 += iArr2[i11];
            iArr2[i11] = i10;
        }
        int i12 = i;
        int i13 = 0;
        int i14 = iArr2[i12];
        while (i12 <= i2) {
            int i15 = iArr2[i12 + 1];
            int i16 = i13 + (i15 - i14);
            i14 = i15;
            iArr[i12] = i16 - 1;
            i13 = i16 << 1;
            i12++;
        }
        while (true) {
            i++;
            if (i <= i2) {
                iArr2[i] = ((iArr[i - 1] + 1) << 1) - iArr2[i];
            } else {
                return;
            }
        }
    }

    private void init() throws IOException {
        if (this.in == null) {
            throw new IOException("No InputStream");
        }
        if (this.in.available() == 0) {
            throw new IOException("Empty InputStream");
        }
        int read = this.in.read();
        if (read != 104) {
            throw new IOException(new StringBuffer().append("Stream is not BZip2 formatted: expected 'h' as first byte but got '").append((char) read).append("'").toString());
        }
        int read2 = this.in.read();
        if (read2 < 49 || read2 > 57) {
            throw new IOException(new StringBuffer().append("Stream is not BZip2 formatted: illegal blocksize ").append((char) read2).toString());
        }
        this.blockSize100k = read2 - 48;
        initBlock();
        setupBlock();
    }

    private void initBlock() throws IOException {
        boolean z = false;
        char bsGetUByte = bsGetUByte();
        char bsGetUByte2 = bsGetUByte();
        char bsGetUByte3 = bsGetUByte();
        char bsGetUByte4 = bsGetUByte();
        char bsGetUByte5 = bsGetUByte();
        char bsGetUByte6 = bsGetUByte();
        if (bsGetUByte == 23 && bsGetUByte2 == 'r' && bsGetUByte3 == 'E' && bsGetUByte4 == '8' && bsGetUByte5 == 'P' && bsGetUByte6 == 144) {
            complete();
        } else if (bsGetUByte != '1' || bsGetUByte2 != 'A' || bsGetUByte3 != 'Y' || bsGetUByte4 != '&' || bsGetUByte5 != 'S' || bsGetUByte6 != 'Y') {
            this.currentState = 0;
            throw new IOException("bad block header");
        } else {
            this.storedBlockCRC = bsGetInt();
            if (bsR(1) == 1) {
                z = true;
            }
            this.blockRandomised = z;
            if (this.data == null) {
                this.data = new Data(this.blockSize100k);
            }
            getAndMoveToFrontDecode();
            this.crc.initialiseCRC();
            this.currentState = 1;
        }
    }

    private void makeMaps() {
        boolean[] zArr = this.data.inUse;
        byte[] bArr = this.data.seqToUnseq;
        int i = 0;
        for (int i2 = 0; i2 < 256; i2++) {
            if (zArr[i2]) {
                bArr[i] = (byte) i2;
                i++;
            }
        }
        this.nInUse = i;
    }

    private int read0() throws IOException {
        int i = this.currentChar;
        switch (this.currentState) {
            case 0:
                i = -1;
                break;
            case 1:
                throw new IllegalStateException();
            case 2:
                throw new IllegalStateException();
            case 3:
                setupRandPartB();
                break;
            case 4:
                setupRandPartC();
                break;
            case 5:
                throw new IllegalStateException();
            case 6:
                setupNoRandPartB();
                break;
            case 7:
                setupNoRandPartC();
                break;
            default:
                throw new IllegalStateException();
        }
        return i;
    }

    private void recvDecodingTables() throws IOException {
        Data data = this.data;
        boolean[] zArr = data.inUse;
        byte[] bArr = data.recvDecodingTables_pos;
        byte[] bArr2 = data.selector;
        byte[] bArr3 = data.selectorMtf;
        int i = 0;
        int i2 = 0;
        while (i2 < 16) {
            int i3 = i;
            if (bsGetBit()) {
                i3 = i | (1 << i2);
            }
            i2++;
            i = i3;
        }
        int i4 = 256;
        while (true) {
            i4--;
            if (i4 < 0) {
                break;
            }
            zArr[i4] = false;
        }
        for (int i5 = 0; i5 < 16; i5++) {
            if (((1 << i5) & i) != 0) {
                for (int i6 = 0; i6 < 16; i6++) {
                    if (bsGetBit()) {
                        zArr[(i5 << 4) + i6] = true;
                    }
                }
            }
        }
        makeMaps();
        int i7 = this.nInUse + 2;
        int bsR = bsR(3);
        int bsR2 = bsR(15);
        for (int i8 = 0; i8 < bsR2; i8++) {
            int i9 = 0;
            while (bsGetBit()) {
                i9++;
            }
            bArr3[i8] = (byte) i9;
        }
        int i10 = bsR;
        while (true) {
            i10--;
            if (i10 < 0) {
                break;
            }
            bArr[i10] = (byte) i10;
        }
        for (int i11 = 0; i11 < bsR2; i11++) {
            int i12 = bArr3[i11] & 255;
            byte b = bArr[i12];
            while (i12 > 0) {
                bArr[i12] = bArr[i12 - 1];
                i12--;
            }
            bArr[0] = b;
            bArr2[i11] = b;
        }
        char[][] cArr = data.temp_charArray2d;
        for (int i13 = 0; i13 < bsR; i13++) {
            int bsR3 = bsR(5);
            char[] cArr2 = cArr[i13];
            for (int i14 = 0; i14 < i7; i14++) {
                while (bsGetBit()) {
                    bsR3 += bsGetBit() ? -1 : 1;
                }
                cArr2[i14] = (char) bsR3;
            }
        }
        createHuffmanDecodingTables(i7, bsR);
    }

    private static void reportCRCError() throws IOException {
        System.err.println("BZip2 CRC error");
    }

    private void setupBlock() throws IOException {
        if (this.data == null) {
            return;
        }
        int[] iArr = this.data.cftab;
        int[] initTT = this.data.initTT(this.last + 1);
        byte[] bArr = this.data.ll8;
        iArr[0] = 0;
        System.arraycopy(this.data.unzftab, 0, iArr, 1, 256);
        int i = iArr[0];
        for (int i2 = 1; i2 <= 256; i2++) {
            i += iArr[i2];
            iArr[i2] = i;
        }
        int i3 = this.last;
        for (int i4 = 0; i4 <= i3; i4++) {
            int i5 = bArr[i4] & 255;
            int i6 = iArr[i5];
            iArr[i5] = i6 + 1;
            initTT[i6] = i4;
        }
        if (this.origPtr < 0 || this.origPtr >= initTT.length) {
            throw new IOException("stream corrupted");
        }
        this.su_tPos = initTT[this.origPtr];
        this.su_count = 0;
        this.su_i2 = 0;
        this.su_ch2 = 256;
        if (!this.blockRandomised) {
            setupNoRandPartA();
            return;
        }
        this.su_rNToGo = 0;
        this.su_rTPos = 0;
        setupRandPartA();
    }

    private void setupNoRandPartA() throws IOException {
        if (this.su_i2 > this.last) {
            this.currentState = 5;
            endBlock();
            initBlock();
            setupBlock();
            return;
        }
        this.su_chPrev = this.su_ch2;
        int i = this.data.ll8[this.su_tPos] & 255;
        this.su_ch2 = i;
        this.su_tPos = this.data.tt[this.su_tPos];
        this.su_i2++;
        this.currentChar = i;
        this.currentState = 6;
        this.crc.updateCRC(i);
    }

    private void setupNoRandPartB() throws IOException {
        if (this.su_ch2 != this.su_chPrev) {
            this.su_count = 1;
            setupNoRandPartA();
            return;
        }
        int i = this.su_count + 1;
        this.su_count = i;
        if (i < 4) {
            setupNoRandPartA();
            return;
        }
        this.su_z = (char) (this.data.ll8[this.su_tPos] & 255);
        this.su_tPos = this.data.tt[this.su_tPos];
        this.su_j2 = 0;
        setupNoRandPartC();
    }

    private void setupNoRandPartC() throws IOException {
        if (this.su_j2 >= this.su_z) {
            this.su_i2++;
            this.su_count = 0;
            setupNoRandPartA();
            return;
        }
        int i = this.su_ch2;
        this.currentChar = i;
        this.crc.updateCRC(i);
        this.su_j2++;
        this.currentState = 7;
    }

    private void setupRandPartA() throws IOException {
        int i = 1;
        if (this.su_i2 > this.last) {
            endBlock();
            initBlock();
            setupBlock();
            return;
        }
        this.su_chPrev = this.su_ch2;
        byte b = this.data.ll8[this.su_tPos];
        this.su_tPos = this.data.tt[this.su_tPos];
        if (this.su_rNToGo == 0) {
            this.su_rNToGo = BZip2Constants.rNums[this.su_rTPos] - 1;
            int i2 = this.su_rTPos + 1;
            this.su_rTPos = i2;
            if (i2 == 512) {
                this.su_rTPos = 0;
            }
        } else {
            this.su_rNToGo--;
        }
        if (this.su_rNToGo != 1) {
            i = 0;
        }
        int i3 = (b & 255) ^ i;
        this.su_ch2 = i3;
        this.su_i2++;
        this.currentChar = i3;
        this.currentState = 3;
        this.crc.updateCRC(i3);
    }

    private void setupRandPartB() throws IOException {
        if (this.su_ch2 != this.su_chPrev) {
            this.currentState = 2;
            this.su_count = 1;
            setupRandPartA();
            return;
        }
        int i = this.su_count + 1;
        this.su_count = i;
        if (i < 4) {
            this.currentState = 2;
            setupRandPartA();
            return;
        }
        this.su_z = (char) (this.data.ll8[this.su_tPos] & 255);
        this.su_tPos = this.data.tt[this.su_tPos];
        if (this.su_rNToGo == 0) {
            this.su_rNToGo = BZip2Constants.rNums[this.su_rTPos] - 1;
            int i2 = this.su_rTPos + 1;
            this.su_rTPos = i2;
            if (i2 == 512) {
                this.su_rTPos = 0;
            }
        } else {
            this.su_rNToGo--;
        }
        this.su_j2 = 0;
        this.currentState = 4;
        if (this.su_rNToGo == 1) {
            this.su_z = (char) (this.su_z ^ 1);
        }
        setupRandPartC();
    }

    private void setupRandPartC() throws IOException {
        if (this.su_j2 < this.su_z) {
            this.currentChar = this.su_ch2;
            this.crc.updateCRC(this.su_ch2);
            this.su_j2++;
            return;
        }
        this.currentState = 2;
        this.su_i2++;
        this.su_count = 0;
        setupRandPartA();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        InputStream inputStream = this.in;
        if (inputStream != null) {
            try {
                if (inputStream != System.in) {
                    inputStream.close();
                }
            } finally {
                this.data = null;
                this.in = null;
            }
        }
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        if (this.in != null) {
            return read0();
        }
        throw new IOException("stream closed");
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int read0;
        if (i < 0) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("offs(").append(i).append(") < 0.").toString());
        }
        if (i2 < 0) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("len(").append(i2).append(") < 0.").toString());
        }
        if (i + i2 > bArr.length) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("offs(").append(i).append(") + len(").append(i2).append(") > dest.length(").append(bArr.length).append(").").toString());
        }
        if (this.in == null) {
            throw new IOException("stream closed");
        }
        int i3 = i;
        while (i3 < i + i2 && (read0 = read0()) >= 0) {
            bArr[i3] = (byte) read0;
            i3++;
        }
        return i3 == i ? -1 : i3 - i;
    }
}
