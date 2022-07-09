package org.apache.tools.ant.taskdefs.condition;

import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/Contains.class */
public class Contains implements Condition {
    private boolean caseSensitive = true;
    private String string;
    private String subString;

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        boolean z = true;
        if (this.string == null || this.subString == null) {
            throw new BuildException("both string and substring are required in contains");
        }
        if (this.caseSensitive) {
            if (this.string.indexOf(this.subString) <= -1) {
                z = false;
            }
        } else if (this.string.toLowerCase().indexOf(this.subString.toLowerCase()) <= -1) {
            z = false;
        }
        return z;
    }

    public void setCasesensitive(boolean z) {
        this.caseSensitive = z;
    }

    public void setString(String str) {
        this.string = str;
    }

    public void setSubstring(String str) {
        this.subString = str;
    }
}
