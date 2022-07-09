package com.jcraft.jzlib;

import android.support.v4.view.MotionEventCompat;

/* loaded from: classes.jar:com/jcraft/jzlib/Deflate.class */
public final class Deflate {
    private static final int BL_CODES = 19;
    private static final int BUSY_STATE = 113;
    private static final int BlockDone = 1;
    private static final int Buf_size = 16;
    private static final int DEF_MEM_LEVEL = 8;
    private static final int DYN_TREES = 2;
    private static final int D_CODES = 30;
    private static final int END_BLOCK = 256;
    private static final int FAST = 1;
    private static final int FINISH_STATE = 666;
    private static final int FinishDone = 3;
    private static final int FinishStarted = 2;
    private static final int HEAP_SIZE = 573;
    private static final int INIT_STATE = 42;
    private static final int LENGTH_CODES = 29;
    private static final int LITERALS = 256;
    private static final int L_CODES = 286;
    private static final int MAX_BITS = 15;
    private static final int MAX_MATCH = 258;
    private static final int MAX_MEM_LEVEL = 9;
    private static final int MAX_WBITS = 15;
    private static final int MIN_LOOKAHEAD = 262;
    private static final int MIN_MATCH = 3;
    private static final int NeedMore = 0;
    private static final int PRESET_DICT = 32;
    private static final int REPZ_11_138 = 18;
    private static final int REPZ_3_10 = 17;
    private static final int REP_3_6 = 16;
    private static final int SLOW = 2;
    private static final int STATIC_TREES = 1;
    private static final int STORED = 0;
    private static final int STORED_BLOCK = 0;
    private static final int Z_ASCII = 1;
    private static final int Z_BINARY = 0;
    private static final int Z_BUF_ERROR = -5;
    private static final int Z_DATA_ERROR = -3;
    private static final int Z_DEFAULT_COMPRESSION = -1;
    private static final int Z_DEFAULT_STRATEGY = 0;
    private static final int Z_DEFLATED = 8;
    private static final int Z_ERRNO = -1;
    private static final int Z_FILTERED = 1;
    private static final int Z_FINISH = 4;
    private static final int Z_FULL_FLUSH = 3;
    private static final int Z_HUFFMAN_ONLY = 2;
    private static final int Z_MEM_ERROR = -4;
    private static final int Z_NEED_DICT = 2;
    private static final int Z_NO_FLUSH = 0;
    private static final int Z_OK = 0;
    private static final int Z_PARTIAL_FLUSH = 1;
    private static final int Z_STREAM_END = 1;
    private static final int Z_STREAM_ERROR = -2;
    private static final int Z_SYNC_FLUSH = 2;
    private static final int Z_UNKNOWN = 2;
    private static final int Z_VERSION_ERROR = -6;
    private static final Config[] config_table = new Config[10];
    private static final String[] z_errmsg = {"need dictionary", "stream end", "", "file error", "stream error", "data error", "insufficient memory", "buffer error", "incompatible version", ""};
    short bi_buf;
    int bi_valid;
    int block_start;
    int d_buf;
    byte data_type;
    int good_match;
    int hash_bits;
    int hash_mask;
    int hash_shift;
    int hash_size;
    short[] head;
    int heap_len;
    int heap_max;
    int ins_h;
    int l_buf;
    int last_eob_len;
    int last_flush;
    int last_lit;
    int level;
    int lit_bufsize;
    int lookahead;
    int match_available;
    int match_length;
    int match_start;
    int matches;
    int max_chain_length;
    int max_lazy_match;
    byte method;
    int nice_match;
    int noheader;
    int opt_len;
    int pending;
    byte[] pending_buf;
    int pending_buf_size;
    int pending_out;
    short[] prev;
    int prev_length;
    int prev_match;
    int static_len;
    int status;
    int strategy;
    ZStream strm;
    int strstart;
    int w_bits;
    int w_mask;
    int w_size;
    byte[] window;
    int window_size;
    Tree l_desc = new Tree();
    Tree d_desc = new Tree();
    Tree bl_desc = new Tree();
    short[] bl_count = new short[16];
    int[] heap = new int[HEAP_SIZE];
    byte[] depth = new byte[HEAP_SIZE];
    short[] dyn_ltree = new short[1146];
    short[] dyn_dtree = new short[122];
    short[] bl_tree = new short[78];

    /* loaded from: classes.jar:com/jcraft/jzlib/Deflate$Config.class */
    static class Config {
        int func;
        int good_length;
        int max_chain;
        int max_lazy;
        int nice_length;

        Config(int i, int i2, int i3, int i4, int i5) {
            this.good_length = i;
            this.max_lazy = i2;
            this.nice_length = i3;
            this.max_chain = i4;
            this.func = i5;
        }
    }

    static {
        config_table[0] = new Config(0, 0, 0, 0, 0);
        config_table[1] = new Config(4, 4, 8, 4, 1);
        config_table[2] = new Config(4, 5, 16, 8, 1);
        config_table[3] = new Config(4, 6, 32, 32, 1);
        config_table[4] = new Config(4, 4, 16, 16, 2);
        config_table[5] = new Config(8, 16, 32, 32, 2);
        config_table[6] = new Config(8, 16, 128, 128, 2);
        config_table[7] = new Config(8, 32, 128, 256, 2);
        config_table[8] = new Config(32, 128, 258, 1024, 2);
        config_table[9] = new Config(32, 258, 258, 4096, 2);
    }

    Deflate() {
    }

    static boolean smaller(short[] sArr, int i, int i2, byte[] bArr) {
        short s = sArr[i * 2];
        short s2 = sArr[i2 * 2];
        return s < s2 || (s == s2 && bArr[i] <= bArr[i2]);
    }

    void _tr_align() {
        send_bits(2, 3);
        send_code(256, StaticTree.static_ltree);
        bi_flush();
        if (((this.last_eob_len + 1) + 10) - this.bi_valid < 9) {
            send_bits(2, 3);
            send_code(256, StaticTree.static_ltree);
            bi_flush();
        }
        this.last_eob_len = 7;
    }

    void _tr_flush_block(int i, int i2, boolean z) {
        int i3;
        int i4;
        int i5 = 0;
        if (this.level > 0) {
            if (this.data_type == 2) {
                set_data_type();
            }
            this.l_desc.build_tree(this);
            this.d_desc.build_tree(this);
            int build_bl_tree = build_bl_tree();
            int i6 = ((this.opt_len + 3) + 7) >>> 3;
            int i7 = ((this.static_len + 3) + 7) >>> 3;
            i5 = build_bl_tree;
            i4 = i6;
            i3 = i7;
            if (i7 <= i6) {
                i4 = i7;
                i3 = i7;
                i5 = build_bl_tree;
            }
        } else {
            i3 = i2 + 5;
            i4 = i3;
        }
        if (i2 + 4 <= i4 && i != -1) {
            _tr_stored_block(i, i2, z);
        } else if (i3 == i4) {
            send_bits((z ? 1 : 0) + 2, 3);
            compress_block(StaticTree.static_ltree, StaticTree.static_dtree);
        } else {
            send_bits((z ? 1 : 0) + 4, 3);
            send_all_trees(this.l_desc.max_code + 1, this.d_desc.max_code + 1, i5 + 1);
            compress_block(this.dyn_ltree, this.dyn_dtree);
        }
        init_block();
        if (z) {
            bi_windup();
        }
    }

    void _tr_stored_block(int i, int i2, boolean z) {
        send_bits((z ? 1 : 0) + 0, 3);
        copy_block(i, i2, true);
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x010f, code lost:
        if ((r10 >>> 3) < ((r0 - r0) / 2)) goto L18;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    boolean _tr_tally(int i, int i2) {
        short[] sArr;
        int i3;
        short[] sArr2;
        int d_code;
        short[] sArr3;
        int i4;
        boolean z = true;
        this.pending_buf[this.d_buf + (this.last_lit * 2)] = (byte) (i >>> 8);
        this.pending_buf[this.d_buf + (this.last_lit * 2) + 1] = (byte) i;
        this.pending_buf[this.l_buf + this.last_lit] = (byte) i2;
        this.last_lit++;
        if (i == 0) {
            this.dyn_ltree[i2 * 2] = (short) (sArr3[i4] + 1);
        } else {
            this.matches++;
            this.dyn_ltree[(Tree._length_code[i2] + 256 + 1) * 2] = (short) (sArr[i3] + 1);
            this.dyn_dtree[Tree.d_code(i - 1) * 2] = (short) (sArr2[d_code] + 1);
        }
        if ((this.last_lit & 8191) == 0 && this.level > 2) {
            int i5 = this.last_lit * 8;
            int i6 = this.strstart;
            int i7 = this.block_start;
            for (int i8 = 0; i8 < 30; i8++) {
                i5 = (int) (i5 + (this.dyn_dtree[i8 * 2] * (5 + Tree.extra_dbits[i8])));
            }
            if (this.matches < this.last_lit / 2) {
            }
        }
        if (this.last_lit != this.lit_bufsize - 1) {
            z = false;
        }
        return z;
    }

    void bi_flush() {
        if (this.bi_valid == 16) {
            put_short(this.bi_buf);
            this.bi_buf = (short) 0;
            this.bi_valid = 0;
        } else if (this.bi_valid < 8) {
        } else {
            put_byte((byte) this.bi_buf);
            this.bi_buf = (short) (this.bi_buf >>> 8);
            this.bi_valid -= 8;
        }
    }

    void bi_windup() {
        if (this.bi_valid > 8) {
            put_short(this.bi_buf);
        } else if (this.bi_valid > 0) {
            put_byte((byte) this.bi_buf);
        }
        this.bi_buf = (short) 0;
        this.bi_valid = 0;
    }

    int build_bl_tree() {
        scan_tree(this.dyn_ltree, this.l_desc.max_code);
        scan_tree(this.dyn_dtree, this.d_desc.max_code);
        this.bl_desc.build_tree(this);
        int i = 18;
        while (i >= 3 && this.bl_tree[(Tree.bl_order[i] * 2) + 1] == 0) {
            i--;
        }
        this.opt_len += ((i + 1) * 3) + 5 + 5 + 4;
        return i;
    }

    void compress_block(short[] sArr, short[] sArr2) {
        int i;
        int i2 = 0;
        if (this.last_lit == 0) {
            send_code(256, sArr);
            this.last_eob_len = sArr[513];
        }
        do {
            int i3 = ((this.pending_buf[this.d_buf + (i2 * 2)] << 8) & MotionEventCompat.ACTION_POINTER_INDEX_MASK) | (this.pending_buf[this.d_buf + (i2 * 2) + 1] & 255);
            int i4 = this.pending_buf[this.l_buf + i2] & 255;
            i = i2 + 1;
            if (i3 == 0) {
                send_code(i4, sArr);
            } else {
                byte b = Tree._length_code[i4];
                send_code(b + 256 + 1, sArr);
                int i5 = Tree.extra_lbits[b];
                if (i5 != 0) {
                    send_bits(i4 - Tree.base_length[b], i5);
                }
                int i6 = i3 - 1;
                int d_code = Tree.d_code(i6);
                send_code(d_code, sArr2);
                int i7 = Tree.extra_dbits[d_code];
                if (i7 != 0) {
                    send_bits(i6 - Tree.base_dist[d_code], i7);
                }
            }
            i2 = i;
        } while (i < this.last_lit);
        send_code(256, sArr);
        this.last_eob_len = sArr[513];
    }

    void copy_block(int i, int i2, boolean z) {
        bi_windup();
        this.last_eob_len = 8;
        if (z) {
            put_short((short) i2);
            put_short((short) (i2 ^ (-1)));
        }
        put_byte(this.window, i, i2);
    }

    /* JADX WARN: Removed duplicated region for block: B:73:0x01c5  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x01cf  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x01d9  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x01e3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    int deflate(ZStream zStream, int i) {
        int i2;
        int i3;
        if (i > 4 || i < 0) {
            i2 = -2;
        } else if (zStream.next_out == null || ((zStream.next_in == null && zStream.avail_in != 0) || (this.status == FINISH_STATE && i != 4))) {
            zStream.msg = z_errmsg[4];
            i2 = -2;
        } else if (zStream.avail_out == 0) {
            zStream.msg = z_errmsg[7];
            i2 = -5;
        } else {
            this.strm = zStream;
            int i4 = this.last_flush;
            this.last_flush = i;
            if (this.status == 42) {
                int i5 = this.w_bits;
                int i6 = ((this.level - 1) & 255) >> 1;
                int i7 = i6;
                if (i6 > 3) {
                    i7 = 3;
                }
                int i8 = ((((i5 - 8) << 4) + 8) << 8) | (i7 << 6);
                int i9 = i8;
                if (this.strstart != 0) {
                    i9 = i8 | 32;
                }
                this.status = BUSY_STATE;
                putShortMSB(i9 + (31 - (i9 % 31)));
                if (this.strstart != 0) {
                    putShortMSB((int) (zStream.adler >>> 16));
                    putShortMSB((int) (zStream.adler & 65535));
                }
                zStream.adler = zStream._adler.adler32(0L, null, 0, 0);
            }
            if (this.pending != 0) {
                zStream.flush_pending();
                if (zStream.avail_out == 0) {
                    this.last_flush = -1;
                    i2 = 0;
                }
                if (this.status == FINISH_STATE || zStream.avail_in == 0) {
                    if (zStream.avail_in == 0 || this.lookahead != 0 || (i != 0 && this.status != FINISH_STATE)) {
                        i3 = -1;
                        switch (config_table[this.level].func) {
                            case 0:
                                i3 = deflate_stored(i);
                                break;
                            case 1:
                                i3 = deflate_fast(i);
                                break;
                            case 2:
                                i3 = deflate_slow(i);
                                break;
                        }
                        if (i3 != 2 || i3 == 3) {
                            this.status = FINISH_STATE;
                        }
                        if (i3 != 0 || i3 == 2) {
                            if (zStream.avail_out == 0) {
                                this.last_flush = -1;
                            }
                            i2 = 0;
                        } else if (i3 == 1) {
                            if (i == 1) {
                                _tr_align();
                            } else {
                                _tr_stored_block(0, 0, false);
                                if (i == 3) {
                                    for (int i10 = 0; i10 < this.hash_size; i10++) {
                                        this.head[i10] = (short) 0;
                                    }
                                }
                            }
                            zStream.flush_pending();
                            if (zStream.avail_out == 0) {
                                this.last_flush = -1;
                                i2 = 0;
                            }
                        }
                    }
                    if (i != 4) {
                        i2 = 0;
                    } else if (this.noheader != 0) {
                        i2 = 1;
                    } else {
                        putShortMSB((int) (zStream.adler >>> 16));
                        putShortMSB((int) (zStream.adler & 65535));
                        zStream.flush_pending();
                        this.noheader = -1;
                        i2 = this.pending != 0 ? 0 : 1;
                    }
                } else {
                    zStream.msg = z_errmsg[7];
                    i2 = -5;
                }
            } else {
                if (zStream.avail_in == 0 && i <= i4 && i != 4) {
                    zStream.msg = z_errmsg[7];
                    i2 = -5;
                }
                if (this.status == FINISH_STATE) {
                }
                if (zStream.avail_in == 0) {
                }
                i3 = -1;
                switch (config_table[this.level].func) {
                }
                if (i3 != 2) {
                }
                this.status = FINISH_STATE;
                if (i3 != 0) {
                }
                if (zStream.avail_out == 0) {
                }
                i2 = 0;
            }
        }
        return i2;
    }

    int deflateEnd() {
        int i;
        if (this.status == 42 || this.status == BUSY_STATE || this.status == FINISH_STATE) {
            this.pending_buf = null;
            this.head = null;
            this.prev = null;
            this.window = null;
            i = this.status == BUSY_STATE ? -3 : 0;
        } else {
            i = -2;
        }
        return i;
    }

    int deflateInit(ZStream zStream, int i) {
        return deflateInit(zStream, i, 15);
    }

    int deflateInit(ZStream zStream, int i, int i2) {
        return deflateInit2(zStream, i, 8, i2, 8, 0);
    }

    int deflateInit2(ZStream zStream, int i, int i2, int i3, int i4, int i5) {
        int i6;
        int i7 = 0;
        zStream.msg = null;
        int i8 = i;
        if (i == -1) {
            i8 = 6;
        }
        int i9 = i3;
        if (i3 < 0) {
            i7 = 1;
            i9 = -i3;
        }
        if (i4 < 1 || i4 > 9 || i2 != 8 || i9 < 9 || i9 > 15 || i8 < 0 || i8 > 9 || i5 < 0 || i5 > 2) {
            i6 = -2;
        } else {
            zStream.dstate = this;
            this.noheader = i7;
            this.w_bits = i9;
            this.w_size = 1 << this.w_bits;
            this.w_mask = this.w_size - 1;
            this.hash_bits = i4 + 7;
            this.hash_size = 1 << this.hash_bits;
            this.hash_mask = this.hash_size - 1;
            this.hash_shift = ((this.hash_bits + 3) - 1) / 3;
            this.window = new byte[this.w_size * 2];
            this.prev = new short[this.w_size];
            this.head = new short[this.hash_size];
            this.lit_bufsize = 1 << (i4 + 6);
            this.pending_buf = new byte[this.lit_bufsize * 4];
            this.pending_buf_size = this.lit_bufsize * 4;
            this.d_buf = this.lit_bufsize / 2;
            this.l_buf = this.lit_bufsize * 3;
            this.level = i8;
            this.strategy = i5;
            this.method = (byte) i2;
            i6 = deflateReset(zStream);
        }
        return i6;
    }

    int deflateParams(ZStream zStream, int i, int i2) {
        int i3;
        int i4 = i;
        if (i == -1) {
            i4 = 6;
        }
        if (i4 < 0 || i4 > 9 || i2 < 0 || i2 > 2) {
            i3 = -2;
        } else {
            i3 = 0;
            if (config_table[this.level].func != config_table[i4].func) {
                i3 = 0;
                if (zStream.total_in != 0) {
                    i3 = zStream.deflate(1);
                }
            }
            if (this.level != i4) {
                this.level = i4;
                this.max_lazy_match = config_table[this.level].max_lazy;
                this.good_match = config_table[this.level].good_length;
                this.nice_match = config_table[this.level].nice_length;
                this.max_chain_length = config_table[this.level].max_chain;
            }
            this.strategy = i2;
        }
        return i3;
    }

    int deflateReset(ZStream zStream) {
        zStream.total_out = 0L;
        zStream.total_in = 0L;
        zStream.msg = null;
        zStream.data_type = 2;
        this.pending = 0;
        this.pending_out = 0;
        if (this.noheader < 0) {
            this.noheader = 0;
        }
        this.status = this.noheader != 0 ? BUSY_STATE : 42;
        zStream.adler = zStream._adler.adler32(0L, null, 0, 0);
        this.last_flush = 0;
        tr_init();
        lm_init();
        return 0;
    }

    int deflateSetDictionary(ZStream zStream, byte[] bArr, int i) {
        int i2;
        if (bArr == null || this.status != 42) {
            i2 = -2;
        } else {
            zStream.adler = zStream._adler.adler32(zStream.adler, bArr, 0, i);
            i2 = 0;
            if (i >= 3) {
                int i3 = 0;
                int i4 = i;
                if (i > this.w_size - MIN_LOOKAHEAD) {
                    i4 = this.w_size - MIN_LOOKAHEAD;
                    i3 = i - i4;
                }
                System.arraycopy(bArr, i3, this.window, 0, i4);
                this.strstart = i4;
                this.block_start = i4;
                this.ins_h = this.window[0] & 255;
                this.ins_h = ((this.ins_h << this.hash_shift) ^ (this.window[1] & 255)) & this.hash_mask;
                int i5 = 0;
                while (true) {
                    i2 = 0;
                    if (i5 > i4 - 3) {
                        break;
                    }
                    this.ins_h = ((this.ins_h << this.hash_shift) ^ (this.window[i5 + 2] & 255)) & this.hash_mask;
                    this.prev[this.w_mask & i5] = this.head[this.ins_h];
                    this.head[this.ins_h] = (short) i5;
                    i5++;
                }
            }
        }
        return i2;
    }

    int deflate_fast(int i) {
        boolean _tr_tally;
        int i2;
        int i3;
        int i4 = 0;
        while (true) {
            if (this.lookahead < MIN_LOOKAHEAD) {
                fill_window();
                if (this.lookahead < MIN_LOOKAHEAD && i == 0) {
                    i2 = 0;
                    break;
                } else if (this.lookahead == 0) {
                    flush_block_only(i == 4);
                    if (this.strm.avail_out == 0) {
                        i2 = 0;
                        if (i == 4) {
                            i2 = 2;
                        }
                    } else {
                        i2 = 1;
                        if (i == 4) {
                            i2 = 3;
                        }
                    }
                }
            }
            int i5 = i4;
            if (this.lookahead >= 3) {
                this.ins_h = ((this.ins_h << this.hash_shift) ^ (this.window[this.strstart + 2] & 255)) & this.hash_mask;
                i5 = this.head[this.ins_h] & 65535;
                this.prev[this.strstart & this.w_mask] = this.head[this.ins_h];
                this.head[this.ins_h] = (short) this.strstart;
            }
            if (i5 != 0 && ((this.strstart - i5) & 65535) <= this.w_size - MIN_LOOKAHEAD && this.strategy != 2) {
                this.match_length = longest_match(i5);
            }
            if (this.match_length >= 3) {
                _tr_tally = _tr_tally(this.strstart - this.match_start, this.match_length - 3);
                this.lookahead -= this.match_length;
                if (this.match_length > this.max_lazy_match || this.lookahead < 3) {
                    this.strstart += this.match_length;
                    this.match_length = 0;
                    this.ins_h = this.window[this.strstart] & 255;
                    this.ins_h = ((this.ins_h << this.hash_shift) ^ (this.window[this.strstart + 1] & 255)) & this.hash_mask;
                } else {
                    this.match_length--;
                    do {
                        this.strstart++;
                        this.ins_h = ((this.ins_h << this.hash_shift) ^ (this.window[this.strstart + 2] & 255)) & this.hash_mask;
                        i5 = this.head[this.ins_h] & 65535;
                        this.prev[this.strstart & this.w_mask] = this.head[this.ins_h];
                        this.head[this.ins_h] = (short) this.strstart;
                        i3 = this.match_length - 1;
                        this.match_length = i3;
                    } while (i3 != 0);
                    this.strstart++;
                }
            } else {
                _tr_tally = _tr_tally(0, this.window[this.strstart] & 255);
                this.lookahead--;
                this.strstart++;
            }
            i4 = i5;
            if (_tr_tally) {
                flush_block_only(false);
                i4 = i5;
                if (this.strm.avail_out == 0) {
                    i2 = 0;
                    break;
                }
            }
        }
        return i2;
    }

    int deflate_slow(int i) {
        int i2;
        int i3;
        int i4;
        int i5 = 0;
        while (true) {
            if (this.lookahead < MIN_LOOKAHEAD) {
                fill_window();
                if (this.lookahead < MIN_LOOKAHEAD && i == 0) {
                    i2 = 0;
                    break;
                } else if (this.lookahead == 0) {
                    if (this.match_available != 0) {
                        _tr_tally(0, this.window[this.strstart - 1] & 255);
                        this.match_available = 0;
                    }
                    flush_block_only(i == 4);
                    if (this.strm.avail_out == 0) {
                        i2 = 0;
                        if (i == 4) {
                            i2 = 2;
                        }
                    } else {
                        i2 = 1;
                        if (i == 4) {
                            i2 = 3;
                        }
                    }
                }
            }
            int i6 = i5;
            if (this.lookahead >= 3) {
                this.ins_h = ((this.ins_h << this.hash_shift) ^ (this.window[this.strstart + 2] & 255)) & this.hash_mask;
                i6 = this.head[this.ins_h] & 65535;
                this.prev[this.strstart & this.w_mask] = this.head[this.ins_h];
                this.head[this.ins_h] = (short) this.strstart;
            }
            this.prev_length = this.match_length;
            this.prev_match = this.match_start;
            this.match_length = 2;
            if (i6 != 0 && this.prev_length < this.max_lazy_match && ((this.strstart - i6) & 65535) <= this.w_size - MIN_LOOKAHEAD) {
                if (this.strategy != 2) {
                    this.match_length = longest_match(i6);
                }
                if (this.match_length <= 5 && (this.strategy == 1 || (this.match_length == 3 && this.strstart - this.match_start > 4096))) {
                    this.match_length = 2;
                }
            }
            if (this.prev_length >= 3 && this.match_length <= this.prev_length) {
                int i7 = this.strstart;
                int i8 = this.lookahead;
                boolean _tr_tally = _tr_tally((this.strstart - 1) - this.prev_match, this.prev_length - 3);
                this.lookahead -= this.prev_length - 1;
                this.prev_length -= 2;
                int i9 = i6;
                do {
                    int i10 = this.strstart + 1;
                    this.strstart = i10;
                    i3 = i9;
                    if (i10 <= (i7 + i8) - 3) {
                        this.ins_h = ((this.ins_h << this.hash_shift) ^ (this.window[this.strstart + 2] & 255)) & this.hash_mask;
                        i3 = this.head[this.ins_h] & 65535;
                        this.prev[this.strstart & this.w_mask] = this.head[this.ins_h];
                        this.head[this.ins_h] = (short) this.strstart;
                    }
                    i4 = this.prev_length - 1;
                    this.prev_length = i4;
                    i9 = i3;
                } while (i4 != 0);
                this.match_available = 0;
                this.match_length = 2;
                this.strstart++;
                i5 = i3;
                if (_tr_tally) {
                    flush_block_only(false);
                    i5 = i3;
                    if (this.strm.avail_out == 0) {
                        i2 = 0;
                        break;
                    }
                } else {
                    continue;
                }
            } else if (this.match_available != 0) {
                if (_tr_tally(0, this.window[this.strstart - 1] & 255)) {
                    flush_block_only(false);
                }
                this.strstart++;
                this.lookahead--;
                i5 = i6;
                if (this.strm.avail_out == 0) {
                    i2 = 0;
                    break;
                }
            } else {
                this.match_available = 1;
                this.strstart++;
                this.lookahead--;
                i5 = i6;
            }
        }
        return i2;
    }

    int deflate_stored(int i) {
        int i2;
        int i3 = 65535;
        if (65535 > this.pending_buf_size - 5) {
            i3 = this.pending_buf_size - 5;
        }
        while (true) {
            if (this.lookahead <= 1) {
                fill_window();
                if (this.lookahead == 0 && i == 0) {
                    i2 = 0;
                    break;
                } else if (this.lookahead == 0) {
                    flush_block_only(i == 4);
                    if (this.strm.avail_out == 0) {
                        i2 = 0;
                        if (i == 4) {
                            i2 = 2;
                        }
                    } else {
                        i2 = 1;
                        if (i == 4) {
                            i2 = 3;
                        }
                    }
                }
            }
            this.strstart += this.lookahead;
            this.lookahead = 0;
            int i4 = this.block_start + i3;
            if (this.strstart == 0 || this.strstart >= i4) {
                this.lookahead = this.strstart - i4;
                this.strstart = i4;
                flush_block_only(false);
                i2 = 0;
                if (this.strm.avail_out == 0) {
                    break;
                }
            }
            if (this.strstart - this.block_start >= this.w_size - MIN_LOOKAHEAD) {
                flush_block_only(false);
                if (this.strm.avail_out == 0) {
                    i2 = 0;
                    break;
                }
            }
        }
        return i2;
    }

    void fill_window() {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        do {
            int i6 = (this.window_size - this.lookahead) - this.strstart;
            if (i6 == 0 && this.strstart == 0 && this.lookahead == 0) {
                i = this.w_size;
            } else if (i6 == -1) {
                i = i6 - 1;
            } else {
                i = i6;
                if (this.strstart >= (this.w_size + this.w_size) - MIN_LOOKAHEAD) {
                    System.arraycopy(this.window, this.w_size, this.window, 0, this.w_size);
                    this.match_start -= this.w_size;
                    this.strstart -= this.w_size;
                    this.block_start -= this.w_size;
                    int i7 = this.hash_size;
                    int i8 = i7;
                    do {
                        int i9 = i8 - 1;
                        this.head[i9] = (this.head[i9] & 65535) >= this.w_size ? (short) (i2 - this.w_size) : (short) 0;
                        i3 = i7 - 1;
                        i7 = i3;
                        i8 = i9;
                    } while (i3 != 0);
                    int i10 = this.w_size;
                    int i11 = i10;
                    do {
                        int i12 = i11 - 1;
                        this.prev[i12] = (this.prev[i12] & 65535) >= this.w_size ? (short) (i4 - this.w_size) : (short) 0;
                        i5 = i10 - 1;
                        i10 = i5;
                        i11 = i12;
                    } while (i5 != 0);
                    i = i6 + this.w_size;
                }
            }
            if (this.strm.avail_in == 0) {
                return;
            }
            this.lookahead += this.strm.read_buf(this.window, this.strstart + this.lookahead, i);
            if (this.lookahead >= 3) {
                this.ins_h = this.window[this.strstart] & 255;
                this.ins_h = ((this.ins_h << this.hash_shift) ^ (this.window[this.strstart + 1] & 255)) & this.hash_mask;
            }
            if (this.lookahead >= MIN_LOOKAHEAD) {
                return;
            }
        } while (this.strm.avail_in != 0);
    }

    void flush_block_only(boolean z) {
        _tr_flush_block(this.block_start >= 0 ? this.block_start : -1, this.strstart - this.block_start, z);
        this.block_start = this.strstart;
        this.strm.flush_pending();
    }

    void init_block() {
        for (int i = 0; i < L_CODES; i++) {
            this.dyn_ltree[i * 2] = (short) 0;
        }
        for (int i2 = 0; i2 < 30; i2++) {
            this.dyn_dtree[i2 * 2] = (short) 0;
        }
        for (int i3 = 0; i3 < 19; i3++) {
            this.bl_tree[i3 * 2] = (short) 0;
        }
        this.dyn_ltree[512] = (short) 1;
        this.static_len = 0;
        this.opt_len = 0;
        this.matches = 0;
        this.last_lit = 0;
    }

    void lm_init() {
        this.window_size = this.w_size * 2;
        this.head[this.hash_size - 1] = (short) 0;
        for (int i = 0; i < this.hash_size - 1; i++) {
            this.head[i] = (short) 0;
        }
        this.max_lazy_match = config_table[this.level].max_lazy;
        this.good_match = config_table[this.level].good_length;
        this.nice_match = config_table[this.level].nice_length;
        this.max_chain_length = config_table[this.level].max_chain;
        this.strstart = 0;
        this.block_start = 0;
        this.lookahead = 0;
        this.prev_length = 2;
        this.match_length = 2;
        this.match_available = 0;
        this.ins_h = 0;
    }

    int longest_match(int i) {
        int i2;
        int i3;
        int i4 = this.max_chain_length;
        int i5 = this.strstart;
        int i6 = this.prev_length;
        int i7 = this.strstart > this.w_size - MIN_LOOKAHEAD ? this.strstart - (this.w_size - MIN_LOOKAHEAD) : 0;
        int i8 = this.nice_match;
        int i9 = this.w_mask;
        int i10 = this.strstart + 258;
        byte b = this.window[(i5 + i6) - 1];
        byte b2 = this.window[i5 + i6];
        int i11 = i4;
        if (this.prev_length >= this.good_match) {
            i11 = i4 >> 2;
        }
        int i12 = i6;
        int i13 = i11;
        int i14 = i8;
        int i15 = i5;
        byte b3 = b2;
        byte b4 = b;
        int i16 = i;
        if (i8 > this.lookahead) {
            i14 = this.lookahead;
            i16 = i;
            b4 = b;
            b3 = b2;
            i15 = i5;
            i13 = i11;
            i12 = i6;
        }
        while (true) {
            int i17 = i12;
            int i18 = i15;
            byte b5 = b3;
            byte b6 = b4;
            if (this.window[i16 + i12] == b3) {
                i17 = i12;
                i18 = i15;
                b5 = b3;
                b6 = b4;
                if (this.window[(i16 + i12) - 1] == b4) {
                    i17 = i12;
                    i18 = i15;
                    b5 = b3;
                    b6 = b4;
                    if (this.window[i16] == this.window[i15]) {
                        int i19 = i16 + 1;
                        if (this.window[i19] == this.window[i15 + 1]) {
                            int i20 = i15 + 2;
                            int i21 = i19 + 1;
                            while (true) {
                                int i22 = i20 + 1;
                                byte b7 = this.window[i22];
                                int i23 = i21 + 1;
                                i3 = i22;
                                if (b7 != this.window[i23]) {
                                    break;
                                }
                                int i24 = i22 + 1;
                                int i25 = i23 + 1;
                                i3 = i24;
                                if (this.window[i24] != this.window[i25]) {
                                    break;
                                }
                                int i26 = i24 + 1;
                                int i27 = i25 + 1;
                                i3 = i26;
                                if (this.window[i26] != this.window[i27]) {
                                    break;
                                }
                                int i28 = i26 + 1;
                                int i29 = i27 + 1;
                                i3 = i28;
                                if (this.window[i28] != this.window[i29]) {
                                    break;
                                }
                                int i30 = i28 + 1;
                                int i31 = i29 + 1;
                                i3 = i30;
                                if (this.window[i30] != this.window[i31]) {
                                    break;
                                }
                                int i32 = i30 + 1;
                                int i33 = i31 + 1;
                                i3 = i32;
                                if (this.window[i32] != this.window[i33]) {
                                    break;
                                }
                                int i34 = i32 + 1;
                                int i35 = i33 + 1;
                                i3 = i34;
                                if (this.window[i34] != this.window[i35]) {
                                    break;
                                }
                                int i36 = i34 + 1;
                                int i37 = i35 + 1;
                                i3 = i36;
                                if (this.window[i36] != this.window[i37]) {
                                    break;
                                }
                                i21 = i37;
                                i20 = i36;
                                if (i36 >= i10) {
                                    i3 = i36;
                                    break;
                                }
                            }
                            int i38 = 258 - (i10 - i3);
                            int i39 = i10 - 258;
                            i17 = i12;
                            i18 = i39;
                            b5 = b3;
                            b6 = b4;
                            if (i38 > i12) {
                                this.match_start = i16;
                                i17 = i38;
                                i2 = i17;
                                if (i38 >= i14) {
                                    break;
                                }
                                b6 = this.window[(i39 + i17) - 1];
                                b5 = this.window[i39 + i17];
                                i18 = i39;
                            }
                        } else {
                            b6 = b4;
                            b5 = b3;
                            i18 = i15;
                            i17 = i12;
                        }
                    }
                }
            }
            i16 = this.prev[i16 & i9] & 65535;
            i2 = i17;
            if (i16 <= i7) {
                break;
            }
            int i40 = i13 - 1;
            i12 = i17;
            i13 = i40;
            i15 = i18;
            b3 = b5;
            b4 = b6;
            if (i40 == 0) {
                i2 = i17;
                break;
            }
        }
        if (i2 > this.lookahead) {
            i2 = this.lookahead;
        }
        return i2;
    }

    void pqdownheap(short[] sArr, int i) {
        int i2;
        int i3 = this.heap[i];
        int i4 = i;
        for (int i5 = i << 1; i5 <= this.heap_len; i5 = i2 << 1) {
            i2 = i5;
            if (i5 < this.heap_len) {
                i2 = i5;
                if (smaller(sArr, this.heap[i5 + 1], this.heap[i5], this.depth)) {
                    i2 = i5 + 1;
                }
            }
            if (smaller(sArr, i3, this.heap[i2], this.depth)) {
                break;
            }
            this.heap[i4] = this.heap[i2];
            i4 = i2;
        }
        this.heap[i4] = i3;
    }

    final void putShortMSB(int i) {
        put_byte((byte) (i >> 8));
        put_byte((byte) i);
    }

    final void put_byte(byte b) {
        byte[] bArr = this.pending_buf;
        int i = this.pending;
        this.pending = i + 1;
        bArr[i] = b;
    }

    final void put_byte(byte[] bArr, int i, int i2) {
        System.arraycopy(bArr, i, this.pending_buf, this.pending, i2);
        this.pending += i2;
    }

    final void put_short(int i) {
        put_byte((byte) i);
        put_byte((byte) (i >>> 8));
    }

    void scan_tree(short[] sArr, int i) {
        short[] sArr2;
        short[] sArr3;
        short[] sArr4;
        short[] sArr5;
        int i2;
        int i3;
        int i4;
        short[] sArr6;
        int i5;
        short s = -1;
        short s2 = sArr[1];
        int i6 = 0;
        int i7 = 7;
        int i8 = 4;
        if (s2 == 0) {
            i7 = 138;
            i8 = 3;
        }
        sArr[((i + 1) * 2) + 1] = (short) (-1);
        int i9 = 0;
        while (i9 <= i) {
            short s3 = sArr[((i9 + 1) * 2) + 1];
            int i10 = i6 + 1;
            if (i10 >= i7 || s2 != s3) {
                if (i10 < i8) {
                    this.bl_tree[s2 * 2] = (short) (sArr6[i5] + i10);
                } else if (s2 != 0) {
                    if (s2 != s) {
                        this.bl_tree[s2 * 2] = (short) (sArr5[i2] + 1);
                    }
                    this.bl_tree[32] = (short) (sArr4[32] + 1);
                } else if (i10 <= 10) {
                    this.bl_tree[34] = (short) (sArr3[34] + 1);
                } else {
                    this.bl_tree[36] = (short) (sArr2[36] + 1);
                }
                i3 = 0;
                s = s2;
                if (s3 == 0) {
                    i7 = 138;
                    i4 = 3;
                } else if (s2 == s3) {
                    i7 = 6;
                    i4 = 3;
                } else {
                    i7 = 7;
                    i4 = 4;
                }
            } else {
                i4 = i8;
                i3 = i10;
            }
            i9++;
            i6 = i3;
            i8 = i4;
            s2 = s3;
        }
    }

    void send_all_trees(int i, int i2, int i3) {
        send_bits(i - 257, 5);
        send_bits(i2 - 1, 5);
        send_bits(i3 - 4, 4);
        for (int i4 = 0; i4 < i3; i4++) {
            send_bits(this.bl_tree[(Tree.bl_order[i4] * 2) + 1], 3);
        }
        send_tree(this.dyn_ltree, i - 1);
        send_tree(this.dyn_dtree, i2 - 1);
    }

    void send_bits(int i, int i2) {
        if (this.bi_valid <= 16 - i2) {
            this.bi_buf = (short) (this.bi_buf | ((i << this.bi_valid) & 65535));
            this.bi_valid += i2;
            return;
        }
        this.bi_buf = (short) (this.bi_buf | ((i << this.bi_valid) & 65535));
        put_short(this.bi_buf);
        this.bi_buf = (short) (i >>> (16 - this.bi_valid));
        this.bi_valid += i2 - 16;
    }

    final void send_code(int i, short[] sArr) {
        int i2 = i * 2;
        send_bits(sArr[i2] & 65535, sArr[i2 + 1] & 65535);
    }

    void send_tree(short[] sArr, int i) {
        int i2;
        int i3;
        short s = -1;
        short s2 = sArr[1];
        int i4 = 7;
        int i5 = 4;
        if (s2 == 0) {
            i4 = 138;
            i5 = 3;
        }
        int i6 = 0;
        int i7 = i5;
        int i8 = 0;
        while (i6 <= i) {
            short s3 = sArr[((i6 + 1) * 2) + 1];
            i8++;
            if (i8 >= i4 || s2 != s3) {
                if (i8 < i7) {
                    do {
                        send_code(s2, this.bl_tree);
                        i3 = i8 - 1;
                        i8 = i3;
                    } while (i3 != 0);
                } else if (s2 != 0) {
                    int i9 = i8;
                    if (s2 != s) {
                        send_code(s2, this.bl_tree);
                        i9 = i8 - 1;
                    }
                    send_code(16, this.bl_tree);
                    send_bits(i9 - 3, 2);
                } else if (i8 <= 10) {
                    send_code(17, this.bl_tree);
                    send_bits(i8 - 3, 3);
                } else {
                    send_code(18, this.bl_tree);
                    send_bits(i8 - 11, 7);
                }
                i8 = 0;
                s = s2;
                if (s3 == 0) {
                    i4 = 138;
                    i2 = 3;
                } else if (s2 == s3) {
                    i4 = 6;
                    i2 = 3;
                } else {
                    i4 = 7;
                    i2 = 4;
                }
            } else {
                i2 = i7;
            }
            i6++;
            i7 = i2;
            s2 = s3;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v15, types: [int] */
    /* JADX WARN: Type inference failed for: r0v17, types: [int] */
    /* JADX WARN: Type inference failed for: r0v19, types: [int] */
    void set_data_type() {
        short s;
        int i;
        short s2;
        int i2;
        int i3 = 0;
        short s3 = 0;
        while (true) {
            s = 0;
            i = i3;
            if (i3 < 7) {
                s3 += this.dyn_ltree[i3 * 2];
                i3++;
            }
        }
        while (true) {
            s2 = s3;
            if (i < 128) {
                s += this.dyn_ltree[i * 2];
                i++;
            }
        }
        for (i2 = i; i2 < 256; i2++) {
            s2 += this.dyn_ltree[i2 * 2];
        }
        this.data_type = (byte) (s2 > (s >>> 2) ? 0 : 1);
    }

    void tr_init() {
        this.l_desc.dyn_tree = this.dyn_ltree;
        this.l_desc.stat_desc = StaticTree.static_l_desc;
        this.d_desc.dyn_tree = this.dyn_dtree;
        this.d_desc.stat_desc = StaticTree.static_d_desc;
        this.bl_desc.dyn_tree = this.bl_tree;
        this.bl_desc.stat_desc = StaticTree.static_bl_desc;
        this.bi_buf = (short) 0;
        this.bi_valid = 0;
        this.last_eob_len = 8;
        init_block();
    }
}
