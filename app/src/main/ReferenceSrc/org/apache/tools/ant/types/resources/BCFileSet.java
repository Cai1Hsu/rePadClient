package org.apache.tools.ant.types.resources;

import java.util.Iterator;
import org.apache.tools.ant.types.FileSet;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/BCFileSet.class */
public class BCFileSet extends FileSet {
    public BCFileSet() {
    }

    public BCFileSet(FileSet fileSet) {
        super(fileSet);
    }

    @Override // org.apache.tools.ant.types.FileSet, org.apache.tools.ant.types.ResourceCollection
    public Iterator iterator() {
        FileResourceIterator fileResourceIterator;
        if (isReference()) {
            fileResourceIterator = ((FileSet) getRef(getProject())).iterator();
        } else {
            fileResourceIterator = new FileResourceIterator(getProject(), getDir());
            fileResourceIterator.addFiles(getDirectoryScanner().getIncludedFiles());
            fileResourceIterator.addFiles(getDirectoryScanner().getIncludedDirectories());
        }
        return fileResourceIterator;
    }

    @Override // org.apache.tools.ant.types.FileSet, org.apache.tools.ant.types.ResourceCollection
    public int size() {
        return isReference() ? ((FileSet) getRef(getProject())).size() : getDirectoryScanner().getIncludedFilesCount() + getDirectoryScanner().getIncludedDirsCount();
    }
}
