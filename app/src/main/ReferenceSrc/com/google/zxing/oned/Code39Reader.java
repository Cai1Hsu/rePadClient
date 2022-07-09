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
import org.apache.http.HttpStatus;

/* loaded from: classes.jar:com/google/zxing/oned/Code39Reader.class */
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

    public Code39Reader(boolean z) {
        this.usingCheckDigit = z;
        this.extendedMode = false;
    }

    public Code39Reader(boolean z, boolean z2) {
        this.usingCheckDigit = z;
        this.extendedMode = z2;
    }

    private static String decodeExtended(CharSequence charSequence) throws FormatException {
        char c;
        int length = charSequence.length();
        StringBuilder sb = new StringBuilder(length);
        int i = 0;
        while (i < length) {
            char charAt = charSequence.charAt(i);
            if (charAt == '+' || charAt == '$' || charAt == '%' || charAt == '/') {
                char charAt2 = charSequence.charAt(i + 1);
                switch (charAt) {
                    case '$':
                        if (charAt2 >= 'A' && charAt2 <= 'Z') {
                            c = (char) (charAt2 - '@');
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                        break;
                    case '%':
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
                    case '+':
                        if (charAt2 >= 'A' && charAt2 <= 'Z') {
                            c = (char) (charAt2 + ' ');
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                        break;
                    case '/':
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
                    default:
                        c = 0;
                        break;
                }
                sb.append(c);
                i++;
            } else {
                sb.append(charAt);
            }
            i++;
        }
        return sb.toString();
    }

    private static int[] findAsteriskPattern(BitArray bitArray, int[] iArr) throws NotFoundException {
        int size = bitArray.getSize();
        int nextSet = bitArray.getNextSet(0);
        int i = 0;
        int i2 = nextSet;
        boolean z = false;
        int length = iArr.length;
        while (nextSet < size) {
            if (bitArray.get(nextSet) ^ z) {
                iArr[i] = iArr[i] + 1;
            } else {
                if (i != length - 1) {
                    i++;
                } else if (toNarrowWidePattern(iArr) == ASTERISK_ENCODING && bitArray.isRange(Math.max(0, i2 - ((nextSet - i2) >> 1)), i2, false)) {
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

    private static int toNarrowWidePattern(int[] iArr) {
        int i;
        int length = iArr.length;
        int i2 = 0;
        while (true) {
            int i3 = Integer.MAX_VALUE;
            int i4 = 0;
            while (i4 < length) {
                int i5 = iArr[i4];
                int i6 = i3;
                if (i5 < i3) {
                    i6 = i3;
                    if (i5 > i2) {
                        i6 = i5;
                    }
                }
                i4++;
                i3 = i6;
            }
            i2 = i3;
            int i7 = 0;
            int i8 = 0;
            int i9 = 0;
            int i10 = 0;
            while (i10 < length) {
                int i11 = iArr[i10];
                int i12 = i9;
                int i13 = i8;
                int i14 = i7;
                if (iArr[i10] > i2) {
                    i12 = i9 | (1 << ((length - 1) - i10));
                    i14 = i7 + 1;
                    i13 = i8 + i11;
                }
                i10++;
                i9 = i12;
                i8 = i13;
                i7 = i14;
            }
            if (i7 != 3) {
                if (i7 <= 3) {
                    i = -1;
                    break;
                }
            } else {
                int i15 = 0;
                while (true) {
                    int i16 = i7;
                    i = i9;
                    if (i15 >= length) {
                        break;
                    }
                    i = i9;
                    if (i16 <= 0) {
                        break;
                    }
                    int i17 = iArr[i15];
                    i7 = i16;
                    if (iArr[i15] > i2) {
                        i7 = i16 - 1;
                        if ((i17 << 1) >= i8) {
                            i = -1;
                            break;
                        }
                    }
                    i15++;
                }
            }
        }
        return i;
    }

    @Override // com.google.zxing.oned.OneDReader
    public Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException {
        int[] findAsteriskPattern;
        int i2;
        char patternToChar;
        int nextSet;
        int[] iArr = new int[9];
        int nextSet2 = bitArray.getNextSet(findAsteriskPattern(bitArray, iArr)[1]);
        int size = bitArray.getSize();
        StringBuilder sb = new StringBuilder(20);
        do {
            i2 = nextSet2;
            recordPattern(bitArray, i2, iArr);
            int narrowWidePattern = toNarrowWidePattern(iArr);
            if (narrowWidePattern < 0) {
                throw NotFoundException.getNotFoundInstance();
            }
            patternToChar = patternToChar(narrowWidePattern);
            sb.append(patternToChar);
            int i3 = i2;
            for (int i4 : iArr) {
                i3 += i4;
            }
            nextSet = bitArray.getNextSet(i3);
            nextSet2 = nextSet;
        } while (patternToChar != '*');
        sb.setLength(sb.length() - 1);
        int i5 = 0;
        for (int i6 : iArr) {
            i5 += i6;
        }
        if (nextSet == size || (((nextSet - i2) - i5) >> 1) >= i5) {
            if (this.usingCheckDigit) {
                int length = sb.length() - 1;
                int i7 = 0;
                for (int i8 = 0; i8 < length; i8++) {
                    i7 += ALPHABET_STRING.indexOf(sb.charAt(i8));
                }
                if (sb.charAt(length) != ALPHABET[i7 % 43]) {
                    throw ChecksumException.getChecksumInstance();
                }
                sb.setLength(length);
            }
            if (sb.length() == 0) {
                throw NotFoundException.getNotFoundInstance();
            }
            return new Result(this.extendedMode ? decodeExtended(sb) : sb.toString(), null, new ResultPoint[]{new ResultPoint((findAsteriskPattern[1] + findAsteriskPattern[0]) / 2.0f, i), new ResultPoint((nextSet + i2) / 2.0f, i)}, BarcodeFormat.CODE_39);
        }
        throw NotFoundException.getNotFoundInstance();
    }
}
