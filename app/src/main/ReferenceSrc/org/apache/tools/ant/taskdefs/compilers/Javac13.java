package org.apache.tools.ant.taskdefs.compilers;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/compilers/Javac13.class */
public class Javac13 extends DefaultCompilerAdapter {
    private static final int MODERN_COMPILER_SUCCESS = 0;

    @Override // org.apache.tools.ant.taskdefs.compilers.CompilerAdapter
    public boolean execute() throws BuildException {
        this.attributes.log("Using modern compiler", 3);
        Commandline commandline = setupModernJavacCommand();
        try {
            Class<?> cls = Class.forName("com.sun.tools.javac.Main");
            return ((Integer) cls.getMethod("compile", new String[0].getClass()).invoke(cls.newInstance(), commandline.getArguments())).intValue() == 0;
        } catch (Exception e) {
            if (!(e instanceof BuildException)) {
                throw new BuildException("Error starting modern compiler", e, this.location);
            }
            throw ((BuildException) e);
        }
    }
}
