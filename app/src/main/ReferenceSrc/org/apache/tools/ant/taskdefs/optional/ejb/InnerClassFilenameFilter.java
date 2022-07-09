package org.apache.tools.ant.taskdefs.optional.ejb;

import java.io.File;
import java.io.FilenameFilter;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/InnerClassFilenameFilter.class */
public class InnerClassFilenameFilter implements FilenameFilter {
    private String baseClassName;

    InnerClassFilenameFilter(String str) {
        int lastIndexOf = str.lastIndexOf(".class");
        this.baseClassName = str.substring(0, lastIndexOf == -1 ? str.length() - 1 : lastIndexOf);
    }

    @Override // java.io.FilenameFilter
    public boolean accept(File file, String str) {
        return str.lastIndexOf(".") == str.lastIndexOf(".class") && str.indexOf(new StringBuffer().append(this.baseClassName).append("$").toString()) == 0;
    }
}
