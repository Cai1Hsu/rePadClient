package com.jcraft.jzlib;

import org.apache.commons.net.bsd.RCommandClient;

/* loaded from: classes.jar:com/jcraft/jzlib/InfBlocks.class */
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
    private static final int[] inflate_mask = {0, 1, 3, 7, 15, 31, 63, 127, 255, 511, RCommandClient.MAX_CLIENT_PORT, 2047, 4095, 8191, 16383, 32767, 65535};
    static final int[] border = {16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15};
    int[] bb = new int[1];
    int[] tb = new int[1];
    InfCodes codes = new InfCodes();
    InfTree inftree = new InfTree();
    int[] hufts = new int[4320];
    int mode = 0;

    InfBlocks(ZStream zStream, Object obj, int i) {
        this.window = new byte[i];
        this.end = i;
        this.checkfn = obj;
        reset(zStream, null);
    }

    void free(ZStream zStream) {
        reset(zStream, null);
        this.window = null;
        this.hufts = null;
    }

    int inflate_flush(ZStream zStream, int i) {
        int i2 = zStream.next_out_index;
        int i3 = this.read;
        int i4 = (i3 <= this.write ? this.write : this.end) - i3;
        int i5 = i4;
        if (i4 > zStream.avail_out) {
            i5 = zStream.avail_out;
        }
        int i6 = i;
        if (i5 != 0) {
            i6 = i;
            if (i == -5) {
                i6 = 0;
            }
        }
        zStream.avail_out -= i5;
        zStream.total_out += i5;
        if (this.checkfn != null) {
            long adler32 = zStream._adler.adler32(this.check, this.window, i3, i5);
            this.check = adler32;
            zStream.adler = adler32;
        }
        System.arraycopy(this.window, i3, zStream.next_out, i2, i5);
        int i7 = i2 + i5;
        int i8 = i3 + i5;
        int i9 = i7;
        int i10 = i8;
        int i11 = i6;
        if (i8 == this.end) {
            if (this.write == this.end) {
                this.write = 0;
            }
            int i12 = this.write - 0;
            int i13 = i12;
            if (i12 > zStream.avail_out) {
                i13 = zStream.avail_out;
            }
            i11 = i6;
            if (i13 != 0) {
                i11 = i6;
                if (i6 == -5) {
                    i11 = 0;
                }
            }
            zStream.avail_out -= i13;
            zStream.total_out += i13;
            if (this.checkfn != null) {
                long adler322 = zStream._adler.adler32(this.check, this.window, 0, i13);
                this.check = adler322;
                zStream.adler = adler322;
            }
            System.arraycopy(this.window, 0, zStream.next_out, i7, i13);
            i9 = i7 + i13;
            i10 = i13 + 0;
        }
        zStream.next_out_index = i9;
        this.read = i10;
        return i11;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r3v36, resolved type: int[] */
    /* JADX DEBUG: Multi-variable search result rejected for r5v6, resolved type: int[] */
    /* JADX WARN: Code restructure failed: missing block: B:115:0x0728, code lost:
        if (r11.index >= 19) goto L246;
     */
    /* JADX WARN: Code restructure failed: missing block: B:116:0x072b, code lost:
        r0 = r11.blens;
        r0 = com.jcraft.jzlib.InfBlocks.border;
        r0 = r11.index;
        r11.index = r0 + 1;
        r0[r0[r0]] = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:117:0x074d, code lost:
        r11.bb[0] = 7;
        r0 = r11.inftree.inflate_trees_bits(r11.blens, r11.bb, r11.tb, r11.hufts, r12);
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:0x076f, code lost:
        if (r0 == 0) goto L123;
     */
    /* JADX WARN: Code restructure failed: missing block: B:120:0x0775, code lost:
        if (r0 != (-3)) goto L122;
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x0778, code lost:
        r11.blens = null;
        r11.mode = 9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:122:0x0783, code lost:
        r11.bitb = r20;
        r11.bitk = r21;
        r12.avail_in = r22;
        r12.total_in += r23 - r12.next_in_index;
        r12.next_in_index = r23;
        r11.write = r18;
        r13 = inflate_flush(r12, r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:123:0x07bc, code lost:
        r11.index = 0;
        r11.mode = 5;
        r29 = r24;
        r28 = r23;
        r27 = r22;
        r26 = r21;
        r25 = r20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:164:0x0a55, code lost:
        r11.blens = null;
        r11.mode = 9;
        r12.msg = "invalid bit length repeat";
        r11.bitb = r25;
        r11.bitk = r26;
        r12.avail_in = r27;
        r12.total_in += r13 - r12.next_in_index;
        r12.next_in_index = r13;
        r11.write = r18;
        r13 = inflate_flush(r12, -3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:184:0x0bd0, code lost:
        r11.write = r39;
        r0 = inflate_flush(r12, r40);
        r45 = r11.write;
     */
    /* JADX WARN: Code restructure failed: missing block: B:185:0x0bea, code lost:
        if (r45 >= r11.read) goto L190;
     */
    /* JADX WARN: Code restructure failed: missing block: B:186:0x0bed, code lost:
        r0 = r11.read;
     */
    /* JADX WARN: Code restructure failed: missing block: B:188:0x0bfa, code lost:
        if (r11.read == r11.write) goto L191;
     */
    /* JADX WARN: Code restructure failed: missing block: B:189:0x0bfd, code lost:
        r11.bitb = r35;
        r11.bitk = r36;
        r12.avail_in = r37;
        r12.total_in += r38 - r12.next_in_index;
        r12.next_in_index = r38;
        r11.write = r45;
        r13 = inflate_flush(r12, r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:190:0x0c36, code lost:
        r0 = r11.end;
     */
    /* JADX WARN: Code restructure failed: missing block: B:191:0x0c3e, code lost:
        r11.mode = 8;
        r44 = r38;
        r43 = r37;
        r42 = r36;
        r41 = r35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:192:0x0c54, code lost:
        r11.bitb = r41;
        r11.bitk = r42;
        r12.avail_in = r43;
        r12.total_in += r44 - r12.next_in_index;
        r12.next_in_index = r44;
        r11.write = r45;
        r13 = inflate_flush(r12, 1);
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:102:0x0671  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x0898  */
    /* JADX WARN: Removed duplicated region for block: B:248:0x07f5 A[SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r0v263, types: [int[], int[][]] */
    /* JADX WARN: Type inference failed for: r0v265, types: [int[], int[][]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    int proc(ZStream zStream, int i) {
        int i2;
        int inflate_flush;
        int i3 = zStream.next_in_index;
        int i4 = zStream.avail_in;
        int i5 = this.bitb;
        int i6 = this.bitk;
        int i7 = this.write;
        int i8 = i7 < this.read ? (this.read - i7) - 1 : this.end - i7;
        while (true) {
            int i9 = i5;
            int i10 = i6;
            int i11 = i4;
            int i12 = i3;
            int i13 = i;
            int i14 = i5;
            int i15 = i6;
            int i16 = i4;
            int i17 = i3;
            int i18 = i;
            int i19 = i5;
            int i20 = i6;
            int i21 = i4;
            int i22 = i3;
            int i23 = i;
            int i24 = i5;
            int i25 = i6;
            int i26 = i4;
            int i27 = i3;
            int i28 = i7;
            int i29 = i;
            int i30 = i5;
            int i31 = i6;
            int i32 = i4;
            int i33 = i3;
            int i34 = i7;
            switch (this.mode) {
                case 0:
                    while (true) {
                        if (i6 >= 3) {
                            int i35 = i5 & 7;
                            this.last = i35 & 1;
                            switch (i35 >>> 1) {
                                case 0:
                                    int i36 = i6 - 3;
                                    int i37 = i36 & 7;
                                    i5 = (i5 >>> 3) >>> i37;
                                    i6 = i36 - i37;
                                    this.mode = 1;
                                    continue;
                                case 1:
                                    int[] iArr = new int[1];
                                    int[] iArr2 = new int[1];
                                    ?? r0 = new int[1];
                                    ?? r02 = new int[1];
                                    InfTree.inflate_trees_fixed(iArr, iArr2, r0, r02, zStream);
                                    this.codes.init(iArr[0], iArr2[0], r0[0], 0, r02[0], 0, zStream);
                                    i5 >>>= 3;
                                    i6 -= 3;
                                    this.mode = 6;
                                    continue;
                                case 2:
                                    i5 >>>= 3;
                                    i6 -= 3;
                                    this.mode = 3;
                                    continue;
                                case 3:
                                    this.mode = 9;
                                    zStream.msg = "invalid block type";
                                    this.bitb = i5 >>> 3;
                                    this.bitk = i6 - 3;
                                    zStream.avail_in = i4;
                                    zStream.total_in += i3 - zStream.next_in_index;
                                    zStream.next_in_index = i3;
                                    this.write = i7;
                                    inflate_flush = inflate_flush(zStream, -3);
                                    break;
                                default:
                                    continue;
                            }
                        } else if (i4 == 0) {
                            this.bitb = i5;
                            this.bitk = i6;
                            zStream.avail_in = i4;
                            zStream.total_in += i3 - zStream.next_in_index;
                            zStream.next_in_index = i3;
                            this.write = i7;
                            inflate_flush = inflate_flush(zStream, i);
                            break;
                        } else {
                            i = 0;
                            i4--;
                            i5 |= (zStream.next_in[i3] & 255) << i6;
                            i6 += 8;
                            i3++;
                        }
                    }
                case 1:
                    int i38 = i;
                    while (true) {
                        if (i6 < 32) {
                            if (i4 == 0) {
                                this.bitb = i5;
                                this.bitk = i6;
                                zStream.avail_in = i4;
                                zStream.total_in += i3 - zStream.next_in_index;
                                zStream.next_in_index = i3;
                                this.write = i7;
                                inflate_flush = inflate_flush(zStream, i38);
                                break;
                            } else {
                                i38 = 0;
                                i4--;
                                i5 |= (zStream.next_in[i3] & 255) << i6;
                                i6 += 8;
                                i3++;
                            }
                        } else if ((((i5 ^ (-1)) >>> 16) & 65535) != (65535 & i5)) {
                            this.mode = 9;
                            zStream.msg = "invalid stored block lengths";
                            this.bitb = i5;
                            this.bitk = i6;
                            zStream.avail_in = i4;
                            zStream.total_in += i3 - zStream.next_in_index;
                            zStream.next_in_index = i3;
                            this.write = i7;
                            inflate_flush = inflate_flush(zStream, -3);
                            break;
                        } else {
                            this.left = 65535 & i5;
                            i6 = 0;
                            i5 = 0;
                            this.mode = this.left != 0 ? 2 : this.last != 0 ? 7 : 0;
                            i = i38;
                            continue;
                        }
                    }
                case 2:
                    if (i4 == 0) {
                        this.bitb = i5;
                        this.bitk = i6;
                        zStream.avail_in = i4;
                        zStream.total_in += i3 - zStream.next_in_index;
                        zStream.next_in_index = i3;
                        this.write = i7;
                        inflate_flush = inflate_flush(zStream, i);
                        break;
                    } else {
                        int i39 = i8;
                        int i40 = i7;
                        if (i8 == 0) {
                            int i41 = i8;
                            int i42 = i7;
                            if (i7 == this.end) {
                                i41 = i8;
                                i42 = i7;
                                if (this.read != 0) {
                                    i42 = 0;
                                    i41 = this.read < 0 ? (this.read - 0) - 1 : this.end - 0;
                                }
                            }
                            i39 = i41;
                            i40 = i42;
                            if (i41 == 0) {
                                this.write = i42;
                                int inflate_flush2 = inflate_flush(zStream, i);
                                int i43 = this.write;
                                int i44 = i43 < this.read ? (this.read - i43) - 1 : this.end - i43;
                                int i45 = i44;
                                int i46 = i43;
                                if (i43 == this.end) {
                                    i45 = i44;
                                    i46 = i43;
                                    if (this.read != 0) {
                                        i46 = 0;
                                        i45 = this.read < 0 ? (this.read - 0) - 1 : this.end - 0;
                                    }
                                }
                                i39 = i45;
                                i40 = i46;
                                if (i45 == 0) {
                                    this.bitb = i5;
                                    this.bitk = i6;
                                    zStream.avail_in = i4;
                                    zStream.total_in += i3 - zStream.next_in_index;
                                    zStream.next_in_index = i3;
                                    this.write = i46;
                                    inflate_flush = inflate_flush(zStream, inflate_flush2);
                                    break;
                                }
                            }
                        }
                        int i47 = this.left;
                        int i48 = i47;
                        if (i47 > i4) {
                            i48 = i4;
                        }
                        int i49 = i48;
                        if (i48 > i39) {
                            i49 = i39;
                        }
                        System.arraycopy(zStream.next_in, i3, this.window, i40, i49);
                        int i50 = i3 + i49;
                        int i51 = i4 - i49;
                        int i52 = i40 + i49;
                        int i53 = i39 - i49;
                        int i54 = this.left - i49;
                        this.left = i54;
                        i8 = i53;
                        i4 = i51;
                        i3 = i50;
                        i7 = i52;
                        i = 0;
                        if (i54 == 0) {
                            this.mode = this.last != 0 ? 7 : 0;
                            i8 = i53;
                            i4 = i51;
                            i3 = i50;
                            i7 = i52;
                            i = 0;
                        } else {
                            continue;
                        }
                    }
                case 3:
                    while (true) {
                        if (i6 >= 14) {
                            int i55 = i5 & 16383;
                            this.table = i55;
                            if ((i55 & 31) <= 29 && ((i55 >> 5) & 31) <= 29) {
                                int i56 = (i55 & 31) + 258 + ((i55 >> 5) & 31);
                                if (this.blens == null || this.blens.length < i56) {
                                    this.blens = new int[i56];
                                } else {
                                    for (int i57 = 0; i57 < i56; i57++) {
                                        this.blens[i57] = 0;
                                    }
                                }
                                i9 = i5 >>> 14;
                                i10 = i6 - 14;
                                this.index = 0;
                                this.mode = 4;
                                i13 = i;
                                i12 = i3;
                                i11 = i4;
                            }
                        } else if (i4 == 0) {
                            this.bitb = i5;
                            this.bitk = i6;
                            zStream.avail_in = i4;
                            zStream.total_in += i3 - zStream.next_in_index;
                            zStream.next_in_index = i3;
                            this.write = i7;
                            inflate_flush = inflate_flush(zStream, i);
                            break;
                        } else {
                            i = 0;
                            i4--;
                            i5 |= (zStream.next_in[i3] & 255) << i6;
                            i6 += 8;
                            i3++;
                        }
                    }
                    while (true) {
                        if (this.index >= (this.table >>> 10) + 4) {
                            int i58 = i12;
                            while (i10 < 3) {
                                if (i11 == 0) {
                                    this.bitb = i9;
                                    this.bitk = i10;
                                    zStream.avail_in = i11;
                                    zStream.total_in += i58 - zStream.next_in_index;
                                    zStream.next_in_index = i58;
                                    this.write = i7;
                                    inflate_flush = inflate_flush(zStream, i13);
                                    break;
                                } else {
                                    i13 = 0;
                                    i11--;
                                    i9 |= (zStream.next_in[i58] & 255) << i10;
                                    i10 += 8;
                                    i58++;
                                }
                            }
                            int[] iArr3 = this.blens;
                            int[] iArr4 = border;
                            int i59 = this.index;
                            this.index = i59 + 1;
                            iArr3[iArr4[i59]] = i9 & 7;
                            i9 >>>= 3;
                            i10 -= 3;
                            i12 = i58;
                        }
                    }
                    while (true) {
                        i2 = this.table;
                        if (this.index >= (i2 & 31) + 258 + ((i2 >> 5) & 31)) {
                            this.tb[0] = -1;
                            int[] iArr5 = new int[1];
                            int[] iArr6 = new int[1];
                            int[] iArr7 = {9};
                            int[] iArr8 = {6};
                            int i60 = this.table;
                            int inflate_trees_dynamic = this.inftree.inflate_trees_dynamic((i60 & 31) + 257, ((i60 >> 5) & 31) + 1, this.blens, iArr7, iArr8, iArr5, iArr6, this.hufts, zStream);
                            if (inflate_trees_dynamic != 0) {
                                if (inflate_trees_dynamic == -3) {
                                    this.blens = null;
                                    this.mode = 9;
                                }
                                this.bitb = i14;
                                this.bitk = i15;
                                zStream.avail_in = i16;
                                zStream.total_in += i17 - zStream.next_in_index;
                                zStream.next_in_index = i17;
                                this.write = i7;
                                inflate_flush = inflate_flush(zStream, inflate_trees_dynamic);
                                break;
                            } else {
                                this.codes.init(iArr7[0], iArr8[0], this.hufts, iArr5[0], this.hufts, iArr6[0], zStream);
                                this.mode = 6;
                                i23 = i18;
                                i22 = i17;
                                i21 = i16;
                                i20 = i15;
                                i19 = i14;
                                break;
                            }
                        } else {
                            int i61 = this.bb[0];
                            int i62 = i17;
                            while (true) {
                                if (i15 >= i61) {
                                    if (this.tb[0] == -1) {
                                    }
                                    int i63 = this.hufts[((this.tb[0] + (inflate_mask[i61] & i14)) * 3) + 1];
                                    int i64 = this.hufts[((this.tb[0] + (inflate_mask[i63] & i14)) * 3) + 2];
                                    if (i64 < 16) {
                                        i14 >>>= i63;
                                        i15 -= i63;
                                        int[] iArr9 = this.blens;
                                        int i65 = this.index;
                                        this.index = i65 + 1;
                                        iArr9[i65] = i64;
                                        i17 = i62;
                                    } else {
                                        int i66 = i64 == 18 ? 7 : i64 - 14;
                                        int i67 = i64 == 18 ? 11 : 3;
                                        while (true) {
                                            if (i15 >= i63 + i66) {
                                                int i68 = i14 >>> i63;
                                                int i69 = i67 + (inflate_mask[i66] & i68);
                                                i14 = i68 >>> i66;
                                                i15 = (i15 - i63) - i66;
                                                int i70 = this.index;
                                                int i71 = this.table;
                                                if (i70 + i69 <= (i71 & 31) + 258 + ((i71 >> 5) & 31) && (i64 != 16 || i70 >= 1)) {
                                                    int i72 = i64 == 16 ? this.blens[i70 - 1] : 0;
                                                    while (true) {
                                                        int i73 = i70 + 1;
                                                        this.blens[i70] = i72;
                                                        i69--;
                                                        if (i69 == 0) {
                                                            this.index = i73;
                                                            i17 = i62;
                                                        } else {
                                                            i70 = i73;
                                                        }
                                                    }
                                                }
                                            } else if (i16 == 0) {
                                                this.bitb = i14;
                                                this.bitk = i15;
                                                zStream.avail_in = i16;
                                                zStream.total_in += i62 - zStream.next_in_index;
                                                zStream.next_in_index = i62;
                                                this.write = i7;
                                                inflate_flush = inflate_flush(zStream, i18);
                                                break;
                                            } else {
                                                i18 = 0;
                                                i16--;
                                                i14 |= (zStream.next_in[i62] & 255) << i15;
                                                i15 += 8;
                                                i62++;
                                            }
                                        }
                                    }
                                } else if (i16 == 0) {
                                    this.bitb = i14;
                                    this.bitk = i15;
                                    zStream.avail_in = i16;
                                    zStream.total_in += i62 - zStream.next_in_index;
                                    zStream.next_in_index = i62;
                                    this.write = i7;
                                    inflate_flush = inflate_flush(zStream, i18);
                                    break;
                                } else {
                                    i18 = 0;
                                    i16--;
                                    i14 |= (zStream.next_in[i62] & 255) << i15;
                                    i15 += 8;
                                    i62++;
                                }
                            }
                        }
                    }
                    break;
                case 4:
                    while (true) {
                        if (this.index >= (this.table >>> 10) + 4) {
                            break;
                        }
                        int[] iArr32 = this.blens;
                        int[] iArr42 = border;
                        int i592 = this.index;
                        this.index = i592 + 1;
                        iArr32[iArr42[i592]] = i9 & 7;
                        i9 >>>= 3;
                        i10 -= 3;
                        i12 = i58;
                    }
                    while (true) {
                        i2 = this.table;
                        if (this.index >= (i2 & 31) + 258 + ((i2 >> 5) & 31)) {
                        }
                    }
                    break;
                case 5:
                    while (true) {
                        i2 = this.table;
                        if (this.index >= (i2 & 31) + 258 + ((i2 >> 5) & 31)) {
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
                    this.bitb = i5;
                    this.bitk = i6;
                    zStream.avail_in = i4;
                    zStream.total_in += i3 - zStream.next_in_index;
                    zStream.next_in_index = i3;
                    this.write = i7;
                    inflate_flush = inflate_flush(zStream, -3);
                    break;
                default:
                    this.bitb = i5;
                    this.bitk = i6;
                    zStream.avail_in = i4;
                    zStream.total_in += i3 - zStream.next_in_index;
                    zStream.next_in_index = i3;
                    this.write = i7;
                    inflate_flush = inflate_flush(zStream, -2);
                    break;
            }
            this.bitb = i19;
            this.bitk = i20;
            zStream.avail_in = i21;
            zStream.total_in += i22 - zStream.next_in_index;
            zStream.next_in_index = i22;
            this.write = i7;
            int proc = this.codes.proc(this, zStream, i23);
            if (proc != 1) {
                inflate_flush = inflate_flush(zStream, proc);
            } else {
                i29 = 0;
                i = 0;
                this.codes.free(zStream);
                i3 = zStream.next_in_index;
                i4 = zStream.avail_in;
                i5 = this.bitb;
                i6 = this.bitk;
                i7 = this.write;
                i8 = i7 < this.read ? (this.read - i7) - 1 : this.end - i7;
                if (this.last == 0) {
                    this.mode = 0;
                } else {
                    this.mode = 7;
                    i28 = i7;
                    i27 = i3;
                    i26 = i4;
                    i25 = i6;
                    i24 = i5;
                }
            }
        }
        this.mode = 9;
        zStream.msg = "too many length or distance symbols";
        this.bitb = i5;
        this.bitk = i6;
        zStream.avail_in = i4;
        zStream.total_in += i3 - zStream.next_in_index;
        zStream.next_in_index = i3;
        this.write = i7;
        inflate_flush = inflate_flush(zStream, -3);
        return inflate_flush;
    }

    void reset(ZStream zStream, long[] jArr) {
        if (jArr != null) {
            jArr[0] = this.check;
        }
        if (this.mode == 4 || this.mode == 5) {
        }
        if (this.mode == 6) {
            this.codes.free(zStream);
        }
        this.mode = 0;
        this.bitk = 0;
        this.bitb = 0;
        this.write = 0;
        this.read = 0;
        if (this.checkfn != null) {
            long adler32 = zStream._adler.adler32(0L, null, 0, 0);
            this.check = adler32;
            zStream.adler = adler32;
        }
    }

    void set_dictionary(byte[] bArr, int i, int i2) {
        System.arraycopy(bArr, i, this.window, 0, i2);
        this.write = i2;
        this.read = i2;
    }

    int sync_point() {
        int i = 1;
        if (this.mode != 1) {
            i = 0;
        }
        return i;
    }
}
