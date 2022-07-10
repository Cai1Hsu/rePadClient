package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.Map;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class ITFReader extends OneDReader {
    private static final int MAX_AVG_VARIANCE = 107;
    private static final int MAX_INDIVIDUAL_VARIANCE = 204;
    private static final int N = 1;
    private static final int W = 3;
    private int narrowLineWidth = -1;
    private static final int[] DEFAULT_ALLOWED_LENGTHS = {44, 24, 20, 18, 16, 14, 12, 10, 8, 6};
    private static final int[] START_PATTERN = {1, 1, 1, 1};
    private static final int[] END_PATTERN_REVERSED = {1, 1, 3};
    static final int[][] PATTERNS = {new int[]{1, 1, 3, 3, 1}, new int[]{3, 1, 1, 1, 3}, new int[]{1, 3, 1, 1, 3}, new int[]{3, 3, 1, 1, 1}, new int[]{1, 1, 3, 1, 3}, new int[]{3, 1, 3, 1, 1}, new int[]{1, 3, 3, 1, 1}, new int[]{1, 1, 1, 3, 3}, new int[]{3, 1, 1, 3, 1}, new int[]{1, 3, 1, 3, 1}};

    @Override // com.google.zxing.oned.OneDReader
    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> hints) throws FormatException, NotFoundException {
        int[] startRange = decodeStart(row);
        int[] endRange = decodeEnd(row);
        StringBuilder result = new StringBuilder(20);
        decodeMiddle(row, startRange[1], endRange[0], result);
        String resultString = result.toString();
        int[] allowedLengths = null;
        if (hints != null) {
            int[] allowedLengths2 = (int[]) hints.get(DecodeHintType.ALLOWED_LENGTHS);
            allowedLengths = allowedLengths2;
        }
        if (allowedLengths == null) {
            allowedLengths = DEFAULT_ALLOWED_LENGTHS;
        }
        int length = resultString.length();
        boolean lengthOK = false;
        int[] arr$ = allowedLengths;
        int len$ = arr$.length;
        int i$ = 0;
        while (true) {
            if (i$ >= len$) {
                break;
            }
            int allowedLength = arr$[i$];
            if (length != allowedLength) {
                i$++;
            } else {
                lengthOK = true;
                break;
            }
        }
        if (!lengthOK) {
            throw FormatException.getFormatInstance();
        }
        return new Result(resultString, null, new ResultPoint[]{new ResultPoint(startRange[1], rowNumber), new ResultPoint(endRange[0], rowNumber)}, BarcodeFormat.ITF);
    }

    private static void decodeMiddle(BitArray row, int payloadStart, int payloadEnd, StringBuilder resultString) throws NotFoundException {
        int[] counterDigitPair = new int[10];
        int[] counterBlack = new int[5];
        int[] counterWhite = new int[5];
        while (payloadStart < payloadEnd) {
            recordPattern(row, payloadStart, counterDigitPair);
            for (int k = 0; k < 5; k++) {
                int twoK = k << 1;
                counterBlack[k] = counterDigitPair[twoK];
                counterWhite[k] = counterDigitPair[twoK + 1];
            }
            int bestMatch = decodeDigit(counterBlack);
            resultString.append((char) (bestMatch + 48));
            int bestMatch2 = decodeDigit(counterWhite);
            resultString.append((char) (bestMatch2 + 48));
            for (int counterDigit : counterDigitPair) {
                payloadStart += counterDigit;
            }
        }
    }

    int[] decodeStart(BitArray row) throws NotFoundException {
        int endStart = skipWhiteSpace(row);
        int[] startPattern = findGuardPattern(row, endStart, START_PATTERN);
        this.narrowLineWidth = (startPattern[1] - startPattern[0]) >> 2;
        validateQuietZone(row, startPattern[0]);
        return startPattern;
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x0016, code lost:
        throw com.google.zxing.NotFoundException.getNotFoundInstance();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void validateQuietZone(BitArray row, int startPattern) throws NotFoundException {
        int quietCount = this.narrowLineWidth * 10;
        for (int i = startPattern - 1; quietCount > 0 && i >= 0 && !row.get(i); i--) {
            quietCount--;
        }
    }

    private static int skipWhiteSpace(BitArray row) throws NotFoundException {
        int width = row.getSize();
        int endStart = row.getNextSet(0);
        if (endStart == width) {
            throw NotFoundException.getNotFoundInstance();
        }
        return endStart;
    }

    int[] decodeEnd(BitArray row) throws NotFoundException {
        row.reverse();
        try {
            int endStart = skipWhiteSpace(row);
            int[] endPattern = findGuardPattern(row, endStart, END_PATTERN_REVERSED);
            validateQuietZone(row, endPattern[0]);
            int temp = endPattern[0];
            endPattern[0] = row.getSize() - endPattern[1];
            endPattern[1] = row.getSize() - temp;
            return endPattern;
        } finally {
            row.reverse();
        }
    }

    private static int[] findGuardPattern(BitArray row, int rowOffset, int[] pattern) throws NotFoundException {
        int patternLength = pattern.length;
        int[] counters = new int[patternLength];
        int width = row.getSize();
        boolean isWhite = false;
        int counterPosition = 0;
        int patternStart = rowOffset;
        for (int x = rowOffset; x < width; x++) {
            if (row.get(x) ^ isWhite) {
                counters[counterPosition] = counters[counterPosition] + 1;
            } else {
                if (counterPosition == patternLength - 1) {
                    if (patternMatchVariance(counters, pattern, 204) < MAX_AVG_VARIANCE) {
                        return new int[]{patternStart, x};
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

    private static int decodeDigit(int[] counters) throws NotFoundException {
        int bestVariance = MAX_AVG_VARIANCE;
        int bestMatch = -1;
        int max = PATTERNS.length;
        for (int i = 0; i < max; i++) {
            int[] pattern = PATTERNS[i];
            int variance = patternMatchVariance(counters, pattern, 204);
            if (variance < bestVariance) {
                bestVariance = variance;
                bestMatch = i;
            }
        }
        if (bestMatch >= 0) {
            return bestMatch;
        }
        throw NotFoundException.getNotFoundInstance();
    }
}
