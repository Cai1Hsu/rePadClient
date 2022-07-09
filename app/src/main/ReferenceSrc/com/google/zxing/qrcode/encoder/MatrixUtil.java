package com.google.zxing.qrcode.encoder;

import android.support.v4.media.TransportMediator;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitArray;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.http.HttpStatus;

/* loaded from: classes.jar:com/google/zxing/qrcode/encoder/MatrixUtil.class */
final class MatrixUtil {
    private static final int TYPE_INFO_MASK_PATTERN = 21522;
    private static final int TYPE_INFO_POLY = 1335;
    private static final int VERSION_INFO_POLY = 7973;
    private static final int[][] POSITION_DETECTION_PATTERN = {new int[]{1, 1, 1, 1, 1, 1, 1}, new int[]{1, 0, 0, 0, 0, 0, 1}, new int[]{1, 0, 1, 1, 1, 0, 1}, new int[]{1, 0, 1, 1, 1, 0, 1}, new int[]{1, 0, 1, 1, 1, 0, 1}, new int[]{1, 0, 0, 0, 0, 0, 1}, new int[]{1, 1, 1, 1, 1, 1, 1}};
    private static final int[][] HORIZONTAL_SEPARATION_PATTERN = {new int[]{0, 0, 0, 0, 0, 0, 0, 0}};
    private static final int[][] VERTICAL_SEPARATION_PATTERN = {new int[]{0}, new int[]{0}, new int[]{0}, new int[]{0}, new int[]{0}, new int[]{0}, new int[]{0}};
    private static final int[][] POSITION_ADJUSTMENT_PATTERN = {new int[]{1, 1, 1, 1, 1}, new int[]{1, 0, 0, 0, 1}, new int[]{1, 0, 1, 0, 1}, new int[]{1, 0, 0, 0, 1}, new int[]{1, 1, 1, 1, 1}};
    private static final int[][] POSITION_ADJUSTMENT_PATTERN_COORDINATE_TABLE = {new int[]{-1, -1, -1, -1, -1, -1, -1}, new int[]{6, 18, -1, -1, -1, -1, -1}, new int[]{6, 22, -1, -1, -1, -1, -1}, new int[]{6, 26, -1, -1, -1, -1, -1}, new int[]{6, 30, -1, -1, -1, -1, -1}, new int[]{6, 34, -1, -1, -1, -1, -1}, new int[]{6, 22, 38, -1, -1, -1, -1}, new int[]{6, 24, 42, -1, -1, -1, -1}, new int[]{6, 26, 46, -1, -1, -1, -1}, new int[]{6, 28, 50, -1, -1, -1, -1}, new int[]{6, 30, 54, -1, -1, -1, -1}, new int[]{6, 32, 58, -1, -1, -1, -1}, new int[]{6, 34, 62, -1, -1, -1, -1}, new int[]{6, 26, 46, 66, -1, -1, -1}, new int[]{6, 26, 48, 70, -1, -1, -1}, new int[]{6, 26, 50, 74, -1, -1, -1}, new int[]{6, 30, 54, 78, -1, -1, -1}, new int[]{6, 30, 56, 82, -1, -1, -1}, new int[]{6, 30, 58, 86, -1, -1, -1}, new int[]{6, 34, 62, 90, -1, -1, -1}, new int[]{6, 28, 50, 72, 94, -1, -1}, new int[]{6, 26, 50, 74, 98, -1, -1}, new int[]{6, 30, 54, 78, HttpStatus.SC_PROCESSING, -1, -1}, new int[]{6, 28, 54, 80, 106, -1, -1}, new int[]{6, 32, 58, 84, 110, -1, -1}, new int[]{6, 30, 58, 86, 114, -1, -1}, new int[]{6, 34, 62, 90, 118, -1, -1}, new int[]{6, 26, 50, 74, 98, 122, -1}, new int[]{6, 30, 54, 78, HttpStatus.SC_PROCESSING, TransportMediator.KEYCODE_MEDIA_PLAY, -1}, new int[]{6, 26, 52, 78, 104, TransportMediator.KEYCODE_MEDIA_RECORD, -1}, new int[]{6, 30, 56, 82, 108, 134, -1}, new int[]{6, 34, 60, 86, 112, 138, -1}, new int[]{6, 30, 58, 86, 114, 142, -1}, new int[]{6, 34, 62, 90, 118, 146, -1}, new int[]{6, 30, 54, 78, HttpStatus.SC_PROCESSING, TransportMediator.KEYCODE_MEDIA_PLAY, FTPReply.FILE_STATUS_OK}, new int[]{6, 24, 50, 76, HttpStatus.SC_PROCESSING, 128, 154}, new int[]{6, 28, 54, 80, 106, 132, 158}, new int[]{6, 32, 58, 84, 110, 136, 162}, new int[]{6, 26, 54, 82, 110, 138, 166}, new int[]{6, 30, 58, 86, 114, 142, 170}};
    private static final int[][] TYPE_INFO_COORDINATES = {new int[]{8, 0}, new int[]{8, 1}, new int[]{8, 2}, new int[]{8, 3}, new int[]{8, 4}, new int[]{8, 5}, new int[]{8, 7}, new int[]{8, 8}, new int[]{7, 8}, new int[]{5, 8}, new int[]{4, 8}, new int[]{3, 8}, new int[]{2, 8}, new int[]{1, 8}, new int[]{0, 8}};

    private MatrixUtil() {
    }

    static void buildMatrix(BitArray bitArray, ErrorCorrectionLevel errorCorrectionLevel, int i, int i2, ByteMatrix byteMatrix) throws WriterException {
        clearMatrix(byteMatrix);
        embedBasicPatterns(i, byteMatrix);
        embedTypeInfo(errorCorrectionLevel, i2, byteMatrix);
        maybeEmbedVersionInfo(i, byteMatrix);
        embedDataBits(bitArray, i2, byteMatrix);
    }

    static int calculateBCHCode(int i, int i2) {
        int findMSBSet = findMSBSet(i2);
        int i3 = i << (findMSBSet - 1);
        while (true) {
            int i4 = i3;
            if (findMSBSet(i4) >= findMSBSet) {
                i3 = i4 ^ (i2 << (findMSBSet(i4) - findMSBSet));
            } else {
                return i4;
            }
        }
    }

    static void clearMatrix(ByteMatrix byteMatrix) {
        byteMatrix.clear((byte) -1);
    }

    static void embedBasicPatterns(int i, ByteMatrix byteMatrix) throws WriterException {
        embedPositionDetectionPatternsAndSeparators(byteMatrix);
        embedDarkDotAtLeftBottomCorner(byteMatrix);
        maybeEmbedPositionAdjustmentPatterns(i, byteMatrix);
        embedTimingPatterns(byteMatrix);
    }

    private static void embedDarkDotAtLeftBottomCorner(ByteMatrix byteMatrix) throws WriterException {
        if (byteMatrix.get(8, byteMatrix.getHeight() - 8) == 0) {
            throw new WriterException();
        }
        byteMatrix.set(8, byteMatrix.getHeight() - 8, 1);
    }

    static void embedDataBits(BitArray bitArray, int i, ByteMatrix byteMatrix) throws WriterException {
        boolean z;
        int i2 = 0;
        int i3 = -1;
        int width = byteMatrix.getWidth() - 1;
        int height = byteMatrix.getHeight() - 1;
        while (width > 0) {
            int i4 = i2;
            int i5 = width;
            int i6 = height;
            if (width == 6) {
                i5 = width - 1;
                i6 = height;
                i4 = i2;
            }
            while (i6 >= 0 && i6 < byteMatrix.getHeight()) {
                int i7 = i4;
                for (int i8 = 0; i8 < 2; i8++) {
                    int i9 = i5 - i8;
                    if (isEmpty(byteMatrix.get(i9, i6))) {
                        if (i7 < bitArray.getSize()) {
                            z = bitArray.get(i7);
                            i7++;
                        } else {
                            z = false;
                        }
                        boolean z2 = z;
                        if (i != -1) {
                            z2 = z;
                            if (MaskUtil.getDataMaskBit(i, i9, i6)) {
                                z2 = !z;
                            }
                        }
                        byteMatrix.set(i9, i6, z2);
                    }
                }
                i6 += i3;
                i4 = i7;
            }
            i3 = -i3;
            height = i6 + i3;
            width = i5 - 2;
            i2 = i4;
        }
        if (i2 != bitArray.getSize()) {
            throw new WriterException("Not all bits consumed: " + i2 + '/' + bitArray.getSize());
        }
    }

    private static void embedHorizontalSeparationPattern(int i, int i2, ByteMatrix byteMatrix) throws WriterException {
        if (HORIZONTAL_SEPARATION_PATTERN[0].length == 8 && HORIZONTAL_SEPARATION_PATTERN.length == 1) {
            for (int i3 = 0; i3 < 8; i3++) {
                if (!isEmpty(byteMatrix.get(i + i3, i2))) {
                    throw new WriterException();
                }
                byteMatrix.set(i + i3, i2, HORIZONTAL_SEPARATION_PATTERN[0][i3]);
            }
            return;
        }
        throw new WriterException("Bad horizontal separation pattern");
    }

    private static void embedPositionAdjustmentPattern(int i, int i2, ByteMatrix byteMatrix) throws WriterException {
        if (POSITION_ADJUSTMENT_PATTERN[0].length == 5 && POSITION_ADJUSTMENT_PATTERN.length == 5) {
            for (int i3 = 0; i3 < 5; i3++) {
                for (int i4 = 0; i4 < 5; i4++) {
                    if (!isEmpty(byteMatrix.get(i + i4, i2 + i3))) {
                        throw new WriterException();
                    }
                    byteMatrix.set(i + i4, i2 + i3, POSITION_ADJUSTMENT_PATTERN[i3][i4]);
                }
            }
            return;
        }
        throw new WriterException("Bad position adjustment");
    }

    private static void embedPositionDetectionPattern(int i, int i2, ByteMatrix byteMatrix) throws WriterException {
        if (POSITION_DETECTION_PATTERN[0].length == 7 && POSITION_DETECTION_PATTERN.length == 7) {
            for (int i3 = 0; i3 < 7; i3++) {
                for (int i4 = 0; i4 < 7; i4++) {
                    if (!isEmpty(byteMatrix.get(i + i4, i2 + i3))) {
                        throw new WriterException();
                    }
                    byteMatrix.set(i + i4, i2 + i3, POSITION_DETECTION_PATTERN[i3][i4]);
                }
            }
            return;
        }
        throw new WriterException("Bad position detection pattern");
    }

    private static void embedPositionDetectionPatternsAndSeparators(ByteMatrix byteMatrix) throws WriterException {
        int length = POSITION_DETECTION_PATTERN[0].length;
        embedPositionDetectionPattern(0, 0, byteMatrix);
        embedPositionDetectionPattern(byteMatrix.getWidth() - length, 0, byteMatrix);
        embedPositionDetectionPattern(0, byteMatrix.getWidth() - length, byteMatrix);
        int length2 = HORIZONTAL_SEPARATION_PATTERN[0].length;
        embedHorizontalSeparationPattern(0, length2 - 1, byteMatrix);
        embedHorizontalSeparationPattern(byteMatrix.getWidth() - length2, length2 - 1, byteMatrix);
        embedHorizontalSeparationPattern(0, byteMatrix.getWidth() - length2, byteMatrix);
        int length3 = VERTICAL_SEPARATION_PATTERN.length;
        embedVerticalSeparationPattern(length3, 0, byteMatrix);
        embedVerticalSeparationPattern((byteMatrix.getHeight() - length3) - 1, 0, byteMatrix);
        embedVerticalSeparationPattern(length3, byteMatrix.getHeight() - length3, byteMatrix);
    }

    private static void embedTimingPatterns(ByteMatrix byteMatrix) throws WriterException {
        for (int i = 8; i < byteMatrix.getWidth() - 8; i++) {
            int i2 = (i + 1) % 2;
            if (!isValidValue(byteMatrix.get(i, 6))) {
                throw new WriterException();
            }
            if (isEmpty(byteMatrix.get(i, 6))) {
                byteMatrix.set(i, 6, i2);
            }
            if (!isValidValue(byteMatrix.get(6, i))) {
                throw new WriterException();
            }
            if (isEmpty(byteMatrix.get(6, i))) {
                byteMatrix.set(6, i, i2);
            }
        }
    }

    static void embedTypeInfo(ErrorCorrectionLevel errorCorrectionLevel, int i, ByteMatrix byteMatrix) throws WriterException {
        BitArray bitArray = new BitArray();
        makeTypeInfoBits(errorCorrectionLevel, i, bitArray);
        for (int i2 = 0; i2 < bitArray.getSize(); i2++) {
            boolean z = bitArray.get((bitArray.getSize() - 1) - i2);
            byteMatrix.set(TYPE_INFO_COORDINATES[i2][0], TYPE_INFO_COORDINATES[i2][1], z);
            if (i2 < 8) {
                byteMatrix.set((byteMatrix.getWidth() - i2) - 1, 8, z);
            } else {
                byteMatrix.set(8, (byteMatrix.getHeight() - 7) + (i2 - 8), z);
            }
        }
    }

    private static void embedVerticalSeparationPattern(int i, int i2, ByteMatrix byteMatrix) throws WriterException {
        if (VERTICAL_SEPARATION_PATTERN[0].length == 1 && VERTICAL_SEPARATION_PATTERN.length == 7) {
            for (int i3 = 0; i3 < 7; i3++) {
                if (!isEmpty(byteMatrix.get(i, i2 + i3))) {
                    throw new WriterException();
                }
                byteMatrix.set(i, i2 + i3, VERTICAL_SEPARATION_PATTERN[i3][0]);
            }
            return;
        }
        throw new WriterException("Bad vertical separation pattern");
    }

    static int findMSBSet(int i) {
        int i2 = i;
        int i3 = 0;
        while (i2 != 0) {
            i2 >>>= 1;
            i3++;
        }
        return i3;
    }

    private static boolean isEmpty(int i) {
        return i == -1;
    }

    private static boolean isValidValue(int i) {
        boolean z = true;
        if (i != -1) {
            z = true;
            if (i != 0) {
                z = i == 1;
            }
        }
        return z;
    }

    static void makeTypeInfoBits(ErrorCorrectionLevel errorCorrectionLevel, int i, BitArray bitArray) throws WriterException {
        if (!QRCode.isValidMaskPattern(i)) {
            throw new WriterException("Invalid mask pattern");
        }
        int bits = (errorCorrectionLevel.getBits() << 3) | i;
        bitArray.appendBits(bits, 5);
        bitArray.appendBits(calculateBCHCode(bits, TYPE_INFO_POLY), 10);
        BitArray bitArray2 = new BitArray();
        bitArray2.appendBits(TYPE_INFO_MASK_PATTERN, 15);
        bitArray.xor(bitArray2);
        if (bitArray.getSize() == 15) {
            return;
        }
        throw new WriterException("should not happen but we got: " + bitArray.getSize());
    }

    static void makeVersionInfoBits(int i, BitArray bitArray) throws WriterException {
        bitArray.appendBits(i, 6);
        bitArray.appendBits(calculateBCHCode(i, VERSION_INFO_POLY), 12);
        if (bitArray.getSize() != 18) {
            throw new WriterException("should not happen but we got: " + bitArray.getSize());
        }
    }

    private static void maybeEmbedPositionAdjustmentPatterns(int i, ByteMatrix byteMatrix) throws WriterException {
        if (i < 2) {
            return;
        }
        int i2 = i - 1;
        int[] iArr = POSITION_ADJUSTMENT_PATTERN_COORDINATE_TABLE[i2];
        int length = POSITION_ADJUSTMENT_PATTERN_COORDINATE_TABLE[i2].length;
        for (int i3 = 0; i3 < length; i3++) {
            for (int i4 = 0; i4 < length; i4++) {
                int i5 = iArr[i3];
                int i6 = iArr[i4];
                if (i6 != -1 && i5 != -1 && isEmpty(byteMatrix.get(i6, i5))) {
                    embedPositionAdjustmentPattern(i6 - 2, i5 - 2, byteMatrix);
                }
            }
        }
    }

    static void maybeEmbedVersionInfo(int i, ByteMatrix byteMatrix) throws WriterException {
        if (i < 7) {
            return;
        }
        BitArray bitArray = new BitArray();
        makeVersionInfoBits(i, bitArray);
        int i2 = 17;
        for (int i3 = 0; i3 < 6; i3++) {
            for (int i4 = 0; i4 < 3; i4++) {
                boolean z = bitArray.get(i2);
                i2--;
                byteMatrix.set(i3, (byteMatrix.getHeight() - 11) + i4, z);
                byteMatrix.set((byteMatrix.getHeight() - 11) + i4, i3, z);
            }
        }
    }
}
