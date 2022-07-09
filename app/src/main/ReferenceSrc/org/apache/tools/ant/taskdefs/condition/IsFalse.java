package org.apache.tools.ant.taskdefs.condition;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/IsFalse.class */
public class IsFalse extends ProjectComponent implements Condition {
    private Boolean value = null;

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        if (this.value == null) {
            throw new BuildException("Nothing to test for falsehood");
        }
        return !this.value.booleanValue();
    }

    public void setValue(boolean z) {
        this.value = z ? Boolean.TRUE : Boolean.FALSE;
    }
}
