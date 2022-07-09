package com.google.zxing.common;

import com.google.zxing.DecodeHintType;
import java.util.Map;
import org.bson.BSON;

/* loaded from: classes.dex */
public final class StringUtils {
    private static final boolean ASSUME_SHIFT_JIS;
    private static final String EUC_JP = "EUC_JP";
    public static final String GB2312 = "GB2312";
    private static final String ISO88591 = "ISO8859_1";
    private static final String PLATFORM_DEFAULT_ENCODING = System.getProperty("file.encoding");
    public static final String SHIFT_JIS = "SJIS";
    private static final String UTF8 = "UTF8";

    static {
        ASSUME_SHIFT_JIS = SHIFT_JIS.equalsIgnoreCase(PLATFORM_DEFAULT_ENCODING) || EUC_JP.equalsIgnoreCase(PLATFORM_DEFAULT_ENCODING);
    }

    private StringUtils() {
    }

    public static String guessEncoding(byte[] bytes, Map<DecodeHintType, ?> hints) {
        int nextValue;
        String characterSet;
        if (hints == null || (characterSet = (String) hints.get(DecodeHintType.CHARACTER_SET)) == null) {
            if (bytes.length > 3 && bytes[0] == -17 && bytes[1] == -69 && bytes[2] == -65) {
                return UTF8;
            }
            int length = bytes.length;
            boolean canBeISO88591 = true;
            boolean canBeShiftJIS = true;
            boolean canBeUTF8 = true;
            int utf8BytesLeft = 0;
            int maybeDoubleByteCount = 0;
            int maybeSingleByteKatakanaCount = 0;
            boolean sawLatin1Supplement = false;
            boolean sawUTF8Start = false;
            boolean lastWasPossibleDoubleByteStart = false;
            for (int i = 0; i < length && (canBeISO88591 || canBeShiftJIS || canBeUTF8); i++) {
                int value = bytes[i] & BSON.MINKEY;
                if (value >= 128 && value <= 191) {
                    if (utf8BytesLeft > 0) {
                        utf8BytesLeft--;
                    }
                } else {
                    if (utf8BytesLeft > 0) {
                        canBeUTF8 = false;
                    }
                    if (value >= 192 && value <= 253) {
                        sawUTF8Start = true;
                        for (int valueCopy = value; (valueCopy & 64) != 0; valueCopy <<= 1) {
                            utf8BytesLeft++;
                        }
                    }
                }
                if ((value == 194 || value == 195) && i < length - 1 && (nextValue = bytes[i + 1] & BSON.MINKEY) <= 191 && ((value == 194 && nextValue >= 160) || (value == 195 && nextValue >= 128))) {
                    sawLatin1Supplement = true;
                }
                if (value >= 127 && value <= 159) {
                    canBeISO88591 = false;
                }
                if (value >= 161 && value <= 223 && !lastWasPossibleDoubleByteStart) {
                    maybeSingleByteKatakanaCount++;
                }
                if (!lastWasPossibleDoubleByteStart && ((value >= 240 && value <= 255) || value == 128 || value == 160)) {
                    canBeShiftJIS = false;
                }
                if ((value >= 129 && value <= 159) || (value >= 224 && value <= 239)) {
                    if (lastWasPossibleDoubleByteStart) {
                        lastWasPossibleDoubleByteStart = false;
                    } else {
                        lastWasPossibleDoubleByteStart = true;
                        if (i >= bytes.length - 1) {
                            canBeShiftJIS = false;
                        } else {
                            int nextValue2 = bytes[i + 1] & BSON.MINKEY;
                            if (nextValue2 < 64 || nextValue2 > 252) {
                                canBeShiftJIS = false;
                            } else {
                                maybeDoubleByteCount++;
                            }
                        }
                    }
                } else {
                    lastWasPossibleDoubleByteStart = false;
                }
            }
            if (utf8BytesLeft > 0) {
                canBeUTF8 = false;
            }
            if (canBeShiftJIS && ASSUME_SHIFT_JIS) {
                return SHIFT_JIS;
            }
            if (canBeUTF8 && sawUTF8Start) {
                return UTF8;
            }
            if (canBeShiftJIS && (maybeDoubleByteCount >= 3 || maybeSingleByteKatakanaCount * 20 > length)) {
                return SHIFT_JIS;
            }
            if (!sawLatin1Supplement && canBeISO88591) {
                return ISO88591;
            }
            return PLATFORM_DEFAULT_ENCODING;
        }
        return characterSet;
    }
}
