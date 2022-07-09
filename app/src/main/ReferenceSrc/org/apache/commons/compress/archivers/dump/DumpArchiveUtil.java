package org.apache.commons.compress.archivers.dump;

import android.support.v4.view.MotionEventCompat;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/dump/DumpArchiveUtil.class */
class DumpArchiveUtil {
    private DumpArchiveUtil() {
    }

    public static int calculateChecksum(byte[] bArr) {
        int i = 0;
        for (int i2 = 0; i2 < 256; i2++) {
            i += convert32(bArr, i2 * 4);
        }
        return DumpArchiveConstants.CHECKSUM - (i - convert32(bArr, 28));
    }

    public static final int convert16(byte[] bArr, int i) {
        return 0 + ((bArr[i + 1] << 8) & MotionEventCompat.ACTION_POINTER_INDEX_MASK) + (bArr[i] & 255);
    }

    public static final int convert32(byte[] bArr, int i) {
        return (bArr[i + 3] << 24) + ((bArr[i + 2] << 16) & 16711680) + ((bArr[i + 1] << 8) & MotionEventCompat.ACTION_POINTER_INDEX_MASK) + (bArr[i] & 255);
    }

    public static final long convert64(byte[] bArr, int i) {
        return 0 + (bArr[i + 7] << 56) + ((bArr[i + 6] << 48) & 71776119061217280L) + ((bArr[i + 5] << 40) & 280375465082880L) + ((bArr[i + 4] << 32) & 1095216660480L) + ((bArr[i + 3] << 24) & 4278190080L) + ((bArr[i + 2] << 16) & 16711680) + ((bArr[i + 1] << 8) & 65280) + (bArr[i] & 255);
    }

    public static final int getIno(byte[] bArr) {
        return convert32(bArr, 20);
    }

    public static final boolean verify(byte[] bArr) {
        boolean z = false;
        if (convert32(bArr, 24) == 60012 && convert32(bArr, 28) == calculateChecksum(bArr)) {
            z = true;
        }
        return z;
    }
}
