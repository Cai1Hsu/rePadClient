package org.apache.commons.compress.archivers.tar;

import java.io.IOException;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/tar/TarArchiveSparseEntry.class */
public class TarArchiveSparseEntry implements TarConstants {
    private boolean isExtended;

    public TarArchiveSparseEntry(byte[] bArr) throws IOException {
        this.isExtended = TarUtils.parseBoolean(bArr, 0 + 504);
    }

    public boolean isExtended() {
        return this.isExtended;
    }
}
