package org.apache.tools.ant.taskdefs.condition;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.util.DeweyDecimal;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/AntVersion.class */
public class AntVersion extends Task implements Condition {
    private String atLeast = null;
    private String exactly = null;
    private String propertyname = null;

    private DeweyDecimal getVersion() {
        Project project = new Project();
        project.init();
        char[] charArray = project.getProperty(MagicNames.ANT_VERSION).toCharArray();
        StringBuffer stringBuffer = new StringBuffer();
        boolean z = false;
        for (int i = 0; i < charArray.length; i++) {
            if (Character.isDigit(charArray[i])) {
                stringBuffer.append(charArray[i]);
                z = true;
            }
            if (charArray[i] == '.' && z) {
                stringBuffer.append(charArray[i]);
            }
            if (Character.isLetter(charArray[i]) && z) {
                break;
            }
        }
        return new DeweyDecimal(stringBuffer.toString());
    }

    private void validate() throws BuildException {
        if (this.atLeast == null || this.exactly == null) {
            if (this.atLeast == null && this.exactly == null) {
                throw new BuildException("One of atleast or exactly must be set.");
            }
            if (this.atLeast != null) {
                try {
                    new DeweyDecimal(this.atLeast);
                    return;
                } catch (NumberFormatException e) {
                    throw new BuildException(new StringBuffer().append("The 'atleast' attribute is not a Dewey Decimal eg 1.1.0 : ").append(this.atLeast).toString());
                }
            }
            try {
                new DeweyDecimal(this.exactly);
                return;
            } catch (NumberFormatException e2) {
                throw new BuildException(new StringBuffer().append("The 'exactly' attribute is not a Dewey Decimal eg 1.1.0 : ").append(this.exactly).toString());
            }
        }
        throw new BuildException("Only one of atleast or exactly may be set.");
    }

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        validate();
        DeweyDecimal version = getVersion();
        return this.atLeast != null ? version.isGreaterThanOrEqual(new DeweyDecimal(this.atLeast)) : this.exactly != null ? version.isEqual(new DeweyDecimal(this.exactly)) : false;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (this.propertyname == null) {
            throw new BuildException("'property' must be set.");
        }
        if (this.atLeast == null && this.exactly == null) {
            getProject().setNewProperty(this.propertyname, getVersion().toString());
        } else if (!eval()) {
        } else {
            getProject().setNewProperty(this.propertyname, getVersion().toString());
        }
    }

    public String getAtLeast() {
        return this.atLeast;
    }

    public String getExactly() {
        return this.exactly;
    }

    public String getProperty() {
        return this.propertyname;
    }

    public void setAtLeast(String str) {
        this.atLeast = str;
    }

    public void setExactly(String str) {
        this.exactly = str;
    }

    public void setProperty(String str) {
        this.propertyname = str;
    }
}
