package org.apache.tools.ant.taskdefs.compilers;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/compilers/Sj.class */
public class Sj extends DefaultCompilerAdapter {
    @Override // org.apache.tools.ant.taskdefs.compilers.CompilerAdapter
    public boolean execute() throws BuildException {
        this.attributes.log("Using symantec java compiler", 3);
        Commandline commandline = setupJavacCommand();
        String executable = getJavac().getExecutable();
        String str = executable;
        if (executable == null) {
            str = "sj";
        }
        commandline.setExecutable(str);
        return executeExternalCompile(commandline.getCommandline(), commandline.size() - this.compileList.length) == 0;
    }

    @Override // org.apache.tools.ant.taskdefs.compilers.DefaultCompilerAdapter
    protected String getNoDebugArgument() {
        return null;
    }
}
