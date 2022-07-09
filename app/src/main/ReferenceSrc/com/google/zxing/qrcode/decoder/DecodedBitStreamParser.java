package com.google.zxing.qrcode.decoder;

import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.common.BitSource;
import com.google.zxing.common.CharacterSetECI;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.common.StringUtils;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/qrcode/decoder/DecodedBitStreamParser.class */
final class DecodedBitStreamParser {
    private static final char[] ALPHANUMERIC_CHARS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ' ', '$', '%', '*', '+', '-', '.', '/', ':'};
    private static final int GB2312_SUBSET = 1;

    private DecodedBitStreamParser() {
    }

    static DecoderResult decode(byte[] bArr, Version version, ErrorCorrectionLevel errorCorrectionLevel, Map<DecodeHintType, ?> map) throws FormatException {
        Mode forBits;
        BitSource bitSource = new BitSource(bArr);
        StringBuilder sb = new StringBuilder(50);
        CharacterSetECI characterSetECI = null;
        boolean z = false;
        ArrayList arrayList = new ArrayList(1);
        do {
            if (bitSource.available() < 4) {
                forBits = Mode.TERMINATOR;
            } else {
                try {
                    forBits = Mode.forBits(bitSource.readBits(4));
                } catch (IllegalArgumentException e) {
                    throw FormatException.getFormatInstance();
                }
            }
            CharacterSetECI characterSetECI2 = characterSetECI;
            boolean z2 = z;
            if (forBits != Mode.TERMINATOR) {
                if (forBits == Mode.FNC1_FIRST_POSITION || forBits == Mode.FNC1_SECOND_POSITION) {
                    z2 = true;
                    characterSetECI2 = characterSetECI;
                } else if (forBits == Mode.STRUCTURED_APPEND) {
                    bitSource.readBits(16);
                    characterSetECI2 = characterSetECI;
                    z2 = z;
                } else if (forBits == Mode.ECI) {
                    CharacterSetECI characterSetECIByValue = CharacterSetECI.getCharacterSetECIByValue(parseECIValue(bitSource));
                    characterSetECI2 = characterSetECIByValue;
                    z2 = z;
                    if (characterSetECIByValue == null) {
                        throw FormatException.getFormatInstance();
                    }
                } else if (forBits == Mode.HANZI) {
                    int readBits = bitSource.readBits(4);
                    int readBits2 = bitSource.readBits(forBits.getCharacterCountBits(version));
                    characterSetECI2 = characterSetECI;
                    z2 = z;
                    if (readBits == 1) {
                        decodeHanziSegment(bitSource, sb, readBits2);
                        characterSetECI2 = characterSetECI;
                        z2 = z;
                    }
                } else {
                    int readBits3 = bitSource.readBits(forBits.getCharacterCountBits(version));
                    if (forBits == Mode.NUMERIC) {
                        decodeNumericSegment(bitSource, sb, readBits3);
                        characterSetECI2 = characterSetECI;
                        z2 = z;
                    } else if (forBits == Mode.ALPHANUMERIC) {
                        decodeAlphanumericSegment(bitSource, sb, readBits3, z);
                        characterSetECI2 = characterSetECI;
                        z2 = z;
                    } else if (forBits == Mode.BYTE) {
                        decodeByteSegment(bitSource, sb, readBits3, characterSetECI, arrayList, map);
                        characterSetECI2 = characterSetECI;
                        z2 = z;
                    } else if (forBits != Mode.KANJI) {
                        throw FormatException.getFormatInstance();
                    } else {
                        decodeKanjiSegment(bitSource, sb, readBits3);
                        characterSetECI2 = characterSetECI;
                        z2 = z;
                    }
                }
            }
            characterSetECI = characterSetECI2;
            z = z2;
        } while (forBits != Mode.TERMINATOR);
        String sb2 = sb.toString();
        ArrayList arrayList2 = arrayList;
        if (arrayList.isEmpty()) {
            arrayList2 = null;
        }
        return new DecoderResult(bArr, sb2, arrayList2, errorCorrectionLevel == null ? null : errorCorrectionLevel.toString());
    }

    private static void decodeAlphanumericSegment(BitSource bitSource, StringBuilder sb, int i, boolean z) throws FormatException {
        int length = sb.length();
        while (i > 1) {
            int readBits = bitSource.readBits(11);
            sb.append(toAlphaNumericChar(readBits / 45));
            sb.append(toAlphaNumericChar(readBits % 45));
            i -= 2;
        }
        if (i == 1) {
            sb.append(toAlphaNumericChar(bitSource.readBits(6)));
        }
        if (z) {
            for (int i2 = length; i2 < sb.length(); i2++) {
                if (sb.charAt(i2) == '%') {
                    if (i2 >= sb.length() - 1 || sb.charAt(i2 + 1) != '%') {
                        sb.setCharAt(i2, (char) 29);
                    } else {
                        sb.deleteCharAt(i2 + 1);
                    }
                }
            }
        }
    }

    private static void decodeByteSegment(BitSource bitSource, StringBuilder sb, int i, CharacterSetECI characterSetECI, Collection<byte[]> collection, Map<DecodeHintType, ?> map) throws FormatException {
        if ((i << 3) > bitSource.available()) {
            throw FormatException.getFormatInstance();
        }
        byte[] bArr = new byte[i];
        for (int i2 = 0; i2 < i; i2++) {
            bArr[i2] = (byte) bitSource.readBits(8);
        }
        try {
            sb.append(new String(bArr, characterSetECI == null ? StringUtils.guessEncoding(bArr, map) : characterSetECI.name()));
            collection.add(bArr);
        } catch (UnsupportedEncodingException e) {
            throw FormatException.getFormatInstance();
        }
    }

    private static void decodeHanziSegment(BitSource bitSource, StringBuilder sb, int i) throws FormatException {
        int i2;
        int i3;
        if (i * 13 > bitSource.available()) {
            throw FormatException.getFormatInstance();
        }
        byte[] bArr = new byte[i * 2];
        int i4 = 0;
        while (i > 0) {
            int readBits = bitSource.readBits(13);
            int i5 = ((readBits / 96) << 8) | (readBits % 96);
            if (i5 < 959) {
                i2 = i5;
                i3 = 41377;
            } else {
                i2 = i5;
                i3 = 42657;
            }
            int i6 = i2 + i3;
            bArr[i4] = (byte) ((i6 >> 8) & 255);
            bArr[i4 + 1] = (byte) (i6 & 255);
            i4 += 2;
            i--;
        }
        try {
            sb.append(new String(bArr, StringUtils.GB2312));
        } catch (UnsupportedEncodingException e) {
            throw FormatException.getFormatInstance();
        }
    }

    private static void decodeKanjiSegment(BitSource bitSource, StringBuilder sb, int i) throws FormatException {
        int i2;
        int i3;
        if (i * 13 > bitSource.available()) {
            throw FormatException.getFormatInstance();
        }
        byte[] bArr = new byte[i * 2];
        int i4 = 0;
        while (i > 0) {
            int readBits = bitSource.readBits(13);
            int i5 = ((readBits / 192) << 8) | (readBits % 192);
            if (i5 < 7936) {
                i2 = i5;
                i3 = 33088;
            } else {
                i2 = i5;
                i3 = 49472;
            }
            int i6 = i2 + i3;
            bArr[i4] = (byte) (i6 >> 8);
            bArr[i4 + 1] = (byte) i6;
            i4 += 2;
            i--;
        }
        try {
            sb.append(new String(bArr, StringUtils.SHIFT_JIS));
        } catch (UnsupportedEncodingException e) {
            throw FormatException.getFormatInstance();
        }
    }

    private static void decodeNumericSegment(BitSource bitSource, StringBuilder sb, int i) throws FormatException {
        while (i >= 3) {
            if (bitSource.available() < 10) {
                throw FormatException.getFormatInstance();
            }
            int readBits = bitSource.readBits(10);
            if (readBits >= 1000) {
                throw FormatException.getFormatInstance();
            }
            sb.append(toAlphaNumericChar(readBits / 100));
            sb.append(toAlphaNumericChar((readBits / 10) % 10));
            sb.append(toAlphaNumericChar(readBits % 10));
            i -= 3;
        }
        if (i == 2) {
            if (bitSource.available() < 7) {
                throw FormatException.getFormatInstance();
            }
            int readBits2 = bitSource.readBits(7);
            if (readBits2 >= 100) {
                throw FormatException.getFormatInstance();
            }
            sb.append(toAlphaNumericChar(readBits2 / 10));
            sb.append(toAlphaNumericChar(readBits2 % 10));
        } else if (i != 1) {
        } else {
            if (bitSource.available() < 4) {
                throw FormatException.getFormatInstance();
            }
            int readBits3 = bitSource.readBits(4);
            if (readBits3 >= 10) {
                throw FormatException.getFormatInstance();
            }
            sb.append(toAlphaNumericChar(readBits3));
        }
    }

    private static int parseECIValue(BitSource bitSource) {
        int readBits;
        int readBits2 = bitSource.readBits(8);
        if ((readBits2 & 128) == 0) {
            readBits = readBits2 & 127;
        } else if ((readBits2 & 192) == 128) {
            readBits = ((readBits2 & 63) << 8) | bitSource.readBits(8);
        } else if ((readBits2 & 224) != 192) {
            throw new IllegalArgumentException("Bad ECI bits starting with byte " + readBits2);
        } else {
            readBits = ((readBits2 & 31) << 16) | bitSource.readBits(16);
        }
        return readBits;
    }

    private static char toAlphaNumericChar(int i) throws FormatException {
        if (i >= ALPHANUMERIC_CHARS.length) {
            throw FormatException.getFormatInstance();
        }
        return ALPHANUMERIC_CHARS[i];
    }
}
