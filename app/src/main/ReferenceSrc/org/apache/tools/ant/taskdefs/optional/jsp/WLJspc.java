package org.apache.tools.ant.taskdefs.optional.jsp;

import java.io.File;
import java.util.Date;
import java.util.StringTokenizer;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.taskdefs.Java;
import org.apache.tools.ant.taskdefs.MatchingTask;
import org.apache.tools.ant.types.Path;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/jsp/WLJspc.class */
public class WLJspc extends MatchingTask {
    private Path compileClasspath;
    private File destinationDirectory;
    private String destinationPackage;
    private File sourceDirectory;
    private String pathToPackage = "";
    private Vector filesToDo = new Vector();

    public Path createClasspath() {
        if (this.compileClasspath == null) {
            this.compileClasspath = new Path(getProject());
        }
        return this.compileClasspath;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (!this.destinationDirectory.isDirectory()) {
            throw new BuildException(new StringBuffer().append("destination directory ").append(this.destinationDirectory.getPath()).append(" is not valid").toString());
        }
        if (!this.sourceDirectory.isDirectory()) {
            throw new BuildException(new StringBuffer().append("src directory ").append(this.sourceDirectory.getPath()).append(" is not valid").toString());
        }
        if (this.destinationPackage == null) {
            throw new BuildException("package attribute must be present.", getLocation());
        }
        this.pathToPackage = this.destinationPackage.replace('.', File.separatorChar);
        DirectoryScanner directoryScanner = super.getDirectoryScanner(this.sourceDirectory);
        if (this.compileClasspath == null) {
            this.compileClasspath = new Path(getProject());
        }
        this.compileClasspath = this.compileClasspath.concatSystemClasspath();
        String[] includedFiles = directoryScanner.getIncludedFiles();
        Java java = new Java(this);
        java.setFork(true);
        java.setClassname("weblogic.jspc");
        java.setTaskName(getTaskName());
        String[] strArr = new String[12];
        int i = 0 + 1;
        strArr[0] = "-d";
        int i2 = i + 1;
        strArr[i] = this.destinationDirectory.getAbsolutePath().trim();
        int i3 = i2 + 1;
        strArr[i2] = "-docroot";
        int i4 = i3 + 1;
        strArr[i3] = this.sourceDirectory.getAbsolutePath().trim();
        int i5 = i4 + 1;
        strArr[i4] = "-keepgenerated";
        int i6 = i5 + 1;
        strArr[i5] = "-compilerclass";
        int i7 = i6 + 1;
        strArr[i6] = "sun.tools.javac.Main";
        int i8 = i7 + 1;
        strArr[i7] = "-classpath";
        strArr[i8] = this.compileClasspath.toString();
        scanDir(includedFiles);
        log(new StringBuffer().append("Compiling ").append(this.filesToDo.size()).append(" JSP files").toString());
        int size = this.filesToDo.size();
        for (int i9 = 0; i9 < size; i9++) {
            String str = (String) this.filesToDo.elementAt(i9);
            File file = new File(str);
            strArr[i8 + 1] = "-package";
            String parent = file.getParent();
            if (parent == null || "".equals(parent)) {
                strArr[10] = this.destinationPackage;
            } else {
                strArr[10] = new StringBuffer().append(this.destinationPackage).append(".").append("_").append(replaceString(parent, File.separator, "_.")).toString();
            }
            strArr[11] = new StringBuffer().append(this.sourceDirectory).append(File.separator).append(str).toString();
            java.clearArgs();
            for (int i10 = 0; i10 < 12; i10++) {
                java.createArg().setValue(strArr[i10]);
            }
            java.setClasspath(this.compileClasspath);
            if (java.executeJava() != 0) {
                log(new StringBuffer().append(str).append(" failed to compile").toString(), 1);
            }
        }
    }

    protected String replaceString(String str, String str2, String str3) {
        StringTokenizer stringTokenizer = new StringTokenizer(str, str2, true);
        int countTokens = stringTokenizer.countTokens();
        String str4 = "";
        for (int i = 0; i < countTokens; i++) {
            String nextToken = stringTokenizer.nextToken();
            String str5 = nextToken;
            if (nextToken.equals(str2)) {
                str5 = str3;
            }
            str4 = new StringBuffer().append(str4).append(str5).toString();
        }
        return str4;
    }

    protected void scanDir(String[] strArr) {
        long time = new Date().getTime();
        for (int i = 0; i < strArr.length; i++) {
            File file = new File(this.sourceDirectory, strArr[i]);
            String parent = new File(strArr[i]).getParent();
            String stringBuffer = new StringBuffer().append((parent == null || "".equals(parent)) ? this.pathToPackage : new StringBuffer().append(this.pathToPackage).append(File.separator).append("_").append(replaceString(parent, File.separator, "_/")).toString()).append(File.separator).append("_").toString();
            int lastIndexOf = strArr[i].lastIndexOf(File.separator) != -1 ? strArr[i].lastIndexOf(File.separator) + 1 : 0;
            int indexOf = strArr[i].indexOf(".jsp");
            if (indexOf == -1) {
                log(new StringBuffer().append("Skipping ").append(strArr[i]).append(". Not a JSP").toString(), 3);
            } else {
                File file2 = new File(this.destinationDirectory, new StringBuffer().append(new StringBuffer().append(stringBuffer).append(strArr[i].substring(lastIndexOf, indexOf)).toString()).append(".class").toString());
                if (file.lastModified() > time) {
                    log(new StringBuffer().append("Warning: file modified in the future: ").append(strArr[i]).toString(), 1);
                }
                if (file.lastModified() > file2.lastModified()) {
                    this.filesToDo.addElement(strArr[i]);
                    log(new StringBuffer().append("Recompiling File ").append(strArr[i]).toString(), 3);
                }
            }
        }
    }

    public void setClasspath(Path path) {
        if (this.compileClasspath == null) {
            this.compileClasspath = path;
        } else {
            this.compileClasspath.append(path);
        }
    }

    public void setDest(File file) {
        this.destinationDirectory = file;
    }

    public void setPackage(String str) {
        this.destinationPackage = str;
    }

    public void setSrc(File file) {
        this.sourceDirectory = file;
    }
}
