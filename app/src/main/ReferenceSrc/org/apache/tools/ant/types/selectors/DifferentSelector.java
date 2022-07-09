package org.apache.tools.ant.types.selectors;

import java.io.File;
import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/DifferentSelector.class */
public class DifferentSelector extends MappingSelector {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private boolean ignoreFileTimes = true;
    private boolean ignoreContents = false;

    /* JADX WARN: Code restructure failed: missing block: B:17:0x0055, code lost:
        if ((r9.lastModified() >= r8.lastModified() - ((long) r7.granularity) && r9.lastModified() <= r8.lastModified() + ((long) r7.granularity)) != false) goto L18;
     */
    @Override // org.apache.tools.ant.types.selectors.MappingSelector
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    protected boolean selectionTest(File file, File file2) {
        boolean z;
        if (file.exists() != file2.exists()) {
            z = true;
        } else {
            z = true;
            if (file.length() == file2.length()) {
                if (!this.ignoreFileTimes) {
                    z = true;
                }
                if (!this.ignoreContents) {
                    try {
                        z = true;
                        if (FILE_UTILS.contentEquals(file, file2)) {
                            z = false;
                        }
                    } catch (IOException e) {
                        throw new BuildException(new StringBuffer().append("while comparing ").append(file).append(" and ").append(file2).toString(), e);
                    }
                } else {
                    z = false;
                }
            }
        }
        return z;
    }

    public void setIgnoreContents(boolean z) {
        this.ignoreContents = z;
    }

    public void setIgnoreFileTimes(boolean z) {
        this.ignoreFileTimes = z;
    }
}
