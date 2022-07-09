package org.apache.tools.ant.types.resources;

import java.io.File;
import java.util.Stack;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/ArchiveResource.class */
public abstract class ArchiveResource extends Resource {
    private static final int NULL_ARCHIVE = Resource.getMagicNumber("null archive".getBytes());
    private Resource archive;
    private boolean haveEntry;
    private int mode;
    private boolean modeSet;

    protected ArchiveResource() {
        this.haveEntry = false;
        this.modeSet = false;
        this.mode = 0;
    }

    protected ArchiveResource(File file) {
        this(file, false);
    }

    protected ArchiveResource(File file, boolean z) {
        this.haveEntry = false;
        this.modeSet = false;
        this.mode = 0;
        setArchive(file);
        this.haveEntry = z;
    }

    protected ArchiveResource(Resource resource, boolean z) {
        this.haveEntry = false;
        this.modeSet = false;
        this.mode = 0;
        addConfigured(resource);
        this.haveEntry = z;
    }

    public void addConfigured(ResourceCollection resourceCollection) {
        checkChildrenAllowed();
        if (this.archive != null) {
            throw new BuildException("you must not specify more than one archive");
        }
        if (resourceCollection.size() != 1) {
            throw new BuildException("only single argument resource collections are supported as archives");
        }
        this.archive = (Resource) resourceCollection.iterator().next();
    }

    protected final void checkEntry() throws BuildException {
        synchronized (this) {
            dieOnCircularReference();
            if (!this.haveEntry) {
                if (getName() == null) {
                    throw new BuildException("entry name not set");
                }
                Resource archive = getArchive();
                if (archive == null) {
                    throw new BuildException("archive attribute not set");
                }
                if (!archive.isExists()) {
                    throw new BuildException(new StringBuffer().append(archive.toString()).append(DirectoryScanner.DOES_NOT_EXIST_POSTFIX).toString());
                }
                if (archive.isDirectory()) {
                    throw new BuildException(new StringBuffer().append(archive).append(" denotes a directory.").toString());
                }
                fetchEntry();
                this.haveEntry = true;
            }
        }
    }

    @Override // org.apache.tools.ant.types.Resource, java.lang.Comparable
    public int compareTo(Object obj) {
        return equals(obj) ? 0 : super.compareTo(obj);
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) {
        synchronized (this) {
            if (!isChecked()) {
                if (isReference()) {
                    super.dieOnCircularReference(stack, project);
                } else {
                    if (this.archive != null) {
                        pushAndInvokeCircularReferenceCheck(this.archive, stack, project);
                    }
                    setChecked(true);
                }
            }
        }
    }

    @Override // org.apache.tools.ant.types.Resource
    public boolean equals(Object obj) {
        boolean z = true;
        if (this != obj) {
            if (isReference()) {
                z = getCheckedRef().equals(obj);
            } else if (!obj.getClass().equals(getClass())) {
                z = false;
            } else {
                ArchiveResource archiveResource = (ArchiveResource) obj;
                if (!getArchive().equals(archiveResource.getArchive()) || !getName().equals(archiveResource.getName())) {
                    z = false;
                }
            }
        }
        return z;
    }

    protected abstract void fetchEntry();

    public Resource getArchive() {
        return isReference() ? ((ArchiveResource) getCheckedRef()).getArchive() : this.archive;
    }

    @Override // org.apache.tools.ant.types.Resource
    public long getLastModified() {
        long lastModified;
        if (isReference()) {
            lastModified = ((Resource) getCheckedRef()).getLastModified();
        } else {
            checkEntry();
            lastModified = super.getLastModified();
        }
        return lastModified;
    }

    public int getMode() {
        int i;
        if (isReference()) {
            i = ((ArchiveResource) getCheckedRef()).getMode();
        } else {
            checkEntry();
            i = this.mode;
        }
        return i;
    }

    @Override // org.apache.tools.ant.types.Resource
    public long getSize() {
        long size;
        if (isReference()) {
            size = ((Resource) getCheckedRef()).getSize();
        } else {
            checkEntry();
            size = super.getSize();
        }
        return size;
    }

    @Override // org.apache.tools.ant.types.Resource
    public int hashCode() {
        return (getArchive() == null ? NULL_ARCHIVE : getArchive().hashCode()) * super.hashCode();
    }

    @Override // org.apache.tools.ant.types.Resource
    public boolean isDirectory() {
        boolean isDirectory;
        if (isReference()) {
            isDirectory = ((Resource) getCheckedRef()).isDirectory();
        } else {
            checkEntry();
            isDirectory = super.isDirectory();
        }
        return isDirectory;
    }

    @Override // org.apache.tools.ant.types.Resource
    public boolean isExists() {
        boolean isExists;
        if (isReference()) {
            isExists = ((Resource) getCheckedRef()).isExists();
        } else {
            checkEntry();
            isExists = super.isExists();
        }
        return isExists;
    }

    public void setArchive(File file) {
        checkAttributesAllowed();
        this.archive = new FileResource(file);
    }

    public void setMode(int i) {
        checkAttributesAllowed();
        this.mode = i;
        this.modeSet = true;
    }

    @Override // org.apache.tools.ant.types.Resource, org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) {
        if (this.archive != null || this.modeSet) {
            throw tooManyAttributes();
        }
        super.setRefid(reference);
    }

    @Override // org.apache.tools.ant.types.Resource, org.apache.tools.ant.types.DataType
    public String toString() {
        return isReference() ? getCheckedRef().toString() : new StringBuffer().append(getArchive().toString()).append(':').append(getName()).toString();
    }
}
