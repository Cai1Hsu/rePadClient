package org.apache.tools.ant.taskdefs;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.PropertyHelper;
import org.apache.tools.ant.taskdefs.condition.Condition;
import org.apache.tools.ant.taskdefs.condition.ConditionBase;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/ConditionTask.class */
public class ConditionTask extends ConditionBase {
    private String property = null;
    private Object value = "true";
    private Object alternative = null;

    public ConditionTask() {
        super("condition");
    }

    public void execute() throws BuildException {
        if (countConditions() > 1) {
            throw new BuildException(new StringBuffer().append("You must not nest more than one condition into <").append(getTaskName()).append(">").toString());
        }
        if (countConditions() < 1) {
            throw new BuildException(new StringBuffer().append("You must nest a condition into <").append(getTaskName()).append(">").toString());
        }
        if (this.property == null) {
            throw new BuildException("The property attribute is required.");
        }
        if (((Condition) getConditions().nextElement()).eval()) {
            log(new StringBuffer().append("Condition true; setting ").append(this.property).append(" to ").append(this.value).toString(), 4);
            PropertyHelper.getPropertyHelper(getProject()).setNewProperty(this.property, this.value);
        } else if (this.alternative == null) {
            log(new StringBuffer().append("Condition false; not setting ").append(this.property).toString(), 4);
        } else {
            log(new StringBuffer().append("Condition false; setting ").append(this.property).append(" to ").append(this.alternative).toString(), 4);
            PropertyHelper.getPropertyHelper(getProject()).setNewProperty(this.property, this.alternative);
        }
    }

    public void setElse(Object obj) {
        this.alternative = obj;
    }

    public void setElse(String str) {
        setElse((Object) str);
    }

    public void setProperty(String str) {
        this.property = str;
    }

    public void setValue(Object obj) {
        this.value = obj;
    }

    public void setValue(String str) {
        setValue((Object) str);
    }
}
