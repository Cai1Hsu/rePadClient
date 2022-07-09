package org.apache.tools.ant.taskdefs.condition;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/IsSet.class */
public class IsSet extends ProjectComponent implements Condition {
    private String property;

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        if (this.property == null) {
            throw new BuildException("No property specified for isset condition");
        }
        return getProject().getProperty(this.property) != null;
    }

    public void setProperty(String str) {
        this.property = str;
    }
}
