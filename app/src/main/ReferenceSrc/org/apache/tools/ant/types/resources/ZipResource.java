package org.apache.tools.ant.types.resources;

import java.io.File;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipExtraField;
import org.apache.tools.zip.ZipFile;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/ZipResource.class */
public class ZipResource extends ArchiveResource {
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private String encoding;
    private ZipExtraField[] extras;
    private int method;

    public ZipResource() {
    }

    public ZipResource(File file, String str, ZipEntry zipEntry) {
        super(file, true);
        setEncoding(str);
        setEntry(zipEntry);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void setEntry(ZipEntry zipEntry) {
        if (zipEntry == null) {
            setExists(false);
            return;
        }
        setName(zipEntry.getName());
        setExists(true);
        setLastModified(zipEntry.getTime());
        setDirectory(zipEntry.isDirectory());
        setSize(zipEntry.getSize());
        setMode(zipEntry.getUnixMode());
        this.extras = zipEntry.getExtraFields(true);
        this.method = zipEntry.getMethod();
    }

    @Override // org.apache.tools.ant.types.resources.ArchiveResource
    public void addConfigured(ResourceCollection resourceCollection) {
        super.addConfigured(resourceCollection);
        if (!resourceCollection.isFilesystemOnly()) {
            throw new BuildException("only filesystem resources are supported");
        }
    }

    @Override // org.apache.tools.ant.types.resources.ArchiveResource
    protected void fetchEntry() {
        ZipFile zipFile;
        Throwable th;
        IOException e;
        try {
            try {
                zipFile = new ZipFile(getZipfile(), getEncoding());
            } catch (Throwable th2) {
                th = th2;
                zipFile = null;
            }
        } catch (IOException e2) {
            e = e2;
            zipFile = null;
        }
        try {
            setEntry(zipFile.getEntry(getName()));
            ZipFile.closeQuietly(zipFile);
        } catch (IOException e3) {
            e = e3;
            log(e.getMessage(), 4);
            ZipFile zipFile2 = zipFile;
            ZipFile zipFile3 = zipFile;
            ZipFile zipFile4 = zipFile;
            throw new BuildException(e);
        } catch (Throwable th3) {
            th = th3;
            ZipFile.closeQuietly(zipFile);
            throw th;
        }
    }

    public String getEncoding() {
        return isReference() ? ((ZipResource) getCheckedRef()).getEncoding() : this.encoding;
    }

    public ZipExtraField[] getExtraFields() {
        ZipExtraField[] zipExtraFieldArr;
        if (isReference()) {
            zipExtraFieldArr = ((ZipResource) getCheckedRef()).getExtraFields();
        } else {
            checkEntry();
            zipExtraFieldArr = this.extras == null ? new ZipExtraField[0] : this.extras;
        }
        return zipExtraFieldArr;
    }

    @Override // org.apache.tools.ant.types.Resource
    public InputStream getInputStream() throws IOException {
        FilterInputStream filterInputStream;
        if (isReference()) {
            filterInputStream = ((Resource) getCheckedRef()).getInputStream();
        } else {
            ZipFile zipFile = new ZipFile(getZipfile(), getEncoding());
            ZipEntry entry = zipFile.getEntry(getName());
            if (entry == null) {
                zipFile.close();
                throw new BuildException(new StringBuffer().append("no entry ").append(getName()).append(" in ").append(getArchive()).toString());
            }
            filterInputStream = new FilterInputStream(this, zipFile.getInputStream(entry), zipFile) { // from class: org.apache.tools.ant.types.resources.ZipResource.1
                private final ZipResource this$0;
                private final ZipFile val$z;

                {
                    this.this$0 = this;
                    this.val$z = zipFile;
                }

                @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
                public void close() throws IOException {
                    FileUtils.close(this.in);
                    this.val$z.close();
                }

                protected void finalize() throws Throwable {
                    try {
                        close();
                    } finally {
                        super.finalize();
                    }
                }
            };
        }
        return filterInputStream;
    }

    public int getMethod() {
        return this.method;
    }

    @Override // org.apache.tools.ant.types.Resource
    public OutputStream getOutputStream() throws IOException {
        if (isReference()) {
            return ((Resource) getCheckedRef()).getOutputStream();
        }
        throw new UnsupportedOperationException("Use the zip task for zip output.");
    }

    public File getZipfile() {
        Class cls;
        Resource archive = getArchive();
        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
            cls = class$("org.apache.tools.ant.types.resources.FileProvider");
            class$org$apache$tools$ant$types$resources$FileProvider = cls;
        } else {
            cls = class$org$apache$tools$ant$types$resources$FileProvider;
        }
        return ((FileProvider) archive.as(cls)).getFile();
    }

    public void setEncoding(String str) {
        checkAttributesAllowed();
        this.encoding = str;
    }

    @Override // org.apache.tools.ant.types.resources.ArchiveResource, org.apache.tools.ant.types.Resource, org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) {
        if (this.encoding != null) {
            throw tooManyAttributes();
        }
        super.setRefid(reference);
    }

    public void setZipfile(File file) {
        setArchive(file);
    }
}
