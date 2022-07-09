package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Copyfile.class */
public class Copyfile extends Task {
    private File destFile;
    private boolean filtering = false;
    private boolean forceOverwrite = false;
    private File srcFile;

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        log("DEPRECATED - The copyfile task is deprecated.  Use copy instead.");
        if (this.srcFile == null) {
            throw new BuildException("The src attribute must be present.", getLocation());
        }
        if (!this.srcFile.exists()) {
            throw new BuildException(new StringBuffer().append("src ").append(this.srcFile.toString()).append(DirectoryScanner.DOES_NOT_EXIST_POSTFIX).toString(), getLocation());
        }
        if (this.destFile == null) {
            throw new BuildException("The dest attribute must be present.", getLocation());
        }
        if (this.srcFile.equals(this.destFile)) {
            log("Warning: src == dest", 1);
        }
        if (!this.forceOverwrite && this.srcFile.lastModified() <= this.destFile.lastModified()) {
            return;
        }
        try {
            getProject().copyFile(this.srcFile, this.destFile, this.filtering, this.forceOverwrite);
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("Error copying file: ").append(this.srcFile.getAbsolutePath()).append(" due to ").append(e.getMessage()).toString());
        }
    }

    public void setDest(File file) {
        this.destFile = file;
    }

    public void setFiltering(String str) {
        this.filtering = Project.toBoolean(str);
    }

    public void setForceoverwrite(boolean z) {
        this.forceOverwrite = z;
    }

    public void setSrc(File file) {
        this.srcFile = file;
    }
}
