package org.apache.tools.ant.taskdefs.optional.native2ascii;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.ClasspathUtils;
import org.apache.tools.ant.util.JavaEnvUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapterFactory.class */
public class Native2AsciiAdapterFactory {
    static Class class$org$apache$tools$ant$taskdefs$optional$native2ascii$Native2AsciiAdapter;
    static Class class$org$apache$tools$ant$taskdefs$optional$native2ascii$Native2AsciiAdapterFactory;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public static Native2AsciiAdapter getAdapter(String str, ProjectComponent projectComponent) throws BuildException {
        return getAdapter(str, projectComponent, null);
    }

    public static Native2AsciiAdapter getAdapter(String str, ProjectComponent projectComponent, Path path) throws BuildException {
        return ((!JavaEnvUtils.isKaffe() || str != null) && !"kaffe".equals(str)) ? "sun".equals(str) ? new SunNative2Ascii() : str != null ? resolveClassName(str, projectComponent.getProject().createClassLoader(path)) : new SunNative2Ascii() : new KaffeNative2Ascii();
    }

    public static String getDefault() {
        return JavaEnvUtils.isKaffe() ? "kaffe" : "sun";
    }

    private static Native2AsciiAdapter resolveClassName(String str, ClassLoader classLoader) throws BuildException {
        Class cls;
        Class cls2;
        if (classLoader == null) {
            if (class$org$apache$tools$ant$taskdefs$optional$native2ascii$Native2AsciiAdapterFactory == null) {
                cls = class$("org.apache.tools.ant.taskdefs.optional.native2ascii.Native2AsciiAdapterFactory");
                class$org$apache$tools$ant$taskdefs$optional$native2ascii$Native2AsciiAdapterFactory = cls;
            } else {
                cls = class$org$apache$tools$ant$taskdefs$optional$native2ascii$Native2AsciiAdapterFactory;
            }
            classLoader = cls.getClassLoader();
        }
        if (class$org$apache$tools$ant$taskdefs$optional$native2ascii$Native2AsciiAdapter == null) {
            cls2 = class$("org.apache.tools.ant.taskdefs.optional.native2ascii.Native2AsciiAdapter");
            class$org$apache$tools$ant$taskdefs$optional$native2ascii$Native2AsciiAdapter = cls2;
        } else {
            cls2 = class$org$apache$tools$ant$taskdefs$optional$native2ascii$Native2AsciiAdapter;
        }
        return (Native2AsciiAdapter) ClasspathUtils.newInstance(str, classLoader, cls2);
    }
}
