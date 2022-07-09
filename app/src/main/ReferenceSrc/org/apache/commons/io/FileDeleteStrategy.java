package org.apache.commons.io;

import java.io.File;
import java.io.IOException;

/* loaded from: classes.jar:org/apache/commons/io/FileDeleteStrategy.class */
public class FileDeleteStrategy {
    private final String name;
    public static final FileDeleteStrategy NORMAL = new FileDeleteStrategy("Normal");
    public static final FileDeleteStrategy FORCE = new ForceFileDeleteStrategy();

    /* loaded from: classes.jar:org/apache/commons/io/FileDeleteStrategy$ForceFileDeleteStrategy.class */
    static class ForceFileDeleteStrategy extends FileDeleteStrategy {
        ForceFileDeleteStrategy() {
            super("Force");
        }

        @Override // org.apache.commons.io.FileDeleteStrategy
        protected boolean doDelete(File file) throws IOException {
            FileUtils.forceDelete(file);
            return true;
        }
    }

    protected FileDeleteStrategy(String str) {
        this.name = str;
    }

    public void delete(File file) throws IOException {
        if (!file.exists() || doDelete(file)) {
            return;
        }
        throw new IOException("Deletion failed: " + file);
    }

    public boolean deleteQuietly(File file) {
        boolean z;
        if (file == null || !file.exists()) {
            z = true;
        } else {
            try {
                z = doDelete(file);
            } catch (IOException e) {
                z = false;
            }
        }
        return z;
    }

    protected boolean doDelete(File file) throws IOException {
        return file.delete();
    }

    public String toString() {
        return "FileDeleteStrategy[" + this.name + "]";
    }
}
