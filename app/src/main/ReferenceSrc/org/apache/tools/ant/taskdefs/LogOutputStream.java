package org.apache.tools.ant.taskdefs;

import java.io.IOException;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.util.LineOrientedOutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/LogOutputStream.class */
public class LogOutputStream extends LineOrientedOutputStream {
    private int level;
    private ProjectComponent pc;

    public LogOutputStream(ProjectComponent projectComponent) {
        this.level = 2;
        this.pc = projectComponent;
    }

    public LogOutputStream(ProjectComponent projectComponent, int i) {
        this(projectComponent);
        this.level = i;
    }

    public LogOutputStream(Task task, int i) {
        this((ProjectComponent) task, i);
    }

    public int getMessageLevel() {
        return this.level;
    }

    @Override // org.apache.tools.ant.util.LineOrientedOutputStream
    protected void processBuffer() {
        try {
            super.processBuffer();
        } catch (IOException e) {
            throw new RuntimeException(new StringBuffer().append("Impossible IOException caught: ").append(e).toString());
        }
    }

    @Override // org.apache.tools.ant.util.LineOrientedOutputStream
    protected void processLine(String str) {
        processLine(str, this.level);
    }

    protected void processLine(String str, int i) {
        this.pc.log(str, i);
    }
}
