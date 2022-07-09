package org.apache.tools.ant;

/* loaded from: classes.jar:org/apache/tools/ant/UnsupportedElementException.class */
public class UnsupportedElementException extends BuildException {
    private final String element;

    public UnsupportedElementException(String str, String str2) {
        super(str);
        this.element = str2;
    }

    public String getElement() {
        return this.element;
    }
}
