package com.google.zxing.pdf417.decoder;

import com.google.zxing.FormatException;
import com.google.zxing.common.DecoderResult;
import java.math.BigInteger;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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
    private static final char[] PUNCT_CHARS = {';', '<', '>', '@', '[', IOUtils.DIR_SEPARATOR_WINDOWS, '}', '_', '`', '~', '!', '\r', '\t', ',', ':', '\n', '-', FilenameUtils.EXTENSION_SEPARATOR, '$', IOUtils.DIR_SEPARATOR_UNIX, '\"', '|', '*', '(', ')', '?', '{', '}', '\''};
    private static final char[] MIXED_CHARS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '&', '\r', '\t', ',', ':', '#', '-', FilenameUtils.EXTENSION_SEPARATOR, '$', IOUtils.DIR_SEPARATOR_UNIX, '+', '%', '*', '=', '^'};
    private static final BigInteger[] EXP900 = new BigInteger[16];

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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
        BigInteger nineHundred = BigInteger.valueOf(900L);
        EXP900[1] = nineHundred;
        for (int i = 2; i < EXP900.length; i++) {
            EXP900[i] = EXP900[i - 1].multiply(nineHundred);
        }
    }

    private DecodedBitStreamParser() {
    }

    public static DecoderResult decode(int[] codewords) throws FormatException {
        int codeIndex;
        StringBuilder result = new StringBuilder(100);
        int codeIndex2 = 1 + 1;
        int code = codewords[1];
        while (true) {
            int codeIndex3 = codeIndex2;
            if (codeIndex3 < codewords[0]) {
                switch (code) {
                    case TEXT_COMPACTION_MODE_LATCH /* 900 */:
                        codeIndex = textCompaction(codewords, codeIndex3, result);
                        break;
                    case BYTE_COMPACTION_MODE_LATCH /* 901 */:
                        codeIndex = byteCompaction(code, codewords, codeIndex3, result);
                        break;
                    case NUMERIC_COMPACTION_MODE_LATCH /* 902 */:
                        codeIndex = numericCompaction(codewords, codeIndex3, result);
                        break;
                    case MODE_SHIFT_TO_BYTE_COMPACTION_MODE /* 913 */:
                        codeIndex = byteCompaction(code, codewords, codeIndex3, result);
                        break;
                    case BYTE_COMPACTION_MODE_LATCH_6 /* 924 */:
                        codeIndex = byteCompaction(code, codewords, codeIndex3, result);
                        break;
                    default:
                        codeIndex = textCompaction(codewords, codeIndex3 - 1, result);
                        break;
                }
                if (codeIndex < codewords.length) {
                    codeIndex2 = codeIndex + 1;
                    code = codewords[codeIndex];
                } else {
                    throw FormatException.getFormatInstance();
                }
            } else {
                return new DecoderResult(null, result.toString(), null, null);
            }
        }
    }

    private static int textCompaction(int[] codewords, int codeIndex, StringBuilder result) {
        int[] textCompactionData = new int[codewords[0] << 1];
        int[] byteCompactionData = new int[codewords[0] << 1];
        int index = 0;
        boolean end = false;
        while (codeIndex < codewords[0] && !end) {
            int codeIndex2 = codeIndex + 1;
            int code = codewords[codeIndex];
            if (code < TEXT_COMPACTION_MODE_LATCH) {
                textCompactionData[index] = code / 30;
                textCompactionData[index + 1] = code % 30;
                index += 2;
                codeIndex = codeIndex2;
            } else {
                switch (code) {
                    case TEXT_COMPACTION_MODE_LATCH /* 900 */:
                        codeIndex = codeIndex2 - 1;
                        end = true;
                        continue;
                    case BYTE_COMPACTION_MODE_LATCH /* 901 */:
                        codeIndex = codeIndex2 - 1;
                        end = true;
                        continue;
                    case NUMERIC_COMPACTION_MODE_LATCH /* 902 */:
                        codeIndex = codeIndex2 - 1;
                        end = true;
                        continue;
                    case MODE_SHIFT_TO_BYTE_COMPACTION_MODE /* 913 */:
                        textCompactionData[index] = MODE_SHIFT_TO_BYTE_COMPACTION_MODE;
                        codeIndex = codeIndex2 + 1;
                        byteCompactionData[index] = codewords[codeIndex2];
                        index++;
                        continue;
                    case BYTE_COMPACTION_MODE_LATCH_6 /* 924 */:
                        codeIndex = codeIndex2 - 1;
                        end = true;
                        continue;
                    default:
                        codeIndex = codeIndex2;
                        continue;
                }
            }
        }
        decodeTextCompaction(textCompactionData, byteCompactionData, index, result);
        return codeIndex;
    }

    private static void decodeTextCompaction(int[] textCompactionData, int[] byteCompactionData, int length, StringBuilder result) {
        Mode subMode = Mode.ALPHA;
        Mode priorToShiftMode = Mode.ALPHA;
        for (int i = 0; i < length; i++) {
            int subModeCh = textCompactionData[i];
            char ch = 0;
            switch (subMode) {
                case ALPHA:
                    if (subModeCh < 26) {
                        ch = (char) (subModeCh + 65);
                        break;
                    } else if (subModeCh == 26) {
                        ch = ' ';
                        break;
                    } else if (subModeCh == 27) {
                        subMode = Mode.LOWER;
                        break;
                    } else if (subModeCh == 28) {
                        subMode = Mode.MIXED;
                        break;
                    } else if (subModeCh == 29) {
                        priorToShiftMode = subMode;
                        subMode = Mode.PUNCT_SHIFT;
                        break;
                    } else if (subModeCh == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                        result.append((char) byteCompactionData[i]);
                        break;
                    }
                    break;
                case LOWER:
                    if (subModeCh < 26) {
                        ch = (char) (subModeCh + 97);
                        break;
                    } else if (subModeCh == 26) {
                        ch = ' ';
                        break;
                    } else if (subModeCh == 27) {
                        priorToShiftMode = subMode;
                        subMode = Mode.ALPHA_SHIFT;
                        break;
                    } else if (subModeCh == 28) {
                        subMode = Mode.MIXED;
                        break;
                    } else if (subModeCh == 29) {
                        priorToShiftMode = subMode;
                        subMode = Mode.PUNCT_SHIFT;
                        break;
                    } else if (subModeCh == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                        result.append((char) byteCompactionData[i]);
                        break;
                    }
                    break;
                case MIXED:
                    if (subModeCh < 25) {
                        ch = MIXED_CHARS[subModeCh];
                        break;
                    } else if (subModeCh == 25) {
                        subMode = Mode.PUNCT;
                        break;
                    } else if (subModeCh == 26) {
                        ch = ' ';
                        break;
                    } else if (subModeCh == 27) {
                        subMode = Mode.LOWER;
                        break;
                    } else if (subModeCh == 28) {
                        subMode = Mode.ALPHA;
                        break;
                    } else if (subModeCh == 29) {
                        priorToShiftMode = subMode;
                        subMode = Mode.PUNCT_SHIFT;
                        break;
                    } else if (subModeCh == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                        result.append((char) byteCompactionData[i]);
                        break;
                    }
                    break;
                case PUNCT:
                    if (subModeCh < 29) {
                        ch = PUNCT_CHARS[subModeCh];
                        break;
                    } else if (subModeCh == 29) {
                        subMode = Mode.ALPHA;
                        break;
                    } else if (subModeCh == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                        result.append((char) byteCompactionData[i]);
                        break;
                    }
                    break;
                case ALPHA_SHIFT:
                    subMode = priorToShiftMode;
                    if (subModeCh < 26) {
                        ch = (char) (subModeCh + 65);
                        break;
                    } else if (subModeCh == 26) {
                        ch = ' ';
                        break;
                    }
                    break;
                case PUNCT_SHIFT:
                    subMode = priorToShiftMode;
                    if (subModeCh < 29) {
                        ch = PUNCT_CHARS[subModeCh];
                        break;
                    } else if (subModeCh == 29) {
                        subMode = Mode.ALPHA;
                        break;
                    }
                    break;
            }
            if (ch != 0) {
                result.append(ch);
            }
        }
    }

    private static int byteCompaction(int mode, int[] codewords, int codeIndex, StringBuilder result) {
        if (mode == BYTE_COMPACTION_MODE_LATCH) {
            int count = 0;
            long value = 0;
            char[] decodedData = new char[6];
            int[] byteCompactedCodewords = new int[6];
            boolean end = false;
            while (codeIndex < codewords[0] && !end) {
                int codeIndex2 = codeIndex + 1;
                int code = codewords[codeIndex];
                if (code < TEXT_COMPACTION_MODE_LATCH) {
                    byteCompactedCodewords[count] = code;
                    count++;
                    value = (900 * value) + code;
                    codeIndex = codeIndex2;
                } else if (code == TEXT_COMPACTION_MODE_LATCH || code == BYTE_COMPACTION_MODE_LATCH || code == NUMERIC_COMPACTION_MODE_LATCH || code == BYTE_COMPACTION_MODE_LATCH_6 || code == BEGIN_MACRO_PDF417_CONTROL_BLOCK || code == BEGIN_MACRO_PDF417_OPTIONAL_FIELD || code == MACRO_PDF417_TERMINATOR) {
                    codeIndex = codeIndex2 - 1;
                    end = true;
                } else {
                    codeIndex = codeIndex2;
                }
                if (count % 5 == 0 && count > 0) {
                    for (int j = 0; j < 6; j++) {
                        decodedData[5 - j] = (char) (value % 256);
                        value >>= 8;
                    }
                    result.append(decodedData);
                    count = 0;
                }
            }
            for (int i = (count / 5) * 5; i < count; i++) {
                result.append((char) byteCompactedCodewords[i]);
            }
        } else if (mode == BYTE_COMPACTION_MODE_LATCH_6) {
            int count2 = 0;
            long value2 = 0;
            boolean end2 = false;
            while (codeIndex < codewords[0] && !end2) {
                int codeIndex3 = codeIndex + 1;
                int code2 = codewords[codeIndex];
                if (code2 < TEXT_COMPACTION_MODE_LATCH) {
                    count2++;
                    value2 = (900 * value2) + code2;
                    codeIndex = codeIndex3;
                } else if (code2 == TEXT_COMPACTION_MODE_LATCH || code2 == BYTE_COMPACTION_MODE_LATCH || code2 == NUMERIC_COMPACTION_MODE_LATCH || code2 == BYTE_COMPACTION_MODE_LATCH_6 || code2 == BEGIN_MACRO_PDF417_CONTROL_BLOCK || code2 == BEGIN_MACRO_PDF417_OPTIONAL_FIELD || code2 == MACRO_PDF417_TERMINATOR) {
                    codeIndex = codeIndex3 - 1;
                    end2 = true;
                } else {
                    codeIndex = codeIndex3;
                }
                if (count2 % 5 == 0 && count2 > 0) {
                    char[] decodedData2 = new char[6];
                    for (int j2 = 0; j2 < 6; j2++) {
                        decodedData2[5 - j2] = (char) (255 & value2);
                        value2 >>= 8;
                    }
                    result.append(decodedData2);
                }
            }
        }
        return codeIndex;
    }

    private static int numericCompaction(int[] codewords, int codeIndex, StringBuilder result) throws FormatException {
        int count = 0;
        boolean end = false;
        int[] numericCodewords = new int[15];
        while (codeIndex < codewords[0] && !end) {
            int codeIndex2 = codeIndex + 1;
            int code = codewords[codeIndex];
            if (codeIndex2 == codewords[0]) {
                end = true;
            }
            if (code < TEXT_COMPACTION_MODE_LATCH) {
                numericCodewords[count] = code;
                count++;
                codeIndex = codeIndex2;
            } else if (code == TEXT_COMPACTION_MODE_LATCH || code == BYTE_COMPACTION_MODE_LATCH || code == BYTE_COMPACTION_MODE_LATCH_6 || code == BEGIN_MACRO_PDF417_CONTROL_BLOCK || code == BEGIN_MACRO_PDF417_OPTIONAL_FIELD || code == MACRO_PDF417_TERMINATOR) {
                codeIndex = codeIndex2 - 1;
                end = true;
            } else {
                codeIndex = codeIndex2;
            }
            if (count % 15 == 0 || code == NUMERIC_COMPACTION_MODE_LATCH || end) {
                String s = decodeBase900toBase10(numericCodewords, count);
                result.append(s);
                count = 0;
            }
        }
        return codeIndex;
    }

    private static String decodeBase900toBase10(int[] codewords, int count) throws FormatException {
        BigInteger result = BigInteger.ZERO;
        for (int i = 0; i < count; i++) {
            result = result.add(EXP900[(count - i) - 1].multiply(BigInteger.valueOf(codewords[i])));
        }
        String resultString = result.toString();
        if (resultString.charAt(0) != '1') {
            throw FormatException.getFormatInstance();
        }
        return resultString.substring(1);
    }
}
