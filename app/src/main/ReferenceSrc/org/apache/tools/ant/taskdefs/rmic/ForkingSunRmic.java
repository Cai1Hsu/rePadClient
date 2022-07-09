package org.apache.tools.ant.taskdefs.rmic;

import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.LogStreamHandler;
import org.apache.tools.ant.taskdefs.Rmic;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.util.JavaEnvUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/rmic/ForkingSunRmic.class */
public class ForkingSunRmic extends DefaultRmicAdapter {
    public static final String COMPILER_NAME = "forking";

    @Override // org.apache.tools.ant.taskdefs.rmic.RmicAdapter
    public boolean execute() throws BuildException {
        boolean z = true;
        Rmic rmic = getRmic();
        Commandline commandline = setupRmicCommand();
        Project project = rmic.getProject();
        String executable = rmic.getExecutable();
        String str = executable;
        if (executable == null) {
            str = JavaEnvUtils.getJdkExecutable(getExecutableName());
        }
        commandline.setExecutable(str);
        String[] commandline2 = commandline.getCommandline();
        try {
            Execute execute = new Execute(new LogStreamHandler((Task) rmic, 2, 1));
            execute.setAntRun(project);
            execute.setWorkingDirectory(project.getBaseDir());
            execute.setCommandline(commandline2);
            execute.execute();
            if (execute.isFailure()) {
                z = false;
            }
            return z;
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("Error running ").append(getExecutableName()).append(" -maybe it is not on the path").toString(), e);
        }
    }

    protected String getExecutableName() {
        return SunRmic.RMIC_EXECUTABLE;
    }
}
