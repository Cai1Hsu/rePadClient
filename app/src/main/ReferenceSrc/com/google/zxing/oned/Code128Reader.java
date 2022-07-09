package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.ArrayList;
import java.util.Map;
import org.apache.http.HttpStatus;

/* loaded from: classes.jar:com/google/zxing/oned/Code128Reader.class */
public final class Code128Reader extends OneDReader {
    private static final int CODE_CODE_A = 101;
    private static final int CODE_CODE_B = 100;
    private static final int CODE_CODE_C = 99;
    private static final int CODE_FNC_1 = 102;
    private static final int CODE_FNC_2 = 97;
    private static final int CODE_FNC_3 = 96;
    private static final int CODE_FNC_4_A = 101;
    private static final int CODE_FNC_4_B = 100;
    static final int[][] CODE_PATTERNS = {new int[]{2, 1, 2, 2, 2, 2}, new int[]{2, 2, 2, 1, 2, 2}, new int[]{2, 2, 2, 2, 2, 1}, new int[]{1, 2, 1, 2, 2, 3}, new int[]{1, 2, 1, 3, 2, 2}, new int[]{1, 3, 1, 2, 2, 2}, new int[]{1, 2, 2, 2, 1, 3}, new int[]{1, 2, 2, 3, 1, 2}, new int[]{1, 3, 2, 2, 1, 2}, new int[]{2, 2, 1, 2, 1, 3}, new int[]{2, 2, 1, 3, 1, 2}, new int[]{2, 3, 1, 2, 1, 2}, new int[]{1, 1, 2, 2, 3, 2}, new int[]{1, 2, 2, 1, 3, 2}, new int[]{1, 2, 2, 2, 3, 1}, new int[]{1, 1, 3, 2, 2, 2}, new int[]{1, 2, 3, 1, 2, 2}, new int[]{1, 2, 3, 2, 2, 1}, new int[]{2, 2, 3, 2, 1, 1}, new int[]{2, 2, 1, 1, 3, 2}, new int[]{2, 2, 1, 2, 3, 1}, new int[]{2, 1, 3, 2, 1, 2}, new int[]{2, 2, 3, 1, 1, 2}, new int[]{3, 1, 2, 1, 3, 1}, new int[]{3, 1, 1, 2, 2, 2}, new int[]{3, 2, 1, 1, 2, 2}, new int[]{3, 2, 1, 2, 2, 1}, new int[]{3, 1, 2, 2, 1, 2}, new int[]{3, 2, 2, 1, 1, 2}, new int[]{3, 2, 2, 2, 1, 1}, new int[]{2, 1, 2, 1, 2, 3}, new int[]{2, 1, 2, 3, 2, 1}, new int[]{2, 3, 2, 1, 2, 1}, new int[]{1, 1, 1, 3, 2, 3}, new int[]{1, 3, 1, 1, 2, 3}, new int[]{1, 3, 1, 3, 2, 1}, new int[]{1, 1, 2, 3, 1, 3}, new int[]{1, 3, 2, 1, 1, 3}, new int[]{1, 3, 2, 3, 1, 1}, new int[]{2, 1, 1, 3, 1, 3}, new int[]{2, 3, 1, 1, 1, 3}, new int[]{2, 3, 1, 3, 1, 1}, new int[]{1, 1, 2, 1, 3, 3}, new int[]{1, 1, 2, 3, 3, 1}, new int[]{1, 3, 2, 1, 3, 1}, new int[]{1, 1, 3, 1, 2, 3}, new int[]{1, 1, 3, 3, 2, 1}, new int[]{1, 3, 3, 1, 2, 1}, new int[]{3, 1, 3, 1, 2, 1}, new int[]{2, 1, 1, 3, 3, 1}, new int[]{2, 3, 1, 1, 3, 1}, new int[]{2, 1, 3, 1, 1, 3}, new int[]{2, 1, 3, 3, 1, 1}, new int[]{2, 1, 3, 1, 3, 1}, new int[]{3, 1, 1, 1, 2, 3}, new int[]{3, 1, 1, 3, 2, 1}, new int[]{3, 3, 1, 1, 2, 1}, new int[]{3, 1, 2, 1, 1, 3}, new int[]{3, 1, 2, 3, 1, 1}, new int[]{3, 3, 2, 1, 1, 1}, new int[]{3, 1, 4, 1, 1, 1}, new int[]{2, 2, 1, 4, 1, 1}, new int[]{4, 3, 1, 1, 1, 1}, new int[]{1, 1, 1, 2, 2, 4}, new int[]{1, 1, 1, 4, 2, 2}, new int[]{1, 2, 1, 1, 2, 4}, new int[]{1, 2, 1, 4, 2, 1}, new int[]{1, 4, 1, 1, 2, 2}, new int[]{1, 4, 1, 2, 2, 1}, new int[]{1, 1, 2, 2, 1, 4}, new int[]{1, 1, 2, 4, 1, 2}, new int[]{1, 2, 2, 1, 1, 4}, new int[]{1, 2, 2, 4, 1, 1}, new int[]{1, 4, 2, 1, 1, 2}, new int[]{1, 4, 2, 2, 1, 1}, new int[]{2, 4, 1, 2, 1, 1}, new int[]{2, 2, 1, 1, 1, 4}, new int[]{4, 1, 3, 1, 1, 1}, new int[]{2, 4, 1, 1, 1, 2}, new int[]{1, 3, 4, 1, 1, 1}, new int[]{1, 1, 1, 2, 4, 2}, new int[]{1, 2, 1, 1, 4, 2}, new int[]{1, 2, 1, 2, 4, 1}, new int[]{1, 1, 4, 2, 1, 2}, new int[]{1, 2, 4, 1, 1, 2}, new int[]{1, 2, 4, 2, 1, 1}, new int[]{4, 1, 1, 2, 1, 2}, new int[]{4, 2, 1, 1, 1, 2}, new int[]{4, 2, 1, 2, 1, 1}, new int[]{2, 1, 2, 1, 4, 1}, new int[]{2, 1, 4, 1, 2, 1}, new int[]{4, 1, 2, 1, 2, 1}, new int[]{1, 1, 1, 1, 4, 3}, new int[]{1, 1, 1, 3, 4, 1}, new int[]{1, 3, 1, 1, 4, 1}, new int[]{1, 1, 4, 1, 1, 3}, new int[]{1, 1, 4, 3, 1, 1}, new int[]{4, 1, 1, 1, 1, 3}, new int[]{4, 1, 1, 3, 1, 1}, new int[]{1, 1, 3, 1, 4, 1}, new int[]{1, 1, 4, 1, 3, 1}, new int[]{3, 1, 1, 1, 4, 1}, new int[]{4, 1, 1, 1, 3, 1}, new int[]{2, 1, 1, 4, 1, 2}, new int[]{2, 1, 1, 2, 1, 4}, new int[]{2, 1, 1, 2, 3, 2}, new int[]{2, 3, 3, 1, 1, 1, 2}};
    private static final int CODE_SHIFT = 98;
    private static final int CODE_START_A = 103;
    private static final int CODE_START_B = 104;
    private static final int CODE_START_C = 105;
    private static final int CODE_STOP = 106;
    private static final int MAX_AVG_VARIANCE = 64;
    private static final int MAX_INDIVIDUAL_VARIANCE = 179;

    private static int decodeCode(BitArray bitArray, int[] iArr, int i) throws NotFoundException {
        recordPattern(bitArray, i, iArr);
        int i2 = 64;
        int i3 = -1;
        int i4 = 0;
        while (i4 < CODE_PATTERNS.length) {
            int patternMatchVariance = patternMatchVariance(iArr, CODE_PATTERNS[i4], MAX_INDIVIDUAL_VARIANCE);
            int i5 = i2;
            if (patternMatchVariance < i2) {
                i5 = patternMatchVariance;
                i3 = i4;
            }
            i4++;
            i2 = i5;
        }
        if (i3 >= 0) {
            return i3;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static int[] findStartPattern(BitArray bitArray) throws NotFoundException {
        int i;
        int size = bitArray.getSize();
        int nextSet = bitArray.getNextSet(0);
        int i2 = 0;
        int[] iArr = new int[6];
        int i3 = nextSet;
        boolean z = false;
        int length = iArr.length;
        while (nextSet < size) {
            if (bitArray.get(nextSet) ^ z) {
                iArr[i2] = iArr[i2] + 1;
                i = i2;
            } else {
                if (i2 == length - 1) {
                    int i4 = 64;
                    int i5 = -1;
                    int i6 = 103;
                    while (i6 <= CODE_START_C) {
                        int patternMatchVariance = patternMatchVariance(iArr, CODE_PATTERNS[i6], MAX_INDIVIDUAL_VARIANCE);
                        int i7 = i4;
                        if (patternMatchVariance < i4) {
                            i7 = patternMatchVariance;
                            i5 = i6;
                        }
                        i6++;
                        i4 = i7;
                    }
                    if (i5 >= 0 && bitArray.isRange(Math.max(0, i3 - ((nextSet - i3) / 2)), i3, false)) {
                        return new int[]{i3, nextSet, i5};
                    }
                    i3 += iArr[0] + iArr[1];
                    System.arraycopy(iArr, 2, iArr, 0, length - 2);
                    iArr[length - 2] = 0;
                    iArr[length - 1] = 0;
                    i = i2 - 1;
                } else {
                    i = i2 + 1;
                }
                iArr[i] = 1;
                z = !z;
            }
            nextSet++;
            i2 = i;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    @Override // com.google.zxing.oned.OneDReader
    public Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException, FormatException, ChecksumException {
        char c;
        char c2;
        boolean z;
        boolean z2;
        int[] findStartPattern = findStartPattern(bitArray);
        int i2 = findStartPattern[2];
        switch (i2) {
            case 103:
                c = 'e';
                break;
            case CODE_START_B /* 104 */:
                c = 'd';
                break;
            case CODE_START_C /* 105 */:
                c = CODE_CODE_C;
                break;
            default:
                throw FormatException.getFormatInstance();
        }
        boolean z3 = false;
        boolean z4 = false;
        StringBuilder sb = new StringBuilder(20);
        ArrayList arrayList = new ArrayList(20);
        int i3 = findStartPattern[0];
        int i4 = findStartPattern[1];
        int[] iArr = new int[6];
        int i5 = 0;
        int i6 = 0;
        int i7 = 0;
        boolean z5 = true;
        char c3 = c;
        while (true) {
            boolean z6 = z4;
            if (z3) {
                int nextUnset = bitArray.getNextUnset(i4);
                if (!bitArray.isRange(nextUnset, Math.min(bitArray.getSize(), ((nextUnset - i3) / 2) + nextUnset), false)) {
                    throw NotFoundException.getNotFoundInstance();
                }
                if ((i2 - (i7 * i5)) % 103 != i5) {
                    throw ChecksumException.getChecksumInstance();
                }
                int length = sb.length();
                if (length == 0) {
                    throw NotFoundException.getNotFoundInstance();
                }
                if (length > 0 && z5) {
                    if (c3 == CODE_CODE_C) {
                        sb.delete(length - 2, length);
                    } else {
                        sb.delete(length - 1, length);
                    }
                }
                float f = (findStartPattern[1] + findStartPattern[0]) / 2.0f;
                float f2 = (nextUnset + i3) / 2.0f;
                int size = arrayList.size();
                byte[] bArr = new byte[size];
                for (int i8 = 0; i8 < size; i8++) {
                    bArr[i8] = ((Byte) arrayList.get(i8)).byteValue();
                }
                return new Result(sb.toString(), bArr, new ResultPoint[]{new ResultPoint(f, i), new ResultPoint(f2, i)}, BarcodeFormat.CODE_128);
            }
            int i9 = i6;
            int decodeCode = decodeCode(bitArray, iArr, i4);
            arrayList.add(Byte.valueOf((byte) decodeCode));
            boolean z7 = z5;
            if (decodeCode != CODE_STOP) {
                z7 = true;
            }
            int i10 = i2;
            int i11 = i7;
            if (decodeCode != CODE_STOP) {
                i11 = i7 + 1;
                i10 = i2 + (i11 * decodeCode);
            }
            int i12 = i4;
            int i13 = i4;
            for (int i14 : iArr) {
                i13 += i14;
            }
            switch (decodeCode) {
                case 103:
                case CODE_START_B /* 104 */:
                case CODE_START_C /* 105 */:
                    throw FormatException.getFormatInstance();
                default:
                    switch (c3) {
                        case CODE_CODE_C /* 99 */:
                            if (decodeCode < 100) {
                                if (decodeCode < 10) {
                                    sb.append('0');
                                }
                                sb.append(decodeCode);
                                c2 = c3;
                                z = z3;
                                z2 = false;
                                break;
                            } else {
                                boolean z8 = z7;
                                if (decodeCode != CODE_STOP) {
                                    z8 = false;
                                }
                                c2 = c3;
                                z = z3;
                                z2 = false;
                                z7 = z8;
                                switch (decodeCode) {
                                    case 100:
                                        c2 = 'd';
                                        z = z3;
                                        z2 = false;
                                        z7 = z8;
                                        break;
                                    case HttpStatus.SC_SWITCHING_PROTOCOLS /* 101 */:
                                        c2 = 'e';
                                        z = z3;
                                        z2 = false;
                                        z7 = z8;
                                        break;
                                    case 102:
                                        break;
                                    case 103:
                                    case CODE_START_B /* 104 */:
                                    case CODE_START_C /* 105 */:
                                    default:
                                        c2 = c3;
                                        z = z3;
                                        z2 = false;
                                        z7 = z8;
                                        break;
                                    case CODE_STOP /* 106 */:
                                        z = true;
                                        c2 = c3;
                                        z2 = false;
                                        z7 = z8;
                                        break;
                                }
                            }
                        case 'd':
                            if (decodeCode < 96) {
                                sb.append((char) (decodeCode + 32));
                                c2 = c3;
                                z = z3;
                                z2 = false;
                                break;
                            } else {
                                boolean z9 = z7;
                                if (decodeCode != CODE_STOP) {
                                    z9 = false;
                                }
                                c2 = c3;
                                z = z3;
                                z2 = false;
                                z7 = z9;
                                switch (decodeCode) {
                                    case 96:
                                    case CODE_FNC_2 /* 97 */:
                                    case 100:
                                    case 102:
                                        break;
                                    case CODE_SHIFT /* 98 */:
                                        z2 = true;
                                        c2 = 'e';
                                        z = z3;
                                        z7 = z9;
                                        break;
                                    case CODE_CODE_C /* 99 */:
                                        c2 = CODE_CODE_C;
                                        z = z3;
                                        z2 = false;
                                        z7 = z9;
                                        break;
                                    case HttpStatus.SC_SWITCHING_PROTOCOLS /* 101 */:
                                        c2 = 'e';
                                        z = z3;
                                        z2 = false;
                                        z7 = z9;
                                        break;
                                    case 103:
                                    case CODE_START_B /* 104 */:
                                    case CODE_START_C /* 105 */:
                                    default:
                                        c2 = c3;
                                        z = z3;
                                        z2 = false;
                                        z7 = z9;
                                        break;
                                    case CODE_STOP /* 106 */:
                                        z = true;
                                        c2 = c3;
                                        z2 = false;
                                        z7 = z9;
                                        break;
                                }
                            }
                        case HttpStatus.SC_SWITCHING_PROTOCOLS /* 101 */:
                            if (decodeCode < 64) {
                                sb.append((char) (decodeCode + 32));
                                c2 = c3;
                                z = z3;
                                z2 = false;
                                break;
                            } else if (decodeCode < 96) {
                                sb.append((char) (decodeCode - 64));
                                c2 = c3;
                                z = z3;
                                z2 = false;
                                break;
                            } else {
                                boolean z10 = z7;
                                if (decodeCode != CODE_STOP) {
                                    z10 = false;
                                }
                                c2 = c3;
                                z = z3;
                                z2 = false;
                                z7 = z10;
                                switch (decodeCode) {
                                    case 96:
                                    case CODE_FNC_2 /* 97 */:
                                    case HttpStatus.SC_SWITCHING_PROTOCOLS /* 101 */:
                                    case 102:
                                        break;
                                    case CODE_SHIFT /* 98 */:
                                        z2 = true;
                                        c2 = 'd';
                                        z = z3;
                                        z7 = z10;
                                        break;
                                    case CODE_CODE_C /* 99 */:
                                        c2 = CODE_CODE_C;
                                        z = z3;
                                        z2 = false;
                                        z7 = z10;
                                        break;
                                    case 100:
                                        c2 = 'd';
                                        z = z3;
                                        z2 = false;
                                        z7 = z10;
                                        break;
                                    case 103:
                                    case CODE_START_B /* 104 */:
                                    case CODE_START_C /* 105 */:
                                    default:
                                        c2 = c3;
                                        z = z3;
                                        z2 = false;
                                        z7 = z10;
                                        break;
                                    case CODE_STOP /* 106 */:
                                        z = true;
                                        c2 = c3;
                                        z2 = false;
                                        z7 = z10;
                                        break;
                                }
                            }
                            break;
                        default:
                            z2 = false;
                            z = z3;
                            c2 = c3;
                            break;
                    }
                    i2 = i10;
                    i6 = decodeCode;
                    c3 = c2;
                    z3 = z;
                    z4 = z2;
                    z5 = z7;
                    i5 = i9;
                    i3 = i12;
                    i7 = i11;
                    i4 = i13;
                    if (z6) {
                        c3 = c2 == 'e' ? 'd' : 'e';
                        i2 = i10;
                        i6 = decodeCode;
                        z3 = z;
                        z4 = z2;
                        z5 = z7;
                        i5 = i9;
                        i3 = i12;
                        i7 = i11;
                        i4 = i13;
                    }
            }
        }
    }
}
