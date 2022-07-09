package org.apache.tools.ant;

/* loaded from: classes.jar:org/apache/tools/ant/ExtensionPoint.class */
public class ExtensionPoint extends Target {
    private static final String NO_CHILDREN_ALLOWED = "you must not nest child elements into an extension-point";

    @Override // org.apache.tools.ant.Target
    public final void addDataType(RuntimeConfigurable runtimeConfigurable) {
        throw new BuildException(NO_CHILDREN_ALLOWED);
    }

    @Override // org.apache.tools.ant.Target, org.apache.tools.ant.TaskContainer
    public final void addTask(Task task) {
        throw new BuildException(NO_CHILDREN_ALLOWED);
    }
}
