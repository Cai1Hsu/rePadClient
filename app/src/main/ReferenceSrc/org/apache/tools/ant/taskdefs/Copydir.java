package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Hashtable;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Copydir.class */
public class Copydir extends MatchingTask {
    private File destDir;
    private File srcDir;
    private boolean filtering = false;
    private boolean flatten = false;
    private boolean forceOverwrite = false;
    private Hashtable filecopyList = new Hashtable();

    private void scanDir(File file, File file2, String[] strArr) {
        for (String str : strArr) {
            File file3 = new File(file, str);
            File file4 = this.flatten ? new File(file2, new File(str).getName()) : new File(file2, str);
            if (this.forceOverwrite || file3.lastModified() > file4.lastModified()) {
                this.filecopyList.put(file3.getAbsolutePath(), file4.getAbsolutePath());
            }
        }
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        log("DEPRECATED - The copydir task is deprecated.  Use copy instead.");
        if (this.srcDir == null) {
            throw new BuildException("src attribute must be set!", getLocation());
        }
        if (!this.srcDir.exists()) {
            throw new BuildException(new StringBuffer().append("srcdir ").append(this.srcDir.toString()).append(" does not exist!").toString(), getLocation());
        }
        if (this.destDir == null) {
            throw new BuildException("The dest attribute must be set.", getLocation());
        }
        if (this.srcDir.equals(this.destDir)) {
            log("Warning: src == dest", 1);
        }
        try {
            scanDir(this.srcDir, this.destDir, super.getDirectoryScanner(this.srcDir).getIncludedFiles());
            if (this.filecopyList.size() > 0) {
                log(new StringBuffer().append("Copying ").append(this.filecopyList.size()).append(" file").append(this.filecopyList.size() == 1 ? "" : "s").append(" to ").append(this.destDir.getAbsolutePath()).toString());
                Enumeration keys = this.filecopyList.keys();
                while (keys.hasMoreElements()) {
                    String str = (String) keys.nextElement();
                    String str2 = (String) this.filecopyList.get(str);
                    try {
                        getProject().copyFile(str, str2, this.filtering, this.forceOverwrite);
                    } catch (IOException e) {
                        throw new BuildException(new StringBuffer().append("Failed to copy ").append(str).append(" to ").append(str2).append(" due to ").append(e.getMessage()).toString(), e, getLocation());
                    }
                }
            }
        } finally {
            this.filecopyList.clear();
        }
    }

    public void setDest(File file) {
        this.destDir = file;
    }

    public void setFiltering(boolean z) {
        this.filtering = z;
    }

    public void setFlatten(boolean z) {
        this.flatten = z;
    }

    public void setForceoverwrite(boolean z) {
        this.forceOverwrite = z;
    }

    public void setSrc(File file) {
        this.srcDir = file;
    }
}
