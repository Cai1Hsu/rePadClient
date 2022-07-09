package org.apache.tools.ant.taskdefs.optional.sos;

import java.io.File;
import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.LogStreamHandler;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/sos/SOS.class */
public abstract class SOS extends Task implements SOSCmd {
    private static final int ERROR_EXIT_STATUS = 255;
    protected Commandline commandLine;
    private String sosCmdDir = null;
    private String sosUsername = null;
    private String sosPassword = "";
    private String projectPath = null;
    private String vssServerPath = null;
    private String sosServerPath = null;
    private String sosHome = null;
    private String localPath = null;
    private String version = null;
    private String label = null;
    private String comment = null;
    private String filename = null;
    private boolean noCompress = false;
    private boolean noCache = false;
    private boolean recursive = false;
    private boolean verbose = false;

    abstract Commandline buildCmdLine();

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        buildCmdLine();
        if (run(this.commandLine) == 255) {
            throw new BuildException(new StringBuffer().append("Failed executing: ").append(this.commandLine.toString()).toString(), getLocation());
        }
    }

    protected String getComment() {
        return this.comment;
    }

    protected String getFilename() {
        return this.filename;
    }

    protected String getLabel() {
        return this.label;
    }

    protected String getLocalPath() {
        String absolutePath;
        if (this.localPath == null) {
            absolutePath = getProject().getBaseDir().getAbsolutePath();
        } else {
            File resolveFile = getProject().resolveFile(this.localPath);
            if (!resolveFile.exists()) {
                if (!resolveFile.mkdirs()) {
                    throw new BuildException(new StringBuffer().append("Directory ").append(this.localPath).append(" creation was not ").append("successful for an unknown reason").toString(), getLocation());
                }
                getProject().log(new StringBuffer().append("Created dir: ").append(resolveFile.getAbsolutePath()).toString());
            }
            absolutePath = resolveFile.getAbsolutePath();
        }
        return absolutePath;
    }

    protected String getNoCache() {
        return this.noCache ? SOSCmd.FLAG_NO_CACHE : "";
    }

    protected String getNoCompress() {
        return this.noCompress ? SOSCmd.FLAG_NO_COMPRESSION : "";
    }

    protected void getOptionalAttributes() {
        this.commandLine.createArgument().setValue(getVerbose());
        this.commandLine.createArgument().setValue(getNoCompress());
        if (getSosHome() == null) {
            this.commandLine.createArgument().setValue(getNoCache());
        } else {
            this.commandLine.createArgument().setValue(SOSCmd.FLAG_SOS_HOME);
            this.commandLine.createArgument().setValue(getSosHome());
        }
        if (getLocalPath() != null) {
            this.commandLine.createArgument().setValue(SOSCmd.FLAG_WORKING_DIR);
            this.commandLine.createArgument().setValue(getLocalPath());
        }
    }

    protected String getPassword() {
        return this.sosPassword;
    }

    protected String getProjectPath() {
        return this.projectPath;
    }

    protected String getRecursive() {
        return this.recursive ? SOSCmd.FLAG_RECURSION : "";
    }

    protected void getRequiredAttributes() {
        this.commandLine.setExecutable(getSosCommand());
        if (getSosServerPath() == null) {
            throw new BuildException("sosserverpath attribute must be set!", getLocation());
        }
        this.commandLine.createArgument().setValue(SOSCmd.FLAG_SOS_SERVER);
        this.commandLine.createArgument().setValue(getSosServerPath());
        if (getUsername() == null) {
            throw new BuildException("username attribute must be set!", getLocation());
        }
        this.commandLine.createArgument().setValue(SOSCmd.FLAG_USERNAME);
        this.commandLine.createArgument().setValue(getUsername());
        this.commandLine.createArgument().setValue(SOSCmd.FLAG_PASSWORD);
        this.commandLine.createArgument().setValue(getPassword());
        if (getVssServerPath() == null) {
            throw new BuildException("vssserverpath attribute must be set!", getLocation());
        }
        this.commandLine.createArgument().setValue(SOSCmd.FLAG_VSS_SERVER);
        this.commandLine.createArgument().setValue(getVssServerPath());
        if (getProjectPath() == null) {
            throw new BuildException("projectpath attribute must be set!", getLocation());
        }
        this.commandLine.createArgument().setValue(SOSCmd.FLAG_PROJECT);
        this.commandLine.createArgument().setValue(getProjectPath());
    }

    protected String getSosCommand() {
        return this.sosCmdDir == null ? SOSCmd.COMMAND_SOS_EXE : new StringBuffer().append(this.sosCmdDir).append(File.separator).append(SOSCmd.COMMAND_SOS_EXE).toString();
    }

    protected String getSosHome() {
        return this.sosHome;
    }

    protected String getSosServerPath() {
        return this.sosServerPath;
    }

    protected String getUsername() {
        return this.sosUsername;
    }

    protected String getVerbose() {
        return this.verbose ? SOSCmd.FLAG_VERBOSE : "";
    }

    protected String getVersion() {
        return this.version;
    }

    protected String getVssServerPath() {
        return this.vssServerPath;
    }

    protected int run(Commandline commandline) {
        try {
            Execute execute = new Execute(new LogStreamHandler((Task) this, 2, 1));
            execute.setAntRun(getProject());
            execute.setWorkingDirectory(getProject().getBaseDir());
            execute.setCommandline(commandline.getCommandline());
            execute.setVMLauncher(false);
            return execute.execute();
        } catch (IOException e) {
            throw new BuildException(e, getLocation());
        }
    }

    protected void setInternalComment(String str) {
        this.comment = str;
    }

    protected void setInternalFilename(String str) {
        this.filename = str;
    }

    protected void setInternalLabel(String str) {
        this.label = str;
    }

    protected void setInternalRecursive(boolean z) {
        this.recursive = z;
    }

    protected void setInternalVersion(String str) {
        this.version = str;
    }

    public final void setLocalPath(Path path) {
        this.localPath = path.toString();
    }

    public final void setNoCache(boolean z) {
        this.noCache = z;
    }

    public final void setNoCompress(boolean z) {
        this.noCompress = z;
    }

    public final void setPassword(String str) {
        this.sosPassword = str;
    }

    public final void setProjectPath(String str) {
        if (str.startsWith("$")) {
            this.projectPath = str;
        } else {
            this.projectPath = new StringBuffer().append("$").append(str).toString();
        }
    }

    public final void setSosCmd(String str) {
        this.sosCmdDir = FileUtils.translatePath(str);
    }

    public final void setSosHome(String str) {
        this.sosHome = str;
    }

    public final void setSosServerPath(String str) {
        this.sosServerPath = str;
    }

    public final void setUsername(String str) {
        this.sosUsername = str;
    }

    public void setVerbose(boolean z) {
        this.verbose = z;
    }

    public final void setVssServerPath(String str) {
        this.vssServerPath = str;
    }
}
