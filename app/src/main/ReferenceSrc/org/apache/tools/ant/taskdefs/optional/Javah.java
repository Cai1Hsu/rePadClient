package org.apache.tools.ant.taskdefs.optional;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.StringTokenizer;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.taskdefs.optional.javah.JavahAdapter;
import org.apache.tools.ant.taskdefs.optional.javah.JavahAdapterFactory;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.util.StringUtils;
import org.apache.tools.ant.util.facade.FacadeTaskHelper;
import org.apache.tools.ant.util.facade.ImplementationSpecificArgument;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/Javah.class */
public class Javah extends Task {
    private Path bootclasspath;
    private String cls;
    private File destDir;
    private FacadeTaskHelper facade;
    private Vector classes = new Vector(2);
    private Path classpath = null;
    private File outputFile = null;
    private boolean verbose = false;
    private boolean force = false;
    private boolean old = false;
    private boolean stubs = false;
    private Vector files = new Vector();
    private JavahAdapter nestedAdapter = null;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/Javah$ClassArgument.class */
    public class ClassArgument {
        private String name;
        private final Javah this$0;

        public ClassArgument(Javah javah) {
            this.this$0 = javah;
        }

        public String getName() {
            return this.name;
        }

        public void setName(String str) {
            this.name = str;
        }
    }

    public Javah() {
        this.facade = null;
        this.facade = new FacadeTaskHelper(JavahAdapterFactory.getDefault());
    }

    public void add(JavahAdapter javahAdapter) {
        if (this.nestedAdapter != null) {
            throw new BuildException("Can't have more than one javah adapter");
        }
        this.nestedAdapter = javahAdapter;
    }

    public void addFileSet(FileSet fileSet) {
        this.files.add(fileSet);
    }

    public ImplementationSpecificArgument createArg() {
        ImplementationSpecificArgument implementationSpecificArgument = new ImplementationSpecificArgument();
        this.facade.addImplementationArgument(implementationSpecificArgument);
        return implementationSpecificArgument;
    }

    public Path createBootclasspath() {
        if (this.bootclasspath == null) {
            this.bootclasspath = new Path(getProject());
        }
        return this.bootclasspath.createPath();
    }

    public ClassArgument createClass() {
        ClassArgument classArgument = new ClassArgument(this);
        this.classes.addElement(classArgument);
        return classArgument;
    }

    public Path createClasspath() {
        if (this.classpath == null) {
            this.classpath = new Path(getProject());
        }
        return this.classpath.createPath();
    }

    public Path createImplementationClasspath() {
        return this.facade.getImplementationClasspath(getProject());
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (this.cls == null && this.classes.size() == 0 && this.files.size() == 0) {
            throw new BuildException("class attribute must be set!", getLocation());
        }
        if (this.cls != null && this.classes.size() > 0 && this.files.size() > 0) {
            throw new BuildException("set class attribute OR class element OR fileset, not 2 or more of them.", getLocation());
        }
        if (this.destDir != null) {
            if (!this.destDir.isDirectory()) {
                throw new BuildException(new StringBuffer().append("destination directory \"").append(this.destDir).append("\" does not exist or is not a directory").toString(), getLocation());
            }
            if (this.outputFile != null) {
                throw new BuildException("destdir and outputFile are mutually exclusive", getLocation());
            }
        }
        if (this.classpath == null) {
            this.classpath = new Path(getProject()).concatSystemClasspath("last");
        } else {
            this.classpath = this.classpath.concatSystemClasspath(Definer.OnError.POLICY_IGNORE);
        }
        if ((this.nestedAdapter != null ? this.nestedAdapter : JavahAdapterFactory.getAdapter(this.facade.getImplementation(), this, createImplementationClasspath())).compile(this)) {
            return;
        }
        throw new BuildException("compilation failed");
    }

    public Path getBootclasspath() {
        return this.bootclasspath;
    }

    public String[] getClasses() {
        ArrayList arrayList = new ArrayList();
        if (this.cls != null) {
            StringTokenizer stringTokenizer = new StringTokenizer(this.cls, ",", false);
            while (stringTokenizer.hasMoreTokens()) {
                arrayList.add(stringTokenizer.nextToken().trim());
            }
        }
        if (this.files.size() > 0) {
            Enumeration elements = this.files.elements();
            while (elements.hasMoreElements()) {
                String[] includedFiles = ((FileSet) elements.nextElement()).getDirectoryScanner(getProject()).getIncludedFiles();
                for (int i = 0; i < includedFiles.length; i++) {
                    arrayList.add(includedFiles[i].replace('\\', '.').replace('/', '.').substring(0, includedFiles[i].length() - 6));
                }
            }
        }
        Enumeration elements2 = this.classes.elements();
        while (elements2.hasMoreElements()) {
            arrayList.add(((ClassArgument) elements2.nextElement()).getName());
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    public Path getClasspath() {
        return this.classpath;
    }

    public String[] getCurrentArgs() {
        return this.facade.getArgs();
    }

    public File getDestdir() {
        return this.destDir;
    }

    public boolean getForce() {
        return this.force;
    }

    public boolean getOld() {
        return this.old;
    }

    public File getOutputfile() {
        return this.outputFile;
    }

    public boolean getStubs() {
        return this.stubs;
    }

    public boolean getVerbose() {
        return this.verbose;
    }

    public void logAndAddFiles(Commandline commandline) {
        logAndAddFilesToCompile(commandline);
    }

    protected void logAndAddFilesToCompile(Commandline commandline) {
        log(new StringBuffer().append("Compilation ").append(commandline.describeArguments()).toString(), 3);
        StringBuffer stringBuffer = new StringBuffer();
        String[] classes = getClasses();
        for (int i = 0; i < classes.length; i++) {
            commandline.createArgument().setValue(classes[i]);
            stringBuffer.append("    ");
            stringBuffer.append(classes[i]);
            stringBuffer.append(StringUtils.LINE_SEP);
        }
        StringBuffer stringBuffer2 = new StringBuffer("Class");
        if (classes.length > 1) {
            stringBuffer2.append("es");
        }
        stringBuffer2.append(" to be compiled:");
        stringBuffer2.append(StringUtils.LINE_SEP);
        log(new StringBuffer().append(stringBuffer2.toString()).append(stringBuffer.toString()).toString(), 3);
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

    public void setClass(String str) {
        this.cls = str;
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

    public void setDestdir(File file) {
        this.destDir = file;
    }

    public void setForce(boolean z) {
        this.force = z;
    }

    public void setImplementation(String str) {
        if ("default".equals(str)) {
            this.facade.setImplementation(JavahAdapterFactory.getDefault());
        } else {
            this.facade.setImplementation(str);
        }
    }

    public void setOld(boolean z) {
        this.old = z;
    }

    public void setOutputFile(File file) {
        this.outputFile = file;
    }

    public void setStubs(boolean z) {
        this.stubs = z;
    }

    public void setVerbose(boolean z) {
        this.verbose = z;
    }
}
