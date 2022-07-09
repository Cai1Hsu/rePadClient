package org.apache.tools.ant.types.resources;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/StringResource.class */
public class StringResource extends Resource {
    private static final int STRING_MAGIC = Resource.getMagicNumber("StringResource".getBytes());
    private String encoding;

    /* loaded from: classes.jar:org/apache/tools/ant/types/resources/StringResource$StringResourceFilterOutputStream.class */
    private class StringResourceFilterOutputStream extends FilterOutputStream {
        private final ByteArrayOutputStream baos = (ByteArrayOutputStream) this.out;
        private final StringResource this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public StringResourceFilterOutputStream(StringResource stringResource) {
            super(new ByteArrayOutputStream());
            this.this$0 = stringResource;
        }

        @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            super.close();
            this.this$0.setValueFromOutputStream(this.this$0.encoding == null ? this.baos.toString() : this.baos.toString(this.this$0.encoding));
        }
    }

    public StringResource() {
        this.encoding = null;
    }

    public StringResource(String str) {
        this(null, str);
    }

    public StringResource(Project project, String str) {
        this.encoding = null;
        setProject(project);
        setValue(project != null ? project.replaceProperties(str) : str);
    }

    public void setValueFromOutputStream(String str) {
        if (getProject() != null) {
            str = getProject().replaceProperties(str);
        }
        setValue(str);
    }

    public void addText(String str) {
        checkChildrenAllowed();
        setValue(getProject().replaceProperties(str));
    }

    protected String getContent() {
        String value;
        synchronized (this) {
            value = getValue();
        }
        return value;
    }

    public String getEncoding() {
        String str;
        synchronized (this) {
            str = this.encoding;
        }
        return str;
    }

    @Override // org.apache.tools.ant.types.Resource
    public InputStream getInputStream() throws IOException {
        ByteArrayInputStream byteArrayInputStream;
        synchronized (this) {
            if (isReference()) {
                byteArrayInputStream = ((Resource) getCheckedRef()).getInputStream();
            } else {
                String content = getContent();
                if (content == null) {
                    throw new IllegalStateException("unset string value");
                }
                byteArrayInputStream = new ByteArrayInputStream(this.encoding == null ? content.getBytes() : content.getBytes(this.encoding));
            }
        }
        return byteArrayInputStream;
    }

    @Override // org.apache.tools.ant.types.Resource
    public String getName() {
        String name;
        synchronized (this) {
            name = super.getName();
        }
        return name;
    }

    @Override // org.apache.tools.ant.types.Resource
    public OutputStream getOutputStream() throws IOException {
        StringResourceFilterOutputStream stringResourceFilterOutputStream;
        synchronized (this) {
            if (isReference()) {
                stringResourceFilterOutputStream = ((Resource) getCheckedRef()).getOutputStream();
            } else if (getValue() != null) {
                throw new ImmutableResourceException();
            } else {
                stringResourceFilterOutputStream = new StringResourceFilterOutputStream(this);
            }
        }
        return stringResourceFilterOutputStream;
    }

    @Override // org.apache.tools.ant.types.Resource
    public long getSize() {
        long size;
        synchronized (this) {
            size = isReference() ? ((Resource) getCheckedRef()).getSize() : getContent().length();
        }
        return size;
    }

    public String getValue() {
        String name;
        synchronized (this) {
            name = getName();
        }
        return name;
    }

    @Override // org.apache.tools.ant.types.Resource
    public int hashCode() {
        int hashCode;
        synchronized (this) {
            hashCode = isReference() ? getCheckedRef().hashCode() : super.hashCode() * STRING_MAGIC;
        }
        return hashCode;
    }

    @Override // org.apache.tools.ant.types.Resource
    public boolean isExists() {
        return getValue() != null;
    }

    public void setEncoding(String str) {
        synchronized (this) {
            checkAttributesAllowed();
            this.encoding = str;
        }
    }

    @Override // org.apache.tools.ant.types.Resource
    public void setName(String str) {
        synchronized (this) {
            if (getName() != null) {
                throw new BuildException(new ImmutableResourceException());
            }
            super.setName(str);
        }
    }

    @Override // org.apache.tools.ant.types.Resource, org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) {
        if (this.encoding != null) {
            throw tooManyAttributes();
        }
        super.setRefid(reference);
    }

    public void setValue(String str) {
        synchronized (this) {
            setName(str);
        }
    }

    @Override // org.apache.tools.ant.types.Resource, org.apache.tools.ant.types.DataType
    public String toString() {
        return String.valueOf(getContent());
    }
}
