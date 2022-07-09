package org.apache.tools.ant.taskdefs;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Nice.class */
public class Nice extends Task {
    private String currentPriority;
    private Integer newPriority;

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Thread currentThread = Thread.currentThread();
        int priority = currentThread.getPriority();
        if (this.currentPriority != null) {
            getProject().setNewProperty(this.currentPriority, Integer.toString(priority));
        }
        if (this.newPriority == null || priority == this.newPriority.intValue()) {
            return;
        }
        try {
            currentThread.setPriority(this.newPriority.intValue());
        } catch (IllegalArgumentException e) {
            throw new BuildException("Priority out of range", e);
        } catch (SecurityException e2) {
            log("Unable to set new priority -a security manager is in the way", 1);
        }
    }

    public void setCurrentPriority(String str) {
        this.currentPriority = str;
    }

    public void setNewPriority(int i) {
        if (i < 1 || i > 10) {
            throw new BuildException("The thread priority is out of the range 1-10");
        }
        this.newPriority = new Integer(i);
    }
}
