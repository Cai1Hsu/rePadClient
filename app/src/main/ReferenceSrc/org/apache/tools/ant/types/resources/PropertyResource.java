package org.apache.tools.ant.types.resources;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.PropertyHelper;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.util.PropertyOutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/PropertyResource.class */
public class PropertyResource extends Resource {
    private static final int PROPERTY_MAGIC = Resource.getMagicNumber("PropertyResource".getBytes());
    private static final InputStream UNSET = new InputStream() { // from class: org.apache.tools.ant.types.resources.PropertyResource.1
        @Override // java.io.InputStream
        public int read() {
            return -1;
        }
    };
    static Class class$org$apache$tools$ant$types$Resource;

    public PropertyResource() {
    }

    public PropertyResource(Project project, String str) {
        super(str);
        setProject(project);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    @Override // org.apache.tools.ant.types.Resource
    public boolean equals(Object obj) {
        boolean z = true;
        if (!super.equals(obj) && (!isReferenceOrProxy() || !getReferencedOrProxied().equals(obj))) {
            z = false;
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.Resource
    public InputStream getInputStream() throws IOException {
        ByteArrayInputStream byteArrayInputStream;
        if (isReferenceOrProxy()) {
            byteArrayInputStream = getReferencedOrProxied().getInputStream();
        } else {
            Object objectValue = getObjectValue();
            byteArrayInputStream = objectValue == null ? UNSET : new ByteArrayInputStream(String.valueOf(objectValue).getBytes());
        }
        return byteArrayInputStream;
    }

    public Object getObjectValue() {
        Object property;
        if (isReference()) {
            property = ((PropertyResource) getCheckedRef()).getObjectValue();
        } else {
            Project project = getProject();
            property = project == null ? null : PropertyHelper.getProperty(project, getName());
        }
        return property;
    }

    @Override // org.apache.tools.ant.types.Resource
    public OutputStream getOutputStream() throws IOException {
        PropertyOutputStream propertyOutputStream;
        if (isReferenceOrProxy()) {
            propertyOutputStream = getReferencedOrProxied().getOutputStream();
        } else if (isExists()) {
            throw new ImmutableResourceException();
        } else {
            propertyOutputStream = new PropertyOutputStream(getProject(), getName());
        }
        return propertyOutputStream;
    }

    protected Resource getReferencedOrProxied() {
        Resource resource;
        Class cls;
        if (isReference()) {
            if (class$org$apache$tools$ant$types$Resource == null) {
                cls = class$("org.apache.tools.ant.types.Resource");
                class$org$apache$tools$ant$types$Resource = cls;
            } else {
                cls = class$org$apache$tools$ant$types$Resource;
            }
            resource = (Resource) getCheckedRef(cls, "resource");
        } else {
            Object objectValue = getObjectValue();
            if (!(objectValue instanceof Resource)) {
                throw new IllegalStateException("This PropertyResource does not reference or proxy another Resource");
            }
            resource = (Resource) objectValue;
        }
        return resource;
    }

    @Override // org.apache.tools.ant.types.Resource
    public long getSize() {
        long length;
        if (isReferenceOrProxy()) {
            length = getReferencedOrProxied().getSize();
        } else {
            Object objectValue = getObjectValue();
            length = objectValue == null ? 0L : String.valueOf(objectValue).length();
        }
        return length;
    }

    public String getValue() {
        String property;
        if (isReference()) {
            property = ((PropertyResource) getCheckedRef()).getValue();
        } else {
            Project project = getProject();
            property = project == null ? null : project.getProperty(getName());
        }
        return property;
    }

    @Override // org.apache.tools.ant.types.Resource
    public int hashCode() {
        return isReferenceOrProxy() ? getReferencedOrProxied().hashCode() : super.hashCode() * PROPERTY_MAGIC;
    }

    @Override // org.apache.tools.ant.types.Resource
    public boolean isExists() {
        return isReferenceOrProxy() ? getReferencedOrProxied().isExists() : getObjectValue() != null;
    }

    protected boolean isReferenceOrProxy() {
        return isReference() || (getObjectValue() instanceof Resource);
    }

    @Override // org.apache.tools.ant.types.Resource, org.apache.tools.ant.types.DataType
    public String toString() {
        return isReferenceOrProxy() ? getReferencedOrProxied().toString() : getValue();
    }
}
