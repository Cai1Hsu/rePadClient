package org.apache.tools.ant.types.resources;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Stack;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/ResourceDecorator.class */
public abstract class ResourceDecorator extends Resource {
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private Resource resource;

    protected ResourceDecorator() {
    }

    protected ResourceDecorator(ResourceCollection resourceCollection) {
        addConfigured(resourceCollection);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public final void addConfigured(ResourceCollection resourceCollection) {
        checkChildrenAllowed();
        if (this.resource != null) {
            throw new BuildException("you must not specify more than one resource");
        }
        if (resourceCollection.size() != 1) {
            throw new BuildException("only single argument resource collections are supported");
        }
        setChecked(false);
        this.resource = (Resource) resourceCollection.iterator().next();
    }

    @Override // org.apache.tools.ant.types.Resource
    public Object as(Class cls) {
        return getResource().as(cls);
    }

    @Override // org.apache.tools.ant.types.Resource, java.lang.Comparable
    public int compareTo(Object obj) {
        return obj == this ? 0 : obj instanceof ResourceDecorator ? getResource().compareTo(((ResourceDecorator) obj).getResource()) : getResource().compareTo(obj);
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        if (isChecked()) {
            return;
        }
        if (isReference()) {
            super.dieOnCircularReference(stack, project);
            return;
        }
        pushAndInvokeCircularReferenceCheck(this.resource, stack, project);
        setChecked(true);
    }

    @Override // org.apache.tools.ant.types.Resource
    public InputStream getInputStream() throws IOException {
        return getResource().getInputStream();
    }

    @Override // org.apache.tools.ant.types.Resource
    public long getLastModified() {
        return getResource().getLastModified();
    }

    @Override // org.apache.tools.ant.types.Resource
    public String getName() {
        return getResource().getName();
    }

    @Override // org.apache.tools.ant.types.Resource
    public OutputStream getOutputStream() throws IOException {
        return getResource().getOutputStream();
    }

    protected final Resource getResource() {
        Resource resource;
        if (isReference()) {
            resource = (Resource) getCheckedRef();
        } else if (this.resource == null) {
            throw new BuildException("no resource specified");
        } else {
            dieOnCircularReference();
            resource = this.resource;
        }
        return resource;
    }

    @Override // org.apache.tools.ant.types.Resource
    public long getSize() {
        return getResource().getSize();
    }

    @Override // org.apache.tools.ant.types.Resource
    public int hashCode() {
        return (getClass().hashCode() << 4) | getResource().hashCode();
    }

    @Override // org.apache.tools.ant.types.Resource
    public boolean isDirectory() {
        return getResource().isDirectory();
    }

    @Override // org.apache.tools.ant.types.Resource
    public boolean isExists() {
        return getResource().isExists();
    }

    @Override // org.apache.tools.ant.types.Resource, org.apache.tools.ant.types.ResourceCollection
    public boolean isFilesystemOnly() {
        Class cls;
        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
            cls = class$("org.apache.tools.ant.types.resources.FileProvider");
            class$org$apache$tools$ant$types$resources$FileProvider = cls;
        } else {
            cls = class$org$apache$tools$ant$types$resources$FileProvider;
        }
        return as(cls) != null;
    }

    @Override // org.apache.tools.ant.types.Resource
    public void setDirectory(boolean z) throws BuildException {
        throw new BuildException(new StringBuffer().append("you can't change the directory state of a ").append(getDataTypeName()).toString());
    }

    @Override // org.apache.tools.ant.types.Resource
    public void setExists(boolean z) {
        throw new BuildException(new StringBuffer().append("you can't change the exists state of a ").append(getDataTypeName()).toString());
    }

    @Override // org.apache.tools.ant.types.Resource
    public void setLastModified(long j) throws BuildException {
        throw new BuildException(new StringBuffer().append("you can't change the timestamp of a ").append(getDataTypeName()).toString());
    }

    @Override // org.apache.tools.ant.types.Resource
    public void setName(String str) throws BuildException {
        throw new BuildException(new StringBuffer().append("you can't change the name of a ").append(getDataTypeName()).toString());
    }

    @Override // org.apache.tools.ant.types.Resource, org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) {
        if (this.resource != null) {
            throw noChildrenAllowed();
        }
        super.setRefid(reference);
    }

    @Override // org.apache.tools.ant.types.Resource
    public void setSize(long j) throws BuildException {
        throw new BuildException(new StringBuffer().append("you can't change the size of a ").append(getDataTypeName()).toString());
    }
}
