package org.apache.commons.net.util;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import org.apache.tools.ant.taskdefs.Execute;

/* loaded from: classes.jar:org/apache/commons/net/util/Base64.class */
public class Base64 {
    static final int CHUNK_SIZE = 76;
    private static final int DEFAULT_BUFFER_RESIZE_FACTOR = 2;
    private static final int DEFAULT_BUFFER_SIZE = 8192;
    private static final int MASK_8BITS = 255;
    private byte[] buffer;
    private int currentLinePos;
    private final int decodeSize;
    private final int encodeSize;
    private final byte[] encodeTable;
    private boolean eof;
    private final int lineLength;
    private final byte[] lineSeparator;
    private int modulus;
    private int pos;
    private int readPos;
    private int x;
    static final byte[] CHUNK_SEPARATOR = {13, 10};
    private static final byte[] STANDARD_ENCODE_TABLE = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47};
    private static final byte[] URL_SAFE_ENCODE_TABLE = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 45, 95};
    private static final int MASK_6BITS = 63;
    private static final byte PAD = 61;
    private static final byte[] DECODE_TABLE = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, 62, -1, MASK_6BITS, 52, 53, 54, 55, 56, 57, 58, 59, 60, PAD, -1, -1, -1, -1, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, MASK_6BITS, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51};

    public Base64() {
        this(false);
    }

    public Base64(int i) {
        this(i, CHUNK_SEPARATOR);
    }

    public Base64(int i, byte[] bArr) {
        this(i, bArr, false);
    }

    public Base64(int i, byte[] bArr, boolean z) {
        byte[] bArr2 = bArr;
        if (bArr == null) {
            i = 0;
            bArr2 = CHUNK_SEPARATOR;
        }
        this.lineLength = i > 0 ? (i / 4) * 4 : 0;
        this.lineSeparator = new byte[bArr2.length];
        System.arraycopy(bArr2, 0, this.lineSeparator, 0, bArr2.length);
        if (i > 0) {
            this.encodeSize = bArr2.length + 4;
        } else {
            this.encodeSize = 4;
        }
        this.decodeSize = this.encodeSize - 1;
        if (containsBase64Byte(bArr2)) {
            throw new IllegalArgumentException("lineSeperator must not contain base64 characters: [" + newStringUtf8(bArr2) + "]");
        }
        this.encodeTable = z ? URL_SAFE_ENCODE_TABLE : STANDARD_ENCODE_TABLE;
    }

    public Base64(boolean z) {
        this(76, CHUNK_SEPARATOR, z);
    }

    private static boolean containsBase64Byte(byte[] bArr) {
        boolean z;
        int i = 0;
        while (true) {
            if (i >= bArr.length) {
                z = false;
                break;
            } else if (isBase64(bArr[i])) {
                z = true;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    public static byte[] decodeBase64(String str) {
        return new Base64().decode(str);
    }

    public static byte[] decodeBase64(byte[] bArr) {
        return new Base64().decode(bArr);
    }

    public static BigInteger decodeInteger(byte[] bArr) {
        return new BigInteger(1, decodeBase64(bArr));
    }

    public static byte[] encodeBase64(byte[] bArr) {
        return encodeBase64(bArr, false);
    }

    public static byte[] encodeBase64(byte[] bArr, boolean z) {
        return encodeBase64(bArr, z, false);
    }

    public static byte[] encodeBase64(byte[] bArr, boolean z, boolean z2) {
        return encodeBase64(bArr, z, z2, Execute.INVALID);
    }

    public static byte[] encodeBase64(byte[] bArr, boolean z, boolean z2, int i) {
        byte[] bArr2 = bArr;
        if (bArr != null) {
            if (bArr.length == 0) {
                bArr2 = bArr;
            } else {
                long encodeLength = getEncodeLength(bArr, 76, CHUNK_SEPARATOR);
                if (encodeLength > i) {
                    throw new IllegalArgumentException("Input array too big, the output array would be bigger (" + encodeLength + ") than the specified maxium size of " + i);
                }
                bArr2 = (z ? new Base64(z2) : new Base64(0, CHUNK_SEPARATOR, z2)).encode(bArr);
            }
        }
        return bArr2;
    }

    public static byte[] encodeBase64Chunked(byte[] bArr) {
        return encodeBase64(bArr, true);
    }

    public static String encodeBase64String(byte[] bArr) {
        return newStringUtf8(encodeBase64(bArr, true));
    }

    public static byte[] encodeBase64URLSafe(byte[] bArr) {
        return encodeBase64(bArr, false, true);
    }

    public static String encodeBase64URLSafeString(byte[] bArr) {
        return newStringUtf8(encodeBase64(bArr, false, true));
    }

    public static byte[] encodeInteger(BigInteger bigInteger) {
        if (bigInteger == null) {
            throw new NullPointerException("encodeInteger called with null parameter");
        }
        return encodeBase64(toIntegerBytes(bigInteger), false);
    }

    private byte[] getBytesUtf8(String str) {
        try {
            return str.getBytes("UTF8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    private static long getEncodeLength(byte[] bArr, int i, byte[] bArr2) {
        int i2 = (i / 4) * 4;
        long length = (bArr.length * 4) / 3;
        long j = length % 4;
        long j2 = length;
        if (j != 0) {
            j2 = length + (4 - j);
        }
        long j3 = j2;
        if (i2 > 0) {
            boolean z = j2 % ((long) i2) == 0;
            long length2 = j2 + ((j2 / i2) * bArr2.length);
            j3 = length2;
            if (!z) {
                j3 = length2 + bArr2.length;
            }
        }
        return j3;
    }

    public static boolean isArrayByteBase64(byte[] bArr) {
        boolean z;
        int i = 0;
        while (true) {
            if (i >= bArr.length) {
                z = true;
                break;
            } else if (!isBase64(bArr[i]) && !isWhiteSpace(bArr[i])) {
                z = false;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    public static boolean isBase64(byte b) {
        return b == PAD || (b >= 0 && b < DECODE_TABLE.length && DECODE_TABLE[b] != -1);
    }

    private static boolean isWhiteSpace(byte b) {
        boolean z;
        switch (b) {
            case 9:
            case 10:
            case 13:
            case 32:
                z = true;
                break;
            default:
                z = false;
                break;
        }
        return z;
    }

    private static String newStringUtf8(byte[] bArr) {
        try {
            return new String(bArr, "UTF8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    private void reset() {
        this.buffer = null;
        this.pos = 0;
        this.readPos = 0;
        this.currentLinePos = 0;
        this.modulus = 0;
        this.eof = false;
    }

    private void resizeBuffer() {
        if (this.buffer == null) {
            this.buffer = new byte[8192];
            this.pos = 0;
            this.readPos = 0;
            return;
        }
        byte[] bArr = new byte[this.buffer.length * 2];
        System.arraycopy(this.buffer, 0, bArr, 0, this.buffer.length);
        this.buffer = bArr;
    }

    static byte[] toIntegerBytes(BigInteger bigInteger) {
        byte[] bArr;
        int bitLength = ((bigInteger.bitLength() + 7) >> 3) << 3;
        byte[] byteArray = bigInteger.toByteArray();
        if (bigInteger.bitLength() % 8 == 0 || (bigInteger.bitLength() / 8) + 1 != bitLength / 8) {
            int i = 0;
            int length = byteArray.length;
            int i2 = length;
            if (bigInteger.bitLength() % 8 == 0) {
                i = 1;
                i2 = length - 1;
            }
            bArr = new byte[bitLength / 8];
            System.arraycopy(byteArray, i, bArr, (bitLength / 8) - i2, i2);
        } else {
            bArr = byteArray;
        }
        return bArr;
    }

    int avail() {
        return this.buffer != null ? this.pos - this.readPos : 0;
    }

    public Object decode(Object obj) {
        byte[] decode;
        if (obj instanceof byte[]) {
            decode = decode((byte[]) obj);
        } else if (!(obj instanceof String)) {
            throw new RuntimeException("Parameter supplied to Base64 decode is not a byte[] or a String");
        } else {
            decode = decode((String) obj);
        }
        return decode;
    }

    void decode(byte[] bArr, int i, int i2) {
        byte b;
        if (this.eof) {
            return;
        }
        if (i2 < 0) {
            this.eof = true;
        }
        int i3 = 0;
        while (true) {
            if (i3 >= i2) {
                break;
            }
            if (this.buffer == null || this.buffer.length - this.pos < this.decodeSize) {
                resizeBuffer();
            }
            byte b2 = bArr[i];
            if (b2 == PAD) {
                this.eof = true;
                break;
            }
            if (b2 >= 0 && b2 < DECODE_TABLE.length && (b = DECODE_TABLE[b2]) >= 0) {
                int i4 = this.modulus + 1;
                this.modulus = i4;
                this.modulus = i4 % 4;
                this.x = (this.x << 6) + b;
                if (this.modulus == 0) {
                    byte[] bArr2 = this.buffer;
                    int i5 = this.pos;
                    this.pos = i5 + 1;
                    bArr2[i5] = (byte) ((this.x >> 16) & 255);
                    byte[] bArr3 = this.buffer;
                    int i6 = this.pos;
                    this.pos = i6 + 1;
                    bArr3[i6] = (byte) ((this.x >> 8) & 255);
                    byte[] bArr4 = this.buffer;
                    int i7 = this.pos;
                    this.pos = i7 + 1;
                    bArr4[i7] = (byte) (this.x & 255);
                }
            }
            i3++;
            i++;
        }
        if (!this.eof || this.modulus == 0) {
            return;
        }
        this.x <<= 6;
        switch (this.modulus) {
            case 2:
                this.x <<= 6;
                byte[] bArr5 = this.buffer;
                int i8 = this.pos;
                this.pos = i8 + 1;
                bArr5[i8] = (byte) ((this.x >> 16) & 255);
                return;
            case 3:
                byte[] bArr6 = this.buffer;
                int i9 = this.pos;
                this.pos = i9 + 1;
                bArr6[i9] = (byte) ((this.x >> 16) & 255);
                byte[] bArr7 = this.buffer;
                int i10 = this.pos;
                this.pos = i10 + 1;
                bArr7[i10] = (byte) ((this.x >> 8) & 255);
                return;
            default:
                return;
        }
    }

    public byte[] decode(String str) {
        return decode(getBytesUtf8(str));
    }

    public byte[] decode(byte[] bArr) {
        reset();
        if (bArr != null && bArr.length != 0) {
            byte[] bArr2 = new byte[(bArr.length * 3) / 4];
            setInitialBuffer(bArr2, 0, bArr2.length);
            decode(bArr, 0, bArr.length);
            decode(bArr, 0, -1);
            bArr = new byte[this.pos];
            readResults(bArr, 0, bArr.length);
        }
        return bArr;
    }

    public Object encode(Object obj) {
        if (!(obj instanceof byte[])) {
            throw new RuntimeException("Parameter supplied to Base64 encode is not a byte[]");
        }
        return encode((byte[]) obj);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v53, types: [int] */
    void encode(byte[] bArr, int i, int i2) {
        if (this.eof) {
            return;
        }
        if (i2 >= 0) {
            int i3 = 0;
            while (i3 < i2) {
                if (this.buffer == null || this.buffer.length - this.pos < this.encodeSize) {
                    resizeBuffer();
                }
                int i4 = this.modulus + 1;
                this.modulus = i4;
                this.modulus = i4 % 3;
                byte b = bArr[i];
                byte b2 = b;
                if (b < 0) {
                    b2 = b + 256;
                }
                this.x = (this.x << 8) + b2;
                if (this.modulus == 0) {
                    byte[] bArr2 = this.buffer;
                    int i5 = this.pos;
                    this.pos = i5 + 1;
                    bArr2[i5] = this.encodeTable[(this.x >> 18) & MASK_6BITS];
                    byte[] bArr3 = this.buffer;
                    int i6 = this.pos;
                    this.pos = i6 + 1;
                    bArr3[i6] = this.encodeTable[(this.x >> 12) & MASK_6BITS];
                    byte[] bArr4 = this.buffer;
                    int i7 = this.pos;
                    this.pos = i7 + 1;
                    bArr4[i7] = this.encodeTable[(this.x >> 6) & MASK_6BITS];
                    byte[] bArr5 = this.buffer;
                    int i8 = this.pos;
                    this.pos = i8 + 1;
                    bArr5[i8] = this.encodeTable[this.x & MASK_6BITS];
                    this.currentLinePos += 4;
                    if (this.lineLength > 0 && this.lineLength <= this.currentLinePos) {
                        System.arraycopy(this.lineSeparator, 0, this.buffer, this.pos, this.lineSeparator.length);
                        this.pos += this.lineSeparator.length;
                        this.currentLinePos = 0;
                    }
                }
                i3++;
                i++;
            }
            return;
        }
        this.eof = true;
        if (this.buffer == null || this.buffer.length - this.pos < this.encodeSize) {
            resizeBuffer();
        }
        switch (this.modulus) {
            case 1:
                byte[] bArr6 = this.buffer;
                int i9 = this.pos;
                this.pos = i9 + 1;
                bArr6[i9] = this.encodeTable[(this.x >> 2) & MASK_6BITS];
                byte[] bArr7 = this.buffer;
                int i10 = this.pos;
                this.pos = i10 + 1;
                bArr7[i10] = this.encodeTable[(this.x << 4) & MASK_6BITS];
                if (this.encodeTable == STANDARD_ENCODE_TABLE) {
                    byte[] bArr8 = this.buffer;
                    int i11 = this.pos;
                    this.pos = i11 + 1;
                    bArr8[i11] = (byte) PAD;
                    byte[] bArr9 = this.buffer;
                    int i12 = this.pos;
                    this.pos = i12 + 1;
                    bArr9[i12] = (byte) PAD;
                    break;
                }
                break;
            case 2:
                byte[] bArr10 = this.buffer;
                int i13 = this.pos;
                this.pos = i13 + 1;
                bArr10[i13] = this.encodeTable[(this.x >> 10) & MASK_6BITS];
                byte[] bArr11 = this.buffer;
                int i14 = this.pos;
                this.pos = i14 + 1;
                bArr11[i14] = this.encodeTable[(this.x >> 4) & MASK_6BITS];
                byte[] bArr12 = this.buffer;
                int i15 = this.pos;
                this.pos = i15 + 1;
                bArr12[i15] = this.encodeTable[(this.x << 2) & MASK_6BITS];
                if (this.encodeTable == STANDARD_ENCODE_TABLE) {
                    byte[] bArr13 = this.buffer;
                    int i16 = this.pos;
                    this.pos = i16 + 1;
                    bArr13[i16] = (byte) PAD;
                    break;
                }
                break;
        }
        if (this.lineLength <= 0 || this.pos <= 0) {
            return;
        }
        System.arraycopy(this.lineSeparator, 0, this.buffer, this.pos, this.lineSeparator.length);
        this.pos += this.lineSeparator.length;
    }

    public byte[] encode(byte[] bArr) {
        reset();
        if (bArr != null && bArr.length != 0) {
            byte[] bArr2 = new byte[(int) getEncodeLength(bArr, this.lineLength, this.lineSeparator)];
            setInitialBuffer(bArr2, 0, bArr2.length);
            encode(bArr, 0, bArr.length);
            encode(bArr, 0, -1);
            if (this.buffer != bArr2) {
                readResults(bArr2, 0, bArr2.length);
            }
            bArr = bArr2;
            if (isUrlSafe()) {
                bArr = bArr2;
                if (this.pos < bArr2.length) {
                    bArr = new byte[this.pos];
                    System.arraycopy(bArr2, 0, bArr, 0, this.pos);
                }
            }
        }
        return bArr;
    }

    public String encodeToString(byte[] bArr) {
        return newStringUtf8(encode(bArr));
    }

    boolean hasData() {
        return this.buffer != null;
    }

    public boolean isUrlSafe() {
        return this.encodeTable == URL_SAFE_ENCODE_TABLE;
    }

    int readResults(byte[] bArr, int i, int i2) {
        int i3;
        if (this.buffer != null) {
            int min = Math.min(avail(), i2);
            if (this.buffer != bArr) {
                System.arraycopy(this.buffer, this.readPos, bArr, i, min);
                this.readPos += min;
                i3 = min;
                if (this.readPos >= this.pos) {
                    this.buffer = null;
                    i3 = min;
                }
            } else {
                this.buffer = null;
                i3 = min;
            }
        } else {
            i3 = this.eof ? -1 : 0;
        }
        return i3;
    }

    void setInitialBuffer(byte[] bArr, int i, int i2) {
        if (bArr == null || bArr.length != i2) {
            return;
        }
        this.buffer = bArr;
        this.pos = i;
        this.readPos = i;
    }
}
