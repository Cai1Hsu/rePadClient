package org.apache.tools.ant.taskdefs;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Mkdir.class */
public class Mkdir extends Task {
    private static final int MKDIR_RETRY_SLEEP_MILLIS = 10;
    private File dir;

    private boolean mkdirs(File file) {
        boolean mkdirs;
        if (!file.mkdirs()) {
            try {
                Thread.sleep(10L);
                mkdirs = file.mkdirs();
            } catch (InterruptedException e) {
                mkdirs = file.mkdirs();
            }
        } else {
            mkdirs = true;
        }
        return mkdirs;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (this.dir == null) {
            throw new BuildException("dir attribute is required", getLocation());
        }
        if (this.dir.isFile()) {
            throw new BuildException(new StringBuffer().append("Unable to create directory as a file already exists with that name: ").append(this.dir.getAbsolutePath()).toString());
        }
        if (this.dir.exists()) {
            log(new StringBuffer().append("Skipping ").append(this.dir.getAbsolutePath()).append(" because it already exists.").toString(), 3);
        } else if (mkdirs(this.dir)) {
            log(new StringBuffer().append("Created dir: ").append(this.dir.getAbsolutePath()).toString());
        } else if (!this.dir.exists()) {
            throw new BuildException(new StringBuffer().append("Directory ").append(this.dir.getAbsolutePath()).append(" creation was not successful for an unknown reason").toString(), getLocation());
        } else {
            log(new StringBuffer().append("A different process or task has already created dir ").append(this.dir.getAbsolutePath()).toString(), 3);
        }
    }

    public File getDir() {
        return this.dir;
    }

    public void setDir(File file) {
        this.dir = file;
    }
}
