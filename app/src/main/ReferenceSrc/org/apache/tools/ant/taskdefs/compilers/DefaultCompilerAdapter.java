package org.apache.tools.ant.taskdefs.compilers;

import com.edutech.publicedu.log.LogHelp;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Location;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.Javac;
import org.apache.tools.ant.taskdefs.LogStreamHandler;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.taskdefs.optional.sos.SOSCmd;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.JavaEnvUtils;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter.class */
public abstract class DefaultCompilerAdapter implements CompilerAdapter, CompilerAdapterExtension {
    private static final int COMMAND_LINE_LIMIT;
    private static final FileUtils FILE_UTILS;
    protected static final String lSep;
    protected Javac attributes;
    protected Path bootclasspath;
    protected Path compileClasspath;
    protected File[] compileList;
    protected Path compileSourcepath;
    protected File destDir;
    protected String encoding;
    protected Path extdirs;
    protected boolean includeAntRuntime;
    protected boolean includeJavaRuntime;
    protected Location location;
    protected String memoryInitialSize;
    protected String memoryMaximumSize;
    protected Project project;
    protected Path src;
    protected String target;
    protected boolean debug = false;
    protected boolean optimize = false;
    protected boolean deprecation = false;
    protected boolean depend = false;
    protected boolean verbose = false;

    static {
        if (Os.isFamily(Os.FAMILY_OS2)) {
            COMMAND_LINE_LIMIT = 1000;
        } else {
            COMMAND_LINE_LIMIT = 4096;
        }
        FILE_UTILS = FileUtils.getFileUtils();
        lSep = StringUtils.LINE_SEP;
    }

    /* JADX WARN: Code restructure failed: missing block: B:5:0x0011, code lost:
        if (r4.equals("1.2") != false) goto L6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private String adjustSourceValue(String str) {
        String str2;
        if (!str.equals("1.1")) {
            str2 = str;
        }
        str2 = "1.3";
        return str2;
    }

    private boolean assumeJavaXY(String str, String str2) {
        return str.equals(this.attributes.getCompilerVersion()) || ("classic".equals(this.attributes.getCompilerVersion()) && JavaEnvUtils.isJavaVersion(str2)) || (("modern".equals(this.attributes.getCompilerVersion()) && JavaEnvUtils.isJavaVersion(str2)) || ("extJavac".equals(this.attributes.getCompilerVersion()) && JavaEnvUtils.isJavaVersion(str2)));
    }

    private String getDefaultSource() {
        return (assumeJava15() || assumeJava16()) ? "1.5 in JDK 1.5 and 1.6" : assumeJava17() ? "1.7 in JDK 1.7" : assumeJava18() ? "1.8 in JDK 1.8" : "";
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x007c, code lost:
        if (assumeJava17() == false) goto L30;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean mustSetSourceForTarget(String str) {
        boolean z;
        if (assumeJava14()) {
            z = false;
        } else {
            String str2 = str;
            if (str.startsWith("1.")) {
                str2 = str.substring(2);
            }
            if (!str2.equals(LogHelp.TYPE_GUIDANCE) && !str2.equals(LogHelp.TYPE_MYWORK) && !str2.equals(LogHelp.TYPE_HWHELP) && !str2.equals("4") && ((!str2.equals("5") && !str2.equals("6")) || assumeJava15() || assumeJava16())) {
                z = false;
                if (str2.equals("7")) {
                    z = false;
                }
            }
            z = true;
        }
        return z;
    }

    private void setImplicitSourceSwitch(Commandline commandline, String str, String str2) {
        this.attributes.log("", 1);
        this.attributes.log("          WARNING", 1);
        this.attributes.log("", 1);
        this.attributes.log(new StringBuffer().append("The -source switch defaults to ").append(getDefaultSource()).append(".").toString(), 1);
        this.attributes.log(new StringBuffer().append("If you specify -target ").append(str).append(" you now must also specify -source ").append(str2).append(".").toString(), 1);
        this.attributes.log(new StringBuffer().append("Ant will implicitly add -source ").append(str2).append(" for you.  Please change your build file.").toString(), 1);
        commandline.createArgument().setValue("-source");
        commandline.createArgument().setValue(str2);
    }

    protected void addCurrentCompilerArgs(Commandline commandline) {
        commandline.addArguments(getJavac().getCurrentCompilerArgs());
    }

    protected void addExtdirsToClasspath(Path path) {
        path.addExtdirs(this.extdirs);
    }

    protected boolean assumeJava11() {
        return "javac1.1".equals(this.attributes.getCompilerVersion());
    }

    protected boolean assumeJava12() {
        return "javac1.2".equals(this.attributes.getCompilerVersion());
    }

    protected boolean assumeJava13() {
        return "javac1.3".equals(this.attributes.getCompilerVersion());
    }

    protected boolean assumeJava14() {
        return assumeJavaXY("javac1.4", "1.4");
    }

    protected boolean assumeJava15() {
        return assumeJavaXY("javac1.5", JavaEnvUtils.JAVA_1_5);
    }

    protected boolean assumeJava16() {
        return assumeJavaXY("javac1.6", JavaEnvUtils.JAVA_1_6);
    }

    protected boolean assumeJava17() {
        return assumeJavaXY("javac1.7", JavaEnvUtils.JAVA_1_7);
    }

    protected boolean assumeJava18() {
        return assumeJavaXY("javac1.8", JavaEnvUtils.JAVA_1_8);
    }

    protected int executeExternalCompile(String[] strArr, int i) {
        return executeExternalCompile(strArr, i, true);
    }

    /* JADX DEBUG: Incorrect finally slice size: {[MOVE, CONST] complete}, expected: {[MOVE] complete} */
    /* JADX WARN: Finally extract failed */
    protected int executeExternalCompile(String[] strArr, int i, boolean z) {
        String[] strArr2;
        File file;
        BufferedWriter bufferedWriter;
        Throwable th;
        File file2 = null;
        File file3 = null;
        try {
            if (Commandline.toString(strArr).length() <= COMMAND_LINE_LIMIT || i < 0) {
                strArr2 = strArr;
                file = null;
            } else {
                BufferedWriter bufferedWriter2 = null;
                try {
                    try {
                        file = FILE_UTILS.createTempFile("files", "", getJavac().getTempdir(), true, true);
                        file2 = file;
                        BufferedWriter bufferedWriter3 = new BufferedWriter(new FileWriter(file));
                        for (int i2 = i; i2 < strArr.length; i2++) {
                            try {
                                if (!z || strArr[i2].indexOf(" ") <= -1) {
                                    bufferedWriter3.write(strArr[i2]);
                                } else {
                                    strArr[i2] = strArr[i2].replace(File.separatorChar, '/');
                                    bufferedWriter3.write(new StringBuffer().append("\"").append(strArr[i2]).append("\"").toString());
                                }
                                bufferedWriter3.newLine();
                            } catch (IOException e) {
                                bufferedWriter = bufferedWriter3;
                                e = e;
                                BufferedWriter bufferedWriter4 = bufferedWriter;
                                BufferedWriter bufferedWriter5 = bufferedWriter;
                                throw new BuildException("Error creating temporary file", e, this.location);
                            } catch (Throwable th2) {
                                th = th2;
                                bufferedWriter2 = bufferedWriter3;
                                FileUtils.close(bufferedWriter2);
                                File file4 = file;
                                throw th;
                            }
                        }
                        bufferedWriter3.flush();
                        strArr2 = new String[i + 1];
                        System.arraycopy(strArr, 0, strArr2, 0, i);
                        strArr2[i] = new StringBuffer().append("@").append(file).toString();
                        FileUtils.close(bufferedWriter3);
                    } catch (Throwable th3) {
                        th = th3;
                        file = null;
                    }
                } catch (IOException e2) {
                    e = e2;
                    bufferedWriter = null;
                    file = file2;
                }
            }
            file3 = file;
            try {
                File file5 = file;
                File file6 = file;
                File file7 = file;
                Execute execute = new Execute(new LogStreamHandler((Task) this.attributes, 2, 1));
                File file8 = file;
                if (Os.isFamily(Os.FAMILY_VMS)) {
                    File file9 = file;
                    execute.setVMLauncher(true);
                }
                File file10 = file;
                execute.setAntRun(this.project);
                File file11 = file;
                execute.setWorkingDirectory(this.project.getBaseDir());
                File file12 = file;
                execute.setCommandline(strArr2);
                File file13 = file;
                execute.execute();
                file3 = file;
                int exitValue = execute.getExitValue();
                if (file != null) {
                    file.delete();
                }
                return exitValue;
            } catch (IOException e3) {
                File file14 = file;
                File file15 = file;
                File file16 = file;
                File file17 = file;
                throw new BuildException(new StringBuffer().append("Error running ").append(strArr[0]).append(" compiler").toString(), e3, this.location);
            }
        } catch (Throwable th4) {
            if (file3 != null) {
                file3.delete();
            }
            throw th4;
        }
    }

    protected Path getBootClassPath() {
        Path path = new Path(this.project);
        if (this.bootclasspath != null) {
            path.append(this.bootclasspath);
        }
        return path.concatSystemBootClasspath(Definer.OnError.POLICY_IGNORE);
    }

    protected Path getCompileClasspath() {
        Path path = new Path(this.project);
        if (this.destDir != null && getJavac().isIncludeDestClasses()) {
            path.setLocation(this.destDir);
        }
        Path path2 = this.compileClasspath;
        Path path3 = path2;
        if (path2 == null) {
            path3 = new Path(this.project);
        }
        if (this.includeAntRuntime) {
            path.addExisting(path3.concatSystemClasspath("last"));
        } else {
            path.addExisting(path3.concatSystemClasspath(Definer.OnError.POLICY_IGNORE));
        }
        if (this.includeJavaRuntime) {
            path.addJavaRuntime();
        }
        return path;
    }

    public Javac getJavac() {
        return this.attributes;
    }

    protected String getNoDebugArgument() {
        return assumeJava11() ? null : "-g:none";
    }

    protected Project getProject() {
        return this.project;
    }

    @Override // org.apache.tools.ant.taskdefs.compilers.CompilerAdapterExtension
    public String[] getSupportedFileExtensions() {
        return new String[]{"java"};
    }

    protected void logAndAddFilesToCompile(Commandline commandline) {
        this.attributes.log(new StringBuffer().append("Compilation ").append(commandline.describeArguments()).toString(), 3);
        StringBuffer stringBuffer = new StringBuffer("File");
        if (this.compileList.length != 1) {
            stringBuffer.append("s");
        }
        stringBuffer.append(" to be compiled:");
        stringBuffer.append(StringUtils.LINE_SEP);
        for (int i = 0; i < this.compileList.length; i++) {
            String absolutePath = this.compileList[i].getAbsolutePath();
            commandline.createArgument().setValue(absolutePath);
            stringBuffer.append("    ");
            stringBuffer.append(absolutePath);
            stringBuffer.append(StringUtils.LINE_SEP);
        }
        this.attributes.log(stringBuffer.toString(), 3);
    }

    @Override // org.apache.tools.ant.taskdefs.compilers.CompilerAdapter
    public void setJavac(Javac javac) {
        this.attributes = javac;
        this.src = javac.getSrcdir();
        this.destDir = javac.getDestdir();
        this.encoding = javac.getEncoding();
        this.debug = javac.getDebug();
        this.optimize = javac.getOptimize();
        this.deprecation = javac.getDeprecation();
        this.depend = javac.getDepend();
        this.verbose = javac.getVerbose();
        this.target = javac.getTarget();
        this.bootclasspath = javac.getBootclasspath();
        this.extdirs = javac.getExtdirs();
        this.compileList = javac.getFileList();
        this.compileClasspath = javac.getClasspath();
        this.compileSourcepath = javac.getSourcepath();
        this.project = javac.getProject();
        this.location = javac.getLocation();
        this.includeAntRuntime = javac.getIncludeantruntime();
        this.includeJavaRuntime = javac.getIncludejavaruntime();
        this.memoryInitialSize = javac.getMemoryInitialSize();
        this.memoryMaximumSize = javac.getMemoryMaximumSize();
    }

    protected Commandline setupJavacCommand() {
        return setupJavacCommand(false);
    }

    protected Commandline setupJavacCommand(boolean z) {
        Commandline commandline = new Commandline();
        setupJavacCommandlineSwitches(commandline, z);
        logAndAddFilesToCompile(commandline);
        return commandline;
    }

    protected Commandline setupJavacCommandlineSwitches(Commandline commandline) {
        return setupJavacCommandlineSwitches(commandline, false);
    }

    protected Commandline setupJavacCommandlineSwitches(Commandline commandline, boolean z) {
        Path compileClasspath = getCompileClasspath();
        Path path = this.compileSourcepath != null ? this.compileSourcepath : this.src;
        String str = assumeJava11() ? "-J-" : "-J-X";
        if (this.memoryInitialSize != null) {
            if (!this.attributes.isForkedJavac()) {
                this.attributes.log("Since fork is false, ignoring memoryInitialSize setting.", 1);
            } else {
                commandline.createArgument().setValue(new StringBuffer().append(str).append("ms").append(this.memoryInitialSize).toString());
            }
        }
        if (this.memoryMaximumSize != null) {
            if (!this.attributes.isForkedJavac()) {
                this.attributes.log("Since fork is false, ignoring memoryMaximumSize setting.", 1);
            } else {
                commandline.createArgument().setValue(new StringBuffer().append(str).append("mx").append(this.memoryMaximumSize).toString());
            }
        }
        if (this.attributes.getNowarn()) {
            commandline.createArgument().setValue("-nowarn");
        }
        if (this.deprecation) {
            commandline.createArgument().setValue("-deprecation");
        }
        if (this.destDir != null) {
            commandline.createArgument().setValue("-d");
            commandline.createArgument().setFile(this.destDir);
        }
        commandline.createArgument().setValue("-classpath");
        if (assumeJava11()) {
            Path path2 = new Path(this.project);
            Path bootClassPath = getBootClassPath();
            if (bootClassPath.size() > 0) {
                path2.append(bootClassPath);
            }
            if (this.extdirs != null) {
                path2.addExtdirs(this.extdirs);
            }
            path2.append(compileClasspath);
            path2.append(path);
            commandline.createArgument().setPath(path2);
        } else {
            commandline.createArgument().setPath(compileClasspath);
            if (path.size() > 0) {
                commandline.createArgument().setValue("-sourcepath");
                commandline.createArgument().setPath(path);
            }
            if (this.target != null) {
                commandline.createArgument().setValue("-target");
                commandline.createArgument().setValue(this.target);
            }
            Path bootClassPath2 = getBootClassPath();
            if (bootClassPath2.size() > 0) {
                commandline.createArgument().setValue("-bootclasspath");
                commandline.createArgument().setPath(bootClassPath2);
            }
            if (this.extdirs != null && this.extdirs.size() > 0) {
                commandline.createArgument().setValue("-extdirs");
                commandline.createArgument().setPath(this.extdirs);
            }
        }
        if (this.encoding != null) {
            commandline.createArgument().setValue("-encoding");
            commandline.createArgument().setValue(this.encoding);
        }
        if (this.debug) {
            if (!z || assumeJava11()) {
                commandline.createArgument().setValue("-g");
            } else {
                String debugLevel = this.attributes.getDebugLevel();
                if (debugLevel != null) {
                    commandline.createArgument().setValue(new StringBuffer().append("-g:").append(debugLevel).toString());
                } else {
                    commandline.createArgument().setValue("-g");
                }
            }
        } else if (getNoDebugArgument() != null) {
            commandline.createArgument().setValue(getNoDebugArgument());
        }
        if (this.optimize) {
            commandline.createArgument().setValue(MSVSSConstants.FLAG_OUTPUT);
        }
        if (this.depend) {
            if (assumeJava11()) {
                commandline.createArgument().setValue("-depend");
            } else if (assumeJava12()) {
                commandline.createArgument().setValue("-Xdepend");
            } else {
                this.attributes.log("depend attribute is not supported by the modern compiler", 1);
            }
        }
        if (this.verbose) {
            commandline.createArgument().setValue(SOSCmd.FLAG_VERBOSE);
        }
        addCurrentCompilerArgs(commandline);
        return commandline;
    }

    protected Commandline setupModernJavacCommand() {
        Commandline commandline = new Commandline();
        setupModernJavacCommandlineSwitches(commandline);
        logAndAddFilesToCompile(commandline);
        return commandline;
    }

    protected Commandline setupModernJavacCommandlineSwitches(Commandline commandline) {
        setupJavacCommandlineSwitches(commandline, true);
        if (!assumeJava13()) {
            String target = this.attributes.getTarget();
            if (this.attributes.getSource() != null) {
                commandline.createArgument().setValue("-source");
                commandline.createArgument().setValue(adjustSourceValue(this.attributes.getSource()));
            } else if (target != null && mustSetSourceForTarget(target)) {
                setImplicitSourceSwitch(commandline, target, adjustSourceValue(target));
            }
        }
        return commandline;
    }
}
