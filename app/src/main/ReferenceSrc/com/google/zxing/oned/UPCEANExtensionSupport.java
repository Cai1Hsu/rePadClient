package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultMetadataType;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.EnumMap;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/oned/UPCEANExtensionSupport.class */
final class UPCEANExtensionSupport {
    private final int[] decodeMiddleCounters = new int[4];
    private final StringBuilder decodeRowStringBuffer = new StringBuilder();
    private static final int[] EXTENSION_START_PATTERN = {1, 1, 2};
    private static final int[] CHECK_DIGIT_ENCODINGS = {24, 20, 18, 17, 12, 6, 3, 10, 9, 5};

    UPCEANExtensionSupport() {
    }

    private static int determineCheckDigit(int i) throws NotFoundException {
        for (int i2 = 0; i2 < 10; i2++) {
            if (i == CHECK_DIGIT_ENCODINGS[i2]) {
                return i2;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static int extensionChecksum(CharSequence charSequence) {
        int length = charSequence.length();
        int i = 0;
        for (int i2 = length - 2; i2 >= 0; i2 -= 2) {
            i += charSequence.charAt(i2) - '0';
        }
        int i3 = i * 3;
        for (int i4 = length - 1; i4 >= 0; i4 -= 2) {
            i3 += charSequence.charAt(i4) - '0';
        }
        return (i3 * 3) % 10;
    }

    private static Integer parseExtension2String(String str) {
        return Integer.valueOf(str);
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0044  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static String parseExtension5String(String str) {
        String str2;
        String str3;
        int i;
        switch (str.charAt(0)) {
            case '0':
                str2 = "£";
                int parseInt = Integer.parseInt(str.substring(1));
                int i2 = parseInt / 100;
                str3 = str2 + String.valueOf(i2) + '.' + (parseInt % 100 >= 10 ? "0" + i : String.valueOf(i));
                break;
            case '5':
                str2 = "$";
                int parseInt2 = Integer.parseInt(str.substring(1));
                int i22 = parseInt2 / 100;
                str3 = str2 + String.valueOf(i22) + '.' + (parseInt2 % 100 >= 10 ? "0" + i : String.valueOf(i));
                break;
            case '9':
                if (!"90000".equals(str)) {
                    if (!"99991".equals(str)) {
                        if (!"99990".equals(str)) {
                            str2 = "";
                            int parseInt22 = Integer.parseInt(str.substring(1));
                            int i222 = parseInt22 / 100;
                            str3 = str2 + String.valueOf(i222) + '.' + (parseInt22 % 100 >= 10 ? "0" + i : String.valueOf(i));
                            break;
                        } else {
                            str3 = "Used";
                            break;
                        }
                    } else {
                        str3 = "0.00";
                        break;
                    }
                } else {
                    str3 = null;
                    break;
                }
                break;
            default:
                str2 = "";
                int parseInt222 = Integer.parseInt(str.substring(1));
                int i2222 = parseInt222 / 100;
                str3 = str2 + String.valueOf(i2222) + '.' + (parseInt222 % 100 >= 10 ? "0" + i : String.valueOf(i));
                break;
        }
        return str3;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:10:0x003d  */
    /* JADX WARN: Type inference failed for: r0v15, types: [java.lang.Integer] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static Map<ResultMetadataType, Object> parseExtensionString(String str) {
        String parseExtension5String;
        ResultMetadataType resultMetadataType;
        EnumMap enumMap = null;
        switch (str.length()) {
            case 2:
                ResultMetadataType resultMetadataType2 = ResultMetadataType.ISSUE_NUMBER;
                parseExtension5String = parseExtension2String(str);
                resultMetadataType = resultMetadataType2;
                enumMap = null;
                if (parseExtension5String != null) {
                    enumMap = new EnumMap(ResultMetadataType.class);
                    enumMap.put((EnumMap) resultMetadataType, (ResultMetadataType) parseExtension5String);
                    break;
                }
                break;
            case 3:
            case 4:
                break;
            case 5:
                ResultMetadataType resultMetadataType3 = ResultMetadataType.SUGGESTED_PRICE;
                parseExtension5String = parseExtension5String(str);
                resultMetadataType = resultMetadataType3;
                enumMap = null;
                if (parseExtension5String != null) {
                }
                break;
            default:
                enumMap = null;
                break;
        }
        return enumMap;
    }

    int decodeMiddle(BitArray bitArray, int[] iArr, StringBuilder sb) throws NotFoundException {
        int[] iArr2 = this.decodeMiddleCounters;
        iArr2[0] = 0;
        iArr2[1] = 0;
        iArr2[2] = 0;
        iArr2[3] = 0;
        int size = bitArray.getSize();
        int i = iArr[1];
        int i2 = 0;
        int i3 = 0;
        while (i3 < 5 && i < size) {
            int decodeDigit = UPCEANReader.decodeDigit(bitArray, iArr2, i, UPCEANReader.L_AND_G_PATTERNS);
            sb.append((char) ((decodeDigit % 10) + 48));
            for (int i4 : iArr2) {
                i += i4;
            }
            int i5 = i2;
            if (decodeDigit >= 10) {
                i5 = i2 | (1 << (4 - i3));
            }
            int i6 = i;
            if (i3 != 4) {
                i6 = bitArray.getNextUnset(bitArray.getNextSet(i));
            }
            i3++;
            i2 = i5;
            i = i6;
        }
        if (sb.length() != 5) {
            throw NotFoundException.getNotFoundInstance();
        }
        if (extensionChecksum(sb.toString()) == determineCheckDigit(i2)) {
            return i;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    Result decodeRow(int i, BitArray bitArray, int i2) throws NotFoundException {
        int[] findGuardPattern = UPCEANReader.findGuardPattern(bitArray, i2, false, EXTENSION_START_PATTERN);
        StringBuilder sb = this.decodeRowStringBuffer;
        sb.setLength(0);
        int decodeMiddle = decodeMiddle(bitArray, findGuardPattern, sb);
        String sb2 = sb.toString();
        Map<ResultMetadataType, Object> parseExtensionString = parseExtensionString(sb2);
        Result result = new Result(sb2, null, new ResultPoint[]{new ResultPoint((findGuardPattern[0] + findGuardPattern[1]) / 2.0f, i), new ResultPoint(decodeMiddle, i)}, BarcodeFormat.UPC_EAN_EXTENSION);
        if (parseExtensionString != null) {
            result.putAllMetadata(parseExtensionString);
        }
        return result;
    }
}
