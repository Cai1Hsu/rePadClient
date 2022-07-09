package com.jcraft.jzlib;

import org.apache.commons.net.bsd.RCommandClient;

/* loaded from: classes.jar:com/jcraft/jzlib/InfCodes.class */
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
    private static final int[] inflate_mask = {0, 1, 3, 7, 15, 31, 63, 127, 255, 511, RCommandClient.MAX_CLIENT_PORT, 2047, 4095, 8191, 16383, 32767, 65535};
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

    void free(ZStream zStream) {
    }

    int inflate_fast(int i, int i2, int[] iArr, int i3, int[] iArr2, int i4, InfBlocks infBlocks, ZStream zStream) {
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        int i10;
        int i11;
        int i12;
        int i13;
        int i14 = zStream.next_in_index;
        int i15 = zStream.avail_in;
        int i16 = infBlocks.bitb;
        int i17 = infBlocks.bitk;
        int i18 = infBlocks.write;
        int i19 = i18 < infBlocks.read ? (infBlocks.read - i18) - 1 : infBlocks.end - i18;
        int i20 = inflate_mask[i];
        int i21 = inflate_mask[i2];
        int i22 = i18;
        int i23 = i14;
        int i24 = i19;
        int i25 = i17;
        while (true) {
            if (i25 < 20) {
                i15--;
                i16 |= (zStream.next_in[i23] & 255) << i25;
                i25 += 8;
                i23++;
            } else {
                int i26 = i16 & i20;
                int i27 = (i3 + i26) * 3;
                int i28 = iArr[i27];
                int i29 = i16;
                int i30 = i28;
                int i31 = i25;
                int i32 = i27;
                if (i28 == 0) {
                    i16 >>= iArr[i27 + 1];
                    i25 -= iArr[i27 + 1];
                    infBlocks.window[i22] = (byte) iArr[i27 + 2];
                    i24--;
                    i22++;
                } else {
                    while (true) {
                        int i33 = i29 >> iArr[i32 + 1];
                        int i34 = i31 - iArr[i32 + 1];
                        if ((i30 & 16) != 0) {
                            int i35 = i30 & 15;
                            int i36 = iArr[i32 + 2] + (inflate_mask[i35] & i33);
                            int i37 = i34 - i35;
                            int i38 = i33 >> i35;
                            while (i37 < 15) {
                                i15--;
                                i38 |= (zStream.next_in[i23] & 255) << i37;
                                i37 += 8;
                                i23++;
                            }
                            int i39 = i38 & i21;
                            int i40 = (i4 + i39) * 3;
                            int i41 = iArr2[i40];
                            int i42 = i37;
                            while (true) {
                                int i43 = i38 >> iArr2[i40 + 1];
                                i42 -= iArr2[i40 + 1];
                                if ((i41 & 16) != 0) {
                                    int i44 = i41 & 15;
                                    int i45 = i23;
                                    int i46 = i15;
                                    while (i42 < i44) {
                                        i46--;
                                        i43 |= (zStream.next_in[i45] & 255) << i42;
                                        i42 += 8;
                                        i45++;
                                    }
                                    int i47 = iArr2[i40 + 2] + (inflate_mask[i44] & i43);
                                    int i48 = i43 >> i44;
                                    int i49 = i42 - i44;
                                    i24 -= i36;
                                    if (i22 >= i47) {
                                        int i50 = i22 - i47;
                                        if (i22 - i50 <= 0 || 2 <= i22 - i50) {
                                            System.arraycopy(infBlocks.window, i50, infBlocks.window, i22, 2);
                                            i22 += 2;
                                            i5 = i50 + 2;
                                            i6 = i36 - 2;
                                        } else {
                                            int i51 = i22 + 1;
                                            infBlocks.window[i22] = infBlocks.window[i50];
                                            i5 = i50 + 1 + 1;
                                            infBlocks.window[i51] = infBlocks.window[i8];
                                            i6 = i36 - 2;
                                            i22 = i51 + 1;
                                        }
                                    } else {
                                        int i52 = i22 - i47;
                                        do {
                                            i5 = i52 + infBlocks.end;
                                            i52 = i5;
                                        } while (i5 < 0);
                                        int i53 = infBlocks.end - i5;
                                        if (i36 > i53) {
                                            int i54 = i36 - i53;
                                            if (i22 - i5 <= 0 || i53 <= i22 - i5) {
                                                System.arraycopy(infBlocks.window, i5, infBlocks.window, i22, i53);
                                                i22 += i53;
                                            } else {
                                                while (true) {
                                                    int i55 = i22;
                                                    i22 = i55 + 1;
                                                    infBlocks.window[i55] = infBlocks.window[i5];
                                                    i53--;
                                                    if (i53 == 0) {
                                                        break;
                                                    }
                                                    i5++;
                                                }
                                            }
                                            i5 = 0;
                                            i6 = i54;
                                        } else {
                                            i6 = i36;
                                        }
                                    }
                                    if (i22 - i5 <= 0 || i6 <= i22 - i5) {
                                        System.arraycopy(infBlocks.window, i5, infBlocks.window, i22, i6);
                                        i22 += i6;
                                        i23 = i45;
                                        i16 = i48;
                                        i25 = i49;
                                        i15 = i46;
                                    } else {
                                        int i56 = i6;
                                        while (true) {
                                            i7 = i22 + 1;
                                            infBlocks.window[i22] = infBlocks.window[i5];
                                            i56--;
                                            if (i56 == 0) {
                                                break;
                                            }
                                            i5++;
                                            i22 = i7;
                                        }
                                        i22 = i7;
                                        i23 = i45;
                                        i16 = i48;
                                        i25 = i49;
                                        i15 = i46;
                                    }
                                } else if ((i41 & 64) == 0) {
                                    i39 = i39 + iArr2[i40 + 2] + (inflate_mask[i41] & i43);
                                    i40 = (i4 + i39) * 3;
                                    i41 = iArr2[i40];
                                    i38 = i43;
                                } else {
                                    zStream.msg = "invalid distance code";
                                    int i57 = zStream.avail_in - i15;
                                    int i58 = i57;
                                    if ((i42 >> 3) < i57) {
                                        i58 = i42 >> 3;
                                    }
                                    infBlocks.bitb = i43;
                                    infBlocks.bitk = i42 - (i58 << 3);
                                    zStream.avail_in = i15 + i58;
                                    zStream.total_in += i9 - zStream.next_in_index;
                                    zStream.next_in_index = i23 - i58;
                                    infBlocks.write = i22;
                                    i10 = -3;
                                }
                            }
                        } else if ((i30 & 64) == 0) {
                            i26 = i26 + iArr[i32 + 2] + (inflate_mask[i30] & i33);
                            int i59 = (i3 + i26) * 3;
                            int i60 = iArr[i59];
                            i29 = i33;
                            i30 = i60;
                            i31 = i34;
                            i32 = i59;
                            if (i60 == 0) {
                                i16 = i33 >> iArr[i59 + 1];
                                i25 = i34 - iArr[i59 + 1];
                                infBlocks.window[i22] = (byte) iArr[i59 + 2];
                                i24--;
                                i22++;
                                break;
                            }
                        } else if ((i30 & 32) != 0) {
                            int i61 = zStream.avail_in - i15;
                            int i62 = i61;
                            if ((i34 >> 3) < i61) {
                                i62 = i34 >> 3;
                            }
                            infBlocks.bitb = i33;
                            infBlocks.bitk = i34 - (i62 << 3);
                            zStream.avail_in = i15 + i62;
                            zStream.total_in += i12 - zStream.next_in_index;
                            zStream.next_in_index = i23 - i62;
                            infBlocks.write = i22;
                            i10 = 1;
                        } else {
                            zStream.msg = "invalid literal/length code";
                            int i63 = zStream.avail_in - i15;
                            int i64 = i63;
                            if ((i34 >> 3) < i63) {
                                i64 = i34 >> 3;
                            }
                            infBlocks.bitb = i33;
                            infBlocks.bitk = i34 - (i64 << 3);
                            zStream.avail_in = i15 + i64;
                            zStream.total_in += i11 - zStream.next_in_index;
                            zStream.next_in_index = i23 - i64;
                            infBlocks.write = i22;
                            i10 = -3;
                        }
                    }
                }
                if (i24 < 258 || i15 < 10) {
                    break;
                }
            }
        }
        int i65 = zStream.avail_in - i15;
        int i66 = i65;
        if ((i25 >> 3) < i65) {
            i66 = i25 >> 3;
        }
        infBlocks.bitb = i16;
        infBlocks.bitk = i25 - (i66 << 3);
        zStream.avail_in = i15 + i66;
        zStream.total_in += i13 - zStream.next_in_index;
        zStream.next_in_index = i23 - i66;
        infBlocks.write = i22;
        i10 = 0;
        return i10;
    }

    void init(int i, int i2, int[] iArr, int i3, int[] iArr2, int i4, ZStream zStream) {
        this.mode = 0;
        this.lbits = (byte) i;
        this.dbits = (byte) i2;
        this.ltree = iArr;
        this.ltree_index = i3;
        this.dtree = iArr2;
        this.dtree_index = i4;
        this.tree = null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:154:0x09e2, code lost:
        r11.bitb = r16;
        r11.bitk = r37;
        r12.avail_in = r38;
        r12.total_in += r39 - r12.next_in_index;
        r12.next_in_index = r39;
        r11.write = r40;
        r13 = r11.inflate_flush(r12, 1);
     */
    /* JADX WARN: Removed duplicated region for block: B:198:0x02a1 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:200:0x04f0 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0243  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0492  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x067a A[LOOP:5: B:78:0x0666->B:80:0x067a, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:87:0x06d3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    int proc(InfBlocks infBlocks, ZStream zStream, int i) {
        int inflate_flush;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        int i10;
        int i11;
        int i12 = zStream.next_in_index;
        int i13 = zStream.avail_in;
        int i14 = infBlocks.bitb;
        int i15 = infBlocks.bitk;
        int i16 = infBlocks.write;
        int i17 = i16 < infBlocks.read ? (infBlocks.read - i16) - 1 : infBlocks.end - i16;
        while (true) {
            int i18 = i14;
            int i19 = i15;
            int i20 = i17;
            int i21 = i13;
            int i22 = i12;
            int i23 = i16;
            int i24 = i;
            int i25 = i14;
            int i26 = i15;
            int i27 = i13;
            int i28 = i12;
            int i29 = i;
            int i30 = i14;
            int i31 = i15;
            int i32 = i13;
            int i33 = i12;
            int i34 = i;
            int i35 = i15;
            int i36 = i13;
            int i37 = i12;
            int i38 = i16;
            switch (this.mode) {
                case 0:
                    i18 = i14;
                    i19 = i15;
                    int i39 = i17;
                    i21 = i13;
                    i22 = i12;
                    int i40 = i16;
                    i24 = i;
                    if (i17 >= 258) {
                        i18 = i14;
                        i19 = i15;
                        i39 = i17;
                        i21 = i13;
                        i22 = i12;
                        i40 = i16;
                        i24 = i;
                        if (i13 >= 10) {
                            infBlocks.bitb = i14;
                            infBlocks.bitk = i15;
                            zStream.avail_in = i13;
                            zStream.total_in += i12 - zStream.next_in_index;
                            zStream.next_in_index = i12;
                            infBlocks.write = i16;
                            i = inflate_fast(this.lbits, this.dbits, this.ltree, this.ltree_index, this.dtree, this.dtree_index, infBlocks, zStream);
                            i12 = zStream.next_in_index;
                            i13 = zStream.avail_in;
                            i14 = infBlocks.bitb;
                            i15 = infBlocks.bitk;
                            i16 = infBlocks.write;
                            i17 = i16 < infBlocks.read ? (infBlocks.read - i16) - 1 : infBlocks.end - i16;
                            i18 = i14;
                            i19 = i15;
                            i39 = i17;
                            i21 = i13;
                            i22 = i12;
                            i40 = i16;
                            i24 = i;
                            if (i != 0) {
                                this.mode = i == 1 ? 7 : 9;
                                break;
                            }
                        }
                    }
                    this.need = this.lbits;
                    this.tree = this.ltree;
                    this.tree_index = this.ltree_index;
                    this.mode = 1;
                    i23 = i40;
                    i20 = i39;
                    i10 = this.need;
                    i11 = i22;
                    i13 = i21;
                    while (true) {
                        if (i19 < i10) {
                            int i41 = (this.tree_index + (inflate_mask[i10] & i18)) * 3;
                            i14 = i18 >>> this.tree[i41 + 1];
                            i15 = i19 - this.tree[i41 + 1];
                            int i42 = this.tree[i41];
                            if (i42 != 0) {
                                if ((i42 & 16) == 0) {
                                    if ((i42 & 64) != 0) {
                                        if ((i42 & 32) == 0) {
                                            this.mode = 9;
                                            zStream.msg = "invalid literal/length code";
                                            infBlocks.bitb = i14;
                                            infBlocks.bitk = i15;
                                            zStream.avail_in = i13;
                                            zStream.total_in += i11 - zStream.next_in_index;
                                            zStream.next_in_index = i11;
                                            infBlocks.write = i23;
                                            inflate_flush = infBlocks.inflate_flush(zStream, -3);
                                            break;
                                        } else {
                                            this.mode = 7;
                                            i17 = i20;
                                            i12 = i11;
                                            i16 = i23;
                                            i = i24;
                                            break;
                                        }
                                    } else {
                                        this.need = i42;
                                        this.tree_index = (i41 / 3) + this.tree[i41 + 2];
                                        i17 = i20;
                                        i12 = i11;
                                        i16 = i23;
                                        i = i24;
                                        break;
                                    }
                                } else {
                                    this.get = i42 & 15;
                                    this.len = this.tree[i41 + 2];
                                    this.mode = 2;
                                    i17 = i20;
                                    i12 = i11;
                                    i16 = i23;
                                    i = i24;
                                    break;
                                }
                            } else {
                                this.lit = this.tree[i41 + 2];
                                this.mode = 6;
                                i17 = i20;
                                i12 = i11;
                                i16 = i23;
                                i = i24;
                                break;
                            }
                        } else if (i13 == 0) {
                            infBlocks.bitb = i18;
                            infBlocks.bitk = i19;
                            zStream.avail_in = i13;
                            zStream.total_in += i11 - zStream.next_in_index;
                            zStream.next_in_index = i11;
                            infBlocks.write = i23;
                            inflate_flush = infBlocks.inflate_flush(zStream, i24);
                            break;
                        } else {
                            i24 = 0;
                            i13--;
                            i18 |= (zStream.next_in[i11] & 255) << i19;
                            i19 += 8;
                            i11++;
                        }
                    }
                case 1:
                    i10 = this.need;
                    i11 = i22;
                    i13 = i21;
                    while (true) {
                        if (i19 < i10) {
                        }
                        i24 = 0;
                        i13--;
                        i18 |= (zStream.next_in[i11] & 255) << i19;
                        i19 += 8;
                        i11++;
                    }
                    break;
                case 2:
                    int i43 = this.get;
                    i29 = i;
                    int i44 = i12;
                    while (i15 < i43) {
                        if (i13 == 0) {
                            infBlocks.bitb = i14;
                            infBlocks.bitk = i15;
                            zStream.avail_in = i13;
                            zStream.total_in += i44 - zStream.next_in_index;
                            zStream.next_in_index = i44;
                            infBlocks.write = i16;
                            inflate_flush = infBlocks.inflate_flush(zStream, i29);
                            break;
                        } else {
                            i29 = 0;
                            i13--;
                            i14 |= (zStream.next_in[i44] & 255) << i15;
                            i15 += 8;
                            i44++;
                        }
                    }
                    this.len += inflate_mask[i43] & i14;
                    i25 = i14 >> i43;
                    i26 = i15 - i43;
                    this.need = this.dbits;
                    this.tree = this.dtree;
                    this.tree_index = this.dtree_index;
                    this.mode = 3;
                    i28 = i44;
                    i27 = i13;
                    i8 = this.need;
                    i9 = i28;
                    i13 = i27;
                    while (true) {
                        if (i26 < i8) {
                            int i45 = (this.tree_index + (inflate_mask[i8] & i25)) * 3;
                            i14 = i25 >> this.tree[i45 + 1];
                            i15 = i26 - this.tree[i45 + 1];
                            int i46 = this.tree[i45];
                            if ((i46 & 16) == 0) {
                                if ((i46 & 64) != 0) {
                                    this.mode = 9;
                                    zStream.msg = "invalid distance code";
                                    infBlocks.bitb = i14;
                                    infBlocks.bitk = i15;
                                    zStream.avail_in = i13;
                                    zStream.total_in += i9 - zStream.next_in_index;
                                    zStream.next_in_index = i9;
                                    infBlocks.write = i16;
                                    inflate_flush = infBlocks.inflate_flush(zStream, -3);
                                    break;
                                } else {
                                    this.need = i46;
                                    this.tree_index = (i45 / 3) + this.tree[i45 + 2];
                                    i12 = i9;
                                    i = i29;
                                    break;
                                }
                            } else {
                                this.get = i46 & 15;
                                this.dist = this.tree[i45 + 2];
                                this.mode = 4;
                                i12 = i9;
                                i = i29;
                                break;
                            }
                        } else if (i13 == 0) {
                            infBlocks.bitb = i25;
                            infBlocks.bitk = i26;
                            zStream.avail_in = i13;
                            zStream.total_in += i9 - zStream.next_in_index;
                            zStream.next_in_index = i9;
                            infBlocks.write = i16;
                            inflate_flush = infBlocks.inflate_flush(zStream, i29);
                            break;
                        } else {
                            i29 = 0;
                            i13--;
                            i25 |= (zStream.next_in[i9] & 255) << i26;
                            i26 += 8;
                            i9++;
                        }
                    }
                case 3:
                    i8 = this.need;
                    i9 = i28;
                    i13 = i27;
                    while (true) {
                        if (i26 < i8) {
                        }
                        i29 = 0;
                        i13--;
                        i25 |= (zStream.next_in[i9] & 255) << i26;
                        i26 += 8;
                        i9++;
                    }
                    break;
                case 4:
                    int i47 = this.get;
                    i34 = i;
                    int i48 = i12;
                    while (i15 < i47) {
                        if (i13 == 0) {
                            infBlocks.bitb = i14;
                            infBlocks.bitk = i15;
                            zStream.avail_in = i13;
                            zStream.total_in += i48 - zStream.next_in_index;
                            zStream.next_in_index = i48;
                            infBlocks.write = i16;
                            inflate_flush = infBlocks.inflate_flush(zStream, i34);
                            break;
                        } else {
                            i34 = 0;
                            i13--;
                            i14 |= (zStream.next_in[i48] & 255) << i15;
                            i15 += 8;
                            i48++;
                        }
                    }
                    this.dist += inflate_mask[i47] & i14;
                    i30 = i14 >> i47;
                    i31 = i15 - i47;
                    this.mode = 5;
                    i33 = i48;
                    i32 = i13;
                    i2 = i16 - this.dist;
                    while (true) {
                        i3 = i2;
                        i4 = i3;
                        i5 = i17;
                        i6 = i16;
                        i7 = i34;
                        if (i3 >= 0) {
                            i2 = i3 + infBlocks.end;
                        }
                    }
                    while (this.len != 0) {
                        int i49 = i5;
                        int i50 = i6;
                        int i51 = i7;
                        if (i5 == 0) {
                            int i52 = i5;
                            int i53 = i6;
                            if (i6 == infBlocks.end) {
                                i52 = i5;
                                i53 = i6;
                                if (infBlocks.read != 0) {
                                    i53 = 0;
                                    i52 = infBlocks.read < 0 ? (infBlocks.read - 0) - 1 : infBlocks.end - 0;
                                }
                            }
                            i49 = i52;
                            i50 = i53;
                            i51 = i7;
                            if (i52 == 0) {
                                infBlocks.write = i53;
                                int inflate_flush2 = infBlocks.inflate_flush(zStream, i7);
                                int i54 = infBlocks.write;
                                int i55 = i54 < infBlocks.read ? (infBlocks.read - i54) - 1 : infBlocks.end - i54;
                                int i56 = i55;
                                int i57 = i54;
                                if (i54 == infBlocks.end) {
                                    i56 = i55;
                                    i57 = i54;
                                    if (infBlocks.read != 0) {
                                        i57 = 0;
                                        i56 = infBlocks.read < 0 ? (infBlocks.read - 0) - 1 : infBlocks.end - 0;
                                    }
                                }
                                i49 = i56;
                                i50 = i57;
                                i51 = inflate_flush2;
                                if (i56 == 0) {
                                    infBlocks.bitb = i30;
                                    infBlocks.bitk = i31;
                                    zStream.avail_in = i32;
                                    zStream.total_in += i33 - zStream.next_in_index;
                                    zStream.next_in_index = i33;
                                    infBlocks.write = i57;
                                    inflate_flush = infBlocks.inflate_flush(zStream, inflate_flush2);
                                    break;
                                }
                            }
                        }
                        int i58 = i4 + 1;
                        infBlocks.window[i50] = infBlocks.window[i4];
                        i5 = i49 - 1;
                        if (i58 == infBlocks.end) {
                            i58 = 0;
                        }
                        this.len--;
                        i6 = i50 + 1;
                        i7 = i51;
                        i4 = i58;
                    }
                    this.mode = 0;
                    i14 = i30;
                    i15 = i31;
                    i17 = i5;
                    i13 = i32;
                    i12 = i33;
                    i16 = i6;
                    i = i7;
                    break;
                case 5:
                    i2 = i16 - this.dist;
                    while (true) {
                        i3 = i2;
                        i4 = i3;
                        i5 = i17;
                        i6 = i16;
                        i7 = i34;
                        if (i3 >= 0) {
                            break;
                        }
                        i2 = i3 + infBlocks.end;
                    }
                    while (this.len != 0) {
                    }
                    this.mode = 0;
                    i14 = i30;
                    i15 = i31;
                    i17 = i5;
                    i13 = i32;
                    i12 = i33;
                    i16 = i6;
                    i = i7;
                    break;
                case 6:
                    int i59 = i17;
                    int i60 = i16;
                    if (i17 == 0) {
                        int i61 = i17;
                        int i62 = i16;
                        if (i16 == infBlocks.end) {
                            i61 = i17;
                            i62 = i16;
                            if (infBlocks.read != 0) {
                                i62 = 0;
                                i61 = infBlocks.read < 0 ? (infBlocks.read - 0) - 1 : infBlocks.end - 0;
                            }
                        }
                        i59 = i61;
                        i60 = i62;
                        if (i61 == 0) {
                            infBlocks.write = i62;
                            int inflate_flush3 = infBlocks.inflate_flush(zStream, i);
                            int i63 = infBlocks.write;
                            int i64 = i63 < infBlocks.read ? (infBlocks.read - i63) - 1 : infBlocks.end - i63;
                            int i65 = i64;
                            int i66 = i63;
                            if (i63 == infBlocks.end) {
                                i65 = i64;
                                i66 = i63;
                                if (infBlocks.read != 0) {
                                    i66 = 0;
                                    i65 = infBlocks.read < 0 ? (infBlocks.read - 0) - 1 : infBlocks.end - 0;
                                }
                            }
                            i59 = i65;
                            i60 = i66;
                            if (i65 == 0) {
                                infBlocks.bitb = i14;
                                infBlocks.bitk = i15;
                                zStream.avail_in = i13;
                                zStream.total_in += i12 - zStream.next_in_index;
                                zStream.next_in_index = i12;
                                infBlocks.write = i66;
                                inflate_flush = infBlocks.inflate_flush(zStream, inflate_flush3);
                                break;
                            }
                        }
                    }
                    i = 0;
                    infBlocks.window[i60] = (byte) this.lit;
                    i17 = i59 - 1;
                    this.mode = 0;
                    i16 = i60 + 1;
                    break;
                case 7:
                    int i67 = i15;
                    int i68 = i13;
                    int i69 = i12;
                    if (i15 > 7) {
                        i67 = i15 - 8;
                        i68 = i13 + 1;
                        i69 = i12 - 1;
                    }
                    infBlocks.write = i16;
                    int inflate_flush4 = infBlocks.inflate_flush(zStream, i);
                    i38 = infBlocks.write;
                    if (i38 < infBlocks.read) {
                        int i70 = infBlocks.read;
                    } else {
                        int i71 = infBlocks.end;
                    }
                    if (infBlocks.read == infBlocks.write) {
                        this.mode = 8;
                        i37 = i69;
                        i36 = i68;
                        i35 = i67;
                        break;
                    } else {
                        infBlocks.bitb = i14;
                        infBlocks.bitk = i67;
                        zStream.avail_in = i68;
                        zStream.total_in += i69 - zStream.next_in_index;
                        zStream.next_in_index = i69;
                        infBlocks.write = i38;
                        inflate_flush = infBlocks.inflate_flush(zStream, inflate_flush4);
                        break;
                    }
                case 8:
                    break;
                case 9:
                    infBlocks.bitb = i14;
                    infBlocks.bitk = i15;
                    zStream.avail_in = i13;
                    zStream.total_in += i12 - zStream.next_in_index;
                    zStream.next_in_index = i12;
                    infBlocks.write = i16;
                    inflate_flush = infBlocks.inflate_flush(zStream, -3);
                    break;
                default:
                    infBlocks.bitb = i14;
                    infBlocks.bitk = i15;
                    zStream.avail_in = i13;
                    zStream.total_in += i12 - zStream.next_in_index;
                    zStream.next_in_index = i12;
                    infBlocks.write = i16;
                    inflate_flush = infBlocks.inflate_flush(zStream, -2);
                    break;
            }
        }
        return inflate_flush;
    }
}
