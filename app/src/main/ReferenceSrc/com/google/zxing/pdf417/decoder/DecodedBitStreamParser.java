package com.google.zxing.pdf417.decoder;

import com.google.zxing.FormatException;
import com.google.zxing.common.DecoderResult;
import java.math.BigInteger;

/* loaded from: classes.jar:com/google/zxing/pdf417/decoder/DecodedBitStreamParser.class */
final class DecodedBitStreamParser {
    private static final int AL = 28;
    private static final int AS = 27;
    private static final int BEGIN_MACRO_PDF417_CONTROL_BLOCK = 928;
    private static final int BEGIN_MACRO_PDF417_OPTIONAL_FIELD = 923;
    private static final int BYTE_COMPACTION_MODE_LATCH = 901;
    private static final int BYTE_COMPACTION_MODE_LATCH_6 = 924;
    private static final int LL = 27;
    private static final int MACRO_PDF417_TERMINATOR = 922;
    private static final int MAX_NUMERIC_CODEWORDS = 15;
    private static final int ML = 28;
    private static final int MODE_SHIFT_TO_BYTE_COMPACTION_MODE = 913;
    private static final int NUMERIC_COMPACTION_MODE_LATCH = 902;
    private static final int PAL = 29;
    private static final int PL = 25;
    private static final int PS = 29;
    private static final int TEXT_COMPACTION_MODE_LATCH = 900;
    private static final char[] PUNCT_CHARS = {';', '<', '>', '@', '[', '\\', '}', '_', '`', '~', '!', '\r', '\t', ',', ':', '\n', '-', '.', '$', '/', '\"', '|', '*', '(', ')', '?', '{', '}', '\''};
    private static final char[] MIXED_CHARS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '&', '\r', '\t', ',', ':', '#', '-', '.', '$', '/', '+', '%', '*', '=', '^'};
    private static final BigInteger[] EXP900 = new BigInteger[16];

    /* renamed from: com.google.zxing.pdf417.decoder.DecodedBitStreamParser$1 */
    /* loaded from: classes.jar:com/google/zxing/pdf417/decoder/DecodedBitStreamParser$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode = new int[Mode.values().length];

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x0051 -> B:21:0x0040). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:17:0x0055 -> B:29:0x0035). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:18:0x0059 -> B:27:0x002a). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:19:0x005d -> B:25:0x001f). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x0061 -> B:23:0x0014). Please submit an issue!!! */
        static {
            try {
                $SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode[Mode.ALPHA.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode[Mode.LOWER.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode[Mode.MIXED.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode[Mode.PUNCT.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode[Mode.ALPHA_SHIFT.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode[Mode.PUNCT_SHIFT.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
        }
    }

    /* loaded from: classes.jar:com/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode.class */
    private enum Mode {
        ALPHA,
        LOWER,
        MIXED,
        PUNCT,
        ALPHA_SHIFT,
        PUNCT_SHIFT
    }

    static {
        EXP900[0] = BigInteger.ONE;
        BigInteger valueOf = BigInteger.valueOf(900L);
        EXP900[1] = valueOf;
        for (int i = 2; i < EXP900.length; i++) {
            EXP900[i] = EXP900[i - 1].multiply(valueOf);
        }
    }

    private DecodedBitStreamParser() {
    }

    private static int byteCompaction(int i, int[] iArr, int i2, StringBuilder sb) {
        int i3;
        boolean z;
        int i4;
        long j;
        boolean z2;
        int i5;
        long j2;
        if (i == BYTE_COMPACTION_MODE_LATCH) {
            long j3 = 0;
            char[] cArr = new char[6];
            int[] iArr2 = new int[6];
            boolean z3 = false;
            int i6 = i2;
            int i7 = 0;
            while (i6 < iArr[0] && !z3) {
                int i8 = i6 + 1;
                int i9 = iArr[i6];
                if (i9 < TEXT_COMPACTION_MODE_LATCH) {
                    iArr2[i7] = i9;
                    i5 = i7 + 1;
                    j2 = (900 * j3) + i9;
                    z2 = z3;
                } else if (i9 == TEXT_COMPACTION_MODE_LATCH || i9 == BYTE_COMPACTION_MODE_LATCH || i9 == NUMERIC_COMPACTION_MODE_LATCH || i9 == BYTE_COMPACTION_MODE_LATCH_6 || i9 == BEGIN_MACRO_PDF417_CONTROL_BLOCK || i9 == BEGIN_MACRO_PDF417_OPTIONAL_FIELD || i9 == MACRO_PDF417_TERMINATOR) {
                    i8--;
                    z2 = true;
                    i5 = i7;
                    j2 = j3;
                } else {
                    i5 = i7;
                    z2 = z3;
                    j2 = j3;
                }
                i7 = i5;
                z3 = z2;
                j3 = j2;
                i6 = i8;
                if (i5 % 5 == 0) {
                    i7 = i5;
                    z3 = z2;
                    j3 = j2;
                    i6 = i8;
                    if (i5 > 0) {
                        for (int i10 = 0; i10 < 6; i10++) {
                            cArr[5 - i10] = (char) (j2 % 256);
                            j2 >>= 8;
                        }
                        sb.append(cArr);
                        i7 = 0;
                        z3 = z2;
                        j3 = j2;
                        i6 = i8;
                    }
                }
            }
            int i11 = (i7 / 5) * 5;
            while (true) {
                i3 = i6;
                if (i11 >= i7) {
                    break;
                }
                sb.append((char) iArr2[i11]);
                i11++;
            }
        } else {
            i3 = i2;
            if (i == BYTE_COMPACTION_MODE_LATCH_6) {
                int i12 = 0;
                long j4 = 0;
                boolean z4 = false;
                while (true) {
                    i3 = i2;
                    if (i2 >= iArr[0]) {
                        break;
                    }
                    i3 = i2;
                    if (z4) {
                        break;
                    }
                    int i13 = i2 + 1;
                    int i14 = iArr[i2];
                    if (i14 < TEXT_COMPACTION_MODE_LATCH) {
                        i4 = i12 + 1;
                        j = (900 * j4) + i14;
                        z = z4;
                    } else if (i14 == TEXT_COMPACTION_MODE_LATCH || i14 == BYTE_COMPACTION_MODE_LATCH || i14 == NUMERIC_COMPACTION_MODE_LATCH || i14 == BYTE_COMPACTION_MODE_LATCH_6 || i14 == BEGIN_MACRO_PDF417_CONTROL_BLOCK || i14 == BEGIN_MACRO_PDF417_OPTIONAL_FIELD || i14 == MACRO_PDF417_TERMINATOR) {
                        i13--;
                        z = true;
                        i4 = i12;
                        j = j4;
                    } else {
                        i4 = i12;
                        z = z4;
                        j = j4;
                    }
                    i12 = i4;
                    z4 = z;
                    j4 = j;
                    i2 = i13;
                    if (i4 % 5 == 0) {
                        i12 = i4;
                        z4 = z;
                        j4 = j;
                        i2 = i13;
                        if (i4 > 0) {
                            char[] cArr2 = new char[6];
                            j4 = j;
                            for (int i15 = 0; i15 < 6; i15++) {
                                cArr2[5 - i15] = (char) (255 & j4);
                                j4 >>= 8;
                            }
                            sb.append(cArr2);
                            i12 = i4;
                            z4 = z;
                            i2 = i13;
                        }
                    }
                }
            }
        }
        return i3;
    }

    static DecoderResult decode(int[] iArr) throws FormatException {
        int byteCompaction;
        StringBuilder sb = new StringBuilder(100);
        int i = iArr[1];
        for (int i2 = 1 + 1; i2 < iArr[0]; i2 = byteCompaction + 1) {
            switch (i) {
                case TEXT_COMPACTION_MODE_LATCH /* 900 */:
                    byteCompaction = textCompaction(iArr, i2, sb);
                    break;
                case BYTE_COMPACTION_MODE_LATCH /* 901 */:
                    byteCompaction = byteCompaction(i, iArr, i2, sb);
                    break;
                case NUMERIC_COMPACTION_MODE_LATCH /* 902 */:
                    byteCompaction = numericCompaction(iArr, i2, sb);
                    break;
                case MODE_SHIFT_TO_BYTE_COMPACTION_MODE /* 913 */:
                    byteCompaction = byteCompaction(i, iArr, i2, sb);
                    break;
                case BYTE_COMPACTION_MODE_LATCH_6 /* 924 */:
                    byteCompaction = byteCompaction(i, iArr, i2, sb);
                    break;
                default:
                    byteCompaction = textCompaction(iArr, i2 - 1, sb);
                    break;
            }
            if (byteCompaction >= iArr.length) {
                throw FormatException.getFormatInstance();
            }
            i = iArr[byteCompaction];
        }
        return new DecoderResult(null, sb.toString(), null, null);
    }

    private static String decodeBase900toBase10(int[] iArr, int i) throws FormatException {
        BigInteger bigInteger = BigInteger.ZERO;
        for (int i2 = 0; i2 < i; i2++) {
            bigInteger = bigInteger.add(EXP900[(i - i2) - 1].multiply(BigInteger.valueOf(iArr[i2])));
        }
        String bigInteger2 = bigInteger.toString();
        if (bigInteger2.charAt(0) != '1') {
            throw FormatException.getFormatInstance();
        }
        return bigInteger2.substring(1);
    }

    private static void decodeTextCompaction(int[] iArr, int[] iArr2, int i, StringBuilder sb) {
        Mode mode;
        char c;
        Mode mode2;
        Mode mode3 = Mode.ALPHA;
        Mode mode4 = Mode.ALPHA;
        int i2 = 0;
        while (i2 < i) {
            int i3 = iArr[i2];
            switch (AnonymousClass1.$SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode[mode3.ordinal()]) {
                case 1:
                    if (i3 >= 26) {
                        if (i3 != 26) {
                            if (i3 != 27) {
                                if (i3 != 28) {
                                    if (i3 != 29) {
                                        c = 0;
                                        mode2 = mode4;
                                        mode = mode3;
                                        if (i3 == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                            sb.append((char) iArr2[i2]);
                                            c = 0;
                                            mode2 = mode4;
                                            mode = mode3;
                                            break;
                                        }
                                    } else {
                                        mode = Mode.PUNCT_SHIFT;
                                        c = 0;
                                        mode2 = mode3;
                                        break;
                                    }
                                } else {
                                    mode = Mode.MIXED;
                                    c = 0;
                                    mode2 = mode4;
                                    break;
                                }
                            } else {
                                mode = Mode.LOWER;
                                c = 0;
                                mode2 = mode4;
                                break;
                            }
                        } else {
                            c = ' ';
                            mode2 = mode4;
                            mode = mode3;
                            break;
                        }
                    } else {
                        c = (char) (i3 + 65);
                        mode2 = mode4;
                        mode = mode3;
                        break;
                    }
                    break;
                case 2:
                    if (i3 >= 26) {
                        if (i3 != 26) {
                            if (i3 != 27) {
                                if (i3 != 28) {
                                    if (i3 != 29) {
                                        c = 0;
                                        mode2 = mode4;
                                        mode = mode3;
                                        if (i3 == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                            sb.append((char) iArr2[i2]);
                                            c = 0;
                                            mode2 = mode4;
                                            mode = mode3;
                                            break;
                                        }
                                    } else {
                                        mode = Mode.PUNCT_SHIFT;
                                        c = 0;
                                        mode2 = mode3;
                                        break;
                                    }
                                } else {
                                    mode = Mode.MIXED;
                                    c = 0;
                                    mode2 = mode4;
                                    break;
                                }
                            } else {
                                mode = Mode.ALPHA_SHIFT;
                                c = 0;
                                mode2 = mode3;
                                break;
                            }
                        } else {
                            c = ' ';
                            mode2 = mode4;
                            mode = mode3;
                            break;
                        }
                    } else {
                        c = (char) (i3 + 97);
                        mode2 = mode4;
                        mode = mode3;
                        break;
                    }
                    break;
                case 3:
                    if (i3 >= 25) {
                        if (i3 != 25) {
                            if (i3 != 26) {
                                if (i3 != 27) {
                                    if (i3 != 28) {
                                        if (i3 != 29) {
                                            c = 0;
                                            mode2 = mode4;
                                            mode = mode3;
                                            if (i3 == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                                sb.append((char) iArr2[i2]);
                                                c = 0;
                                                mode2 = mode4;
                                                mode = mode3;
                                                break;
                                            }
                                        } else {
                                            mode = Mode.PUNCT_SHIFT;
                                            c = 0;
                                            mode2 = mode3;
                                            break;
                                        }
                                    } else {
                                        mode = Mode.ALPHA;
                                        c = 0;
                                        mode2 = mode4;
                                        break;
                                    }
                                } else {
                                    mode = Mode.LOWER;
                                    c = 0;
                                    mode2 = mode4;
                                    break;
                                }
                            } else {
                                c = ' ';
                                mode2 = mode4;
                                mode = mode3;
                                break;
                            }
                        } else {
                            mode = Mode.PUNCT;
                            c = 0;
                            mode2 = mode4;
                            break;
                        }
                    } else {
                        c = MIXED_CHARS[i3];
                        mode2 = mode4;
                        mode = mode3;
                        break;
                    }
                    break;
                case 4:
                    if (i3 >= 29) {
                        if (i3 != 29) {
                            c = 0;
                            mode2 = mode4;
                            mode = mode3;
                            if (i3 == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                sb.append((char) iArr2[i2]);
                                c = 0;
                                mode2 = mode4;
                                mode = mode3;
                                break;
                            }
                        } else {
                            mode = Mode.ALPHA;
                            c = 0;
                            mode2 = mode4;
                            break;
                        }
                    } else {
                        c = PUNCT_CHARS[i3];
                        mode2 = mode4;
                        mode = mode3;
                        break;
                    }
                    break;
                case 5:
                    Mode mode5 = mode4;
                    if (i3 >= 26) {
                        c = 0;
                        mode2 = mode4;
                        mode = mode5;
                        if (i3 == 26) {
                            c = ' ';
                            mode2 = mode4;
                            mode = mode5;
                            break;
                        }
                    } else {
                        c = (char) (i3 + 65);
                        mode2 = mode4;
                        mode = mode5;
                        break;
                    }
                    break;
                case 6:
                    mode = mode4;
                    if (i3 >= 29) {
                        c = 0;
                        mode2 = mode4;
                        if (i3 == 29) {
                            mode = Mode.ALPHA;
                            c = 0;
                            mode2 = mode4;
                            break;
                        }
                    } else {
                        c = PUNCT_CHARS[i3];
                        mode2 = mode4;
                        break;
                    }
                    break;
                default:
                    mode = mode3;
                    mode2 = mode4;
                    c = 0;
                    break;
            }
            if (c != 0) {
                sb.append(c);
            }
            i2++;
            mode4 = mode2;
            mode3 = mode;
        }
    }

    private static int numericCompaction(int[] iArr, int i, StringBuilder sb) throws FormatException {
        int i2;
        int i3 = 0;
        boolean z = false;
        int[] iArr2 = new int[15];
        int i4 = i;
        while (i4 < iArr[0] && !z) {
            int i5 = i4 + 1;
            int i6 = iArr[i4];
            boolean z2 = z;
            if (i5 == iArr[0]) {
                z2 = true;
            }
            if (i6 < TEXT_COMPACTION_MODE_LATCH) {
                iArr2[i3] = i6;
                i2 = i3 + 1;
            } else if (i6 == TEXT_COMPACTION_MODE_LATCH || i6 == BYTE_COMPACTION_MODE_LATCH || i6 == BYTE_COMPACTION_MODE_LATCH_6 || i6 == BEGIN_MACRO_PDF417_CONTROL_BLOCK || i6 == BEGIN_MACRO_PDF417_OPTIONAL_FIELD || i6 == MACRO_PDF417_TERMINATOR) {
                i5--;
                z2 = true;
                i2 = i3;
            } else {
                i2 = i3;
            }
            if (i2 % 15 != 0 && i6 != NUMERIC_COMPACTION_MODE_LATCH) {
                i3 = i2;
                z = z2;
                i4 = i5;
                if (z2) {
                }
            }
            sb.append(decodeBase900toBase10(iArr2, i2));
            i3 = 0;
            z = z2;
            i4 = i5;
        }
        return i4;
    }

    private static int textCompaction(int[] iArr, int i, StringBuilder sb) {
        int[] iArr2 = new int[iArr[0] << 1];
        int[] iArr3 = new int[iArr[0] << 1];
        int i2 = 0;
        boolean z = false;
        while (i < iArr[0] && !z) {
            int i3 = i + 1;
            int i4 = iArr[i];
            if (i4 < TEXT_COMPACTION_MODE_LATCH) {
                iArr2[i2] = i4 / 30;
                iArr2[i2 + 1] = i4 % 30;
                i2 += 2;
                i = i3;
            } else {
                switch (i4) {
                    case TEXT_COMPACTION_MODE_LATCH /* 900 */:
                        i = i3 - 1;
                        z = true;
                        continue;
                    case BYTE_COMPACTION_MODE_LATCH /* 901 */:
                        i = i3 - 1;
                        z = true;
                        continue;
                    case NUMERIC_COMPACTION_MODE_LATCH /* 902 */:
                        i = i3 - 1;
                        z = true;
                        continue;
                    case MODE_SHIFT_TO_BYTE_COMPACTION_MODE /* 913 */:
                        iArr2[i2] = MODE_SHIFT_TO_BYTE_COMPACTION_MODE;
                        i = i3 + 1;
                        iArr3[i2] = iArr[i3];
                        i2++;
                        continue;
                    case BYTE_COMPACTION_MODE_LATCH_6 /* 924 */:
                        i = i3 - 1;
                        z = true;
                        continue;
                    default:
                        i = i3;
                        continue;
                }
            }
        }
        decodeTextCompaction(iArr2, iArr3, i2, sb);
        return i;
    }
}
