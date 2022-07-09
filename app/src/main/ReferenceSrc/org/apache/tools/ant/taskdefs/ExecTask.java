package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.util.Locale;
import java.util.Map;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.Environment;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.RedirectorElement;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/ExecTask.class */
public class ExecTask extends Task {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private File dir;
    private File error;
    private String executable;
    private File input;
    private String inputString;
    private String os;
    private String osFamily;
    private File output;
    protected RedirectorElement redirectorElement;
    private String resultProperty;
    protected boolean failOnError = false;
    protected boolean newEnvironment = false;
    private Long timeout = null;
    private Environment env = new Environment();
    protected Commandline cmdl = new Commandline();
    private boolean failIfExecFails = true;
    private boolean resolveExecutable = false;
    private boolean searchPath = false;
    private boolean spawn = false;
    private boolean incompatibleWithSpawn = false;
    protected Redirector redirector = new Redirector((Task) this);
    private boolean vmLauncher = true;

    public ExecTask() {
    }

    public ExecTask(Task task) {
        bindToOwner(task);
    }

    private String getPath(String str) {
        return str.substring("PATH=".length());
    }

    private String getPath(Map map) {
        String str = (String) map.get("PATH");
        return str != null ? str : (String) map.get("Path");
    }

    private boolean isPath(String str) {
        return str.startsWith("PATH=") || str.startsWith("Path=");
    }

    public void addConfiguredRedirector(RedirectorElement redirectorElement) {
        if (this.redirectorElement != null) {
            throw new BuildException("cannot have > 1 nested <redirector>s");
        }
        this.redirectorElement = redirectorElement;
        this.incompatibleWithSpawn = true;
    }

    public void addEnv(Environment.Variable variable) {
        this.env.addVariable(variable);
    }

    protected void checkConfiguration() throws BuildException {
        if (this.cmdl.getExecutable() == null) {
            throw new BuildException("no executable specified", getLocation());
        }
        if (this.dir != null && !this.dir.exists()) {
            throw new BuildException(new StringBuffer().append("The directory ").append(this.dir).append(" does not exist").toString());
        }
        if (this.dir != null && !this.dir.isDirectory()) {
            throw new BuildException(new StringBuffer().append(this.dir).append(" is not a directory").toString());
        }
        if (!this.spawn || !this.incompatibleWithSpawn) {
            setupRedirector();
            return;
        }
        getProject().log("spawn does not allow attributes related to input, output, error, result", 0);
        getProject().log("spawn also does not allow timeout", 0);
        getProject().log("finally, spawn is not compatible with a nested I/O <redirector>", 0);
        throw new BuildException("You have used an attribute or nested element which is not compatible with spawn");
    }

    public Commandline.Argument createArg() {
        return this.cmdl.createArgument();
    }

    protected ExecuteStreamHandler createHandler() throws BuildException {
        return this.redirector.createHandler();
    }

    protected ExecuteWatchdog createWatchdog() throws BuildException {
        return this.timeout == null ? null : new ExecuteWatchdog(this.timeout.longValue());
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (!isValidOs()) {
            return;
        }
        File file = this.dir;
        this.cmdl.setExecutable(resolveExecutable(this.executable, this.searchPath));
        checkConfiguration();
        try {
            runExec(prepareExec());
        } finally {
            this.dir = file;
        }
    }

    public final String getOs() {
        return this.os;
    }

    public final String getOsFamily() {
        return this.osFamily;
    }

    public boolean getResolveExecutable() {
        return this.resolveExecutable;
    }

    protected boolean isValidOs() {
        boolean z = false;
        if (this.osFamily == null || Os.isFamily(this.osFamily)) {
            String property = System.getProperty("os.name");
            log(new StringBuffer().append("Current OS is ").append(property).toString(), 3);
            if (this.os == null || this.os.indexOf(property) >= 0) {
                z = true;
            } else {
                log(new StringBuffer().append("This OS, ").append(property).append(" was not found in the specified list of valid OSes: ").append(this.os).toString(), 3);
            }
        }
        return z;
    }

    protected void logFlush() {
    }

    protected void maybeSetResultPropertyValue(int i) {
        if (this.resultProperty != null) {
            getProject().setNewProperty(this.resultProperty, Integer.toString(i));
        }
    }

    protected Execute prepareExec() throws BuildException {
        if (this.dir == null) {
            this.dir = getProject().getBaseDir();
        }
        if (this.redirectorElement != null) {
            this.redirectorElement.configure(this.redirector);
        }
        Execute execute = new Execute(createHandler(), createWatchdog());
        execute.setAntRun(getProject());
        execute.setWorkingDirectory(this.dir);
        execute.setVMLauncher(this.vmLauncher);
        String[] variables = this.env.getVariables();
        if (variables != null) {
            for (String str : variables) {
                log(new StringBuffer().append("Setting environment variable: ").append(str).toString(), 3);
            }
        }
        execute.setNewenvironment(this.newEnvironment);
        execute.setEnvironment(variables);
        return execute;
    }

    protected String resolveExecutable(String str, boolean z) {
        String str2;
        if (!this.resolveExecutable) {
            str2 = str;
        } else {
            File resolveFile = getProject().resolveFile(str);
            if (resolveFile.exists()) {
                str2 = resolveFile.getAbsolutePath();
            } else {
                if (this.dir != null) {
                    File resolveFile2 = FILE_UTILS.resolveFile(this.dir, str);
                    if (resolveFile2.exists()) {
                        str2 = resolveFile2.getAbsolutePath();
                    }
                }
                str2 = str;
                if (z) {
                    String[] variables = this.env.getVariables();
                    Path path = null;
                    if (variables != null) {
                        int i = 0;
                        while (true) {
                            path = null;
                            if (i >= variables.length) {
                                break;
                            } else if (isPath(variables[i])) {
                                path = new Path(getProject(), getPath(variables[i]));
                                break;
                            } else {
                                i++;
                            }
                        }
                    }
                    Path path2 = path;
                    if (path == null) {
                        String path3 = getPath(Execute.getEnvironmentVariables());
                        path2 = path;
                        if (path3 != null) {
                            path2 = new Path(getProject(), path3);
                        }
                    }
                    str2 = str;
                    if (path2 != null) {
                        String[] list = path2.list();
                        int i2 = 0;
                        while (true) {
                            str2 = str;
                            if (i2 >= list.length) {
                                break;
                            }
                            File resolveFile3 = FILE_UTILS.resolveFile(new File(list[i2]), str);
                            if (resolveFile3.exists()) {
                                str2 = resolveFile3.getAbsolutePath();
                                break;
                            }
                            i2++;
                        }
                    }
                }
            }
        }
        return str2;
    }

    protected void runExec(Execute execute) throws BuildException {
        log(this.cmdl.describeCommand(), 3);
        execute.setCommandline(this.cmdl.getCommandline());
        try {
            runExecute(execute);
        } catch (IOException e) {
            if (this.failIfExecFails) {
                throw new BuildException(new StringBuffer().append("Execute failed: ").append(e.toString()).toString(), e, getLocation());
            }
            log(new StringBuffer().append("Execute failed: ").append(e.toString()).toString(), 0);
        } finally {
            logFlush();
        }
    }

    protected final void runExecute(Execute execute) throws IOException {
        if (this.spawn) {
            execute.spawn();
            return;
        }
        int execute2 = execute.execute();
        if (execute.killedProcess()) {
            if (this.failOnError) {
                throw new BuildException("Timeout: killed the sub-process");
            }
            log("Timeout: killed the sub-process", 1);
        }
        maybeSetResultPropertyValue(execute2);
        this.redirector.complete();
        if (!Execute.isFailure(execute2)) {
            return;
        }
        if (this.failOnError) {
            throw new BuildException(new StringBuffer().append(getTaskType()).append(" returned: ").append(execute2).toString(), getLocation());
        }
        log(new StringBuffer().append("Result: ").append(execute2).toString(), 0);
    }

    public void setAppend(boolean z) {
        this.redirector.setAppend(z);
        this.incompatibleWithSpawn = true;
    }

    public void setCommand(Commandline commandline) {
        log("The command attribute is deprecated.\nPlease use the executable attribute and nested arg elements.", 1);
        this.cmdl = commandline;
    }

    public void setDir(File file) {
        this.dir = file;
    }

    public void setError(File file) {
        this.error = file;
        this.incompatibleWithSpawn = true;
    }

    public void setErrorProperty(String str) {
        this.redirector.setErrorProperty(str);
        this.incompatibleWithSpawn = true;
    }

    public void setExecutable(String str) {
        this.executable = str;
        this.cmdl.setExecutable(str);
    }

    public void setFailIfExecutionFails(boolean z) {
        this.failIfExecFails = z;
        this.incompatibleWithSpawn = true;
    }

    public void setFailonerror(boolean z) {
        this.failOnError = z;
        this.incompatibleWithSpawn |= z;
    }

    public void setInput(File file) {
        if (this.inputString != null) {
            throw new BuildException("The \"input\" and \"inputstring\" attributes cannot both be specified");
        }
        this.input = file;
        this.incompatibleWithSpawn = true;
    }

    public void setInputString(String str) {
        if (this.input != null) {
            throw new BuildException("The \"input\" and \"inputstring\" attributes cannot both be specified");
        }
        this.inputString = str;
        this.incompatibleWithSpawn = true;
    }

    public void setLogError(boolean z) {
        this.redirector.setLogError(z);
        this.incompatibleWithSpawn |= z;
    }

    public void setNewenvironment(boolean z) {
        this.newEnvironment = z;
    }

    public void setOs(String str) {
        this.os = str;
    }

    public void setOsFamily(String str) {
        this.osFamily = str.toLowerCase(Locale.ENGLISH);
    }

    public void setOutput(File file) {
        this.output = file;
        this.incompatibleWithSpawn = true;
    }

    public void setOutputproperty(String str) {
        this.redirector.setOutputProperty(str);
        this.incompatibleWithSpawn = true;
    }

    public void setResolveExecutable(boolean z) {
        this.resolveExecutable = z;
    }

    public void setResultProperty(String str) {
        this.resultProperty = str;
        this.incompatibleWithSpawn = true;
    }

    public void setSearchPath(boolean z) {
        this.searchPath = z;
    }

    public void setSpawn(boolean z) {
        this.spawn = z;
    }

    public void setTimeout(Integer num) {
        setTimeout(num == null ? null : new Long(num.intValue()));
    }

    public void setTimeout(Long l) {
        this.timeout = l;
        this.incompatibleWithSpawn = true;
    }

    public void setVMLauncher(boolean z) {
        this.vmLauncher = z;
    }

    protected void setupRedirector() {
        this.redirector.setInput(this.input);
        this.redirector.setInputString(this.inputString);
        this.redirector.setOutput(this.output);
        this.redirector.setError(this.error);
    }
}
