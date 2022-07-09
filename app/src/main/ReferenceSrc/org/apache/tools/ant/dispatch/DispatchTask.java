package org.apache.tools.ant.dispatch;

import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/dispatch/DispatchTask.class */
public abstract class DispatchTask extends Task implements Dispatchable {
    private String action;

    public String getAction() {
        return this.action;
    }

    @Override // org.apache.tools.ant.dispatch.Dispatchable
    public String getActionParameterName() {
        return "action";
    }

    public void setAction(String str) {
        this.action = str;
    }
}
