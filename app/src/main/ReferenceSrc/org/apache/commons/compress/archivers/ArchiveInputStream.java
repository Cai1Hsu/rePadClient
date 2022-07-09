package org.apache.commons.compress.archivers;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/ArchiveInputStream.class */
public abstract class ArchiveInputStream extends InputStream {
    private static final int BYTE_MASK = 255;
    private byte[] SINGLE = new byte[1];
    private long bytesRead = 0;

    public boolean canReadEntryData(ArchiveEntry archiveEntry) {
        return true;
    }

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

    public abstract ArchiveEntry getNextEntry() throws IOException;

    protected void pushedBackBytes(long j) {
        this.bytesRead -= j;
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int i = -1;
        if (read(this.SINGLE, 0, 1) != -1) {
            i = this.SINGLE[0] & 255;
        }
        return i;
    }
}
