package org.apache.tools.ant.taskdefs;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Basename.class */
public class Basename extends Task {
    private File file;
    private String property;
    private String suffix;

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (this.property == null) {
            throw new BuildException("property attribute required", getLocation());
        }
        if (this.file == null) {
            throw new BuildException("file attribute required", getLocation());
        }
        String name = this.file.getName();
        String str = name;
        if (this.suffix != null) {
            str = name;
            if (name.endsWith(this.suffix)) {
                int length = name.length() - this.suffix.length();
                int i = length;
                if (length > 0) {
                    i = length;
                    if (this.suffix.charAt(0) != '.') {
                        i = length;
                        if (name.charAt(length - 1) == '.') {
                            i = length - 1;
                        }
                    }
                }
                str = name.substring(0, i);
            }
        }
        getProject().setNewProperty(this.property, str);
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setProperty(String str) {
        this.property = str;
    }

    public void setSuffix(String str) {
        this.suffix = str;
    }
}
