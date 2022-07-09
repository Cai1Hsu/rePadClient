package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ExitException;
import org.apache.tools.ant.ExitStatusException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.types.Assertions;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.CommandlineJava;
import org.apache.tools.ant.types.Environment;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Permissions;
import org.apache.tools.ant.types.PropertySet;
import org.apache.tools.ant.types.RedirectorElement;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.util.KeepAliveInputStream;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Java.class */
public class Java extends Task {
    private static final String TIMEOUT_MESSAGE = "Timeout: killed the sub-process";
    private File error;
    private File input;
    private String inputString;
    private File output;
    protected RedirectorElement redirectorElement;
    private String resultProperty;
    private CommandlineJava cmdl = new CommandlineJava();
    private Environment env = new Environment();
    private boolean fork = false;
    private boolean newEnvironment = false;
    private File dir = null;
    private boolean failOnError = false;
    private Long timeout = null;
    protected Redirector redirector = new Redirector((Task) this);
    private Permissions perm = null;
    private boolean spawn = false;
    private boolean incompatibleWithSpawn = false;

    public Java() {
    }

    public Java(Task task) {
        bindToOwner(task);
    }

    private int fork(String[] strArr) throws BuildException {
        Execute execute = new Execute(this.redirector.createHandler(), createWatchdog());
        setupExecutable(execute, strArr);
        try {
            int execute2 = execute.execute();
            this.redirector.complete();
            if (!execute.killedProcess()) {
                return execute2;
            }
            throw new BuildException(TIMEOUT_MESSAGE);
        } catch (IOException e) {
            throw new BuildException(e, getLocation());
        }
    }

    private void log(Throwable th) {
        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter(stringWriter);
        th.printStackTrace(printWriter);
        printWriter.close();
        log(stringWriter.toString(), 0);
    }

    private void run(CommandlineJava commandlineJava) throws BuildException {
        try {
            ExecuteJava executeJava = new ExecuteJava();
            executeJava.setJavaCommand(commandlineJava.getJavaCommand());
            executeJava.setClasspath(commandlineJava.getClasspath());
            executeJava.setSystemProperties(commandlineJava.getSystemProperties());
            executeJava.setPermissions(this.perm);
            executeJava.setTimeout(this.timeout);
            this.redirector.createStreams();
            executeJava.execute(getProject());
            this.redirector.complete();
            if (!executeJava.killedProcess()) {
                return;
            }
            throw new BuildException(TIMEOUT_MESSAGE);
        } catch (IOException e) {
            throw new BuildException(e);
        }
    }

    private void setupCommandLine(Execute execute, String[] strArr) {
        if (Os.isFamily(Os.FAMILY_VMS)) {
            setupCommandLineForVMS(execute, strArr);
        } else {
            execute.setCommandline(strArr);
        }
    }

    private void setupCommandLineForVMS(Execute execute, String[] strArr) {
        ExecuteJava.setupCommandLineForVMS(execute, strArr);
    }

    private void setupEnvironment(Execute execute) {
        String[] variables = this.env.getVariables();
        if (variables != null) {
            for (String str : variables) {
                log(new StringBuffer().append("Setting environment variable: ").append(str).toString(), 3);
            }
        }
        execute.setNewenvironment(this.newEnvironment);
        execute.setEnvironment(variables);
    }

    private void setupExecutable(Execute execute, String[] strArr) {
        execute.setAntRun(getProject());
        setupWorkingDir(execute);
        setupEnvironment(execute);
        setupCommandLine(execute, strArr);
    }

    private void setupWorkingDir(Execute execute) {
        if (this.dir == null) {
            this.dir = getProject().getBaseDir();
        } else if (!this.dir.exists() || !this.dir.isDirectory()) {
            throw new BuildException(new StringBuffer().append(this.dir.getAbsolutePath()).append(" is not a valid directory").toString(), getLocation());
        }
        execute.setWorkingDirectory(this.dir);
    }

    private void spawn(String[] strArr) throws BuildException {
        Execute execute = new Execute();
        setupExecutable(execute, strArr);
        try {
            execute.spawn();
        } catch (IOException e) {
            throw new BuildException(e, getLocation());
        }
    }

    public void addAssertions(Assertions assertions) {
        if (getCommandLine().getAssertions() != null) {
            throw new BuildException("Only one assertion declaration is allowed");
        }
        getCommandLine().setAssertions(assertions);
    }

    public void addConfiguredRedirector(RedirectorElement redirectorElement) {
        if (this.redirectorElement != null) {
            throw new BuildException("cannot have > 1 nested redirectors");
        }
        this.redirectorElement = redirectorElement;
        this.incompatibleWithSpawn = true;
    }

    public void addEnv(Environment.Variable variable) {
        this.env.addVariable(variable);
    }

    public void addSysproperty(Environment.Variable variable) {
        getCommandLine().addSysproperty(variable);
    }

    public void addSyspropertyset(PropertySet propertySet) {
        getCommandLine().addSyspropertyset(propertySet);
    }

    protected void checkConfiguration() throws BuildException {
        if (getCommandLine().getClassname() == null && getCommandLine().getJar() == null) {
            throw new BuildException("Classname must not be null.");
        }
        if (!this.fork && getCommandLine().getJar() != null) {
            throw new BuildException("Cannot execute a jar in non-forked mode. Please set fork='true'. ");
        }
        if (this.spawn && !this.fork) {
            throw new BuildException("Cannot spawn a java process in non-forked mode. Please set fork='true'. ");
        }
        if (getCommandLine().getClasspath() != null && getCommandLine().getJar() != null) {
            log("When using 'jar' attribute classpath-settings are ignored. See the manual for more information.", 3);
        }
        if (this.spawn && this.incompatibleWithSpawn) {
            getProject().log("spawn does not allow attributes related to input, output, error, result", 0);
            getProject().log("spawn also does not allow timeout", 0);
            getProject().log("finally, spawn is not compatible with a nested I/O <redirector>", 0);
            throw new BuildException("You have used an attribute or nested element which is not compatible with spawn");
        }
        if (getCommandLine().getAssertions() != null && !this.fork) {
            log("Assertion statements are currently ignored in non-forked mode");
        }
        if (this.fork) {
            if (this.perm != null) {
                log("Permissions can not be set this way in forked mode.", 1);
            }
            log(getCommandLine().describeCommand(), 3);
        } else {
            if (getCommandLine().getVmCommand().size() > 1) {
                log("JVM args ignored when same JVM is used.", 1);
            }
            if (this.dir != null) {
                log("Working directory ignored when same JVM is used.", 1);
            }
            if (this.newEnvironment || this.env.getVariables() != null) {
                log("Changes to environment variables are ignored when same JVM is used.", 1);
            }
            if (getCommandLine().getBootclasspath() != null) {
                log("bootclasspath ignored when same JVM is used.", 1);
            }
            if (this.perm == null) {
                this.perm = new Permissions(true);
                log(new StringBuffer().append("running ").append(getCommandLine().getClassname()).append(" with default permissions (exit forbidden)").toString(), 3);
            }
            log(new StringBuffer().append("Running in same VM ").append(getCommandLine().describeJavaCommand()).toString(), 3);
        }
        setupRedirector();
    }

    public void clearArgs() {
        getCommandLine().clearJavaArgs();
    }

    public Commandline.Argument createArg() {
        return getCommandLine().createArgument();
    }

    public Path createBootclasspath() {
        return getCommandLine().createBootclasspath(getProject()).createPath();
    }

    public Path createClasspath() {
        return getCommandLine().createClasspath(getProject()).createPath();
    }

    public Commandline.Argument createJvmarg() {
        return getCommandLine().createVmArgument();
    }

    public Permissions createPermissions() {
        this.perm = this.perm == null ? new Permissions() : this.perm;
        return this.perm;
    }

    protected ExecuteWatchdog createWatchdog() throws BuildException {
        return this.timeout == null ? null : new ExecuteWatchdog(this.timeout.longValue());
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        File file = this.dir;
        Permissions permissions = this.perm;
        try {
            checkConfiguration();
            int executeJava = executeJava();
            if (executeJava != 0) {
                if (this.failOnError) {
                    throw new ExitStatusException(new StringBuffer().append("Java returned: ").append(executeJava).toString(), executeJava, getLocation());
                }
                log(new StringBuffer().append("Java Result: ").append(executeJava).toString(), 0);
            }
            maybeSetResultPropertyValue(executeJava);
        } finally {
            this.dir = file;
            this.perm = permissions;
        }
    }

    public int executeJava() throws BuildException {
        return executeJava(getCommandLine());
    }

    protected int executeJava(CommandlineJava commandlineJava) {
        int i = 0;
        try {
            if (!this.fork) {
                try {
                    run(commandlineJava);
                } catch (ExitException e) {
                    i = e.getStatus();
                }
            } else if (!this.spawn) {
                i = fork(commandlineJava.getCommandline());
            } else {
                spawn(commandlineJava.getCommandline());
            }
        } catch (ThreadDeath e2) {
            throw e2;
        } catch (BuildException e3) {
            if (e3.getLocation() == null && getLocation() != null) {
                e3.setLocation(getLocation());
            }
            if (this.failOnError) {
                throw e3;
            }
            if (TIMEOUT_MESSAGE.equals(e3.getMessage())) {
                log(TIMEOUT_MESSAGE);
            } else {
                log(e3);
            }
            i = -1;
        } catch (Throwable th) {
            if (this.failOnError) {
                throw new BuildException(th, getLocation());
            }
            log(th);
            i = -1;
        }
        return i;
    }

    public CommandlineJava getCommandLine() {
        return this.cmdl;
    }

    public CommandlineJava.SysProperties getSysProperties() {
        return getCommandLine().getSystemProperties();
    }

    @Override // org.apache.tools.ant.Task
    protected void handleErrorFlush(String str) {
        if (this.redirector.getErrorStream() != null) {
            this.redirector.handleErrorFlush(str);
        } else {
            super.handleErrorFlush(str);
        }
    }

    @Override // org.apache.tools.ant.Task
    protected void handleErrorOutput(String str) {
        if (this.redirector.getErrorStream() != null) {
            this.redirector.handleErrorOutput(str);
        } else {
            super.handleErrorOutput(str);
        }
    }

    @Override // org.apache.tools.ant.Task
    protected void handleFlush(String str) {
        if (this.redirector.getOutputStream() != null) {
            this.redirector.handleFlush(str);
        } else {
            super.handleFlush(str);
        }
    }

    @Override // org.apache.tools.ant.Task
    public int handleInput(byte[] bArr, int i, int i2) throws IOException {
        return this.redirector.handleInput(bArr, i, i2);
    }

    @Override // org.apache.tools.ant.Task
    protected void handleOutput(String str) {
        if (this.redirector.getOutputStream() != null) {
            this.redirector.handleOutput(str);
        } else {
            super.handleOutput(str);
        }
    }

    protected void maybeSetResultPropertyValue(int i) {
        String num = Integer.toString(i);
        if (this.resultProperty != null) {
            getProject().setNewProperty(this.resultProperty, num);
        }
    }

    protected void run(String str, Vector vector) throws BuildException {
        CommandlineJava commandlineJava = new CommandlineJava();
        commandlineJava.setClassname(str);
        int size = vector.size();
        for (int i = 0; i < size; i++) {
            commandlineJava.createArgument().setValue((String) vector.elementAt(i));
        }
        run(commandlineJava);
    }

    public void setAppend(boolean z) {
        this.redirector.setAppend(z);
        this.incompatibleWithSpawn = true;
    }

    public void setArgs(String str) {
        log("The args attribute is deprecated. Please use nested arg elements.", 1);
        getCommandLine().createArgument().setLine(str);
    }

    public void setClassname(String str) throws BuildException {
        if (getCommandLine().getJar() != null) {
            throw new BuildException("Cannot use 'jar' and 'classname' attributes in same command");
        }
        getCommandLine().setClassname(str);
    }

    public void setClasspath(Path path) {
        createClasspath().append(path);
    }

    public void setClasspathRef(Reference reference) {
        createClasspath().setRefid(reference);
    }

    public void setCloneVm(boolean z) {
        getCommandLine().setCloneVm(z);
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

    public void setFailonerror(boolean z) {
        this.failOnError = z;
        this.incompatibleWithSpawn |= z;
    }

    public void setFork(boolean z) {
        this.fork = z;
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

    public void setJVMVersion(String str) {
        getCommandLine().setVmversion(str);
    }

    public void setJar(File file) throws BuildException {
        if (getCommandLine().getClassname() != null) {
            throw new BuildException("Cannot use 'jar' and 'classname' attributes in same command.");
        }
        getCommandLine().setJar(file.getAbsolutePath());
    }

    public void setJvm(String str) {
        getCommandLine().setVm(str);
    }

    public void setJvmargs(String str) {
        log("The jvmargs attribute is deprecated. Please use nested jvmarg elements.", 1);
        getCommandLine().createVmArgument().setLine(str);
    }

    public void setLogError(boolean z) {
        this.redirector.setLogError(z);
        this.incompatibleWithSpawn |= z;
    }

    public void setMaxmemory(String str) {
        getCommandLine().setMaxmemory(str);
    }

    public void setNewenvironment(boolean z) {
        this.newEnvironment = z;
    }

    public void setOutput(File file) {
        this.output = file;
        this.incompatibleWithSpawn = true;
    }

    public void setOutputproperty(String str) {
        this.redirector.setOutputProperty(str);
        this.incompatibleWithSpawn = true;
    }

    public void setResultProperty(String str) {
        this.resultProperty = str;
        this.incompatibleWithSpawn = true;
    }

    public void setSpawn(boolean z) {
        this.spawn = z;
    }

    public void setTimeout(Long l) {
        this.timeout = l;
        this.incompatibleWithSpawn = (this.timeout != null) | this.incompatibleWithSpawn;
    }

    protected void setupRedirector() {
        this.redirector.setInput(this.input);
        this.redirector.setInputString(this.inputString);
        this.redirector.setOutput(this.output);
        this.redirector.setError(this.error);
        if (this.redirectorElement != null) {
            this.redirectorElement.configure(this.redirector);
        }
        if (!this.spawn && this.input == null && this.inputString == null) {
            this.redirector.setInputStream(new KeepAliveInputStream(getProject().getDefaultInputStream()));
        }
    }
}
