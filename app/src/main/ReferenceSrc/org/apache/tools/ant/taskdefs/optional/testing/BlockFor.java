package org.apache.tools.ant.taskdefs.optional.testing;

import org.apache.tools.ant.taskdefs.WaitFor;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/testing/BlockFor.class */
public class BlockFor extends WaitFor {
    private String text;

    public BlockFor() {
        super("blockfor");
        this.text = new StringBuffer().append(getTaskName()).append(" timed out").toString();
    }

    public BlockFor(String str) {
        super(str);
    }

    public void addText(String str) {
        this.text = getProject().replaceProperties(str);
    }

    @Override // org.apache.tools.ant.taskdefs.WaitFor
    protected void processTimeout() throws BuildTimeoutException {
        super.processTimeout();
        throw new BuildTimeoutException(this.text, getLocation());
    }
}
