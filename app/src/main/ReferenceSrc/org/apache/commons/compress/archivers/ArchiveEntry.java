package org.apache.commons.compress.archivers;

import java.util.Date;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/ArchiveEntry.class */
public interface ArchiveEntry {
    public static final long SIZE_UNKNOWN = -1;

    Date getLastModifiedDate();

    String getName();

    long getSize();

    boolean isDirectory();
}
