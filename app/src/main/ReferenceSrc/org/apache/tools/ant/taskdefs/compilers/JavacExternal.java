package org.apache.tools.ant.taskdefs.compilers;

import java.io.File;
import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.JavaEnvUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/compilers/JavacExternal.class */
public class JavacExternal extends DefaultCompilerAdapter {
    private boolean execOnVMS(Commandline commandline, int i) {
        boolean z = true;
        File file = null;
        File file2 = null;
        try {
            try {
                File createVmsJavaOptionFile = JavaEnvUtils.createVmsJavaOptionFile(commandline.getArguments());
                file2 = createVmsJavaOptionFile;
                file = createVmsJavaOptionFile;
                if (executeExternalCompile(new String[]{commandline.getExecutable(), MSVSSConstants.FLAG_VERSION, createVmsJavaOptionFile.getPath()}, i, true) != 0) {
                    z = false;
                }
                FileUtils.delete(createVmsJavaOptionFile);
                return z;
            } catch (IOException e) {
                File file3 = file2;
                File file4 = file2;
                throw new BuildException("Failed to create a temporary file for \"-V\" switch");
            }
        } catch (Throwable th) {
            FileUtils.delete(file);
            throw th;
        }
    }

    @Override // org.apache.tools.ant.taskdefs.compilers.CompilerAdapter
    public boolean execute() throws BuildException {
        boolean z = true;
        this.attributes.log("Using external javac compiler", 3);
        Commandline commandline = new Commandline();
        commandline.setExecutable(getJavac().getJavacExecutable());
        if (assumeJava11() || assumeJava12()) {
            setupJavacCommandlineSwitches(commandline, true);
        } else {
            setupModernJavacCommandlineSwitches(commandline);
        }
        int size = assumeJava11() ? -1 : commandline.size();
        logAndAddFilesToCompile(commandline);
        if (Os.isFamily(Os.FAMILY_VMS)) {
            z = execOnVMS(commandline, size);
        } else if (executeExternalCompile(commandline.getCommandline(), size, true) != 0) {
            z = false;
        }
        return z;
    }
}
