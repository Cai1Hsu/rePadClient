package org.apache.tools.ant.taskdefs.compilers;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.ExecuteJava;
import org.apache.tools.ant.taskdefs.optional.sos.SOSCmd;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.Path;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/compilers/Kjc.class */
public class Kjc extends DefaultCompilerAdapter {
    @Override // org.apache.tools.ant.taskdefs.compilers.CompilerAdapter
    public boolean execute() throws BuildException {
        this.attributes.log("Using kjc compiler", 3);
        Commandline commandline = setupKjcCommand();
        commandline.setExecutable("at.dms.kjc.Main");
        ExecuteJava executeJava = new ExecuteJava();
        executeJava.setJavaCommand(commandline);
        return executeJava.fork(getJavac()) == 0;
    }

    protected Commandline setupKjcCommand() {
        Commandline commandline = new Commandline();
        Path compileClasspath = getCompileClasspath();
        if (this.deprecation) {
            commandline.createArgument().setValue("-deprecation");
        }
        if (this.destDir != null) {
            commandline.createArgument().setValue("-d");
            commandline.createArgument().setFile(this.destDir);
        }
        commandline.createArgument().setValue("-classpath");
        Path path = new Path(this.project);
        Path bootClassPath = getBootClassPath();
        if (bootClassPath.size() > 0) {
            path.append(bootClassPath);
        }
        if (this.extdirs != null) {
            path.addExtdirs(this.extdirs);
        }
        path.append(compileClasspath);
        if (this.compileSourcepath != null) {
            path.append(this.compileSourcepath);
        } else {
            path.append(this.src);
        }
        commandline.createArgument().setPath(path);
        if (this.encoding != null) {
            commandline.createArgument().setValue("-encoding");
            commandline.createArgument().setValue(this.encoding);
        }
        if (this.debug) {
            commandline.createArgument().setValue("-g");
        }
        if (this.optimize) {
            commandline.createArgument().setValue("-O2");
        }
        if (this.verbose) {
            commandline.createArgument().setValue(SOSCmd.FLAG_VERBOSE);
        }
        addCurrentCompilerArgs(commandline);
        logAndAddFilesToCompile(commandline);
        return commandline;
    }
}
