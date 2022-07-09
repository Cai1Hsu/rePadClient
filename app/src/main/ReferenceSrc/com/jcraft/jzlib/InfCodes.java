package com.jcraft.jzlib;

import android.support.v4.media.TransportMediator;
import org.apache.commons.net.bsd.RCommandClient;
import org.bson.BSON;

/* loaded from: classes.dex */
final class InfCodes {
    private static final int BADCODE = 9;
    private static final int COPY = 5;
    private static final int DIST = 3;
    private static final int DISTEXT = 4;
    private static final int END = 8;
    private static final int LEN = 1;
    private static final int LENEXT = 2;
    private static final int LIT = 6;
    private static final int START = 0;
    private static final int WASH = 7;
    private static final int Z_BUF_ERROR = -5;
    private static final int Z_DATA_ERROR = -3;
    private static final int Z_ERRNO = -1;
    private static final int Z_MEM_ERROR = -4;
    private static final int Z_NEED_DICT = 2;
    private static final int Z_OK = 0;
    private static final int Z_STREAM_END = 1;
    private static final int Z_STREAM_ERROR = -2;
    private static final int Z_VERSION_ERROR = -6;
    private static final int[] inflate_mask = {0, 1, 3, 7, 15, 31, 63, TransportMediator.KEYCODE_MEDIA_PAUSE, 255, 511, RCommandClient.MAX_CLIENT_PORT, 2047, 4095, 8191, 16383, 32767, 65535};
    byte dbits;
    int dist;
    int[] dtree;
    int dtree_index;
    int get;
    byte lbits;
    int len;
    int lit;
    int[] ltree;
    int ltree_index;
    int mode;
    int need;
    int[] tree;
    int tree_index = 0;

    InfCodes() {
    }

    void init(int bl, int bd, int[] tl, int tl_index, int[] td, int td_index, ZStream z) {
        this.mode = 0;
        this.lbits = (byte) bl;
        this.dbits = (byte) bd;
        this.ltree = tl;
        this.ltree_index = tl_index;
        this.dtree = td;
        this.dtree_index = td_index;
        this.tree = null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:141:0x065d, code lost:
        r25.bitb = r11;
        r25.bitk = r16;
        r26.avail_in = r18;
        r26.total_in += r19 - r26.next_in_index;
        r26.next_in_index = r19;
        r25.write = r21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:203:?, code lost:
        return r25.inflate_flush(r26, 1);
     */
    /* JADX WARN: Removed duplicated region for block: B:186:0x0183 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0137  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x043d A[LOOP:5: B:72:0x043b->B:73:0x043d, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:80:0x046e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    int proc(InfBlocks s, ZStream z, int r) {
        int f;
        int j;
        int p;
        int p2 = z.next_in_index;
        int n = z.avail_in;
        int b = s.bitb;
        int k = s.bitk;
        int q = s.write;
        int m = q < s.read ? (s.read - q) - 1 : s.end - q;
        while (true) {
            switch (this.mode) {
                case 0:
                    if (m >= 258 && n >= 10) {
                        s.bitb = b;
                        s.bitk = k;
                        z.avail_in = n;
                        z.total_in += p2 - z.next_in_index;
                        z.next_in_index = p2;
                        s.write = q;
                        r = inflate_fast(this.lbits, this.dbits, this.ltree, this.ltree_index, this.dtree, this.dtree_index, s, z);
                        p2 = z.next_in_index;
                        n = z.avail_in;
                        b = s.bitb;
                        k = s.bitk;
                        q = s.write;
                        m = q < s.read ? (s.read - q) - 1 : s.end - q;
                        if (r != 0) {
                            this.mode = r == 1 ? 7 : 9;
                            break;
                        }
                    }
                    this.need = this.lbits;
                    this.tree = this.ltree;
                    this.tree_index = this.ltree_index;
                    this.mode = 1;
                    j = this.need;
                    while (true) {
                        p = p2;
                        if (k >= j) {
                            if (n == 0) {
                                s.bitb = b;
                                s.bitk = k;
                                z.avail_in = n;
                                z.total_in += p - z.next_in_index;
                                z.next_in_index = p;
                                s.write = q;
                                return s.inflate_flush(z, r);
                            }
                            r = 0;
                            n--;
                            p2 = p + 1;
                            b |= (z.next_in[p] & BSON.MINKEY) << k;
                            k += 8;
                        } else {
                            int tindex = (this.tree_index + (inflate_mask[j] & b)) * 3;
                            b >>>= this.tree[tindex + 1];
                            k -= this.tree[tindex + 1];
                            int e = this.tree[tindex];
                            if (e == 0) {
                                this.lit = this.tree[tindex + 2];
                                this.mode = 6;
                                p2 = p;
                                break;
                            } else if ((e & 16) != 0) {
                                this.get = e & 15;
                                this.len = this.tree[tindex + 2];
                                this.mode = 2;
                                p2 = p;
                                break;
                            } else if ((e & 64) == 0) {
                                this.need = e;
                                this.tree_index = (tindex / 3) + this.tree[tindex + 2];
                                p2 = p;
                                break;
                            } else if ((e & 32) != 0) {
                                this.mode = 7;
                                p2 = p;
                                break;
                            } else {
                                this.mode = 9;
                                z.msg = "invalid literal/length code";
                                s.bitb = b;
                                s.bitk = k;
                                z.avail_in = n;
                                z.total_in += p - z.next_in_index;
                                z.next_in_index = p;
                                s.write = q;
                                return s.inflate_flush(z, -3);
                            }
                        }
                    }
                    break;
                case 1:
                    j = this.need;
                    while (true) {
                        p = p2;
                        if (k >= j) {
                        }
                        r = 0;
                        n--;
                        p2 = p + 1;
                        b |= (z.next_in[p] & BSON.MINKEY) << k;
                        k += 8;
                    }
                    break;
                case 2:
                    int j2 = this.get;
                    while (true) {
                        int p3 = p2;
                        if (k < j2) {
                            if (n == 0) {
                                s.bitb = b;
                                s.bitk = k;
                                z.avail_in = n;
                                z.total_in += p3 - z.next_in_index;
                                z.next_in_index = p3;
                                s.write = q;
                                return s.inflate_flush(z, r);
                            }
                            r = 0;
                            n--;
                            p2 = p3 + 1;
                            b |= (z.next_in[p3] & BSON.MINKEY) << k;
                            k += 8;
                        } else {
                            this.len += inflate_mask[j2] & b;
                            b >>= j2;
                            k -= j2;
                            this.need = this.dbits;
                            this.tree = this.dtree;
                            this.tree_index = this.dtree_index;
                            this.mode = 3;
                            p2 = p3;
                            break;
                        }
                    }
                case 3:
                    int j3 = this.need;
                    while (true) {
                        int p4 = p2;
                        if (k < j3) {
                            if (n == 0) {
                                s.bitb = b;
                                s.bitk = k;
                                z.avail_in = n;
                                z.total_in += p4 - z.next_in_index;
                                z.next_in_index = p4;
                                s.write = q;
                                return s.inflate_flush(z, r);
                            }
                            r = 0;
                            n--;
                            p2 = p4 + 1;
                            b |= (z.next_in[p4] & BSON.MINKEY) << k;
                            k += 8;
                        } else {
                            int tindex2 = (this.tree_index + (inflate_mask[j3] & b)) * 3;
                            b >>= this.tree[tindex2 + 1];
                            k -= this.tree[tindex2 + 1];
                            int e2 = this.tree[tindex2];
                            if ((e2 & 16) != 0) {
                                this.get = e2 & 15;
                                this.dist = this.tree[tindex2 + 2];
                                this.mode = 4;
                                p2 = p4;
                                break;
                            } else if ((e2 & 64) == 0) {
                                this.need = e2;
                                this.tree_index = (tindex2 / 3) + this.tree[tindex2 + 2];
                                p2 = p4;
                                break;
                            } else {
                                this.mode = 9;
                                z.msg = "invalid distance code";
                                s.bitb = b;
                                s.bitk = k;
                                z.avail_in = n;
                                z.total_in += p4 - z.next_in_index;
                                z.next_in_index = p4;
                                s.write = q;
                                return s.inflate_flush(z, -3);
                            }
                        }
                    }
                case 4:
                    int j4 = this.get;
                    while (true) {
                        int p5 = p2;
                        if (k < j4) {
                            if (n == 0) {
                                s.bitb = b;
                                s.bitk = k;
                                z.avail_in = n;
                                z.total_in += p5 - z.next_in_index;
                                z.next_in_index = p5;
                                s.write = q;
                                return s.inflate_flush(z, r);
                            }
                            r = 0;
                            n--;
                            p2 = p5 + 1;
                            b |= (z.next_in[p5] & BSON.MINKEY) << k;
                            k += 8;
                        } else {
                            this.dist += inflate_mask[j4] & b;
                            b >>= j4;
                            k -= j4;
                            this.mode = 5;
                            p2 = p5;
                        }
                    }
                    f = q - this.dist;
                    while (f < 0) {
                        f += s.end;
                    }
                    while (this.len != 0) {
                        if (m == 0) {
                            if (q == s.end && s.read != 0) {
                                q = 0;
                                m = 0 < s.read ? (s.read - 0) - 1 : s.end - 0;
                            }
                            if (m == 0) {
                                s.write = q;
                                r = s.inflate_flush(z, r);
                                q = s.write;
                                m = q < s.read ? (s.read - q) - 1 : s.end - q;
                                if (q == s.end && s.read != 0) {
                                    q = 0;
                                    m = 0 < s.read ? (s.read - 0) - 1 : s.end - 0;
                                }
                                if (m == 0) {
                                    s.bitb = b;
                                    s.bitk = k;
                                    z.avail_in = n;
                                    z.total_in += p2 - z.next_in_index;
                                    z.next_in_index = p2;
                                    s.write = q;
                                    return s.inflate_flush(z, r);
                                }
                            }
                        }
                        int q2 = q + 1;
                        int f2 = f + 1;
                        s.window[q] = s.window[f];
                        m--;
                        f = f2 == s.end ? 0 : f2;
                        this.len--;
                        q = q2;
                    }
                    this.mode = 0;
                    break;
                case 5:
                    f = q - this.dist;
                    while (f < 0) {
                    }
                    while (this.len != 0) {
                    }
                    this.mode = 0;
                    break;
                case 6:
                    if (m == 0) {
                        if (q == s.end && s.read != 0) {
                            q = 0;
                            m = 0 < s.read ? (s.read - 0) - 1 : s.end - 0;
                        }
                        if (m == 0) {
                            s.write = q;
                            int r2 = s.inflate_flush(z, r);
                            q = s.write;
                            m = q < s.read ? (s.read - q) - 1 : s.end - q;
                            if (q == s.end && s.read != 0) {
                                q = 0;
                                m = 0 < s.read ? (s.read - 0) - 1 : s.end - 0;
                            }
                            if (m == 0) {
                                s.bitb = b;
                                s.bitk = k;
                                z.avail_in = n;
                                z.total_in += p2 - z.next_in_index;
                                z.next_in_index = p2;
                                s.write = q;
                                return s.inflate_flush(z, r2);
                            }
                        }
                    }
                    r = 0;
                    s.window[q] = (byte) this.lit;
                    m--;
                    this.mode = 0;
                    q++;
                    break;
                case 7:
                    if (k > 7) {
                        k -= 8;
                        n++;
                        p2--;
                    }
                    s.write = q;
                    int r3 = s.inflate_flush(z, r);
                    q = s.write;
                    if (q < s.read) {
                        int m2 = (s.read - q) - 1;
                    } else {
                        int m3 = s.end - q;
                    }
                    if (s.read != s.write) {
                        s.bitb = b;
                        s.bitk = k;
                        z.avail_in = n;
                        z.total_in += p2 - z.next_in_index;
                        z.next_in_index = p2;
                        s.write = q;
                        return s.inflate_flush(z, r3);
                    }
                    this.mode = 8;
                    break;
                case 8:
                    break;
                case 9:
                    s.bitb = b;
                    s.bitk = k;
                    z.avail_in = n;
                    z.total_in += p2 - z.next_in_index;
                    z.next_in_index = p2;
                    s.write = q;
                    return s.inflate_flush(z, -3);
                default:
                    s.bitb = b;
                    s.bitk = k;
                    z.avail_in = n;
                    z.total_in += p2 - z.next_in_index;
                    z.next_in_index = p2;
                    s.write = q;
                    return s.inflate_flush(z, -2);
            }
        }
    }

    void free(ZStream z) {
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x009f, code lost:
        r7 = r38.avail_in - r14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x00ab, code lost:
        if ((r10 >> 3) >= r7) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x00ad, code lost:
        r7 = r10 >> 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x00af, code lost:
        r37.bitb = r6;
        r37.bitk = r10 - (r7 << 3);
        r38.avail_in = r14 + r7;
        r38.total_in += r15 - r38.next_in_index;
        r38.next_in_index = r15 - r7;
        r37.write = r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x00e8, code lost:
        return 0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    int inflate_fast(int bl, int bd, int[] tl, int tl_index, int[] td, int td_index, InfBlocks s, ZStream z) {
        int r;
        int q;
        int q2;
        int q3;
        int p;
        int p2;
        int p3;
        int p4 = z.next_in_index;
        int n = z.avail_in;
        int b = s.bitb;
        int k = s.bitk;
        int q4 = s.write;
        int m = q4 < s.read ? (s.read - q4) - 1 : s.end - q4;
        int ml = inflate_mask[bl];
        int md = inflate_mask[bd];
        int q5 = q4;
        while (true) {
            int p5 = p4;
            if (k < 20) {
                n--;
                p4 = p5 + 1;
                b |= (z.next_in[p5] & BSON.MINKEY) << k;
                k += 8;
            } else {
                int t = b & ml;
                int tp_index_t_3 = (tl_index + t) * 3;
                int e = tl[tp_index_t_3];
                if (e == 0) {
                    b >>= tl[tp_index_t_3 + 1];
                    k -= tl[tp_index_t_3 + 1];
                    q2 = q5 + 1;
                    s.window[q5] = (byte) tl[tp_index_t_3 + 2];
                    m--;
                    p4 = p5;
                } else {
                    while (true) {
                        b >>= tl[tp_index_t_3 + 1];
                        k -= tl[tp_index_t_3 + 1];
                        if ((e & 16) != 0) {
                            int e2 = e & 15;
                            int c = tl[tp_index_t_3 + 2] + (inflate_mask[e2] & b);
                            int b2 = b >> e2;
                            int k2 = k - e2;
                            while (k2 < 15) {
                                n--;
                                b2 |= (z.next_in[p5] & BSON.MINKEY) << k2;
                                k2 += 8;
                                p5++;
                            }
                            int t2 = b2 & md;
                            int tp_index_t_32 = (td_index + t2) * 3;
                            int e3 = td[tp_index_t_32];
                            while (true) {
                                b2 >>= td[tp_index_t_32 + 1];
                                k2 -= td[tp_index_t_32 + 1];
                                if ((e3 & 16) != 0) {
                                    int e4 = e3 & 15;
                                    while (k2 < e4) {
                                        n--;
                                        b2 |= (z.next_in[p5] & BSON.MINKEY) << k2;
                                        k2 += 8;
                                        p5++;
                                    }
                                    int d = td[tp_index_t_32 + 2] + (inflate_mask[e4] & b2);
                                    b = b2 >> e4;
                                    k = k2 - e4;
                                    m -= c;
                                    if (q5 >= d) {
                                        int r2 = q5 - d;
                                        if (q5 - r2 > 0 && 2 > q5 - r2) {
                                            int q6 = q5 + 1;
                                            int r3 = r2 + 1;
                                            s.window[q5] = s.window[r2];
                                            r = r3 + 1;
                                            s.window[q6] = s.window[r3];
                                            c -= 2;
                                            q = q6 + 1;
                                        } else {
                                            System.arraycopy(s.window, r2, s.window, q5, 2);
                                            q = q5 + 2;
                                            r = r2 + 2;
                                            c -= 2;
                                        }
                                    } else {
                                        r = q5 - d;
                                        do {
                                            r += s.end;
                                        } while (r < 0);
                                        int e5 = s.end - r;
                                        if (c > e5) {
                                            c -= e5;
                                            if (q5 - r <= 0 || e5 <= q5 - r) {
                                                System.arraycopy(s.window, r, s.window, q5, e5);
                                                q = q5 + e5;
                                                int i = r + e5;
                                            } else {
                                                while (true) {
                                                    int q7 = q5;
                                                    q5 = q7 + 1;
                                                    int r4 = r + 1;
                                                    s.window[q7] = s.window[r];
                                                    e5--;
                                                    if (e5 == 0) {
                                                        break;
                                                    }
                                                    r = r4;
                                                }
                                                q = q5;
                                            }
                                            r = 0;
                                        } else {
                                            q = q5;
                                        }
                                    }
                                    if (q - r <= 0 || c <= q - r) {
                                        System.arraycopy(s.window, r, s.window, q, c);
                                        q2 = q + c;
                                        int i2 = r + c;
                                        p4 = p5;
                                    } else {
                                        while (true) {
                                            q3 = q + 1;
                                            int r5 = r + 1;
                                            s.window[q] = s.window[r];
                                            c--;
                                            if (c == 0) {
                                                break;
                                            }
                                            r = r5;
                                            q = q3;
                                        }
                                        q2 = q3;
                                        p4 = p5;
                                    }
                                } else if ((e3 & 64) == 0) {
                                    t2 = t2 + td[tp_index_t_32 + 2] + (inflate_mask[e3] & b2);
                                    tp_index_t_32 = (td_index + t2) * 3;
                                    e3 = td[tp_index_t_32];
                                } else {
                                    z.msg = "invalid distance code";
                                    int c2 = z.avail_in - n;
                                    if ((k2 >> 3) < c2) {
                                        c2 = k2 >> 3;
                                    }
                                    s.bitb = b2;
                                    s.bitk = k2 - (c2 << 3);
                                    z.avail_in = n + c2;
                                    z.total_in += p - z.next_in_index;
                                    z.next_in_index = p5 - c2;
                                    s.write = q5;
                                    return -3;
                                }
                            }
                        } else if ((e & 64) == 0) {
                            t = t + tl[tp_index_t_3 + 2] + (inflate_mask[e] & b);
                            tp_index_t_3 = (tl_index + t) * 3;
                            e = tl[tp_index_t_3];
                            if (e == 0) {
                                b >>= tl[tp_index_t_3 + 1];
                                k -= tl[tp_index_t_3 + 1];
                                q2 = q5 + 1;
                                s.window[q5] = (byte) tl[tp_index_t_3 + 2];
                                m--;
                                p4 = p5;
                                break;
                            }
                        } else if ((e & 32) != 0) {
                            int c3 = z.avail_in - n;
                            if ((k >> 3) < c3) {
                                c3 = k >> 3;
                            }
                            s.bitb = b;
                            s.bitk = k - (c3 << 3);
                            z.avail_in = n + c3;
                            z.total_in += p3 - z.next_in_index;
                            z.next_in_index = p5 - c3;
                            s.write = q5;
                            return 1;
                        } else {
                            z.msg = "invalid literal/length code";
                            int c4 = z.avail_in - n;
                            if ((k >> 3) < c4) {
                                c4 = k >> 3;
                            }
                            s.bitb = b;
                            s.bitk = k - (c4 << 3);
                            z.avail_in = n + c4;
                            z.total_in += p2 - z.next_in_index;
                            z.next_in_index = p5 - c4;
                            s.write = q5;
                            return -3;
                        }
                    }
                }
                if (m < 258 || n < 10) {
                    break;
                }
                q5 = q2;
            }
        }
    }
}
