package org.apache.tools.ant.taskdefs.compilers;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.LogOutputStream;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.JavaEnvUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/compilers/Javac12.class */
public class Javac12 extends DefaultCompilerAdapter {
    protected static final String CLASSIC_COMPILER_CLASSNAME = "sun.tools.javac.Main";
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

    @Override // org.apache.tools.ant.taskdefs.compilers.CompilerAdapter
    public boolean execute() throws BuildException {
        Class<?> cls;
        Class<?> cls2;
        Class<?> cls3;
        this.attributes.log("Using classic compiler", 3);
        Commandline commandline = setupJavacCommand(true);
        LogOutputStream logOutputStream = new LogOutputStream((Task) this.attributes, 1);
        try {
            try {
                Class<?> cls4 = Class.forName(CLASSIC_COMPILER_CLASSNAME);
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
                Object newInstance = cls4.getConstructor(cls, cls2).newInstance(logOutputStream, "javac");
                if (array$Ljava$lang$String == null) {
                    cls3 = class$("[Ljava.lang.String;");
                    array$Ljava$lang$String = cls3;
                } else {
                    cls3 = array$Ljava$lang$String;
                }
                return ((Boolean) cls4.getMethod("compile", cls3).invoke(newInstance, commandline.getArguments())).booleanValue();
            } catch (ClassNotFoundException e) {
                throw new BuildException(new StringBuffer().append("Cannot use classic compiler , as it is not available. \n A common solution is to set the environment variable JAVA_HOME to your jdk directory.\nIt is currently set to \"").append(JavaEnvUtils.getJavaHome()).append("\"").toString(), this.location);
            } catch (Exception e2) {
                if (!(e2 instanceof BuildException)) {
                    throw new BuildException("Error starting classic compiler: ", e2, this.location);
                }
                throw ((BuildException) e2);
            }
        } finally {
            FileUtils.close(logOutputStream);
        }
    }
}
