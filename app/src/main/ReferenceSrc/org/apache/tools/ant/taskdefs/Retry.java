package org.apache.tools.ant.taskdefs;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.TaskContainer;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Retry.class */
public class Retry extends Task implements TaskContainer {
    private Task nestedTask;
    private int retryCount = 1;
    private int retryDelay = 0;

    @Override // org.apache.tools.ant.TaskContainer
    public void addTask(Task task) {
        synchronized (this) {
            if (this.nestedTask != null) {
                throw new BuildException("The retry task container accepts a single nested task (which may be a sequential task container)");
            }
            this.nestedTask = task;
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x00f9 -> B:18:0x00d6). Please submit an issue!!! */
    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i <= this.retryCount; i++) {
            try {
                this.nestedTask.perform();
                return;
            } catch (Exception e) {
                stringBuffer.append(e.getMessage());
                if (i >= this.retryCount) {
                    StringBuffer stringBuffer2 = new StringBuffer();
                    stringBuffer2.append("Task [").append(this.nestedTask.getTaskName());
                    stringBuffer2.append("] failed after [").append(this.retryCount);
                    stringBuffer2.append("] attempts; giving up.").append(StringUtils.LINE_SEP);
                    stringBuffer2.append("Error messages:").append(StringUtils.LINE_SEP);
                    stringBuffer2.append(stringBuffer);
                    throw new BuildException(stringBuffer2.toString(), getLocation());
                }
                log(this.retryDelay > 0 ? new StringBuffer().append("Attempt [").append(i).append("]: error occurred; retrying after ").append(this.retryDelay).append(" ms...").toString() : new StringBuffer().append("Attempt [").append(i).append("]: error occurred; retrying...").toString(), e, 2);
                stringBuffer.append(StringUtils.LINE_SEP);
                if (this.retryDelay > 0) {
                    try {
                        Thread.sleep(this.retryDelay);
                    } catch (InterruptedException e2) {
                    }
                }
            }
        }
    }

    public void setRetryCount(int i) {
        this.retryCount = i;
    }

    public void setRetryDelay(int i) {
        if (i < 0) {
            throw new BuildException("delay must be a non-negative number");
        }
        this.retryDelay = i;
    }
}
