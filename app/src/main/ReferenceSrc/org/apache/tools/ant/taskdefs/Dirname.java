package org.apache.tools.ant.taskdefs;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Dirname.class */
public class Dirname extends Task {
    private File file;
    private String property;

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (this.property == null) {
            throw new BuildException("property attribute required", getLocation());
        }
        if (this.file == null) {
            throw new BuildException("file attribute required", getLocation());
        }
        getProject().setNewProperty(this.property, this.file.getParent());
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setProperty(String str) {
        this.property = str;
    }
}
