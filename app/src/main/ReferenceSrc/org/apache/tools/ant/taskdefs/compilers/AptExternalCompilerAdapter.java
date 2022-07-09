package org.apache.tools.ant.taskdefs.compilers;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Apt;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/compilers/AptExternalCompilerAdapter.class */
public class AptExternalCompilerAdapter extends DefaultCompilerAdapter {
    @Override // org.apache.tools.ant.taskdefs.compilers.CompilerAdapter
    public boolean execute() throws BuildException {
        boolean z = true;
        this.attributes.log("Using external apt compiler", 3);
        Apt apt = getApt();
        Commandline commandline = new Commandline();
        commandline.setExecutable(apt.getAptExecutable());
        setupModernJavacCommandlineSwitches(commandline);
        AptCompilerAdapter.setAptCommandlineSwitches(apt, commandline);
        int size = commandline.size();
        logAndAddFilesToCompile(commandline);
        if (executeExternalCompile(commandline.getCommandline(), size, true) != 0) {
            z = false;
        }
        return z;
    }

    protected Apt getApt() {
        return (Apt) getJavac();
    }
}
