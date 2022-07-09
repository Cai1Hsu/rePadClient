package com.google.zxing.datamatrix.decoder;

import android.support.v4.media.TransportMediator;
import com.google.zxing.FormatException;
import com.google.zxing.common.BitSource;
import com.google.zxing.common.DecoderResult;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import org.apache.commons.net.telnet.TelnetCommand;

/* loaded from: classes.jar:com/google/zxing/datamatrix/decoder/DecodedBitStreamParser.class */
final class DecodedBitStreamParser {
    private static final char[] C40_BASIC_SET_CHARS = {'*', '*', '*', ' ', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
    private static final char[] C40_SHIFT2_SET_CHARS = {'!', '\"', '#', '$', '%', '&', '\'', '(', ')', '*', '+', ',', '-', '.', '/', ':', ';', '<', '=', '>', '?', '@', '[', '\\', ']', '^', '_'};
    private static final char[] TEXT_BASIC_SET_CHARS = {'*', '*', '*', ' ', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
    private static final char[] TEXT_SHIFT3_SET_CHARS = {'\'', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '{', '|', '}', '~', 127};

    /* renamed from: com.google.zxing.datamatrix.decoder.DecodedBitStreamParser$1 */
    /* loaded from: classes.jar:com/google/zxing/datamatrix/decoder/DecodedBitStreamParser$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode = new int[Mode.values().length];

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:14:0x0045 -> B:24:0x0035). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:15:0x0049 -> B:22:0x002a). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x004d -> B:20:0x001f). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:17:0x0051 -> B:18:0x0014). Please submit an issue!!! */
        static {
            try {
                $SwitchMap$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode[Mode.C40_ENCODE.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode[Mode.TEXT_ENCODE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode[Mode.ANSIX12_ENCODE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode[Mode.EDIFACT_ENCODE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode[Mode.BASE256_ENCODE.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
        }
    }

    /* loaded from: classes.jar:com/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode.class */
    private enum Mode {
        PAD_ENCODE,
        ASCII_ENCODE,
        C40_ENCODE,
        TEXT_ENCODE,
        ANSIX12_ENCODE,
        EDIFACT_ENCODE,
        BASE256_ENCODE
    }

    private DecodedBitStreamParser() {
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x006d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    static DecoderResult decode(byte[] bArr) throws FormatException {
        BitSource bitSource = new BitSource(bArr);
        StringBuilder sb = new StringBuilder(100);
        StringBuilder sb2 = new StringBuilder(0);
        ArrayList arrayList = new ArrayList(1);
        Mode mode = Mode.ASCII_ENCODE;
        do {
            if (mode == Mode.ASCII_ENCODE) {
                mode = decodeAsciiSegment(bitSource, sb, sb2);
            } else {
                switch (AnonymousClass1.$SwitchMap$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode[mode.ordinal()]) {
                    case 1:
                        decodeC40Segment(bitSource, sb);
                        break;
                    case 2:
                        decodeTextSegment(bitSource, sb);
                        break;
                    case 3:
                        decodeAnsiX12Segment(bitSource, sb);
                        break;
                    case 4:
                        decodeEdifactSegment(bitSource, sb);
                        break;
                    case 5:
                        decodeBase256Segment(bitSource, sb, arrayList);
                        break;
                    default:
                        throw FormatException.getFormatInstance();
                }
                mode = Mode.ASCII_ENCODE;
            }
            if (mode != Mode.PAD_ENCODE) {
            }
            if (sb2.length() > 0) {
                sb.append(sb2.toString());
            }
            String sb3 = sb.toString();
            ArrayList arrayList2 = arrayList;
            if (arrayList.isEmpty()) {
                arrayList2 = null;
            }
            return new DecoderResult(bArr, sb3, arrayList2, null);
        } while (bitSource.available() > 0);
        if (sb2.length() > 0) {
        }
        String sb32 = sb.toString();
        ArrayList arrayList22 = arrayList;
        if (arrayList.isEmpty()) {
        }
        return new DecoderResult(bArr, sb32, arrayList22, null);
    }

    private static void decodeAnsiX12Segment(BitSource bitSource, StringBuilder sb) throws FormatException {
        int readBits;
        int[] iArr = new int[3];
        while (bitSource.available() != 8 && (readBits = bitSource.readBits(8)) != 254) {
            parseTwoBytes(readBits, bitSource.readBits(8), iArr);
            for (int i = 0; i < 3; i++) {
                int i2 = iArr[i];
                if (i2 == 0) {
                    sb.append('\r');
                } else if (i2 == 1) {
                    sb.append('*');
                } else if (i2 == 2) {
                    sb.append('>');
                } else if (i2 == 3) {
                    sb.append(' ');
                } else if (i2 < 14) {
                    sb.append((char) (i2 + 44));
                } else if (i2 >= 40) {
                    throw FormatException.getFormatInstance();
                } else {
                    sb.append((char) (i2 + 51));
                }
            }
            if (bitSource.available() <= 0) {
                return;
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:67:0x016c, code lost:
        throw com.google.zxing.FormatException.getFormatInstance();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static Mode decodeAsciiSegment(BitSource bitSource, StringBuilder sb, StringBuilder sb2) throws FormatException {
        Mode mode;
        boolean z;
        boolean z2 = false;
        while (true) {
            int readBits = bitSource.readBits(8);
            if (readBits != 0) {
                if (readBits > 128) {
                    if (readBits != 129) {
                        if (readBits > 229) {
                            if (readBits != 230) {
                                if (readBits != 231) {
                                    if (readBits != 232) {
                                        z = z2;
                                        if (readBits != 233) {
                                            z = z2;
                                            if (readBits != 234) {
                                                if (readBits != 235) {
                                                    if (readBits != 236) {
                                                        if (readBits != 237) {
                                                            if (readBits != 238) {
                                                                if (readBits != 239) {
                                                                    if (readBits != 240) {
                                                                        z = z2;
                                                                        if (readBits != 241) {
                                                                            z = z2;
                                                                            if (readBits >= 242) {
                                                                                if (readBits != 254) {
                                                                                    break;
                                                                                }
                                                                                z = z2;
                                                                                if (bitSource.available() != 0) {
                                                                                    break;
                                                                                }
                                                                            }
                                                                        }
                                                                    } else {
                                                                        mode = Mode.EDIFACT_ENCODE;
                                                                        break;
                                                                    }
                                                                } else {
                                                                    mode = Mode.TEXT_ENCODE;
                                                                    break;
                                                                }
                                                            } else {
                                                                mode = Mode.ANSIX12_ENCODE;
                                                                break;
                                                            }
                                                        } else {
                                                            sb.append("[)>\u001e06\u001d");
                                                            sb2.insert(0, "\u001e\u0004");
                                                            z = z2;
                                                        }
                                                    } else {
                                                        sb.append("[)>\u001e05\u001d");
                                                        sb2.insert(0, "\u001e\u0004");
                                                        z = z2;
                                                    }
                                                } else {
                                                    z = true;
                                                }
                                            }
                                        }
                                    } else {
                                        sb.append((char) 29);
                                        z = z2;
                                    }
                                } else {
                                    mode = Mode.BASE256_ENCODE;
                                    break;
                                }
                            } else {
                                mode = Mode.C40_ENCODE;
                                break;
                            }
                        } else {
                            int i = readBits - TransportMediator.KEYCODE_MEDIA_RECORD;
                            if (i < 10) {
                                sb.append('0');
                            }
                            sb.append(i);
                            z = z2;
                        }
                        z2 = z;
                        if (bitSource.available() <= 0) {
                            mode = Mode.ASCII_ENCODE;
                            break;
                        }
                    } else {
                        mode = Mode.PAD_ENCODE;
                        break;
                    }
                } else {
                    int i2 = readBits;
                    if (z2) {
                        i2 = readBits + 128;
                    }
                    sb.append((char) (i2 - 1));
                    mode = Mode.ASCII_ENCODE;
                }
            } else {
                throw FormatException.getFormatInstance();
            }
        }
        return mode;
    }

    private static void decodeBase256Segment(BitSource bitSource, StringBuilder sb, Collection<byte[]> collection) throws FormatException {
        int unrandomize255State;
        int byteOffset = bitSource.getByteOffset() + 1;
        int i = byteOffset + 1;
        int unrandomize255State2 = unrandomize255State(bitSource.readBits(8), byteOffset);
        if (unrandomize255State2 == 0) {
            unrandomize255State = bitSource.available() / 8;
        } else if (unrandomize255State2 < 250) {
            unrandomize255State = unrandomize255State2;
        } else {
            i++;
            unrandomize255State = ((unrandomize255State2 - TelnetCommand.GA) * 250) + unrandomize255State(bitSource.readBits(8), i);
        }
        if (unrandomize255State < 0) {
            throw FormatException.getFormatInstance();
        }
        byte[] bArr = new byte[unrandomize255State];
        int i2 = 0;
        while (i2 < unrandomize255State) {
            if (bitSource.available() < 8) {
                throw FormatException.getFormatInstance();
            }
            bArr[i2] = (byte) unrandomize255State(bitSource.readBits(8), i);
            i2++;
            i++;
        }
        collection.add(bArr);
        try {
            sb.append(new String(bArr, "ISO8859_1"));
        } catch (UnsupportedEncodingException e) {
            throw new IllegalStateException("Platform does not support required encoding: " + e);
        }
    }

    private static void decodeC40Segment(BitSource bitSource, StringBuilder sb) throws FormatException {
        int readBits;
        boolean z = false;
        int[] iArr = new int[3];
        int i = 0;
        while (bitSource.available() != 8 && (readBits = bitSource.readBits(8)) != 254) {
            parseTwoBytes(readBits, bitSource.readBits(8), iArr);
            for (int i2 = 0; i2 < 3; i2++) {
                int i3 = iArr[i2];
                switch (i) {
                    case 0:
                        if (i3 >= 3) {
                            if (i3 < C40_BASIC_SET_CHARS.length) {
                                char c = C40_BASIC_SET_CHARS[i3];
                                if (z) {
                                    sb.append((char) (c + 128));
                                    z = false;
                                    break;
                                } else {
                                    sb.append(c);
                                    break;
                                }
                            } else {
                                throw FormatException.getFormatInstance();
                            }
                        } else {
                            i = i3 + 1;
                            break;
                        }
                    case 1:
                        if (z) {
                            sb.append((char) (i3 + 128));
                            z = false;
                        } else {
                            sb.append((char) i3);
                        }
                        i = 0;
                        break;
                    case 2:
                        if (i3 < C40_SHIFT2_SET_CHARS.length) {
                            char c2 = C40_SHIFT2_SET_CHARS[i3];
                            if (z) {
                                sb.append((char) (c2 + 128));
                                z = false;
                            } else {
                                sb.append(c2);
                            }
                        } else if (i3 == 27) {
                            sb.append((char) 29);
                        } else if (i3 != 30) {
                            throw FormatException.getFormatInstance();
                        } else {
                            z = true;
                        }
                        i = 0;
                        break;
                    case 3:
                        if (z) {
                            sb.append((char) (i3 + 224));
                            z = false;
                        } else {
                            sb.append((char) (i3 + 96));
                        }
                        i = 0;
                        break;
                    default:
                        throw FormatException.getFormatInstance();
                }
            }
            if (bitSource.available() <= 0) {
                return;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:6:0x000c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static void decodeEdifactSegment(BitSource bitSource, StringBuilder sb) {
        boolean z = false;
        while (bitSource.available() > 16) {
            for (int i = 0; i < 4; i++) {
                int readBits = bitSource.readBits(6);
                if (readBits == 31) {
                    z = true;
                }
                if (!z) {
                    int i2 = readBits;
                    if ((readBits & 32) == 0) {
                        i2 = readBits | 64;
                    }
                    sb.append((char) i2);
                }
            }
            if (z || bitSource.available() <= 0) {
                return;
            }
            while (bitSource.available() > 16) {
            }
        }
    }

    private static void decodeTextSegment(BitSource bitSource, StringBuilder sb) throws FormatException {
        int readBits;
        boolean z = false;
        int[] iArr = new int[3];
        int i = 0;
        while (bitSource.available() != 8 && (readBits = bitSource.readBits(8)) != 254) {
            parseTwoBytes(readBits, bitSource.readBits(8), iArr);
            for (int i2 = 0; i2 < 3; i2++) {
                int i3 = iArr[i2];
                switch (i) {
                    case 0:
                        if (i3 >= 3) {
                            if (i3 < TEXT_BASIC_SET_CHARS.length) {
                                char c = TEXT_BASIC_SET_CHARS[i3];
                                if (z) {
                                    sb.append((char) (c + 128));
                                    z = false;
                                    break;
                                } else {
                                    sb.append(c);
                                    break;
                                }
                            } else {
                                throw FormatException.getFormatInstance();
                            }
                        } else {
                            i = i3 + 1;
                            break;
                        }
                    case 1:
                        if (z) {
                            sb.append((char) (i3 + 128));
                            z = false;
                        } else {
                            sb.append((char) i3);
                        }
                        i = 0;
                        break;
                    case 2:
                        if (i3 < C40_SHIFT2_SET_CHARS.length) {
                            char c2 = C40_SHIFT2_SET_CHARS[i3];
                            if (z) {
                                sb.append((char) (c2 + 128));
                                z = false;
                            } else {
                                sb.append(c2);
                            }
                        } else if (i3 == 27) {
                            sb.append((char) 29);
                        } else if (i3 != 30) {
                            throw FormatException.getFormatInstance();
                        } else {
                            z = true;
                        }
                        i = 0;
                        break;
                    case 3:
                        if (i3 >= TEXT_SHIFT3_SET_CHARS.length) {
                            throw FormatException.getFormatInstance();
                        }
                        char c3 = TEXT_SHIFT3_SET_CHARS[i3];
                        if (z) {
                            sb.append((char) (c3 + 128));
                            z = false;
                        } else {
                            sb.append(c3);
                        }
                        i = 0;
                        break;
                    default:
                        throw FormatException.getFormatInstance();
                }
            }
            if (bitSource.available() <= 0) {
                return;
            }
        }
    }

    private static void parseTwoBytes(int i, int i2, int[] iArr) {
        int i3 = ((i << 8) + i2) - 1;
        int i4 = i3 / 1600;
        iArr[0] = i4;
        int i5 = i3 - (i4 * 1600);
        int i6 = i5 / 40;
        iArr[1] = i6;
        iArr[2] = i5 - (i6 * 40);
    }

    private static int unrandomize255State(int i, int i2) {
        int i3 = i - (((i2 * 149) % 255) + 1);
        if (i3 < 0) {
            i3 += 256;
        }
        return i3;
    }
}
