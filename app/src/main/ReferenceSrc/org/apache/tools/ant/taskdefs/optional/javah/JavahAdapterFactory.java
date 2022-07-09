package org.apache.tools.ant.taskdefs.optional.javah;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.ClasspathUtils;
import org.apache.tools.ant.util.JavaEnvUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/javah/JavahAdapterFactory.class */
public class JavahAdapterFactory {
    static Class class$org$apache$tools$ant$taskdefs$optional$javah$JavahAdapter;
    static Class class$org$apache$tools$ant$taskdefs$optional$javah$JavahAdapterFactory;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public static JavahAdapter getAdapter(String str, ProjectComponent projectComponent) throws BuildException {
        return getAdapter(str, projectComponent, null);
    }

    public static JavahAdapter getAdapter(String str, ProjectComponent projectComponent, Path path) throws BuildException {
        return ((!JavaEnvUtils.isKaffe() || str != null) && !Kaffeh.IMPLEMENTATION_NAME.equals(str)) ? ((!JavaEnvUtils.isGij() || str != null) && !Gcjh.IMPLEMENTATION_NAME.equals(str)) ? "sun".equals(str) ? new SunJavah() : str != null ? resolveClassName(str, projectComponent.getProject().createClassLoader(path)) : new SunJavah() : new Gcjh() : new Kaffeh();
    }

    public static String getDefault() {
        return JavaEnvUtils.isKaffe() ? Kaffeh.IMPLEMENTATION_NAME : JavaEnvUtils.isGij() ? Gcjh.IMPLEMENTATION_NAME : "sun";
    }

    private static JavahAdapter resolveClassName(String str, ClassLoader classLoader) throws BuildException {
        Class cls;
        Class cls2;
        if (classLoader == null) {
            if (class$org$apache$tools$ant$taskdefs$optional$javah$JavahAdapterFactory == null) {
                cls = class$("org.apache.tools.ant.taskdefs.optional.javah.JavahAdapterFactory");
                class$org$apache$tools$ant$taskdefs$optional$javah$JavahAdapterFactory = cls;
            } else {
                cls = class$org$apache$tools$ant$taskdefs$optional$javah$JavahAdapterFactory;
            }
            classLoader = cls.getClassLoader();
        }
        if (class$org$apache$tools$ant$taskdefs$optional$javah$JavahAdapter == null) {
            cls2 = class$("org.apache.tools.ant.taskdefs.optional.javah.JavahAdapter");
            class$org$apache$tools$ant$taskdefs$optional$javah$JavahAdapter = cls2;
        } else {
            cls2 = class$org$apache$tools$ant$taskdefs$optional$javah$JavahAdapter;
        }
        return (JavahAdapter) ClasspathUtils.newInstance(str, classLoader, cls2);
    }
}
