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

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/javacc/JJDoc.class */
public class JJDoc extends Task {
    private static final String DEFAULT_SUFFIX_HTML = ".html";
    private static final String DEFAULT_SUFFIX_TEXT = ".txt";
    private static final String ONE_TABLE = "ONE_TABLE";
    private static final String OUTPUT_FILE = "OUTPUT_FILE";
    private static final String TEXT = "TEXT";
    private final Hashtable optionalAttrs = new Hashtable();
    private String outputFile = null;
    private boolean plainText = false;
    private File targetFile = null;
    private File javaccHome = null;
    private CommandlineJava cmdl = new CommandlineJava();
    private String maxMemory = null;

    public JJDoc() {
        this.cmdl.setVm(JavaEnvUtils.getJreExecutable("java"));
    }

    private String createOutputFileName(File file, String str, boolean z) {
        String str2;
        String replace = file.getAbsolutePath().replace('\\', '/');
        String str3 = DEFAULT_SUFFIX_HTML;
        if (z) {
            str3 = DEFAULT_SUFFIX_TEXT;
        }
        if (str == null || str.equals("")) {
            int lastIndexOf = replace.lastIndexOf("/");
            String str4 = replace;
            if (lastIndexOf >= 0) {
                str4 = replace.substring(lastIndexOf + 1);
            }
            int lastIndexOf2 = str4.lastIndexOf(46);
            str2 = lastIndexOf2 == -1 ? new StringBuffer().append(str4).append(str3).toString() : str4.substring(lastIndexOf2).equals(str3) ? new StringBuffer().append(str4).append(str3).toString() : new StringBuffer().append(str4.substring(0, lastIndexOf2)).append(str3).toString();
        } else {
            str2 = str.replace('\\', '/');
        }
        return new StringBuffer().append(getProject().getBaseDir()).append("/").append(str2).toString().replace('\\', '/');
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Enumeration keys = this.optionalAttrs.keys();
        while (keys.hasMoreElements()) {
            String str = (String) keys.nextElement();
            this.cmdl.createArgument().setValue(new StringBuffer().append("-").append(str).append(":").append(this.optionalAttrs.get(str).toString()).toString());
        }
        if (this.targetFile == null || !this.targetFile.isFile()) {
            throw new BuildException(new StringBuffer().append("Invalid target: ").append(this.targetFile).toString());
        }
        if (this.outputFile != null) {
            this.cmdl.createArgument().setValue(new StringBuffer().append("-OUTPUT_FILE:").append(this.outputFile.replace('\\', '/')).toString());
        }
        File file = new File(createOutputFileName(this.targetFile, this.outputFile, this.plainText));
        if (file.exists() && this.targetFile.lastModified() < file.lastModified()) {
            log(new StringBuffer().append("Target is already built - skipping (").append(this.targetFile).append(")").toString(), 3);
            return;
        }
        this.cmdl.createArgument().setValue(this.targetFile.getAbsolutePath());
        Path createClasspath = this.cmdl.createClasspath(getProject());
        createClasspath.createPathElement().setPath(JavaCC.getArchiveFile(this.javaccHome).getAbsolutePath());
        createClasspath.addJavaRuntime();
        this.cmdl.setClassname(JavaCC.getMainClass(createClasspath, 3));
        this.cmdl.setMaxmemory(this.maxMemory);
        this.cmdl.createVmArgument().setValue(new StringBuffer().append("-Dinstall.root=").append(this.javaccHome.getAbsolutePath()).toString());
        Execute execute = new Execute(new LogStreamHandler((Task) this, 2, 2), null);
        log(this.cmdl.describeCommand(), 3);
        execute.setCommandline(this.cmdl.getCommandline());
        try {
            if (execute.execute() == 0) {
                return;
            }
            throw new BuildException("JJDoc failed.");
        } catch (IOException e) {
            throw new BuildException("Failed to launch JJDoc", e);
        }
    }

    public void setJavacchome(File file) {
        this.javaccHome = file;
    }

    public void setMaxmemory(String str) {
        this.maxMemory = str;
    }

    public void setOnetable(boolean z) {
        this.optionalAttrs.put(ONE_TABLE, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setOutputfile(String str) {
        this.outputFile = str;
    }

    public void setTarget(File file) {
        this.targetFile = file;
    }

    public void setText(boolean z) {
        this.optionalAttrs.put(TEXT, z ? Boolean.TRUE : Boolean.FALSE);
        this.plainText = z;
    }
}
