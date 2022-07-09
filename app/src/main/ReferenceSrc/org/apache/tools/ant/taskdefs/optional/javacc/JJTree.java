package org.apache.tools.ant.taskdefs.optional.javacc;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Hashtable;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.LogStreamHandler;
import org.apache.tools.ant.types.CommandlineJava;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.JavaEnvUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/javacc/JJTree.class */
public class JJTree extends Task {
    private static final String BUILD_NODE_FILES = "BUILD_NODE_FILES";
    private static final String DEFAULT_SUFFIX = ".jj";
    private static final String MULTI = "MULTI";
    private static final String NODE_DEFAULT_VOID = "NODE_DEFAULT_VOID";
    private static final String NODE_FACTORY = "NODE_FACTORY";
    private static final String NODE_PACKAGE = "NODE_PACKAGE";
    private static final String NODE_PREFIX = "NODE_PREFIX";
    private static final String NODE_SCOPE_HOOK = "NODE_SCOPE_HOOK";
    private static final String NODE_USES_PARSER = "NODE_USES_PARSER";
    private static final String OUTPUT_FILE = "OUTPUT_FILE";
    private static final String STATIC = "STATIC";
    private static final String VISITOR = "VISITOR";
    private static final String VISITOR_EXCEPTION = "VISITOR_EXCEPTION";
    private final Hashtable optionalAttrs = new Hashtable();
    private String outputFile = null;
    private File outputDirectory = null;
    private File targetFile = null;
    private File javaccHome = null;
    private CommandlineJava cmdl = new CommandlineJava();
    private String maxMemory = null;

    public JJTree() {
        this.cmdl.setVm(JavaEnvUtils.getJreExecutable("java"));
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x006c, code lost:
        if (r8.equals("") != false) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:5:0x0020, code lost:
        if (r0.equals("") != false) goto L6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private String createOutputFileName(File file, String str, String str2) {
        String str3;
        String str4;
        String validateOutputFile = validateOutputFile(str, str2);
        String replace = file.getAbsolutePath().replace('\\', '/');
        if (validateOutputFile != null) {
            str3 = validateOutputFile;
        }
        int lastIndexOf = replace.lastIndexOf("/");
        String str5 = replace;
        if (lastIndexOf >= 0) {
            str5 = replace.substring(lastIndexOf + 1);
        }
        int lastIndexOf2 = str5.lastIndexOf(46);
        str3 = lastIndexOf2 == -1 ? new StringBuffer().append(str5).append(DEFAULT_SUFFIX).toString() : str5.substring(lastIndexOf2).equals(DEFAULT_SUFFIX) ? new StringBuffer().append(str5).append(DEFAULT_SUFFIX).toString() : new StringBuffer().append(str5.substring(0, lastIndexOf2)).append(DEFAULT_SUFFIX).toString();
        if (str2 != null) {
            str4 = str2;
        }
        str4 = getDefaultOutputDirectory();
        return new StringBuffer().append(str4).append("/").append(str3).toString().replace('\\', '/');
    }

    private String getDefaultOutputDirectory() {
        return getProject().getBaseDir().getAbsolutePath().replace('\\', '/');
    }

    private File getRoot(File file) {
        File absoluteFile = file.getAbsoluteFile();
        while (true) {
            File file2 = absoluteFile;
            if (file2.getParent() != null) {
                absoluteFile = file2.getParentFile();
            } else {
                return file2;
            }
        }
    }

    private String makeOutputFileRelative(String str) {
        StringBuffer stringBuffer = new StringBuffer();
        String defaultOutputDirectory = getDefaultOutputDirectory();
        int indexOf = defaultOutputDirectory.indexOf(47) + 1;
        while (indexOf > -1 && indexOf < defaultOutputDirectory.length()) {
            stringBuffer.append("/..");
            indexOf = defaultOutputDirectory.indexOf(47, indexOf);
            if (indexOf != -1) {
                indexOf++;
            }
        }
        stringBuffer.append(str);
        return stringBuffer.toString();
    }

    private String validateOutputFile(String str, String str2) throws BuildException {
        if (str == null) {
            str = null;
        } else if (str2 != null || (!str.startsWith("/") && !str.startsWith("\\"))) {
            String absolutePath = getRoot(new File(str)).getAbsolutePath();
            if (absolutePath.length() > 1 && str.startsWith(absolutePath.substring(0, absolutePath.length() - 1))) {
                throw new BuildException(new StringBuffer().append("Drive letter in 'outputfile' not supported: ").append(str).toString());
            }
        } else {
            str = makeOutputFileRelative(str);
            setOutputfile(str);
        }
        return str;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        File file;
        Enumeration keys = this.optionalAttrs.keys();
        while (keys.hasMoreElements()) {
            String str = (String) keys.nextElement();
            this.cmdl.createArgument().setValue(new StringBuffer().append("-").append(str).append(":").append(this.optionalAttrs.get(str).toString()).toString());
        }
        if (this.targetFile == null || !this.targetFile.isFile()) {
            throw new BuildException(new StringBuffer().append("Invalid target: ").append(this.targetFile).toString());
        }
        if (this.outputDirectory == null) {
            this.cmdl.createArgument().setValue(new StringBuffer().append("-OUTPUT_DIRECTORY:").append(getDefaultOutputDirectory()).toString());
            file = new File(createOutputFileName(this.targetFile, this.outputFile, null));
        } else if (!this.outputDirectory.isDirectory()) {
            throw new BuildException(new StringBuffer().append("'outputdirectory' ").append(this.outputDirectory).append(" is not a directory.").toString());
        } else {
            this.cmdl.createArgument().setValue(new StringBuffer().append("-OUTPUT_DIRECTORY:").append(this.outputDirectory.getAbsolutePath().replace('\\', '/')).toString());
            file = new File(createOutputFileName(this.targetFile, this.outputFile, this.outputDirectory.getPath()));
        }
        if (file.exists() && this.targetFile.lastModified() < file.lastModified()) {
            log(new StringBuffer().append("Target is already built - skipping (").append(this.targetFile).append(")").toString(), 3);
            return;
        }
        if (this.outputFile != null) {
            this.cmdl.createArgument().setValue(new StringBuffer().append("-OUTPUT_FILE:").append(this.outputFile.replace('\\', '/')).toString());
        }
        this.cmdl.createArgument().setValue(this.targetFile.getAbsolutePath());
        Path createClasspath = this.cmdl.createClasspath(getProject());
        createClasspath.createPathElement().setPath(JavaCC.getArchiveFile(this.javaccHome).getAbsolutePath());
        createClasspath.addJavaRuntime();
        this.cmdl.setClassname(JavaCC.getMainClass(createClasspath, 2));
        this.cmdl.setMaxmemory(this.maxMemory);
        this.cmdl.createVmArgument().setValue(new StringBuffer().append("-Dinstall.root=").append(this.javaccHome.getAbsolutePath()).toString());
        Execute execute = new Execute(new LogStreamHandler((Task) this, 2, 2), null);
        log(this.cmdl.describeCommand(), 3);
        execute.setCommandline(this.cmdl.getCommandline());
        try {
            if (execute.execute() == 0) {
                return;
            }
            throw new BuildException("JJTree failed.");
        } catch (IOException e) {
            throw new BuildException("Failed to launch JJTree", e);
        }
    }

    public void setBuildnodefiles(boolean z) {
        this.optionalAttrs.put(BUILD_NODE_FILES, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setJavacchome(File file) {
        this.javaccHome = file;
    }

    public void setMaxmemory(String str) {
        this.maxMemory = str;
    }

    public void setMulti(boolean z) {
        this.optionalAttrs.put(MULTI, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setNodedefaultvoid(boolean z) {
        this.optionalAttrs.put(NODE_DEFAULT_VOID, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setNodefactory(boolean z) {
        this.optionalAttrs.put(NODE_FACTORY, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setNodepackage(String str) {
        this.optionalAttrs.put(NODE_PACKAGE, str);
    }

    public void setNodeprefix(String str) {
        this.optionalAttrs.put(NODE_PREFIX, str);
    }

    public void setNodescopehook(boolean z) {
        this.optionalAttrs.put(NODE_SCOPE_HOOK, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setNodeusesparser(boolean z) {
        this.optionalAttrs.put(NODE_USES_PARSER, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setOutputdirectory(File file) {
        this.outputDirectory = file;
    }

    public void setOutputfile(String str) {
        this.outputFile = str;
    }

    public void setStatic(boolean z) {
        this.optionalAttrs.put(STATIC, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setTarget(File file) {
        this.targetFile = file;
    }

    public void setVisitor(boolean z) {
        this.optionalAttrs.put(VISITOR, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setVisitorException(String str) {
        this.optionalAttrs.put(VISITOR_EXCEPTION, str);
    }
}
