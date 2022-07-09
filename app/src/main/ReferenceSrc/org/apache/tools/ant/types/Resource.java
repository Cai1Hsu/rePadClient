package org.apache.tools.ant.types;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes.jar:org/apache/tools/ant/types/Resource.class */
public class Resource extends DataType implements Cloneable, Comparable, ResourceCollection {
    protected static final int MAGIC = getMagicNumber("Resource".getBytes());
    private static final int NULL_NAME = getMagicNumber("null name".getBytes());
    public static final long UNKNOWN_DATETIME = 0;
    public static final long UNKNOWN_SIZE = -1;
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private Boolean directory;
    private Boolean exists;
    private Long lastmodified;
    private String name;
    private Long size;

    public Resource() {
        this.name = null;
        this.exists = null;
        this.lastmodified = null;
        this.directory = null;
        this.size = null;
    }

    public Resource(String str) {
        this(str, false, 0L, false);
    }

    public Resource(String str, boolean z, long j) {
        this(str, z, j, false);
    }

    public Resource(String str, boolean z, long j, boolean z2) {
        this(str, z, j, z2, -1L);
    }

    public Resource(String str, boolean z, long j, boolean z2, long j2) {
        this.name = null;
        this.exists = null;
        this.lastmodified = null;
        this.directory = null;
        this.size = null;
        this.name = str;
        setName(str);
        setExists(z);
        setLastModified(j);
        setDirectory(z2);
        setSize(j2);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    protected static int getMagicNumber(byte[] bArr) {
        return new BigInteger(bArr).intValue();
    }

    public Object as(Class cls) {
        return cls.isAssignableFrom(getClass()) ? this : null;
    }

    @Override // org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() {
        try {
            return super.clone();
        } catch (CloneNotSupportedException e) {
            throw new UnsupportedOperationException("CloneNotSupportedException for a Resource caught. Derived classes must support cloning.");
        }
    }

    @Override // java.lang.Comparable
    public int compareTo(Object obj) {
        int compareTo;
        if (isReference()) {
            compareTo = ((Comparable) getCheckedRef()).compareTo(obj);
        } else if (!(obj instanceof Resource)) {
            throw new IllegalArgumentException("Can only be compared with Resources");
        } else {
            compareTo = toString().compareTo(obj.toString());
        }
        return compareTo;
    }

    public boolean equals(Object obj) {
        return isReference() ? getCheckedRef().equals(obj) : obj.getClass().equals(getClass()) && compareTo(obj) == 0;
    }

    public InputStream getInputStream() throws IOException {
        if (isReference()) {
            return ((Resource) getCheckedRef()).getInputStream();
        }
        throw new UnsupportedOperationException();
    }

    public long getLastModified() {
        long j;
        if (isReference()) {
            j = ((Resource) getCheckedRef()).getLastModified();
        } else if (!isExists() || this.lastmodified == null) {
            j = 0;
        } else {
            long longValue = this.lastmodified.longValue();
            j = longValue;
            if (longValue < 0) {
                j = 0;
            }
        }
        return j;
    }

    public String getName() {
        return isReference() ? ((Resource) getCheckedRef()).getName() : this.name;
    }

    public OutputStream getOutputStream() throws IOException {
        if (isReference()) {
            return ((Resource) getCheckedRef()).getOutputStream();
        }
        throw new UnsupportedOperationException();
    }

    public long getSize() {
        return isReference() ? ((Resource) getCheckedRef()).getSize() : isExists() ? this.size != null ? this.size.longValue() : -1L : 0L;
    }

    public int hashCode() {
        int hashCode;
        if (isReference()) {
            hashCode = getCheckedRef().hashCode();
        } else {
            String name = getName();
            hashCode = (name == null ? NULL_NAME : name.hashCode()) * MAGIC;
        }
        return hashCode;
    }

    public boolean isDirectory() {
        return isReference() ? ((Resource) getCheckedRef()).isDirectory() : this.directory != null && this.directory.booleanValue();
    }

    public boolean isExists() {
        return isReference() ? ((Resource) getCheckedRef()).isExists() : this.exists == null || this.exists.booleanValue();
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public boolean isFilesystemOnly() {
        boolean z;
        Class cls;
        if (!isReference() || !((Resource) getCheckedRef()).isFilesystemOnly()) {
            if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                class$org$apache$tools$ant$types$resources$FileProvider = cls;
            } else {
                cls = class$org$apache$tools$ant$types$resources$FileProvider;
            }
            if (as(cls) == null) {
                z = false;
                return z;
            }
        }
        z = true;
        return z;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public Iterator iterator() {
        return isReference() ? ((Resource) getCheckedRef()).iterator() : new Iterator(this) { // from class: org.apache.tools.ant.types.Resource.1
            private boolean done = false;
            private final Resource this$0;

            {
                this.this$0 = this;
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return !this.done;
            }

            @Override // java.util.Iterator
            public Object next() {
                if (this.done) {
                    throw new NoSuchElementException();
                }
                this.done = true;
                return this.this$0;
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException();
            }
        };
    }

    public void setDirectory(boolean z) {
        checkAttributesAllowed();
        this.directory = z ? Boolean.TRUE : Boolean.FALSE;
    }

    public void setExists(boolean z) {
        checkAttributesAllowed();
        this.exists = z ? Boolean.TRUE : Boolean.FALSE;
    }

    public void setLastModified(long j) {
        checkAttributesAllowed();
        this.lastmodified = new Long(j);
    }

    public void setName(String str) {
        checkAttributesAllowed();
        this.name = str;
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) {
        if (this.name == null && this.exists == null && this.lastmodified == null && this.directory == null && this.size == null) {
            super.setRefid(reference);
            return;
        }
        throw tooManyAttributes();
    }

    public void setSize(long j) {
        checkAttributesAllowed();
        if (j <= -1) {
            j = -1;
        }
        this.size = new Long(j);
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public int size() {
        return isReference() ? ((Resource) getCheckedRef()).size() : 1;
    }

    public final String toLongString() {
        return isReference() ? ((Resource) getCheckedRef()).toLongString() : new StringBuffer().append(getDataTypeName()).append(" \"").append(toString()).append('\"').toString();
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        String str;
        if (isReference()) {
            str = getCheckedRef().toString();
        } else {
            String name = getName();
            str = name;
            if (name == null) {
                str = "(anonymous)";
            }
        }
        return str;
    }
}
