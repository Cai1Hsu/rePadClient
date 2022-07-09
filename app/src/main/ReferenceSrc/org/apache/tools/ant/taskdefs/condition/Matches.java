package org.apache.tools.ant.taskdefs.condition;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.types.RegularExpression;
import org.apache.tools.ant.util.regexp.RegexpUtil;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/Matches.class */
public class Matches extends ProjectComponent implements Condition {
    private RegularExpression regularExpression;
    private String string;
    private boolean caseSensitive = true;
    private boolean multiLine = false;
    private boolean singleLine = false;

    public void addRegexp(RegularExpression regularExpression) {
        if (this.regularExpression != null) {
            throw new BuildException("Only one regular expression is allowed.");
        }
        this.regularExpression = regularExpression;
    }

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        if (this.string == null) {
            throw new BuildException("Parameter string is required in matches.");
        }
        if (this.regularExpression == null) {
            throw new BuildException("Missing pattern in matches.");
        }
        return this.regularExpression.getRegexp(getProject()).matches(this.string, RegexpUtil.asOptions(this.caseSensitive, this.multiLine, this.singleLine));
    }

    public void setCasesensitive(boolean z) {
        this.caseSensitive = z;
    }

    public void setMultiline(boolean z) {
        this.multiLine = z;
    }

    public void setPattern(String str) {
        if (this.regularExpression != null) {
            throw new BuildException("Only one regular expression is allowed.");
        }
        this.regularExpression = new RegularExpression();
        this.regularExpression.setPattern(str);
    }

    public void setSingleLine(boolean z) {
        this.singleLine = z;
    }

    public void setString(String str) {
        this.string = str;
    }
}
