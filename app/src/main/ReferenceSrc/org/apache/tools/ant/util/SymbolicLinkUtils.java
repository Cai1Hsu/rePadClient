package org.apache.tools.ant.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.io.IOException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Execute;

/* loaded from: classes.jar:org/apache/tools/ant/util/SymbolicLinkUtils.class */
public class SymbolicLinkUtils {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static final SymbolicLinkUtils PRIMARY_INSTANCE = new SymbolicLinkUtils();

    protected SymbolicLinkUtils() {
    }

    public static SymbolicLinkUtils getSymbolicLinkUtils() {
        return PRIMARY_INSTANCE;
    }

    /* JADX DEBUG: Finally have unexpected throw blocks count: 2, expect 1 */
    public void deleteSymbolicLink(File file, Task task) throws IOException {
        if (isDanglingSymbolicLink(file)) {
            if (file.delete()) {
                return;
            }
            throw new IOException(new StringBuffer().append("failed to remove dangling symbolic link ").append(file).toString());
        } else if (!isSymbolicLink(file)) {
        } else {
            if (!file.exists()) {
                throw new FileNotFoundException(new StringBuffer().append("No such symbolic link: ").append(file).toString());
            }
            File canonicalFile = file.getCanonicalFile();
            if (task != null && !canonicalFile.getParentFile().canWrite()) {
                Execute.runCommand(task, new String[]{"rm", file.getAbsolutePath()});
                return;
            }
            File createTempFile = FILE_UTILS.createTempFile("symlink", ".tmp", canonicalFile.getParentFile(), false, false);
            File file2 = file;
            if (FILE_UTILS.isLeadingPath(canonicalFile, file)) {
                file2 = new File(createTempFile, FILE_UTILS.removeLeadingPath(canonicalFile, file));
            }
            try {
                try {
                    FILE_UTILS.rename(canonicalFile, createTempFile);
                    if (!file2.delete()) {
                        throw new IOException(new StringBuffer().append("Couldn't delete symlink: ").append(file2).append(" (was it a real file? is this ").append("not a UNIX system?)").toString());
                    }
                    if (1 == 0) {
                        return;
                    }
                    try {
                        FILE_UTILS.rename(createTempFile, canonicalFile);
                    } catch (IOException e) {
                        throw new IOException(new StringBuffer().append("Couldn't return resource ").append(createTempFile).append(" to its original name: ").append(canonicalFile.getAbsolutePath()).append(". Reason: ").append(e.getMessage()).append("\n THE RESOURCE'S NAME ON DISK").append(" HAS BEEN CHANGED BY THIS").append(" ERROR!\n").toString());
                    }
                } catch (IOException e2) {
                    throw new IOException(new StringBuffer().append("Couldn't rename resource when attempting to delete '").append(file2).append("'.  Reason: ").append(e2.getMessage()).toString());
                }
            } catch (Throwable th) {
                if (0 != 0) {
                    try {
                        FILE_UTILS.rename(createTempFile, canonicalFile);
                    } catch (IOException e3) {
                        throw new IOException(new StringBuffer().append("Couldn't return resource ").append(createTempFile).append(" to its original name: ").append(canonicalFile.getAbsolutePath()).append(". Reason: ").append(e3.getMessage()).append("\n THE RESOURCE'S NAME ON DISK").append(" HAS BEEN CHANGED BY THIS").append(" ERROR!\n").toString());
                    }
                }
                throw th;
            }
        }
    }

    public boolean isDanglingSymbolicLink(File file) throws IOException {
        return isDanglingSymbolicLink(file.getParentFile(), file.getName());
    }

    public boolean isDanglingSymbolicLink(File file, String str) throws IOException {
        File file2 = new File(file, str);
        boolean z = false;
        if (!file2.exists()) {
            String[] list = file.list(new FilenameFilter(this, file2.getName()) { // from class: org.apache.tools.ant.util.SymbolicLinkUtils.1
                private final SymbolicLinkUtils this$0;
                private final String val$localName;

                {
                    this.this$0 = this;
                    this.val$localName = r5;
                }

                @Override // java.io.FilenameFilter
                public boolean accept(File file3, String str2) {
                    return this.val$localName.equals(str2);
                }
            });
            z = false;
            if (list != null) {
                z = false;
                if (list.length > 0) {
                    z = true;
                }
            }
        }
        return z;
    }

    public boolean isDanglingSymbolicLink(String str) throws IOException {
        return isDanglingSymbolicLink(new File(str));
    }

    public boolean isSymbolicLink(File file) throws IOException {
        return isSymbolicLink(file.getParentFile(), file.getName());
    }

    public boolean isSymbolicLink(File file, String str) throws IOException {
        File file2 = file != null ? new File(file.getCanonicalPath(), str) : new File(str);
        return !file2.getAbsolutePath().equals(file2.getCanonicalPath());
    }

    public boolean isSymbolicLink(String str) throws IOException {
        return isSymbolicLink(new File(str));
    }
}
