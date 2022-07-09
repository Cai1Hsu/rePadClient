package com.jcraft.jzlib;

import org.bson.BSON;

/* loaded from: classes.dex */
final class Inflate {
    private static final int BAD = 13;
    private static final int BLOCKS = 7;
    private static final int CHECK1 = 11;
    private static final int CHECK2 = 10;
    private static final int CHECK3 = 9;
    private static final int CHECK4 = 8;
    private static final int DICT0 = 6;
    private static final int DICT1 = 5;
    private static final int DICT2 = 4;
    private static final int DICT3 = 3;
    private static final int DICT4 = 2;
    private static final int DONE = 12;
    private static final int FLAG = 1;
    private static final int MAX_WBITS = 15;
    private static final int METHOD = 0;
    private static final int PRESET_DICT = 32;
    private static final int Z_BUF_ERROR = -5;
    private static final int Z_DATA_ERROR = -3;
    private static final int Z_DEFLATED = 8;
    private static final int Z_ERRNO = -1;
    static final int Z_FINISH = 4;
    static final int Z_FULL_FLUSH = 3;
    private static final int Z_MEM_ERROR = -4;
    private static final int Z_NEED_DICT = 2;
    static final int Z_NO_FLUSH = 0;
    private static final int Z_OK = 0;
    static final int Z_PARTIAL_FLUSH = 1;
    private static final int Z_STREAM_END = 1;
    private static final int Z_STREAM_ERROR = -2;
    static final int Z_SYNC_FLUSH = 2;
    private static final int Z_VERSION_ERROR = -6;
    private static byte[] mark = {0, 0, -1, -1};
    InfBlocks blocks;
    int marker;
    int method;
    int mode;
    long need;
    int nowrap;
    long[] was = new long[1];
    int wbits;

    Inflate() {
    }

    int inflateReset(ZStream z) {
        if (z == null || z.istate == null) {
            return -2;
        }
        z.total_out = 0L;
        z.total_in = 0L;
        z.msg = null;
        z.istate.mode = z.istate.nowrap != 0 ? 7 : 0;
        z.istate.blocks.reset(z, null);
        return 0;
    }

    int inflateEnd(ZStream z) {
        if (this.blocks != null) {
            this.blocks.free(z);
        }
        this.blocks = null;
        return 0;
    }

    int inflateInit(ZStream z, int w) {
        Inflate inflate = null;
        z.msg = null;
        this.blocks = null;
        this.nowrap = 0;
        if (w < 0) {
            w = -w;
            this.nowrap = 1;
        }
        if (w < 8 || w > 15) {
            inflateEnd(z);
            return -2;
        }
        this.wbits = w;
        Inflate inflate2 = z.istate;
        if (z.istate.nowrap == 0) {
            inflate = this;
        }
        inflate2.blocks = new InfBlocks(z, inflate, 1 << w);
        inflateReset(z);
        return 0;
    }

    /* JADX WARN: Code restructure failed: missing block: B:117:?, code lost:
        return r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:?, code lost:
        return r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:119:?, code lost:
        return r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:120:?, code lost:
        return r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:?, code lost:
        return 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00c4, code lost:
        if (r11.avail_in == 0) goto L117;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00c6, code lost:
        r1 = r12;
        r11.avail_in--;
        r11.total_in++;
        r2 = r11.istate;
        r3 = r11.next_in;
        r11.next_in_index = r11.next_in_index + 1;
        r2.need = ((r3[r4] & org.bson.BSON.MINKEY) << 24) & 4278190080L;
        r11.istate.mode = 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00f4, code lost:
        if (r11.avail_in == 0) goto L118;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00f6, code lost:
        r1 = r12;
        r11.avail_in--;
        r11.total_in++;
        r2 = r11.istate;
        r4 = r2.need;
        r3 = r11.next_in;
        r11.next_in_index = r11.next_in_index + 1;
        r2.need = r4 + (((r3[r6] & org.bson.BSON.MINKEY) << 16) & 16711680);
        r11.istate.mode = 4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0125, code lost:
        if (r11.avail_in == 0) goto L119;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x0127, code lost:
        r1 = r12;
        r11.avail_in--;
        r11.total_in++;
        r2 = r11.istate;
        r4 = r2.need;
        r3 = r11.next_in;
        r11.next_in_index = r11.next_in_index + 1;
        r2.need = r4 + (((r3[r6] & org.bson.BSON.MINKEY) << 8) & 65280);
        r11.istate.mode = 5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0156, code lost:
        if (r11.avail_in == 0) goto L120;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x0158, code lost:
        r11.avail_in--;
        r11.total_in++;
        r2 = r11.istate;
        r4 = r2.need;
        r3 = r11.next_in;
        r11.next_in_index = r11.next_in_index + 1;
        r2.need = r4 + (r3[r6] & 255);
        r11.adler = r11.istate.need;
        r11.istate.mode = 6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x02bd, code lost:
        return 1;
     */
    /* JADX WARN: Removed duplicated region for block: B:104:0x000b A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:105:0x000b A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:107:0x000b A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:108:0x000b A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x01de  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x020f  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0241  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0273  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x000b A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    int inflate(ZStream z, int f) {
        int i;
        int i2;
        int i3;
        int i4;
        if (z == null || z.istate == null || z.next_in == null) {
            return -2;
        }
        int f2 = f == 4 ? -5 : 0;
        int r = -5;
        while (true) {
            switch (z.istate.mode) {
                case 0:
                    if (z.avail_in != 0) {
                        r = f2;
                        z.avail_in--;
                        z.total_in++;
                        Inflate inflate = z.istate;
                        byte[] bArr = z.next_in;
                        int i5 = z.next_in_index;
                        z.next_in_index = i5 + 1;
                        byte b = bArr[i5];
                        inflate.method = b;
                        if ((b & BSON.CODE_W_SCOPE) != 8) {
                            z.istate.mode = 13;
                            z.msg = "unknown compression method";
                            z.istate.marker = 5;
                            break;
                        } else if ((z.istate.method >> 4) + 8 > z.istate.wbits) {
                            z.istate.mode = 13;
                            z.msg = "invalid window size";
                            z.istate.marker = 5;
                            break;
                        } else {
                            z.istate.mode = 1;
                            if (z.avail_in == 0) {
                                r = f2;
                                z.avail_in--;
                                z.total_in++;
                                byte[] bArr2 = z.next_in;
                                int i6 = z.next_in_index;
                                z.next_in_index = i6 + 1;
                                int b2 = bArr2[i6] & BSON.MINKEY;
                                if (((z.istate.method << 8) + b2) % 31 != 0) {
                                    z.istate.mode = 13;
                                    z.msg = "incorrect header check";
                                    z.istate.marker = 5;
                                    break;
                                } else if ((b2 & 32) == 0) {
                                    z.istate.mode = 7;
                                    break;
                                } else {
                                    z.istate.mode = 2;
                                    break;
                                }
                            } else {
                                return r;
                            }
                        }
                    } else {
                        return r;
                    }
                case 1:
                    if (z.avail_in == 0) {
                    }
                    break;
                case 2:
                    break;
                case 3:
                    break;
                case 4:
                    break;
                case 5:
                    break;
                case 6:
                    z.istate.mode = 13;
                    z.msg = "need dictionary";
                    z.istate.marker = 0;
                    return -2;
                case 7:
                    r = z.istate.blocks.proc(z, r);
                    if (r == -3) {
                        z.istate.mode = 13;
                        z.istate.marker = 0;
                        break;
                    } else {
                        if (r == 0) {
                            r = f2;
                        }
                        if (r == 1) {
                            r = f2;
                            z.istate.blocks.reset(z, z.istate.was);
                            if (z.istate.nowrap != 0) {
                                z.istate.mode = 12;
                                break;
                            } else {
                                z.istate.mode = 8;
                                if (z.avail_in == 0) {
                                    r = f2;
                                    z.avail_in--;
                                    z.total_in++;
                                    Inflate inflate2 = z.istate;
                                    byte[] bArr3 = z.next_in;
                                    z.next_in_index = z.next_in_index + 1;
                                    inflate2.need = ((bArr3[i4] & BSON.MINKEY) << 24) & 4278190080L;
                                    z.istate.mode = 9;
                                    if (z.avail_in == 0) {
                                        r = f2;
                                        z.avail_in--;
                                        z.total_in++;
                                        Inflate inflate3 = z.istate;
                                        long j = inflate3.need;
                                        byte[] bArr4 = z.next_in;
                                        z.next_in_index = z.next_in_index + 1;
                                        inflate3.need = j + (((bArr4[i3] & BSON.MINKEY) << 16) & 16711680);
                                        z.istate.mode = 10;
                                        if (z.avail_in == 0) {
                                            r = f2;
                                            z.avail_in--;
                                            z.total_in++;
                                            Inflate inflate4 = z.istate;
                                            long j2 = inflate4.need;
                                            byte[] bArr5 = z.next_in;
                                            z.next_in_index = z.next_in_index + 1;
                                            inflate4.need = j2 + (((bArr5[i2] & BSON.MINKEY) << 8) & 65280);
                                            z.istate.mode = 11;
                                            if (z.avail_in == 0) {
                                                r = f2;
                                                z.avail_in--;
                                                z.total_in++;
                                                Inflate inflate5 = z.istate;
                                                long j3 = inflate5.need;
                                                byte[] bArr6 = z.next_in;
                                                z.next_in_index = z.next_in_index + 1;
                                                inflate5.need = j3 + (bArr6[i] & 255);
                                                if (((int) z.istate.was[0]) != ((int) z.istate.need)) {
                                                    z.istate.mode = 13;
                                                    z.msg = "incorrect data check";
                                                    z.istate.marker = 5;
                                                    break;
                                                } else {
                                                    z.istate.mode = 12;
                                                    break;
                                                }
                                            } else {
                                                return r;
                                            }
                                        } else {
                                            return r;
                                        }
                                    } else {
                                        return r;
                                    }
                                } else {
                                    return r;
                                }
                            }
                        } else {
                            return r;
                        }
                    }
                case 8:
                    if (z.avail_in == 0) {
                    }
                    break;
                case 9:
                    if (z.avail_in == 0) {
                    }
                    break;
                case 10:
                    if (z.avail_in == 0) {
                    }
                    break;
                case 11:
                    if (z.avail_in == 0) {
                    }
                    break;
                case 12:
                    break;
                case 13:
                    return -3;
                default:
                    return -2;
            }
        }
    }

    int inflateSetDictionary(ZStream z, byte[] dictionary, int dictLength) {
        int index = 0;
        int length = dictLength;
        if (z == null || z.istate == null || z.istate.mode != 6) {
            return -2;
        }
        if (z._adler.adler32(1L, dictionary, 0, dictLength) != z.adler) {
            return -3;
        }
        z.adler = z._adler.adler32(0L, null, 0, 0);
        if (length >= (1 << z.istate.wbits)) {
            length = (1 << z.istate.wbits) - 1;
            index = dictLength - length;
        }
        z.istate.blocks.set_dictionary(dictionary, index, length);
        z.istate.mode = 7;
        return 0;
    }

    int inflateSync(ZStream z) {
        if (z == null || z.istate == null) {
            return -2;
        }
        if (z.istate.mode != 13) {
            z.istate.mode = 13;
            z.istate.marker = 0;
        }
        int n = z.avail_in;
        if (n == 0) {
            return -5;
        }
        int p = z.next_in_index;
        int m = z.istate.marker;
        while (n != 0 && m < 4) {
            if (z.next_in[p] == mark[m]) {
                m++;
            } else if (z.next_in[p] != 0) {
                m = 0;
            } else {
                m = 4 - m;
            }
            p++;
            n--;
        }
        z.total_in += p - z.next_in_index;
        z.next_in_index = p;
        z.avail_in = n;
        z.istate.marker = m;
        if (m != 4) {
            return -3;
        }
        long r = z.total_in;
        long w = z.total_out;
        inflateReset(z);
        z.total_in = r;
        z.total_out = w;
        z.istate.mode = 7;
        return 0;
    }

    int inflateSyncPoint(ZStream z) {
        if (z == null || z.istate == null || z.istate.blocks == null) {
            return -2;
        }
        return z.istate.blocks.sync_point();
    }
}
