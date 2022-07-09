package org.apache.commons.compress.utils;

import java.io.UnsupportedEncodingException;
import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.http.protocol.HTTP;

/* loaded from: classes.jar:org/apache/commons/compress/utils/ArchiveUtils.class */
public class ArchiveUtils {
    private ArchiveUtils() {
    }

    public static boolean isEqual(byte[] bArr, int i, int i2, byte[] bArr2, int i3, int i4) {
        return isEqual(bArr, i, i2, bArr2, i3, i4, false);
    }

    public static boolean isEqual(byte[] bArr, int i, int i2, byte[] bArr2, int i3, int i4, boolean z) {
        boolean z2;
        int i5 = i2 < i4 ? i2 : i4;
        int i6 = 0;
        while (true) {
            if (i6 < i5) {
                if (bArr[i + i6] != bArr2[i3 + i6]) {
                    z2 = false;
                    break;
                }
                i6++;
            } else if (i2 == i4) {
                z2 = true;
            } else {
                z2 = false;
                if (z) {
                    if (i2 > i4) {
                        for (int i7 = i4; i7 < i2; i7++) {
                            z2 = false;
                            if (bArr[i + i7] != 0) {
                                break;
                            }
                        }
                        z2 = true;
                    } else {
                        while (i2 < i4) {
                            z2 = false;
                            if (bArr2[i3 + i2] != 0) {
                                break;
                            }
                            i2++;
                        }
                        z2 = true;
                    }
                }
            }
        }
        return z2;
    }

    public static boolean isEqual(byte[] bArr, byte[] bArr2) {
        return isEqual(bArr, 0, bArr.length, bArr2, 0, bArr2.length, false);
    }

    public static boolean isEqual(byte[] bArr, byte[] bArr2, boolean z) {
        return isEqual(bArr, 0, bArr.length, bArr2, 0, bArr2.length, z);
    }

    public static boolean isEqualWithNull(byte[] bArr, int i, int i2, byte[] bArr2, int i3, int i4) {
        return isEqual(bArr, i, i2, bArr2, i3, i4, true);
    }

    public static boolean matchAsciiBuffer(String str, byte[] bArr) {
        return matchAsciiBuffer(str, bArr, 0, bArr.length);
    }

    public static boolean matchAsciiBuffer(String str, byte[] bArr, int i, int i2) {
        try {
            byte[] bytes = str.getBytes(HTTP.ASCII);
            return isEqual(bytes, 0, bytes.length, bArr, i, i2, false);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public static byte[] toAsciiBytes(String str) {
        try {
            return str.getBytes(HTTP.ASCII);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public static String toAsciiString(byte[] bArr) {
        try {
            return new String(bArr, HTTP.ASCII);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public static String toAsciiString(byte[] bArr, int i, int i2) {
        try {
            return new String(bArr, i, i2, HTTP.ASCII);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public static String toString(ArchiveEntry archiveEntry) {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(archiveEntry.isDirectory() ? 'd' : '-');
        String l = Long.toString(archiveEntry.getSize());
        stringBuffer.append(' ');
        for (int i = 7; i > l.length(); i--) {
            stringBuffer.append(' ');
        }
        stringBuffer.append(l);
        stringBuffer.append(' ').append(archiveEntry.getName());
        return stringBuffer.toString();
    }
}
