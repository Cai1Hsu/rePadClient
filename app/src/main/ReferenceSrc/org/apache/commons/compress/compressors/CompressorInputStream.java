package org.apache.commons.compress.compressors;

import java.io.InputStream;

/* loaded from: classes.jar:org/apache/commons/compress/compressors/CompressorInputStream.class */
public abstract class CompressorInputStream extends InputStream {
    private long bytesRead = 0;

    protected void count(int i) {
        count(i);
    }

    protected void count(long j) {
        if (j != -1) {
            this.bytesRead += j;
        }
    }

    public long getBytesRead() {
        return this.bytesRead;
    }

    @Deprecated
    public int getCount() {
        return (int) this.bytesRead;
    }
}
