package org.apache.tools.ant.taskdefs.compilers;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.optional.ccm.CCMReconfigure;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.Path;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/compilers/Jvc.class */
public class Jvc extends DefaultCompilerAdapter {
    @Override // org.apache.tools.ant.taskdefs.compilers.CompilerAdapter
    public boolean execute() throws BuildException {
        this.attributes.log("Using jvc compiler", 3);
        Path path = new Path(this.project);
        Path bootClassPath = getBootClassPath();
        if (bootClassPath.size() > 0) {
            path.append(bootClassPath);
        }
        if (this.includeJavaRuntime) {
            path.addExtdirs(this.extdirs);
        }
        path.append(getCompileClasspath());
        if (this.compileSourcepath != null) {
            path.append(this.compileSourcepath);
        } else {
            path.append(this.src);
        }
        Commandline commandline = new Commandline();
        String executable = getJavac().getExecutable();
        String str = executable;
        if (executable == null) {
            str = "jvc";
        }
        commandline.setExecutable(str);
        if (this.destDir != null) {
            commandline.createArgument().setValue("/d");
            commandline.createArgument().setFile(this.destDir);
        }
        commandline.createArgument().setValue("/cp:p");
        commandline.createArgument().setPath(path);
        boolean z = true;
        String property = getProject().getProperty("build.compiler.jvc.extensions");
        if (property != null) {
            z = Project.toBoolean(property);
        }
        if (z) {
            commandline.createArgument().setValue("/x-");
            commandline.createArgument().setValue("/nomessage");
        }
        commandline.createArgument().setValue("/nologo");
        if (this.debug) {
            commandline.createArgument().setValue("/g");
        }
        if (this.optimize) {
            commandline.createArgument().setValue("/O");
        }
        if (this.verbose) {
            commandline.createArgument().setValue(CCMReconfigure.FLAG_VERBOSE);
        }
        addCurrentCompilerArgs(commandline);
        int size = commandline.size();
        logAndAddFilesToCompile(commandline);
        boolean z2 = false;
        if (executeExternalCompile(commandline.getCommandline(), size, false) == 0) {
            z2 = true;
        }
        return z2;
    }
}
