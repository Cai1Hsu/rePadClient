package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.ResultMetadataType;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitArray;
import java.util.Arrays;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/oned/UPCEANReader.class */
public abstract class UPCEANReader extends OneDReader {
    private static final int MAX_AVG_VARIANCE = 122;
    private static final int MAX_INDIVIDUAL_VARIANCE = 179;
    static final int[] START_END_PATTERN = {1, 1, 1};
    static final int[] MIDDLE_PATTERN = {1, 1, 1, 1, 1};
    static final int[][] L_PATTERNS = {new int[]{3, 2, 1, 1}, new int[]{2, 2, 2, 1}, new int[]{2, 1, 2, 2}, new int[]{1, 4, 1, 1}, new int[]{1, 1, 3, 2}, new int[]{1, 2, 3, 1}, new int[]{1, 1, 1, 4}, new int[]{1, 3, 1, 2}, new int[]{1, 2, 1, 3}, new int[]{3, 1, 1, 2}};
    static final int[][] L_AND_G_PATTERNS = new int[20];
    private final StringBuilder decodeRowStringBuffer = new StringBuilder(20);
    private final UPCEANExtensionSupport extensionReader = new UPCEANExtensionSupport();
    private final EANManufacturerOrgSupport eanManSupport = new EANManufacturerOrgSupport();

    /* JADX WARN: Type inference failed for: r0v7, types: [int[], int[][]] */
    /* JADX WARN: Type inference failed for: r0v9, types: [int[], int[][]] */
    static {
        System.arraycopy(L_PATTERNS, 0, L_AND_G_PATTERNS, 0, 10);
        for (int i = 10; i < 20; i++) {
            int[] iArr = L_PATTERNS[i - 10];
            int[] iArr2 = new int[iArr.length];
            for (int i2 = 0; i2 < iArr.length; i2++) {
                iArr2[i2] = iArr[(iArr.length - i2) - 1];
            }
            L_AND_G_PATTERNS[i] = iArr2;
        }
    }

    protected UPCEANReader() {
    }

    private static boolean checkStandardUPCEANChecksum(CharSequence charSequence) throws FormatException {
        boolean z = false;
        int length = charSequence.length();
        if (length != 0) {
            int i = 0;
            for (int i2 = length - 2; i2 >= 0; i2 -= 2) {
                int charAt = charSequence.charAt(i2) - '0';
                if (charAt < 0 || charAt > 9) {
                    throw FormatException.getFormatInstance();
                }
                i += charAt;
            }
            int i3 = i * 3;
            for (int i4 = length - 1; i4 >= 0; i4 -= 2) {
                int charAt2 = charSequence.charAt(i4) - '0';
                if (charAt2 < 0 || charAt2 > 9) {
                    throw FormatException.getFormatInstance();
                }
                i3 += charAt2;
            }
            if (i3 % 10 == 0) {
                z = true;
            }
        }
        return z;
    }

    static int decodeDigit(BitArray bitArray, int[] iArr, int i, int[][] iArr2) throws NotFoundException {
        recordPattern(bitArray, i, iArr);
        int i2 = MAX_AVG_VARIANCE;
        int i3 = -1;
        int length = iArr2.length;
        int i4 = 0;
        while (i4 < length) {
            int patternMatchVariance = patternMatchVariance(iArr, iArr2[i4], MAX_INDIVIDUAL_VARIANCE);
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

    static int[] findGuardPattern(BitArray bitArray, int i, boolean z, int[] iArr) throws NotFoundException {
        return findGuardPattern(bitArray, i, z, iArr, new int[iArr.length]);
    }

    static int[] findGuardPattern(BitArray bitArray, int i, boolean z, int[] iArr, int[] iArr2) throws NotFoundException {
        int length = iArr.length;
        int size = bitArray.getSize();
        int nextUnset = z ? bitArray.getNextUnset(i) : bitArray.getNextSet(i);
        int i2 = nextUnset;
        boolean z2 = z;
        int i3 = 0;
        for (int i4 = nextUnset; i4 < size; i4++) {
            if (bitArray.get(i4) ^ z2) {
                iArr2[i3] = iArr2[i3] + 1;
            } else {
                if (i3 != length - 1) {
                    i3++;
                } else if (patternMatchVariance(iArr2, iArr, MAX_INDIVIDUAL_VARIANCE) < MAX_AVG_VARIANCE) {
                    return new int[]{i2, i4};
                } else {
                    i2 += iArr2[0] + iArr2[1];
                    System.arraycopy(iArr2, 2, iArr2, 0, length - 2);
                    iArr2[length - 2] = 0;
                    iArr2[length - 1] = 0;
                    i3--;
                }
                iArr2[i3] = 1;
                z2 = !z2;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    static int[] findStartGuardPattern(BitArray bitArray) throws NotFoundException {
        boolean z = false;
        int[] iArr = null;
        int i = 0;
        int[] iArr2 = new int[START_END_PATTERN.length];
        while (!z) {
            Arrays.fill(iArr2, 0, START_END_PATTERN.length, 0);
            int[] findGuardPattern = findGuardPattern(bitArray, i, false, START_END_PATTERN, iArr2);
            int i2 = findGuardPattern[0];
            int i3 = findGuardPattern[1];
            int i4 = i2 - (i3 - i2);
            i = i3;
            iArr = findGuardPattern;
            if (i4 >= 0) {
                z = bitArray.isRange(i4, i2, false);
                i = i3;
                iArr = findGuardPattern;
            }
        }
        return iArr;
    }

    boolean checkChecksum(String str) throws ChecksumException, FormatException {
        return checkStandardUPCEANChecksum(str);
    }

    int[] decodeEnd(BitArray bitArray, int i) throws NotFoundException {
        return findGuardPattern(bitArray, i, false, START_END_PATTERN);
    }

    protected abstract int decodeMiddle(BitArray bitArray, int[] iArr, StringBuilder sb) throws NotFoundException;

    @Override // com.google.zxing.oned.OneDReader
    public Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException {
        return decodeRow(i, bitArray, findStartGuardPattern(bitArray), map);
    }

    public Result decodeRow(int i, BitArray bitArray, int[] iArr, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException {
        String lookupCountryIdentifier;
        ResultPointCallback resultPointCallback = map == null ? null : (ResultPointCallback) map.get(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
        if (resultPointCallback != null) {
            resultPointCallback.foundPossibleResultPoint(new ResultPoint((iArr[0] + iArr[1]) / 2.0f, i));
        }
        StringBuilder sb = this.decodeRowStringBuffer;
        sb.setLength(0);
        int decodeMiddle = decodeMiddle(bitArray, iArr, sb);
        if (resultPointCallback != null) {
            resultPointCallback.foundPossibleResultPoint(new ResultPoint(decodeMiddle, i));
        }
        int[] decodeEnd = decodeEnd(bitArray, decodeMiddle);
        if (resultPointCallback != null) {
            resultPointCallback.foundPossibleResultPoint(new ResultPoint((decodeEnd[0] + decodeEnd[1]) / 2.0f, i));
        }
        int i2 = decodeEnd[1];
        int i3 = i2 + (i2 - decodeEnd[0]);
        if (i3 >= bitArray.getSize() || !bitArray.isRange(i2, i3, false)) {
            throw NotFoundException.getNotFoundInstance();
        }
        String sb2 = sb.toString();
        if (!checkChecksum(sb2)) {
            throw ChecksumException.getChecksumInstance();
        }
        float f = (iArr[1] + iArr[0]) / 2.0f;
        float f2 = (decodeEnd[1] + decodeEnd[0]) / 2.0f;
        BarcodeFormat barcodeFormat = getBarcodeFormat();
        Result result = new Result(sb2, null, new ResultPoint[]{new ResultPoint(f, i), new ResultPoint(f2, i)}, barcodeFormat);
        try {
            Result decodeRow = this.extensionReader.decodeRow(i, bitArray, decodeEnd[1]);
            result.putAllMetadata(decodeRow.getResultMetadata());
            result.addResultPoints(decodeRow.getResultPoints());
        } catch (ReaderException e) {
        }
        if ((barcodeFormat == BarcodeFormat.EAN_13 || barcodeFormat == BarcodeFormat.UPC_A) && (lookupCountryIdentifier = this.eanManSupport.lookupCountryIdentifier(sb2)) != null) {
            result.putMetadata(ResultMetadataType.POSSIBLE_COUNTRY, lookupCountryIdentifier);
        }
        return result;
    }

    abstract BarcodeFormat getBarcodeFormat();
}
