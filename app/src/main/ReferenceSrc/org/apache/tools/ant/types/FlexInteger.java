package org.apache.tools.ant.types;

/* loaded from: classes.jar:org/apache/tools/ant/types/FlexInteger.class */
public class FlexInteger {
    private Integer value;

    public FlexInteger(String str) {
        this.value = Integer.decode(str);
    }

    public int intValue() {
        return this.value.intValue();
    }

    public String toString() {
        return this.value.toString();
    }
}
