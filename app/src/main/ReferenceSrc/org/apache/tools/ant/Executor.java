package org.apache.tools.ant;

/* loaded from: classes.jar:org/apache/tools/ant/Executor.class */
public interface Executor {
    void executeTargets(Project project, String[] strArr) throws BuildException;

    Executor getSubProjectExecutor();
}
