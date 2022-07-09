package com.google.zxing.oned;

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
import org.apache.commons.net.ftp.FTPReply;
import org.apache.commons.net.nntp.NNTPReply;
import org.apache.commons.net.smtp.SMTPReply;
import org.apache.http.HttpStatus;

/* loaded from: classes.dex */
public final class Code93Reader extends OneDReader {
    private static final String ALPHABET_STRING = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%abcd*";
    private static final char[] ALPHABET = ALPHABET_STRING.toCharArray();
    private static final int[] CHARACTER_ENCODINGS = {276, 328, 324, 322, 296, 292, 290, 336, MessageHeaderInterface.SHAREDSECRETERRORRESPONSE, 266, HttpStatus.SC_FAILED_DEPENDENCY, 420, 418, HttpStatus.SC_NOT_FOUND, HttpStatus.SC_PAYMENT_REQUIRED, 394, 360, 356, SMTPReply.START_MAIL_INPUT, 308, 282, 344, FTPReply.NEED_ACCOUNT, 326, HttpStatus.SC_MULTIPLE_CHOICES, 278, NNTPReply.TRANSFER_FAILED, 434, 428, 422, HttpStatus.SC_NOT_ACCEPTABLE, HttpStatus.SC_GONE, 364, 358, 310, 314, HttpStatus.SC_MOVED_TEMPORARILY, 468, 466, 458, 366, 374, NNTPReply.NO_SUCH_ARTICLE_FOUND, 294, 474, 470, 306, FTPReply.FILE_ACTION_PENDING};
    private static final int ASTERISK_ENCODING = CHARACTER_ENCODINGS[47];

    @Override // com.google.zxing.oned.OneDReader
    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> hints) throws NotFoundException, ChecksumException, FormatException {
        char decodedChar;
        int lastStart;
        int[] start = findAsteriskPattern(row);
        int nextStart = row.getNextSet(start[1]);
        int end = row.getSize();
        StringBuilder result = new StringBuilder(20);
        int[] counters = new int[6];
        do {
            recordPattern(row, nextStart, counters);
            int pattern = toPattern(counters);
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
        result.deleteCharAt(result.length() - 1);
        if (nextStart == end || !row.get(nextStart)) {
            throw NotFoundException.getNotFoundInstance();
        }
        if (result.length() < 2) {
            throw NotFoundException.getNotFoundInstance();
        }
        checkChecksums(result);
        result.setLength(result.length() - 2);
        String resultString = decodeExtended(result);
        float left = (start[1] + start[0]) / 2.0f;
        float right = (nextStart + lastStart) / 2.0f;
        return new Result(resultString, null, new ResultPoint[]{new ResultPoint(left, rowNumber), new ResultPoint(right, rowNumber)}, BarcodeFormat.CODE_93);
    }

    private static int[] findAsteriskPattern(BitArray row) throws NotFoundException {
        int width = row.getSize();
        int rowOffset = row.getNextSet(0);
        int counterPosition = 0;
        int[] counters = new int[6];
        int patternStart = rowOffset;
        boolean isWhite = false;
        int patternLength = counters.length;
        for (int i = rowOffset; i < width; i++) {
            if (row.get(i) ^ isWhite) {
                counters[counterPosition] = counters[counterPosition] + 1;
            } else {
                if (counterPosition == patternLength - 1) {
                    if (toPattern(counters) == ASTERISK_ENCODING) {
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

    private static int toPattern(int[] counters) {
        int max = counters.length;
        int sum = 0;
        for (int i : counters) {
            sum += i;
        }
        int pattern = 0;
        for (int i2 = 0; i2 < max; i2++) {
            int scaledShifted = ((counters[i2] << 8) * 9) / sum;
            int scaledUnshifted = scaledShifted >> 8;
            if ((scaledShifted & 255) > 127) {
                scaledUnshifted++;
            }
            if (scaledUnshifted < 1 || scaledUnshifted > 4) {
                return -1;
            }
            if ((i2 & 1) == 0) {
                for (int j = 0; j < scaledUnshifted; j++) {
                    pattern = (pattern << 1) | 1;
                }
            } else {
                pattern <<= scaledUnshifted;
            }
        }
        return pattern;
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
            if (c >= 'a' && c <= 'd') {
                char next = encoded.charAt(i + 1);
                char decodedChar = 0;
                switch (c) {
                    case 'a':
                        if (next >= 'A' && next <= 'Z') {
                            decodedChar = (char) (next - '@');
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                        break;
                    case 'b':
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
                    case 'c':
                        if (next >= 'A' && next <= 'O') {
                            decodedChar = (char) (next - ' ');
                            break;
                        } else if (next == 'Z') {
                            decodedChar = ':';
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                        break;
                    case 'd':
                        if (next >= 'A' && next <= 'Z') {
                            decodedChar = (char) (next + ' ');
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

    private static void checkChecksums(CharSequence result) throws ChecksumException {
        int length = result.length();
        checkOneChecksum(result, length - 2, 20);
        checkOneChecksum(result, length - 1, 15);
    }

    private static void checkOneChecksum(CharSequence result, int checkPosition, int weightMax) throws ChecksumException {
        int weight = 1;
        int total = 0;
        for (int i = checkPosition - 1; i >= 0; i--) {
            total += ALPHABET_STRING.indexOf(result.charAt(i)) * weight;
            weight++;
            if (weight > weightMax) {
                weight = 1;
            }
        }
        if (result.charAt(checkPosition) != ALPHABET[total % 47]) {
            throw ChecksumException.getChecksumInstance();
        }
    }
}
