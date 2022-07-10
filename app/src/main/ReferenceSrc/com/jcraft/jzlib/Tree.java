package com.jcraft.jzlib;

import org.apache.commons.compress.archivers.cpio.CpioConstants;
import org.bson.BSON;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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
    static final byte[] bl_order = {BSON.NUMBER_INT, BSON.TIMESTAMP, BSON.NUMBER_LONG, 0, 8, 7, 9, 6, 10, 5, BSON.REGEX, 4, BSON.REF, 3, BSON.CODE, 2, BSON.SYMBOL, 1, BSON.CODE_W_SCOPE};
    static final byte[] _dist_code = {0, 1, 2, 3, 4, 4, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, BSON.REGEX, BSON.REGEX, BSON.REGEX, BSON.REGEX, BSON.REGEX, BSON.REGEX, BSON.REGEX, BSON.REGEX, BSON.REGEX, BSON.REGEX, BSON.REGEX, BSON.REGEX, BSON.REGEX, BSON.REGEX, BSON.REGEX, BSON.REGEX, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, 0, 0, BSON.NUMBER_INT, BSON.TIMESTAMP, BSON.NUMBER_LONG, BSON.NUMBER_LONG, 19, 19, 20, 20, 20, 20, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22, 22, 22, 23, 23, 23, 23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29};
    static final byte[] _length_code = {0, 1, 2, 3, 4, 5, 6, 7, 8, 8, 9, 9, 10, 10, BSON.REGEX, BSON.REGEX, BSON.REF, BSON.REF, BSON.REF, BSON.REF, BSON.CODE, BSON.CODE, BSON.CODE, BSON.CODE, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.SYMBOL, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.CODE_W_SCOPE, BSON.NUMBER_INT, BSON.NUMBER_INT, BSON.NUMBER_INT, BSON.NUMBER_INT, BSON.NUMBER_INT, BSON.NUMBER_INT, BSON.NUMBER_INT, BSON.NUMBER_INT, BSON.TIMESTAMP, BSON.TIMESTAMP, BSON.TIMESTAMP, BSON.TIMESTAMP, BSON.TIMESTAMP, BSON.TIMESTAMP, BSON.TIMESTAMP, BSON.TIMESTAMP, BSON.NUMBER_LONG, BSON.NUMBER_LONG, BSON.NUMBER_LONG, BSON.NUMBER_LONG, BSON.NUMBER_LONG, BSON.NUMBER_LONG, BSON.NUMBER_LONG, BSON.NUMBER_LONG, 19, 19, 19, 19, 19, 19, 19, 19, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 28};
    static final int[] base_length = {0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 16, 20, 24, 28, 32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 0};
    static final int[] base_dist = {0, 1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 48, 64, 96, 128, 192, 256, 384, 512, 768, 1024, 1536, 2048, 3072, 4096, 6144, 8192, 12288, 16384, CpioConstants.C_ISBLK};

    public static int d_code(int dist) {
        return dist < 256 ? _dist_code[dist] : _dist_code[(dist >>> 7) + 256];
    }

    /* JADX WARN: Multi-variable type inference failed */
    void gen_bitlen(Deflate s) {
        short[] sArr;
        short[] sArr2;
        short[] tree = this.dyn_tree;
        short[] stree = this.stat_desc.static_tree;
        int[] extra = this.stat_desc.extra_bits;
        int base = this.stat_desc.extra_base;
        int max_length = this.stat_desc.max_length;
        int overflow = 0;
        for (int bits = 0; bits <= 15; bits++) {
            s.bl_count[bits] = 0;
        }
        tree[(s.heap[s.heap_max] * 2) + 1] = 0;
        int h = s.heap_max + 1;
        while (h < HEAP_SIZE) {
            int n = s.heap[h];
            int bits2 = tree[(tree[(n * 2) + 1] * 2) + 1] + 1;
            if (bits2 > max_length) {
                bits2 = max_length;
                overflow++;
            }
            tree[(n * 2) + 1] = (short) bits2;
            if (n <= this.max_code) {
                short[] sArr3 = s.bl_count;
                sArr3[bits2] = (short) (sArr3[bits2] + 1);
                int xbits = 0;
                if (n >= base) {
                    int xbits2 = extra[n - base];
                    xbits = xbits2;
                }
                short f = tree[n * 2];
                s.opt_len += (bits2 + xbits) * f;
                if (stree != null) {
                    s.static_len += (stree[(n * 2) + 1] + xbits) * f;
                }
            }
            h++;
        }
        if (overflow != 0) {
            do {
                int bits3 = max_length - 1;
                while (s.bl_count[bits3] == 0) {
                    bits3--;
                }
                s.bl_count[bits3] = (short) (sArr[bits3] - 1);
                short[] sArr4 = s.bl_count;
                int i = bits3 + 1;
                sArr4[i] = (short) (sArr4[i] + 2);
                s.bl_count[max_length] = (short) (sArr2[max_length] - 1);
                overflow -= 2;
            } while (overflow > 0);
            for (int bits4 = max_length; bits4 != 0; bits4--) {
                short n2 = s.bl_count[bits4];
                while (n2 != 0) {
                    h--;
                    int m = s.heap[h];
                    if (m <= this.max_code) {
                        if (tree[(m * 2) + 1] != bits4) {
                            s.opt_len = (int) (s.opt_len + ((bits4 - tree[(m * 2) + 1]) * tree[m * 2]));
                            tree[(m * 2) + 1] = (short) bits4;
                        }
                        n2--;
                    }
                }
            }
        }
    }

    public void build_tree(Deflate s) {
        int node;
        short[] tree = this.dyn_tree;
        short[] stree = this.stat_desc.static_tree;
        int elems = this.stat_desc.elems;
        int max_code = -1;
        s.heap_len = 0;
        s.heap_max = HEAP_SIZE;
        for (int n = 0; n < elems; n++) {
            if (tree[n * 2] != 0) {
                int[] iArr = s.heap;
                int i = s.heap_len + 1;
                s.heap_len = i;
                max_code = n;
                iArr[i] = n;
                s.depth[n] = 0;
            } else {
                tree[(n * 2) + 1] = 0;
            }
        }
        while (s.heap_len < 2) {
            int[] iArr2 = s.heap;
            int i2 = s.heap_len + 1;
            s.heap_len = i2;
            if (max_code < 2) {
                max_code++;
                node = max_code;
            } else {
                node = 0;
            }
            iArr2[i2] = node;
            tree[node * 2] = 1;
            s.depth[node] = 0;
            s.opt_len--;
            if (stree != null) {
                s.static_len -= stree[(node * 2) + 1];
            }
        }
        this.max_code = max_code;
        for (int n2 = s.heap_len / 2; n2 >= 1; n2--) {
            s.pqdownheap(tree, n2);
        }
        int node2 = elems;
        while (true) {
            int n3 = s.heap[1];
            int[] iArr3 = s.heap;
            int[] iArr4 = s.heap;
            int i3 = s.heap_len;
            s.heap_len = i3 - 1;
            iArr3[1] = iArr4[i3];
            s.pqdownheap(tree, 1);
            int m = s.heap[1];
            int[] iArr5 = s.heap;
            int i4 = s.heap_max - 1;
            s.heap_max = i4;
            iArr5[i4] = n3;
            int[] iArr6 = s.heap;
            int i5 = s.heap_max - 1;
            s.heap_max = i5;
            iArr6[i5] = m;
            tree[node2 * 2] = (short) (tree[n3 * 2] + tree[m * 2]);
            s.depth[node2] = (byte) (Math.max((int) s.depth[n3], (int) s.depth[m]) + 1);
            short s2 = (short) node2;
            tree[(m * 2) + 1] = s2;
            tree[(n3 * 2) + 1] = s2;
            int node3 = node2 + 1;
            s.heap[1] = node2;
            s.pqdownheap(tree, 1);
            if (s.heap_len < 2) {
                int[] iArr7 = s.heap;
                int i6 = s.heap_max - 1;
                s.heap_max = i6;
                iArr7[i6] = s.heap[1];
                gen_bitlen(s);
                gen_codes(tree, max_code, s.bl_count);
                return;
            }
            node2 = node3;
        }
    }

    static void gen_codes(short[] tree, int max_code, short[] bl_count) {
        short[] next_code = new short[16];
        short code = 0;
        for (int bits = 1; bits <= 15; bits++) {
            code = (short) ((bl_count[bits - 1] + code) << 1);
            next_code[bits] = code;
        }
        for (int n = 0; n <= max_code; n++) {
            short s = tree[(n * 2) + 1];
            if (s != 0) {
                short s2 = next_code[s];
                next_code[s] = (short) (s2 + 1);
                tree[n * 2] = (short) bi_reverse(s2, s);
            }
        }
    }

    static int bi_reverse(int code, int len) {
        int res = 0;
        do {
            code >>>= 1;
            res = (res | (code & 1)) << 1;
            len--;
        } while (len > 0);
        return res >>> 1;
    }
}
