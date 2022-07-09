package org.apache.tools.ant.taskdefs.optional.depend;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/ClassFileUtils.class */
public class ClassFileUtils {
    public static String convertDotName(String str) {
        return str.replace('.', '/');
    }

    public static String convertSlashName(String str) {
        return str.replace('\\', '.').replace('/', '.');
    }
}
