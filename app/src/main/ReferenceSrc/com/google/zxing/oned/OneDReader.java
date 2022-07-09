package com.google.zxing.oned;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Reader;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.ResultMetadataType;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.Arrays;
import java.util.EnumMap;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/oned/OneDReader.class */
public abstract class OneDReader implements Reader {
    protected static final int INTEGER_MATH_SHIFT = 8;
    protected static final int PATTERN_MATCH_RESULT_SCALE_FACTOR = 256;

    /* JADX WARN: Code restructure failed: missing block: B:70:0x0178, code lost:
        continue;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private Result doDecode(BinaryBitmap binaryBitmap, Map<DecodeHintType, ?> map) throws NotFoundException {
        BitArray bitArray;
        Map<DecodeHintType, ?> map2;
        Result decodeRow;
        int width = binaryBitmap.getWidth();
        int height = binaryBitmap.getHeight();
        BitArray bitArray2 = new BitArray(width);
        boolean z = map != null && map.containsKey(DecodeHintType.TRY_HARDER);
        int max = Math.max(1, height >> (z ? 8 : 5));
        int i = z ? height : 15;
        int i2 = 0;
        loop0: while (i2 < i) {
            int i3 = (i2 + 1) >> 1;
            int i4 = (height >> 1) + (max * ((i2 & 1) == 0 ? i3 : -i3));
            if (i4 < 0 || i4 >= height) {
                break;
            }
            try {
                BitArray blackRow = binaryBitmap.getBlackRow(i4, bitArray2);
                int i5 = 0;
                while (true) {
                    bitArray = blackRow;
                    map2 = map;
                    if (i5 < 2) {
                        EnumMap enumMap = map;
                        if (i5 == 1) {
                            blackRow.reverse();
                            enumMap = map;
                            if (map != null) {
                                enumMap = map;
                                if (map.containsKey(DecodeHintType.NEED_RESULT_POINT_CALLBACK)) {
                                    enumMap = new EnumMap(DecodeHintType.class);
                                    enumMap.putAll(map);
                                    enumMap.remove(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
                                }
                            }
                        }
                        try {
                            decodeRow = decodeRow(i4, blackRow, enumMap);
                            if (i5 != 1) {
                                break loop0;
                            }
                            decodeRow.putMetadata(ResultMetadataType.ORIENTATION, 180);
                            ResultPoint[] resultPoints = decodeRow.getResultPoints();
                            if (resultPoints == null) {
                                break loop0;
                            }
                            resultPoints[0] = new ResultPoint((width - resultPoints[0].getX()) - 1.0f, resultPoints[0].getY());
                            resultPoints[1] = new ResultPoint((width - resultPoints[1].getX()) - 1.0f, resultPoints[1].getY());
                            break loop0;
                        } catch (ReaderException e) {
                            i5++;
                            map = enumMap;
                        }
                    }
                }
                return decodeRow;
            } catch (NotFoundException e2) {
                map2 = map;
                bitArray = bitArray2;
            }
        }
        throw NotFoundException.getNotFoundInstance();
        i2++;
        bitArray2 = bitArray;
        map = map2;
    }

    protected static int patternMatchVariance(int[] iArr, int[] iArr2, int i) {
        int i2;
        int length = iArr.length;
        int i3 = 0;
        int i4 = 0;
        for (int i5 = 0; i5 < length; i5++) {
            i3 += iArr[i5];
            i4 += iArr2[i5];
        }
        if (i3 >= i4) {
            int i6 = (i3 << 8) / i4;
            int i7 = 0;
            int i8 = 0;
            while (true) {
                if (i8 >= length) {
                    i2 = i7 / i3;
                    break;
                }
                int i9 = iArr[i8] << 8;
                int i10 = iArr2[i8] * i6;
                int i11 = i9 > i10 ? i9 - i10 : i10 - i9;
                i2 = Integer.MAX_VALUE;
                if (i11 > ((i * i6) >> 8)) {
                    break;
                }
                i7 += i11;
                i8++;
            }
        } else {
            i2 = Integer.MAX_VALUE;
        }
        return i2;
    }

    protected static void recordPattern(BitArray bitArray, int i, int[] iArr) throws NotFoundException {
        int length = iArr.length;
        Arrays.fill(iArr, 0, length, 0);
        int size = bitArray.getSize();
        if (i >= size) {
            throw NotFoundException.getNotFoundInstance();
        }
        int i2 = 0;
        boolean z = !bitArray.get(i);
        int i3 = i;
        while (true) {
            int i4 = i2;
            i2 = i4;
            if (i3 >= size) {
                break;
            }
            if (bitArray.get(i3) ^ z) {
                iArr[i4] = iArr[i4] + 1;
                i2 = i4;
            } else {
                i2 = i4 + 1;
                if (i2 == length) {
                    break;
                }
                iArr[i2] = 1;
                z = !z;
            }
            i3++;
        }
        if (i2 == length) {
            return;
        }
        if (i2 != length - 1 || i3 != size) {
            throw NotFoundException.getNotFoundInstance();
        }
    }

    protected static void recordPatternInReverse(BitArray bitArray, int i, int[] iArr) throws NotFoundException {
        int length = iArr.length;
        boolean z = bitArray.get(i);
        while (i > 0 && length >= 0) {
            int i2 = i - 1;
            i = i2;
            if (bitArray.get(i2) != z) {
                length--;
                z = !z;
                i = i2;
            }
        }
        if (length >= 0) {
            throw NotFoundException.getNotFoundInstance();
        }
        recordPattern(bitArray, i + 1, iArr);
    }

    @Override // com.google.zxing.Reader
    public Result decode(BinaryBitmap binaryBitmap) throws NotFoundException, FormatException {
        return decode(binaryBitmap, null);
    }

    @Override // com.google.zxing.Reader
    public Result decode(BinaryBitmap binaryBitmap, Map<DecodeHintType, ?> map) throws NotFoundException, FormatException {
        Result result;
        try {
            result = doDecode(binaryBitmap, map);
        } catch (NotFoundException e) {
            if (!(map != null && map.containsKey(DecodeHintType.TRY_HARDER)) || !binaryBitmap.isRotateSupported()) {
                throw e;
            }
            BinaryBitmap rotateCounterClockwise = binaryBitmap.rotateCounterClockwise();
            Result doDecode = doDecode(rotateCounterClockwise, map);
            Map<ResultMetadataType, Object> resultMetadata = doDecode.getResultMetadata();
            int i = 270;
            if (resultMetadata != null) {
                i = 270;
                if (resultMetadata.containsKey(ResultMetadataType.ORIENTATION)) {
                    i = (((Integer) resultMetadata.get(ResultMetadataType.ORIENTATION)).intValue() + 270) % 360;
                }
            }
            doDecode.putMetadata(ResultMetadataType.ORIENTATION, Integer.valueOf(i));
            ResultPoint[] resultPoints = doDecode.getResultPoints();
            result = doDecode;
            if (resultPoints != null) {
                int height = rotateCounterClockwise.getHeight();
                int i2 = 0;
                while (true) {
                    result = doDecode;
                    if (i2 >= resultPoints.length) {
                        break;
                    }
                    resultPoints[i2] = new ResultPoint((height - resultPoints[i2].getY()) - 1.0f, resultPoints[i2].getX());
                    i2++;
                }
            }
        }
        return result;
    }

    public abstract Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException;

    @Override // com.google.zxing.Reader
    public void reset() {
    }
}
