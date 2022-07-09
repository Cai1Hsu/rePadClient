package org.apache.tools.ant.taskdefs.optional.jlink;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.MatchingTask;
import org.apache.tools.ant.types.Path;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/jlink/JlinkTask.class */
public class JlinkTask extends MatchingTask {
    private File outfile = null;
    private Path mergefiles = null;
    private Path addfiles = null;
    private boolean compress = false;

    private boolean haveAddFiles() {
        return haveEntries(this.addfiles);
    }

    private boolean haveEntries(Path path) {
        boolean z = false;
        if (path != null && path.size() > 0) {
            z = true;
        }
        return z;
    }

    private boolean haveMergeFiles() {
        return haveEntries(this.mergefiles);
    }

    public Path createAddfiles() {
        if (this.addfiles == null) {
            this.addfiles = new Path(getProject());
        }
        return this.addfiles.createPath();
    }

    public Path createMergefiles() {
        if (this.mergefiles == null) {
            this.mergefiles = new Path(getProject());
        }
        return this.mergefiles.createPath();
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (this.outfile == null) {
            throw new BuildException("outfile attribute is required! Please set.");
        }
        if (!haveAddFiles() && !haveMergeFiles()) {
            throw new BuildException("addfiles or mergefiles required! Please set.");
        }
        log(new StringBuffer().append("linking:     ").append(this.outfile.getPath()).toString());
        log(new StringBuffer().append("compression: ").append(this.compress).toString(), 3);
        jlink jlinkVar = new jlink();
        jlinkVar.setOutfile(this.outfile.getPath());
        jlinkVar.setCompression(this.compress);
        if (haveMergeFiles()) {
            log(new StringBuffer().append("merge files: ").append(this.mergefiles.toString()).toString(), 3);
            jlinkVar.addMergeFiles(this.mergefiles.list());
        }
        if (haveAddFiles()) {
            log(new StringBuffer().append("add files: ").append(this.addfiles.toString()).toString(), 3);
            jlinkVar.addAddFiles(this.addfiles.list());
        }
        try {
            jlinkVar.link();
        } catch (Exception e) {
            throw new BuildException(e, getLocation());
        }
    }

    public void setAddfiles(Path path) {
        if (this.addfiles == null) {
            this.addfiles = path;
        } else {
            this.addfiles.append(path);
        }
    }

    public void setCompress(boolean z) {
        this.compress = z;
    }

    public void setMergefiles(Path path) {
        if (this.mergefiles == null) {
            this.mergefiles = path;
        } else {
            this.mergefiles.append(path);
        }
    }

    public void setOutfile(File file) {
        this.outfile = file;
    }
}
