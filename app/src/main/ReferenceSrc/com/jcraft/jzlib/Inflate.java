package com.jcraft.jzlib;

/* loaded from: classes.jar:com/jcraft/jzlib/Inflate.class */
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

    /* JADX WARN: Code restructure failed: missing block: B:37:0x01c6, code lost:
        r10 = r13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x01cd, code lost:
        if (r9.avail_in == 0) goto L9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x01d0, code lost:
        r14 = r11;
        r9.avail_in--;
        r9.total_in++;
        r0 = r9.istate;
        r0 = r9.next_in;
        r9.next_in_index = r9.next_in_index + 1;
        r0.need = ((r0[r0] & 255) << 24) & 4278190080L;
        r9.istate.mode = 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x021c, code lost:
        r10 = r14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0223, code lost:
        if (r9.avail_in == 0) goto L9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x0226, code lost:
        r15 = r11;
        r9.avail_in--;
        r9.total_in++;
        r0 = r9.istate;
        r0 = r0.need;
        r0 = r9.next_in;
        r9.next_in_index = r9.next_in_index + 1;
        r0.need = r0 + (((r0[r0] & 255) << 16) & 16711680);
        r9.istate.mode = 4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x027c, code lost:
        r10 = r15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0283, code lost:
        if (r9.avail_in == 0) goto L9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x0286, code lost:
        r9.avail_in--;
        r9.total_in++;
        r0 = r9.istate;
        r0 = r0.need;
        r0 = r9.next_in;
        r9.next_in_index = r9.next_in_index + 1;
        r0.need = r0 + (((r0[r0] & 255) << 8) & 65280);
        r9.istate.mode = 5;
        r16 = r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x02dc, code lost:
        r10 = r16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x02e3, code lost:
        if (r9.avail_in == 0) goto L9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x02e6, code lost:
        r9.avail_in--;
        r9.total_in++;
        r0 = r9.istate;
        r0 = r0.need;
        r0 = r9.next_in;
        r9.next_in_index = r9.next_in_index + 1;
        r0.need = r0 + (r0[r0] & 255);
        r9.adler = r9.istate.need;
        r9.istate.mode = 6;
        r10 = 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x0574, code lost:
        r10 = 1;
     */
    /* JADX WARN: Removed duplicated region for block: B:108:0x0015 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:109:0x0015 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:110:0x0015 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:111:0x0015 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0145  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x03da  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0431  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0492  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x04f3  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0015 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    int inflate(ZStream zStream, int i) {
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        if (zStream != null && zStream.istate != null && zStream.next_in != null) {
            int i7 = i == 4 ? -5 : 0;
            i2 = -5;
            while (true) {
                int i8 = i2;
                int i9 = i2;
                int i10 = i2;
                int i11 = i2;
                int i12 = i2;
                int i13 = i2;
                int i14 = i2;
                int i15 = i2;
                int i16 = i2;
                switch (zStream.istate.mode) {
                    case 0:
                        if (zStream.avail_in == 0) {
                            break;
                        } else {
                            i2 = i7;
                            zStream.avail_in--;
                            zStream.total_in++;
                            Inflate inflate = zStream.istate;
                            byte[] bArr = zStream.next_in;
                            int i17 = zStream.next_in_index;
                            zStream.next_in_index = i17 + 1;
                            byte b = bArr[i17];
                            inflate.method = b;
                            if ((b & 15) == 8) {
                                if ((zStream.istate.method >> 4) + 8 <= zStream.istate.wbits) {
                                    zStream.istate.mode = 1;
                                    i8 = i2;
                                    i2 = i8;
                                    if (zStream.avail_in != 0) {
                                        break;
                                    } else {
                                        i2 = i7;
                                        zStream.avail_in--;
                                        zStream.total_in++;
                                        byte[] bArr2 = zStream.next_in;
                                        int i18 = zStream.next_in_index;
                                        zStream.next_in_index = i18 + 1;
                                        int i19 = bArr2[i18] & 255;
                                        if (((zStream.istate.method << 8) + i19) % 31 == 0) {
                                            if ((i19 & 32) != 0) {
                                                zStream.istate.mode = 2;
                                                i9 = i2;
                                                break;
                                            } else {
                                                zStream.istate.mode = 7;
                                                break;
                                            }
                                        } else {
                                            zStream.istate.mode = 13;
                                            zStream.msg = "incorrect header check";
                                            zStream.istate.marker = 5;
                                            break;
                                        }
                                    }
                                } else {
                                    zStream.istate.mode = 13;
                                    zStream.msg = "invalid window size";
                                    zStream.istate.marker = 5;
                                    break;
                                }
                            } else {
                                zStream.istate.mode = 13;
                                zStream.msg = "unknown compression method";
                                zStream.istate.marker = 5;
                                break;
                            }
                        }
                    case 1:
                        i2 = i8;
                        if (zStream.avail_in != 0) {
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
                        zStream.istate.mode = 13;
                        zStream.msg = "need dictionary";
                        zStream.istate.marker = 0;
                        i2 = -2;
                        break;
                    case 7:
                        i2 = zStream.istate.blocks.proc(zStream, i2);
                        if (i2 != -3) {
                            int i20 = i2;
                            if (i2 == 0) {
                                i20 = i7;
                            }
                            i2 = i20;
                            if (i20 != 1) {
                                break;
                            } else {
                                i2 = i7;
                                zStream.istate.blocks.reset(zStream, zStream.istate.was);
                                if (zStream.istate.nowrap == 0) {
                                    zStream.istate.mode = 8;
                                    i13 = i2;
                                    i2 = i13;
                                    if (zStream.avail_in != 0) {
                                        break;
                                    } else {
                                        i14 = i7;
                                        zStream.avail_in--;
                                        zStream.total_in++;
                                        Inflate inflate2 = zStream.istate;
                                        byte[] bArr3 = zStream.next_in;
                                        zStream.next_in_index = zStream.next_in_index + 1;
                                        inflate2.need = ((bArr3[i6] & 255) << 24) & 4278190080L;
                                        zStream.istate.mode = 9;
                                        i2 = i14;
                                        if (zStream.avail_in != 0) {
                                            break;
                                        } else {
                                            i15 = i7;
                                            zStream.avail_in--;
                                            zStream.total_in++;
                                            Inflate inflate3 = zStream.istate;
                                            long j = inflate3.need;
                                            byte[] bArr4 = zStream.next_in;
                                            zStream.next_in_index = zStream.next_in_index + 1;
                                            inflate3.need = j + (((bArr4[i5] & 255) << 16) & 16711680);
                                            zStream.istate.mode = 10;
                                            i2 = i15;
                                            if (zStream.avail_in != 0) {
                                                break;
                                            } else {
                                                i16 = i7;
                                                zStream.avail_in--;
                                                zStream.total_in++;
                                                Inflate inflate4 = zStream.istate;
                                                long j2 = inflate4.need;
                                                byte[] bArr5 = zStream.next_in;
                                                zStream.next_in_index = zStream.next_in_index + 1;
                                                inflate4.need = j2 + (((bArr5[i4] & 255) << 8) & 65280);
                                                zStream.istate.mode = 11;
                                                i2 = i16;
                                                if (zStream.avail_in != 0) {
                                                    break;
                                                } else {
                                                    i2 = i7;
                                                    zStream.avail_in--;
                                                    zStream.total_in++;
                                                    Inflate inflate5 = zStream.istate;
                                                    long j3 = inflate5.need;
                                                    byte[] bArr6 = zStream.next_in;
                                                    zStream.next_in_index = zStream.next_in_index + 1;
                                                    inflate5.need = j3 + (bArr6[i3] & 255);
                                                    if (((int) zStream.istate.was[0]) == ((int) zStream.istate.need)) {
                                                        zStream.istate.mode = 12;
                                                        break;
                                                    } else {
                                                        zStream.istate.mode = 13;
                                                        zStream.msg = "incorrect data check";
                                                        zStream.istate.marker = 5;
                                                        break;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    zStream.istate.mode = 12;
                                    break;
                                }
                            }
                        } else {
                            zStream.istate.mode = 13;
                            zStream.istate.marker = 0;
                            break;
                        }
                    case 8:
                        i2 = i13;
                        if (zStream.avail_in != 0) {
                        }
                        break;
                    case 9:
                        i2 = i14;
                        if (zStream.avail_in != 0) {
                        }
                        break;
                    case 10:
                        i2 = i15;
                        if (zStream.avail_in != 0) {
                        }
                        break;
                    case 11:
                        i2 = i16;
                        if (zStream.avail_in != 0) {
                        }
                        break;
                    case 12:
                        break;
                    case 13:
                        i2 = -3;
                        break;
                    default:
                        i2 = -2;
                        break;
                }
            }
        } else {
            i2 = -2;
        }
        return i2;
    }

    int inflateEnd(ZStream zStream) {
        if (this.blocks != null) {
            this.blocks.free(zStream);
        }
        this.blocks = null;
        return 0;
    }

    int inflateInit(ZStream zStream, int i) {
        int i2;
        Inflate inflate = null;
        zStream.msg = null;
        this.blocks = null;
        this.nowrap = 0;
        int i3 = i;
        if (i < 0) {
            i3 = -i;
            this.nowrap = 1;
        }
        if (i3 < 8 || i3 > 15) {
            inflateEnd(zStream);
            i2 = -2;
        } else {
            this.wbits = i3;
            Inflate inflate2 = zStream.istate;
            if (zStream.istate.nowrap == 0) {
                inflate = this;
            }
            inflate2.blocks = new InfBlocks(zStream, inflate, 1 << i3);
            inflateReset(zStream);
            i2 = 0;
        }
        return i2;
    }

    int inflateReset(ZStream zStream) {
        int i;
        if (zStream == null || zStream.istate == null) {
            i = -2;
        } else {
            zStream.total_out = 0L;
            zStream.total_in = 0L;
            zStream.msg = null;
            zStream.istate.mode = zStream.istate.nowrap != 0 ? 7 : 0;
            zStream.istate.blocks.reset(zStream, null);
            i = 0;
        }
        return i;
    }

    int inflateSetDictionary(ZStream zStream, byte[] bArr, int i) {
        int i2;
        int i3 = 0;
        if (zStream == null || zStream.istate == null || zStream.istate.mode != 6) {
            i2 = -2;
        } else if (zStream._adler.adler32(1L, bArr, 0, i) != zStream.adler) {
            i2 = -3;
        } else {
            zStream.adler = zStream._adler.adler32(0L, null, 0, 0);
            int i4 = i;
            if (i >= (1 << zStream.istate.wbits)) {
                i4 = (1 << zStream.istate.wbits) - 1;
                i3 = i - i4;
            }
            zStream.istate.blocks.set_dictionary(bArr, i3, i4);
            zStream.istate.mode = 7;
            i2 = 0;
        }
        return i2;
    }

    int inflateSync(ZStream zStream) {
        int i;
        if (zStream == null || zStream.istate == null) {
            i = -2;
        } else {
            if (zStream.istate.mode != 13) {
                zStream.istate.mode = 13;
                zStream.istate.marker = 0;
            }
            int i2 = zStream.avail_in;
            if (i2 == 0) {
                i = -5;
            } else {
                int i3 = zStream.next_in_index;
                int i4 = zStream.istate.marker;
                while (i2 != 0 && i4 < 4) {
                    i4 = zStream.next_in[i3] == mark[i4] ? i4 + 1 : zStream.next_in[i3] != 0 ? 0 : 4 - i4;
                    i3++;
                    i2--;
                }
                zStream.total_in += i3 - zStream.next_in_index;
                zStream.next_in_index = i3;
                zStream.avail_in = i2;
                zStream.istate.marker = i4;
                if (i4 != 4) {
                    i = -3;
                } else {
                    long j = zStream.total_in;
                    long j2 = zStream.total_out;
                    inflateReset(zStream);
                    zStream.total_in = j;
                    zStream.total_out = j2;
                    zStream.istate.mode = 7;
                    i = 0;
                }
            }
        }
        return i;
    }

    int inflateSyncPoint(ZStream zStream) {
        return (zStream == null || zStream.istate == null || zStream.istate.blocks == null) ? -2 : zStream.istate.blocks.sync_point();
    }
}
