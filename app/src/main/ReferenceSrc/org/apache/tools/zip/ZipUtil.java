package org.apache.tools.zip;

/* loaded from: classes.jar:org/apache/tools/zip/ZipUtil.class */
public abstract class ZipUtil {
    static byte[] copy(byte[] bArr) {
        byte[] bArr2;
        if (bArr != null) {
            byte[] bArr3 = new byte[bArr.length];
            System.arraycopy(bArr, 0, bArr3, 0, bArr3.length);
            bArr2 = bArr3;
        } else {
            bArr2 = null;
        }
        return bArr2;
    }
}
