package de.javawi.jstun.util;

/* loaded from: classes.jar:de/javawi/jstun/util/Utility.class */
public class Utility {
    public static final long fourBytesToLong(byte[] bArr) throws UtilityException {
        if (bArr.length < 4) {
            throw new UtilityException("Byte array too short!");
        }
        return ((bArr[0] & 255) << 24) + ((bArr[1] & 255) << 16) + ((bArr[2] & 255) << 8) + (bArr[3] & 255);
    }

    public static final byte[] integerToFourBytes(int i) throws UtilityException {
        if (i > Math.pow(2.0d, 63.0d) || i < 0) {
            throw new UtilityException("Integer value " + i + " is larger than 2^63");
        }
        return new byte[]{(byte) ((i >>> 24) & 255), (byte) ((i >>> 16) & 255), (byte) ((i >>> 8) & 255), (byte) (i & 255)};
    }

    public static final byte integerToOneByte(int i) throws UtilityException {
        if (i > Math.pow(2.0d, 15.0d) || i < 0) {
            throw new UtilityException("Integer value " + i + " is larger than 2^15");
        }
        return (byte) (i & 255);
    }

    public static final byte[] integerToTwoBytes(int i) throws UtilityException {
        if (i > Math.pow(2.0d, 31.0d) || i < 0) {
            throw new UtilityException("Integer value " + i + " is larger than 2^31");
        }
        return new byte[]{(byte) ((i >>> 8) & 255), (byte) (i & 255)};
    }

    public static final int oneByteToInteger(byte b) throws UtilityException {
        return b & 255;
    }

    public static final int twoBytesToInteger(byte[] bArr) throws UtilityException {
        if (bArr.length < 2) {
            throw new UtilityException("Byte array too short!");
        }
        return ((bArr[0] & 255) << 8) + (bArr[1] & 255);
    }
}
