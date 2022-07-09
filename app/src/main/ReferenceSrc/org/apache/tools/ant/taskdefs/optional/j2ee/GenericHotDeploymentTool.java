package org.apache.tools.ant.taskdefs.optional.j2ee;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Java;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/j2ee/GenericHotDeploymentTool.class */
public class GenericHotDeploymentTool extends AbstractHotDeploymentTool {
    private static final String[] VALID_ACTIONS = {HotDeploymentTool.ACTION_DEPLOY};
    private String className;
    private Java java;

    public Commandline.Argument createArg() {
        return this.java.createArg();
    }

    public Commandline.Argument createJvmarg() {
        return this.java.createJvmarg();
    }

    @Override // org.apache.tools.ant.taskdefs.optional.j2ee.AbstractHotDeploymentTool, org.apache.tools.ant.taskdefs.optional.j2ee.HotDeploymentTool
    public void deploy() throws BuildException {
        this.java.setClassname(this.className);
        this.java.setClasspath(getClasspath());
        this.java.setFork(true);
        this.java.setFailonerror(true);
        this.java.execute();
    }

    public String getClassName() {
        return this.className;
    }

    public Java getJava() {
        return this.java;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.j2ee.AbstractHotDeploymentTool
    protected boolean isActionValid() {
        return getTask().getAction().equals(VALID_ACTIONS[0]);
    }

    public void setClassName(String str) {
        this.className = str;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.j2ee.AbstractHotDeploymentTool, org.apache.tools.ant.taskdefs.optional.j2ee.HotDeploymentTool
    public void setTask(ServerDeploy serverDeploy) {
        super.setTask(serverDeploy);
        this.java = new Java(serverDeploy);
    }

    @Override // org.apache.tools.ant.taskdefs.optional.j2ee.AbstractHotDeploymentTool, org.apache.tools.ant.taskdefs.optional.j2ee.HotDeploymentTool
    public void validateAttributes() throws BuildException {
        super.validateAttributes();
        if (this.className == null) {
            throw new BuildException("The classname attribute must be set");
        }
    }
}
