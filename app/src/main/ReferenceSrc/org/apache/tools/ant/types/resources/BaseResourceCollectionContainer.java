package org.apache.tools.ant.types.resources;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Stack;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.DataType;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/BaseResourceCollectionContainer.class */
public abstract class BaseResourceCollectionContainer extends DataType implements ResourceCollection, Cloneable {
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private List rc = new ArrayList();
    private Collection coll = null;
    private boolean cache = true;

    public BaseResourceCollectionContainer() {
    }

    public BaseResourceCollectionContainer(Project project) {
        setProject(project);
    }

    private Collection cacheCollection() {
        Collection collection;
        synchronized (this) {
            if (this.coll == null || !isCache()) {
                this.coll = getCollection();
            }
            collection = this.coll;
        }
        return collection;
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public void add(ResourceCollection resourceCollection) throws BuildException {
        Project project;
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            if (resourceCollection != null) {
                if (Project.getProject(resourceCollection) == null && (project = getProject()) != null) {
                    project.setProjectReference(resourceCollection);
                }
                this.rc.add(resourceCollection);
                FailFast.invalidate(this);
                this.coll = null;
                setChecked(false);
            }
        }
    }

    public void addAll(Collection collection) throws BuildException {
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            try {
                Iterator it = collection.iterator();
                while (it.hasNext()) {
                    add((ResourceCollection) it.next());
                }
            } catch (ClassCastException e) {
                throw new BuildException(e);
            }
        }
    }

    public void clear() throws BuildException {
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            this.rc.clear();
            FailFast.invalidate(this);
            this.coll = null;
            setChecked(false);
        }
    }

    @Override // org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() {
        try {
            BaseResourceCollectionContainer baseResourceCollectionContainer = (BaseResourceCollectionContainer) super.clone();
            baseResourceCollectionContainer.rc = new ArrayList(this.rc);
            baseResourceCollectionContainer.coll = null;
            return baseResourceCollectionContainer;
        } catch (CloneNotSupportedException e) {
            throw new BuildException(e);
        }
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        synchronized (this) {
            if (!isChecked()) {
                if (isReference()) {
                    super.dieOnCircularReference(stack, project);
                } else {
                    for (Object obj : this.rc) {
                        if (obj instanceof DataType) {
                            pushAndInvokeCircularReferenceCheck((DataType) obj, stack, project);
                        }
                    }
                    setChecked(true);
                }
            }
        }
    }

    protected abstract Collection getCollection();

    public final List getResourceCollections() {
        List unmodifiableList;
        synchronized (this) {
            dieOnCircularReference();
            unmodifiableList = Collections.unmodifiableList(this.rc);
        }
        return unmodifiableList;
    }

    public boolean isCache() {
        boolean z;
        synchronized (this) {
            z = this.cache;
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public boolean isFilesystemOnly() {
        boolean z;
        Class cls;
        synchronized (this) {
            if (!isReference()) {
                dieOnCircularReference();
                boolean z2 = true;
                Iterator it = this.rc.iterator();
                while (z2 && it.hasNext()) {
                    z2 = ((ResourceCollection) it.next()).isFilesystemOnly();
                }
                if (!z2) {
                    Iterator it2 = cacheCollection().iterator();
                    while (true) {
                        if (!it2.hasNext()) {
                            z = true;
                            break;
                        }
                        Resource resource = (Resource) it2.next();
                        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                            cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                            class$org$apache$tools$ant$types$resources$FileProvider = cls;
                        } else {
                            cls = class$org$apache$tools$ant$types$resources$FileProvider;
                        }
                        if (resource.as(cls) == null) {
                            z = false;
                            break;
                        }
                    }
                } else {
                    z = true;
                }
            } else {
                z = ((BaseResourceCollectionContainer) getCheckedRef()).isFilesystemOnly();
            }
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public final Iterator iterator() {
        FailFast failFast;
        synchronized (this) {
            if (isReference()) {
                failFast = ((BaseResourceCollectionContainer) getCheckedRef()).iterator();
            } else {
                dieOnCircularReference();
                failFast = new FailFast(this, cacheCollection().iterator());
            }
        }
        return failFast;
    }

    public void setCache(boolean z) {
        synchronized (this) {
            this.cache = z;
        }
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public int size() {
        int size;
        synchronized (this) {
            if (isReference()) {
                size = ((BaseResourceCollectionContainer) getCheckedRef()).size();
            } else {
                dieOnCircularReference();
                size = cacheCollection().size();
            }
        }
        return size;
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        String stringBuffer;
        synchronized (this) {
            if (isReference()) {
                stringBuffer = getCheckedRef().toString();
            } else if (cacheCollection().size() == 0) {
                stringBuffer = "";
            } else {
                StringBuffer stringBuffer2 = new StringBuffer();
                for (Object obj : this.coll) {
                    if (stringBuffer2.length() > 0) {
                        stringBuffer2.append(File.pathSeparatorChar);
                    }
                    stringBuffer2.append(obj);
                }
                stringBuffer = stringBuffer2.toString();
            }
        }
        return stringBuffer;
    }
}
