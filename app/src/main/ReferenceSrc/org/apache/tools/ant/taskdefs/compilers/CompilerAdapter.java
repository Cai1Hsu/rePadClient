package org.apache.tools.ant.taskdefs.compilers;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Javac;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/compilers/CompilerAdapter.class */
public interface CompilerAdapter {
    boolean execute() throws BuildException;

    void setJavac(Javac javac);
}
