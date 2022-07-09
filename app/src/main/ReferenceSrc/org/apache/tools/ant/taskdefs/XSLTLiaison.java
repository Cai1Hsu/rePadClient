package org.apache.tools.ant.taskdefs;

import java.io.File;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/XSLTLiaison.class */
public interface XSLTLiaison {
    public static final String FILE_PROTOCOL_PREFIX = "file://";

    void addParam(String str, String str2) throws Exception;

    void setStylesheet(File file) throws Exception;

    void transform(File file, File file2) throws Exception;
}
