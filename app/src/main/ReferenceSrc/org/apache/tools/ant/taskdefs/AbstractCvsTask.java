package org.apache.tools.ant.taskdefs;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.Environment;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/AbstractCvsTask.class */
public abstract class AbstractCvsTask extends Task {
    private static final String DEFAULT_COMMAND = "checkout";
    public static final int DEFAULT_COMPRESSION_LEVEL = 3;
    private static final int MAXIMUM_COMRESSION_LEVEL = 9;
    private String cvsPackage;
    private String cvsRoot;
    private String cvsRsh;
    private File dest;
    private File error;
    private OutputStream errorStream;
    private ExecuteStreamHandler executeStreamHandler;
    private File output;
    private OutputStream outputStream;
    private String tag;
    private Commandline cmd = new Commandline();
    private ArrayList modules = new ArrayList();
    private Vector vecCommandlines = new Vector();
    private String command = null;
    private boolean quiet = false;
    private boolean reallyquiet = false;
    private int compression = 0;
    private boolean noexec = false;
    private int port = 0;
    private File passFile = null;
    private boolean append = false;
    private boolean failOnError = false;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/AbstractCvsTask$Module.class */
    public static final class Module {
        private String name;

        public String getName() {
            return this.name;
        }

        public void setName(String str) {
            this.name = str;
        }
    }

    private String executeToString(Execute execute) {
        StringBuffer removeCvsPassword = removeCvsPassword(Commandline.describeCommand(execute.getCommandline()));
        String str = StringUtils.LINE_SEP;
        String[] environment = execute.getEnvironment();
        if (environment != null) {
            removeCvsPassword.append(str);
            removeCvsPassword.append(str);
            removeCvsPassword.append("environment:");
            removeCvsPassword.append(str);
            for (String str2 : environment) {
                removeCvsPassword.append(str);
                removeCvsPassword.append("\t");
                removeCvsPassword.append(str2);
            }
        }
        return removeCvsPassword.toString();
    }

    private StringBuffer removeCvsPassword(String str) {
        StringBuffer stringBuffer = new StringBuffer(str);
        int indexOf = str.indexOf("-d:");
        if (indexOf >= 0) {
            str.indexOf("@", indexOf);
            int indexOf2 = str.indexOf(":", indexOf);
            int indexOf3 = str.indexOf(":", str.indexOf(":", indexOf2 + 1) + 1);
            int indexOf4 = str.indexOf("@", indexOf);
            if (indexOf4 >= 0 && indexOf3 > indexOf2 && indexOf3 < indexOf4) {
                for (int i = indexOf3 + 1; i < indexOf4; i++) {
                    stringBuffer.replace(i, i + 1, "*");
                }
            }
        }
        return stringBuffer;
    }

    public void addCommandArgument(String str) {
        addCommandArgument(this.cmd, str);
    }

    public void addCommandArgument(Commandline commandline, String str) {
        commandline.createArgument().setValue(str);
    }

    public void addConfiguredCommandline(Commandline commandline) {
        addConfiguredCommandline(commandline, false);
    }

    public void addConfiguredCommandline(Commandline commandline, boolean z) {
        if (commandline == null) {
            return;
        }
        configureCommandline(commandline);
        if (z) {
            this.vecCommandlines.insertElementAt(commandline, 0);
        } else {
            this.vecCommandlines.addElement(commandline);
        }
    }

    public void addModule(Module module) {
        this.modules.add(module);
    }

    protected void configureCommandline(Commandline commandline) {
        if (commandline == null) {
            return;
        }
        commandline.setExecutable("cvs");
        if (this.cvsPackage != null) {
            commandline.createArgument().setLine(this.cvsPackage);
        }
        Iterator it = this.modules.iterator();
        while (it.hasNext()) {
            commandline.createArgument().setValue(((Module) it.next()).getName());
        }
        if (this.compression > 0 && this.compression <= 9) {
            commandline.createArgument(true).setValue(new StringBuffer().append("-z").append(this.compression).toString());
        }
        if (this.quiet && !this.reallyquiet) {
            commandline.createArgument(true).setValue("-q");
        }
        if (this.reallyquiet) {
            commandline.createArgument(true).setValue("-Q");
        }
        if (this.noexec) {
            commandline.createArgument(true).setValue("-n");
        }
        if (this.cvsRoot == null) {
            return;
        }
        commandline.createArgument(true).setLine(new StringBuffer().append("-d").append(this.cvsRoot).toString());
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        String command = getCommand();
        if (getCommand() == null && this.vecCommandlines.size() == 0) {
            setCommand("checkout");
        }
        String command2 = getCommand();
        Commandline commandline = null;
        if (command2 != null) {
            commandline = (Commandline) this.cmd.clone();
            commandline.createArgument(true).setLine(command2);
            addConfiguredCommandline(commandline, true);
        }
        try {
            int size = this.vecCommandlines.size();
            for (int i = 0; i < size; i++) {
                runCommand((Commandline) this.vecCommandlines.elementAt(i));
            }
        } finally {
            if (commandline != null) {
                removeCommandline(commandline);
            }
            setCommand(command);
            FileUtils.close(this.outputStream);
            FileUtils.close(this.errorStream);
        }
    }

    public String getCommand() {
        return this.command;
    }

    public String getCvsRoot() {
        return this.cvsRoot;
    }

    public String getCvsRsh() {
        return this.cvsRsh;
    }

    public File getDest() {
        return this.dest;
    }

    protected OutputStream getErrorStream() {
        if (this.errorStream == null) {
            if (this.error != null) {
                try {
                    setErrorStream(new PrintStream(new BufferedOutputStream(new FileOutputStream(this.error.getPath(), this.append))));
                } catch (IOException e) {
                    throw new BuildException(e, getLocation());
                }
            } else {
                setErrorStream(new LogOutputStream((Task) this, 1));
            }
        }
        return this.errorStream;
    }

    protected ExecuteStreamHandler getExecuteStreamHandler() {
        if (this.executeStreamHandler == null) {
            setExecuteStreamHandler(new PumpStreamHandler(getOutputStream(), getErrorStream()));
        }
        return this.executeStreamHandler;
    }

    protected List getModules() {
        return (List) this.modules.clone();
    }

    protected OutputStream getOutputStream() {
        if (this.outputStream == null) {
            if (this.output != null) {
                try {
                    setOutputStream(new PrintStream(new BufferedOutputStream(new FileOutputStream(this.output.getPath(), this.append))));
                } catch (IOException e) {
                    throw new BuildException(e, getLocation());
                }
            } else {
                setOutputStream(new LogOutputStream((Task) this, 2));
            }
        }
        return this.outputStream;
    }

    public String getPackage() {
        return this.cvsPackage;
    }

    public File getPassFile() {
        return this.passFile;
    }

    public int getPort() {
        return this.port;
    }

    public String getTag() {
        return this.tag;
    }

    protected void removeCommandline(Commandline commandline) {
        this.vecCommandlines.removeElement(commandline);
    }

    protected void runCommand(Commandline commandline) throws BuildException {
        Environment environment = new Environment();
        if (this.port > 0) {
            Environment.Variable variable = new Environment.Variable();
            variable.setKey("CVS_CLIENT_PORT");
            variable.setValue(String.valueOf(this.port));
            environment.addVariable(variable);
            Environment.Variable variable2 = new Environment.Variable();
            variable2.setKey("CVS_PSERVER_PORT");
            variable2.setValue(String.valueOf(this.port));
            environment.addVariable(variable2);
        }
        if (this.passFile == null) {
            File file = new File(new StringBuffer().append(System.getProperty("cygwin.user.home", System.getProperty("user.home"))).append(File.separatorChar).append(".cvspass").toString());
            if (file.exists()) {
                setPassfile(file);
            }
        }
        if (this.passFile != null) {
            if (this.passFile.isFile() && this.passFile.canRead()) {
                Environment.Variable variable3 = new Environment.Variable();
                variable3.setKey("CVS_PASSFILE");
                variable3.setValue(String.valueOf(this.passFile));
                environment.addVariable(variable3);
                log(new StringBuffer().append("Using cvs passfile: ").append(String.valueOf(this.passFile)).toString(), 3);
            } else if (!this.passFile.canRead()) {
                log(new StringBuffer().append("cvs passfile: ").append(String.valueOf(this.passFile)).append(" ignored as it is not readable").toString(), 1);
            } else {
                log(new StringBuffer().append("cvs passfile: ").append(String.valueOf(this.passFile)).append(" ignored as it is not a file").toString(), 1);
            }
        }
        if (this.cvsRsh != null) {
            Environment.Variable variable4 = new Environment.Variable();
            variable4.setKey("CVS_RSH");
            variable4.setValue(String.valueOf(this.cvsRsh));
            environment.addVariable(variable4);
        }
        Execute execute = new Execute(getExecuteStreamHandler(), null);
        execute.setAntRun(getProject());
        if (this.dest == null) {
            this.dest = getProject().getBaseDir();
        }
        if (!this.dest.exists()) {
            this.dest.mkdirs();
        }
        execute.setWorkingDirectory(this.dest);
        execute.setCommandline(commandline.getCommandline());
        execute.setEnvironment(environment.getVariables());
        try {
            String executeToString = executeToString(execute);
            log(executeToString, 3);
            int execute2 = execute.execute();
            log(new StringBuffer().append("retCode=").append(execute2).toString(), 4);
            if (!this.failOnError || !Execute.isFailure(execute2)) {
                return;
            }
            throw new BuildException(new StringBuffer().append("cvs exited with error code ").append(execute2).append(StringUtils.LINE_SEP).append("Command line was [").append(executeToString).append("]").toString(), getLocation());
        } catch (IOException e) {
            if (this.failOnError) {
                throw new BuildException(e, getLocation());
            }
            log(new StringBuffer().append("Caught exception: ").append(e.getMessage()).toString(), 1);
        } catch (BuildException e2) {
            if (this.failOnError) {
                throw e2;
            }
            Throwable cause = e2.getCause();
            Throwable th = cause;
            if (cause == null) {
                th = e2;
            }
            log(new StringBuffer().append("Caught exception: ").append(th.getMessage()).toString(), 1);
        } catch (Exception e3) {
            if (this.failOnError) {
                throw new BuildException(e3, getLocation());
            }
            log(new StringBuffer().append("Caught exception: ").append(e3.getMessage()).toString(), 1);
        }
    }

    public void setAppend(boolean z) {
        this.append = z;
    }

    public void setCommand(String str) {
        this.command = str;
    }

    public void setCompression(boolean z) {
        setCompressionLevel(z ? 3 : 0);
    }

    public void setCompressionLevel(int i) {
        this.compression = i;
    }

    public void setCvsRoot(String str) {
        String str2 = str;
        if (str != null) {
            str2 = str;
            if (str.trim().equals("")) {
                str2 = null;
            }
        }
        this.cvsRoot = str2;
    }

    public void setCvsRsh(String str) {
        String str2 = str;
        if (str != null) {
            str2 = str;
            if (str.trim().equals("")) {
                str2 = null;
            }
        }
        this.cvsRsh = str2;
    }

    public void setDate(String str) {
        if (str == null || str.trim().length() <= 0) {
            return;
        }
        addCommandArgument(MSVSSConstants.FLAG_CODEDIFF);
        addCommandArgument(str);
    }

    public void setDest(File file) {
        this.dest = file;
    }

    public void setError(File file) {
        this.error = file;
    }

    protected void setErrorStream(OutputStream outputStream) {
        this.errorStream = outputStream;
    }

    public void setExecuteStreamHandler(ExecuteStreamHandler executeStreamHandler) {
        this.executeStreamHandler = executeStreamHandler;
    }

    public void setFailOnError(boolean z) {
        this.failOnError = z;
    }

    public void setNoexec(boolean z) {
        this.noexec = z;
    }

    public void setOutput(File file) {
        this.output = file;
    }

    protected void setOutputStream(OutputStream outputStream) {
        this.outputStream = outputStream;
    }

    public void setPackage(String str) {
        this.cvsPackage = str;
    }

    public void setPassfile(File file) {
        this.passFile = file;
    }

    public void setPort(int i) {
        this.port = i;
    }

    public void setQuiet(boolean z) {
        this.quiet = z;
    }

    public void setReallyquiet(boolean z) {
        this.reallyquiet = z;
    }

    public void setTag(String str) {
        if (str == null || str.trim().length() <= 0) {
            return;
        }
        this.tag = str;
        addCommandArgument(new StringBuffer().append("-r").append(str).toString());
    }
}
