package org.apache.tools.ant.taskdefs.compilers;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.Path;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/compilers/Gcj.class */
public class Gcj extends DefaultCompilerAdapter {
    private static final String[] CONFLICT_WITH_DASH_C = {"-o", "--main=", MSVSSConstants.FLAG_CODEDIFF, "-fjni", MSVSSConstants.FLAG_LABEL};

    @Override // org.apache.tools.ant.taskdefs.compilers.CompilerAdapter
    public boolean execute() throws BuildException {
        this.attributes.log("Using gcj compiler", 3);
        Commandline commandline = setupGCJCommand();
        int size = commandline.size();
        logAndAddFilesToCompile(commandline);
        return executeExternalCompile(commandline.getCommandline(), size) == 0;
    }

    public boolean isNativeBuild() {
        boolean z = false;
        String[] currentCompilerArgs = getJavac().getCurrentCompilerArgs();
        for (int i = 0; !z && i < currentCompilerArgs.length; i++) {
            for (int i2 = 0; !z && i2 < CONFLICT_WITH_DASH_C.length; i2++) {
                z = currentCompilerArgs[i].startsWith(CONFLICT_WITH_DASH_C[i2]);
            }
        }
        return z;
    }

    protected Commandline setupGCJCommand() {
        Commandline commandline = new Commandline();
        Path path = new Path(this.project);
        Path bootClassPath = getBootClassPath();
        if (bootClassPath.size() > 0) {
            path.append(bootClassPath);
        }
        if (this.extdirs != null || this.includeJavaRuntime) {
            path.addExtdirs(this.extdirs);
        }
        path.append(getCompileClasspath());
        if (this.compileSourcepath != null) {
            path.append(this.compileSourcepath);
        } else {
            path.append(this.src);
        }
        String executable = getJavac().getExecutable();
        String str = executable;
        if (executable == null) {
            str = "gcj";
        }
        commandline.setExecutable(str);
        if (this.destDir != null) {
            commandline.createArgument().setValue("-d");
            commandline.createArgument().setFile(this.destDir);
            if (!this.destDir.exists() && !this.destDir.mkdirs()) {
                throw new BuildException("Can't make output directories. Maybe permission is wrong. ");
            }
        }
        commandline.createArgument().setValue("-classpath");
        commandline.createArgument().setPath(path);
        if (this.encoding != null) {
            commandline.createArgument().setValue(new StringBuffer().append("--encoding=").append(this.encoding).toString());
        }
        if (this.debug) {
            commandline.createArgument().setValue("-g1");
        }
        if (this.optimize) {
            commandline.createArgument().setValue(MSVSSConstants.FLAG_OUTPUT);
        }
        if (!isNativeBuild()) {
            commandline.createArgument().setValue(MSVSSConstants.FLAG_COMMENT);
        }
        if (this.attributes.getSource() != null) {
            commandline.createArgument().setValue(new StringBuffer().append("-fsource=").append(this.attributes.getSource()).toString());
        }
        if (this.attributes.getTarget() != null) {
            commandline.createArgument().setValue(new StringBuffer().append("-ftarget=").append(this.attributes.getTarget()).toString());
        }
        addCurrentCompilerArgs(commandline);
        return commandline;
    }
}
