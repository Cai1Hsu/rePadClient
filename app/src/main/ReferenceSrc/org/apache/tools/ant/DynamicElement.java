package org.apache.tools.ant;

/* loaded from: classes.jar:org/apache/tools/ant/DynamicElement.class */
public interface DynamicElement {
    Object createDynamicElement(String str) throws BuildException;
}
