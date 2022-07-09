package org.apache.tools.ant.taskdefs.optional.net;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.email.EmailTask;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/net/MimeMail.class */
public class MimeMail extends EmailTask {
    @Override // org.apache.tools.ant.taskdefs.email.EmailTask, org.apache.tools.ant.Task
    public void execute() throws BuildException {
        log(new StringBuffer().append("DEPRECATED - The ").append(getTaskName()).append(" task is deprecated. ").append("Use the mail task instead.").toString());
        super.execute();
    }
}
