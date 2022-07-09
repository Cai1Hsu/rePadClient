package org.apache.tools.ant.util;

import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/util/TaskLogger.class */
public final class TaskLogger {
    private Task task;

    public TaskLogger(Task task) {
        this.task = task;
    }

    public void debug(String str) {
        this.task.log(str, 4);
    }

    public void error(String str) {
        this.task.log(str, 0);
    }

    public void info(String str) {
        this.task.log(str, 2);
    }

    public void verbose(String str) {
        this.task.log(str, 3);
    }

    public void warning(String str) {
        this.task.log(str, 1);
    }
}
