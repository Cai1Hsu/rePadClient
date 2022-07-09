package org.apache.tools.ant.util.facade;

import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/util/facade/ImplementationSpecificArgument.class */
public class ImplementationSpecificArgument extends Commandline.Argument {
    private String impl;

    public final String[] getParts(String str) {
        return (this.impl == null || this.impl.equals(str)) ? super.getParts() : new String[0];
    }

    public void setImplementation(String str) {
        this.impl = str;
    }
}
