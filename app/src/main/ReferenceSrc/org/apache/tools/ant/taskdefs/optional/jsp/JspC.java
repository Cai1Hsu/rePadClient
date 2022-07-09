package org.apache.tools.ant.taskdefs.optional.jsp;

import java.io.File;
import java.util.Date;
import java.util.Enumeration;
import java.util.Vector;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.MatchingTask;
import org.apache.tools.ant.taskdefs.optional.jsp.compilers.JspCompilerAdapter;
import org.apache.tools.ant.taskdefs.optional.jsp.compilers.JspCompilerAdapterFactory;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/jsp/JspC.class */
public class JspC extends MatchingTask {
    private static final String FAIL_MSG = "Compile failed, messages should have been provided.";
    private Path classpath;
    private Path compilerClasspath;
    private File destDir;
    private String iepluginid;
    private boolean mapped;
    private String packageName;
    private Path src;
    private File uriroot;
    protected WebAppParameter webApp;
    private File webinc;
    private File webxml;
    private String compilerName = "jasper";
    private int verbose = 0;
    protected Vector compileList = new Vector();
    Vector javaFiles = new Vector();
    protected boolean failOnError = true;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/jsp/JspC$WebAppParameter.class */
    public static class WebAppParameter {
        private File directory;

        public File getDirectory() {
            return this.directory;
        }

        public void setBaseDir(File file) {
            this.directory = file;
        }
    }

    private void doCompilation(JspCompilerAdapter jspCompilerAdapter) throws BuildException {
        jspCompilerAdapter.setJspc(this);
        if (!jspCompilerAdapter.execute()) {
            if (this.failOnError) {
                throw new BuildException(FAIL_MSG, getLocation());
            }
            log(FAIL_MSG, 0);
        }
    }

    private File getActualDestDir() {
        return this.packageName == null ? this.destDir : new File(new StringBuffer().append(this.destDir.getPath()).append(File.separatorChar).append(this.packageName.replace('.', File.separatorChar)).toString());
    }

    private boolean isCompileNeeded(File file, File file2) {
        boolean z = false;
        if (!file2.exists()) {
            z = true;
            log(new StringBuffer().append("Compiling ").append(file.getPath()).append(" because java file ").append(file2.getPath()).append(" does not exist").toString(), 3);
        } else if (file.lastModified() > file2.lastModified()) {
            z = true;
            log(new StringBuffer().append("Compiling ").append(file.getPath()).append(" because it is out of date with respect to ").append(file2.getPath()).toString(), 3);
        } else if (file2.length() == 0) {
            z = true;
            log(new StringBuffer().append("Compiling ").append(file.getPath()).append(" because java file ").append(file2.getPath()).append(" is empty").toString(), 3);
        }
        return z;
    }

    public void addWebApp(WebAppParameter webAppParameter) throws BuildException {
        if (this.webApp == null) {
            this.webApp = webAppParameter;
            return;
        }
        throw new BuildException("Only one webapp can be specified");
    }

    public Path createClasspath() {
        if (this.classpath == null) {
            this.classpath = new Path(getProject());
        }
        return this.classpath.createPath();
    }

    public Path createCompilerclasspath() {
        if (this.compilerClasspath == null) {
            this.compilerClasspath = new Path(getProject());
        }
        return this.compilerClasspath.createPath();
    }

    public void deleteEmptyJavaFiles() {
        if (this.javaFiles != null) {
            Enumeration elements = this.javaFiles.elements();
            while (elements.hasMoreElements()) {
                File file = (File) elements.nextElement();
                if (file.exists() && file.length() == 0) {
                    log(new StringBuffer().append("deleting empty output file ").append(file).toString());
                    file.delete();
                }
            }
        }
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (this.destDir == null) {
            throw new BuildException("destdir attribute must be set!", getLocation());
        }
        if (!this.destDir.isDirectory()) {
            throw new BuildException(new StringBuffer().append("destination directory \"").append(this.destDir).append("\" does not exist or is not a directory").toString(), getLocation());
        }
        File actualDestDir = getActualDestDir();
        AntClassLoader antClassLoader = null;
        try {
            String str = this.compilerName;
            antClassLoader = getProject().createClassLoader(this.compilerClasspath);
            JspCompilerAdapter compiler = JspCompilerAdapterFactory.getCompiler(str, this, antClassLoader);
            if (this.webApp != null) {
                doCompilation(compiler);
                if (antClassLoader == null) {
                    return;
                }
                antClassLoader.cleanup();
            } else if (this.src == null) {
                throw new BuildException("srcdir attribute must be set!", getLocation());
            } else {
                String[] list = this.src.list();
                if (list.length == 0) {
                    throw new BuildException("srcdir attribute must be set!", getLocation());
                }
                if (compiler.implementsOwnDependencyChecking()) {
                    doCompilation(compiler);
                    if (antClassLoader == null) {
                        return;
                    }
                    antClassLoader.cleanup();
                    return;
                }
                JspMangler createMangler = compiler.createMangler();
                resetFileLists();
                int i = 0;
                for (String str2 : list) {
                    File resolveFile = getProject().resolveFile(str2);
                    if (!resolveFile.exists()) {
                        throw new BuildException(new StringBuffer().append("srcdir \"").append(resolveFile.getPath()).append("\" does not exist!").toString(), getLocation());
                    }
                    String[] includedFiles = getDirectoryScanner(resolveFile).getIncludedFiles();
                    i = includedFiles.length;
                    scanDir(resolveFile, actualDestDir, createMangler, includedFiles);
                }
                log(new StringBuffer().append("compiling ").append(this.compileList.size()).append(" files").toString(), 3);
                if (this.compileList.size() > 0) {
                    log(new StringBuffer().append("Compiling ").append(this.compileList.size()).append(" source file").append(this.compileList.size() == 1 ? "" : "s").append(" to ").append(actualDestDir).toString());
                    doCompilation(compiler);
                } else if (i == 0) {
                    log("there were no files to compile", 2);
                } else {
                    log("all files are up to date", 3);
                }
            }
        } finally {
            if (antClassLoader != null) {
                antClassLoader.cleanup();
            }
        }
    }

    public Path getClasspath() {
        return this.classpath;
    }

    public Vector getCompileList() {
        return this.compileList;
    }

    public Path getCompilerclasspath() {
        return this.compilerClasspath;
    }

    public File getDestdir() {
        return this.destDir;
    }

    public boolean getFailonerror() {
        return this.failOnError;
    }

    public String getIeplugin() {
        return this.iepluginid;
    }

    public String getPackage() {
        return this.packageName;
    }

    public Path getSrcDir() {
        return this.src;
    }

    public File getUribase() {
        return this.uriroot;
    }

    public File getUriroot() {
        return this.uriroot;
    }

    public int getVerbose() {
        return this.verbose;
    }

    public WebAppParameter getWebApp() {
        return this.webApp;
    }

    public File getWebinc() {
        return this.webinc;
    }

    public File getWebxml() {
        return this.webxml;
    }

    public boolean isMapped() {
        return this.mapped;
    }

    protected File mapToJavaFile(JspMangler jspMangler, File file, File file2, File file3) {
        return !file.getName().endsWith(".jsp") ? null : new File(file3, jspMangler.mapJspToJavaName(file));
    }

    protected void resetFileLists() {
        this.compileList.removeAllElements();
    }

    protected void scanDir(File file, File file2, JspMangler jspMangler, String[] strArr) {
        long time = new Date().getTime();
        for (String str : strArr) {
            File file3 = new File(file, str);
            File mapToJavaFile = mapToJavaFile(jspMangler, file3, file, file2);
            if (mapToJavaFile != null) {
                if (file3.lastModified() > time) {
                    log(new StringBuffer().append("Warning: file modified in the future: ").append(str).toString(), 1);
                }
                if (isCompileNeeded(file3, mapToJavaFile)) {
                    this.compileList.addElement(file3.getAbsolutePath());
                    this.javaFiles.addElement(mapToJavaFile);
                }
            }
        }
    }

    public void setClasspath(Path path) {
        if (this.classpath == null) {
            this.classpath = path;
        } else {
            this.classpath.append(path);
        }
    }

    public void setClasspathRef(Reference reference) {
        createClasspath().setRefid(reference);
    }

    public void setCompiler(String str) {
        this.compilerName = str;
    }

    public void setCompilerclasspath(Path path) {
        if (this.compilerClasspath == null) {
            this.compilerClasspath = path;
        } else {
            this.compilerClasspath.append(path);
        }
    }

    public void setDestdir(File file) {
        this.destDir = file;
    }

    public void setFailonerror(boolean z) {
        this.failOnError = z;
    }

    public void setIeplugin(String str) {
        this.iepluginid = str;
    }

    public void setMapped(boolean z) {
        this.mapped = z;
    }

    public void setPackage(String str) {
        this.packageName = str;
    }

    public void setSrcDir(Path path) {
        if (this.src == null) {
            this.src = path;
        } else {
            this.src.append(path);
        }
    }

    public void setUribase(File file) {
        log("Uribase is currently an unused parameter", 1);
    }

    public void setUriroot(File file) {
        this.uriroot = file;
    }

    public void setVerbose(int i) {
        this.verbose = i;
    }

    public void setWebinc(File file) {
        this.webinc = file;
    }

    public void setWebxml(File file) {
        this.webxml = file;
    }
}
