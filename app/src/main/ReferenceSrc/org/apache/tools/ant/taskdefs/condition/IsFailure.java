package org.apache.tools.ant.taskdefs.condition;

import org.apache.tools.ant.taskdefs.Execute;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/IsFailure.class */
public class IsFailure implements Condition {
    private int code;

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() {
        return Execute.isFailure(this.code);
    }

    public int getCode() {
        return this.code;
    }

    public void setCode(int i) {
        this.code = i;
    }
}
