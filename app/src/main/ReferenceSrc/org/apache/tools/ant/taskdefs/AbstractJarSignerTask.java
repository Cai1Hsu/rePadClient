package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.util.Enumeration;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.filters.LineContainsRegExp;
import org.apache.tools.ant.taskdefs.optional.sos.SOSCmd;
import org.apache.tools.ant.types.Environment;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.RedirectorElement;
import org.apache.tools.ant.types.RegularExpression;
import org.apache.tools.ant.util.JavaEnvUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/AbstractJarSignerTask.class */
public abstract class AbstractJarSignerTask extends Task {
    public static final String ERROR_NO_SOURCE = "jar must be set through jar attribute or nested filesets";
    protected static final String JARSIGNER_COMMAND = "jarsigner";
    protected String alias;
    private String executable;
    protected File jar;
    protected String keypass;
    protected String keystore;
    protected String maxMemory;
    private RedirectorElement redirector;
    protected String storepass;
    protected String storetype;
    protected boolean verbose;
    protected Vector filesets = new Vector();
    private Environment sysProperties = new Environment();
    private Path path = null;

    private RedirectorElement createRedirector() {
        RedirectorElement redirectorElement = new RedirectorElement();
        if (this.storepass != null) {
            StringBuffer append = new StringBuffer(this.storepass).append('\n');
            if (this.keypass != null) {
                append.append(this.keypass).append('\n');
            }
            redirectorElement.setInputString(append.toString());
            redirectorElement.setLogInputString(false);
            LineContainsRegExp lineContainsRegExp = new LineContainsRegExp();
            RegularExpression regularExpression = new RegularExpression();
            regularExpression.setPattern("^(Enter Passphrase for keystore: |Enter key password for .+: )$");
            lineContainsRegExp.addConfiguredRegexp(regularExpression);
            lineContainsRegExp.setNegate(true);
            redirectorElement.createErrorFilterChain().addLineContainsRegExp(lineContainsRegExp);
        }
        return redirectorElement;
    }

    public void addFileset(FileSet fileSet) {
        this.filesets.addElement(fileSet);
    }

    public void addSysproperty(Environment.Variable variable) {
        this.sysProperties.addVariable(variable);
    }

    protected void addValue(ExecTask execTask, String str) {
        execTask.createArg().setValue(str);
    }

    protected void beginExecution() {
        this.redirector = createRedirector();
    }

    protected void bindToKeystore(ExecTask execTask) {
        if (this.keystore != null) {
            addValue(execTask, "-keystore");
            File resolveFile = getProject().resolveFile(this.keystore);
            addValue(execTask, resolveFile.exists() ? resolveFile.getPath() : this.keystore);
        }
        if (this.storetype != null) {
            addValue(execTask, "-storetype");
            addValue(execTask, this.storetype);
        }
    }

    protected ExecTask createJarSigner() {
        ExecTask execTask = new ExecTask(this);
        if (this.executable == null) {
            execTask.setExecutable(JavaEnvUtils.getJdkExecutable(JARSIGNER_COMMAND));
        } else {
            execTask.setExecutable(this.executable);
        }
        execTask.setTaskType(JARSIGNER_COMMAND);
        execTask.setFailonerror(true);
        execTask.addConfiguredRedirector(this.redirector);
        return execTask;
    }

    public Path createPath() {
        if (this.path == null) {
            this.path = new Path(getProject());
        }
        return this.path.createPath();
    }

    protected Path createUnifiedSourcePath() {
        Path path = this.path == null ? new Path(getProject()) : (Path) this.path.clone();
        Enumeration elements = createUnifiedSources().elements();
        while (elements.hasMoreElements()) {
            path.add((FileSet) elements.nextElement());
        }
        return path;
    }

    protected Vector createUnifiedSources() {
        Vector vector = (Vector) this.filesets.clone();
        if (this.jar != null) {
            FileSet fileSet = new FileSet();
            fileSet.setProject(getProject());
            fileSet.setFile(this.jar);
            fileSet.setDir(this.jar.getParentFile());
            vector.add(fileSet);
        }
        return vector;
    }

    protected void declareSysProperty(ExecTask execTask, Environment.Variable variable) throws BuildException {
        addValue(execTask, new StringBuffer().append("-J-D").append(variable.getContent()).toString());
    }

    protected void endExecution() {
        this.redirector = null;
    }

    public RedirectorElement getRedirector() {
        return this.redirector;
    }

    protected boolean hasResources() {
        return this.path != null || this.filesets.size() > 0;
    }

    public void setAlias(String str) {
        this.alias = str;
    }

    protected void setCommonOptions(ExecTask execTask) {
        if (this.maxMemory != null) {
            addValue(execTask, new StringBuffer().append("-J-Xmx").append(this.maxMemory).toString());
        }
        if (this.verbose) {
            addValue(execTask, SOSCmd.FLAG_VERBOSE);
        }
        Enumeration elements = this.sysProperties.getVariablesVector().elements();
        while (elements.hasMoreElements()) {
            declareSysProperty(execTask, (Environment.Variable) elements.nextElement());
        }
    }

    public void setExecutable(String str) {
        this.executable = str;
    }

    public void setJar(File file) {
        this.jar = file;
    }

    public void setKeypass(String str) {
        this.keypass = str;
    }

    public void setKeystore(String str) {
        this.keystore = str;
    }

    public void setMaxmemory(String str) {
        this.maxMemory = str;
    }

    public void setStorepass(String str) {
        this.storepass = str;
    }

    public void setStoretype(String str) {
        this.storetype = str;
    }

    public void setVerbose(boolean z) {
        this.verbose = z;
    }
}
