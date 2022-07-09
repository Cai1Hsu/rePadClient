package org.apache.tools.ant.types.resources;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.Stack;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.ArchiveFileSet;
import org.apache.tools.ant.types.DataType;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.TarFileSet;
import org.apache.tools.ant.types.ZipFileSet;
import org.apache.tools.ant.util.CollectionUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/Archives.class */
public class Archives extends DataType implements ResourceCollection, Cloneable {
    private Union zips = new Union();
    private Union tars = new Union();

    @Override // org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() {
        try {
            Archives archives = (Archives) super.clone();
            archives.zips = (Union) this.zips.clone();
            archives.tars = (Union) this.tars.clone();
            return archives;
        } catch (CloneNotSupportedException e) {
            throw new BuildException(e);
        }
    }

    protected ArchiveFileSet configureArchive(ArchiveFileSet archiveFileSet, Resource resource) {
        archiveFileSet.setProject(getProject());
        archiveFileSet.setSrcResource(resource);
        return archiveFileSet;
    }

    public Union createTars() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        return this.tars;
    }

    public Union createZips() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        return this.zips;
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        synchronized (this) {
            if (!isChecked()) {
                if (isReference()) {
                    super.dieOnCircularReference(stack, project);
                } else {
                    pushAndInvokeCircularReferenceCheck(this.zips, stack, project);
                    pushAndInvokeCircularReferenceCheck(this.tars, stack, project);
                    setChecked(true);
                }
            }
        }
    }

    protected Iterator grabArchives() {
        LinkedList linkedList = new LinkedList();
        Iterator it = this.zips.iterator();
        while (it.hasNext()) {
            linkedList.add(configureArchive(new ZipFileSet(), (Resource) it.next()));
        }
        Iterator it2 = this.tars.iterator();
        while (it2.hasNext()) {
            linkedList.add(configureArchive(new TarFileSet(), (Resource) it2.next()));
        }
        return linkedList.iterator();
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public boolean isFilesystemOnly() {
        boolean z;
        if (isReference()) {
            z = ((Archives) getCheckedRef()).isFilesystemOnly();
        } else {
            dieOnCircularReference();
            z = false;
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public Iterator iterator() {
        Iterator it;
        if (isReference()) {
            it = ((Archives) getCheckedRef()).iterator();
        } else {
            dieOnCircularReference();
            LinkedList linkedList = new LinkedList();
            Iterator grabArchives = grabArchives();
            while (grabArchives.hasNext()) {
                linkedList.addAll(CollectionUtils.asCollection(((ResourceCollection) grabArchives.next()).iterator()));
            }
            it = linkedList.iterator();
        }
        return it;
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) {
        if (this.zips.getResourceCollections().size() > 0 || this.tars.getResourceCollections().size() > 0) {
            throw tooManyAttributes();
        }
        super.setRefid(reference);
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public int size() {
        int i;
        if (!isReference()) {
            dieOnCircularReference();
            int i2 = 0;
            Iterator grabArchives = grabArchives();
            while (true) {
                i = i2;
                if (!grabArchives.hasNext()) {
                    break;
                }
                i2 += ((ResourceCollection) grabArchives.next()).size();
            }
        } else {
            i = ((Archives) getCheckedRef()).size();
        }
        return i;
    }
}
