package com.jcraft.jzlib;

import org.apache.commons.compress.archivers.cpio.CpioConstants;

/* loaded from: classes.jar:com/jcraft/jzlib/Tree.class */
final class Tree {
    private static final int BL_CODES = 19;
    static final int Buf_size = 16;
    static final int DIST_CODE_LEN = 512;
    private static final int D_CODES = 30;
    static final int END_BLOCK = 256;
    private static final int HEAP_SIZE = 573;
    private static final int LENGTH_CODES = 29;
    private static final int LITERALS = 256;
    private static final int L_CODES = 286;
    private static final int MAX_BITS = 15;
    static final int MAX_BL_BITS = 7;
    static final int REPZ_11_138 = 18;
    static final int REPZ_3_10 = 17;
    static final int REP_3_6 = 16;
    short[] dyn_tree;
    int max_code;
    StaticTree stat_desc;
    static final int[] extra_lbits = {0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 0};
    static final int[] extra_dbits = {0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13};
    static final int[] extra_blbits = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 7};
    static final byte[] bl_order = {16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15};
    static final byte[] _dist_code = {0, 1, 2, 3, 4, 4, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 16, 17, 18, 18, 19, 19, 20, 20, 20, 20, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22, 22, 22, 23, 23, 23, 23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29};
    static final byte[] _length_code = {0, 1, 2, 3, 4, 5, 6, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 12, 12, 13, 13, 13, 13, 14, 14, 14, 14, 15, 15, 15, 15, 16, 16, 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 19, 19, 19, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 28};
    static final int[] base_length = {0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 16, 20, 24, 28, 32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 0};
    static final int[] base_dist = {0, 1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 48, 64, 96, 128, 192, 256, 384, 512, 768, 1024, 1536, 2048, 3072, 4096, 6144, 8192, 12288, 16384, CpioConstants.C_ISBLK};

    Tree() {
    }

    static int bi_reverse(int i, int i2) {
        int i3;
        int i4;
        int i5 = 0;
        do {
            int i6 = i;
            i = i6 >>> 1;
            i3 = (i5 | (i6 & 1)) << 1;
            i4 = i2 - 1;
            i5 = i3;
            i2 = i4;
        } while (i4 > 0);
        return i3 >>> 1;
    }

    static int d_code(int i) {
        return i < 256 ? _dist_code[i] : _dist_code[(i >>> 7) + 256];
    }

    static void gen_codes(short[] sArr, int i, short[] sArr2) {
        short[] sArr3 = new short[16];
        short s = 0;
        for (int i2 = 1; i2 <= 15; i2++) {
            s = (short) ((sArr2[i2 - 1] + s) << 1);
            sArr3[i2] = s;
        }
        for (int i3 = 0; i3 <= i; i3++) {
            short s2 = sArr[(i3 * 2) + 1];
            if (s2 != 0) {
                short s3 = sArr3[s2];
                sArr3[s2] = (short) (s3 + 1);
                sArr[i3 * 2] = (short) bi_reverse(s3, s2);
            }
        }
    }

    void build_tree(Deflate deflate) {
        int i;
        int i2;
        int i3;
        short[] sArr = this.dyn_tree;
        short[] sArr2 = this.stat_desc.static_tree;
        int i4 = this.stat_desc.elems;
        int i5 = -1;
        deflate.heap_len = 0;
        deflate.heap_max = HEAP_SIZE;
        int i6 = 0;
        while (true) {
            i = i5;
            if (i6 < i4) {
                if (sArr[i6 * 2] != 0) {
                    int[] iArr = deflate.heap;
                    int i7 = deflate.heap_len + 1;
                    deflate.heap_len = i7;
                    i5 = i6;
                    iArr[i7] = i6;
                    deflate.depth[i6] = (byte) 0;
                } else {
                    sArr[(i6 * 2) + 1] = (short) 0;
                }
                i6++;
            }
        }
        while (deflate.heap_len < 2) {
            int[] iArr2 = deflate.heap;
            int i8 = deflate.heap_len + 1;
            deflate.heap_len = i8;
            if (i < 2) {
                i3 = i + 1;
                i2 = i3;
            } else {
                i2 = 0;
                i3 = i;
            }
            iArr2[i8] = i2;
            sArr[i2 * 2] = (short) 1;
            deflate.depth[i2] = (byte) 0;
            deflate.opt_len--;
            i = i3;
            if (sArr2 != null) {
                deflate.static_len -= sArr2[(i2 * 2) + 1];
                i = i3;
            }
        }
        this.max_code = i;
        for (int i9 = deflate.heap_len / 2; i9 >= 1; i9--) {
            deflate.pqdownheap(sArr, i9);
        }
        int i10 = i4;
        while (true) {
            int i11 = deflate.heap[1];
            int[] iArr3 = deflate.heap;
            int[] iArr4 = deflate.heap;
            int i12 = deflate.heap_len;
            deflate.heap_len = i12 - 1;
            iArr3[1] = iArr4[i12];
            deflate.pqdownheap(sArr, 1);
            int i13 = deflate.heap[1];
            int[] iArr5 = deflate.heap;
            int i14 = deflate.heap_max - 1;
            deflate.heap_max = i14;
            iArr5[i14] = i11;
            int[] iArr6 = deflate.heap;
            int i15 = deflate.heap_max - 1;
            deflate.heap_max = i15;
            iArr6[i15] = i13;
            sArr[i10 * 2] = (short) (sArr[i11 * 2] + sArr[i13 * 2]);
            deflate.depth[i10] = (byte) (Math.max((int) deflate.depth[i11], (int) deflate.depth[i13]) + 1);
            short s = (short) i10;
            sArr[(i13 * 2) + 1] = s;
            sArr[(i11 * 2) + 1] = s;
            deflate.heap[1] = i10;
            deflate.pqdownheap(sArr, 1);
            if (deflate.heap_len < 2) {
                int[] iArr7 = deflate.heap;
                int i16 = deflate.heap_max - 1;
                deflate.heap_max = i16;
                iArr7[i16] = deflate.heap[1];
                gen_bitlen(deflate);
                gen_codes(sArr, i, deflate.bl_count);
                return;
            }
            i10++;
        }
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:53:0x019b */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:54:0x019b */
    /* JADX DEBUG: Multi-variable search result rejected for r0v84, resolved type: byte */
    /* JADX WARN: Multi-variable type inference failed */
    void gen_bitlen(Deflate deflate) {
        short[] sArr;
        short[] sArr2;
        int i;
        short[] sArr3;
        int i2;
        short[] sArr4;
        short[] sArr5 = this.dyn_tree;
        short[] sArr6 = this.stat_desc.static_tree;
        int[] iArr = this.stat_desc.extra_bits;
        int i3 = this.stat_desc.extra_base;
        int i4 = this.stat_desc.max_length;
        int i5 = 0;
        for (int i6 = 0; i6 <= 15; i6++) {
            deflate.bl_count[i6] = (short) 0;
        }
        sArr5[(deflate.heap[deflate.heap_max] * 2) + 1] = (short) 0;
        int i7 = deflate.heap_max + 1;
        while (i7 < HEAP_SIZE) {
            int i8 = deflate.heap[i7];
            int i9 = sArr5[(sArr5[(i8 * 2) + 1] * 2) + 1] + 1;
            int i10 = i9;
            int i11 = i5;
            if (i9 > i4) {
                i10 = i4;
                i11 = i5 + 1;
            }
            sArr5[(i8 * 2) + 1] = (short) i10;
            if (i8 <= this.max_code) {
                deflate.bl_count[i10] = (short) (sArr4[i10] + 1);
                int i12 = 0;
                if (i8 >= i3) {
                    i12 = iArr[i8 - i3];
                }
                short s = sArr5[i8 * 2];
                deflate.opt_len += (i10 + i12) * s;
                if (sArr6 != null) {
                    deflate.static_len += (sArr6[(i8 * 2) + 1] + i12) * s;
                }
            }
            i7++;
            i5 = i11;
        }
        int i13 = i5;
        if (i5 == 0) {
            return;
        }
        do {
            int i14 = i4 - 1;
            while (deflate.bl_count[i14] == 0) {
                i14--;
            }
            deflate.bl_count[i14] = (short) (sArr[i14] - 1);
            deflate.bl_count[i14 + 1] = (short) (sArr2[i] + 2);
            deflate.bl_count[i4] = (short) (sArr3[i4] - 1);
            i2 = i13 - 2;
            i13 = i2;
        } while (i2 > 0);
        int i15 = i7;
        for (int i16 = i4; i16 != 0; i16--) {
            int i17 = deflate.bl_count[i16];
            while (i17 != 0) {
                int i18 = i15 - 1;
                int i19 = deflate.heap[i18];
                i15 = i18;
                if (i19 <= this.max_code) {
                    if (sArr5[(i19 * 2) + 1] != i16) {
                        deflate.opt_len = (int) (deflate.opt_len + ((i16 - sArr5[(i19 * 2) + 1]) * sArr5[i19 * 2]));
                        sArr5[(i19 * 2) + 1] = (short) i16;
                    }
                    i17--;
                    i15 = i18;
                }
            }
        }
    }
}
