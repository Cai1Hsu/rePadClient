package org.apache.tools.ant.types;

import java.util.Iterator;
import org.apache.tools.ant.types.resources.FileResourceIterator;

/* loaded from: classes.jar:org/apache/tools/ant/types/DirSet.class */
public class DirSet extends AbstractFileSet implements ResourceCollection {
    public DirSet() {
    }

    protected DirSet(DirSet dirSet) {
        super(dirSet);
    }

    @Override // org.apache.tools.ant.types.AbstractFileSet, org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() {
        return isReference() ? ((DirSet) getRef(getProject())).clone() : super.clone();
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public boolean isFilesystemOnly() {
        return true;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public Iterator iterator() {
        return isReference() ? ((DirSet) getRef(getProject())).iterator() : new FileResourceIterator(getProject(), getDir(getProject()), getDirectoryScanner(getProject()).getIncludedDirectories());
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public int size() {
        return isReference() ? ((DirSet) getRef(getProject())).size() : getDirectoryScanner(getProject()).getIncludedDirsCount();
    }

    @Override // org.apache.tools.ant.types.AbstractFileSet, org.apache.tools.ant.types.DataType
    public String toString() {
        String[] includedDirectories = getDirectoryScanner(getProject()).getIncludedDirectories();
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < includedDirectories.length; i++) {
            if (i > 0) {
                stringBuffer.append(';');
            }
            stringBuffer.append(includedDirectories[i]);
        }
        return stringBuffer.toString();
    }
}
