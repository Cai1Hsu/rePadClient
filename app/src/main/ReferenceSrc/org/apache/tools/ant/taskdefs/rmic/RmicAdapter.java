package org.apache.tools.ant.taskdefs.rmic;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Rmic;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.FileNameMapper;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/rmic/RmicAdapter.class */
public interface RmicAdapter {
    boolean execute() throws BuildException;

    Path getClasspath();

    FileNameMapper getMapper();

    void setRmic(Rmic rmic);
}
