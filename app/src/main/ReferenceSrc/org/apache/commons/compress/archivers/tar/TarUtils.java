package org.apache.commons.compress.archivers.tar;

import java.io.IOException;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import org.apache.commons.compress.archivers.zip.ZipEncoding;
import org.apache.commons.compress.archivers.zip.ZipEncodingHelper;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/tar/TarUtils.class */
public class TarUtils {
    private static final int BYTE_MASK = 255;
    static final ZipEncoding DEFAULT_ENCODING = ZipEncodingHelper.getZipEncoding(null);
    static final ZipEncoding FALLBACK_ENCODING = new ZipEncoding() { // from class: org.apache.commons.compress.archivers.tar.TarUtils.1
        @Override // org.apache.commons.compress.archivers.zip.ZipEncoding
        public boolean canEncode(String str) {
            return true;
        }

        @Override // org.apache.commons.compress.archivers.zip.ZipEncoding
        public String decode(byte[] bArr) {
            byte b;
            int length = bArr.length;
            StringBuffer stringBuffer = new StringBuffer(length);
            for (int i = 0; i < length && (b = bArr[i]) != 0; i++) {
                stringBuffer.append((char) (b & 255));
            }
            return stringBuffer.toString();
        }

        @Override // org.apache.commons.compress.archivers.zip.ZipEncoding
        public ByteBuffer encode(String str) {
            int length = str.length();
            byte[] bArr = new byte[length];
            for (int i = 0; i < length; i++) {
                bArr[i] = (byte) str.charAt(i);
            }
            return ByteBuffer.wrap(bArr);
        }
    };

    private TarUtils() {
    }

    public static long computeCheckSum(byte[] bArr) {
        long j = 0;
        for (byte b : bArr) {
            j += b & 255;
        }
        return j;
    }

    private static String exceptionMessage(byte[] bArr, int i, int i2, int i3, byte b) {
        return "Invalid byte " + ((int) b) + " at offset " + (i3 - i) + " in '" + new String(bArr, i, i2).replaceAll("��", "{NUL}") + "' len=" + i2;
    }

    private static void formatBigIntegerBinary(long j, byte[] bArr, int i, int i2, boolean z) {
        byte[] byteArray = BigInteger.valueOf(j).toByteArray();
        int length = byteArray.length;
        int i3 = (i + i2) - length;
        System.arraycopy(byteArray, 0, bArr, i3, length);
        int i4 = 0;
        if (z) {
            i4 = 255;
        }
        byte b = (byte) i4;
        while (true) {
            i++;
            if (i < i3) {
                bArr[i] = b;
            } else {
                return;
            }
        }
    }

    public static int formatCheckSumOctalBytes(long j, byte[] bArr, int i, int i2) {
        int i3 = i2 - 2;
        formatUnsignedOctalString(j, bArr, i, i3);
        bArr[i + i3] = (byte) 0;
        bArr[i + i3 + 1] = (byte) 32;
        return i + i2;
    }

    private static void formatLongBinary(long j, byte[] bArr, int i, int i2, boolean z) {
        int i3;
        long j2 = 1 << ((i2 - 1) * 8);
        long abs = Math.abs(j);
        if (abs >= j2) {
            throw new IllegalArgumentException("Value " + j + " is too large for " + i2 + " byte field.");
        }
        long j3 = abs;
        if (z) {
            j3 = ((abs ^ (j2 - 1)) | (255 << i3)) + 1;
        }
        for (int i4 = (i + i2) - 1; i4 >= i; i4--) {
            bArr[i4] = (byte) j3;
            j3 >>= 8;
        }
    }

    public static int formatLongOctalBytes(long j, byte[] bArr, int i, int i2) {
        int i3 = i2 - 1;
        formatUnsignedOctalString(j, bArr, i, i3);
        bArr[i + i3] = (byte) 32;
        return i + i2;
    }

    public static int formatLongOctalOrBinaryBytes(long j, byte[] bArr, int i, int i2) {
        int i3;
        long j2 = i2 == 8 ? 2097151L : 8589934591L;
        boolean z = j < 0;
        if (z || j > j2) {
            if (i2 < 9) {
                formatLongBinary(j, bArr, i, i2, z);
            }
            formatBigIntegerBinary(j, bArr, i, i2, z);
            bArr[i] = (byte) (z ? 255 : 128);
            i3 = i + i2;
        } else {
            i3 = formatLongOctalBytes(j, bArr, i, i2);
        }
        return i3;
    }

    public static int formatNameBytes(String str, byte[] bArr, int i, int i2) {
        int formatNameBytes;
        try {
            formatNameBytes = formatNameBytes(str, bArr, i, i2, DEFAULT_ENCODING);
        } catch (IOException e) {
            try {
                formatNameBytes = formatNameBytes(str, bArr, i, i2, FALLBACK_ENCODING);
            } catch (IOException e2) {
                throw new RuntimeException(e2);
            }
        }
        return formatNameBytes;
    }

    public static int formatNameBytes(String str, byte[] bArr, int i, int i2, ZipEncoding zipEncoding) throws IOException {
        ByteBuffer byteBuffer;
        int length = str.length();
        ByteBuffer encode = zipEncoding.encode(str);
        while (true) {
            byteBuffer = encode;
            if (byteBuffer.limit() <= i2 || length <= 0) {
                break;
            }
            length--;
            encode = zipEncoding.encode(str.substring(0, length));
        }
        int limit = byteBuffer.limit();
        System.arraycopy(byteBuffer.array(), byteBuffer.arrayOffset(), bArr, i, limit);
        while (limit < i2) {
            bArr[i + limit] = (byte) 0;
            limit++;
        }
        return i + i2;
    }

    public static int formatOctalBytes(long j, byte[] bArr, int i, int i2) {
        int i3 = i2 - 2;
        formatUnsignedOctalString(j, bArr, i, i3);
        bArr[i + i3] = (byte) 32;
        bArr[i + i3 + 1] = (byte) 0;
        return i + i2;
    }

    public static void formatUnsignedOctalString(long j, byte[] bArr, int i, int i2) {
        int i3 = i2 - 1;
        if (j == 0) {
            bArr[i + i3] = (byte) 48;
            i3--;
        } else {
            long j2 = j;
            while (i3 >= 0 && j2 != 0) {
                bArr[i + i3] = (byte) (((byte) (7 & j2)) + 48);
                j2 >>>= 3;
                i3--;
            }
            if (j2 != 0) {
                throw new IllegalArgumentException(j + "=" + Long.toOctalString(j) + " will not fit in octal number buffer of length " + i2);
            }
        }
        while (i3 >= 0) {
            bArr[i + i3] = (byte) 48;
            i3--;
        }
    }

    private static long parseBinaryBigInteger(byte[] bArr, int i, int i2, boolean z) {
        byte[] bArr2 = new byte[i2 - 1];
        System.arraycopy(bArr, i + 1, bArr2, 0, i2 - 1);
        BigInteger bigInteger = new BigInteger(bArr2);
        BigInteger bigInteger2 = bigInteger;
        if (z) {
            bigInteger2 = bigInteger.add(BigInteger.valueOf(-1L)).not();
        }
        if (bigInteger2.bitLength() > 63) {
            throw new IllegalArgumentException("At offset " + i + ", " + i2 + " byte binary number exceeds maximum signed long value");
        }
        return z ? -bigInteger2.longValue() : bigInteger2.longValue();
    }

    private static long parseBinaryLong(byte[] bArr, int i, int i2, boolean z) {
        if (i2 >= 9) {
            throw new IllegalArgumentException("At offset " + i + ", " + i2 + " byte binary number exceeds maximum signed long value");
        }
        long j = 0;
        for (int i3 = 1; i3 < i2; i3++) {
            j = (j << 8) + (bArr[i + i3] & 255);
        }
        long j2 = j;
        if (z) {
            j2 = (j - 1) ^ (((long) Math.pow(2.0d, (i2 - 1) * 8)) - 1);
        }
        long j3 = j2;
        if (z) {
            j3 = -j2;
        }
        return j3;
    }

    public static boolean parseBoolean(byte[] bArr, int i) {
        boolean z = true;
        if (bArr[i] != 1) {
            z = false;
        }
        return z;
    }

    public static String parseName(byte[] bArr, int i, int i2) {
        String parseName;
        try {
            parseName = parseName(bArr, i, i2, DEFAULT_ENCODING);
        } catch (IOException e) {
            try {
                parseName = parseName(bArr, i, i2, FALLBACK_ENCODING);
            } catch (IOException e2) {
                throw new RuntimeException(e2);
            }
        }
        return parseName;
    }

    public static String parseName(byte[] bArr, int i, int i2, ZipEncoding zipEncoding) throws IOException {
        String str;
        while (i2 > 0 && bArr[(i + i2) - 1] == 0) {
            i2--;
        }
        if (i2 > 0) {
            byte[] bArr2 = new byte[i2];
            System.arraycopy(bArr, i, bArr2, 0, i2);
            str = zipEncoding.decode(bArr2);
        } else {
            str = "";
        }
        return str;
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x008c, code lost:
        if (r0 == 32) goto L24;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static long parseOctal(byte[] bArr, int i, int i2) {
        long j;
        int i3;
        int i4;
        int i5 = i + i2;
        if (i2 < 2) {
            throw new IllegalArgumentException("Length " + i2 + " must be at least 2");
        }
        int i6 = i;
        if (bArr[i] == 0) {
            j = 0;
        } else {
            while (i6 < i5 && bArr[i6] == 32) {
                i6++;
            }
            byte b = bArr[i5 - 1];
            if (b != 0 && b != 32) {
                throw new IllegalArgumentException(exceptionMessage(bArr, i, i2, i5 - 1, b));
            }
            int i7 = i5 - 1;
            byte b2 = bArr[i7 - 1];
            if (b2 != 0) {
                i3 = i7;
                j = 0;
                i4 = i6;
            }
            i3 = i7 - 1;
            i4 = i6;
            j = 0;
            while (i4 < i3) {
                byte b3 = bArr[i4];
                if (b3 < 48 || b3 > 55) {
                    throw new IllegalArgumentException(exceptionMessage(bArr, i, i2, i4, b3));
                }
                j = (j << 3) + (b3 - 48);
                i4++;
            }
        }
        return j;
    }

    public static long parseOctalOrBinary(byte[] bArr, int i, int i2) {
        long parseBinaryLong;
        if ((bArr[i] & 128) == 0) {
            parseBinaryLong = parseOctal(bArr, i, i2);
        } else {
            boolean z = bArr[i] == -1;
            parseBinaryLong = i2 < 9 ? parseBinaryLong(bArr, i, i2, z) : parseBinaryBigInteger(bArr, i, i2, z);
        }
        return parseBinaryLong;
    }
}
