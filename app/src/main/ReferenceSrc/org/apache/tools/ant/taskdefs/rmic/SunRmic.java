package org.apache.tools.ant.taskdefs.rmic;

import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.LogOutputStream;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/rmic/SunRmic.class */
public class SunRmic extends DefaultRmicAdapter {
    public static final String COMPILER_NAME = "sun";
    public static final String ERROR_NO_RMIC_ON_CLASSPATH = "Cannot use SUN rmic, as it is not available.  A common solution is to set the environment variable JAVA_HOME";
    public static final String ERROR_RMIC_FAILED = "Error starting SUN rmic: ";
    public static final String RMIC_CLASSNAME = "sun.rmi.rmic.Main";
    public static final String RMIC_EXECUTABLE = "rmic";
    static Class array$Ljava$lang$String;
    static Class class$java$io$OutputStream;
    static Class class$java$lang$String;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    /* JADX DEBUG: Finally have unexpected throw blocks count: 2, expect 1 */
    @Override // org.apache.tools.ant.taskdefs.rmic.RmicAdapter
    public boolean execute() throws BuildException {
        Class<?> cls;
        Class<?> cls2;
        Class<?> cls3;
        getRmic().log("Using SUN rmic compiler", 3);
        Commandline commandline = setupRmicCommand();
        LogOutputStream logOutputStream = new LogOutputStream((Task) getRmic(), 1);
        try {
            try {
                Class<?> cls4 = Class.forName(RMIC_CLASSNAME);
                if (class$java$io$OutputStream == null) {
                    cls = class$("java.io.OutputStream");
                    class$java$io$OutputStream = cls;
                } else {
                    cls = class$java$io$OutputStream;
                }
                if (class$java$lang$String == null) {
                    cls2 = class$("java.lang.String");
                    class$java$lang$String = cls2;
                } else {
                    cls2 = class$java$lang$String;
                }
                Object newInstance = cls4.getConstructor(cls, cls2).newInstance(logOutputStream, RMIC_EXECUTABLE);
                if (array$Ljava$lang$String == null) {
                    cls3 = class$("[Ljava.lang.String;");
                    array$Ljava$lang$String = cls3;
                } else {
                    cls3 = array$Ljava$lang$String;
                }
                boolean booleanValue = ((Boolean) cls4.getMethod("compile", cls3).invoke(newInstance, commandline.getArguments())).booleanValue();
                try {
                    logOutputStream.close();
                    return booleanValue;
                } catch (IOException e) {
                    throw new BuildException(e);
                }
            } catch (Throwable th) {
                try {
                    logOutputStream.close();
                    throw th;
                } catch (IOException e2) {
                    throw new BuildException(e2);
                }
            }
        } catch (ClassNotFoundException e3) {
            throw new BuildException(ERROR_NO_RMIC_ON_CLASSPATH, getRmic().getLocation());
        } catch (Exception e4) {
            if (!(e4 instanceof BuildException)) {
                throw new BuildException(ERROR_RMIC_FAILED, e4, getRmic().getLocation());
            }
            throw ((BuildException) e4);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.rmic.DefaultRmicAdapter
    protected String[] preprocessCompilerArgs(String[] strArr) {
        return filterJvmCompilerArgs(strArr);
    }
}
