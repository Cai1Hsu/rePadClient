package org.apache.tools.ant.taskdefs.condition;

import java.io.File;
import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/FilesMatch.class */
public class FilesMatch implements Condition {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private File file1;
    private File file2;
    private boolean textfile = false;

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        if (this.file1 == null || this.file2 == null) {
            throw new BuildException("both file1 and file2 are required in filesmatch");
        }
        try {
            return FILE_UTILS.contentEquals(this.file1, this.file2, this.textfile);
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("when comparing files: ").append(e.getMessage()).toString(), e);
        }
    }

    public void setFile1(File file) {
        this.file1 = file;
    }

    public void setFile2(File file) {
        this.file2 = file;
    }

    public void setTextfile(boolean z) {
        this.textfile = z;
    }
}
