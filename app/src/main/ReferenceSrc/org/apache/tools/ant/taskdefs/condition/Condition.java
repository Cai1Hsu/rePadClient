package org.apache.tools.ant.taskdefs.condition;

import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/Condition.class */
public interface Condition {
    boolean eval() throws BuildException;
}
