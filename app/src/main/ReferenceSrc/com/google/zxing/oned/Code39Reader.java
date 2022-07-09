package com.google.zxing.oned;

import android.support.v4.view.MotionEventCompat;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import de.javawi.jstun.header.MessageHeaderInterface;
import java.util.Map;
import org.apache.http.HttpStatus;
import org.apache.tools.ant.taskdefs.Execute;

/* loaded from: classes.dex */
public final class Code39Reader extends OneDReader {
    private final boolean extendedMode;
    private final boolean usingCheckDigit;
    static final String ALPHABET_STRING = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%";
    private static final char[] ALPHABET = ALPHABET_STRING.toCharArray();
    static final int[] CHARACTER_ENCODINGS = {52, 289, 97, 352, 49, HttpStatus.SC_NOT_MODIFIED, 112, 37, 292, 100, 265, 73, 328, 25, 280, 88, 13, 268, 76, 28, 259, 67, 322, 19, MessageHeaderInterface.SHAREDSECRETERRORRESPONSE, 82, 7, 262, 70, 22, 385, 193, 448, 145, 400, 208, 133, 388, 196, 148, 168, 162, 138, 42};
    private static final int ASTERISK_ENCODING = CHARACTER_ENCODINGS[39];

    public Code39Reader() {
        this.usingCheckDigit = false;
        this.extendedMode = false;
    }

    public Code39Reader(boolean usingCheckDigit) {
        this.usingCheckDigit = usingCheckDigit;
        this.extendedMode = false;
    }

    public Code39Reader(boolean usingCheckDigit, boolean extendedMode) {
        this.usingCheckDigit = usingCheckDigit;
        this.extendedMode = extendedMode;
    }

    @Override // com.google.zxing.oned.OneDReader
    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> hints) throws NotFoundException, ChecksumException, FormatException {
        char decodedChar;
        int lastStart;
        String resultString;
        int[] counters = new int[9];
        int[] start = findAsteriskPattern(row, counters);
        int nextStart = row.getNextSet(start[1]);
        int end = row.getSize();
        StringBuilder result = new StringBuilder(20);
        do {
            recordPattern(row, nextStart, counters);
            int pattern = toNarrowWidePattern(counters);
            if (pattern < 0) {
                throw NotFoundException.getNotFoundInstance();
            }
            decodedChar = patternToChar(pattern);
            result.append(decodedChar);
            lastStart = nextStart;
            for (int counter : counters) {
                nextStart += counter;
            }
            nextStart = row.getNextSet(nextStart);
        } while (decodedChar != '*');
        result.setLength(result.length() - 1);
        int lastPatternSize = 0;
        for (int counter2 : counters) {
            lastPatternSize += counter2;
        }
        int whiteSpaceAfterEnd = (nextStart - lastStart) - lastPatternSize;
        if (nextStart != end && (whiteSpaceAfterEnd >> 1) < lastPatternSize) {
            throw NotFoundException.getNotFoundInstance();
        }
        if (this.usingCheckDigit) {
            int max = result.length() - 1;
            int total = 0;
            for (int i = 0; i < max; i++) {
                total += ALPHABET_STRING.indexOf(result.charAt(i));
            }
            if (result.charAt(max) != ALPHABET[total % 43]) {
                throw ChecksumException.getChecksumInstance();
            }
            result.setLength(max);
        }
        if (result.length() == 0) {
            throw NotFoundException.getNotFoundInstance();
        }
        if (this.extendedMode) {
            resultString = decodeExtended(result);
        } else {
            resultString = result.toString();
        }
        float left = (start[1] + start[0]) / 2.0f;
        float right = (nextStart + lastStart) / 2.0f;
        return new Result(resultString, null, new ResultPoint[]{new ResultPoint(left, rowNumber), new ResultPoint(right, rowNumber)}, BarcodeFormat.CODE_39);
    }

    private static int[] findAsteriskPattern(BitArray row, int[] counters) throws NotFoundException {
        int width = row.getSize();
        int rowOffset = row.getNextSet(0);
        int counterPosition = 0;
        int patternStart = rowOffset;
        boolean isWhite = false;
        int patternLength = counters.length;
        for (int i = rowOffset; i < width; i++) {
            if (row.get(i) ^ isWhite) {
                counters[counterPosition] = counters[counterPosition] + 1;
            } else {
                if (counterPosition == patternLength - 1) {
                    if (toNarrowWidePattern(counters) == ASTERISK_ENCODING && row.isRange(Math.max(0, patternStart - ((i - patternStart) >> 1)), patternStart, false)) {
                        return new int[]{patternStart, i};
                    }
                    patternStart += counters[0] + counters[1];
                    System.arraycopy(counters, 2, counters, 0, patternLength - 2);
                    counters[patternLength - 2] = 0;
                    counters[patternLength - 1] = 0;
                    counterPosition--;
                } else {
                    counterPosition++;
                }
                counters[counterPosition] = 1;
                isWhite = !isWhite;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static int toNarrowWidePattern(int[] counters) {
        int wideCounters;
        int numCounters = counters.length;
        int maxNarrowCounter = 0;
        do {
            int minCounter = Execute.INVALID;
            for (int counter : counters) {
                if (counter < minCounter && counter > maxNarrowCounter) {
                    minCounter = counter;
                }
            }
            maxNarrowCounter = minCounter;
            wideCounters = 0;
            int totalWideCountersWidth = 0;
            int pattern = 0;
            for (int i = 0; i < numCounters; i++) {
                int counter2 = counters[i];
                if (counters[i] > maxNarrowCounter) {
                    pattern |= 1 << ((numCounters - 1) - i);
                    wideCounters++;
                    totalWideCountersWidth += counter2;
                }
            }
            if (wideCounters == 3) {
                for (int i2 = 0; i2 < numCounters && wideCounters > 0; i2++) {
                    int counter3 = counters[i2];
                    if (counters[i2] > maxNarrowCounter) {
                        wideCounters--;
                        if ((counter3 << 1) >= totalWideCountersWidth) {
                            return -1;
                        }
                    }
                }
                return pattern;
            }
        } while (wideCounters > 3);
        return -1;
    }

    private static char patternToChar(int pattern) throws NotFoundException {
        for (int i = 0; i < CHARACTER_ENCODINGS.length; i++) {
            if (CHARACTER_ENCODINGS[i] == pattern) {
                return ALPHABET[i];
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static String decodeExtended(CharSequence encoded) throws FormatException {
        int length = encoded.length();
        StringBuilder decoded = new StringBuilder(length);
        int i = 0;
        while (i < length) {
            char c = encoded.charAt(i);
            if (c == '+' || c == '$' || c == '%' || c == '/') {
                char next = encoded.charAt(i + 1);
                char decodedChar = 0;
                switch (c) {
                    case '$':
                        if (next >= 'A' && next <= 'Z') {
                            decodedChar = (char) (next - '@');
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                        break;
                    case '%':
                        if (next >= 'A' && next <= 'E') {
                            decodedChar = (char) (next - '&');
                            break;
                        } else if (next >= 'F' && next <= 'W') {
                            decodedChar = (char) (next - 11);
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                        break;
                    case '+':
                        if (next >= 'A' && next <= 'Z') {
                            decodedChar = (char) (next + ' ');
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                        break;
                    case MotionEventCompat.AXIS_GENERIC_16 /* 47 */:
                        if (next >= 'A' && next <= 'O') {
                            decodedChar = (char) (next - ' ');
                            break;
                        } else if (next == 'Z') {
                            decodedChar = ':';
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                }
                decoded.append(decodedChar);
                i++;
            } else {
                decoded.append(c);
            }
            i++;
        }
        return decoded.toString();
    }
}
