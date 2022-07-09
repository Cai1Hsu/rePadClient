package org.apache.tools.ant.taskdefs.optional.j2ee;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Path;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/j2ee/AbstractHotDeploymentTool.class */
public abstract class AbstractHotDeploymentTool implements HotDeploymentTool {
    private Path classpath;
    private String password;
    private String server;
    private ServerDeploy task;
    private String userName;

    public Path createClasspath() {
        if (this.classpath == null) {
            this.classpath = new Path(this.task.getProject());
        }
        return this.classpath.createPath();
    }

    @Override // org.apache.tools.ant.taskdefs.optional.j2ee.HotDeploymentTool
    public abstract void deploy() throws BuildException;

    public Path getClasspath() {
        return this.classpath;
    }

    public String getPassword() {
        return this.password;
    }

    public String getServer() {
        return this.server;
    }

    protected ServerDeploy getTask() {
        return this.task;
    }

    public String getUserName() {
        return this.userName;
    }

    protected abstract boolean isActionValid();

    public void setClasspath(Path path) {
        this.classpath = path;
    }

    public void setPassword(String str) {
        this.password = str;
    }

    public void setServer(String str) {
        this.server = str;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.j2ee.HotDeploymentTool
    public void setTask(ServerDeploy serverDeploy) {
        this.task = serverDeploy;
    }

    public void setUserName(String str) {
        this.userName = str;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.j2ee.HotDeploymentTool
    public void validateAttributes() throws BuildException {
        if (this.task.getAction() == null) {
            throw new BuildException("The \"action\" attribute must be set");
        }
        if (!isActionValid()) {
            throw new BuildException(new StringBuffer().append("Invalid action \"").append(this.task.getAction()).append("\" passed").toString());
        }
        if (this.classpath != null) {
            return;
        }
        throw new BuildException("The classpath attribute must be set");
    }
}
