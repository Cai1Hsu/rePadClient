package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Rename.class */
public class Rename extends Task {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private File dest;
    private boolean replace = true;
    private File src;

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        log("DEPRECATED - The rename task is deprecated.  Use move instead.");
        if (this.dest == null) {
            throw new BuildException("dest attribute is required", getLocation());
        }
        if (this.src == null) {
            throw new BuildException("src attribute is required", getLocation());
        }
        if (!this.replace && this.dest.exists()) {
            throw new BuildException(new StringBuffer().append(this.dest).append(" already exists.").toString());
        }
        try {
            FILE_UTILS.rename(this.src, this.dest);
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("Unable to rename ").append(this.src).append(" to ").append(this.dest).toString(), e, getLocation());
        }
    }

    public void setDest(File file) {
        this.dest = file;
    }

    public void setReplace(String str) {
        this.replace = Project.toBoolean(str);
    }

    public void setSrc(File file) {
        this.src = file;
    }
}
