package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultMetadataType;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.EnumMap;
import java.util.Map;
import org.apache.commons.io.FilenameUtils;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class UPCEANExtensionSupport {
    private final int[] decodeMiddleCounters = new int[4];
    private final StringBuilder decodeRowStringBuffer = new StringBuilder();
    private static final int[] EXTENSION_START_PATTERN = {1, 1, 2};
    private static final int[] CHECK_DIGIT_ENCODINGS = {24, 20, 18, 17, 12, 6, 3, 10, 9, 5};

    public Result decodeRow(int rowNumber, BitArray row, int rowOffset) throws NotFoundException {
        int[] extensionStartRange = UPCEANReader.findGuardPattern(row, rowOffset, false, EXTENSION_START_PATTERN);
        StringBuilder result = this.decodeRowStringBuffer;
        result.setLength(0);
        int end = decodeMiddle(row, extensionStartRange, result);
        String resultString = result.toString();
        Map<ResultMetadataType, Object> extensionData = parseExtensionString(resultString);
        Result extensionResult = new Result(resultString, null, new ResultPoint[]{new ResultPoint((extensionStartRange[0] + extensionStartRange[1]) / 2.0f, rowNumber), new ResultPoint(end, rowNumber)}, BarcodeFormat.UPC_EAN_EXTENSION);
        if (extensionData != null) {
            extensionResult.putAllMetadata(extensionData);
        }
        return extensionResult;
    }

    int decodeMiddle(BitArray row, int[] startRange, StringBuilder resultString) throws NotFoundException {
        int[] counters = this.decodeMiddleCounters;
        counters[0] = 0;
        counters[1] = 0;
        counters[2] = 0;
        counters[3] = 0;
        int end = row.getSize();
        int rowOffset = startRange[1];
        int lgPatternFound = 0;
        for (int x = 0; x < 5 && rowOffset < end; x++) {
            int bestMatch = UPCEANReader.decodeDigit(row, counters, rowOffset, UPCEANReader.L_AND_G_PATTERNS);
            resultString.append((char) ((bestMatch % 10) + 48));
            for (int counter : counters) {
                rowOffset += counter;
            }
            if (bestMatch >= 10) {
                lgPatternFound |= 1 << (4 - x);
            }
            if (x != 4) {
                rowOffset = row.getNextUnset(row.getNextSet(rowOffset));
            }
        }
        if (resultString.length() != 5) {
            throw NotFoundException.getNotFoundInstance();
        }
        int checkDigit = determineCheckDigit(lgPatternFound);
        if (extensionChecksum(resultString.toString()) != checkDigit) {
            throw NotFoundException.getNotFoundInstance();
        }
        return rowOffset;
    }

    private static int extensionChecksum(CharSequence s) {
        int length = s.length();
        int sum = 0;
        for (int i = length - 2; i >= 0; i -= 2) {
            sum += s.charAt(i) - '0';
        }
        int sum2 = sum * 3;
        for (int i2 = length - 1; i2 >= 0; i2 -= 2) {
            sum2 += s.charAt(i2) - '0';
        }
        return (sum2 * 3) % 10;
    }

    private static int determineCheckDigit(int lgPatternFound) throws NotFoundException {
        for (int d = 0; d < 10; d++) {
            if (lgPatternFound == CHECK_DIGIT_ENCODINGS[d]) {
                return d;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static Map<ResultMetadataType, Object> parseExtensionString(String raw) {
        ResultMetadataType type;
        Object parseExtension5String;
        switch (raw.length()) {
            case 2:
                type = ResultMetadataType.ISSUE_NUMBER;
                parseExtension5String = parseExtension2String(raw);
                break;
            case 3:
            case 4:
            default:
                return null;
            case 5:
                type = ResultMetadataType.SUGGESTED_PRICE;
                parseExtension5String = parseExtension5String(raw);
                break;
        }
        if (parseExtension5String != null) {
            Map<ResultMetadataType, Object> result = new EnumMap<>(ResultMetadataType.class);
            result.put(type, parseExtension5String);
            return result;
        }
        return null;
    }

    private static Integer parseExtension2String(String raw) {
        return Integer.valueOf(raw);
    }

    private static String parseExtension5String(String raw) {
        String currency;
        switch (raw.charAt(0)) {
            case '0':
                currency = "£";
                break;
            case '5':
                currency = "$";
                break;
            case '9':
                if ("90000".equals(raw)) {
                    return null;
                }
                if ("99991".equals(raw)) {
                    return "0.00";
                }
                if ("99990".equals(raw)) {
                    return "Used";
                }
                currency = "";
                break;
            default:
                currency = "";
                break;
        }
        int rawAmount = Integer.parseInt(raw.substring(1));
        String unitsString = String.valueOf(rawAmount / 100);
        int hundredths = rawAmount % 100;
        String hundredthsString = hundredths < 10 ? "0" + hundredths : String.valueOf(hundredths);
        return currency + unitsString + FilenameUtils.EXTENSION_SEPARATOR + hundredthsString;
    }
}
