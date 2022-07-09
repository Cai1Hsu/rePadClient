package org.apache.tools.ant.types;

import java.io.File;
import java.util.Iterator;
import java.util.StringTokenizer;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.resources.FileResourceIterator;

/* loaded from: classes.jar:org/apache/tools/ant/types/FileList.class */
public class FileList extends DataType implements ResourceCollection {
    private File dir;
    private Vector filenames;

    /* loaded from: classes.jar:org/apache/tools/ant/types/FileList$FileName.class */
    public static class FileName {
        private String name;

        public String getName() {
            return this.name;
        }

        public void setName(String str) {
            this.name = str;
        }
    }

    public FileList() {
        this.filenames = new Vector();
    }

    protected FileList(FileList fileList) {
        this.filenames = new Vector();
        this.dir = fileList.dir;
        this.filenames = fileList.filenames;
        setProject(fileList.getProject());
    }

    public void addConfiguredFile(FileName fileName) {
        if (fileName.getName() == null) {
            throw new BuildException("No name specified in nested file element");
        }
        this.filenames.addElement(fileName.getName());
    }

    public File getDir(Project project) {
        return isReference() ? getRef(project).getDir(project) : this.dir;
    }

    public String[] getFiles(Project project) {
        String[] strArr;
        if (isReference()) {
            strArr = getRef(project).getFiles(project);
        } else if (this.dir == null) {
            throw new BuildException("No directory specified for filelist.");
        } else {
            if (this.filenames.size() == 0) {
                throw new BuildException("No files specified for filelist.");
            }
            strArr = new String[this.filenames.size()];
            this.filenames.copyInto(strArr);
        }
        return strArr;
    }

    protected FileList getRef(Project project) {
        return (FileList) getCheckedRef(project);
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public boolean isFilesystemOnly() {
        return true;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public Iterator iterator() {
        return isReference() ? getRef(getProject()).iterator() : new FileResourceIterator(getProject(), this.dir, (String[]) this.filenames.toArray(new String[this.filenames.size()]));
    }

    public void setDir(File file) throws BuildException {
        checkAttributesAllowed();
        this.dir = file;
    }

    public void setFiles(String str) {
        checkAttributesAllowed();
        if (str == null || str.length() <= 0) {
            return;
        }
        StringTokenizer stringTokenizer = new StringTokenizer(str, ", \t\n\r\f", false);
        while (stringTokenizer.hasMoreTokens()) {
            this.filenames.addElement(stringTokenizer.nextToken());
        }
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) throws BuildException {
        if (this.dir == null && this.filenames.size() == 0) {
            super.setRefid(reference);
            return;
        }
        throw tooManyAttributes();
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public int size() {
        return isReference() ? getRef(getProject()).size() : this.filenames.size();
    }
}
