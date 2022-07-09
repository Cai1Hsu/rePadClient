package org.bson.io;

import java.io.IOException;
import java.text.MessageFormat;
import org.apache.commons.net.bsd.RCommandClient;

/* loaded from: classes.jar:org/bson/io/UTF8Encoding.class */
class UTF8Encoding {
    private static final int MAX_CODE_POINT = 1114111;
    private static final int MIN_2_BYTES = 128;
    private static final int MIN_3_BYTES = 2048;
    private static final int MIN_4_BYTES = 65536;
    private char[] decoderArray = new char[1024];

    UTF8Encoding() {
    }

    private static final void checkByte(int i, int i2, int i3) throws IOException {
        if ((i & 192) != 128) {
            throw new IOException(MessageFormat.format("Illegal UTF-8 sequence: byte {0} of {1} byte sequence is not 10xxxxxx: {2}", new Integer(i2), new Integer(i3), new Integer(i)));
        }
    }

    private static final void checkMinimal(int i, int i2) throws IOException {
        int i3;
        int i4;
        if (i >= i2) {
            return;
        }
        switch (i2) {
            case 128:
                i3 = 2;
                break;
            case 2048:
                i3 = 3;
                break;
            case 65536:
                i3 = 4;
                break;
            default:
                throw new IllegalArgumentException("unexpected minValue passed to checkMinimal: " + i2);
        }
        if (i < 128) {
            i4 = 1;
        } else if (i < 2048) {
            i4 = 2;
        } else if (i >= 65536) {
            throw new IllegalArgumentException("unexpected ch passed to checkMinimal: " + i);
        } else {
            i4 = 3;
        }
        throw new IOException(MessageFormat.format("Illegal UTF-8 sequence: {0} bytes used to encode a {1} byte value: {2}", new Integer(i3), new Integer(i4), new Integer(i)));
    }

    public String decode(byte[] bArr, int i, int i2) throws IOException {
        String str;
        int i3;
        int i4;
        int i5;
        int i6;
        synchronized (this) {
            char[] cArr = this.decoderArray;
            char[] cArr2 = cArr;
            if (cArr.length < i2) {
                cArr2 = new char[i2];
                this.decoderArray = cArr2;
            }
            int i7 = i2 + i;
            int i8 = 0;
            while (true) {
                int i9 = i8;
                if (i < i7) {
                    int i10 = i + 1;
                    int i11 = bArr[i] & 255;
                    if (i11 < 128) {
                        i = i10;
                        i3 = i11;
                    } else if (i11 < 192) {
                        throw new IOException(MessageFormat.format("Illegal UTF-8 sequence: initial byte is {0}: {1}", "10xxxxxx", new Integer(i11)));
                    } else {
                        if (i11 < 224) {
                            try {
                                checkByte(bArr[i10], 2, 2);
                                i4 = i10 + 1;
                                i5 = ((i11 & 31) << 6) | (bArr[i10] & 63);
                            } catch (ArrayIndexOutOfBoundsException e) {
                            }
                            try {
                                checkMinimal(i5, 128);
                                i = i4;
                                i3 = i5;
                            } catch (ArrayIndexOutOfBoundsException e2) {
                                throw new IOException("Illegal UTF-8 sequence: multibyte sequence was truncated");
                            }
                        } else if (i11 < 240) {
                            checkByte(bArr[i10], 2, 3);
                            int i12 = i10 + 1;
                            byte b = bArr[i10];
                            checkByte(bArr[i12], 3, 3);
                            int i13 = i12 + 1;
                            i3 = ((i11 & 15) << 12) | ((b & 63) << 6) | (bArr[i12] & 63);
                            checkMinimal(i3, 2048);
                            i = i13;
                        } else if (i11 >= 248) {
                            throw new IOException(MessageFormat.format("Illegal UTF-8 sequence: initial byte is {0}: {1}", "11111xxx", new Integer(i11)));
                        } else {
                            checkByte(bArr[i10], 2, 4);
                            int i14 = i10 + 1;
                            byte b2 = bArr[i10];
                            checkByte(bArr[i14], 3, 4);
                            int i15 = i14 + 1;
                            byte b3 = bArr[i14];
                            checkByte(bArr[i15], 4, 4);
                            int i16 = i15 + 1;
                            int i17 = ((i11 & 7) << 18) | ((b2 & 63) << 12) | ((b3 & 63) << 6) | (bArr[i15] & 63);
                            checkMinimal(i17, 65536);
                            i = i16;
                            i3 = i17;
                        }
                    }
                    if (i3 > MAX_CODE_POINT) {
                        throw new IOException(MessageFormat.format("Illegal UTF-8 sequence: final value is out of range: {0}", new Integer(i3)));
                    }
                    if (i3 > 65535) {
                        int i18 = i3 - 65536;
                        int i19 = i9 + 1;
                        cArr2[i9] = (char) (55296 + (i18 >> 10));
                        i6 = i19 + 1;
                        cArr2[i19] = (char) (56320 + (i18 & RCommandClient.MAX_CLIENT_PORT));
                    } else if (i3 >= 55296 && i3 < 57344) {
                        throw new IOException(MessageFormat.format("Illegal UTF-8 sequence: final value is a surrogate value: {0}", new Integer(i3)));
                    } else {
                        cArr2[i9] = (char) i3;
                        i6 = i9 + 1;
                    }
                    i8 = i6;
                } else if (i > i7) {
                    throw new IOException("Illegal UTF-8 sequence: multibyte sequence was truncated");
                } else {
                    str = new String(cArr2, 0, i9);
                }
            }
        }
        return str;
    }
}
