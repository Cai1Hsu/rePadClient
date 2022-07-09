package org.apache.commons.io.monitor;

import java.io.File;
import java.io.Serializable;

/* loaded from: classes.jar:org/apache/commons/io/monitor/FileEntry.class */
public class FileEntry implements Serializable {
    static final FileEntry[] EMPTY_ENTRIES = new FileEntry[0];
    private FileEntry[] children;
    private boolean directory;
    private boolean exists;
    private final File file;
    private long lastModified;
    private long length;
    private String name;
    private final FileEntry parent;

    public FileEntry(File file) {
        this(null, file);
    }

    public FileEntry(FileEntry fileEntry, File file) {
        if (file == null) {
            throw new IllegalArgumentException("File is missing");
        }
        this.file = file;
        this.parent = fileEntry;
        this.name = file.getName();
    }

    public FileEntry[] getChildren() {
        return this.children != null ? this.children : EMPTY_ENTRIES;
    }

    public File getFile() {
        return this.file;
    }

    public long getLastModified() {
        return this.lastModified;
    }

    public long getLength() {
        return this.length;
    }

    public int getLevel() {
        return this.parent == null ? 0 : this.parent.getLevel() + 1;
    }

    public String getName() {
        return this.name;
    }

    public FileEntry getParent() {
        return this.parent;
    }

    public boolean isDirectory() {
        return this.directory;
    }

    public boolean isExists() {
        return this.exists;
    }

    public FileEntry newChildInstance(File file) {
        return new FileEntry(this, file);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x009a, code lost:
        if (r5.length != r0) goto L21;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean refresh(File file) {
        boolean z;
        boolean z2 = this.exists;
        long j = this.lastModified;
        boolean z3 = this.directory;
        long j2 = this.length;
        this.name = file.getName();
        this.exists = file.exists();
        this.directory = this.exists ? file.isDirectory() : false;
        this.lastModified = this.exists ? file.lastModified() : 0L;
        long j3 = 0;
        if (this.exists) {
            j3 = 0;
            if (!this.directory) {
                j3 = file.length();
            }
        }
        this.length = j3;
        if (this.exists == z2 && this.lastModified == j && this.directory == z3) {
            z = false;
        }
        z = true;
        return z;
    }

    public void setChildren(FileEntry[] fileEntryArr) {
        this.children = fileEntryArr;
    }

    public void setDirectory(boolean z) {
        this.directory = z;
    }

    public void setExists(boolean z) {
        this.exists = z;
    }

    public void setLastModified(long j) {
        this.lastModified = j;
    }

    public void setLength(long j) {
        this.length = j;
    }

    public void setName(String str) {
        this.name = str;
    }
}
