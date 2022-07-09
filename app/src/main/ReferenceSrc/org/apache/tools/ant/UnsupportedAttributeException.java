package org.apache.tools.ant;

/* loaded from: classes.jar:org/apache/tools/ant/UnsupportedAttributeException.class */
public class UnsupportedAttributeException extends BuildException {
    private final String attribute;

    public UnsupportedAttributeException(String str, String str2) {
        super(str);
        this.attribute = str2;
    }

    public String getAttribute() {
        return this.attribute;
    }
}
