package org.apache.tools.ant.types;

import java.io.File;
import java.util.Iterator;
import java.util.Stack;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;

/* loaded from: classes.jar:org/apache/tools/ant/types/ArchiveFileSet.class */
public abstract class ArchiveFileSet extends FileSet {
    private static final int BASE_OCTAL = 8;
    public static final int DEFAULT_DIR_MODE = 16877;
    public static final int DEFAULT_FILE_MODE = 33188;
    private static final String ERROR_DIR_AND_SRC_ATTRIBUTES = "Cannot set both dir and src attributes";
    private static final String ERROR_PATH_AND_PREFIX = "Cannot set both fullpath and prefix attributes";
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private int dirMode;
    private boolean dirModeHasBeenSet;
    private boolean errorOnMissingArchive;
    private int fileMode;
    private boolean fileModeHasBeenSet;
    private String fullpath;
    private boolean hasDir;
    private String prefix;
    private Resource src;

    public ArchiveFileSet() {
        this.src = null;
        this.prefix = "";
        this.fullpath = "";
        this.hasDir = false;
        this.fileMode = 33188;
        this.dirMode = 16877;
        this.fileModeHasBeenSet = false;
        this.dirModeHasBeenSet = false;
        this.errorOnMissingArchive = true;
    }

    protected ArchiveFileSet(ArchiveFileSet archiveFileSet) {
        super(archiveFileSet);
        this.src = null;
        this.prefix = "";
        this.fullpath = "";
        this.hasDir = false;
        this.fileMode = 33188;
        this.dirMode = 16877;
        this.fileModeHasBeenSet = false;
        this.dirModeHasBeenSet = false;
        this.errorOnMissingArchive = true;
        this.src = archiveFileSet.src;
        this.prefix = archiveFileSet.prefix;
        this.fullpath = archiveFileSet.fullpath;
        this.hasDir = archiveFileSet.hasDir;
        this.fileMode = archiveFileSet.fileMode;
        this.dirMode = archiveFileSet.dirMode;
        this.fileModeHasBeenSet = archiveFileSet.fileModeHasBeenSet;
        this.dirModeHasBeenSet = archiveFileSet.dirModeHasBeenSet;
        this.errorOnMissingArchive = archiveFileSet.errorOnMissingArchive;
    }

    protected ArchiveFileSet(FileSet fileSet) {
        super(fileSet);
        this.src = null;
        this.prefix = "";
        this.fullpath = "";
        this.hasDir = false;
        this.fileMode = 33188;
        this.dirMode = 16877;
        this.fileModeHasBeenSet = false;
        this.dirModeHasBeenSet = false;
        this.errorOnMissingArchive = true;
    }

    private void checkArchiveAttributesAllowed() {
        if (getProject() == null || (isReference() && (getRefid().getReferencedObject(getProject()) instanceof ArchiveFileSet))) {
            checkAttributesAllowed();
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public void addConfigured(ResourceCollection resourceCollection) {
        checkChildrenAllowed();
        if (resourceCollection.size() != 1) {
            throw new BuildException("only single argument resource collections are supported as archives");
        }
        setSrcResource((Resource) resourceCollection.iterator().next());
    }

    @Override // org.apache.tools.ant.types.FileSet, org.apache.tools.ant.types.AbstractFileSet, org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() {
        return isReference() ? ((ArchiveFileSet) getRef(getProject())).clone() : super.clone();
    }

    protected void configureFileSet(ArchiveFileSet archiveFileSet) {
        archiveFileSet.setPrefix(this.prefix);
        archiveFileSet.setFullpath(this.fullpath);
        archiveFileSet.fileModeHasBeenSet = this.fileModeHasBeenSet;
        archiveFileSet.fileMode = this.fileMode;
        archiveFileSet.dirModeHasBeenSet = this.dirModeHasBeenSet;
        archiveFileSet.dirMode = this.dirMode;
    }

    @Override // org.apache.tools.ant.types.AbstractFileSet, org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        synchronized (this) {
            if (!isChecked()) {
                super.dieOnCircularReference(stack, project);
                if (!isReference()) {
                    if (this.src != null) {
                        pushAndInvokeCircularReferenceCheck(this.src, stack, project);
                    }
                    setChecked(true);
                }
            }
        }
    }

    @Override // org.apache.tools.ant.types.DataType
    protected Object getCheckedRef(Project project) {
        return getRef(project);
    }

    public int getDirMode() {
        return this.dirMode;
    }

    public int getDirMode(Project project) {
        int i;
        if (isReference()) {
            i = ((ArchiveFileSet) getRef(project)).getDirMode(project);
        } else {
            dieOnCircularReference();
            i = this.dirMode;
        }
        return i;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v24, types: [org.apache.tools.ant.DirectoryScanner] */
    /* JADX WARN: Type inference failed for: r5v0, types: [org.apache.tools.ant.types.FileSet, org.apache.tools.ant.types.ArchiveFileSet] */
    @Override // org.apache.tools.ant.types.AbstractFileSet
    public DirectoryScanner getDirectoryScanner(Project project) {
        ArchiveScanner archiveScanner;
        if (isReference()) {
            archiveScanner = getRef(project).getDirectoryScanner(project);
        } else {
            dieOnCircularReference();
            if (this.src == null) {
                archiveScanner = super.getDirectoryScanner(project);
            } else if (!this.src.isExists() && this.errorOnMissingArchive) {
                throw new BuildException(new StringBuffer().append("The archive ").append(this.src.getName()).append(" doesn't exist").toString());
            } else {
                if (this.src.isDirectory()) {
                    throw new BuildException(new StringBuffer().append("The archive ").append(this.src.getName()).append(" can't be a directory").toString());
                }
                ArchiveScanner newArchiveScanner = newArchiveScanner();
                newArchiveScanner.setErrorOnMissingArchive(this.errorOnMissingArchive);
                newArchiveScanner.setSrc(this.src);
                super.setDir(project.getBaseDir());
                setupDirectoryScanner(newArchiveScanner, project);
                newArchiveScanner.init();
                archiveScanner = newArchiveScanner;
            }
        }
        return archiveScanner;
    }

    public int getFileMode() {
        return this.fileMode;
    }

    public int getFileMode(Project project) {
        int i;
        if (isReference()) {
            i = ((ArchiveFileSet) getRef(project)).getFileMode(project);
        } else {
            dieOnCircularReference();
            i = this.fileMode;
        }
        return i;
    }

    public String getFullpath() {
        return this.fullpath;
    }

    public String getFullpath(Project project) {
        String str;
        if (isReference()) {
            str = ((ArchiveFileSet) getRef(project)).getFullpath(project);
        } else {
            dieOnCircularReference(project);
            str = this.fullpath;
        }
        return str;
    }

    public String getPrefix() {
        return this.prefix;
    }

    public String getPrefix(Project project) {
        String str;
        if (isReference()) {
            str = ((ArchiveFileSet) getRef(project)).getPrefix(project);
        } else {
            dieOnCircularReference(project);
            str = this.prefix;
        }
        return str;
    }

    public File getSrc() {
        File file;
        Class cls;
        if (isReference()) {
            file = ((ArchiveFileSet) getCheckedRef()).getSrc();
        } else {
            dieOnCircularReference();
            if (this.src != null) {
                Resource resource = this.src;
                if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                    cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                    class$org$apache$tools$ant$types$resources$FileProvider = cls;
                } else {
                    cls = class$org$apache$tools$ant$types$resources$FileProvider;
                }
                FileProvider fileProvider = (FileProvider) resource.as(cls);
                if (fileProvider != null) {
                    file = fileProvider.getFile();
                }
            }
            file = null;
        }
        return file;
    }

    public File getSrc(Project project) {
        return isReference() ? ((ArchiveFileSet) getRef(project)).getSrc(project) : getSrc();
    }

    public boolean hasDirModeBeenSet() {
        boolean z;
        if (isReference()) {
            z = ((ArchiveFileSet) getRef(getProject())).hasDirModeBeenSet();
        } else {
            dieOnCircularReference();
            z = this.dirModeHasBeenSet;
        }
        return z;
    }

    public boolean hasFileModeBeenSet() {
        boolean z;
        if (isReference()) {
            z = ((ArchiveFileSet) getRef(getProject())).hasFileModeBeenSet();
        } else {
            dieOnCircularReference();
            z = this.fileModeHasBeenSet;
        }
        return z;
    }

    public void integerSetDirMode(int i) {
        this.dirModeHasBeenSet = true;
        this.dirMode = i | 16384;
    }

    public void integerSetFileMode(int i) {
        this.fileModeHasBeenSet = true;
        this.fileMode = 32768 | i;
    }

    @Override // org.apache.tools.ant.types.FileSet, org.apache.tools.ant.types.ResourceCollection
    public boolean isFilesystemOnly() {
        boolean z;
        if (isReference()) {
            z = ((ArchiveFileSet) getCheckedRef()).isFilesystemOnly();
        } else {
            dieOnCircularReference();
            z = this.src == null;
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.FileSet, org.apache.tools.ant.types.ResourceCollection
    public Iterator iterator() {
        return isReference() ? ((ResourceCollection) getRef(getProject())).iterator() : this.src == null ? super.iterator() : ((ArchiveScanner) getDirectoryScanner(getProject())).getResourceFiles(getProject());
    }

    protected abstract ArchiveScanner newArchiveScanner();

    @Override // org.apache.tools.ant.types.AbstractFileSet
    public void setDir(File file) throws BuildException {
        checkAttributesAllowed();
        if (this.src != null) {
            throw new BuildException(ERROR_DIR_AND_SRC_ATTRIBUTES);
        }
        super.setDir(file);
        this.hasDir = true;
    }

    public void setDirMode(String str) {
        checkArchiveAttributesAllowed();
        integerSetDirMode(Integer.parseInt(str, 8));
    }

    public void setErrorOnMissingArchive(boolean z) {
        checkAttributesAllowed();
        this.errorOnMissingArchive = z;
    }

    public void setFileMode(String str) {
        checkArchiveAttributesAllowed();
        integerSetFileMode(Integer.parseInt(str, 8));
    }

    public void setFullpath(String str) {
        checkArchiveAttributesAllowed();
        if ("".equals(this.prefix) || "".equals(str)) {
            this.fullpath = str;
            return;
        }
        throw new BuildException(ERROR_PATH_AND_PREFIX);
    }

    public void setPrefix(String str) {
        checkArchiveAttributesAllowed();
        if ("".equals(str) || "".equals(this.fullpath)) {
            this.prefix = str;
            return;
        }
        throw new BuildException(ERROR_PATH_AND_PREFIX);
    }

    public void setSrc(File file) {
        setSrcResource(new FileResource(file));
    }

    public void setSrcResource(Resource resource) {
        checkArchiveAttributesAllowed();
        if (this.hasDir) {
            throw new BuildException(ERROR_DIR_AND_SRC_ATTRIBUTES);
        }
        this.src = resource;
        setChecked(false);
    }

    @Override // org.apache.tools.ant.types.FileSet, org.apache.tools.ant.types.ResourceCollection
    public int size() {
        return isReference() ? ((ResourceCollection) getRef(getProject())).size() : this.src == null ? super.size() : ((ArchiveScanner) getDirectoryScanner(getProject())).getIncludedFilesCount();
    }

    @Override // org.apache.tools.ant.types.AbstractFileSet, org.apache.tools.ant.types.DataType
    public String toString() {
        return (!this.hasDir || getProject() == null) ? this.src == null ? null : this.src.getName() : super.toString();
    }
}
