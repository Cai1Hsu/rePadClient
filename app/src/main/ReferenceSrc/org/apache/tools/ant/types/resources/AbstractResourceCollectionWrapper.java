package org.apache.tools.ant.types.resources;

import java.io.File;
import java.util.Iterator;
import java.util.Stack;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.DataType;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper.class */
public abstract class AbstractResourceCollectionWrapper extends DataType implements ResourceCollection, Cloneable {
    private static final String ONE_NESTED_MESSAGE = " expects exactly one nested resource collection.";
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private boolean cache = true;
    private ResourceCollection rc;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private BuildException oneNested() {
        return new BuildException(new StringBuffer().append(super.toString()).append(ONE_NESTED_MESSAGE).toString());
    }

    public void add(ResourceCollection resourceCollection) throws BuildException {
        Project project;
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            if (resourceCollection != null) {
                if (this.rc != null) {
                    throw oneNested();
                }
                this.rc = resourceCollection;
                if (Project.getProject(this.rc) == null && (project = getProject()) != null) {
                    project.setProjectReference(this.rc);
                }
                setChecked(false);
            }
        }
    }

    protected abstract Iterator createIterator();

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        synchronized (this) {
            if (!isChecked()) {
                if (isReference()) {
                    super.dieOnCircularReference(stack, project);
                } else {
                    if (this.rc instanceof DataType) {
                        pushAndInvokeCircularReferenceCheck((DataType) this.rc, stack, project);
                    }
                    setChecked(true);
                }
            }
        }
    }

    protected final ResourceCollection getResourceCollection() {
        ResourceCollection resourceCollection;
        synchronized (this) {
            dieOnCircularReference();
            if (this.rc == null) {
                throw oneNested();
            }
            resourceCollection = this.rc;
        }
        return resourceCollection;
    }

    protected abstract int getSize();

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
            if (isReference()) {
                z = ((BaseResourceCollectionContainer) getCheckedRef()).isFilesystemOnly();
            } else {
                dieOnCircularReference();
                z = true;
                if (this.rc != null) {
                    z = true;
                    if (!this.rc.isFilesystemOnly()) {
                        Iterator createIterator = createIterator();
                        while (true) {
                            z = true;
                            if (!createIterator.hasNext()) {
                                break;
                            }
                            Resource resource = (Resource) createIterator.next();
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
                    }
                }
            }
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public final Iterator iterator() {
        FailFast failFast;
        synchronized (this) {
            if (isReference()) {
                failFast = ((AbstractResourceCollectionWrapper) getCheckedRef()).iterator();
            } else {
                dieOnCircularReference();
                failFast = new FailFast(this, createIterator());
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
                size = ((AbstractResourceCollectionWrapper) getCheckedRef()).size();
            } else {
                dieOnCircularReference();
                size = getSize();
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
            } else if (getSize() == 0) {
                stringBuffer = "";
            } else {
                StringBuffer stringBuffer2 = new StringBuffer();
                Iterator createIterator = createIterator();
                while (createIterator.hasNext()) {
                    if (stringBuffer2.length() > 0) {
                        stringBuffer2.append(File.pathSeparatorChar);
                    }
                    stringBuffer2.append(createIterator.next());
                }
                stringBuffer = stringBuffer2.toString();
            }
        }
        return stringBuffer;
    }
}
