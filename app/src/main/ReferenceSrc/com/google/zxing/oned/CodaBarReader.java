package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/oned/CodaBarReader.class */
public final class CodaBarReader extends OneDReader {
    private static final int minCharacterLength = 6;
    private static final String ALPHABET_STRING = "0123456789-$:/.+ABCDTN";
    static final char[] ALPHABET = ALPHABET_STRING.toCharArray();
    static final int[] CHARACTER_ENCODINGS = {3, 6, 9, 96, 18, 66, 33, 36, 48, 72, 12, 24, 69, 81, 84, 21, 26, 41, 11, 14, 26, 41};
    private static final char[] STARTEND_ENCODING = {'E', '*', 'A', 'B', 'C', 'D', 'T', 'N'};

    static boolean arrayContains(char[] cArr, char c) {
        boolean z;
        if (cArr != null) {
            for (char c2 : cArr) {
                if (c2 == c) {
                    z = true;
                    break;
                }
            }
        }
        z = false;
        return z;
    }

    private static int[] findAsteriskPattern(BitArray bitArray) throws NotFoundException {
        int size = bitArray.getSize();
        int nextSet = bitArray.getNextSet(0);
        int i = 0;
        int[] iArr = new int[7];
        int i2 = nextSet;
        boolean z = false;
        int length = iArr.length;
        while (nextSet < size) {
            if (bitArray.get(nextSet) ^ z) {
                iArr[i] = iArr[i] + 1;
            } else {
                if (i == length - 1) {
                    try {
                        if (arrayContains(STARTEND_ENCODING, toNarrowWidePattern(iArr)) && bitArray.isRange(Math.max(0, i2 - ((nextSet - i2) / 2)), i2, false)) {
                            return new int[]{i2, nextSet};
                        }
                    } catch (IllegalArgumentException e) {
                    }
                    i2 += iArr[0] + iArr[1];
                    System.arraycopy(iArr, 2, iArr, 0, length - 2);
                    iArr[length - 2] = 0;
                    iArr[length - 1] = 0;
                    i--;
                } else {
                    i++;
                }
                iArr[i] = 1;
                z = !z;
            }
            nextSet++;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static char toNarrowWidePattern(int[] iArr) {
        int i;
        char c;
        int length = iArr.length;
        int i2 = 0;
        int i3 = Integer.MAX_VALUE;
        int i4 = 0;
        while (true) {
            i = i2;
            if (i4 < length) {
                int i5 = i3;
                if (iArr[i4] < i3) {
                    i5 = iArr[i4];
                }
                int i6 = i2;
                if (iArr[i4] > i2) {
                    i6 = iArr[i4];
                }
                i4++;
                i2 = i6;
                i3 = i5;
            }
        }
        loop1: while (true) {
            int i7 = 0;
            int i8 = 0;
            int i9 = 0;
            while (i9 < length) {
                int i10 = i8;
                int i11 = i7;
                if (iArr[i9] > i) {
                    i10 = i8 | (1 << ((length - 1) - i9));
                    i11 = i7 + 1;
                }
                i9++;
                i8 = i10;
                i7 = i11;
            }
            if (i7 == 2 || i7 == 3) {
                for (int i12 = 0; i12 < CHARACTER_ENCODINGS.length; i12++) {
                    if (CHARACTER_ENCODINGS[i12] == i8) {
                        c = ALPHABET[i12];
                        break loop1;
                    }
                }
            }
            int i13 = i - 1;
            i = i13;
            if (i13 <= i3) {
                c = '!';
                break;
            }
        }
        return c;
    }

    @Override // com.google.zxing.oned.OneDReader
    public Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException {
        int i2;
        int nextSet;
        int[] findAsteriskPattern = findAsteriskPattern(bitArray);
        findAsteriskPattern[1] = 0;
        int nextSet2 = bitArray.getNextSet(findAsteriskPattern[1]);
        int size = bitArray.getSize();
        StringBuilder sb = new StringBuilder();
        int[] iArr = new int[7];
        do {
            i2 = nextSet2;
            for (int i3 = 0; i3 < iArr.length; i3++) {
                iArr[i3] = 0;
            }
            recordPattern(bitArray, i2, iArr);
            char narrowWidePattern = toNarrowWidePattern(iArr);
            if (narrowWidePattern == '!') {
                throw NotFoundException.getNotFoundInstance();
            }
            sb.append(narrowWidePattern);
            int i4 = i2;
            for (int i5 : iArr) {
                i4 += i5;
            }
            nextSet = bitArray.getNextSet(i4);
            nextSet2 = nextSet;
        } while (nextSet < size);
        int i6 = 0;
        for (int i7 : iArr) {
            i6 += i7;
        }
        if (nextSet == size || ((nextSet - i2) - i6) / 2 >= i6) {
            if (sb.length() < 2) {
                throw NotFoundException.getNotFoundInstance();
            }
            char charAt = sb.charAt(0);
            if (!arrayContains(STARTEND_ENCODING, charAt)) {
                throw NotFoundException.getNotFoundInstance();
            }
            int i8 = 1;
            while (true) {
                if (i8 >= sb.length()) {
                    break;
                }
                if (sb.charAt(i8) == charAt && i8 + 1 != sb.length()) {
                    sb.delete(i8 + 1, sb.length() - 1);
                    break;
                }
                i8++;
            }
            if (sb.length() <= 6) {
                throw NotFoundException.getNotFoundInstance();
            }
            sb.deleteCharAt(sb.length() - 1);
            sb.deleteCharAt(0);
            return new Result(sb.toString(), null, new ResultPoint[]{new ResultPoint((findAsteriskPattern[1] + findAsteriskPattern[0]) / 2.0f, i), new ResultPoint((nextSet + i2) / 2.0f, i)}, BarcodeFormat.CODABAR);
        }
        throw NotFoundException.getNotFoundInstance();
    }
}
