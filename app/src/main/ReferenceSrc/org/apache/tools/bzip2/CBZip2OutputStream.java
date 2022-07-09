package org.apache.tools.bzip2;

import android.support.v4.view.InputDeviceCompat;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes.jar:org/apache/tools/bzip2/CBZip2OutputStream.class */
public class CBZip2OutputStream extends OutputStream implements BZip2Constants {
    protected static final int CLEARMASK = -2097153;
    protected static final int DEPTH_THRESH = 10;
    protected static final int GREATER_ICOST = 15;
    private static final int[] INCS = {1, 4, 13, 40, 121, 364, 1093, 3280, 9841, 29524, 88573, 265720, 797161, 2391484};
    protected static final int LESSER_ICOST = 0;
    public static final int MAX_BLOCKSIZE = 9;
    public static final int MIN_BLOCKSIZE = 1;
    protected static final int QSORT_STACK_SIZE = 1000;
    protected static final int SETMASK = 2097152;
    protected static final int SMALL_THRESH = 20;
    protected static final int WORK_FACTOR = 30;
    private int allowableBlockSize;
    private int blockCRC;
    private boolean blockRandomised;
    private final int blockSize100k;
    private int bsBuff;
    private int bsLive;
    private int combinedCRC;
    private final CRC crc;
    private int currentChar;
    private Data data;
    private boolean firstAttempt;
    private int last;
    private int nInUse;
    private int nMTF;
    private int origPtr;
    private OutputStream out;
    private int runLength;
    private int workDone;
    private int workLimit;

    /* loaded from: classes.jar:org/apache/tools/bzip2/CBZip2OutputStream$Data.class */
    private static final class Data {
        final byte[] block;
        final int[] fmap;
        final char[] quadrant;
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
        final int[] stack_ll = new int[1000];
        final int[] stack_hh = new int[1000];
        final int[] stack_dd = new int[1000];
        final int[] mainSort_runningOrder = new int[256];
        final int[] mainSort_copy = new int[256];
        final boolean[] mainSort_bigDone = new boolean[256];
        final int[] heap = new int[260];
        final int[] weight = new int[516];
        final int[] parent = new int[516];
        final int[] ftab = new int[65537];

        Data(int i) {
            int i2 = i * 100000;
            this.block = new byte[i2 + 1 + 20];
            this.fmap = new int[i2];
            this.sfmap = new char[i2 * 2];
            this.quadrant = this.sfmap;
        }
    }

    public CBZip2OutputStream(OutputStream outputStream) throws IOException {
        this(outputStream, 9);
    }

    public CBZip2OutputStream(OutputStream outputStream, int i) throws IOException {
        this.crc = new CRC();
        this.currentChar = -1;
        this.runLength = 0;
        if (i < 1) {
            throw new IllegalArgumentException(new StringBuffer().append("blockSize(").append(i).append(") < 1").toString());
        }
        if (i > 9) {
            throw new IllegalArgumentException(new StringBuffer().append("blockSize(").append(i).append(") > 9").toString());
        }
        this.blockSize100k = i;
        this.out = outputStream;
        init();
    }

    private void blockSort() {
        this.workLimit = this.last * 30;
        this.workDone = 0;
        this.blockRandomised = false;
        this.firstAttempt = true;
        mainSort();
        if (this.firstAttempt && this.workDone > this.workLimit) {
            randomiseBlock();
            this.workDone = 0;
            this.workLimit = 0;
            this.firstAttempt = false;
            mainSort();
        }
        int[] iArr = this.data.fmap;
        this.origPtr = -1;
        int i = this.last;
        for (int i2 = 0; i2 <= i; i2++) {
            if (iArr[i2] == 0) {
                this.origPtr = i2;
                return;
            }
        }
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
        if (this.blockRandomised) {
            bsW(1, 1);
        } else {
            bsW(1, 0);
        }
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
        byte b;
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
            byte b2 = bArr2[bArr[iArr[i9]] & 255];
            byte b3 = bArr3[0];
            int i10 = 0;
            while (true) {
                b = b3;
                if (b2 == b) {
                    break;
                }
                i10++;
                b3 = bArr3[i10];
                bArr3[i10] = b;
            }
            bArr3[0] = b;
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
        int i4 = 0;
        for (int i5 = i; i5 <= i2; i5++) {
            int i6 = i4;
            int i7 = 0;
            while (i7 < i3) {
                int i8 = i6;
                if ((bArr[i7] & 255) == i5) {
                    iArr[i7] = i6;
                    i8 = i6 + 1;
                }
                i7++;
                i6 = i8;
            }
            i4 = i6 << 1;
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

    protected static void hbMakeCodeLengths(char[] cArr, int[] iArr, int i, int i2) {
        int i3;
        int i4;
        int[] iArr2 = new int[516];
        int[] iArr3 = new int[516];
        int[] iArr4 = new int[516];
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
                cArr[i30 - 1] = (char) i31;
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
        this.data = new Data(this.blockSize100k);
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
            if (i < 0) {
                this.allowableBlockSize = (this.blockSize100k * 100000) - 20;
                return;
            }
            zArr[i] = false;
        }
    }

    private void mainQSort3(Data data, int i, int i2, int i3) {
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        int i10;
        int[] iArr = data.stack_ll;
        int[] iArr2 = data.stack_hh;
        int[] iArr3 = data.stack_dd;
        int[] iArr4 = data.fmap;
        byte[] bArr = data.block;
        iArr[0] = i;
        iArr2[0] = i2;
        iArr3[0] = i3;
        int i11 = 1;
        while (true) {
            int i12 = i11 - 1;
            if (i12 >= 0) {
                int i13 = iArr[i12];
                int i14 = iArr2[i12];
                int i15 = iArr3[i12];
                if (i14 - i13 < 20 || i15 > 10) {
                    i11 = i12;
                    if (mainSimpleSort(data, i13, i14, i15)) {
                        return;
                    }
                } else {
                    int i16 = i15 + 1;
                    int med3 = med3(bArr[iArr4[i13] + i16], bArr[iArr4[i14] + i16], bArr[iArr4[(i13 + i14) >>> 1] + i16]) & 255;
                    int i17 = i14;
                    int i18 = i14;
                    int i19 = i13;
                    int i20 = i13;
                    while (true) {
                        if (i20 <= i17) {
                            int i21 = (bArr[iArr4[i20] + i16] & 255) - med3;
                            if (i21 == 0) {
                                int i22 = iArr4[i20];
                                i9 = i20 + 1;
                                iArr4[i20] = iArr4[i19];
                                i10 = i19 + 1;
                                iArr4[i19] = i22;
                            } else if (i21 < 0) {
                                i9 = i20 + 1;
                                i10 = i19;
                            }
                            i19 = i10;
                            i20 = i9;
                        }
                        while (true) {
                            i4 = i18;
                            i5 = i17;
                            if (i20 > i5) {
                                break;
                            }
                            int i23 = (bArr[iArr4[i5] + i16] & 255) - med3;
                            if (i23 != 0) {
                                if (i23 <= 0) {
                                    break;
                                }
                                i8 = i5 - 1;
                                i18 = i4;
                            } else {
                                int i24 = iArr4[i5];
                                i8 = i5 - 1;
                                iArr4[i5] = iArr4[i4];
                                i18 = i4 - 1;
                                iArr4[i4] = i24;
                            }
                            i17 = i8;
                        }
                        if (i20 > i5) {
                            break;
                        }
                        int i25 = iArr4[i20];
                        iArr4[i20] = iArr4[i5];
                        iArr4[i5] = i25;
                        i20++;
                        i18 = i4;
                        i17 = i5 - 1;
                    }
                    if (i4 < i19) {
                        iArr[i12] = i13;
                        iArr2[i12] = i14;
                        iArr3[i12] = i16;
                        i11 = i12 + 1;
                    } else {
                        int i26 = i19 - i13 < i20 - i19 ? i19 - i13 : i20 - i19;
                        vswap(iArr4, i13, i20 - i26, i26);
                        if (i14 - i4 < i4 - i5) {
                            i6 = i14;
                            i7 = i4;
                        } else {
                            i6 = i4;
                            i7 = i5;
                        }
                        int i27 = i6 - i7;
                        vswap(iArr4, i20, (i14 - i27) + 1, i27);
                        int i28 = ((i13 + i20) - i19) - 1;
                        int i29 = (i14 - (i4 - i5)) + 1;
                        iArr[i12] = i13;
                        iArr2[i12] = i28;
                        iArr3[i12] = i15;
                        int i30 = i12 + 1;
                        iArr[i30] = i28 + 1;
                        iArr2[i30] = i29 - 1;
                        iArr3[i30] = i16;
                        int i31 = i30 + 1;
                        iArr[i31] = i29;
                        iArr2[i31] = i14;
                        iArr3[i31] = i15;
                        i11 = i31 + 1;
                    }
                }
            } else {
                return;
            }
        }
    }

    private boolean mainSimpleSort(Data data, int i, int i2, int i3) {
        int i4;
        boolean z;
        int i5;
        int i6;
        int i7;
        int i8 = (i2 - i) + 1;
        if (i8 < 2) {
            z = this.firstAttempt && this.workDone > this.workLimit;
        } else {
            int i9 = 0;
            while (INCS[i9] < i8) {
                i9++;
            }
            int[] iArr = data.fmap;
            char[] cArr = data.quadrant;
            byte[] bArr = data.block;
            int i10 = this.last;
            int i11 = i10 + 1;
            boolean z2 = this.firstAttempt;
            int i12 = this.workLimit;
            int i13 = this.workDone;
            loop1: while (true) {
                int i14 = i9 - 1;
                i4 = i13;
                if (i14 < 0) {
                    break;
                }
                int i15 = INCS[i14];
                int i16 = i + i15;
                int i17 = i13;
                while (true) {
                    i9 = i14;
                    i13 = i17;
                    if (i16 <= i2) {
                        int i18 = i17;
                        int i19 = 3;
                        int i20 = i16;
                        while (i20 <= i2 && (i5 = i19 - 1) >= 0) {
                            int i21 = iArr[i20];
                            int i22 = i21 + i3;
                            boolean z3 = false;
                            int i23 = i18;
                            int i24 = i20;
                            int i25 = 0;
                            while (true) {
                                int i26 = i25;
                                if (z3) {
                                    iArr[i24] = i26;
                                    i6 = i24 - i15;
                                    i24 = i6;
                                    if (i6 <= (i + i15) - 1) {
                                        i7 = i23;
                                        break;
                                    }
                                } else {
                                    z3 = true;
                                }
                                int i27 = iArr[i24 - i15];
                                int i28 = i27 + i3;
                                if (bArr[i28 + 1] != bArr[i22 + 1]) {
                                    i6 = i24;
                                    i7 = i23;
                                    if ((bArr[i28 + 1] & 255) > (bArr[i22 + 1] & 255)) {
                                        i25 = i27;
                                    }
                                } else if (bArr[i28 + 2] != bArr[i22 + 2]) {
                                    i6 = i24;
                                    i7 = i23;
                                    if ((bArr[i28 + 2] & 255) > (bArr[i22 + 2] & 255)) {
                                        i25 = i27;
                                    }
                                } else if (bArr[i28 + 3] != bArr[i22 + 3]) {
                                    i6 = i24;
                                    i7 = i23;
                                    if ((bArr[i28 + 3] & 255) > (bArr[i22 + 3] & 255)) {
                                        i25 = i27;
                                    }
                                } else if (bArr[i28 + 4] != bArr[i22 + 4]) {
                                    i6 = i24;
                                    i7 = i23;
                                    if ((bArr[i28 + 4] & 255) > (bArr[i22 + 4] & 255)) {
                                        i25 = i27;
                                    }
                                } else if (bArr[i28 + 5] == bArr[i22 + 5]) {
                                    int i29 = i28 + 6;
                                    int i30 = i22 + 6;
                                    if (bArr[i29] == bArr[i30]) {
                                        int i31 = i10;
                                        while (true) {
                                            i6 = i24;
                                            i7 = i23;
                                            if (i31 > 0) {
                                                i31 -= 4;
                                                if (bArr[i29 + 1] != bArr[i30 + 1]) {
                                                    i6 = i24;
                                                    i7 = i23;
                                                    if ((bArr[i29 + 1] & 255) > (bArr[i30 + 1] & 255)) {
                                                        i25 = i27;
                                                    }
                                                } else if (cArr[i29] != cArr[i30]) {
                                                    i6 = i24;
                                                    i7 = i23;
                                                    if (cArr[i29] > cArr[i30]) {
                                                        i25 = i27;
                                                    }
                                                } else if (bArr[i29 + 2] != bArr[i30 + 2]) {
                                                    i6 = i24;
                                                    i7 = i23;
                                                    if ((bArr[i29 + 2] & 255) > (bArr[i30 + 2] & 255)) {
                                                        i25 = i27;
                                                    }
                                                } else if (cArr[i29 + 1] != cArr[i30 + 1]) {
                                                    i6 = i24;
                                                    i7 = i23;
                                                    if (cArr[i29 + 1] > cArr[i30 + 1]) {
                                                        i25 = i27;
                                                    }
                                                } else if (bArr[i29 + 3] != bArr[i30 + 3]) {
                                                    i6 = i24;
                                                    i7 = i23;
                                                    if ((bArr[i29 + 3] & 255) > (bArr[i30 + 3] & 255)) {
                                                        i25 = i27;
                                                    }
                                                } else if (cArr[i29 + 2] != cArr[i30 + 2]) {
                                                    i6 = i24;
                                                    i7 = i23;
                                                    if (cArr[i29 + 2] > cArr[i30 + 2]) {
                                                        i25 = i27;
                                                    }
                                                } else if (bArr[i29 + 4] != bArr[i30 + 4]) {
                                                    i6 = i24;
                                                    i7 = i23;
                                                    if ((bArr[i29 + 4] & 255) > (bArr[i30 + 4] & 255)) {
                                                        i25 = i27;
                                                    }
                                                } else if (cArr[i29 + 3] == cArr[i30 + 3]) {
                                                    int i32 = i29 + 4;
                                                    int i33 = i32;
                                                    if (i32 >= i11) {
                                                        i33 = i32 - i11;
                                                    }
                                                    int i34 = i30 + 4;
                                                    i30 = i34;
                                                    if (i34 >= i11) {
                                                        i30 = i34 - i11;
                                                    }
                                                    i23++;
                                                    i29 = i33;
                                                } else {
                                                    i6 = i24;
                                                    i7 = i23;
                                                    if (cArr[i29 + 3] > cArr[i30 + 3]) {
                                                        i25 = i27;
                                                    }
                                                }
                                            }
                                        }
                                    } else {
                                        i6 = i24;
                                        i7 = i23;
                                        if ((bArr[i29] & 255) > (bArr[i30] & 255)) {
                                            i25 = i27;
                                        }
                                    }
                                } else {
                                    i6 = i24;
                                    i7 = i23;
                                    if ((bArr[i28 + 5] & 255) > (bArr[i22 + 5] & 255)) {
                                        i25 = i27;
                                    }
                                }
                            }
                            iArr[i6] = i21;
                            i20++;
                            i19 = i5;
                            i18 = i7;
                        }
                        i16 = i20;
                        i17 = i18;
                        if (z2) {
                            i16 = i20;
                            i17 = i18;
                            if (i20 <= i2) {
                                i16 = i20;
                                i17 = i18;
                                if (i18 > i12) {
                                    i4 = i18;
                                    break loop1;
                                }
                            } else {
                                continue;
                            }
                        }
                    }
                }
            }
            this.workDone = i4;
            z = z2 && i4 > i12;
        }
        return z;
    }

    private void mainSort() {
        int i;
        Data data = this.data;
        int[] iArr = data.mainSort_runningOrder;
        int[] iArr2 = data.mainSort_copy;
        boolean[] zArr = data.mainSort_bigDone;
        int[] iArr3 = data.ftab;
        byte[] bArr = data.block;
        int[] iArr4 = data.fmap;
        char[] cArr = data.quadrant;
        int i2 = this.last;
        int i3 = this.workLimit;
        boolean z = this.firstAttempt;
        int i4 = 65537;
        while (true) {
            i4--;
            if (i4 < 0) {
                break;
            }
            iArr3[i4] = 0;
        }
        for (int i5 = 0; i5 < 20; i5++) {
            bArr[i2 + i5 + 2] = bArr[(i5 % (i2 + 1)) + 1];
        }
        int i6 = i2 + 20 + 1;
        while (true) {
            i6--;
            if (i6 < 0) {
                break;
            }
            cArr[i6] = (char) 0;
        }
        bArr[0] = bArr[i2 + 1];
        int i7 = bArr[0] & 255;
        for (int i8 = 0; i8 <= i2; i8++) {
            int i9 = bArr[i8 + 1] & 255;
            int i10 = (i7 << 8) + i9;
            iArr3[i10] = iArr3[i10] + 1;
            i7 = i9;
        }
        for (int i11 = 1; i11 <= 65536; i11++) {
            iArr3[i11] = iArr3[i11] + iArr3[i11 - 1];
        }
        int i12 = bArr[1] & 255;
        for (int i13 = 0; i13 < i2; i13++) {
            int i14 = bArr[i13 + 2] & 255;
            int i15 = (i12 << 8) + i14;
            int i16 = iArr3[i15] - 1;
            iArr3[i15] = i16;
            iArr4[i16] = i13;
            i12 = i14;
        }
        int i17 = ((bArr[i2 + 1] & 255) << 8) + (bArr[1] & 255);
        int i18 = iArr3[i17] - 1;
        iArr3[i17] = i18;
        iArr4[i18] = i2;
        int i19 = 256;
        while (true) {
            i19--;
            if (i19 < 0) {
                break;
            }
            zArr[i19] = false;
            iArr[i19] = i19;
        }
        int i20 = 364;
        while (i20 != 1) {
            int i21 = i20 / 3;
            int i22 = i21;
            while (true) {
                i20 = i21;
                if (i22 <= 255) {
                    int i23 = iArr[i22];
                    int i24 = iArr3[(i23 + 1) << 8];
                    int i25 = iArr3[i23 << 8];
                    int i26 = i22;
                    int i27 = iArr[i26 - i21];
                    while (true) {
                        int i28 = i27;
                        i = i26;
                        if (iArr3[(i28 + 1) << 8] - iArr3[i28 << 8] > i24 - i25) {
                            iArr[i26] = i28;
                            i26 -= i21;
                            if (i26 <= i21 - 1) {
                                i = i26;
                                break;
                            }
                            i27 = iArr[i26 - i21];
                        }
                    }
                    iArr[i] = i23;
                    i22++;
                }
            }
        }
        for (int i29 = 0; i29 <= 255; i29++) {
            int i30 = iArr[i29];
            for (int i31 = 0; i31 <= 255; i31++) {
                int i32 = (i30 << 8) + i31;
                int i33 = iArr3[i32];
                if ((2097152 & i33) != 2097152) {
                    int i34 = i33 & CLEARMASK;
                    int i35 = (iArr3[i32 + 1] & CLEARMASK) - 1;
                    if (i35 > i34) {
                        mainQSort3(data, i34, i35, 2);
                        if (z && this.workDone > i3) {
                            return;
                        }
                    }
                    iArr3[i32] = 2097152 | i33;
                }
            }
            for (int i36 = 0; i36 <= 255; i36++) {
                iArr2[i36] = iArr3[(i36 << 8) + i30] & CLEARMASK;
            }
            int i37 = iArr3[(i30 + 1) << 8];
            for (int i38 = iArr3[i30 << 8] & CLEARMASK; i38 < (i37 & CLEARMASK); i38++) {
                int i39 = iArr4[i38];
                int i40 = bArr[i39] & 255;
                if (!zArr[i40]) {
                    iArr4[iArr2[i40]] = i39 == 0 ? i2 : i39 - 1;
                    iArr2[i40] = iArr2[i40] + 1;
                }
            }
            int i41 = 256;
            while (true) {
                i41--;
                if (i41 < 0) {
                    break;
                }
                int i42 = (i41 << 8) + i30;
                iArr3[i42] = iArr3[i42] | 2097152;
            }
            zArr[i30] = true;
            if (i29 < 255) {
                int i43 = iArr3[i30 << 8] & CLEARMASK;
                int i44 = (iArr3[(i30 + 1) << 8] & CLEARMASK) - i43;
                int i45 = 0;
                while ((i44 >> i45) > 65534) {
                    i45++;
                }
                for (int i46 = 0; i46 < i44; i46++) {
                    int i47 = iArr4[i43 + i46];
                    char c = (char) (i46 >> i45);
                    cArr[i47] = c;
                    if (i47 < 20) {
                        cArr[i47 + i2 + 1] = c;
                    }
                }
            }
        }
    }

    private static byte med3(byte b, byte b2, byte b3) {
        byte b4;
        if (b < b2) {
            b4 = b2 < b3 ? b2 : b < b3 ? b3 : b;
        } else {
            b4 = b2;
            if (b2 <= b3) {
                b4 = b > b3 ? b3 : b;
            }
        }
        return b4;
    }

    private void moveToFrontCodeAndSend() throws IOException {
        bsW(24, this.origPtr);
        generateMTFValues();
        sendMTFValues();
    }

    private void randomiseBlock() {
        boolean[] zArr = this.data.inUse;
        byte[] bArr = this.data.block;
        int i = this.last;
        int i2 = 256;
        while (true) {
            i2--;
            if (i2 < 0) {
                break;
            }
            zArr[i2] = false;
        }
        char c = 0;
        int i3 = 0;
        int i4 = 0;
        int i5 = 1;
        while (i4 <= i) {
            char c2 = c;
            int i6 = i3;
            if (c == 0) {
                char c3 = (char) BZip2Constants.rNums[i3];
                int i7 = i3 + 1;
                c2 = c3;
                i6 = i7;
                if (i7 == 512) {
                    i6 = 0;
                    c2 = c3;
                }
            }
            int i8 = c2 - 1;
            bArr[i5] = (byte) ((i8 == 1 ? (byte) 1 : (byte) 0) ^ bArr[i5]);
            zArr[bArr[i5] & 255] = true;
            i4 = i5;
            i5++;
            c = i8;
            i3 = i6;
        }
        this.blockRandomised = true;
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
        sendMTFValues7(sendMTFValues1);
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
            byte b = data.selector[i3];
            byte b2 = bArr[0];
            int i4 = 0;
            while (b != b2) {
                i4++;
                byte b3 = bArr[i4];
                bArr[i4] = b2;
                b2 = b3;
            }
            bArr[0] = b2;
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
                i11++;
                i8 = i5;
                i7 = i6 + 1;
            }
        }
        this.bsBuff = i8;
        this.bsLive = i7;
    }

    private void sendMTFValues7(int i) throws IOException {
        Data data = this.data;
        byte[][] bArr = data.sendMTFValues_len;
        int[][] iArr = data.sendMTFValues_code;
        OutputStream outputStream = this.out;
        byte[] bArr2 = data.selector;
        char[] cArr = data.sfmap;
        int i2 = this.nMTF;
        int i3 = 0;
        int i4 = this.bsLive;
        int i5 = this.bsBuff;
        int i6 = 0;
        while (true) {
            int i7 = i6;
            if (i7 >= i2) {
                this.bsBuff = i5;
                this.bsLive = i4;
                return;
            }
            int min = Math.min((i7 + 50) - 1, i2 - 1);
            int i8 = bArr2[i3] & 255;
            int[] iArr2 = iArr[i8];
            byte[] bArr3 = bArr[i8];
            int i9 = i5;
            for (int i10 = i7; i10 <= min; i10++) {
                char c = cArr[i10];
                while (i4 >= 8) {
                    outputStream.write(i9 >> 24);
                    i9 <<= 8;
                    i4 -= 8;
                }
                int i11 = bArr3[c] & 255;
                i9 |= iArr2[c] << ((32 - i4) - i11);
                i4 += i11;
            }
            i3++;
            i5 = i9;
            i6 = min + 1;
        }
    }

    private static void vswap(int[] iArr, int i, int i2, int i3) {
        int i4 = i2;
        for (int i5 = i; i5 < i3 + i; i5++) {
            int i6 = iArr[i5];
            iArr[i5] = iArr[i4];
            iArr[i4] = i6;
            i4++;
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
            throw new IndexOutOfBoundsException(new StringBuffer().append("offs(").append(i).append(") < 0.").toString());
        }
        if (i2 < 0) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("len(").append(i2).append(") < 0.").toString());
        }
        if (i + i2 > bArr.length) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("offs(").append(i).append(") + len(").append(i2).append(") > buf.length(").append(bArr.length).append(").").toString());
        }
        if (this.out == null) {
            throw new IOException("stream closed");
        }
        for (int i3 = i; i3 < i + i2; i3++) {
            write0(bArr[i3]);
        }
    }
}
