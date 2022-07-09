package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.FilterChain;
import org.apache.tools.ant.types.FilterSet;
import org.apache.tools.ant.types.FilterSetCollection;
import org.apache.tools.ant.types.Mapper;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.ResourceFactory;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.FlatFileNameMapper;
import org.apache.tools.ant.util.IdentityMapper;
import org.apache.tools.ant.util.LinkedHashtable;
import org.apache.tools.ant.util.ResourceUtils;
import org.apache.tools.ant.util.SourceFileScanner;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Copy.class */
public class Copy extends Task {
    private static final String MSG_WHEN_COPYING_EMPTY_RC_TO_FILE = "Cannot perform operation from directory to file.";
    static Class class$java$io$IOException;
    static Class class$org$apache$tools$ant$taskdefs$Copy;
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private long granularity;
    static final File NULL_FILE_PLACEHOLDER = new File("/NULL_FILE");
    static final String LINE_SEPARATOR = System.getProperty("line.separator");
    protected File file = null;
    protected File destFile = null;
    protected File destDir = null;
    protected Vector rcs = new Vector();
    protected Vector filesets = this.rcs;
    private boolean enableMultipleMappings = false;
    protected boolean filtering = false;
    protected boolean preserveLastModified = false;
    protected boolean forceOverwrite = false;
    protected boolean flatten = false;
    protected int verbosity = 3;
    protected boolean includeEmpty = true;
    protected boolean failonerror = true;
    protected Hashtable fileCopyMap = new LinkedHashtable();
    protected Hashtable dirCopyMap = new LinkedHashtable();
    protected Hashtable completeDirMap = new LinkedHashtable();
    protected Mapper mapperElement = null;
    private Vector filterChains = new Vector();
    private Vector filterSets = new Vector();
    private String inputEncoding = null;
    private String outputEncoding = null;
    private boolean force = false;
    private boolean quiet = false;
    private Resource singleResource = null;
    protected FileUtils fileUtils = FileUtils.getFileUtils();

    public Copy() {
        this.granularity = 0L;
        this.granularity = this.fileUtils.getFileTimestampGranularity();
    }

    private static void add(File file, String str, Map map) {
        if (str != null) {
            add(file, new String[]{str}, map);
        }
    }

    private static void add(File file, String[] strArr, Map map) {
        if (strArr != null) {
            File keyFile = getKeyFile(file);
            List list = (List) map.get(keyFile);
            ArrayList arrayList = list;
            if (list == null) {
                arrayList = new ArrayList(strArr.length);
                map.put(keyFile, arrayList);
            }
            arrayList.addAll(Arrays.asList(strArr));
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void copySingleFile() {
        if (this.file != null) {
            if (!this.file.exists()) {
                String stringBuffer = new StringBuffer().append("Warning: Could not find file ").append(this.file.getAbsolutePath()).append(" to copy.").toString();
                if (this.failonerror) {
                    throw new BuildException(stringBuffer);
                }
                if (this.quiet) {
                    return;
                }
                log(stringBuffer, 0);
                return;
            }
            if (this.destFile == null) {
                this.destFile = new File(this.destDir, this.file.getName());
            }
            if (this.forceOverwrite || !this.destFile.exists() || this.file.lastModified() - this.granularity > this.destFile.lastModified()) {
                this.fileCopyMap.put(this.file.getAbsolutePath(), new String[]{this.destFile.getAbsolutePath()});
            } else {
                log(new StringBuffer().append(this.file).append(" omitted as ").append(this.destFile).append(" is up to date.").toString(), 3);
            }
        }
    }

    private String getDueTo(Exception exc) {
        Class<?> cls;
        Class<?> cls2 = exc.getClass();
        if (class$java$io$IOException == null) {
            cls = class$("java.io.IOException");
            class$java$io$IOException = cls;
        } else {
            cls = class$java$io$IOException;
        }
        boolean z = cls2 == cls;
        StringBuffer stringBuffer = new StringBuffer();
        if (!z || exc.getMessage() == null) {
            stringBuffer.append(exc.getClass().getName());
        }
        if (exc.getMessage() != null) {
            if (!z) {
                stringBuffer.append(" ");
            }
            stringBuffer.append(exc.getMessage());
        }
        if (exc.getClass().getName().indexOf("MalformedInput") != -1) {
            stringBuffer.append(LINE_SEPARATOR);
            stringBuffer.append("This is normally due to the input file containing invalid");
            stringBuffer.append(LINE_SEPARATOR);
            stringBuffer.append("bytes for the character encoding used : ");
            stringBuffer.append(this.inputEncoding == null ? this.fileUtils.getDefaultEncoding() : this.inputEncoding);
            stringBuffer.append(LINE_SEPARATOR);
        }
        return stringBuffer.toString();
    }

    private static File getKeyFile(File file) {
        File file2 = file;
        if (file == null) {
            file2 = NULL_FILE_PLACEHOLDER;
        }
        return file2;
    }

    private FileNameMapper getMapper() {
        return this.mapperElement != null ? this.mapperElement.getImplementation() : this.flatten ? new FlatFileNameMapper() : new IdentityMapper();
    }

    private String getMessage(Exception exc) {
        return exc.getMessage() == null ? exc.toString() : exc.getMessage();
    }

    private void iterateOverBaseDirs(HashSet hashSet, HashMap hashMap, HashMap hashMap2) {
        Iterator it = hashSet.iterator();
        while (it.hasNext()) {
            File file = (File) it.next();
            List list = (List) hashMap2.get(file);
            List list2 = (List) hashMap.get(file);
            String[] strArr = new String[0];
            String[] strArr2 = strArr;
            if (list != null) {
                strArr2 = (String[]) list.toArray(strArr);
            }
            String[] strArr3 = new String[0];
            String[] strArr4 = strArr3;
            if (list2 != null) {
                strArr4 = (String[]) list2.toArray(strArr3);
            }
            File file2 = file;
            if (file == NULL_FILE_PLACEHOLDER) {
                file2 = null;
            }
            scan(file2, this.destDir, strArr2, strArr4);
        }
    }

    public void add(ResourceCollection resourceCollection) {
        this.rcs.add(resourceCollection);
    }

    public void add(FileNameMapper fileNameMapper) {
        createMapper().add(fileNameMapper);
    }

    public void addFileset(FileSet fileSet) {
        add(fileSet);
    }

    protected Map buildMap(Resource[] resourceArr, File file, FileNameMapper fileNameMapper) {
        Resource[] selectOutOfDateSources;
        HashMap hashMap = new HashMap();
        if (this.forceOverwrite) {
            Vector vector = new Vector();
            for (int i = 0; i < resourceArr.length; i++) {
                if (fileNameMapper.mapFileName(resourceArr[i].getName()) != null) {
                    vector.addElement(resourceArr[i]);
                }
            }
            selectOutOfDateSources = new Resource[vector.size()];
            vector.copyInto(selectOutOfDateSources);
        } else {
            selectOutOfDateSources = ResourceUtils.selectOutOfDateSources(this, resourceArr, fileNameMapper, new ResourceFactory(this, file) { // from class: org.apache.tools.ant.taskdefs.Copy.1
                private final Copy this$0;
                private final File val$toDir;

                {
                    this.this$0 = this;
                    this.val$toDir = file;
                }

                @Override // org.apache.tools.ant.types.ResourceFactory
                public Resource getResource(String str) {
                    return new FileResource(this.val$toDir, str);
                }
            }, this.granularity);
        }
        for (int i2 = 0; i2 < selectOutOfDateSources.length; i2++) {
            String[] mapFileName = fileNameMapper.mapFileName(selectOutOfDateSources[i2].getName());
            for (String str : mapFileName) {
                if (str == null) {
                    throw new BuildException("Can't copy a resource without a name if the mapper doesn't provide one.");
                }
            }
            if (!this.enableMultipleMappings) {
                hashMap.put(selectOutOfDateSources[i2], new String[]{new File(file, mapFileName[0]).getAbsolutePath()});
            } else {
                for (int i3 = 0; i3 < mapFileName.length; i3++) {
                    mapFileName[i3] = new File(file, mapFileName[i3]).getAbsolutePath();
                }
                hashMap.put(selectOutOfDateSources[i2], mapFileName);
            }
        }
        return hashMap;
    }

    protected void buildMap(File file, File file2, String[] strArr, FileNameMapper fileNameMapper, Hashtable hashtable) {
        String[] restrict;
        if (this.forceOverwrite) {
            Vector vector = new Vector();
            for (int i = 0; i < strArr.length; i++) {
                if (fileNameMapper.mapFileName(strArr[i]) != null) {
                    vector.addElement(strArr[i]);
                }
            }
            restrict = new String[vector.size()];
            vector.copyInto(restrict);
        } else {
            restrict = new SourceFileScanner(this).restrict(strArr, file, file2, fileNameMapper, this.granularity);
        }
        for (int i2 = 0; i2 < restrict.length; i2++) {
            File file3 = new File(file, restrict[i2]);
            String[] mapFileName = fileNameMapper.mapFileName(restrict[i2]);
            if (!this.enableMultipleMappings) {
                hashtable.put(file3.getAbsolutePath(), new String[]{new File(file2, mapFileName[0]).getAbsolutePath()});
            } else {
                for (int i3 = 0; i3 < mapFileName.length; i3++) {
                    mapFileName[i3] = new File(file2, mapFileName[i3]).getAbsolutePath();
                }
                hashtable.put(file3.getAbsolutePath(), mapFileName);
            }
        }
    }

    public FilterChain createFilterChain() {
        FilterChain filterChain = new FilterChain();
        this.filterChains.addElement(filterChain);
        return filterChain;
    }

    public FilterSet createFilterSet() {
        FilterSet filterSet = new FilterSet();
        this.filterSets.addElement(filterSet);
        return filterSet;
    }

    public Mapper createMapper() throws BuildException {
        if (this.mapperElement != null) {
            throw new BuildException(Expand.ERROR_MULTIPLE_MAPPERS, getLocation());
        }
        this.mapperElement = new Mapper(getProject());
        return this.mapperElement;
    }

    protected void doFileOperations() {
        String[] strArr;
        if (this.fileCopyMap.size() > 0) {
            log(new StringBuffer().append("Copying ").append(this.fileCopyMap.size()).append(" file").append(this.fileCopyMap.size() == 1 ? "" : "s").append(" to ").append(this.destDir.getAbsolutePath()).toString());
            Enumeration keys = this.fileCopyMap.keys();
            while (keys.hasMoreElements()) {
                String str = (String) keys.nextElement();
                for (String str2 : (String[]) this.fileCopyMap.get(str)) {
                    if (str.equals(str2)) {
                        log(new StringBuffer().append("Skipping self-copy of ").append(str).toString(), this.verbosity);
                    } else {
                        try {
                            log(new StringBuffer().append("Copying ").append(str).append(" to ").append(str2).toString(), this.verbosity);
                            FilterSetCollection filterSetCollection = new FilterSetCollection();
                            if (this.filtering) {
                                filterSetCollection.addFilterSet(getProject().getGlobalFilterSet());
                            }
                            Enumeration elements = this.filterSets.elements();
                            while (elements.hasMoreElements()) {
                                filterSetCollection.addFilterSet((FilterSet) elements.nextElement());
                            }
                            this.fileUtils.copyFile(new File(str), new File(str2), filterSetCollection, this.filterChains, this.forceOverwrite, this.preserveLastModified, false, this.inputEncoding, this.outputEncoding, getProject(), getForce());
                        } catch (IOException e) {
                            String stringBuffer = new StringBuffer().append("Failed to copy ").append(str).append(" to ").append(str2).append(" due to ").append(getDueTo(e)).toString();
                            File file = new File(str2);
                            String str3 = stringBuffer;
                            if (file.exists()) {
                                str3 = stringBuffer;
                                if (!file.delete()) {
                                    str3 = new StringBuffer().append(stringBuffer).append(" and I couldn't delete the corrupt ").append(str2).toString();
                                }
                            }
                            if (this.failonerror) {
                                throw new BuildException(str3, e, getLocation());
                            }
                            log(str3, 0);
                        }
                    }
                }
            }
        }
        if (this.includeEmpty) {
            Enumeration elements2 = this.dirCopyMap.elements();
            int i = 0;
            while (elements2.hasMoreElements()) {
                String[] strArr2 = (String[]) elements2.nextElement();
                int i2 = 0;
                while (true) {
                    int i3 = i;
                    i = i3;
                    if (i2 < strArr2.length) {
                        File file2 = new File(strArr2[i2]);
                        i = i3;
                        if (!file2.exists()) {
                            if (!file2.mkdirs()) {
                                log(new StringBuffer().append("Unable to create directory ").append(file2.getAbsolutePath()).toString(), 0);
                                i = i3;
                            } else {
                                i = i3 + 1;
                            }
                        }
                        i2++;
                    }
                }
            }
            if (i <= 0) {
                return;
            }
            log(new StringBuffer().append("Copied ").append(this.dirCopyMap.size()).append(" empty director").append(this.dirCopyMap.size() == 1 ? "y" : "ies").append(" to ").append(i).append(" empty director").append(i == 1 ? "y" : "ies").append(" under ").append(this.destDir.getAbsolutePath()).toString());
        }
    }

    protected void doResourceOperations(Map map) {
        String[] strArr;
        if (map.size() > 0) {
            log(new StringBuffer().append("Copying ").append(map.size()).append(" resource").append(map.size() == 1 ? "" : "s").append(" to ").append(this.destDir.getAbsolutePath()).toString());
            for (Resource resource : map.keySet()) {
                for (String str : (String[]) map.get(resource)) {
                    try {
                        log(new StringBuffer().append("Copying ").append(resource).append(" to ").append(str).toString(), this.verbosity);
                        FilterSetCollection filterSetCollection = new FilterSetCollection();
                        if (this.filtering) {
                            filterSetCollection.addFilterSet(getProject().getGlobalFilterSet());
                        }
                        Enumeration elements = this.filterSets.elements();
                        while (elements.hasMoreElements()) {
                            filterSetCollection.addFilterSet((FilterSet) elements.nextElement());
                        }
                        ResourceUtils.copyResource(resource, new FileResource(this.destDir, str), filterSetCollection, this.filterChains, this.forceOverwrite, this.preserveLastModified, false, this.inputEncoding, this.outputEncoding, getProject(), getForce());
                    } catch (IOException e) {
                        String stringBuffer = new StringBuffer().append("Failed to copy ").append(resource).append(" to ").append(str).append(" due to ").append(getDueTo(e)).toString();
                        File file = new File(str);
                        String str2 = stringBuffer;
                        if (file.exists()) {
                            str2 = stringBuffer;
                            if (!file.delete()) {
                                str2 = new StringBuffer().append(stringBuffer).append(" and I couldn't delete the corrupt ").append(str).toString();
                            }
                        }
                        if (this.failonerror) {
                            throw new BuildException(str2, e, getLocation());
                        }
                        log(str2, 0);
                    }
                }
            }
        }
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Hashtable hashtable;
        Class cls;
        File file = this.file;
        File file2 = this.destFile;
        File file3 = this.destDir;
        ResourceCollection resourceCollection = null;
        if (this.file == null) {
            resourceCollection = null;
            if (this.destFile != null) {
                resourceCollection = null;
                if (this.rcs.size() == 1) {
                    resourceCollection = (ResourceCollection) this.rcs.elementAt(0);
                }
            }
        }
        try {
            try {
                validateAttributes();
                copySingleFile();
                HashMap hashMap = new HashMap();
                HashMap hashMap2 = new HashMap();
                HashSet hashSet = new HashSet();
                ArrayList arrayList = new ArrayList();
                int size = this.rcs.size();
                for (int i = 0; i < size; i++) {
                    ResourceCollection<Resource> resourceCollection2 = (ResourceCollection) this.rcs.elementAt(i);
                    if ((resourceCollection2 instanceof FileSet) && resourceCollection2.isFilesystemOnly()) {
                        FileSet fileSet = (FileSet) resourceCollection2;
                        try {
                            DirectoryScanner directoryScanner = fileSet.getDirectoryScanner(getProject());
                            File dir = fileSet.getDir(getProject());
                            String[] includedFiles = directoryScanner.getIncludedFiles();
                            String[] includedDirectories = directoryScanner.getIncludedDirectories();
                            if (!this.flatten && this.mapperElement == null && directoryScanner.isEverythingIncluded() && !fileSet.hasPatterns()) {
                                this.completeDirMap.put(dir, this.destDir);
                            }
                            add(dir, includedFiles, hashMap);
                            add(dir, includedDirectories, hashMap2);
                            hashSet.add(dir);
                        } catch (BuildException e) {
                            if (this.failonerror || !getMessage(e).endsWith(DirectoryScanner.DOES_NOT_EXIST_POSTFIX)) {
                                throw e;
                            }
                            if (!this.quiet) {
                                log(new StringBuffer().append("Warning: ").append(getMessage(e)).toString(), 0);
                            }
                        }
                    } else if (!resourceCollection2.isFilesystemOnly() && !supportsNonFileResources()) {
                        throw new BuildException("Only FileSystem resources are supported.");
                    } else {
                        for (Resource resource : resourceCollection2) {
                            if (!resource.isExists()) {
                                String stringBuffer = new StringBuffer().append("Warning: Could not find resource ").append(resource.toLongString()).append(" to copy.").toString();
                                if (this.failonerror) {
                                    throw new BuildException(stringBuffer);
                                }
                                if (!this.quiet) {
                                    log(stringBuffer, 0);
                                }
                            } else {
                                File file4 = NULL_FILE_PLACEHOLDER;
                                String name = resource.getName();
                                if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                                    cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                                    class$org$apache$tools$ant$types$resources$FileProvider = cls;
                                } else {
                                    cls = class$org$apache$tools$ant$types$resources$FileProvider;
                                }
                                FileProvider fileProvider = (FileProvider) resource.as(cls);
                                File file5 = file4;
                                String str = name;
                                if (fileProvider != null) {
                                    FileResource asFileResource = ResourceUtils.asFileResource(fileProvider);
                                    File keyFile = getKeyFile(asFileResource.getBaseDir());
                                    file5 = keyFile;
                                    str = name;
                                    if (asFileResource.getBaseDir() == null) {
                                        str = asFileResource.getFile().getAbsolutePath();
                                        file5 = keyFile;
                                    }
                                }
                                if (resource.isDirectory() || fileProvider != null) {
                                    add(file5, str, resource.isDirectory() ? hashMap2 : hashMap);
                                    hashSet.add(file5);
                                } else {
                                    arrayList.add(resource);
                                }
                            }
                        }
                        continue;
                    }
                }
                iterateOverBaseDirs(hashSet, hashMap2, hashMap);
                try {
                    doFileOperations();
                } catch (BuildException e2) {
                    if (this.failonerror) {
                        throw e2;
                    }
                    if (!this.quiet) {
                        log(new StringBuffer().append("Warning: ").append(getMessage(e2)).toString(), 0);
                    }
                }
                if (arrayList.size() > 0 || this.singleResource != null) {
                    Map scan = scan((Resource[]) arrayList.toArray(new Resource[arrayList.size()]), this.destDir);
                    if (this.singleResource != null) {
                        scan.put(this.singleResource, new String[]{this.destFile.getAbsolutePath()});
                    }
                    try {
                        doResourceOperations(scan);
                    } catch (BuildException e3) {
                        if (this.failonerror) {
                            throw e3;
                        }
                        if (!this.quiet) {
                            log(new StringBuffer().append("Warning: ").append(getMessage(e3)).toString(), 0);
                        }
                    }
                }
                this.singleResource = null;
                this.file = file;
                this.destFile = file2;
                this.destDir = file3;
                if (resourceCollection != null) {
                    this.rcs.insertElementAt(resourceCollection, 0);
                }
                this.fileCopyMap.clear();
                this.dirCopyMap.clear();
                hashtable = this.completeDirMap;
            } catch (BuildException e4) {
                if (this.failonerror || !getMessage(e4).equals(MSG_WHEN_COPYING_EMPTY_RC_TO_FILE)) {
                    throw e4;
                }
                log(new StringBuffer().append("Warning: ").append(getMessage(e4)).toString(), 0);
                this.singleResource = null;
                this.file = file;
                this.destFile = file2;
                this.destDir = file3;
                if (resourceCollection != null) {
                    this.rcs.insertElementAt(resourceCollection, 0);
                }
                this.fileCopyMap.clear();
                this.dirCopyMap.clear();
                hashtable = this.completeDirMap;
            }
            hashtable.clear();
        } catch (Throwable th) {
            this.singleResource = null;
            this.file = file;
            this.destFile = file2;
            this.destDir = file3;
            if (resourceCollection != null) {
                this.rcs.insertElementAt(resourceCollection, 0);
            }
            this.fileCopyMap.clear();
            this.dirCopyMap.clear();
            this.completeDirMap.clear();
            throw th;
        }
    }

    public String getEncoding() {
        return this.inputEncoding;
    }

    protected FileUtils getFileUtils() {
        return this.fileUtils;
    }

    protected Vector getFilterChains() {
        return this.filterChains;
    }

    protected Vector getFilterSets() {
        return this.filterSets;
    }

    public boolean getForce() {
        return this.force;
    }

    public String getOutputEncoding() {
        return this.outputEncoding;
    }

    public boolean getPreserveLastModified() {
        return this.preserveLastModified;
    }

    public boolean isEnableMultipleMapping() {
        return this.enableMultipleMappings;
    }

    protected Map scan(Resource[] resourceArr, File file) {
        return buildMap(resourceArr, file, getMapper());
    }

    protected void scan(File file, File file2, String[] strArr, String[] strArr2) {
        FileNameMapper mapper = getMapper();
        buildMap(file, file2, strArr, mapper, this.fileCopyMap);
        if (this.includeEmpty) {
            buildMap(file, file2, strArr2, mapper, this.dirCopyMap);
        }
    }

    public void setEnableMultipleMappings(boolean z) {
        this.enableMultipleMappings = z;
    }

    public void setEncoding(String str) {
        this.inputEncoding = str;
        if (this.outputEncoding == null) {
            this.outputEncoding = str;
        }
    }

    public void setFailOnError(boolean z) {
        this.failonerror = z;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setFiltering(boolean z) {
        this.filtering = z;
    }

    public void setFlatten(boolean z) {
        this.flatten = z;
    }

    public void setForce(boolean z) {
        this.force = z;
    }

    public void setGranularity(long j) {
        this.granularity = j;
    }

    public void setIncludeEmptyDirs(boolean z) {
        this.includeEmpty = z;
    }

    public void setOutputEncoding(String str) {
        this.outputEncoding = str;
    }

    public void setOverwrite(boolean z) {
        this.forceOverwrite = z;
    }

    public void setPreserveLastModified(String str) {
        setPreserveLastModified(Project.toBoolean(str));
    }

    public void setPreserveLastModified(boolean z) {
        this.preserveLastModified = z;
    }

    public void setQuiet(boolean z) {
        this.quiet = z;
    }

    public void setTodir(File file) {
        this.destDir = file;
    }

    public void setTofile(File file) {
        this.destFile = file;
    }

    public void setVerbose(boolean z) {
        this.verbosity = z ? 2 : 3;
    }

    protected boolean supportsNonFileResources() {
        Class cls;
        Class<?> cls2 = getClass();
        if (class$org$apache$tools$ant$taskdefs$Copy == null) {
            cls = class$("org.apache.tools.ant.taskdefs.Copy");
            class$org$apache$tools$ant$taskdefs$Copy = cls;
        } else {
            cls = class$org$apache$tools$ant$taskdefs$Copy;
        }
        return cls2.equals(cls);
    }

    protected void validateAttributes() throws BuildException {
        Class cls;
        if (this.file == null && this.rcs.size() == 0) {
            throw new BuildException("Specify at least one source--a file or a resource collection.");
        }
        if (this.destFile != null && this.destDir != null) {
            throw new BuildException("Only one of tofile and todir may be set.");
        }
        if (this.destFile == null && this.destDir == null) {
            throw new BuildException("One of tofile or todir must be set.");
        }
        if (this.file != null && this.file.isDirectory()) {
            throw new BuildException("Use a resource collection to copy directories.");
        }
        if (this.destFile != null && this.rcs.size() > 0) {
            if (this.rcs.size() > 1) {
                throw new BuildException("Cannot concatenate multiple files into a single file.");
            }
            ResourceCollection resourceCollection = (ResourceCollection) this.rcs.elementAt(0);
            if (!resourceCollection.isFilesystemOnly() && !supportsNonFileResources()) {
                throw new BuildException("Only FileSystem resources are supported.");
            }
            if (resourceCollection.size() == 0) {
                throw new BuildException(MSG_WHEN_COPYING_EMPTY_RC_TO_FILE);
            }
            if (resourceCollection.size() != 1) {
                throw new BuildException("Cannot concatenate multiple files into a single file.");
            }
            Resource resource = (Resource) resourceCollection.iterator().next();
            if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                class$org$apache$tools$ant$types$resources$FileProvider = cls;
            } else {
                cls = class$org$apache$tools$ant$types$resources$FileProvider;
            }
            FileProvider fileProvider = (FileProvider) resource.as(cls);
            if (this.file != null) {
                throw new BuildException("Cannot concatenate multiple files into a single file.");
            }
            if (fileProvider != null) {
                this.file = fileProvider.getFile();
            } else {
                this.singleResource = resource;
            }
            this.rcs.removeElementAt(0);
        }
        if (this.destFile == null) {
            return;
        }
        this.destDir = this.destFile.getParentFile();
    }
}
