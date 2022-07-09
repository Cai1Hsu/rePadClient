package org.apache.tools.ant.taskdefs.compilers;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.ClasspathUtils;
import org.apache.tools.ant.util.JavaEnvUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory.class */
public final class CompilerAdapterFactory {
    private static final String MODERN_COMPILER = "com.sun.tools.javac.Main";
    static Class class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapter;
    static Class class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapterFactory;

    private CompilerAdapterFactory() {
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private static boolean doesModernCompilerExist() {
        Class cls;
        boolean z = true;
        try {
            Class.forName(MODERN_COMPILER);
        } catch (ClassNotFoundException e) {
            try {
                if (class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapterFactory == null) {
                    cls = class$("org.apache.tools.ant.taskdefs.compilers.CompilerAdapterFactory");
                    class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapterFactory = cls;
                } else {
                    cls = class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapterFactory;
                }
                ClassLoader classLoader = cls.getClassLoader();
                if (classLoader != null) {
                    classLoader.loadClass(MODERN_COMPILER);
                }
            } catch (ClassNotFoundException e2) {
            }
            z = false;
        }
        return z;
    }

    public static CompilerAdapter getCompiler(String str, Task task) throws BuildException {
        return getCompiler(str, task, null);
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0041, code lost:
        if (r5.equalsIgnoreCase("javac1.2") != false) goto L16;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v36, types: [org.apache.tools.ant.taskdefs.compilers.CompilerAdapter] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static CompilerAdapter getCompiler(String str, Task task, Path path) throws BuildException {
        String str2;
        DefaultCompilerAdapter javac13;
        if (str.equalsIgnoreCase("jikes")) {
            javac13 = new Jikes();
        } else if (str.equalsIgnoreCase("extjavac")) {
            javac13 = new JavacExternal();
        } else {
            if (!str.equalsIgnoreCase("classic") && !str.equalsIgnoreCase("javac1.1")) {
                str2 = str;
            }
            task.log("This version of java does not support the classic compiler; upgrading to modern", 1);
            str2 = "modern";
            if (!str2.equalsIgnoreCase("modern") && !str2.equalsIgnoreCase("javac1.3") && !str2.equalsIgnoreCase("javac1.4") && !str2.equalsIgnoreCase("javac1.5") && !str2.equalsIgnoreCase("javac1.6") && !str2.equalsIgnoreCase("javac1.7")) {
                javac13 = (str2.equalsIgnoreCase("jvc") || str2.equalsIgnoreCase("microsoft")) ? new Jvc() : str2.equalsIgnoreCase("kjc") ? new Kjc() : str2.equalsIgnoreCase("gcj") ? new Gcj() : (str2.equalsIgnoreCase("sj") || str2.equalsIgnoreCase("symantec")) ? new Sj() : resolveClassName(str2, task.getProject().createClassLoader(path));
            } else if (!doesModernCompilerExist()) {
                throw new BuildException(new StringBuffer().append("Unable to find a javac compiler;\ncom.sun.tools.javac.Main is not on the classpath.\nPerhaps JAVA_HOME does not point to the JDK.\nIt is currently set to \"").append(JavaEnvUtils.getJavaHome()).append("\"").toString());
            } else {
                javac13 = new Javac13();
            }
        }
        return javac13;
    }

    private static CompilerAdapter resolveClassName(String str, ClassLoader classLoader) throws BuildException {
        Class cls;
        Class cls2;
        if (classLoader == null) {
            if (class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapterFactory == null) {
                cls = class$("org.apache.tools.ant.taskdefs.compilers.CompilerAdapterFactory");
                class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapterFactory = cls;
            } else {
                cls = class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapterFactory;
            }
            classLoader = cls.getClassLoader();
        }
        if (class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapter == null) {
            cls2 = class$("org.apache.tools.ant.taskdefs.compilers.CompilerAdapter");
            class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapter = cls2;
        } else {
            cls2 = class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapter;
        }
        return (CompilerAdapter) ClasspathUtils.newInstance(str, classLoader, cls2);
    }
}
