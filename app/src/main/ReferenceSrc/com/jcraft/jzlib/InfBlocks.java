package com.jcraft.jzlib;

import android.support.v4.media.TransportMediator;
import org.apache.commons.net.bsd.RCommandClient;
import org.bson.BSON;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class InfBlocks {
    private static final int BAD = 9;
    private static final int BTREE = 4;
    private static final int CODES = 6;
    private static final int DONE = 8;
    private static final int DRY = 7;
    private static final int DTREE = 5;
    private static final int LENS = 1;
    private static final int MANY = 1440;
    private static final int STORED = 2;
    private static final int TABLE = 3;
    private static final int TYPE = 0;
    private static final int Z_BUF_ERROR = -5;
    private static final int Z_DATA_ERROR = -3;
    private static final int Z_ERRNO = -1;
    private static final int Z_MEM_ERROR = -4;
    private static final int Z_NEED_DICT = 2;
    private static final int Z_OK = 0;
    private static final int Z_STREAM_END = 1;
    private static final int Z_STREAM_ERROR = -2;
    private static final int Z_VERSION_ERROR = -6;
    int bitb;
    int bitk;
    int[] blens;
    long check;
    Object checkfn;
    int end;
    int index;
    int last;
    int left;
    int read;
    int table;
    byte[] window;
    int write;
    private static final int[] inflate_mask = {0, 1, 3, 7, 15, 31, 63, TransportMediator.KEYCODE_MEDIA_PAUSE, 255, 511, RCommandClient.MAX_CLIENT_PORT, 2047, 4095, 8191, 16383, 32767, 65535};
    static final int[] border = {16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15};
    int[] bb = new int[1];
    int[] tb = new int[1];
    InfCodes codes = new InfCodes();
    InfTree inftree = new InfTree();
    int[] hufts = new int[4320];
    int mode = 0;

    public InfBlocks(ZStream z, Object checkfn, int w) {
        this.window = new byte[w];
        this.end = w;
        this.checkfn = checkfn;
        reset(z, null);
    }

    public void reset(ZStream z, long[] c) {
        if (c != null) {
            c[0] = this.check;
        }
        if (this.mode == 4 || this.mode == 5) {
        }
        if (this.mode == 6) {
            this.codes.free(z);
        }
        this.mode = 0;
        this.bitk = 0;
        this.bitb = 0;
        this.write = 0;
        this.read = 0;
        if (this.checkfn != null) {
            long adler32 = z._adler.adler32(0L, null, 0, 0);
            this.check = adler32;
            z.adler = adler32;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:104:0x04c5, code lost:
        r4 = r32.blens;
        r5 = com.jcraft.jzlib.InfBlocks.border;
        r6 = r32.index;
        r32.index = r6 + 1;
        r4[r5[r6]] = r20 & 7;
        r20 = r20 >>> 3;
        r25 = r25 - 3;
        r28 = r29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:153:0x0766, code lost:
        r32.blens = null;
        r32.mode = 9;
        r33.msg = "invalid bit length repeat";
        r32.bitb = r20;
        r32.bitk = r25;
        r33.avail_in = r27;
        r33.total_in += r29 - r33.next_in_index;
        r33.next_in_index = r29;
        r32.write = r30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:173:0x0894, code lost:
        r32.write = r30;
        r34 = inflate_flush(r33, r34);
        r30 = r32.write;
     */
    /* JADX WARN: Code restructure failed: missing block: B:174:0x08aa, code lost:
        if (r30 >= r32.read) goto L179;
     */
    /* JADX WARN: Code restructure failed: missing block: B:175:0x08ac, code lost:
        r26 = (r32.read - r30) - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:177:0x08bc, code lost:
        if (r32.read == r32.write) goto L180;
     */
    /* JADX WARN: Code restructure failed: missing block: B:178:0x08be, code lost:
        r32.bitb = r20;
        r32.bitk = r25;
        r33.avail_in = r27;
        r33.total_in += r28 - r33.next_in_index;
        r33.next_in_index = r28;
        r32.write = r30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:179:0x08f2, code lost:
        r26 = r32.end - r30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:180:0x08f9, code lost:
        r32.mode = 8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:181:0x08ff, code lost:
        r32.bitb = r20;
        r32.bitk = r25;
        r33.avail_in = r27;
        r33.total_in += r28 - r33.next_in_index;
        r33.next_in_index = r28;
        r32.write = r30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:248:?, code lost:
        return inflate_flush(r33, -3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:254:?, code lost:
        return inflate_flush(r33, -3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:256:?, code lost:
        return inflate_flush(r33, r34);
     */
    /* JADX WARN: Code restructure failed: missing block: B:257:?, code lost:
        return inflate_flush(r33, 1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x03d9, code lost:
        r32.mode = 9;
        r33.msg = "too many length or distance symbols";
        r32.bitb = r20;
        r32.bitk = r25;
        r33.avail_in = r27;
        r33.total_in += r29 - r33.next_in_index;
        r33.next_in_index = r29;
        r32.write = r30;
     */
    /* JADX WARN: Removed duplicated region for block: B:107:0x04eb A[LOOP:7: B:105:0x04e3->B:107:0x04eb, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:114:0x056b  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0611  */
    /* JADX WARN: Removed duplicated region for block: B:203:0x0525 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:229:0x058a A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:95:0x045f A[LOOP:5: B:95:0x045f->B:98:0x0466, LOOP_START, PHI: r20 r25 r27 r28 r34 
      PHI: (r20v14 'b' int) = (r20v13 'b' int), (r20v16 'b' int) binds: [B:94:0x045b, B:98:0x0466] A[DONT_GENERATE, DONT_INLINE]
      PHI: (r25v14 'k' int) = (r25v13 'k' int), (r25v16 'k' int) binds: [B:94:0x045b, B:98:0x0466] A[DONT_GENERATE, DONT_INLINE]
      PHI: (r27v11 'n' int) = (r27v10 'n' int), (r27v12 'n' int) binds: [B:94:0x045b, B:98:0x0466] A[DONT_GENERATE, DONT_INLINE]
      PHI: (r28v15 'p' int) = (r28v14 'p' int), (r28v18 'p' int) binds: [B:94:0x045b, B:98:0x0466] A[DONT_GENERATE, DONT_INLINE]
      PHI: (r34v14 'r' int) = (r34v12 'r' int), (r34v15 'r' int) binds: [B:94:0x045b, B:98:0x0466] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public int proc(ZStream z, int r) {
        int t;
        int t2;
        int i;
        int p = z.next_in_index;
        int n = z.avail_in;
        int b = this.bitb;
        int k = this.bitk;
        int q = this.write;
        int m = q < this.read ? (this.read - q) - 1 : this.end - q;
        while (true) {
            switch (this.mode) {
                case 0:
                    while (true) {
                        int p2 = p;
                        if (k < 3) {
                            if (n != 0) {
                                r = 0;
                                n--;
                                p = p2 + 1;
                                b |= (z.next_in[p2] & 255) << k;
                                k += 8;
                            } else {
                                this.bitb = b;
                                this.bitk = k;
                                z.avail_in = n;
                                z.total_in += p2 - z.next_in_index;
                                z.next_in_index = p2;
                                this.write = q;
                                return inflate_flush(z, r);
                            }
                        } else {
                            int t3 = b & 7;
                            this.last = t3 & 1;
                            switch (t3 >>> 1) {
                                case 0:
                                    int k2 = k - 3;
                                    int t4 = k2 & 7;
                                    b = (b >>> 3) >>> t4;
                                    k = k2 - t4;
                                    this.mode = 1;
                                    break;
                                case 1:
                                    int[] bl = new int[1];
                                    int[] bd = new int[1];
                                    int[][] tl = new int[1];
                                    int[][] td = new int[1];
                                    InfTree.inflate_trees_fixed(bl, bd, tl, td, z);
                                    this.codes.init(bl[0], bd[0], tl[0], 0, td[0], 0, z);
                                    b >>>= 3;
                                    k -= 3;
                                    this.mode = 6;
                                    break;
                                case 2:
                                    b >>>= 3;
                                    k -= 3;
                                    this.mode = 3;
                                    break;
                                case 3:
                                    this.mode = 9;
                                    z.msg = "invalid block type";
                                    this.bitb = b >>> 3;
                                    this.bitk = k - 3;
                                    z.avail_in = n;
                                    z.total_in += p2 - z.next_in_index;
                                    z.next_in_index = p2;
                                    this.write = q;
                                    return inflate_flush(z, -3);
                            }
                            p = p2;
                            continue;
                        }
                    }
                case 1:
                    while (true) {
                        int p3 = p;
                        if (k < 32) {
                            if (n != 0) {
                                r = 0;
                                n--;
                                p = p3 + 1;
                                b |= (z.next_in[p3] & 255) << k;
                                k += 8;
                            } else {
                                this.bitb = b;
                                this.bitk = k;
                                z.avail_in = n;
                                z.total_in += p3 - z.next_in_index;
                                z.next_in_index = p3;
                                this.write = q;
                                return inflate_flush(z, r);
                            }
                        } else if ((((b ^ (-1)) >>> 16) & 65535) != (65535 & b)) {
                            this.mode = 9;
                            z.msg = "invalid stored block lengths";
                            this.bitb = b;
                            this.bitk = k;
                            z.avail_in = n;
                            z.total_in += p3 - z.next_in_index;
                            z.next_in_index = p3;
                            this.write = q;
                            return inflate_flush(z, -3);
                        } else {
                            this.left = 65535 & b;
                            k = 0;
                            b = 0;
                            if (this.left != 0) {
                                i = 2;
                            } else {
                                i = this.last != 0 ? 7 : 0;
                            }
                            this.mode = i;
                            p = p3;
                            continue;
                        }
                    }
                case 2:
                    if (n == 0) {
                        this.bitb = b;
                        this.bitk = k;
                        z.avail_in = n;
                        z.total_in += p - z.next_in_index;
                        z.next_in_index = p;
                        this.write = q;
                        return inflate_flush(z, r);
                    }
                    if (m == 0) {
                        if (q == this.end && this.read != 0) {
                            q = 0;
                            m = 0 < this.read ? (this.read - 0) - 1 : this.end - 0;
                        }
                        if (m == 0) {
                            this.write = q;
                            int r2 = inflate_flush(z, r);
                            q = this.write;
                            m = q < this.read ? (this.read - q) - 1 : this.end - q;
                            if (q == this.end && this.read != 0) {
                                q = 0;
                                m = 0 < this.read ? (this.read - 0) - 1 : this.end - 0;
                            }
                            if (m == 0) {
                                this.bitb = b;
                                this.bitk = k;
                                z.avail_in = n;
                                z.total_in += p - z.next_in_index;
                                z.next_in_index = p;
                                this.write = q;
                                return inflate_flush(z, r2);
                            }
                        }
                    }
                    r = 0;
                    int t5 = this.left;
                    if (t5 > n) {
                        t5 = n;
                    }
                    if (t5 > m) {
                        t5 = m;
                    }
                    System.arraycopy(z.next_in, p, this.window, q, t5);
                    p += t5;
                    n -= t5;
                    q += t5;
                    m -= t5;
                    int i2 = this.left - t5;
                    this.left = i2;
                    if (i2 == 0) {
                        this.mode = this.last != 0 ? 7 : 0;
                    } else {
                        continue;
                    }
                    break;
                case 3:
                    while (true) {
                        int p4 = p;
                        if (k < 14) {
                            if (n != 0) {
                                r = 0;
                                n--;
                                p = p4 + 1;
                                b |= (z.next_in[p4] & BSON.MINKEY) << k;
                                k += 8;
                            } else {
                                this.bitb = b;
                                this.bitk = k;
                                z.avail_in = n;
                                z.total_in += p4 - z.next_in_index;
                                z.next_in_index = p4;
                                this.write = q;
                                return inflate_flush(z, r);
                            }
                        } else {
                            int t6 = b & 16383;
                            this.table = t6;
                            if ((t6 & 31) <= 29 && ((t6 >> 5) & 31) <= 29) {
                                int t7 = (t6 & 31) + 258 + ((t6 >> 5) & 31);
                                if (this.blens == null || this.blens.length < t7) {
                                    this.blens = new int[t7];
                                } else {
                                    for (int i3 = 0; i3 < t7; i3++) {
                                        this.blens[i3] = 0;
                                    }
                                }
                                b >>>= 14;
                                k -= 14;
                                this.index = 0;
                                this.mode = 4;
                                p = p4;
                            }
                        }
                    }
                    while (this.index < (this.table >>> 10) + 4) {
                        while (true) {
                            int p5 = p;
                            if (k < 3) {
                                if (n != 0) {
                                    r = 0;
                                    n--;
                                    p = p5 + 1;
                                    b |= (z.next_in[p5] & 255) << k;
                                    k += 8;
                                } else {
                                    this.bitb = b;
                                    this.bitk = k;
                                    z.avail_in = n;
                                    z.total_in += p5 - z.next_in_index;
                                    z.next_in_index = p5;
                                    this.write = q;
                                    return inflate_flush(z, r);
                                }
                            }
                        }
                    }
                    while (this.index < 19) {
                        int[] iArr = this.blens;
                        int[] iArr2 = border;
                        int i4 = this.index;
                        this.index = i4 + 1;
                        iArr[iArr2[i4]] = 0;
                    }
                    this.bb[0] = 7;
                    t2 = this.inftree.inflate_trees_bits(this.blens, this.bb, this.tb, this.hufts, z);
                    if (t2 == 0) {
                        if (t2 == -3) {
                            this.blens = null;
                            this.mode = 9;
                        }
                        this.bitb = b;
                        this.bitk = k;
                        z.avail_in = n;
                        z.total_in += p - z.next_in_index;
                        z.next_in_index = p;
                        this.write = q;
                        return inflate_flush(z, t2);
                    }
                    this.index = 0;
                    this.mode = 5;
                    while (true) {
                        t = this.table;
                        if (this.index >= (t & 31) + 258 + ((t >> 5) & 31)) {
                            int t8 = this.bb[0];
                            while (true) {
                                int p6 = p;
                                if (k < t8) {
                                    if (n != 0) {
                                        r = 0;
                                        n--;
                                        p = p6 + 1;
                                        b |= (z.next_in[p6] & 255) << k;
                                        k += 8;
                                    } else {
                                        this.bitb = b;
                                        this.bitk = k;
                                        z.avail_in = n;
                                        z.total_in += p6 - z.next_in_index;
                                        z.next_in_index = p6;
                                        this.write = q;
                                        return inflate_flush(z, r);
                                    }
                                } else {
                                    if (this.tb[0] == -1) {
                                    }
                                    int t9 = this.hufts[((this.tb[0] + (inflate_mask[t8] & b)) * 3) + 1];
                                    int c = this.hufts[((this.tb[0] + (inflate_mask[t9] & b)) * 3) + 2];
                                    if (c < 16) {
                                        b >>>= t9;
                                        k -= t9;
                                        int[] iArr3 = this.blens;
                                        int i5 = this.index;
                                        this.index = i5 + 1;
                                        iArr3[i5] = c;
                                        p = p6;
                                    } else {
                                        int i6 = c == 18 ? 7 : c - 14;
                                        int j = c == 18 ? 11 : 3;
                                        while (k < t9 + i6) {
                                            if (n != 0) {
                                                r = 0;
                                                n--;
                                                b |= (z.next_in[p6] & 255) << k;
                                                k += 8;
                                                p6++;
                                            } else {
                                                this.bitb = b;
                                                this.bitk = k;
                                                z.avail_in = n;
                                                z.total_in += p6 - z.next_in_index;
                                                z.next_in_index = p6;
                                                this.write = q;
                                                return inflate_flush(z, r);
                                            }
                                        }
                                        int b2 = b >>> t9;
                                        int j2 = j + (inflate_mask[i6] & b2);
                                        b = b2 >>> i6;
                                        k = (k - t9) - i6;
                                        int i7 = this.index;
                                        int t10 = this.table;
                                        if (i7 + j2 <= (t10 & 31) + 258 + ((t10 >> 5) & 31) && (c != 16 || i7 >= 1)) {
                                            int c2 = c == 16 ? this.blens[i7 - 1] : 0;
                                            while (true) {
                                                int i8 = i7 + 1;
                                                this.blens[i7] = c2;
                                                j2--;
                                                if (j2 == 0) {
                                                    this.index = i8;
                                                    p = p6;
                                                } else {
                                                    i7 = i8;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            this.tb[0] = -1;
                            int[] tl2 = new int[1];
                            int[] td2 = new int[1];
                            int[] bl2 = {9};
                            int[] bd2 = {6};
                            int t11 = this.table;
                            int t12 = this.inftree.inflate_trees_dynamic((t11 & 31) + 257, ((t11 >> 5) & 31) + 1, this.blens, bl2, bd2, tl2, td2, this.hufts, z);
                            if (t12 != 0) {
                                if (t12 == -3) {
                                    this.blens = null;
                                    this.mode = 9;
                                }
                                this.bitb = b;
                                this.bitk = k;
                                z.avail_in = n;
                                z.total_in += p - z.next_in_index;
                                z.next_in_index = p;
                                this.write = q;
                                return inflate_flush(z, t12);
                            }
                            this.codes.init(bl2[0], bd2[0], this.hufts, tl2[0], this.hufts, td2[0], z);
                            this.mode = 6;
                            break;
                        }
                    }
                    break;
                case 4:
                    while (this.index < (this.table >>> 10) + 4) {
                    }
                    while (this.index < 19) {
                    }
                    this.bb[0] = 7;
                    t2 = this.inftree.inflate_trees_bits(this.blens, this.bb, this.tb, this.hufts, z);
                    if (t2 == 0) {
                    }
                    break;
                case 5:
                    while (true) {
                        t = this.table;
                        if (this.index >= (t & 31) + 258 + ((t >> 5) & 31)) {
                        }
                    }
                    break;
                case 6:
                    break;
                case 7:
                    break;
                case 8:
                    break;
                case 9:
                    this.bitb = b;
                    this.bitk = k;
                    z.avail_in = n;
                    z.total_in += p - z.next_in_index;
                    z.next_in_index = p;
                    this.write = q;
                    return inflate_flush(z, -3);
                default:
                    this.bitb = b;
                    this.bitk = k;
                    z.avail_in = n;
                    z.total_in += p - z.next_in_index;
                    z.next_in_index = p;
                    this.write = q;
                    return inflate_flush(z, -2);
            }
            this.bitb = b;
            this.bitk = k;
            z.avail_in = n;
            z.total_in += p - z.next_in_index;
            z.next_in_index = p;
            this.write = q;
            int r3 = this.codes.proc(this, z, r);
            if (r3 != 1) {
                return inflate_flush(z, r3);
            }
            r = 0;
            this.codes.free(z);
            p = z.next_in_index;
            n = z.avail_in;
            b = this.bitb;
            k = this.bitk;
            q = this.write;
            m = q < this.read ? (this.read - q) - 1 : this.end - q;
            if (this.last == 0) {
                this.mode = 0;
            } else {
                this.mode = 7;
            }
        }
    }

    public void free(ZStream z) {
        reset(z, null);
        this.window = null;
        this.hufts = null;
    }

    public void set_dictionary(byte[] d, int start, int n) {
        System.arraycopy(d, start, this.window, 0, n);
        this.write = n;
        this.read = n;
    }

    public int sync_point() {
        return this.mode == 1 ? 1 : 0;
    }

    public int inflate_flush(ZStream z, int r) {
        int p = z.next_out_index;
        int q = this.read;
        int n = (q <= this.write ? this.write : this.end) - q;
        if (n > z.avail_out) {
            n = z.avail_out;
        }
        if (n != 0 && r == -5) {
            r = 0;
        }
        z.avail_out -= n;
        z.total_out += n;
        if (this.checkfn != null) {
            long adler32 = z._adler.adler32(this.check, this.window, q, n);
            this.check = adler32;
            z.adler = adler32;
        }
        System.arraycopy(this.window, q, z.next_out, p, n);
        int p2 = p + n;
        int q2 = q + n;
        if (q2 == this.end) {
            if (this.write == this.end) {
                this.write = 0;
            }
            int n2 = this.write - 0;
            if (n2 > z.avail_out) {
                n2 = z.avail_out;
            }
            if (n2 != 0 && r == -5) {
                r = 0;
            }
            z.avail_out -= n2;
            z.total_out += n2;
            if (this.checkfn != null) {
                long adler322 = z._adler.adler32(this.check, this.window, 0, n2);
                this.check = adler322;
                z.adler = adler322;
            }
            System.arraycopy(this.window, 0, z.next_out, p2, n2);
            p2 += n2;
            q2 = 0 + n2;
        }
        z.next_out_index = p2;
        this.read = q2;
        return r;
    }
}
