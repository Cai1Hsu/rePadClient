package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Patch.class */
public class Patch extends Task {
    private static final String PATCH = "patch";
    private File directory;
    private File originalFile;
    private boolean havePatchfile = false;
    private Commandline cmd = new Commandline();
    private boolean failOnError = false;

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (!this.havePatchfile) {
            throw new BuildException("patchfile argument is required", getLocation());
        }
        Commandline commandline = (Commandline) this.cmd.clone();
        commandline.setExecutable(PATCH);
        if (this.originalFile != null) {
            commandline.createArgument().setFile(this.originalFile);
        }
        Execute execute = new Execute(new LogStreamHandler((Task) this, 2, 1), null);
        execute.setCommandline(commandline.getCommandline());
        if (this.directory == null) {
            execute.setWorkingDirectory(getProject().getBaseDir());
        } else if (!this.directory.exists() || !this.directory.isDirectory()) {
            if (this.directory.isDirectory()) {
                throw new BuildException(new StringBuffer().append("directory ").append(this.directory).append(" doesn't exist").toString(), getLocation());
            }
            throw new BuildException(new StringBuffer().append(this.directory).append(" is not a directory.").toString(), getLocation());
        } else {
            execute.setWorkingDirectory(this.directory);
        }
        log(commandline.describeCommand(), 3);
        try {
            int execute2 = execute.execute();
            if (!Execute.isFailure(execute2)) {
                return;
            }
            String stringBuffer = new StringBuffer().append("'patch' failed with exit code ").append(execute2).toString();
            if (this.failOnError) {
                throw new BuildException(stringBuffer);
            }
            log(stringBuffer, 0);
        } catch (IOException e) {
            throw new BuildException(e, getLocation());
        }
    }

    public void setBackups(boolean z) {
        if (z) {
            this.cmd.createArgument().setValue("-b");
        }
    }

    public void setDestfile(File file) {
        if (file != null) {
            this.cmd.createArgument().setValue("-o");
            this.cmd.createArgument().setFile(file);
        }
    }

    public void setDir(File file) {
        this.directory = file;
    }

    public void setFailOnError(boolean z) {
        this.failOnError = z;
    }

    public void setIgnorewhitespace(boolean z) {
        if (z) {
            this.cmd.createArgument().setValue("-l");
        }
    }

    public void setOriginalfile(File file) {
        this.originalFile = file;
    }

    public void setPatchfile(File file) {
        if (!file.exists()) {
            throw new BuildException(new StringBuffer().append("patchfile ").append(file).append(" doesn't exist").toString(), getLocation());
        }
        this.cmd.createArgument().setValue("-i");
        this.cmd.createArgument().setFile(file);
        this.havePatchfile = true;
    }

    public void setQuiet(boolean z) {
        if (z) {
            this.cmd.createArgument().setValue("-s");
        }
    }

    public void setReverse(boolean z) {
        if (z) {
            this.cmd.createArgument().setValue(MSVSSConstants.FLAG_RECURSION);
        }
    }

    public void setStrip(int i) throws BuildException {
        if (i < 0) {
            throw new BuildException("strip has to be >= 0", getLocation());
        }
        this.cmd.createArgument().setValue(new StringBuffer().append("-p").append(i).toString());
    }
}
