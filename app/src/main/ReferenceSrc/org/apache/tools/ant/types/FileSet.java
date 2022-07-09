package org.apache.tools.ant.types;

import java.util.Iterator;
import org.apache.tools.ant.types.resources.FileResourceIterator;

/* loaded from: classes.jar:org/apache/tools/ant/types/FileSet.class */
public class FileSet extends AbstractFileSet implements ResourceCollection {
    public FileSet() {
    }

    protected FileSet(FileSet fileSet) {
        super(fileSet);
    }

    @Override // org.apache.tools.ant.types.AbstractFileSet, org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() {
        return isReference() ? ((FileSet) getRef(getProject())).clone() : super.clone();
    }

    public boolean isFilesystemOnly() {
        return true;
    }

    public Iterator iterator() {
        return isReference() ? ((FileSet) getRef(getProject())).iterator() : new FileResourceIterator(getProject(), getDir(getProject()), getDirectoryScanner(getProject()).getIncludedFiles());
    }

    public int size() {
        return isReference() ? ((FileSet) getRef(getProject())).size() : getDirectoryScanner(getProject()).getIncludedFilesCount();
    }
}
