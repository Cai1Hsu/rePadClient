package org.apache.tools.ant.taskdefs.optional.j2ee;

import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/j2ee/HotDeploymentTool.class */
public interface HotDeploymentTool {
    public static final String ACTION_DELETE = "delete";
    public static final String ACTION_DEPLOY = "deploy";
    public static final String ACTION_LIST = "list";
    public static final String ACTION_UNDEPLOY = "undeploy";
    public static final String ACTION_UPDATE = "update";

    void deploy() throws BuildException;

    void setTask(ServerDeploy serverDeploy);

    void validateAttributes() throws BuildException;
}
