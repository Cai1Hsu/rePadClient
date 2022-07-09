package org.apache.tools.ant.taskdefs;

import java.io.IOException;
import java.io.OutputStream;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/TaskOutputStream.class */
public class TaskOutputStream extends OutputStream {
    private StringBuffer line = new StringBuffer();
    private int msgOutputLevel;
    private Task task;

    TaskOutputStream(Task task, int i) {
        System.err.println("As of Ant 1.2 released in October 2000, the TaskOutputStream class");
        System.err.println("is considered to be dead code by the Ant developers and is unmaintained.");
        System.err.println("Don't use it!");
        this.task = task;
        this.msgOutputLevel = i;
    }

    private void processLine() {
        this.task.log(this.line.toString(), this.msgOutputLevel);
        this.line = new StringBuffer();
    }

    @Override // java.io.OutputStream
    public void write(int i) throws IOException {
        char c = (char) i;
        if (c != '\r' && c != '\n') {
            this.line.append(c);
        } else if (this.line.length() <= 0) {
        } else {
            processLine();
        }
    }
}
