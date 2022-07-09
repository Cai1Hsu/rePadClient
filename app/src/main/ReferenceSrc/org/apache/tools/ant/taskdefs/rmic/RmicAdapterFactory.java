package org.apache.tools.ant.taskdefs.rmic;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.ClasspathUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/rmic/RmicAdapterFactory.class */
public final class RmicAdapterFactory {
    public static final String DEFAULT_COMPILER = "default";
    public static final String ERROR_NOT_RMIC_ADAPTER = "Class of unexpected Type: ";
    public static final String ERROR_UNKNOWN_COMPILER = "Class not found: ";
    static Class class$org$apache$tools$ant$taskdefs$rmic$RmicAdapter;
    static Class class$org$apache$tools$ant$taskdefs$rmic$RmicAdapterFactory;

    private RmicAdapterFactory() {
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public static RmicAdapter getRmic(String str, Task task) throws BuildException {
        return getRmic(str, task, null);
    }

    /* JADX WARN: Code restructure failed: missing block: B:5:0x000f, code lost:
        if (r4.length() == 0) goto L6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static RmicAdapter getRmic(String str, Task task, Path path) throws BuildException {
        String str2;
        if (!"default".equalsIgnoreCase(str)) {
            str2 = str;
        }
        str2 = KaffeRmic.isAvailable() ? "kaffe" : "sun";
        return "sun".equalsIgnoreCase(str2) ? new SunRmic() : "kaffe".equalsIgnoreCase(str2) ? new KaffeRmic() : WLRmic.COMPILER_NAME.equalsIgnoreCase(str2) ? new WLRmic() : ForkingSunRmic.COMPILER_NAME.equalsIgnoreCase(str2) ? new ForkingSunRmic() : XNewRmic.COMPILER_NAME.equalsIgnoreCase(str2) ? new XNewRmic() : resolveClassName(str2, task.getProject().createClassLoader(path));
    }

    private static RmicAdapter resolveClassName(String str, ClassLoader classLoader) throws BuildException {
        Class cls;
        Class cls2;
        if (classLoader == null) {
            if (class$org$apache$tools$ant$taskdefs$rmic$RmicAdapterFactory == null) {
                cls = class$("org.apache.tools.ant.taskdefs.rmic.RmicAdapterFactory");
                class$org$apache$tools$ant$taskdefs$rmic$RmicAdapterFactory = cls;
            } else {
                cls = class$org$apache$tools$ant$taskdefs$rmic$RmicAdapterFactory;
            }
            classLoader = cls.getClassLoader();
        }
        if (class$org$apache$tools$ant$taskdefs$rmic$RmicAdapter == null) {
            cls2 = class$("org.apache.tools.ant.taskdefs.rmic.RmicAdapter");
            class$org$apache$tools$ant$taskdefs$rmic$RmicAdapter = cls2;
        } else {
            cls2 = class$org$apache$tools$ant$taskdefs$rmic$RmicAdapter;
        }
        return (RmicAdapter) ClasspathUtils.newInstance(str, classLoader, cls2);
    }
}
