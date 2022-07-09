package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.taskdefs.compilers.CompilerAdapter;
import org.apache.tools.ant.taskdefs.compilers.CompilerAdapterExtension;
import org.apache.tools.ant.taskdefs.compilers.CompilerAdapterFactory;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.GlobPatternMapper;
import org.apache.tools.ant.util.JavaEnvUtils;
import org.apache.tools.ant.util.SourceFileScanner;
import org.apache.tools.ant.util.facade.FacadeTaskHelper;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Javac.class */
public class Javac extends MatchingTask {
    private static final String CLASSIC = "classic";
    private static final String EXTJAVAC = "extJavac";
    private static final String FAIL_MSG = "Compile failed; see the compiler error output for details.";
    private static final String JAVAC11 = "javac1.1";
    private static final String JAVAC12 = "javac1.2";
    private static final String JAVAC13 = "javac1.3";
    private static final String JAVAC14 = "javac1.4";
    private static final String JAVAC15 = "javac1.5";
    private static final String JAVAC16 = "javac1.6";
    private static final String JAVAC17 = "javac1.7";
    private static final String JAVAC18 = "javac1.8";
    private static final String MODERN = "modern";
    private Path bootclasspath;
    private Path compileClasspath;
    private Path compileSourcepath;
    private String debugLevel;
    private File destDir;
    private String encoding;
    private String errorProperty;
    private Path extdirs;
    private FacadeTaskHelper facade;
    private Boolean includeAntRuntime;
    private String memoryInitialSize;
    private String memoryMaximumSize;
    private String source;
    private Path src;
    private String targetAttribute;
    private File tmpDir;
    private String updatedProperty;
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static final byte[] PACKAGE_INFO_CLASS_HEADER = {-54, -2, -70, -66, 0, 0, 0, 49, 0, 7, 7, 0, 5, 7, 0, 6, 1, 0, 10, 83, 111, 117, 114, 99, 101, 70, 105, 108, 101, 1, 0, 17, 112, 97, 99, 107, 97, 103, 101, 45, 105, 110, 102, 111, 46, 106, 97, 118, 97, 1};
    private static final byte[] PACKAGE_INFO_CLASS_FOOTER = {47, 112, 97, 99, 107, 97, 103, 101, 45, 105, 110, 102, 111, 1, 0, 16, 106, 97, 118, 97, 47, 108, 97, 110, 103, 47, 79, 98, 106, 101, 99, 116, 2, 0, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 0, 3, 0, 0, 0, 2, 0, 4};
    private boolean debug = false;
    private boolean optimize = false;
    private boolean deprecation = false;
    private boolean depend = false;
    private boolean verbose = false;
    private boolean includeJavaRuntime = false;
    private boolean fork = false;
    private String forkedExecutable = null;
    private boolean nowarn = false;
    protected boolean failOnError = true;
    protected boolean listFiles = false;
    protected File[] compileList = new File[0];
    private Map packageInfos = new HashMap();
    private boolean taskSuccess = true;
    private boolean includeDestClasses = true;
    private CompilerAdapter nestedAdapter = null;
    private boolean createMissingPackageInfoClass = true;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Javac$ImplementationSpecificArgument.class */
    public class ImplementationSpecificArgument extends org.apache.tools.ant.util.facade.ImplementationSpecificArgument {
        private final Javac this$0;

        public ImplementationSpecificArgument(Javac javac) {
            this.this$0 = javac;
        }

        public void setCompiler(String str) {
            super.setImplementation(str);
        }
    }

    public Javac() {
        this.facade = null;
        this.facade = new FacadeTaskHelper(assumedJavaVersion());
    }

    private String assumedJavaVersion() {
        return JavaEnvUtils.isJavaVersion("1.4") ? JAVAC14 : JavaEnvUtils.isJavaVersion(JavaEnvUtils.JAVA_1_5) ? JAVAC15 : JavaEnvUtils.isJavaVersion(JavaEnvUtils.JAVA_1_6) ? JAVAC16 : JavaEnvUtils.isJavaVersion(JavaEnvUtils.JAVA_1_7) ? JAVAC17 : JavaEnvUtils.isJavaVersion(JavaEnvUtils.JAVA_1_8) ? JAVAC18 : CLASSIC;
    }

    private String[] findSupportedFileExtensions() {
        CompilerAdapter compiler = this.nestedAdapter != null ? this.nestedAdapter : CompilerAdapterFactory.getCompiler(getCompiler(), this, createCompilerClasspath());
        String[] strArr = null;
        if (compiler instanceof CompilerAdapterExtension) {
            strArr = ((CompilerAdapterExtension) compiler).getSupportedFileExtensions();
        }
        String[] strArr2 = strArr;
        if (strArr == null) {
            strArr2 = new String[]{"java"};
        }
        for (int i = 0; i < strArr2.length; i++) {
            if (!strArr2[i].startsWith("*.")) {
                strArr2[i] = new StringBuffer().append("*.").append(strArr2[i]).toString();
            }
        }
        return strArr2;
    }

    private void generateMissingPackageInfoClasses(File file) throws IOException {
        for (Map.Entry entry : this.packageInfos.entrySet()) {
            String str = (String) entry.getKey();
            Long l = (Long) entry.getValue();
            File file2 = new File(file, str.replace('/', File.separatorChar));
            file2.mkdirs();
            File file3 = new File(file2, "package-info.class");
            if (!file3.isFile() || file3.lastModified() < l.longValue()) {
                log(new StringBuffer().append("Creating empty ").append(file3).toString());
                FileOutputStream fileOutputStream = new FileOutputStream(file3);
                try {
                    fileOutputStream.write(PACKAGE_INFO_CLASS_HEADER);
                    byte[] bytes = str.getBytes("UTF-8");
                    int length = bytes.length + 13;
                    fileOutputStream.write(((byte) length) / 256);
                    fileOutputStream.write(((byte) length) % 256);
                    fileOutputStream.write(bytes);
                    fileOutputStream.write(PACKAGE_INFO_CLASS_FOOTER);
                } finally {
                    fileOutputStream.close();
                }
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x00a0, code lost:
        if (org.apache.tools.ant.taskdefs.Javac.JAVAC13.equalsIgnoreCase(r0) == false) goto L36;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private String getAltCompilerName(String str) {
        String str2;
        if (JAVAC17.equalsIgnoreCase(str) || JAVAC18.equalsIgnoreCase(str) || JAVAC16.equalsIgnoreCase(str) || JAVAC15.equalsIgnoreCase(str) || JAVAC14.equalsIgnoreCase(str) || JAVAC13.equalsIgnoreCase(str)) {
            str2 = MODERN;
        } else if (JAVAC12.equalsIgnoreCase(str) || JAVAC11.equalsIgnoreCase(str)) {
            str2 = CLASSIC;
        } else {
            if (MODERN.equalsIgnoreCase(str)) {
                String assumedJavaVersion = assumedJavaVersion();
                str2 = assumedJavaVersion;
                if (!JAVAC17.equalsIgnoreCase(assumedJavaVersion)) {
                    str2 = assumedJavaVersion;
                    if (!JAVAC18.equalsIgnoreCase(assumedJavaVersion)) {
                        str2 = assumedJavaVersion;
                        if (!JAVAC16.equalsIgnoreCase(assumedJavaVersion)) {
                            str2 = assumedJavaVersion;
                            if (!JAVAC15.equalsIgnoreCase(assumedJavaVersion)) {
                                str2 = assumedJavaVersion;
                                if (!JAVAC14.equalsIgnoreCase(assumedJavaVersion)) {
                                    str2 = assumedJavaVersion;
                                }
                            }
                        }
                    }
                }
            }
            str2 = CLASSIC.equalsIgnoreCase(str) ? assumedJavaVersion() : EXTJAVAC.equalsIgnoreCase(str) ? assumedJavaVersion() : null;
        }
        return str2;
    }

    private void lookForPackageInfos(File file, File[] fileArr) {
        for (File file2 : fileArr) {
            if (file2.getName().equals("package-info.java")) {
                String replace = FILE_UTILS.removeLeadingPath(file, file2).replace(File.separatorChar, '/');
                if (!replace.endsWith("/package-info.java")) {
                    log(new StringBuffer().append("anomalous package-info.java path: ").append(replace).toString(), 1);
                } else {
                    this.packageInfos.put(replace.substring(0, replace.length() - "/package-info.java".length()), new Long(file2.lastModified()));
                }
            }
        }
    }

    public void add(CompilerAdapter compilerAdapter) {
        if (this.nestedAdapter != null) {
            throw new BuildException("Can't have more than one compiler adapter");
        }
        this.nestedAdapter = compilerAdapter;
    }

    protected void checkParameters() throws BuildException {
        if (this.src == null) {
            throw new BuildException("srcdir attribute must be set!", getLocation());
        }
        if (this.src.size() == 0) {
            throw new BuildException("srcdir attribute must be set!", getLocation());
        }
        if (this.destDir != null && !this.destDir.isDirectory()) {
            throw new BuildException(new StringBuffer().append("destination directory \"").append(this.destDir).append("\" does not exist ").append("or is not a directory").toString(), getLocation());
        }
        if (this.includeAntRuntime != null || getProject().getProperty(MagicNames.BUILD_SYSCLASSPATH) != null) {
            return;
        }
        log(new StringBuffer().append(getLocation()).append("warning: 'includeantruntime' was not set, ").append("defaulting to build.sysclasspath=last; set to false for repeatable builds").toString(), 1);
    }

    protected void compile() {
        String compiler = getCompiler();
        if (this.compileList.length > 0) {
            log(new StringBuffer().append("Compiling ").append(this.compileList.length).append(" source file").append(this.compileList.length == 1 ? "" : "s").append(this.destDir != null ? new StringBuffer().append(" to ").append(this.destDir).toString() : "").toString());
            if (this.listFiles) {
                for (int i = 0; i < this.compileList.length; i++) {
                    log(this.compileList[i].getAbsolutePath());
                }
            }
            CompilerAdapter compiler2 = this.nestedAdapter != null ? this.nestedAdapter : CompilerAdapterFactory.getCompiler(compiler, this, createCompilerClasspath());
            compiler2.setJavac(this);
            if (compiler2.execute()) {
                if (!this.createMissingPackageInfoClass) {
                    return;
                }
                try {
                    generateMissingPackageInfoClasses(this.destDir != null ? this.destDir : getProject().resolveFile(this.src.list()[0]));
                    return;
                } catch (IOException e) {
                    throw new BuildException(e, getLocation());
                }
            }
            this.taskSuccess = false;
            if (this.errorProperty != null) {
                getProject().setNewProperty(this.errorProperty, "true");
            }
            if (this.failOnError) {
                throw new BuildException(FAIL_MSG, getLocation());
            }
            log(FAIL_MSG, 0);
        }
    }

    public Path createBootclasspath() {
        if (this.bootclasspath == null) {
            this.bootclasspath = new Path(getProject());
        }
        return this.bootclasspath.createPath();
    }

    public Path createClasspath() {
        if (this.compileClasspath == null) {
            this.compileClasspath = new Path(getProject());
        }
        return this.compileClasspath.createPath();
    }

    public ImplementationSpecificArgument createCompilerArg() {
        ImplementationSpecificArgument implementationSpecificArgument = new ImplementationSpecificArgument(this);
        this.facade.addImplementationArgument(implementationSpecificArgument);
        return implementationSpecificArgument;
    }

    public Path createCompilerClasspath() {
        return this.facade.getImplementationClasspath(getProject());
    }

    public Path createExtdirs() {
        if (this.extdirs == null) {
            this.extdirs = new Path(getProject());
        }
        return this.extdirs.createPath();
    }

    public Path createSourcepath() {
        if (this.compileSourcepath == null) {
            this.compileSourcepath = new Path(getProject());
        }
        return this.compileSourcepath.createPath();
    }

    public Path createSrc() {
        if (this.src == null) {
            this.src = new Path(getProject());
        }
        return this.src.createPath();
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        checkParameters();
        resetFileLists();
        for (String str : this.src.list()) {
            File resolveFile = getProject().resolveFile(str);
            if (!resolveFile.exists()) {
                throw new BuildException(new StringBuffer().append("srcdir \"").append(resolveFile.getPath()).append("\" does not exist!").toString(), getLocation());
            }
            scanDir(resolveFile, this.destDir != null ? this.destDir : resolveFile, getDirectoryScanner(resolveFile).getIncludedFiles());
        }
        compile();
        if (this.updatedProperty == null || !this.taskSuccess || this.compileList.length == 0) {
            return;
        }
        getProject().setNewProperty(this.updatedProperty, "true");
    }

    public Path getBootclasspath() {
        return this.bootclasspath;
    }

    public Path getClasspath() {
        return this.compileClasspath;
    }

    public String getCompiler() {
        String compilerVersion = getCompilerVersion();
        String str = compilerVersion;
        if (this.fork) {
            if (isJdkCompiler(compilerVersion)) {
                str = EXTJAVAC;
            } else {
                log("Since compiler setting isn't classic or modern, ignoring fork setting.", 1);
                str = compilerVersion;
            }
        }
        return str;
    }

    public String getCompilerVersion() {
        this.facade.setMagicValue(getProject().getProperty("build.compiler"));
        return this.facade.getImplementation();
    }

    public String[] getCurrentCompilerArgs() {
        String explicitChoice = this.facade.getExplicitChoice();
        try {
            this.facade.setImplementation(getCompiler());
            String[] args = this.facade.getArgs();
            String altCompilerName = getAltCompilerName(this.facade.getImplementation());
            String[] strArr = args;
            if (args.length == 0) {
                strArr = args;
                if (altCompilerName != null) {
                    this.facade.setImplementation(altCompilerName);
                    strArr = this.facade.getArgs();
                }
            }
            this.facade.setImplementation(explicitChoice);
            return strArr;
        } catch (Throwable th) {
            this.facade.setImplementation(explicitChoice);
            throw th;
        }
    }

    public boolean getDebug() {
        return this.debug;
    }

    public String getDebugLevel() {
        return this.debugLevel;
    }

    public boolean getDepend() {
        return this.depend;
    }

    public boolean getDeprecation() {
        return this.deprecation;
    }

    public File getDestdir() {
        return this.destDir;
    }

    public String getEncoding() {
        return this.encoding;
    }

    public String getExecutable() {
        return this.forkedExecutable;
    }

    public Path getExtdirs() {
        return this.extdirs;
    }

    public boolean getFailonerror() {
        return this.failOnError;
    }

    public File[] getFileList() {
        return this.compileList;
    }

    public boolean getIncludeantruntime() {
        return this.includeAntRuntime != null ? this.includeAntRuntime.booleanValue() : true;
    }

    public boolean getIncludejavaruntime() {
        return this.includeJavaRuntime;
    }

    public String getJavacExecutable() {
        if (this.forkedExecutable == null && isForkedJavac()) {
            this.forkedExecutable = getSystemJavac();
        } else if (this.forkedExecutable != null && !isForkedJavac()) {
            this.forkedExecutable = null;
        }
        return this.forkedExecutable;
    }

    public boolean getListfiles() {
        return this.listFiles;
    }

    public String getMemoryInitialSize() {
        return this.memoryInitialSize;
    }

    public String getMemoryMaximumSize() {
        return this.memoryMaximumSize;
    }

    public boolean getNowarn() {
        return this.nowarn;
    }

    public boolean getOptimize() {
        return this.optimize;
    }

    public String getSource() {
        return this.source != null ? this.source : getProject().getProperty(MagicNames.BUILD_JAVAC_SOURCE);
    }

    public Path getSourcepath() {
        return this.compileSourcepath;
    }

    public Path getSrcdir() {
        return this.src;
    }

    protected String getSystemJavac() {
        return JavaEnvUtils.getJdkExecutable("javac");
    }

    public String getTarget() {
        return this.targetAttribute != null ? this.targetAttribute : getProject().getProperty(MagicNames.BUILD_JAVAC_TARGET);
    }

    public boolean getTaskSuccess() {
        return this.taskSuccess;
    }

    public File getTempdir() {
        return this.tmpDir;
    }

    public boolean getVerbose() {
        return this.verbose;
    }

    public boolean isForkedJavac() {
        return this.fork || EXTJAVAC.equalsIgnoreCase(getCompiler());
    }

    public boolean isIncludeDestClasses() {
        return this.includeDestClasses;
    }

    protected boolean isJdkCompiler(String str) {
        return MODERN.equals(str) || CLASSIC.equals(str) || JAVAC18.equals(str) || JAVAC17.equals(str) || JAVAC16.equals(str) || JAVAC15.equals(str) || JAVAC14.equals(str) || JAVAC13.equals(str) || JAVAC12.equals(str) || JAVAC11.equals(str);
    }

    protected Path recreateSrc() {
        this.src = null;
        return createSrc();
    }

    protected void resetFileLists() {
        this.compileList = new File[0];
        this.packageInfos = new HashMap();
    }

    protected void scanDir(File file, File file2, String[] strArr) {
        GlobPatternMapper globPatternMapper = new GlobPatternMapper();
        for (String str : findSupportedFileExtensions()) {
            globPatternMapper.setFrom(str);
            globPatternMapper.setTo("*.class");
            File[] restrictAsFiles = new SourceFileScanner(this).restrictAsFiles(strArr, file, file2, globPatternMapper);
            if (restrictAsFiles.length > 0) {
                lookForPackageInfos(file, restrictAsFiles);
                File[] fileArr = new File[this.compileList.length + restrictAsFiles.length];
                System.arraycopy(this.compileList, 0, fileArr, 0, this.compileList.length);
                System.arraycopy(restrictAsFiles, 0, fileArr, this.compileList.length, restrictAsFiles.length);
                this.compileList = fileArr;
            }
        }
    }

    public void setBootClasspathRef(Reference reference) {
        createBootclasspath().setRefid(reference);
    }

    public void setBootclasspath(Path path) {
        if (this.bootclasspath == null) {
            this.bootclasspath = path;
        } else {
            this.bootclasspath.append(path);
        }
    }

    public void setClasspath(Path path) {
        if (this.compileClasspath == null) {
            this.compileClasspath = path;
        } else {
            this.compileClasspath.append(path);
        }
    }

    public void setClasspathRef(Reference reference) {
        createClasspath().setRefid(reference);
    }

    public void setCompiler(String str) {
        this.facade.setImplementation(str);
    }

    public void setCreateMissingPackageInfoClass(boolean z) {
        this.createMissingPackageInfoClass = z;
    }

    public void setDebug(boolean z) {
        this.debug = z;
    }

    public void setDebugLevel(String str) {
        this.debugLevel = str;
    }

    public void setDepend(boolean z) {
        this.depend = z;
    }

    public void setDeprecation(boolean z) {
        this.deprecation = z;
    }

    public void setDestdir(File file) {
        this.destDir = file;
    }

    public void setEncoding(String str) {
        this.encoding = str;
    }

    public void setErrorProperty(String str) {
        this.errorProperty = str;
    }

    public void setExecutable(String str) {
        this.forkedExecutable = str;
    }

    public void setExtdirs(Path path) {
        if (this.extdirs == null) {
            this.extdirs = path;
        } else {
            this.extdirs.append(path);
        }
    }

    public void setFailonerror(boolean z) {
        this.failOnError = z;
    }

    public void setFork(boolean z) {
        this.fork = z;
    }

    public void setIncludeDestClasses(boolean z) {
        this.includeDestClasses = z;
    }

    public void setIncludeantruntime(boolean z) {
        this.includeAntRuntime = Boolean.valueOf(z);
    }

    public void setIncludejavaruntime(boolean z) {
        this.includeJavaRuntime = z;
    }

    public void setListfiles(boolean z) {
        this.listFiles = z;
    }

    public void setMemoryInitialSize(String str) {
        this.memoryInitialSize = str;
    }

    public void setMemoryMaximumSize(String str) {
        this.memoryMaximumSize = str;
    }

    public void setNowarn(boolean z) {
        this.nowarn = z;
    }

    public void setOptimize(boolean z) {
        this.optimize = z;
    }

    public void setProceed(boolean z) {
        this.failOnError = !z;
    }

    public void setSource(String str) {
        this.source = str;
    }

    public void setSourcepath(Path path) {
        if (this.compileSourcepath == null) {
            this.compileSourcepath = path;
        } else {
            this.compileSourcepath.append(path);
        }
    }

    public void setSourcepathRef(Reference reference) {
        createSourcepath().setRefid(reference);
    }

    public void setSrcdir(Path path) {
        if (this.src == null) {
            this.src = path;
        } else {
            this.src.append(path);
        }
    }

    public void setTarget(String str) {
        this.targetAttribute = str;
    }

    public void setTempdir(File file) {
        this.tmpDir = file;
    }

    public void setUpdatedProperty(String str) {
        this.updatedProperty = str;
    }

    public void setVerbose(boolean z) {
        this.verbose = z;
    }
}
