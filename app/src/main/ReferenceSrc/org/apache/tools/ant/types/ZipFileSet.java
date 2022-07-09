package org.apache.tools.ant.types;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;

/* loaded from: classes.jar:org/apache/tools/ant/types/ZipFileSet.class */
public class ZipFileSet extends ArchiveFileSet {
    private String encoding;

    public ZipFileSet() {
        this.encoding = null;
    }

    protected ZipFileSet(FileSet fileSet) {
        super(fileSet);
        this.encoding = null;
    }

    protected ZipFileSet(ZipFileSet zipFileSet) {
        super((ArchiveFileSet) zipFileSet);
        this.encoding = null;
        this.encoding = zipFileSet.encoding;
    }

    private void checkZipFileSetAttributesAllowed() {
        if (getProject() == null || (isReference() && (getRefid().getReferencedObject(getProject()) instanceof ZipFileSet))) {
            checkAttributesAllowed();
        }
    }

    @Override // org.apache.tools.ant.types.ArchiveFileSet, org.apache.tools.ant.types.FileSet, org.apache.tools.ant.types.AbstractFileSet, org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() {
        return isReference() ? ((ZipFileSet) getRef(getProject())).clone() : super.clone();
    }

    public String getEncoding() {
        String str;
        if (isReference()) {
            AbstractFileSet ref = getRef(getProject());
            str = ref instanceof ZipFileSet ? ((ZipFileSet) ref).getEncoding() : null;
        } else {
            str = this.encoding;
        }
        return str;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v13, types: [org.apache.tools.ant.types.AbstractFileSet] */
    @Override // org.apache.tools.ant.types.AbstractFileSet
    protected AbstractFileSet getRef(Project project) {
        ZipFileSet zipFileSet;
        dieOnCircularReference(project);
        Object referencedObject = getRefid().getReferencedObject(project);
        if (referencedObject instanceof ZipFileSet) {
            zipFileSet = (AbstractFileSet) referencedObject;
        } else if (!(referencedObject instanceof FileSet)) {
            throw new BuildException(new StringBuffer().append(getRefid().getRefId()).append(" doesn't denote a zipfileset or a fileset").toString());
        } else {
            zipFileSet = new ZipFileSet((FileSet) referencedObject);
            configureFileSet(zipFileSet);
        }
        return zipFileSet;
    }

    @Override // org.apache.tools.ant.types.ArchiveFileSet
    protected ArchiveScanner newArchiveScanner() {
        ZipScanner zipScanner = new ZipScanner();
        zipScanner.setEncoding(this.encoding);
        return zipScanner;
    }

    public void setEncoding(String str) {
        checkZipFileSetAttributesAllowed();
        this.encoding = str;
    }
}
