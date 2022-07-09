package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/MakeUrl.class */
public class MakeUrl extends Task {
    public static final String ERROR_MISSING_FILE = "A source file is missing :";
    public static final String ERROR_NO_FILES = "No files defined";
    public static final String ERROR_NO_PROPERTY = "No property defined";
    private File file;
    private String property;
    private String separator = " ";
    private List filesets = new LinkedList();
    private List paths = new LinkedList();
    private boolean validate = true;

    private String filesetsToURL() {
        String stripTrailingSeparator;
        if (this.filesets.isEmpty()) {
            stripTrailingSeparator = "";
        } else {
            int i = 0;
            StringBuffer stringBuffer = new StringBuffer();
            ListIterator listIterator = this.filesets.listIterator();
            while (listIterator.hasNext()) {
                DirectoryScanner directoryScanner = ((FileSet) listIterator.next()).getDirectoryScanner(getProject());
                String[] includedFiles = directoryScanner.getIncludedFiles();
                int i2 = 0;
                int i3 = i;
                while (true) {
                    i = i3;
                    if (i2 < includedFiles.length) {
                        File file = new File(directoryScanner.getBasedir(), includedFiles[i2]);
                        validateFile(file);
                        String url = toURL(file);
                        stringBuffer.append(url);
                        log(url, 4);
                        stringBuffer.append(this.separator);
                        i3++;
                        i2++;
                    }
                }
            }
            stripTrailingSeparator = stripTrailingSeparator(stringBuffer, i);
        }
        return stripTrailingSeparator;
    }

    private String pathsToURL() {
        String stripTrailingSeparator;
        if (this.paths.isEmpty()) {
            stripTrailingSeparator = "";
        } else {
            int i = 0;
            StringBuffer stringBuffer = new StringBuffer();
            ListIterator listIterator = this.paths.listIterator();
            while (listIterator.hasNext()) {
                String[] list = ((Path) listIterator.next()).list();
                int i2 = 0;
                int i3 = i;
                while (true) {
                    i = i3;
                    if (i2 < list.length) {
                        File file = new File(list[i2]);
                        validateFile(file);
                        String url = toURL(file);
                        stringBuffer.append(url);
                        log(url, 4);
                        stringBuffer.append(this.separator);
                        i3++;
                        i2++;
                    }
                }
            }
            stripTrailingSeparator = stripTrailingSeparator(stringBuffer, i);
        }
        return stripTrailingSeparator;
    }

    private String stripTrailingSeparator(StringBuffer stringBuffer, int i) {
        String str;
        if (i > 0) {
            stringBuffer.delete(stringBuffer.length() - this.separator.length(), stringBuffer.length());
            str = new String(stringBuffer);
        } else {
            str = "";
        }
        return str;
    }

    private String toURL(File file) {
        return FileUtils.getFileUtils().toURI(file.getAbsolutePath());
    }

    private void validate() {
        if (this.property == null) {
            throw new BuildException(ERROR_NO_PROPERTY);
        }
        if (this.file == null && this.filesets.isEmpty() && this.paths.isEmpty()) {
            throw new BuildException(ERROR_NO_FILES);
        }
    }

    private void validateFile(File file) {
        if (!this.validate || file.exists()) {
            return;
        }
        throw new BuildException(new StringBuffer().append(ERROR_MISSING_FILE).append(file.toString()).toString());
    }

    public void addFileSet(FileSet fileSet) {
        this.filesets.add(fileSet);
    }

    public void addPath(Path path) {
        this.paths.add(path);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        String str;
        validate();
        if (getProject().getProperty(this.property) != null) {
            return;
        }
        String filesetsToURL = filesetsToURL();
        if (this.file != null) {
            validateFile(this.file);
            String url = toURL(this.file);
            str = url;
            if (filesetsToURL.length() > 0) {
                str = new StringBuffer().append(url).append(this.separator).append(filesetsToURL).toString();
            }
        } else {
            str = filesetsToURL;
        }
        String pathsToURL = pathsToURL();
        String str2 = str;
        if (pathsToURL.length() > 0) {
            str2 = str.length() > 0 ? new StringBuffer().append(str).append(this.separator).append(pathsToURL).toString() : pathsToURL;
        }
        log(new StringBuffer().append("Setting ").append(this.property).append(" to URL ").append(str2).toString(), 3);
        getProject().setNewProperty(this.property, str2);
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setProperty(String str) {
        this.property = str;
    }

    public void setSeparator(String str) {
        this.separator = str;
    }

    public void setValidate(boolean z) {
        this.validate = z;
    }
}
