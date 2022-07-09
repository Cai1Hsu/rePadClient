package com.google.zxing.pdf417.encoder;

import com.google.zxing.WriterException;
import java.math.BigInteger;
import java.util.Arrays;

/* loaded from: classes.jar:com/google/zxing/pdf417/encoder/PDF417HighLevelEncoder.class */
final class PDF417HighLevelEncoder {
    private static final int BYTE_COMPACTION = 1;
    private static final int LATCH_TO_BYTE = 924;
    private static final int LATCH_TO_BYTE_PADDED = 901;
    private static final int LATCH_TO_NUMERIC = 902;
    private static final int LATCH_TO_TEXT = 900;
    private static final int NUMERIC_COMPACTION = 2;
    private static final int SHIFT_TO_BYTE = 913;
    private static final int SUBMODE_ALPHA = 0;
    private static final int SUBMODE_LOWER = 1;
    private static final int SUBMODE_MIXED = 2;
    private static final int SUBMODE_PUNCTUATION = 3;
    private static final int TEXT_COMPACTION = 0;
    private static final byte[] TEXT_MIXED_RAW = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 38, 13, 9, 44, 58, 35, 45, 46, 36, 47, 43, 37, 42, 61, 94, 0, 32, 0, 0, 0};
    private static final byte[] TEXT_PUNCTUATION_RAW = {59, 60, 62, 64, 91, 92, 93, 95, 96, 126, 33, 13, 9, 44, 58, 10, 45, 46, 36, 47, 34, 124, 42, 40, 41, 63, 123, 125, 39, 0};
    private static final byte[] MIXED = new byte[128];
    private static final byte[] PUNCTUATION = new byte[128];

    static {
        Arrays.fill(MIXED, (byte) -1);
        byte b = 0;
        while (true) {
            byte b2 = b;
            if (b2 >= TEXT_MIXED_RAW.length) {
                break;
            }
            byte b3 = TEXT_MIXED_RAW[b2];
            if (b3 > 0) {
                MIXED[b3] = b2;
            }
            b = (byte) (b2 + 1);
        }
        Arrays.fill(PUNCTUATION, (byte) -1);
        byte b4 = 0;
        while (true) {
            byte b5 = b4;
            if (b5 < TEXT_PUNCTUATION_RAW.length) {
                byte b6 = TEXT_PUNCTUATION_RAW[b5];
                if (b6 > 0) {
                    PUNCTUATION[b6] = b5;
                }
                b4 = (byte) (b5 + 1);
            } else {
                return;
            }
        }
    }

    private PDF417HighLevelEncoder() {
    }

    private static int determineConsecutiveBinaryCount(CharSequence charSequence, byte[] bArr, int i) throws WriterException {
        int i2;
        char c;
        int i3;
        int i4;
        int length = charSequence.length();
        int i5 = i;
        while (true) {
            if (i5 >= length) {
                i2 = i5 - i;
                break;
            }
            char charAt = charSequence.charAt(i5);
            int i6 = 0;
            while (true) {
                c = charAt;
                i3 = i6;
                if (i6 >= 13) {
                    break;
                }
                i3 = i6;
                if (!isDigit(c)) {
                    break;
                }
                i6++;
                int i7 = i5 + i6;
                if (i7 >= length) {
                    i3 = i6;
                    break;
                }
                charAt = charSequence.charAt(i7);
            }
            if (i3 >= 13) {
                i2 = i5 - i;
                break;
            }
            int i8 = 0;
            while (true) {
                i4 = i8;
                if (i8 >= 5) {
                    break;
                }
                i4 = i8;
                if (!isText(c)) {
                    break;
                }
                i8++;
                int i9 = i5 + i8;
                if (i9 >= length) {
                    i4 = i8;
                    break;
                }
                c = charSequence.charAt(i9);
            }
            if (i4 >= 5) {
                i2 = i5 - i;
                break;
            }
            char charAt2 = charSequence.charAt(i5);
            if (bArr[i5] == 63 && charAt2 != '?') {
                throw new WriterException("Non-encodable character detected: " + charAt2 + " (Unicode: " + ((int) charAt2) + ')');
            }
            i5++;
        }
        return i2;
    }

    private static int determineConsecutiveDigitCount(CharSequence charSequence, int i) {
        int i2 = 0;
        int length = charSequence.length();
        if (i < length) {
            char charAt = charSequence.charAt(i);
            int i3 = i;
            int i4 = 0;
            char c = charAt;
            while (true) {
                i2 = i4;
                if (!isDigit(c)) {
                    break;
                }
                i2 = i4;
                if (i3 >= length) {
                    break;
                }
                int i5 = i4 + 1;
                int i6 = i3 + 1;
                i4 = i5;
                i3 = i6;
                if (i6 < length) {
                    c = charSequence.charAt(i6);
                    i4 = i5;
                    i3 = i6;
                }
            }
        }
        return i2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x008e, code lost:
        r4 = r7 - r4;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static int determineConsecutiveTextCount(CharSequence charSequence, int i) {
        int i2;
        int length = charSequence.length();
        int i3 = i;
        while (true) {
            int i4 = i3;
            if (i3 >= length) {
                break;
            }
            int i5 = 0;
            i4 = i3;
            char charAt = charSequence.charAt(i3);
            while (i5 < 13 && isDigit(charAt) && i4 < length) {
                int i6 = i5 + 1;
                int i7 = i4 + 1;
                i4 = i7;
                i5 = i6;
                if (i7 < length) {
                    charAt = charSequence.charAt(i7);
                    i4 = i7;
                    i5 = i6;
                }
            }
            if (i5 >= 13) {
                i2 = (i4 - i) - i5;
                break;
            }
            i3 = i4;
            if (i5 <= 0) {
                if (!isText(charSequence.charAt(i4))) {
                    break;
                }
                i3 = i4 + 1;
            }
        }
        return i2;
    }

    private static void encodeBinary(byte[] bArr, int i, int i2, int i3, StringBuilder sb) {
        if (i2 == 1 && i3 == 0) {
            sb.append((char) 913);
        }
        int i4 = i;
        int i5 = i4;
        if (i2 >= 6) {
            sb.append((char) 924);
            char[] cArr = new char[5];
            while (true) {
                i5 = i4;
                if ((i + i2) - i4 < 6) {
                    break;
                }
                long j = 0;
                for (int i6 = 0; i6 < 6; i6++) {
                    j = (j << 8) + (bArr[i4 + i6] & 255);
                }
                for (int i7 = 0; i7 < 5; i7++) {
                    cArr[i7] = (char) (j % 900);
                    j /= 900;
                }
                for (int length = cArr.length - 1; length >= 0; length--) {
                    sb.append(cArr[length]);
                }
                i4 += 6;
            }
        }
        if (i5 < i + i2) {
            sb.append((char) 901);
        }
        while (i5 < i + i2) {
            sb.append((char) (bArr[i5] & 255));
            i5++;
        }
    }

    static String encodeHighLevel(String str, Compaction compaction) throws WriterException {
        byte[] bArr = null;
        StringBuilder sb = new StringBuilder(str.length());
        int length = str.length();
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        if (compaction == Compaction.TEXT) {
            encodeText(str, 0, length, sb, 0);
        } else if (compaction == Compaction.BYTE) {
            byte[] bytesForMessage = getBytesForMessage(str);
            encodeBinary(bytesForMessage, 0, bytesForMessage.length, 1, sb);
        } else if (compaction == Compaction.NUMERIC) {
            sb.append((char) 902);
            encodeNumeric(str, 0, length, sb);
        } else {
            while (i < length) {
                int determineConsecutiveDigitCount = determineConsecutiveDigitCount(str, i);
                if (determineConsecutiveDigitCount >= 13) {
                    sb.append((char) 902);
                    i2 = 2;
                    i3 = 0;
                    encodeNumeric(str, i, determineConsecutiveDigitCount, sb);
                    i += determineConsecutiveDigitCount;
                } else {
                    int determineConsecutiveTextCount = determineConsecutiveTextCount(str, i);
                    if (determineConsecutiveTextCount >= 5 || determineConsecutiveDigitCount == length) {
                        int i4 = i2;
                        if (i2 != 0) {
                            sb.append((char) 900);
                            i4 = 0;
                            i3 = 0;
                        }
                        i3 = encodeText(str, i, determineConsecutiveTextCount, sb, i3);
                        i += determineConsecutiveTextCount;
                        i2 = i4;
                    } else {
                        byte[] bArr2 = bArr;
                        if (bArr == null) {
                            bArr2 = getBytesForMessage(str);
                        }
                        int determineConsecutiveBinaryCount = determineConsecutiveBinaryCount(str, bArr2, i);
                        int i5 = determineConsecutiveBinaryCount;
                        if (determineConsecutiveBinaryCount == 0) {
                            i5 = 1;
                        }
                        if (i5 == 1 && i2 == 0) {
                            encodeBinary(bArr2, i, 1, 0, sb);
                        } else {
                            encodeBinary(bArr2, i, i5, i2, sb);
                            i2 = 1;
                            i3 = 0;
                        }
                        i += i5;
                        bArr = bArr2;
                    }
                }
            }
        }
        return sb.toString();
    }

    private static void encodeNumeric(String str, int i, int i2, StringBuilder sb) {
        BigInteger divide;
        int i3 = 0;
        StringBuilder sb2 = new StringBuilder((i2 / 3) + 1);
        BigInteger valueOf = BigInteger.valueOf(900L);
        BigInteger valueOf2 = BigInteger.valueOf(0L);
        while (i3 < i2 - 1) {
            sb2.setLength(0);
            int min = Math.min(44, i2 - i3);
            BigInteger bigInteger = new BigInteger('1' + str.substring(i + i3, i + i3 + min));
            do {
                sb2.append((char) bigInteger.mod(valueOf).intValue());
                divide = bigInteger.divide(valueOf);
                bigInteger = divide;
            } while (!divide.equals(valueOf2));
            for (int length = sb2.length() - 1; length >= 0; length--) {
                sb.append(sb2.charAt(length));
            }
            i3 += min;
        }
    }

    private static int encodeText(CharSequence charSequence, int i, int i2, StringBuilder sb, int i3) {
        char charAt;
        StringBuilder sb2 = new StringBuilder(i2);
        int i4 = 0;
        while (true) {
            char charAt2 = charSequence.charAt(i + i4);
            switch (i3) {
                case 0:
                    if (isAlphaUpper(charAt2)) {
                        if (charAt2 == ' ') {
                            sb2.append((char) 26);
                            break;
                        } else {
                            sb2.append((char) (charAt2 - 'A'));
                            break;
                        }
                    } else if (isAlphaLower(charAt2)) {
                        i3 = 1;
                        sb2.append((char) 27);
                        continue;
                    } else if (!isMixed(charAt2)) {
                        sb2.append((char) 29);
                        sb2.append((char) PUNCTUATION[charAt2]);
                        break;
                    } else {
                        i3 = 2;
                        sb2.append((char) 28);
                    }
                case 1:
                    if (isAlphaLower(charAt2)) {
                        if (charAt2 == ' ') {
                            sb2.append((char) 26);
                            break;
                        } else {
                            sb2.append((char) (charAt2 - 'a'));
                            break;
                        }
                    } else if (isAlphaUpper(charAt2)) {
                        sb2.append((char) 27);
                        sb2.append((char) (charAt2 - 'A'));
                        break;
                    } else if (!isMixed(charAt2)) {
                        sb2.append((char) 29);
                        sb2.append((char) PUNCTUATION[charAt2]);
                        break;
                    } else {
                        i3 = 2;
                        sb2.append((char) 28);
                        continue;
                    }
                case 2:
                    if (isMixed(charAt2)) {
                        sb2.append((char) MIXED[charAt2]);
                        break;
                    } else if (isAlphaUpper(charAt2)) {
                        i3 = 0;
                        sb2.append((char) 28);
                        continue;
                    } else if (isAlphaLower(charAt2)) {
                        i3 = 1;
                        sb2.append((char) 27);
                    } else if (i + i4 + 1 >= i2 || !isPunctuation(charSequence.charAt(i + i4 + 1))) {
                        sb2.append((char) 29);
                        sb2.append((char) PUNCTUATION[charAt2]);
                        break;
                    } else {
                        i3 = 3;
                        sb2.append((char) 25);
                    }
                    break;
                default:
                    if (isPunctuation(charAt2)) {
                        sb2.append((char) PUNCTUATION[charAt2]);
                        break;
                    } else {
                        i3 = 0;
                        sb2.append((char) 29);
                        continue;
                    }
            }
            int i5 = i4 + 1;
            i4 = i5;
            if (i5 >= i2) {
                char c = 0;
                int length = sb2.length();
                for (int i6 = 0; i6 < length; i6++) {
                    if (i6 % 2 != 0) {
                        char charAt3 = (char) ((c * 30) + sb2.charAt(i6));
                        sb.append(charAt3);
                        charAt = charAt3;
                    } else {
                        charAt = sb2.charAt(i6);
                    }
                    c = charAt;
                }
                if (length % 2 != 0) {
                    sb.append((char) ((c * 30) + 29));
                }
                return i3;
            }
        }
    }

    private static byte[] getBytesForMessage(String str) {
        return str.getBytes();
    }

    private static boolean isAlphaLower(char c) {
        return c == ' ' || (c >= 'a' && c <= 'z');
    }

    private static boolean isAlphaUpper(char c) {
        return c == ' ' || (c >= 'A' && c <= 'Z');
    }

    private static boolean isDigit(char c) {
        return c >= '0' && c <= '9';
    }

    private static boolean isMixed(char c) {
        return MIXED[c] != -1;
    }

    private static boolean isPunctuation(char c) {
        return PUNCTUATION[c] != -1;
    }

    private static boolean isText(char c) {
        return c == '\t' || c == '\n' || c == '\r' || (c >= ' ' && c <= '~');
    }
}
