package org.apache.tools.ant.types;

import java.io.File;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.FileResourceIterator;
import org.apache.tools.ant.types.selectors.SelectorUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/ArchiveScanner.class */
public abstract class ArchiveScanner extends DirectoryScanner {
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private String encoding;
    private Resource lastScannedResource;
    private Resource src;
    protected File srcFile;
    private TreeMap fileEntries = new TreeMap();
    private TreeMap dirEntries = new TreeMap();
    private TreeMap matchFileEntries = new TreeMap();
    private TreeMap matchDirEntries = new TreeMap();
    private boolean errorOnMissingArchive = true;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void scanme() {
        if (this.src.isExists() || this.errorOnMissingArchive) {
            Resource resource = new Resource(this.src.getName(), this.src.isExists(), this.src.getLastModified());
            if (this.lastScannedResource != null && this.lastScannedResource.getName().equals(resource.getName()) && this.lastScannedResource.getLastModified() == resource.getLastModified()) {
                return;
            }
            init();
            this.fileEntries.clear();
            this.dirEntries.clear();
            this.matchFileEntries.clear();
            this.matchDirEntries.clear();
            fillMapsFromArchive(this.src, this.encoding, this.fileEntries, this.matchFileEntries, this.dirEntries, this.matchDirEntries);
            this.lastScannedResource = resource;
        }
    }

    protected static final String trimSeparator(String str) {
        String str2 = str;
        if (str.endsWith("/")) {
            str2 = str.substring(0, str.length() - 1);
        }
        return str2;
    }

    protected abstract void fillMapsFromArchive(Resource resource, String str, Map map, Map map2, Map map3, Map map4);

    @Override // org.apache.tools.ant.DirectoryScanner, org.apache.tools.ant.FileScanner
    public String[] getIncludedDirectories() {
        String[] strArr;
        if (this.src == null) {
            strArr = super.getIncludedDirectories();
        } else {
            scanme();
            Set keySet = this.matchDirEntries.keySet();
            strArr = (String[]) keySet.toArray(new String[keySet.size()]);
        }
        return strArr;
    }

    @Override // org.apache.tools.ant.DirectoryScanner
    public int getIncludedDirsCount() {
        int size;
        if (this.src == null) {
            size = super.getIncludedDirsCount();
        } else {
            scanme();
            size = this.matchDirEntries.size();
        }
        return size;
    }

    @Override // org.apache.tools.ant.DirectoryScanner, org.apache.tools.ant.FileScanner
    public String[] getIncludedFiles() {
        String[] strArr;
        if (this.src == null) {
            strArr = super.getIncludedFiles();
        } else {
            scanme();
            Set keySet = this.matchFileEntries.keySet();
            strArr = (String[]) keySet.toArray(new String[keySet.size()]);
        }
        return strArr;
    }

    @Override // org.apache.tools.ant.DirectoryScanner
    public int getIncludedFilesCount() {
        int size;
        if (this.src == null) {
            size = super.getIncludedFilesCount();
        } else {
            scanme();
            size = this.matchFileEntries.size();
        }
        return size;
    }

    @Override // org.apache.tools.ant.DirectoryScanner, org.apache.tools.ant.types.ResourceFactory
    public Resource getResource(String str) {
        Resource resource;
        if (this.src == null) {
            resource = super.getResource(str);
        } else if (str.equals("")) {
            resource = new Resource("", true, Long.MAX_VALUE, true);
        } else {
            scanme();
            if (this.fileEntries.containsKey(str)) {
                resource = (Resource) this.fileEntries.get(str);
            } else {
                String trimSeparator = trimSeparator(str);
                resource = this.dirEntries.containsKey(trimSeparator) ? (Resource) this.dirEntries.get(trimSeparator) : new Resource(trimSeparator);
            }
        }
        return resource;
    }

    Iterator getResourceDirectories(Project project) {
        FileResourceIterator it;
        if (this.src == null) {
            it = new FileResourceIterator(project, getBasedir(), getIncludedDirectories());
        } else {
            scanme();
            it = this.matchDirEntries.values().iterator();
        }
        return it;
    }

    Iterator getResourceFiles(Project project) {
        FileResourceIterator it;
        if (this.src == null) {
            it = new FileResourceIterator(project, getBasedir(), getIncludedFiles());
        } else {
            scanme();
            it = this.matchFileEntries.values().iterator();
        }
        return it;
    }

    public void init() {
        if (this.includes == null) {
            this.includes = new String[1];
            this.includes[0] = SelectorUtils.DEEP_TREE_MATCH;
        }
        if (this.excludes == null) {
            this.excludes = new String[0];
        }
    }

    public boolean match(String str) {
        String replace = str.replace('/', File.separatorChar).replace('\\', File.separatorChar);
        return isIncluded(replace) && !isExcluded(replace);
    }

    @Override // org.apache.tools.ant.DirectoryScanner, org.apache.tools.ant.FileScanner
    public void scan() {
        if (this.src != null) {
            if (!this.src.isExists() && !this.errorOnMissingArchive) {
                return;
            }
            super.scan();
        }
    }

    public void setEncoding(String str) {
        this.encoding = str;
    }

    public void setErrorOnMissingArchive(boolean z) {
        this.errorOnMissingArchive = z;
    }

    public void setSrc(File file) {
        setSrc(new FileResource(file));
    }

    public void setSrc(Resource resource) {
        Class cls;
        this.src = resource;
        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
            cls = class$("org.apache.tools.ant.types.resources.FileProvider");
            class$org$apache$tools$ant$types$resources$FileProvider = cls;
        } else {
            cls = class$org$apache$tools$ant$types$resources$FileProvider;
        }
        FileProvider fileProvider = (FileProvider) resource.as(cls);
        if (fileProvider != null) {
            this.srcFile = fileProvider.getFile();
        }
    }
}
