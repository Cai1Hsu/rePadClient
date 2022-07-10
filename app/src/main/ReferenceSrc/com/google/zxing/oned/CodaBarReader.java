package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.Map;
import org.apache.tools.ant.taskdefs.Execute;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class CodaBarReader extends OneDReader {
    private static final int minCharacterLength = 6;
    private static final String ALPHABET_STRING = "0123456789-$:/.+ABCDTN";
    static final char[] ALPHABET = ALPHABET_STRING.toCharArray();
    static final int[] CHARACTER_ENCODINGS = {3, 6, 9, 96, 18, 66, 33, 36, 48, 72, 12, 24, 69, 81, 84, 21, 26, 41, 11, 14, 26, 41};
    private static final char[] STARTEND_ENCODING = {'E', '*', 'A', 'B', 'C', 'D', 'T', 'N'};

    @Override // com.google.zxing.oned.OneDReader
    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> hints) throws NotFoundException {
        int lastStart;
        int[] start = findAsteriskPattern(row);
        start[1] = 0;
        int nextStart = row.getNextSet(start[1]);
        int end = row.getSize();
        StringBuilder result = new StringBuilder();
        int[] counters = new int[7];
        do {
            for (int i = 0; i < counters.length; i++) {
                counters[i] = 0;
            }
            recordPattern(row, nextStart, counters);
            char decodedChar = toNarrowWidePattern(counters);
            if (decodedChar == '!') {
                throw NotFoundException.getNotFoundInstance();
            }
            result.append(decodedChar);
            lastStart = nextStart;
            for (int counter : counters) {
                nextStart += counter;
            }
            nextStart = row.getNextSet(nextStart);
        } while (nextStart < end);
        int lastPatternSize = 0;
        for (int counter2 : counters) {
            lastPatternSize += counter2;
        }
        int whiteSpaceAfterEnd = (nextStart - lastStart) - lastPatternSize;
        if (nextStart != end && whiteSpaceAfterEnd / 2 < lastPatternSize) {
            throw NotFoundException.getNotFoundInstance();
        }
        if (result.length() < 2) {
            throw NotFoundException.getNotFoundInstance();
        }
        char startchar = result.charAt(0);
        if (!arrayContains(STARTEND_ENCODING, startchar)) {
            throw NotFoundException.getNotFoundInstance();
        }
        int k = 1;
        while (true) {
            if (k >= result.length()) {
                break;
            } else if (result.charAt(k) != startchar || k + 1 == result.length()) {
                k++;
            } else {
                result.delete(k + 1, result.length() - 1);
                break;
            }
        }
        if (result.length() <= 6) {
            throw NotFoundException.getNotFoundInstance();
        }
        result.deleteCharAt(result.length() - 1);
        result.deleteCharAt(0);
        float left = (start[1] + start[0]) / 2.0f;
        float right = (nextStart + lastStart) / 2.0f;
        return new Result(result.toString(), null, new ResultPoint[]{new ResultPoint(left, rowNumber), new ResultPoint(right, rowNumber)}, BarcodeFormat.CODABAR);
    }

    private static int[] findAsteriskPattern(BitArray row) throws NotFoundException {
        int width = row.getSize();
        int rowOffset = row.getNextSet(0);
        int counterPosition = 0;
        int[] counters = new int[7];
        int patternStart = rowOffset;
        boolean isWhite = false;
        int patternLength = counters.length;
        for (int i = rowOffset; i < width; i++) {
            if (row.get(i) ^ isWhite) {
                counters[counterPosition] = counters[counterPosition] + 1;
            } else {
                if (counterPosition == patternLength - 1) {
                    try {
                        if (arrayContains(STARTEND_ENCODING, toNarrowWidePattern(counters)) && row.isRange(Math.max(0, patternStart - ((i - patternStart) / 2)), patternStart, false)) {
                            return new int[]{patternStart, i};
                        }
                    } catch (IllegalArgumentException e) {
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

    public static boolean arrayContains(char[] array, char key) {
        if (array != null) {
            for (char c : array) {
                if (c == key) {
                    return true;
                }
            }
        }
        return false;
    }

    private static char toNarrowWidePattern(int[] counters) {
        int numCounters = counters.length;
        int maxNarrowCounter = 0;
        int minCounter = Execute.INVALID;
        for (int i = 0; i < numCounters; i++) {
            if (counters[i] < minCounter) {
                minCounter = counters[i];
            }
            if (counters[i] > maxNarrowCounter) {
                maxNarrowCounter = counters[i];
            }
        }
        do {
            int wideCounters = 0;
            int pattern = 0;
            for (int i2 = 0; i2 < numCounters; i2++) {
                if (counters[i2] > maxNarrowCounter) {
                    pattern |= 1 << ((numCounters - 1) - i2);
                    wideCounters++;
                }
            }
            if (wideCounters == 2 || wideCounters == 3) {
                for (int i3 = 0; i3 < CHARACTER_ENCODINGS.length; i3++) {
                    if (CHARACTER_ENCODINGS[i3] == pattern) {
                        return ALPHABET[i3];
                    }
                }
            }
            maxNarrowCounter--;
        } while (maxNarrowCounter > minCounter);
        return '!';
    }
}
