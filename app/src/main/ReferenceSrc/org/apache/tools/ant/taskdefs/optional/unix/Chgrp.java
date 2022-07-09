package org.apache.tools.ant.taskdefs.optional.unix;

import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/unix/Chgrp.class */
public class Chgrp extends AbstractAccessTask {
    private boolean haveGroup = false;

    public Chgrp() {
        super.setExecutable("chgrp");
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteOn, org.apache.tools.ant.taskdefs.ExecTask
    protected void checkConfiguration() {
        if (!this.haveGroup) {
            throw new BuildException("Required attribute group not set in chgrp", getLocation());
        }
        super.checkConfiguration();
    }

    @Override // org.apache.tools.ant.taskdefs.ExecTask
    public void setExecutable(String str) {
        throw new BuildException(new StringBuffer().append(getTaskType()).append(" doesn't support the executable").append(" attribute").toString(), getLocation());
    }

    public void setGroup(String str) {
        createArg().setValue(str);
        this.haveGroup = true;
    }
}
