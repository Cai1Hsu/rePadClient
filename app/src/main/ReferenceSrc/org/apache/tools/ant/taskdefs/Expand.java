package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Mapper;
import org.apache.tools.ant.types.PatternSet;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.types.selectors.SelectorUtils;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.IdentityMapper;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Expand.class */
public class Expand extends Task {
    private static final int BUFFER_SIZE = 1024;
    public static final String ERROR_MULTIPLE_MAPPERS = "Cannot define more than one mapper";
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    public static final String NATIVE_ENCODING = "native-encoding";
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private File dest;
    private File source;
    private boolean overwrite = true;
    private Mapper mapperElement = null;
    private Vector patternsets = new Vector();
    private Union resources = new Union();
    private boolean resourcesSpecified = false;
    private boolean failOnEmptyArchive = false;
    private boolean stripAbsolutePathSpec = false;
    private boolean scanForUnicodeExtraFields = true;
    private String encoding = "UTF8";

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public void add(ResourceCollection resourceCollection) {
        this.resourcesSpecified = true;
        this.resources.add(resourceCollection);
    }

    public void add(FileNameMapper fileNameMapper) {
        createMapper().add(fileNameMapper);
    }

    public void addFileset(FileSet fileSet) {
        add(fileSet);
    }

    public void addPatternset(PatternSet patternSet) {
        this.patternsets.addElement(patternSet);
    }

    public Mapper createMapper() throws BuildException {
        if (this.mapperElement != null) {
            throw new BuildException(ERROR_MULTIPLE_MAPPERS, getLocation());
        }
        this.mapperElement = new Mapper(getProject());
        return this.mapperElement;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Class cls;
        if ("expand".equals(getTaskType())) {
            log("!! expand is deprecated. Use unzip instead. !!");
        }
        if (this.source != null || this.resourcesSpecified) {
            if (this.dest == null) {
                throw new BuildException("Dest attribute must be specified");
            }
            if (this.dest.exists() && !this.dest.isDirectory()) {
                throw new BuildException("Dest must be a directory.", getLocation());
            }
            if (this.source != null) {
                if (this.source.isDirectory()) {
                    throw new BuildException("Src must not be a directory. Use nested filesets instead.", getLocation());
                }
                if (!this.source.exists()) {
                    throw new BuildException(new StringBuffer().append("src '").append(this.source).append("' doesn't exist.").toString());
                }
                if (!this.source.canRead()) {
                    throw new BuildException(new StringBuffer().append("src '").append(this.source).append("' cannot be read.").toString());
                }
                expandFile(FILE_UTILS, this.source, this.dest);
            }
            Iterator it = this.resources.iterator();
            while (it.hasNext()) {
                Resource resource = (Resource) it.next();
                if (!resource.isExists()) {
                    log(new StringBuffer().append("Skipping '").append(resource.getName()).append("' because it doesn't exist.").toString());
                } else {
                    if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                        cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                        class$org$apache$tools$ant$types$resources$FileProvider = cls;
                    } else {
                        cls = class$org$apache$tools$ant$types$resources$FileProvider;
                    }
                    FileProvider fileProvider = (FileProvider) resource.as(cls);
                    if (fileProvider != null) {
                        expandFile(FILE_UTILS, fileProvider.getFile(), this.dest);
                    } else {
                        expandResource(resource, this.dest);
                    }
                }
            }
            return;
        }
        throw new BuildException("src attribute and/or resources must be specified");
    }

    protected void expandFile(FileUtils fileUtils, File file, File file2) {
        ZipFile zipFile;
        Throwable th;
        ZipFile zipFile2;
        boolean z;
        log(new StringBuffer().append("Expanding: ").append(file).append(" into ").append(file2).toString(), 2);
        FileNameMapper mapper = getMapper();
        if (!file.exists()) {
            throw new BuildException(new StringBuffer().append("Unable to expand ").append(file).append(" as the file does not exist").toString(), getLocation());
        }
        ZipFile zipFile3 = null;
        try {
            try {
                zipFile2 = new ZipFile(file, this.encoding, this.scanForUnicodeExtraFields);
                z = true;
            } catch (IOException e) {
                e = e;
                zipFile = null;
            }
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            Enumeration entries = zipFile2.getEntries();
            while (entries.hasMoreElements()) {
                z = false;
                ZipEntry zipEntry = (ZipEntry) entries.nextElement();
                log(new StringBuffer().append("extracting ").append(zipEntry.getName()).toString(), 4);
                try {
                    InputStream inputStream = zipFile2.getInputStream(zipEntry);
                    extractFile(fileUtils, file, file2, inputStream, zipEntry.getName(), new Date(zipEntry.getTime()), zipEntry.isDirectory(), mapper);
                    FileUtils.close(inputStream);
                } catch (Throwable th3) {
                    FileUtils.close((InputStream) null);
                    throw th3;
                }
            }
            if (z && getFailOnEmptyArchive()) {
                throw new BuildException(new StringBuffer().append("archive '").append(file).append("' is empty").toString());
            }
            log("expand complete", 3);
            ZipFile.closeQuietly(zipFile2);
        } catch (IOException e2) {
            e = e2;
            zipFile = zipFile2;
            ZipFile zipFile4 = zipFile;
            ZipFile zipFile5 = zipFile;
            ZipFile zipFile6 = zipFile;
            zipFile3 = zipFile;
            throw new BuildException(new StringBuffer().append("Error while expanding ").append(file.getPath()).append("\n").append(e.toString()).toString(), e);
        } catch (Throwable th4) {
            th = th4;
            zipFile3 = zipFile2;
            ZipFile.closeQuietly(zipFile3);
            throw th;
        }
    }

    protected void expandResource(Resource resource, File file) {
        throw new BuildException("only filesystem based resources are supported by this task.");
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0037, code lost:
        if (r10.charAt(0) == '\\') goto L12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x00cc, code lost:
        if (r0.length == 0) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x023f, code lost:
        if (r0.length == 0) goto L65;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    protected void extractFile(FileUtils fileUtils, File file, File file2, InputStream inputStream, String str, Date date, boolean z, FileNameMapper fileNameMapper) throws IOException {
        String[] strArr;
        String[] strArr2;
        String str2 = str;
        if (this.stripAbsolutePathSpec) {
            str2 = str;
            if (str.length() > 0) {
                if (str.charAt(0) != File.separatorChar && str.charAt(0) != '/') {
                    str2 = str;
                }
                log(new StringBuffer().append("stripped absolute path spec from ").append(str).toString(), 3);
                str2 = str.substring(1);
            }
        }
        if (this.patternsets != null && this.patternsets.size() > 0) {
            String replace = str2.replace('/', File.separatorChar).replace('\\', File.separatorChar);
            boolean z2 = false;
            HashSet hashSet = new HashSet();
            HashSet hashSet2 = new HashSet();
            int size = this.patternsets.size();
            for (int i = 0; i < size; i++) {
                PatternSet patternSet = (PatternSet) this.patternsets.elementAt(i);
                String[] includePatterns = patternSet.getIncludePatterns(getProject());
                if (includePatterns != null) {
                    strArr2 = includePatterns;
                }
                strArr2 = new String[]{SelectorUtils.DEEP_TREE_MATCH};
                for (String str3 : strArr2) {
                    String replace2 = str3.replace('/', File.separatorChar).replace('\\', File.separatorChar);
                    String str4 = replace2;
                    if (replace2.endsWith(File.separator)) {
                        str4 = new StringBuffer().append(replace2).append(SelectorUtils.DEEP_TREE_MATCH).toString();
                    }
                    hashSet.add(str4);
                }
                String[] excludePatterns = patternSet.getExcludePatterns(getProject());
                if (excludePatterns != null) {
                    for (String str5 : excludePatterns) {
                        String replace3 = str5.replace('/', File.separatorChar).replace('\\', File.separatorChar);
                        String str6 = replace3;
                        if (replace3.endsWith(File.separator)) {
                            str6 = new StringBuffer().append(replace3).append(SelectorUtils.DEEP_TREE_MATCH).toString();
                        }
                        hashSet2.add(str6);
                    }
                }
            }
            Iterator it = hashSet.iterator();
            while (!z2 && it.hasNext()) {
                z2 = SelectorUtils.matchPath((String) it.next(), replace);
            }
            Iterator it2 = hashSet2.iterator();
            while (z2 && it2.hasNext()) {
                z2 = !SelectorUtils.matchPath((String) it2.next(), replace);
            }
            if (!z2) {
                log(new StringBuffer().append("skipping ").append(str2).append(" as it is excluded or not included.").toString(), 3);
                return;
            }
        }
        String[] mapFileName = fileNameMapper.mapFileName(str2);
        if (mapFileName != null) {
            strArr = mapFileName;
        }
        strArr = new String[]{str2};
        File resolveFile = fileUtils.resolveFile(file2, strArr[0]);
        try {
            if (!this.overwrite && resolveFile.exists() && resolveFile.lastModified() >= date.getTime()) {
                log(new StringBuffer().append("Skipping ").append(resolveFile).append(" as it is up-to-date").toString(), 4);
                return;
            }
            log(new StringBuffer().append("expanding ").append(str2).append(" to ").append(resolveFile).toString(), 3);
            File parentFile = resolveFile.getParentFile();
            if (parentFile != null) {
                parentFile.mkdirs();
            }
            if (z) {
                resolveFile.mkdirs();
            } else {
                byte[] bArr = new byte[1024];
                FileOutputStream fileOutputStream = null;
                try {
                    FileOutputStream fileOutputStream2 = new FileOutputStream(resolveFile);
                    while (true) {
                        try {
                            int read = inputStream.read(bArr);
                            if (read < 0) {
                                break;
                            }
                            fileOutputStream2.write(bArr, 0, read);
                        } catch (Throwable th) {
                            th = th;
                            fileOutputStream = fileOutputStream2;
                            FileUtils.close(fileOutputStream);
                            throw th;
                        }
                    }
                    fileOutputStream2.close();
                    FileUtils.close((OutputStream) null);
                } catch (Throwable th2) {
                    th = th2;
                }
            }
            fileUtils.setFileLastModified(resolveFile, date.getTime());
        } catch (FileNotFoundException e) {
            log(new StringBuffer().append("Unable to expand to file ").append(resolveFile.getPath()).toString(), e, 1);
        }
    }

    public String getEncoding() {
        return this.encoding;
    }

    public boolean getFailOnEmptyArchive() {
        return this.failOnEmptyArchive;
    }

    protected FileNameMapper getMapper() {
        return this.mapperElement != null ? this.mapperElement.getImplementation() : new IdentityMapper();
    }

    public boolean getScanForUnicodeExtraFields() {
        return this.scanForUnicodeExtraFields;
    }

    protected void internalSetEncoding(String str) {
        String str2 = str;
        if (NATIVE_ENCODING.equals(str)) {
            str2 = null;
        }
        this.encoding = str2;
    }

    protected void internalSetScanForUnicodeExtraFields(boolean z) {
        this.scanForUnicodeExtraFields = z;
    }

    public void setDest(File file) {
        this.dest = file;
    }

    public void setEncoding(String str) {
        internalSetEncoding(str);
    }

    public void setFailOnEmptyArchive(boolean z) {
        this.failOnEmptyArchive = z;
    }

    public void setOverwrite(boolean z) {
        this.overwrite = z;
    }

    public void setScanForUnicodeExtraFields(boolean z) {
        internalSetScanForUnicodeExtraFields(z);
    }

    public void setSrc(File file) {
        this.source = file;
    }

    public void setStripAbsolutePathSpec(boolean z) {
        this.stripAbsolutePathSpec = z;
    }
}
