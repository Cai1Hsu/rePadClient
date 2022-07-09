package org.apache.tools.ant.taskdefs.optional.ccm;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.ExecuteStreamHandler;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ccm/CCMCreateTask.class */
public class CCMCreateTask extends Continuus implements ExecuteStreamHandler {
    public static final String FLAG_COMMENT = "/synopsis";
    public static final String FLAG_PLATFORM = "/plat";
    public static final String FLAG_RELEASE = "/release";
    public static final String FLAG_RESOLVER = "/resolver";
    public static final String FLAG_SUBSYSTEM = "/subsystem";
    public static final String FLAG_TASK = "/task";
    private String comment = null;
    private String platform = null;
    private String resolver = null;
    private String release = null;
    private String subSystem = null;
    private String task = null;

    public CCMCreateTask() {
        setCcmAction(Continuus.COMMAND_CREATE_TASK);
    }

    private void checkOptions(Commandline commandline) {
        if (getComment() != null) {
            commandline.createArgument().setValue(FLAG_COMMENT);
            commandline.createArgument().setValue(new StringBuffer().append("\"").append(getComment()).append("\"").toString());
        }
        if (getPlatform() != null) {
            commandline.createArgument().setValue(FLAG_PLATFORM);
            commandline.createArgument().setValue(getPlatform());
        }
        if (getResolver() != null) {
            commandline.createArgument().setValue(FLAG_RESOLVER);
            commandline.createArgument().setValue(getResolver());
        }
        if (getSubSystem() != null) {
            commandline.createArgument().setValue(FLAG_SUBSYSTEM);
            commandline.createArgument().setValue(new StringBuffer().append("\"").append(getSubSystem()).append("\"").toString());
        }
        if (getRelease() != null) {
            commandline.createArgument().setValue(FLAG_RELEASE);
            commandline.createArgument().setValue(getRelease());
        }
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Commandline commandline = new Commandline();
        commandline.setExecutable(getCcmCommand());
        commandline.createArgument().setValue(getCcmAction());
        checkOptions(commandline);
        if (Execute.isFailure(run(commandline, this))) {
            throw new BuildException(new StringBuffer().append("Failed executing: ").append(commandline.toString()).toString(), getLocation());
        }
        Commandline commandline2 = new Commandline();
        commandline2.setExecutable(getCcmCommand());
        commandline2.createArgument().setValue(Continuus.COMMAND_DEFAULT_TASK);
        commandline2.createArgument().setValue(getTask());
        log(commandline.describeCommand(), 4);
        if (run(commandline2) == 0) {
            return;
        }
        throw new BuildException(new StringBuffer().append("Failed executing: ").append(commandline2.toString()).toString(), getLocation());
    }

    public String getComment() {
        return this.comment;
    }

    public String getPlatform() {
        return this.platform;
    }

    public String getRelease() {
        return this.release;
    }

    public String getResolver() {
        return this.resolver;
    }

    public String getSubSystem() {
        return this.subSystem;
    }

    public String getTask() {
        return this.task;
    }

    public void setComment(String str) {
        this.comment = str;
    }

    public void setPlatform(String str) {
        this.platform = str;
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void setProcessErrorStream(InputStream inputStream) throws IOException {
        String readLine = new BufferedReader(new InputStreamReader(inputStream)).readLine();
        if (readLine != null) {
            log(new StringBuffer().append("err ").append(readLine).toString(), 4);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void setProcessInputStream(OutputStream outputStream) throws IOException {
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void setProcessOutputStream(InputStream inputStream) throws IOException {
        try {
            String readLine = new BufferedReader(new InputStreamReader(inputStream)).readLine();
            if (readLine == null) {
                return;
            }
            log(new StringBuffer().append("buffer:").append(readLine).toString(), 4);
            String trim = readLine.substring(readLine.indexOf(32)).trim();
            setTask(trim.substring(0, trim.lastIndexOf(32)).trim());
            log(new StringBuffer().append("task is ").append(getTask()).toString(), 4);
        } catch (NullPointerException e) {
            log("error procession stream , null pointer exception", 0);
            e.printStackTrace();
            throw new BuildException(e.getClass().getName());
        } catch (Exception e2) {
            log(new StringBuffer().append("error procession stream ").append(e2.getMessage()).toString(), 0);
            throw new BuildException(e2.getMessage());
        }
    }

    public void setRelease(String str) {
        this.release = str;
    }

    public void setResolver(String str) {
        this.resolver = str;
    }

    public void setSubSystem(String str) {
        this.subSystem = str;
    }

    public void setTask(String str) {
        this.task = str;
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void start() throws IOException {
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void stop() {
    }
}
