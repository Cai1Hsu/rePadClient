package com.jcraft.jzlib;

import android.support.v4.app.FragmentTransaction;
import android.support.v4.media.TransportMediator;
import android.support.v4.view.InputDeviceCompat;
import org.apache.commons.compress.archivers.tar.TarConstants;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.commons.net.imap.IMAP;
import org.apache.commons.net.nntp.NNTP;
import org.apache.commons.net.nntp.NNTPReply;
import org.apache.commons.net.telnet.TelnetCommand;
import org.apache.http.HttpStatus;

/* loaded from: classes.jar:com/jcraft/jzlib/InfTree.class */
final class InfTree {
    static final int BMAX = 15;
    private static final int MANY = 1440;
    private static final int Z_BUF_ERROR = -5;
    private static final int Z_DATA_ERROR = -3;
    private static final int Z_ERRNO = -1;
    private static final int Z_MEM_ERROR = -4;
    private static final int Z_NEED_DICT = 2;
    private static final int Z_OK = 0;
    private static final int Z_STREAM_END = 1;
    private static final int Z_STREAM_ERROR = -2;
    private static final int Z_VERSION_ERROR = -6;
    static final int fixed_bd = 5;
    static final int fixed_bl = 9;
    static final int[] fixed_tl = {96, 7, 256, 0, 8, 80, 0, 8, 16, 84, 8, 115, 82, 7, 31, 0, 8, 112, 0, 8, 48, 0, 9, 192, 80, 7, 10, 0, 8, 96, 0, 8, 32, 0, 9, 160, 0, 8, 0, 0, 8, 128, 0, 8, 64, 0, 9, 224, 80, 7, 6, 0, 8, 88, 0, 8, 24, 0, 9, 144, 83, 7, 59, 0, 8, 120, 0, 8, 56, 0, 9, 208, 81, 7, 17, 0, 8, 104, 0, 8, 40, 0, 9, 176, 0, 8, 8, 0, 8, 136, 0, 8, 72, 0, 9, 240, 80, 7, 4, 0, 8, 84, 0, 8, 20, 85, 8, FTPReply.ENTERING_PASSIVE_MODE, 83, 7, 43, 0, 8, 116, 0, 8, 52, 0, 9, 200, 81, 7, 13, 0, 8, 100, 0, 8, 36, 0, 9, 168, 0, 8, 4, 0, 8, 132, 0, 8, 68, 0, 9, 232, 80, 7, 8, 0, 8, 92, 0, 8, 28, 0, 9, 152, 84, 7, 83, 0, 8, 124, 0, 8, 60, 0, 9, 216, 82, 7, 23, 0, 8, 108, 0, 8, 44, 0, 9, 184, 0, 8, 12, 0, 8, 140, 0, 8, 76, 0, 9, TelnetCommand.EL, 80, 7, 3, 0, 8, 82, 0, 8, 18, 85, 8, 163, 83, 7, 35, 0, 8, 114, 0, 8, 50, 0, 9, 196, 81, 7, 11, 0, 8, 98, 0, 8, 34, 0, 9, 164, 0, 8, 2, 0, 8, TransportMediator.KEYCODE_MEDIA_RECORD, 0, 8, 66, 0, 9, 228, 80, 7, 7, 0, 8, 90, 0, 8, 26, 0, 9, 148, 84, 7, 67, 0, 8, 122, 0, 8, 58, 0, 9, FTPReply.DIRECTORY_STATUS, 82, 7, 19, 0, 8, 106, 0, 8, 42, 0, 9, 180, 0, 8, 10, 0, 8, 138, 0, 8, 74, 0, 9, TelnetCommand.IP, 80, 7, 5, 0, 8, 86, 0, 8, 22, 192, 8, 0, 83, 7, 51, 0, 8, 118, 0, 8, 54, 0, 9, HttpStatus.SC_NO_CONTENT, 81, 7, 15, 0, 8, HttpStatus.SC_PROCESSING, 0, 8, 38, 0, 9, 172, 0, 8, 6, 0, 8, 134, 0, 8, 70, 0, 9, TelnetCommand.EOF, 80, 7, 9, 0, 8, 94, 0, 8, 30, 0, 9, 156, 84, 7, 99, 0, 8, TransportMediator.KEYCODE_MEDIA_PLAY, 0, 8, 62, 0, 9, 220, 82, 7, 27, 0, 8, 110, 0, 8, 46, 0, 9, 188, 0, 8, 14, 0, 8, 142, 0, 8, 78, 0, 9, TelnetCommand.WONT, 96, 7, 256, 0, 8, 81, 0, 8, 17, 85, 8, 131, 82, 7, 31, 0, 8, 113, 0, 8, 49, 0, 9, 194, 80, 7, 10, 0, 8, 97, 0, 8, 33, 0, 9, 162, 0, 8, 1, 0, 8, 129, 0, 8, 65, 0, 9, FTPReply.CLOSING_DATA_CONNECTION, 80, 7, 6, 0, 8, 89, 0, 8, 25, 0, 9, 146, 83, 7, 59, 0, 8, 121, 0, 8, 57, 0, 9, 210, 81, 7, 17, 0, 8, 105, 0, 8, 41, 0, 9, 178, 0, 8, 9, 0, 8, 137, 0, 8, 73, 0, 9, 242, 80, 7, 4, 0, 8, 85, 0, 8, 21, 80, 8, 258, 83, 7, 43, 0, 8, 117, 0, 8, 53, 0, 9, 202, 81, 7, 13, 0, 8, HttpStatus.SC_SWITCHING_PROTOCOLS, 0, 8, 37, 0, 9, 170, 0, 8, 5, 0, 8, 133, 0, 8, 69, 0, 9, FTPReply.SECURITY_DATA_EXCHANGE_COMPLETE, 80, 7, 8, 0, 8, 93, 0, 8, 29, 0, 9, 154, 84, 7, 83, 0, 8, FTPReply.DATA_CONNECTION_ALREADY_OPEN, 0, 8, 61, 0, 9, 218, 82, 7, 23, 0, 8, 109, 0, 8, 45, 0, 9, 186, 0, 8, 13, 0, 8, 141, 0, 8, 77, 0, 9, 250, 80, 7, 3, 0, 8, 83, 0, 8, 19, 85, 8, 195, 83, 7, 35, 0, 8, 115, 0, 8, 51, 0, 9, 198, 81, 7, 11, 0, 8, 99, 0, 8, 35, 0, 9, 166, 0, 8, 3, 0, 8, 131, 0, 8, 67, 0, 9, 230, 80, 7, 7, 0, 8, 91, 0, 8, 27, 0, 9, FTPReply.FILE_STATUS_OK, 84, 7, 67, 0, 8, 123, 0, 8, 59, 0, 9, 214, 82, 7, 19, 0, 8, 107, 0, 8, 43, 0, 9, 182, 0, 8, 11, 0, 8, 139, 0, 8, 75, 0, 9, TelnetCommand.AYT, 80, 7, 5, 0, 8, 87, 0, 8, 23, 192, 8, 0, 83, 7, 51, 0, 8, NNTP.DEFAULT_PORT, 0, 8, 55, 0, 9, HttpStatus.SC_PARTIAL_CONTENT, 81, 7, 15, 0, 8, TarConstants.LF_PAX_GLOBAL_EXTENDED_HEADER, 0, 8, 39, 0, 9, 174, 0, 8, 7, 0, 8, 135, 0, 8, 71, 0, 9, TelnetCommand.ABORT, 80, 7, 9, 0, 8, 95, 0, 8, 31, 0, 9, 158, 84, 7, 99, 0, 8, 127, 0, 8, 63, 0, 9, NNTPReply.ARTICLE_RETRIEVED_BODY_FOLLOWS, 82, 7, 27, 0, 8, 111, 0, 8, 47, 0, 9, 190, 0, 8, 15, 0, 8, IMAP.DEFAULT_PORT, 0, 8, 79, 0, 9, TelnetCommand.DONT, 96, 7, 256, 0, 8, 80, 0, 8, 16, 84, 8, 115, 82, 7, 31, 0, 8, 112, 0, 8, 48, 0, 9, 193, 80, 7, 10, 0, 8, 96, 0, 8, 32, 0, 9, 161, 0, 8, 0, 0, 8, 128, 0, 8, 64, 0, 9, FTPReply.DATA_CONNECTION_OPEN, 80, 7, 6, 0, 8, 88, 0, 8, 24, 0, 9, 145, 83, 7, 59, 0, 8, 120, 0, 8, 56, 0, 9, 209, 81, 7, 17, 0, 8, 104, 0, 8, 40, 0, 9, 177, 0, 8, 8, 0, 8, 136, 0, 8, 72, 0, 9, TelnetCommand.NOP, 80, 7, 4, 0, 8, 84, 0, 8, 20, 85, 8, FTPReply.ENTERING_PASSIVE_MODE, 83, 7, 43, 0, 8, 116, 0, 8, 52, 0, 9, 201, 81, 7, 13, 0, 8, 100, 0, 8, 36, 0, 9, 169, 0, 8, 4, 0, 8, 132, 0, 8, 68, 0, 9, 233, 80, 7, 8, 0, 8, 92, 0, 8, 28, 0, 9, 153, 84, 7, 83, 0, 8, 124, 0, 8, 60, 0, 9, 217, 82, 7, 23, 0, 8, 108, 0, 8, 44, 0, 9, 185, 0, 8, 12, 0, 8, 140, 0, 8, 76, 0, 9, TelnetCommand.GA, 80, 7, 3, 0, 8, 82, 0, 8, 18, 85, 8, 163, 83, 7, 35, 0, 8, 114, 0, 8, 50, 0, 9, 197, 81, 7, 11, 0, 8, 98, 0, 8, 34, 0, 9, 165, 0, 8, 2, 0, 
    8, TransportMediator.KEYCODE_MEDIA_RECORD, 0, 8, 66, 0, 9, FTPReply.ENTERING_EPSV_MODE, 80, 7, 7, 0, 8, 90, 0, 8, 26, 0, 9, 149, 84, 7, 67, 0, 8, 122, 0, 8, 58, 0, 9, FTPReply.FILE_STATUS, 82, 7, 19, 0, 8, 106, 0, 8, 42, 0, 9, 181, 0, 8, 10, 0, 8, 138, 0, 8, 74, 0, 9, TelnetCommand.AO, 80, 7, 5, 0, 8, 86, 0, 8, 22, 192, 8, 0, 83, 7, 51, 0, 8, 118, 0, 8, 54, 0, 9, 205, 81, 7, 15, 0, 8, HttpStatus.SC_PROCESSING, 0, 8, 38, 0, 9, 173, 0, 8, 6, 0, 8, 134, 0, 8, 70, 0, 9, TelnetCommand.SUSP, 80, 7, 9, 0, 8, 94, 0, 8, 30, 0, 9, 157, 84, 7, 99, 0, 8, TransportMediator.KEYCODE_MEDIA_PLAY, 0, 8, 62, 0, 9, 221, 82, 7, 27, 0, 8, 110, 0, 8, 46, 0, 9, 189, 0, 8, 14, 0, 8, 142, 0, 8, 78, 0, 9, TelnetCommand.DO, 96, 7, 256, 0, 8, 81, 0, 8, 17, 85, 8, 131, 82, 7, 31, 0, 8, 113, 0, 8, 49, 0, 9, 195, 80, 7, 10, 0, 8, 97, 0, 8, 33, 0, 9, 163, 0, 8, 1, 0, 8, 129, 0, 8, 65, 0, 9, FTPReply.ENTERING_PASSIVE_MODE, 80, 7, 6, 0, 8, 89, 0, 8, 25, 0, 9, 147, 83, 7, 59, 0, 8, 121, 0, 8, 57, 0, 9, 211, 81, 7, 17, 0, 8, 105, 0, 8, 41, 0, 9, 179, 0, 8, 9, 0, 8, 137, 0, 8, 73, 0, 9, TelnetCommand.BREAK, 80, 7, 4, 0, 8, 85, 0, 8, 21, 80, 8, 258, 83, 7, 43, 0, 8, 117, 0, 8, 53, 0, 9, HttpStatus.SC_NON_AUTHORITATIVE_INFORMATION, 81, 7, 13, 0, 8, HttpStatus.SC_SWITCHING_PROTOCOLS, 0, 8, 37, 0, 9, 171, 0, 8, 5, 0, 8, 133, 0, 8, 69, 0, 9, 235, 80, 7, 8, 0, 8, 93, 0, 8, 29, 0, 9, TarConstants.PREFIXLEN, 84, 7, 83, 0, 8, FTPReply.DATA_CONNECTION_ALREADY_OPEN, 0, 8, 61, 0, 9, 219, 82, 7, 23, 0, 8, 109, 0, 8, 45, 0, 9, 187, 0, 8, 13, 0, 8, 141, 0, 8, 77, 0, 9, 251, 80, 7, 3, 0, 8, 83, 0, 8, 19, 85, 8, 195, 83, 7, 35, 0, 8, 115, 0, 8, 51, 0, 9, NNTPReply.DEBUG_OUTPUT, 81, 7, 11, 0, 8, 99, 0, 8, 35, 0, 9, 167, 0, 8, 3, 0, 8, 131, 0, 8, 67, 0, 9, NNTPReply.NEW_NEWSGROUP_LIST_FOLLOWS, 80, 7, 7, 0, 8, 91, 0, 8, 27, 0, 9, 151, 84, 7, 67, 0, 8, 123, 0, 8, 59, 0, 9, FTPReply.NAME_SYSTEM_TYPE, 82, 7, 19, 0, 8, 107, 0, 8, 43, 0, 9, 183, 0, 8, 11, 0, 8, 139, 0, 8, 75, 0, 9, TelnetCommand.EC, 80, 7, 5, 0, 8, 87, 0, 8, 23, 192, 8, 0, 83, 7, 51, 0, 8, NNTP.DEFAULT_PORT, 0, 8, 55, 0, 9, HttpStatus.SC_MULTI_STATUS, 81, 7, 15, 0, 8, TarConstants.LF_PAX_GLOBAL_EXTENDED_HEADER, 0, 8, 39, 0, 9, 175, 0, 8, 7, 0, 8, 135, 0, 8, 71, 0, 9, TelnetCommand.EOR, 80, 7, 9, 0, 8, 95, 0, 8, 31, 0, 9, 159, 84, 7, 99, 0, 8, 127, 0, 8, 63, 0, 9, NNTPReply.ARTICLE_RETRIEVED_REQUEST_TEXT_SEPARATELY, 82, 7, 27, 0, 8, 111, 0, 8, 47, 0, 9, 191, 0, 8, 15, 0, 8, IMAP.DEFAULT_PORT, 0, 8, 79, 0, 9, 255};
    static final int[] fixed_td = {80, 5, 1, 87, 5, 257, 83, 5, 17, 91, 5, FragmentTransaction.TRANSIT_FRAGMENT_OPEN, 81, 5, 5, 89, 5, InputDeviceCompat.SOURCE_GAMEPAD, 85, 5, 65, 93, 5, 16385, 80, 5, 3, 88, 5, 513, 84, 5, 33, 92, 5, 8193, 82, 5, 9, 90, 5, 2049, 86, 5, 129, 192, 5, 24577, 80, 5, 2, 87, 5, 385, 83, 5, 25, 91, 5, 6145, 81, 5, 7, 89, 5, 1537, 85, 5, 97, 93, 5, 24577, 80, 5, 4, 88, 5, 769, 84, 5, 49, 92, 5, 12289, 82, 5, 13, 90, 5, 3073, 86, 5, 193, 192, 5, 24577};
    static final int[] cplens = {3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 15, 17, 19, 23, 27, 31, 35, 43, 51, 59, 67, 83, 99, 115, 131, 163, 195, FTPReply.ENTERING_PASSIVE_MODE, 258, 0, 0};
    static final int[] cplext = {0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 0, 112, 112};
    static final int[] cpdist = {1, 2, 3, 4, 5, 7, 9, 13, 17, 25, 33, 49, 65, 97, 129, 193, 257, 385, 513, 769, InputDeviceCompat.SOURCE_GAMEPAD, 1537, 2049, 3073, FragmentTransaction.TRANSIT_FRAGMENT_OPEN, 6145, 8193, 12289, 16385, 24577};
    static final int[] cpdext = {0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13};
    int[] hn = null;
    int[] v = null;
    int[] c = null;
    int[] r = null;
    int[] u = null;
    int[] x = null;

    InfTree() {
    }

    private int huft_build(int[] iArr, int i, int i2, int i3, int[] iArr2, int[] iArr3, int[] iArr4, int[] iArr5, int[] iArr6, int[] iArr7, int[] iArr8) {
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        int i10 = 0;
        int i11 = i2;
        do {
            int[] iArr9 = this.c;
            int i12 = iArr[i + i10];
            iArr9[i12] = iArr9[i12] + 1;
            i10++;
            i4 = i11 - 1;
            i11 = i4;
        } while (i4 != 0);
        if (this.c[0] == i2) {
            iArr4[0] = -1;
            iArr5[0] = 0;
            i6 = 0;
        } else {
            int i13 = iArr5[0];
            int i14 = 1;
            while (i14 <= 15 && this.c[i14] == 0) {
                i14++;
            }
            int i15 = i14;
            int i16 = i13;
            if (i13 < i14) {
                i16 = i14;
            }
            int i17 = 15;
            while (i17 != 0 && this.c[i17] == 0) {
                i17--;
            }
            int i18 = i16;
            if (i16 > i17) {
                i18 = i17;
            }
            iArr5[0] = i18;
            int i19 = 1;
            int i20 = i14;
            while (true) {
                int i21 = i19 << i20;
                if (i14 < i17) {
                    int i22 = i21 - this.c[i14];
                    if (i22 < 0) {
                        i6 = -3;
                        break;
                    }
                    i14++;
                    i19 = i22;
                    i20 = 1;
                } else {
                    int i23 = i21 - this.c[i17];
                    if (i23 < 0) {
                        i6 = -3;
                    } else {
                        int[] iArr10 = this.c;
                        iArr10[i17] = iArr10[i17] + i23;
                        int i24 = 0;
                        this.x[1] = 0;
                        int i25 = 1;
                        int i26 = 2;
                        int i27 = i17;
                        while (true) {
                            i27--;
                            if (i27 == 0) {
                                break;
                            }
                            int[] iArr11 = this.x;
                            i24 += this.c[i25];
                            iArr11[i26] = i24;
                            i26++;
                            i25++;
                        }
                        int i28 = 0;
                        int i29 = 0;
                        do {
                            int i30 = iArr[i + i29];
                            if (i30 != 0) {
                                int[] iArr12 = this.x;
                                int i31 = iArr12[i30];
                                iArr12[i30] = i31 + 1;
                                iArr8[i31] = i28;
                            }
                            i29++;
                            i5 = i28 + 1;
                            i28 = i5;
                        } while (i5 < i2);
                        int i32 = this.x[i17];
                        int i33 = 0;
                        this.x[0] = 0;
                        int i34 = 0;
                        int i35 = -1;
                        int i36 = -i18;
                        this.u[0] = 0;
                        int i37 = 0;
                        int i38 = 0;
                        int i39 = i15;
                        loop6: while (true) {
                            if (i39 <= i17) {
                                i7 = i36;
                                i8 = i37;
                                int i40 = this.c[i39];
                                while (true) {
                                    int i41 = i40 - 1;
                                    if (i40 != 0) {
                                        while (i39 > i7 + i18) {
                                            int i42 = i35 + 1;
                                            int i43 = i7 + i18;
                                            int i44 = i17 - i43;
                                            int i45 = i44;
                                            if (i44 > i18) {
                                                i45 = i18;
                                            }
                                            int i46 = i39 - i43;
                                            int i47 = 1 << i46;
                                            int i48 = i46;
                                            if (i47 > i41 + 1) {
                                                int i49 = i47 - (i41 + 1);
                                                int i50 = i39;
                                                i48 = i46;
                                                if (i46 < i45) {
                                                    while (true) {
                                                        i46++;
                                                        i48 = i46;
                                                        if (i46 >= i45) {
                                                            break;
                                                        }
                                                        int i51 = i49 << 1;
                                                        i50++;
                                                        if (i51 <= this.c[i50]) {
                                                            i48 = i46;
                                                            break;
                                                        }
                                                        i49 = i51 - this.c[i50];
                                                    }
                                                }
                                            }
                                            i38 = 1 << i48;
                                            if (iArr7[0] + i38 > MANY) {
                                                i6 = -3;
                                                break loop6;
                                            }
                                            int[] iArr13 = this.u;
                                            i8 = iArr7[0];
                                            iArr13[i42] = i8;
                                            iArr7[0] = iArr7[0] + i38;
                                            if (i42 != 0) {
                                                this.x[i42] = i33;
                                                this.r[0] = (byte) i48;
                                                this.r[1] = (byte) i18;
                                                int i52 = i33 >>> (i43 - i18);
                                                this.r[2] = (i8 - this.u[i42 - 1]) - i52;
                                                System.arraycopy(this.r, 0, iArr6, (this.u[i42 - 1] + i52) * 3, 3);
                                                i35 = i42;
                                                i7 = i43;
                                            } else {
                                                iArr4[0] = i8;
                                                i35 = i42;
                                                i7 = i43;
                                            }
                                        }
                                        this.r[1] = (byte) (i39 - i7);
                                        if (i34 >= i32) {
                                            this.r[0] = 192;
                                        } else if (iArr8[i34] < i3) {
                                            this.r[0] = (byte) (iArr8[i34] < 256 ? 0 : 96);
                                            this.r[2] = iArr8[i34];
                                            i34++;
                                        } else {
                                            this.r[0] = (byte) (iArr3[iArr8[i34] - i3] + 16 + 64);
                                            this.r[2] = iArr2[iArr8[i34] - i3];
                                            i34++;
                                        }
                                        int i53 = i33 >>> i7;
                                        while (true) {
                                            int i54 = i53;
                                            if (i54 >= i38) {
                                                break;
                                            }
                                            System.arraycopy(this.r, 0, iArr6, (i8 + i54) * 3, 3);
                                            i53 = i54 + (1 << (i39 - i7));
                                        }
                                        int i55 = 1 << (i39 - 1);
                                        while (true) {
                                            i9 = i55;
                                            if ((i33 & i9) == 0) {
                                                break;
                                            }
                                            i33 ^= i9;
                                            i55 = i9 >>> 1;
                                        }
                                        int i56 = i33 ^ i9;
                                        while ((i56 & ((1 << i7) - 1)) != this.x[i35]) {
                                            i35--;
                                            i7 -= i18;
                                        }
                                        i40 = i41;
                                        i33 = i56;
                                    }
                                }
                            } else {
                                i6 = (i23 == 0 || i17 == 1) ? 0 : -5;
                            }
                            i39++;
                            i37 = i8;
                            i36 = i7;
                        }
                    }
                }
            }
        }
        return i6;
    }

    static int inflate_trees_fixed(int[] iArr, int[] iArr2, int[][] iArr3, int[][] iArr4, ZStream zStream) {
        iArr[0] = 9;
        iArr2[0] = 5;
        iArr3[0] = fixed_tl;
        iArr4[0] = fixed_td;
        return 0;
    }

    private void initWorkArea(int i) {
        if (this.hn == null) {
            this.hn = new int[1];
            this.v = new int[i];
            this.c = new int[16];
            this.r = new int[3];
            this.u = new int[15];
            this.x = new int[16];
        }
        if (this.v.length < i) {
            this.v = new int[i];
        }
        for (int i2 = 0; i2 < i; i2++) {
            this.v[i2] = 0;
        }
        for (int i3 = 0; i3 < 16; i3++) {
            this.c[i3] = 0;
        }
        for (int i4 = 0; i4 < 3; i4++) {
            this.r[i4] = 0;
        }
        System.arraycopy(this.c, 0, this.u, 0, 15);
        System.arraycopy(this.c, 0, this.x, 0, 16);
    }

    int inflate_trees_bits(int[] iArr, int[] iArr2, int[] iArr3, int[] iArr4, ZStream zStream) {
        initWorkArea(19);
        this.hn[0] = 0;
        int huft_build = huft_build(iArr, 0, 19, 19, null, null, iArr3, iArr2, iArr4, this.hn, this.v);
        if (huft_build == -3) {
            zStream.msg = "oversubscribed dynamic bit lengths tree";
        } else if (huft_build == -5 || iArr2[0] == 0) {
            zStream.msg = "incomplete dynamic bit lengths tree";
            huft_build = -3;
        }
        return huft_build;
    }

    int inflate_trees_dynamic(int i, int i2, int[] iArr, int[] iArr2, int[] iArr3, int[] iArr4, int[] iArr5, int[] iArr6, ZStream zStream) {
        int i3;
        initWorkArea(288);
        this.hn[0] = 0;
        int huft_build = huft_build(iArr, 0, i, 257, cplens, cplext, iArr4, iArr2, iArr6, this.hn, this.v);
        if (huft_build == 0 && iArr2[0] != 0) {
            initWorkArea(288);
            int huft_build2 = huft_build(iArr, i, i2, 0, cpdist, cpdext, iArr5, iArr3, iArr6, this.hn, this.v);
            if (huft_build2 == 0 && (iArr3[0] != 0 || i <= 257)) {
                i3 = 0;
            } else if (huft_build2 == -3) {
                zStream.msg = "oversubscribed distance tree";
                i3 = huft_build2;
            } else if (huft_build2 == -5) {
                zStream.msg = "incomplete distance tree";
                i3 = -3;
            } else {
                i3 = huft_build2;
                if (huft_build2 != -4) {
                    zStream.msg = "empty distance tree with lengths";
                    i3 = -3;
                }
            }
        } else if (huft_build == -3) {
            zStream.msg = "oversubscribed literal/length tree";
            i3 = huft_build;
        } else {
            i3 = huft_build;
            if (huft_build != -4) {
                zStream.msg = "incomplete literal/length tree";
                i3 = -3;
            }
        }
        return i3;
    }
}
