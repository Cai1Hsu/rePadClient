package org.apache.commons.compress.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: classes.jar:org/apache/commons/compress/utils/IOUtils.class */
public final class IOUtils {
    private IOUtils() {
    }

    public static long copy(InputStream inputStream, OutputStream outputStream) throws IOException {
        return copy(inputStream, outputStream, 8024);
    }

    public static long copy(InputStream inputStream, OutputStream outputStream, int i) throws IOException {
        byte[] bArr = new byte[i];
        long j = 0;
        while (true) {
            long j2 = j;
            int read = inputStream.read(bArr);
            if (-1 != read) {
                outputStream.write(bArr, 0, read);
                j = j2 + read;
            } else {
                return j2;
            }
        }
    }
}
