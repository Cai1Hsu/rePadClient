package org.apache.tools.ant.taskdefs;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/TempFile.class */
public class TempFile extends Task {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private boolean createFile;
    private boolean deleteOnExit;
    private String prefix;
    private String property;
    private File destDir = null;
    private String suffix = "";

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (this.property == null || this.property.length() == 0) {
            throw new BuildException("no property specified");
        }
        if (this.destDir == null) {
            this.destDir = getProject().resolveFile(".");
        }
        getProject().setNewProperty(this.property, FILE_UTILS.createTempFile(this.prefix, this.suffix, this.destDir, this.deleteOnExit, this.createFile).toString());
    }

    public boolean isCreateFile() {
        return this.createFile;
    }

    public boolean isDeleteOnExit() {
        return this.deleteOnExit;
    }

    public void setCreateFile(boolean z) {
        this.createFile = z;
    }

    public void setDeleteOnExit(boolean z) {
        this.deleteOnExit = z;
    }

    public void setDestDir(File file) {
        this.destDir = file;
    }

    public void setPrefix(String str) {
        this.prefix = str;
    }

    public void setProperty(String str) {
        this.property = str;
    }

    public void setSuffix(String str) {
        this.suffix = str;
    }
}
