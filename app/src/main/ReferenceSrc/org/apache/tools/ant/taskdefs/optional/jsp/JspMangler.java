package org.apache.tools.ant.taskdefs.optional.jsp;

import java.io.File;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/jsp/JspMangler.class */
public interface JspMangler {
    String mapJspToJavaName(File file);

    String mapPath(String str);
}
