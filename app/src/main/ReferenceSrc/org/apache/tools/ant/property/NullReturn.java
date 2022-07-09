package org.apache.tools.ant.property;

/* loaded from: classes.jar:org/apache/tools/ant/property/NullReturn.class */
public final class NullReturn {
    public static final NullReturn NULL = new NullReturn();

    private NullReturn() {
    }

    public String toString() {
        return "null";
    }
}
