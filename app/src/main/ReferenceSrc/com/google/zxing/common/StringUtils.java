package com.google.zxing.common;

import com.google.zxing.DecodeHintType;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/common/StringUtils.class */
public final class StringUtils {
    private static final boolean ASSUME_SHIFT_JIS;
    private static final String EUC_JP = "EUC_JP";
    public static final String GB2312 = "GB2312";
    private static final String ISO88591 = "ISO8859_1";
    private static final String PLATFORM_DEFAULT_ENCODING = System.getProperty("file.encoding");
    public static final String SHIFT_JIS = "SJIS";
    private static final String UTF8 = "UTF8";

    static {
        ASSUME_SHIFT_JIS = SHIFT_JIS.equalsIgnoreCase(PLATFORM_DEFAULT_ENCODING) || EUC_JP.equalsIgnoreCase(PLATFORM_DEFAULT_ENCODING);
    }

    private StringUtils() {
    }

    /* JADX WARN: Code restructure failed: missing block: B:37:0x00bb, code lost:
        if (r0 == 195) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0107, code lost:
        if (r0 >= 128) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x0176, code lost:
        if (r0 == 160) goto L73;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String guessEncoding(byte[] bArr, Map<DecodeHintType, ?> map) {
        String str;
        boolean z;
        boolean z2;
        int i;
        boolean z3;
        boolean z4;
        String str2;
        if (map != null && (str2 = (String) map.get(DecodeHintType.CHARACTER_SET)) != null) {
            str = str2;
        } else if (bArr.length > 3 && bArr[0] == -17 && bArr[1] == -69 && bArr[2] == -65) {
            str = UTF8;
        } else {
            int length = bArr.length;
            boolean z5 = true;
            boolean z6 = true;
            boolean z7 = true;
            int i2 = 0;
            int i3 = 0;
            int i4 = 0;
            boolean z8 = false;
            boolean z9 = false;
            boolean z10 = false;
            int i5 = 0;
            while (i5 < length && (z5 || z6 || z7)) {
                int i6 = bArr[i5] & 255;
                if (i6 < 128 || i6 > 191) {
                    if (i2 > 0) {
                        z7 = false;
                    }
                    z = z7;
                    z2 = z9;
                    i = i2;
                    if (i6 >= 192) {
                        z = z7;
                        z2 = z9;
                        i = i2;
                        if (i6 <= 253) {
                            int i7 = i6;
                            while (true) {
                                int i8 = i7;
                                z = z7;
                                z2 = true;
                                i = i2;
                                if ((i8 & 64) == 0) {
                                    break;
                                }
                                i2++;
                                i7 = i8 << 1;
                            }
                        }
                    }
                } else {
                    z = z7;
                    z2 = z9;
                    i = i2;
                    if (i2 > 0) {
                        i = i2 - 1;
                        z2 = z9;
                        z = z7;
                    }
                }
                if (i6 != 194) {
                    z3 = z8;
                }
                z3 = z8;
                if (i5 < length - 1) {
                    int i9 = bArr[i5 + 1] & 255;
                    z3 = z8;
                    if (i9 <= 191) {
                        if (i6 != 194 || i9 < 160) {
                            z3 = z8;
                            if (i6 == 195) {
                                z3 = z8;
                            }
                        }
                        z3 = true;
                    }
                }
                boolean z11 = z5;
                if (i6 >= 127) {
                    z11 = z5;
                    if (i6 <= 159) {
                        z11 = false;
                    }
                }
                int i10 = i4;
                if (i6 >= 161) {
                    i10 = i4;
                    if (i6 <= 223) {
                        i10 = i4;
                        if (!z10) {
                            i10 = i4 + 1;
                        }
                    }
                }
                boolean z12 = z6;
                if (!z10) {
                    if ((i6 < 240 || i6 > 255) && i6 != 128) {
                        z12 = z6;
                    }
                    z12 = false;
                }
                if ((i6 < 129 || i6 > 159) && (i6 < 224 || i6 > 239)) {
                    z4 = false;
                } else if (z10) {
                    z4 = false;
                } else {
                    z4 = true;
                    if (i5 >= bArr.length - 1) {
                        z12 = false;
                    } else {
                        int i11 = bArr[i5 + 1] & 255;
                        if (i11 < 64 || i11 > 252) {
                            z12 = false;
                        } else {
                            i3++;
                        }
                    }
                }
                i5++;
                z5 = z11;
                z6 = z12;
                z7 = z;
                z10 = z4;
                i4 = i10;
                z8 = z3;
                z9 = z2;
                i2 = i;
            }
            if (i2 > 0) {
                z7 = false;
            }
            str = (!z6 || !ASSUME_SHIFT_JIS) ? (!z7 || !z9) ? (!z6 || (i3 < 3 && i4 * 20 <= length)) ? (z8 || !z5) ? PLATFORM_DEFAULT_ENCODING : ISO88591 : SHIFT_JIS : UTF8 : SHIFT_JIS;
        }
        return str;
    }
}
