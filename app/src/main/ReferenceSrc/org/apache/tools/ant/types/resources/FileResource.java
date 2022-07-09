package org.apache.tools.ant.types.resources;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceFactory;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/FileResource.class */
public class FileResource extends Resource implements Touchable, FileProvider, ResourceFactory, Appendable {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static final int NULL_FILE = Resource.getMagicNumber("null file".getBytes());
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private File baseDir;
    private File file;

    public FileResource() {
    }

    public FileResource(File file) {
        setFile(file);
    }

    public FileResource(File file, String str) {
        setFile(FILE_UTILS.resolveFile(file, str));
        setBaseDir(file);
    }

    public FileResource(Project project, File file) {
        setProject(project);
        setFile(file);
    }

    public FileResource(Project project, String str) {
        this(project, project.resolveFile(str));
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private OutputStream getOutputStream(boolean z) throws IOException {
        File notNullFile = getNotNullFile();
        if (!notNullFile.exists()) {
            File parentFile = notNullFile.getParentFile();
            if (parentFile != null && !parentFile.exists()) {
                parentFile.mkdirs();
            }
        } else if (notNullFile.isFile() && !z) {
            notNullFile.delete();
        }
        return z ? new FileOutputStream(notNullFile.getAbsolutePath(), true) : new FileOutputStream(notNullFile);
    }

    @Override // org.apache.tools.ant.types.Resource, java.lang.Comparable
    public int compareTo(Object obj) {
        int compareTo;
        Class cls;
        if (isReference()) {
            compareTo = ((Comparable) getCheckedRef()).compareTo(obj);
        } else if (equals(obj)) {
            compareTo = 0;
        } else {
            if (obj instanceof Resource) {
                Resource resource = (Resource) obj;
                if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                    cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                    class$org$apache$tools$ant$types$resources$FileProvider = cls;
                } else {
                    cls = class$org$apache$tools$ant$types$resources$FileProvider;
                }
                FileProvider fileProvider = (FileProvider) resource.as(cls);
                if (fileProvider != null) {
                    File file = getFile();
                    if (file == null) {
                        compareTo = -1;
                    } else {
                        File file2 = fileProvider.getFile();
                        compareTo = file2 == null ? 1 : file.compareTo(file2);
                    }
                }
            }
            compareTo = super.compareTo(obj);
        }
        return compareTo;
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
                FileResource fileResource = (FileResource) obj;
                if (getFile() != null) {
                    z = getFile().equals(fileResource.getFile());
                } else if (fileResource.getFile() != null) {
                    z = false;
                }
            }
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.resources.Appendable
    public OutputStream getAppendOutputStream() throws IOException {
        return isReference() ? ((FileResource) getCheckedRef()).getAppendOutputStream() : getOutputStream(true);
    }

    public File getBaseDir() {
        File file;
        if (isReference()) {
            file = ((FileResource) getCheckedRef()).getBaseDir();
        } else {
            dieOnCircularReference();
            file = this.baseDir;
        }
        return file;
    }

    @Override // org.apache.tools.ant.types.resources.FileProvider
    public File getFile() {
        File file;
        if (isReference()) {
            file = ((FileResource) getCheckedRef()).getFile();
        } else {
            dieOnCircularReference();
            synchronized (this) {
                if (this.file == null) {
                    File baseDir = getBaseDir();
                    String name = super.getName();
                    if (name != null) {
                        setFile(FILE_UTILS.resolveFile(baseDir, name));
                    }
                }
            }
            file = this.file;
        }
        return file;
    }

    @Override // org.apache.tools.ant.types.Resource
    public InputStream getInputStream() throws IOException {
        return isReference() ? ((Resource) getCheckedRef()).getInputStream() : new FileInputStream(getNotNullFile());
    }

    @Override // org.apache.tools.ant.types.Resource
    public long getLastModified() {
        return isReference() ? ((Resource) getCheckedRef()).getLastModified() : getNotNullFile().lastModified();
    }

    @Override // org.apache.tools.ant.types.Resource
    public String getName() {
        String name;
        if (isReference()) {
            name = ((Resource) getCheckedRef()).getName();
        } else {
            File baseDir = getBaseDir();
            name = baseDir == null ? getNotNullFile().getName() : FILE_UTILS.removeLeadingPath(baseDir, getNotNullFile());
        }
        return name;
    }

    protected File getNotNullFile() {
        if (getFile() == null) {
            throw new BuildException("file attribute is null!");
        }
        dieOnCircularReference();
        return getFile();
    }

    @Override // org.apache.tools.ant.types.Resource
    public OutputStream getOutputStream() throws IOException {
        return isReference() ? ((FileResource) getCheckedRef()).getOutputStream() : getOutputStream(false);
    }

    @Override // org.apache.tools.ant.types.ResourceFactory
    public Resource getResource(String str) {
        FileResource fileResource = new FileResource(FILE_UTILS.resolveFile(getFile(), str));
        fileResource.setBaseDir(getBaseDir());
        return fileResource;
    }

    @Override // org.apache.tools.ant.types.Resource
    public long getSize() {
        return isReference() ? ((Resource) getCheckedRef()).getSize() : getNotNullFile().length();
    }

    @Override // org.apache.tools.ant.types.Resource
    public int hashCode() {
        int hashCode;
        if (isReference()) {
            hashCode = getCheckedRef().hashCode();
        } else {
            hashCode = (getFile() == null ? NULL_FILE : getFile().hashCode()) * MAGIC;
        }
        return hashCode;
    }

    @Override // org.apache.tools.ant.types.Resource
    public boolean isDirectory() {
        return isReference() ? ((Resource) getCheckedRef()).isDirectory() : getNotNullFile().isDirectory();
    }

    @Override // org.apache.tools.ant.types.Resource
    public boolean isExists() {
        return isReference() ? ((Resource) getCheckedRef()).isExists() : getNotNullFile().exists();
    }

    @Override // org.apache.tools.ant.types.Resource, org.apache.tools.ant.types.ResourceCollection
    public boolean isFilesystemOnly() {
        boolean z;
        if (isReference()) {
            z = ((FileResource) getCheckedRef()).isFilesystemOnly();
        } else {
            dieOnCircularReference();
            z = true;
        }
        return z;
    }

    public void setBaseDir(File file) {
        checkAttributesAllowed();
        this.baseDir = file;
    }

    public void setFile(File file) {
        checkAttributesAllowed();
        this.file = file;
    }

    @Override // org.apache.tools.ant.types.Resource, org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) {
        if (this.file == null && this.baseDir == null) {
            super.setRefid(reference);
            return;
        }
        throw tooManyAttributes();
    }

    @Override // org.apache.tools.ant.types.Resource, org.apache.tools.ant.types.DataType
    public String toString() {
        String absolutePath;
        if (isReference()) {
            absolutePath = getCheckedRef().toString();
        } else if (this.file == null) {
            absolutePath = "(unbound file resource)";
        } else {
            absolutePath = FILE_UTILS.normalize(this.file.getAbsolutePath()).getAbsolutePath();
        }
        return absolutePath;
    }

    @Override // org.apache.tools.ant.types.resources.Touchable
    public void touch(long j) {
        if (isReference()) {
            ((FileResource) getCheckedRef()).touch(j);
        } else if (getNotNullFile().setLastModified(j)) {
        } else {
            log("Failed to change file modification time", 1);
        }
    }
}
