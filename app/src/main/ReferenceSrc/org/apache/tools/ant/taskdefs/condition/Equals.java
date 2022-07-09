package org.apache.tools.ant.taskdefs.condition;

import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/Equals.class */
public class Equals implements Condition {
    private static final int REQUIRED = 3;
    private Object arg1;
    private Object arg2;
    private int args;
    private boolean trim = false;
    private boolean caseSensitive = true;
    private boolean forcestring = false;

    private void setArg1Internal(Object obj) {
        this.arg1 = obj;
        this.args |= 1;
    }

    private void setArg2Internal(Object obj) {
        this.arg2 = obj;
        this.args |= 2;
    }

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        boolean z;
        if ((this.args & 3) != 3) {
            throw new BuildException("both arg1 and arg2 are required in equals");
        }
        if (this.arg1 == this.arg2 || (this.arg1 != null && this.arg1.equals(this.arg2))) {
            z = true;
        } else {
            if (this.forcestring) {
                this.arg1 = (this.arg1 == null || (this.arg1 instanceof String)) ? this.arg1 : this.arg1.toString();
                this.arg2 = (this.arg2 == null || (this.arg2 instanceof String)) ? this.arg2 : this.arg2.toString();
            }
            if ((this.arg1 instanceof String) && this.trim) {
                this.arg1 = ((String) this.arg1).trim();
            }
            if ((this.arg2 instanceof String) && this.trim) {
                this.arg2 = ((String) this.arg2).trim();
            }
            if (!(this.arg1 instanceof String) || !(this.arg2 instanceof String)) {
                z = false;
            } else {
                String str = (String) this.arg1;
                String str2 = (String) this.arg2;
                z = this.caseSensitive ? str.equals(str2) : str.equalsIgnoreCase(str2);
            }
        }
        return z;
    }

    public void setArg1(Object obj) {
        if (obj instanceof String) {
            setArg1((String) obj);
        } else {
            setArg1Internal(obj);
        }
    }

    public void setArg1(String str) {
        setArg1Internal(str);
    }

    public void setArg2(Object obj) {
        if (obj instanceof String) {
            setArg2((String) obj);
        } else {
            setArg2Internal(obj);
        }
    }

    public void setArg2(String str) {
        setArg2Internal(str);
    }

    public void setCasesensitive(boolean z) {
        this.caseSensitive = z;
    }

    public void setForcestring(boolean z) {
        this.forcestring = z;
    }

    public void setTrim(boolean z) {
        this.trim = z;
    }
}
