package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.util.Vector;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.rmic.RmicAdapter;
import org.apache.tools.ant.taskdefs.rmic.RmicAdapterFactory;
import org.apache.tools.ant.types.FilterSetCollection;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.SourceFileScanner;
import org.apache.tools.ant.util.StringUtils;
import org.apache.tools.ant.util.facade.FacadeTaskHelper;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Rmic.class */
public class Rmic extends MatchingTask {
    public static final String ERROR_BASE_NOT_SET = "base or destdir attribute must be set!";
    public static final String ERROR_LOADING_CAUSED_EXCEPTION = ". Loading caused Exception: ";
    public static final String ERROR_NOT_A_DIR = "base or destdir is not a directory:";
    public static final String ERROR_NOT_DEFINED = ". It is not defined.";
    public static final String ERROR_NOT_FOUND = ". It could not be found.";
    public static final String ERROR_NO_BASE_EXISTS = "base or destdir does not exist: ";
    public static final String ERROR_RMIC_FAILED = "Rmic failed; see the compiler error output for details.";
    public static final String ERROR_UNABLE_TO_VERIFY_CLASS = "Unable to verify class ";
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    static Class class$java$rmi$Remote;
    private File baseDir;
    private String classname;
    private Path compileClasspath;
    private File destDir;
    private Path extDirs;
    private String idlOpts;
    private String iiopOpts;
    private File sourceBase;
    private String stubVersion;
    private boolean verify = false;
    private boolean filtering = false;
    private boolean iiop = false;
    private boolean idl = false;
    private boolean debug = false;
    private boolean includeAntRuntime = true;
    private boolean includeJavaRuntime = false;
    private Vector compileList = new Vector();
    private AntClassLoader loader = null;
    private String executable = null;
    private boolean listFiles = false;
    private RmicAdapter nestedAdapter = null;
    private FacadeTaskHelper facade = new FacadeTaskHelper("default");

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Rmic$ImplementationSpecificArgument.class */
    public class ImplementationSpecificArgument extends org.apache.tools.ant.util.facade.ImplementationSpecificArgument {
        private final Rmic this$0;

        public ImplementationSpecificArgument(Rmic rmic) {
            this.this$0 = rmic;
        }

        public void setCompiler(String str) {
            super.setImplementation(str);
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private boolean isValidRmiRemote(Class cls) {
        return getRemoteInterface(cls) != null;
    }

    private void moveGeneratedFile(File file, File file2, String str, RmicAdapter rmicAdapter) throws BuildException {
        String[] mapFileName;
        for (String str2 : rmicAdapter.getMapper().mapFileName(new StringBuffer().append(str.replace('.', File.separatorChar)).append(".class").toString())) {
            if (str2.endsWith(".class")) {
                String stringBuffer = new StringBuffer().append(StringUtils.removeSuffix(str2, ".class")).append(".java").toString();
                File file3 = new File(file, stringBuffer);
                if (file3.exists()) {
                    File file4 = new File(file2, stringBuffer);
                    try {
                        if (this.filtering) {
                            FILE_UTILS.copyFile(file3, file4, new FilterSetCollection(getProject().getGlobalFilterSet()));
                        } else {
                            FILE_UTILS.copyFile(file3, file4);
                        }
                        file3.delete();
                    } catch (IOException e) {
                        throw new BuildException(new StringBuffer().append("Failed to copy ").append(file3).append(" to ").append(file4).append(" due to ").append(e.getMessage()).toString(), e, getLocation());
                    }
                } else {
                    continue;
                }
            }
        }
    }

    public void add(RmicAdapter rmicAdapter) {
        if (this.nestedAdapter != null) {
            throw new BuildException("Can't have more than one rmic adapter");
        }
        this.nestedAdapter = rmicAdapter;
    }

    protected void cleanup() {
        if (this.loader != null) {
            this.loader.cleanup();
            this.loader = null;
        }
    }

    public Path createClasspath() {
        Path createPath;
        synchronized (this) {
            if (this.compileClasspath == null) {
                this.compileClasspath = new Path(getProject());
            }
            createPath = this.compileClasspath.createPath();
        }
        return createPath;
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
        Path createPath;
        synchronized (this) {
            if (this.extDirs == null) {
                this.extDirs = new Path(getProject());
            }
            createPath = this.extDirs.createPath();
        }
        return createPath;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        try {
            this.compileList.clear();
            File outputDir = getOutputDir();
            if (outputDir == null) {
                throw new BuildException(ERROR_BASE_NOT_SET, getLocation());
            }
            if (!outputDir.exists()) {
                throw new BuildException(new StringBuffer().append(ERROR_NO_BASE_EXISTS).append(outputDir).toString(), getLocation());
            }
            if (!outputDir.isDirectory()) {
                throw new BuildException(new StringBuffer().append(ERROR_NOT_A_DIR).append(outputDir).toString(), getLocation());
            }
            if (this.verify) {
                log("Verify has been turned on.", 3);
            }
            RmicAdapter rmic = this.nestedAdapter != null ? this.nestedAdapter : RmicAdapterFactory.getRmic(getCompiler(), this, createCompilerClasspath());
            rmic.setRmic(this);
            this.loader = getProject().createClassLoader(rmic.getClasspath());
            if (this.classname == null) {
                scanDir(this.baseDir, getDirectoryScanner(this.baseDir).getIncludedFiles(), rmic.getMapper());
            } else {
                String stringBuffer = new StringBuffer().append(this.classname.replace('.', File.separatorChar)).append(".class").toString();
                if (new File(this.baseDir, stringBuffer).isFile()) {
                    scanDir(this.baseDir, new String[]{stringBuffer}, rmic.getMapper());
                } else {
                    this.compileList.add(this.classname);
                }
            }
            int size = this.compileList.size();
            if (size > 0) {
                log(new StringBuffer().append("RMI Compiling ").append(size).append(" class").append(size > 1 ? "es" : "").append(" to ").append(outputDir).toString(), 2);
                if (this.listFiles) {
                    for (int i = 0; i < size; i++) {
                        log(this.compileList.get(i).toString());
                    }
                }
                if (!rmic.execute()) {
                    throw new BuildException(ERROR_RMIC_FAILED, getLocation());
                }
            }
            if (this.sourceBase != null && !outputDir.equals(this.sourceBase) && size > 0) {
                if (this.idl) {
                    log("Cannot determine sourcefiles in idl mode, ", 1);
                    log("sourcebase attribute will be ignored.", 1);
                } else {
                    for (int i2 = 0; i2 < size; i2++) {
                        moveGeneratedFile(outputDir, this.sourceBase, (String) this.compileList.elementAt(i2), rmic);
                    }
                }
            }
        } finally {
            cleanup();
        }
    }

    public File getBase() {
        return this.baseDir;
    }

    public String getClassname() {
        return this.classname;
    }

    public Path getClasspath() {
        return this.compileClasspath;
    }

    public Vector getCompileList() {
        return this.compileList;
    }

    public String getCompiler() {
        this.facade.setMagicValue(getProject().getProperty("build.rmic"));
        return this.facade.getImplementation();
    }

    public String[] getCurrentCompilerArgs() {
        getCompiler();
        return this.facade.getArgs();
    }

    public boolean getDebug() {
        return this.debug;
    }

    public File getDestdir() {
        return this.destDir;
    }

    public String getExecutable() {
        return this.executable;
    }

    public Path getExtdirs() {
        return this.extDirs;
    }

    public Vector getFileList() {
        return this.compileList;
    }

    public boolean getFiltering() {
        return this.filtering;
    }

    public boolean getIdl() {
        return this.idl;
    }

    public String getIdlopts() {
        return this.idlOpts;
    }

    public boolean getIiop() {
        return this.iiop;
    }

    public String getIiopopts() {
        return this.iiopOpts;
    }

    public boolean getIncludeantruntime() {
        return this.includeAntRuntime;
    }

    public boolean getIncludejavaruntime() {
        return this.includeJavaRuntime;
    }

    public ClassLoader getLoader() {
        return this.loader;
    }

    public File getOutputDir() {
        return getDestdir() != null ? getDestdir() : getBase();
    }

    public Class getRemoteInterface(Class cls) {
        Class cls2;
        Class<?> cls3;
        Class<?>[] interfaces;
        Class cls4;
        if (class$java$rmi$Remote == null) {
            cls2 = class$("java.rmi.Remote");
            class$java$rmi$Remote = cls2;
        } else {
            cls2 = class$java$rmi$Remote;
        }
        if (cls2.isAssignableFrom(cls) && (interfaces = cls.getInterfaces()) != null) {
            for (int i = 0; i < interfaces.length; i++) {
                if (class$java$rmi$Remote == null) {
                    cls4 = class$("java.rmi.Remote");
                    class$java$rmi$Remote = cls4;
                } else {
                    cls4 = class$java$rmi$Remote;
                }
                if (cls4.isAssignableFrom(interfaces[i])) {
                    cls3 = interfaces[i];
                    break;
                }
            }
        }
        cls3 = null;
        return cls3;
    }

    public File getSourceBase() {
        return this.sourceBase;
    }

    public String getStubVersion() {
        return this.stubVersion;
    }

    public boolean getVerify() {
        return this.verify;
    }

    public boolean isValidRmiRemote(String str) {
        boolean z;
        try {
            Class<?> loadClass = this.loader.loadClass(str);
            z = (!loadClass.isInterface() || this.iiop || this.idl) ? isValidRmiRemote(loadClass) : false;
        } catch (ClassNotFoundException e) {
            log(new StringBuffer().append(ERROR_UNABLE_TO_VERIFY_CLASS).append(str).append(ERROR_NOT_FOUND).toString(), 1);
            z = false;
        } catch (NoClassDefFoundError e2) {
            log(new StringBuffer().append(ERROR_UNABLE_TO_VERIFY_CLASS).append(str).append(ERROR_NOT_DEFINED).toString(), 1);
            z = false;
        } catch (Throwable th) {
            log(new StringBuffer().append(ERROR_UNABLE_TO_VERIFY_CLASS).append(str).append(ERROR_LOADING_CAUSED_EXCEPTION).append(th.getMessage()).toString(), 1);
            z = false;
        }
        return z;
    }

    protected void scanDir(File file, String[] strArr, FileNameMapper fileNameMapper) {
        String[] strArr2 = strArr;
        if (this.idl) {
            log("will leave uptodate test to rmic implementation in idl mode.", 3);
        } else if (!this.iiop || this.iiopOpts == null || this.iiopOpts.indexOf("-always") <= -1) {
            strArr2 = new SourceFileScanner(this).restrict(strArr, file, getOutputDir(), fileNameMapper);
        } else {
            log("no uptodate test as -always option has been specified", 3);
        }
        for (String str : strArr2) {
            String replace = str.replace(File.separatorChar, '.');
            this.compileList.addElement(replace.substring(0, replace.lastIndexOf(".class")));
        }
    }

    public void setBase(File file) {
        this.baseDir = file;
    }

    public void setClassname(String str) {
        this.classname = str;
    }

    public void setClasspath(Path path) {
        synchronized (this) {
            if (this.compileClasspath == null) {
                this.compileClasspath = path;
            } else {
                this.compileClasspath.append(path);
            }
        }
    }

    public void setClasspathRef(Reference reference) {
        createClasspath().setRefid(reference);
    }

    public void setCompiler(String str) {
        if (str.length() > 0) {
            this.facade.setImplementation(str);
        }
    }

    public void setDebug(boolean z) {
        this.debug = z;
    }

    public void setDestdir(File file) {
        this.destDir = file;
    }

    public void setExecutable(String str) {
        this.executable = str;
    }

    public void setExtdirs(Path path) {
        synchronized (this) {
            if (this.extDirs == null) {
                this.extDirs = path;
            } else {
                this.extDirs.append(path);
            }
        }
    }

    public void setFiltering(boolean z) {
        this.filtering = z;
    }

    public void setIdl(boolean z) {
        this.idl = z;
    }

    public void setIdlopts(String str) {
        this.idlOpts = str;
    }

    public void setIiop(boolean z) {
        this.iiop = z;
    }

    public void setIiopopts(String str) {
        this.iiopOpts = str;
    }

    public void setIncludeantruntime(boolean z) {
        this.includeAntRuntime = z;
    }

    public void setIncludejavaruntime(boolean z) {
        this.includeJavaRuntime = z;
    }

    public void setListfiles(boolean z) {
        this.listFiles = z;
    }

    public void setSourceBase(File file) {
        this.sourceBase = file;
    }

    public void setStubVersion(String str) {
        this.stubVersion = str;
    }

    public void setVerify(boolean z) {
        this.verify = z;
    }
}
