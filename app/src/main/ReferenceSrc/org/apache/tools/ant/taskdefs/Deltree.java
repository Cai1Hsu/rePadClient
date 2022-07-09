package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Deltree.class */
public class Deltree extends Task {
    private File dir;

    private void removeDir(File file) throws IOException {
        for (String str : file.list()) {
            File file2 = new File(file, str);
            if (file2.isDirectory()) {
                removeDir(file2);
            } else if (!file2.delete()) {
                throw new BuildException(new StringBuffer().append("Unable to delete file ").append(file2.getAbsolutePath()).toString());
            }
        }
        if (!file.delete()) {
            throw new BuildException(new StringBuffer().append("Unable to delete directory ").append(file.getAbsolutePath()).toString());
        }
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        log("DEPRECATED - The deltree task is deprecated.  Use delete instead.");
        if (this.dir == null) {
            throw new BuildException("dir attribute must be set!", getLocation());
        }
        if (!this.dir.exists()) {
            return;
        }
        if (!this.dir.isDirectory()) {
            if (this.dir.delete()) {
                return;
            }
            throw new BuildException(new StringBuffer().append("Unable to delete directory ").append(this.dir.getAbsolutePath()).toString(), getLocation());
        }
        log(new StringBuffer().append("Deleting: ").append(this.dir.getAbsolutePath()).toString());
        try {
            removeDir(this.dir);
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("Unable to delete ").append(this.dir.getAbsolutePath()).toString(), getLocation());
        }
    }

    public void setDir(File file) {
        this.dir = file;
    }
}
