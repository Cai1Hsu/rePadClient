package org.apache.tools.ant.taskdefs.optional.unix;

import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/unix/Chown.class */
public class Chown extends AbstractAccessTask {
    private boolean haveOwner = false;

    public Chown() {
        super.setExecutable("chown");
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteOn, org.apache.tools.ant.taskdefs.ExecTask
    protected void checkConfiguration() {
        if (!this.haveOwner) {
            throw new BuildException("Required attribute owner not set in chown", getLocation());
        }
        super.checkConfiguration();
    }

    @Override // org.apache.tools.ant.taskdefs.ExecTask
    public void setExecutable(String str) {
        throw new BuildException(new StringBuffer().append(getTaskType()).append(" doesn't support the executable").append(" attribute").toString(), getLocation());
    }

    public void setOwner(String str) {
        createArg().setValue(str);
        this.haveOwner = true;
    }
}
