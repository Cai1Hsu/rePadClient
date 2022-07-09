package org.apache.tools.ant.types.resources;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Stack;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Expand;
import org.apache.tools.ant.types.DataType;
import org.apache.tools.ant.types.Mapper;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.IdentityMapper;
import org.apache.tools.ant.util.MergingMapper;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/MappedResourceCollection.class */
public class MappedResourceCollection extends DataType implements ResourceCollection, Cloneable {
    private ResourceCollection nested = null;
    private Mapper mapper = null;
    private boolean enableMultipleMappings = false;
    private boolean cache = false;
    private Collection cachedColl = null;

    private Collection cacheCollection() {
        Collection collection;
        synchronized (this) {
            if (this.cachedColl == null || !this.cache) {
                this.cachedColl = getCollection();
            }
            collection = this.cachedColl;
        }
        return collection;
    }

    private void checkInitialized() {
        if (this.nested == null) {
            throw new BuildException("A nested resource collection element is required", getLocation());
        }
        dieOnCircularReference();
    }

    private Collection getCollection() {
        ArrayList arrayList = new ArrayList();
        IdentityMapper implementation = this.mapper != null ? this.mapper.getImplementation() : new IdentityMapper();
        for (Resource resource : this.nested) {
            if (this.enableMultipleMappings) {
                String[] mapFileName = implementation.mapFileName(resource.getName());
                if (mapFileName != null) {
                    for (String str : mapFileName) {
                        arrayList.add(new MappedResource(resource, new MergingMapper(str)));
                    }
                }
            } else {
                arrayList.add(new MappedResource(resource, implementation));
            }
        }
        return arrayList;
    }

    public void add(ResourceCollection resourceCollection) throws BuildException {
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            if (this.nested != null) {
                throw new BuildException("Only one resource collection can be nested into mappedresources", getLocation());
            }
            setChecked(false);
            this.cachedColl = null;
            this.nested = resourceCollection;
        }
    }

    public void add(FileNameMapper fileNameMapper) {
        createMapper().add(fileNameMapper);
    }

    @Override // org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() {
        try {
            MappedResourceCollection mappedResourceCollection = (MappedResourceCollection) super.clone();
            mappedResourceCollection.nested = this.nested;
            mappedResourceCollection.mapper = this.mapper;
            mappedResourceCollection.cachedColl = null;
            return mappedResourceCollection;
        } catch (CloneNotSupportedException e) {
            throw new BuildException(e);
        }
    }

    public Mapper createMapper() throws BuildException {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        if (this.mapper != null) {
            throw new BuildException(Expand.ERROR_MULTIPLE_MAPPERS, getLocation());
        }
        setChecked(false);
        this.mapper = new Mapper(getProject());
        this.cachedColl = null;
        return this.mapper;
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        synchronized (this) {
            if (!isChecked()) {
                if (isReference()) {
                    super.dieOnCircularReference(stack, project);
                } else {
                    checkInitialized();
                    if (this.mapper != null) {
                        pushAndInvokeCircularReferenceCheck(this.mapper, stack, project);
                    }
                    if (this.nested instanceof DataType) {
                        pushAndInvokeCircularReferenceCheck((DataType) this.nested, stack, project);
                    }
                    setChecked(true);
                }
            }
        }
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public boolean isFilesystemOnly() {
        boolean z;
        if (isReference()) {
            z = ((MappedResourceCollection) getCheckedRef()).isFilesystemOnly();
        } else {
            checkInitialized();
            z = false;
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public Iterator iterator() {
        Iterator it;
        if (isReference()) {
            it = ((MappedResourceCollection) getCheckedRef()).iterator();
        } else {
            checkInitialized();
            it = cacheCollection().iterator();
        }
        return it;
    }

    public void setCache(boolean z) {
        this.cache = z;
    }

    public void setEnableMultipleMappings(boolean z) {
        this.enableMultipleMappings = z;
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) {
        if (this.nested == null && this.mapper == null) {
            super.setRefid(reference);
            return;
        }
        throw tooManyAttributes();
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public int size() {
        int size;
        if (isReference()) {
            size = ((MappedResourceCollection) getCheckedRef()).size();
        } else {
            checkInitialized();
            size = cacheCollection().size();
        }
        return size;
    }
}
