package org.apache.tools.ant.taskdefs.optional.extension;

import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/extension/ExtraAttribute.class */
public class ExtraAttribute {
    private String name;
    private String value;

    String getName() {
        return this.name;
    }

    String getValue() {
        return this.value;
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setValue(String str) {
        this.value = str;
    }

    public void validate() throws BuildException {
        if (this.name == null) {
            throw new BuildException("Missing name from parameter.");
        }
        if (this.value != null) {
            return;
        }
        throw new BuildException(new StringBuffer().append("Missing value from parameter ").append(this.name).append(".").toString());
    }
}
