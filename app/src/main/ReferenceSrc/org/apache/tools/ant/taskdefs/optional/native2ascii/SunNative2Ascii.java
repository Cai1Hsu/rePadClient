package org.apache.tools.ant.taskdefs.optional.native2ascii;

import java.lang.reflect.Method;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.taskdefs.optional.Native2Ascii;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/native2ascii/SunNative2Ascii.class */
public final class SunNative2Ascii extends DefaultNative2Ascii {
    public static final String IMPLEMENTATION_NAME = "sun";
    static Class array$Ljava$lang$String;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.optional.native2ascii.DefaultNative2Ascii
    protected boolean run(Commandline commandline, ProjectComponent projectComponent) throws BuildException {
        Class<?> cls;
        try {
            Class<?> cls2 = Class.forName("sun.tools.native2ascii.Main");
            if (array$Ljava$lang$String == null) {
                cls = class$("[Ljava.lang.String;");
                array$Ljava$lang$String = cls;
            } else {
                cls = array$Ljava$lang$String;
            }
            Method method = cls2.getMethod("convert", cls);
            if (method != null) {
                return ((Boolean) method.invoke(cls2.newInstance(), commandline.getArguments())).booleanValue();
            }
            throw new BuildException("Could not find convert() method in sun.tools.native2ascii.Main");
        } catch (BuildException e) {
            throw e;
        } catch (Exception e2) {
            throw new BuildException("Error starting Sun's native2ascii: ", e2);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.optional.native2ascii.DefaultNative2Ascii
    protected void setup(Commandline commandline, Native2Ascii native2Ascii) throws BuildException {
        if (native2Ascii.getReverse()) {
            commandline.createArgument().setValue("-reverse");
        }
        super.setup(commandline, native2Ascii);
    }
}
