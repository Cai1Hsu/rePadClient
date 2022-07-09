package org.apache.tools.ant.taskdefs.optional.ccm;

import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.ExecuteStreamHandler;
import org.apache.tools.ant.taskdefs.LogStreamHandler;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ccm/Continuus.class */
public abstract class Continuus extends Task {
    private static final String CCM_EXE = "ccm";
    public static final String COMMAND_CHECKIN = "ci";
    public static final String COMMAND_CHECKOUT = "co";
    public static final String COMMAND_CREATE_TASK = "create_task";
    public static final String COMMAND_DEFAULT_TASK = "default_task";
    public static final String COMMAND_RECONFIGURE = "reconfigure";
    private String ccmDir = "";
    private String ccmAction = "";

    public String getCcmAction() {
        return this.ccmAction;
    }

    protected final String getCcmCommand() {
        String str = this.ccmDir;
        String str2 = str;
        if (!str.equals("")) {
            str2 = str;
            if (!str.endsWith("/")) {
                str2 = new StringBuffer().append(str).append("/").toString();
            }
        }
        return new StringBuffer().append(str2).append(CCM_EXE).toString();
    }

    protected int run(Commandline commandline) {
        return run(commandline, new LogStreamHandler((Task) this, 3, 1));
    }

    protected int run(Commandline commandline, ExecuteStreamHandler executeStreamHandler) {
        try {
            Execute execute = new Execute(executeStreamHandler);
            execute.setAntRun(getProject());
            execute.setWorkingDirectory(getProject().getBaseDir());
            execute.setCommandline(commandline.getCommandline());
            return execute.execute();
        } catch (IOException e) {
            throw new BuildException(e, getLocation());
        }
    }

    public void setCcmAction(String str) {
        this.ccmAction = str;
    }

    public final void setCcmDir(String str) {
        this.ccmDir = FileUtils.translatePath(str);
    }
}
