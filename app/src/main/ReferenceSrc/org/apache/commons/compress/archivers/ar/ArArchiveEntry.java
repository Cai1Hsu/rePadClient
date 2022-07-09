package org.apache.commons.compress.archivers.ar;

import java.io.File;
import java.util.Date;
import org.apache.commons.compress.archivers.ArchiveEntry;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/ar/ArArchiveEntry.class */
public class ArArchiveEntry implements ArchiveEntry {
    private static final int DEFAULT_MODE = 33188;
    public static final String HEADER = "!<arch>\n";
    public static final String TRAILER = "`\n";
    private final int groupId;
    private final long lastModified;
    private final long length;
    private final int mode;
    private final String name;
    private final int userId;

    public ArArchiveEntry(File file, String str) {
        this(str, file.isFile() ? file.length() : 0L, 0, 0, 33188, file.lastModified() / 1000);
    }

    public ArArchiveEntry(String str, long j) {
        this(str, j, 0, 0, 33188, System.currentTimeMillis() / 1000);
    }

    public ArArchiveEntry(String str, long j, int i, int i2, int i3, long j2) {
        this.name = str;
        this.length = j;
        this.userId = i;
        this.groupId = i2;
        this.mode = i3;
        this.lastModified = j2;
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this != obj) {
            if (obj == null || getClass() != obj.getClass()) {
                z = false;
            } else {
                ArArchiveEntry arArchiveEntry = (ArArchiveEntry) obj;
                if (this.name == null) {
                    if (arArchiveEntry.name != null) {
                        z = false;
                    }
                } else if (!this.name.equals(arArchiveEntry.name)) {
                    z = false;
                }
            }
        }
        return z;
    }

    public int getGroupId() {
        return this.groupId;
    }

    public long getLastModified() {
        return this.lastModified;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public Date getLastModifiedDate() {
        return new Date(1000 * getLastModified());
    }

    public long getLength() {
        return this.length;
    }

    public int getMode() {
        return this.mode;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public String getName() {
        return this.name;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public long getSize() {
        return getLength();
    }

    public int getUserId() {
        return this.userId;
    }

    public int hashCode() {
        return (this.name == null ? 0 : this.name.hashCode()) + 31;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public boolean isDirectory() {
        return false;
    }
}
