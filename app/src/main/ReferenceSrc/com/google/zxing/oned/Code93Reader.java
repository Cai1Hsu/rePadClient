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

/* loaded from: classes.jar:com/google/zxing/oned/Code93Reader.class */
public final class Code93Reader extends OneDReader {
    private static final String ALPHABET_STRING = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%abcd*";
    private static final char[] ALPHABET = ALPHABET_STRING.toCharArray();
    private static final int[] CHARACTER_ENCODINGS = {276, 328, 324, 322, 296, 292, 290, 336, MessageHeaderInterface.SHAREDSECRETERRORRESPONSE, 266, HttpStatus.SC_FAILED_DEPENDENCY, 420, 418, HttpStatus.SC_NOT_FOUND, HttpStatus.SC_PAYMENT_REQUIRED, 394, 360, 356, SMTPReply.START_MAIL_INPUT, 308, 282, 344, FTPReply.NEED_ACCOUNT, 326, HttpStatus.SC_MULTIPLE_CHOICES, 278, NNTPReply.TRANSFER_FAILED, 434, 428, 422, HttpStatus.SC_NOT_ACCEPTABLE, HttpStatus.SC_GONE, 364, 358, 310, 314, HttpStatus.SC_MOVED_TEMPORARILY, 468, 466, 458, 366, 374, NNTPReply.NO_SUCH_ARTICLE_FOUND, 294, 474, 470, 306, FTPReply.FILE_ACTION_PENDING};
    private static final int ASTERISK_ENCODING = CHARACTER_ENCODINGS[47];

    private static void checkChecksums(CharSequence charSequence) throws ChecksumException {
        int length = charSequence.length();
        checkOneChecksum(charSequence, length - 2, 20);
        checkOneChecksum(charSequence, length - 1, 15);
    }

    private static void checkOneChecksum(CharSequence charSequence, int i, int i2) throws ChecksumException {
        int i3 = 1;
        int i4 = 0;
        for (int i5 = i - 1; i5 >= 0; i5--) {
            i4 += ALPHABET_STRING.indexOf(charSequence.charAt(i5)) * i3;
            int i6 = i3 + 1;
            i3 = i6;
            if (i6 > i2) {
                i3 = 1;
            }
        }
        if (charSequence.charAt(i) != ALPHABET[i4 % 47]) {
            throw ChecksumException.getChecksumInstance();
        }
    }

    private static String decodeExtended(CharSequence charSequence) throws FormatException {
        char c;
        int length = charSequence.length();
        StringBuilder sb = new StringBuilder(length);
        int i = 0;
        while (i < length) {
            char charAt = charSequence.charAt(i);
            if (charAt < 'a' || charAt > 'd') {
                sb.append(charAt);
            } else {
                char charAt2 = charSequence.charAt(i + 1);
                switch (charAt) {
                    case 'a':
                        if (charAt2 >= 'A' && charAt2 <= 'Z') {
                            c = (char) (charAt2 - '@');
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                        break;
                    case 'b':
                        if (charAt2 >= 'A' && charAt2 <= 'E') {
                            c = (char) (charAt2 - '&');
                            break;
                        } else if (charAt2 >= 'F' && charAt2 <= 'W') {
                            c = (char) (charAt2 - 11);
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                        break;
                    case 'c':
                        if (charAt2 >= 'A' && charAt2 <= 'O') {
                            c = (char) (charAt2 - ' ');
                            break;
                        } else if (charAt2 != 'Z') {
                            throw FormatException.getFormatInstance();
                        } else {
                            c = ':';
                            break;
                        }
                        break;
                    case 'd':
                        if (charAt2 >= 'A' && charAt2 <= 'Z') {
                            c = (char) (charAt2 + ' ');
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                        break;
                    default:
                        c = 0;
                        break;
                }
                sb.append(c);
                i++;
            }
            i++;
        }
        return sb.toString();
    }

    private static int[] findAsteriskPattern(BitArray bitArray) throws NotFoundException {
        int size = bitArray.getSize();
        int nextSet = bitArray.getNextSet(0);
        int i = 0;
        int[] iArr = new int[6];
        int i2 = nextSet;
        boolean z = false;
        int length = iArr.length;
        while (nextSet < size) {
            if (bitArray.get(nextSet) ^ z) {
                iArr[i] = iArr[i] + 1;
            } else {
                if (i != length - 1) {
                    i++;
                } else if (toPattern(iArr) == ASTERISK_ENCODING) {
                    return new int[]{i2, nextSet};
                } else {
                    i2 += iArr[0] + iArr[1];
                    System.arraycopy(iArr, 2, iArr, 0, length - 2);
                    iArr[length - 2] = 0;
                    iArr[length - 1] = 0;
                    i--;
                }
                iArr[i] = 1;
                z = !z;
            }
            nextSet++;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static char patternToChar(int i) throws NotFoundException {
        for (int i2 = 0; i2 < CHARACTER_ENCODINGS.length; i2++) {
            if (CHARACTER_ENCODINGS[i2] == i) {
                return ALPHABET[i2];
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static int toPattern(int[] iArr) {
        int i;
        int i2;
        int length = iArr.length;
        int i3 = 0;
        for (int i4 : iArr) {
            i3 += i4;
        }
        int i5 = 0;
        int i6 = 0;
        while (true) {
            i = i5;
            if (i6 >= length) {
                break;
            }
            int i7 = ((iArr[i6] << 8) * 9) / i3;
            int i8 = i7 >> 8;
            int i9 = i8;
            if ((i7 & 255) > 127) {
                i9 = i8 + 1;
            }
            if (i9 < 1 || i9 > 4) {
                break;
            }
            if ((i6 & 1) == 0) {
                int i10 = 0;
                while (true) {
                    i2 = i5;
                    if (i10 < i9) {
                        i5 = (i5 << 1) | 1;
                        i10++;
                    }
                }
            } else {
                i2 = i5 << i9;
            }
            i6++;
            i5 = i2;
        }
        i = -1;
        return i;
    }

    @Override // com.google.zxing.oned.OneDReader
    public Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException {
        int[] findAsteriskPattern;
        int i2;
        char patternToChar;
        int nextSet;
        int nextSet2 = bitArray.getNextSet(findAsteriskPattern(bitArray)[1]);
        int size = bitArray.getSize();
        StringBuilder sb = new StringBuilder(20);
        int[] iArr = new int[6];
        do {
            i2 = nextSet2;
            recordPattern(bitArray, i2, iArr);
            int pattern = toPattern(iArr);
            if (pattern < 0) {
                throw NotFoundException.getNotFoundInstance();
            }
            patternToChar = patternToChar(pattern);
            sb.append(patternToChar);
            int i3 = i2;
            for (int i4 : iArr) {
                i3 += i4;
            }
            nextSet = bitArray.getNextSet(i3);
            nextSet2 = nextSet;
        } while (patternToChar != '*');
        sb.deleteCharAt(sb.length() - 1);
        if (nextSet == size || !bitArray.get(nextSet)) {
            throw NotFoundException.getNotFoundInstance();
        }
        if (sb.length() < 2) {
            throw NotFoundException.getNotFoundInstance();
        }
        checkChecksums(sb);
        sb.setLength(sb.length() - 2);
        return new Result(decodeExtended(sb), null, new ResultPoint[]{new ResultPoint((findAsteriskPattern[1] + findAsteriskPattern[0]) / 2.0f, i), new ResultPoint((nextSet + i2) / 2.0f, i)}, BarcodeFormat.CODE_93);
    }
}
