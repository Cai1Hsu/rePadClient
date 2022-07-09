package org.apache.tools.ant.taskdefs.optional;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.Map;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.ExecuteStreamHandler;
import org.apache.tools.ant.taskdefs.LogOutputStream;
import org.apache.tools.ant.taskdefs.LogStreamHandler;
import org.apache.tools.ant.taskdefs.PumpStreamHandler;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/Rpm.class */
public class Rpm extends Task {
    private static final String PATH1 = "PATH";
    private static final String PATH2 = "Path";
    private static final String PATH3 = "path";
    private File error;
    private File output;
    private String specFile;
    private File topDir;
    private String command = "-bb";
    private String rpmBuildCommand = null;
    private boolean cleanBuildDir = false;
    private boolean removeSpec = false;
    private boolean removeSource = false;
    private boolean failOnError = false;
    private boolean quiet = false;

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        OutputStream printStream;
        LogStreamHandler pumpStreamHandler;
        Commandline commandline = new Commandline();
        commandline.setExecutable(this.rpmBuildCommand == null ? guessRpmBuildCommand() : this.rpmBuildCommand);
        if (this.topDir != null) {
            commandline.createArgument().setValue("--define");
            commandline.createArgument().setValue(new StringBuffer().append("_topdir ").append(this.topDir).toString());
        }
        commandline.createArgument().setLine(this.command);
        if (this.cleanBuildDir) {
            commandline.createArgument().setValue("--clean");
        }
        if (this.removeSpec) {
            commandline.createArgument().setValue("--rmspec");
        }
        if (this.removeSource) {
            commandline.createArgument().setValue("--rmsource");
        }
        commandline.createArgument().setValue(new StringBuffer().append("SPECS/").append(this.specFile).toString());
        OutputStream outputStream = null;
        OutputStream outputStream2 = null;
        if (this.error == null && this.output == null) {
            pumpStreamHandler = !this.quiet ? new LogStreamHandler((Task) this, 2, 1) : new LogStreamHandler((Task) this, 4, 4);
        } else {
            if (this.output != null) {
                try {
                    printStream = new PrintStream(new BufferedOutputStream(new FileOutputStream(this.output)));
                } catch (IOException e) {
                    throw new BuildException(e, getLocation());
                }
            } else {
                printStream = !this.quiet ? new LogOutputStream((Task) this, 2) : new LogOutputStream((Task) this, 4);
            }
            if (this.error != null) {
                try {
                    outputStream2 = new PrintStream(new BufferedOutputStream(new FileOutputStream(this.error)));
                } catch (IOException e2) {
                    throw new BuildException(e2, getLocation());
                }
            } else {
                outputStream2 = !this.quiet ? new LogOutputStream((Task) this, 1) : new LogOutputStream((Task) this, 4);
            }
            outputStream = printStream;
            pumpStreamHandler = new PumpStreamHandler(printStream, outputStream2);
        }
        Execute execute = getExecute(commandline, pumpStreamHandler);
        try {
            try {
                log(new StringBuffer().append("Building the RPM based on the ").append(this.specFile).append(" file").toString());
                int execute2 = execute.execute();
                if (Execute.isFailure(execute2)) {
                    String stringBuffer = new StringBuffer().append("'").append(commandline.getExecutable()).append("' failed with exit code ").append(execute2).toString();
                    if (this.failOnError) {
                        throw new BuildException(stringBuffer);
                    }
                    log(stringBuffer, 0);
                }
                FileUtils.close(outputStream);
                FileUtils.close(outputStream2);
            } catch (IOException e3) {
                throw new BuildException(e3, getLocation());
            }
        } catch (Throwable th) {
            FileUtils.close(outputStream);
            FileUtils.close(outputStream2);
            throw th;
        }
    }

    protected Execute getExecute(Commandline commandline, ExecuteStreamHandler executeStreamHandler) {
        Execute execute = new Execute(executeStreamHandler, null);
        execute.setAntRun(getProject());
        if (this.topDir == null) {
            this.topDir = getProject().getBaseDir();
        }
        execute.setWorkingDirectory(this.topDir);
        execute.setCommandline(commandline.getCommandline());
        return execute;
    }

    protected String guessRpmBuildCommand() {
        String str;
        Map environmentVariables = Execute.getEnvironmentVariables();
        String str2 = (String) environmentVariables.get(PATH1);
        String str3 = str2;
        if (str2 == null) {
            String str4 = (String) environmentVariables.get(PATH2);
            str3 = str4;
            if (str4 == null) {
                str3 = (String) environmentVariables.get("path");
            }
        }
        if (str3 != null) {
            for (String str5 : new Path(getProject(), str3).list()) {
                File file = new File(str5, new StringBuffer().append("rpmbuild").append(Os.isFamily(Os.FAMILY_DOS) ? ".exe" : "").toString());
                if (file.canRead()) {
                    str = file.getAbsolutePath();
                    break;
                }
            }
        }
        str = "rpm";
        return str;
    }

    public void setCleanBuildDir(boolean z) {
        this.cleanBuildDir = z;
    }

    public void setCommand(String str) {
        this.command = str;
    }

    public void setError(File file) {
        this.error = file;
    }

    public void setFailOnError(boolean z) {
        this.failOnError = z;
    }

    public void setOutput(File file) {
        this.output = file;
    }

    public void setQuiet(boolean z) {
        this.quiet = z;
    }

    public void setRemoveSource(boolean z) {
        this.removeSource = z;
    }

    public void setRemoveSpec(boolean z) {
        this.removeSpec = z;
    }

    public void setRpmBuildCommand(String str) {
        this.rpmBuildCommand = str;
    }

    public void setSpecFile(String str) {
        if (str == null || str.trim().length() == 0) {
            throw new BuildException("You must specify a spec file", getLocation());
        }
        this.specFile = str;
    }

    public void setTopDir(File file) {
        this.topDir = file;
    }
}
