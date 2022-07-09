package org.apache.tools.ant.taskdefs.optional.native2ascii;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.taskdefs.ExecuteJava;
import org.apache.tools.ant.taskdefs.optional.Native2Ascii;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/native2ascii/KaffeNative2Ascii.class */
public final class KaffeNative2Ascii extends DefaultNative2Ascii {
    public static final String IMPLEMENTATION_NAME = "kaffe";
    private static final String[] N2A_CLASSNAMES = {"gnu.classpath.tools.native2ascii.Native2Ascii", "kaffe.tools.native2ascii.Native2Ascii"};

    private static Class getN2aClass() {
        Class<?> cls;
        int i = 0;
        while (true) {
            if (i >= N2A_CLASSNAMES.length) {
                cls = null;
                break;
            }
            try {
                cls = Class.forName(N2A_CLASSNAMES[i]);
                break;
            } catch (ClassNotFoundException e) {
                i++;
            }
        }
        return cls;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.native2ascii.DefaultNative2Ascii
    protected boolean run(Commandline commandline, ProjectComponent projectComponent) throws BuildException {
        ExecuteJava executeJava = new ExecuteJava();
        Class n2aClass = getN2aClass();
        if (n2aClass == null) {
            throw new BuildException("Couldn't load Kaffe's Native2Ascii class");
        }
        commandline.setExecutable(n2aClass.getName());
        executeJava.setJavaCommand(commandline);
        executeJava.execute(projectComponent.getProject());
        return true;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.native2ascii.DefaultNative2Ascii
    protected void setup(Commandline commandline, Native2Ascii native2Ascii) throws BuildException {
        if (native2Ascii.getReverse()) {
            throw new BuildException("-reverse is not supported by Kaffe");
        }
        super.setup(commandline, native2Ascii);
    }
}
