package org.apache.tools.ant.taskdefs;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Vector;
import java.util.zip.GZIPOutputStream;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.ArchiveFileSet;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.ArchiveResource;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.TarResource;
import org.apache.tools.ant.types.selectors.SelectorUtils;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.MergingMapper;
import org.apache.tools.ant.util.ResourceUtils;
import org.apache.tools.ant.util.SourceFileScanner;
import org.apache.tools.bzip2.CBZip2OutputStream;
import org.apache.tools.tar.TarEntry;
import org.apache.tools.tar.TarOutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Tar.class */
public class Tar extends MatchingTask {
    private static final int BUFFER_SIZE = 8192;
    public static final String FAIL = "fail";
    public static final String GNU = "gnu";
    public static final String OMIT = "omit";
    public static final String TRUNCATE = "truncate";
    public static final String WARN = "warn";
    static Class class$org$apache$tools$ant$taskdefs$Tar;
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    File baseDir;
    File tarFile;
    private TarLongFileMode longFileMode = new TarLongFileMode();
    Vector filesets = new Vector();
    private Vector resourceCollections = new Vector();
    Vector fileSetFiles = new Vector();
    private boolean longWarningGiven = false;
    private TarCompressionMethod compression = new TarCompressionMethod();

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Tar$TarCompressionMethod.class */
    public static final class TarCompressionMethod extends EnumeratedAttribute {
        private static final String BZIP2 = "bzip2";
        private static final String GZIP = "gzip";
        private static final String NONE = "none";

        public TarCompressionMethod() {
            setValue("none");
        }

        public OutputStream compress(OutputStream outputStream) throws IOException {
            GZIPOutputStream gZIPOutputStream;
            String value = getValue();
            if (GZIP.equals(value)) {
                gZIPOutputStream = new GZIPOutputStream(outputStream);
            } else {
                gZIPOutputStream = outputStream;
                if ("bzip2".equals(value)) {
                    outputStream.write(66);
                    outputStream.write(90);
                    gZIPOutputStream = new CBZip2OutputStream(outputStream);
                }
            }
            return gZIPOutputStream;
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"none", GZIP, "bzip2"};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Tar$TarFileSet.class */
    public static class TarFileSet extends org.apache.tools.ant.types.TarFileSet {
        private String[] files = null;
        private boolean preserveLeadingSlashes = false;

        public TarFileSet() {
        }

        public TarFileSet(FileSet fileSet) {
            super(fileSet);
        }

        public String[] getFiles(Project project) {
            if (this.files == null) {
                this.files = Tar.getFileNames(this);
            }
            return this.files;
        }

        public int getMode() {
            return getFileMode(getProject());
        }

        public boolean getPreserveLeadingSlashes() {
            return this.preserveLeadingSlashes;
        }

        public void setMode(String str) {
            setFileMode(str);
        }

        public void setPreserveLeadingSlashes(boolean z) {
            this.preserveLeadingSlashes = z;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Tar$TarLongFileMode.class */
    public static class TarLongFileMode extends EnumeratedAttribute {
        public static final String FAIL = "fail";
        public static final String GNU = "gnu";
        public static final String OMIT = "omit";
        public static final String TRUNCATE = "truncate";
        public static final String WARN = "warn";
        private final String[] validModes = {"warn", "fail", "truncate", "gnu", "omit"};

        public TarLongFileMode() {
            setValue("warn");
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return this.validModes;
        }

        public boolean isFailMode() {
            return "fail".equalsIgnoreCase(getValue());
        }

        public boolean isGnuMode() {
            return "gnu".equalsIgnoreCase(getValue());
        }

        public boolean isOmitMode() {
            return "omit".equalsIgnoreCase(getValue());
        }

        public boolean isTruncateMode() {
            return "truncate".equalsIgnoreCase(getValue());
        }

        public boolean isWarnMode() {
            return "warn".equalsIgnoreCase(getValue());
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    protected static String[] getFileNames(FileSet fileSet) {
        DirectoryScanner directoryScanner = fileSet.getDirectoryScanner(fileSet.getProject());
        String[] includedDirectories = directoryScanner.getIncludedDirectories();
        String[] includedFiles = directoryScanner.getIncludedFiles();
        String[] strArr = new String[includedDirectories.length + includedFiles.length];
        System.arraycopy(includedDirectories, 0, strArr, 0, includedDirectories.length);
        System.arraycopy(includedFiles, 0, strArr, includedDirectories.length, includedFiles.length);
        return strArr;
    }

    protected static boolean isFileFileSet(ResourceCollection resourceCollection) {
        return (resourceCollection instanceof FileSet) && resourceCollection.isFilesystemOnly();
    }

    public void add(ResourceCollection resourceCollection) {
        this.resourceCollections.add(resourceCollection);
    }

    protected boolean archiveIsUpToDate(Resource resource) {
        return SelectorUtils.isOutOfDate(new FileResource(this.tarFile), resource, FileUtils.getFileUtils().getFileTimestampGranularity());
    }

    protected boolean archiveIsUpToDate(String[] strArr) {
        return archiveIsUpToDate(strArr, this.baseDir);
    }

    protected boolean archiveIsUpToDate(String[] strArr, File file) {
        SourceFileScanner sourceFileScanner = new SourceFileScanner(this);
        MergingMapper mergingMapper = new MergingMapper();
        mergingMapper.setTo(this.tarFile.getAbsolutePath());
        return sourceFileScanner.restrict(strArr, file, null, mergingMapper).length == 0;
    }

    protected TarFileSet asTarFileSet(ArchiveFileSet archiveFileSet) {
        TarFileSet tarFileSet;
        if (archiveFileSet == null || !(archiveFileSet instanceof TarFileSet)) {
            TarFileSet tarFileSet2 = new TarFileSet();
            tarFileSet2.setProject(getProject());
            tarFileSet = tarFileSet2;
            if (archiveFileSet != null) {
                tarFileSet2.setPrefix(archiveFileSet.getPrefix(getProject()));
                tarFileSet2.setFullpath(archiveFileSet.getFullpath(getProject()));
                if (archiveFileSet.hasFileModeBeenSet()) {
                    tarFileSet2.integerSetFileMode(archiveFileSet.getFileMode(getProject()));
                }
                if (archiveFileSet.hasDirModeBeenSet()) {
                    tarFileSet2.integerSetDirMode(archiveFileSet.getDirMode(getProject()));
                }
                tarFileSet = tarFileSet2;
                if (archiveFileSet instanceof org.apache.tools.ant.types.TarFileSet) {
                    org.apache.tools.ant.types.TarFileSet tarFileSet3 = (org.apache.tools.ant.types.TarFileSet) archiveFileSet;
                    if (tarFileSet3.hasUserNameBeenSet()) {
                        tarFileSet2.setUserName(tarFileSet3.getUserName());
                    }
                    if (tarFileSet3.hasGroupBeenSet()) {
                        tarFileSet2.setGroup(tarFileSet3.getGroup());
                    }
                    if (tarFileSet3.hasUserIdBeenSet()) {
                        tarFileSet2.setUid(tarFileSet3.getUid());
                    }
                    tarFileSet = tarFileSet2;
                    if (tarFileSet3.hasGroupIdBeenSet()) {
                        tarFileSet2.setGid(tarFileSet3.getGid());
                        tarFileSet = tarFileSet2;
                    }
                }
            }
        } else {
            tarFileSet = (TarFileSet) archiveFileSet;
        }
        return tarFileSet;
    }

    protected boolean check(File file, String[] strArr) {
        boolean z = true;
        if (!archiveIsUpToDate(strArr, file)) {
            z = false;
        }
        for (String str : strArr) {
            if (this.tarFile.equals(new File(file, str))) {
                throw new BuildException("A tar file cannot include itself", getLocation());
            }
        }
        return z;
    }

    protected boolean check(ResourceCollection resourceCollection) {
        boolean z;
        Class cls;
        boolean z2 = true;
        if (isFileFileSet(resourceCollection)) {
            FileSet fileSet = (FileSet) resourceCollection;
            z = check(fileSet.getDir(getProject()), getFileNames(fileSet));
        } else if (!resourceCollection.isFilesystemOnly() && !supportsNonFileResources()) {
            throw new BuildException("only filesystem resources are supported");
        } else {
            if (!resourceCollection.isFilesystemOnly()) {
                Iterator it = resourceCollection.iterator();
                boolean z3 = true;
                while (true) {
                    boolean z4 = z3;
                    z = z4;
                    if (!z4) {
                        break;
                    }
                    z = z4;
                    if (!it.hasNext()) {
                        break;
                    }
                    z3 = archiveIsUpToDate((Resource) it.next());
                }
            } else {
                HashSet hashSet = new HashSet();
                HashMap hashMap = new HashMap();
                Iterator it2 = resourceCollection.iterator();
                while (it2.hasNext()) {
                    Resource resource = (Resource) it2.next();
                    if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                        cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                        class$org$apache$tools$ant$types$resources$FileProvider = cls;
                    } else {
                        cls = class$org$apache$tools$ant$types$resources$FileProvider;
                    }
                    FileResource asFileResource = ResourceUtils.asFileResource((FileProvider) resource.as(cls));
                    File baseDir = asFileResource.getBaseDir();
                    File file = baseDir;
                    if (baseDir == null) {
                        file = Copy.NULL_FILE_PLACEHOLDER;
                    }
                    hashSet.add(file);
                    Vector vector = (Vector) hashMap.get(file);
                    Vector vector2 = vector;
                    if (vector == null) {
                        vector2 = new Vector();
                        hashMap.put(file, vector2);
                    }
                    if (file == Copy.NULL_FILE_PLACEHOLDER) {
                        vector2.add(asFileResource.getFile().getAbsolutePath());
                    } else {
                        vector2.add(asFileResource.getName());
                    }
                }
                Iterator it3 = hashSet.iterator();
                while (true) {
                    z = z2;
                    if (!it3.hasNext()) {
                        break;
                    }
                    File file2 = (File) it3.next();
                    Vector vector3 = (Vector) hashMap.get(file2);
                    String[] strArr = (String[]) vector3.toArray(new String[vector3.size()]);
                    File file3 = file2;
                    if (file2 == Copy.NULL_FILE_PLACEHOLDER) {
                        file3 = null;
                    }
                    z2 &= check(file3, strArr);
                }
            }
        }
        return z;
    }

    public TarFileSet createTarFileSet() {
        TarFileSet tarFileSet = new TarFileSet();
        tarFileSet.setProject(getProject());
        this.filesets.addElement(tarFileSet);
        return tarFileSet;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        TarOutputStream tarOutputStream;
        Throwable th;
        if (this.tarFile == null) {
            throw new BuildException("tarfile attribute must be set!", getLocation());
        }
        if (this.tarFile.exists() && this.tarFile.isDirectory()) {
            throw new BuildException("tarfile is a directory!", getLocation());
        }
        if (this.tarFile.exists() && !this.tarFile.canWrite()) {
            throw new BuildException("Can not write to the specified tarfile!", getLocation());
        }
        Vector vector = (Vector) this.filesets.clone();
        try {
            if (this.baseDir != null) {
                if (!this.baseDir.exists()) {
                    throw new BuildException("basedir does not exist!", getLocation());
                }
                TarFileSet tarFileSet = new TarFileSet(this.fileset);
                tarFileSet.setDir(this.baseDir);
                this.filesets.addElement(tarFileSet);
            }
            if (this.filesets.size() == 0 && this.resourceCollections.size() == 0) {
                throw new BuildException("You must supply either a basedir attribute or some nested resource collections.", getLocation());
            }
            boolean z = true;
            Enumeration elements = this.filesets.elements();
            while (elements.hasMoreElements()) {
                z &= check((TarFileSet) elements.nextElement());
            }
            Enumeration elements2 = this.resourceCollections.elements();
            while (elements2.hasMoreElements()) {
                z &= check((ResourceCollection) elements2.nextElement());
            }
            if (z) {
                log(new StringBuffer().append("Nothing to do: ").append(this.tarFile.getAbsolutePath()).append(" is up to date.").toString(), 2);
                return;
            }
            File parentFile = this.tarFile.getParentFile();
            if (parentFile != null && !parentFile.isDirectory() && !parentFile.mkdirs()) {
                throw new BuildException(new StringBuffer().append("Failed to create missing parent directory for ").append(this.tarFile).toString());
            }
            log(new StringBuffer().append("Building tar: ").append(this.tarFile.getAbsolutePath()).toString(), 2);
            try {
                try {
                    tarOutputStream = new TarOutputStream(this.compression.compress(new BufferedOutputStream(new FileOutputStream(this.tarFile))));
                } catch (Throwable th2) {
                    th = th2;
                    tarOutputStream = null;
                }
            } catch (IOException e) {
                e = e;
                tarOutputStream = null;
            }
            try {
                tarOutputStream.setDebug(true);
                if (this.longFileMode.isTruncateMode()) {
                    tarOutputStream.setLongFileMode(1);
                } else if (this.longFileMode.isFailMode() || this.longFileMode.isOmitMode()) {
                    tarOutputStream.setLongFileMode(0);
                } else {
                    tarOutputStream.setLongFileMode(2);
                }
                this.longWarningGiven = false;
                Enumeration elements3 = this.filesets.elements();
                while (elements3.hasMoreElements()) {
                    tar((TarFileSet) elements3.nextElement(), tarOutputStream);
                }
                Enumeration elements4 = this.resourceCollections.elements();
                while (elements4.hasMoreElements()) {
                    tar((ResourceCollection) elements4.nextElement(), tarOutputStream);
                }
                FileUtils.close(tarOutputStream);
            } catch (IOException e2) {
                e = e2;
                TarOutputStream tarOutputStream2 = tarOutputStream;
                TarOutputStream tarOutputStream3 = tarOutputStream;
                TarOutputStream tarOutputStream4 = tarOutputStream;
                TarOutputStream tarOutputStream5 = tarOutputStream;
                TarOutputStream tarOutputStream6 = tarOutputStream;
                throw new BuildException(new StringBuffer().append("Problem creating TAR: ").append(e.getMessage()).toString(), e, getLocation());
            } catch (Throwable th3) {
                th = th3;
                FileUtils.close(tarOutputStream);
                throw th;
            }
        } finally {
            this.filesets = vector;
        }
    }

    public void setBasedir(File file) {
        this.baseDir = file;
    }

    public void setCompression(TarCompressionMethod tarCompressionMethod) {
        this.compression = tarCompressionMethod;
    }

    public void setDestFile(File file) {
        this.tarFile = file;
    }

    public void setLongfile(String str) {
        log("DEPRECATED - The setLongfile(String) method has been deprecated. Use setLongfile(Tar.TarLongFileMode) instead.");
        this.longFileMode = new TarLongFileMode();
        this.longFileMode.setValue(str);
    }

    public void setLongfile(TarLongFileMode tarLongFileMode) {
        this.longFileMode = tarLongFileMode;
    }

    public void setTarfile(File file) {
        this.tarFile = file;
    }

    protected boolean supportsNonFileResources() {
        Class cls;
        Class<?> cls2 = getClass();
        if (class$org$apache$tools$ant$taskdefs$Tar == null) {
            cls = class$("org.apache.tools.ant.taskdefs.Tar");
            class$org$apache$tools$ant$taskdefs$Tar = cls;
        } else {
            cls = class$org$apache$tools$ant$taskdefs$Tar;
        }
        return cls2.equals(cls);
    }

    protected void tar(ResourceCollection resourceCollection, TarOutputStream tarOutputStream) throws IOException {
        Class cls;
        ArchiveFileSet archiveFileSet = null;
        if (resourceCollection instanceof ArchiveFileSet) {
            archiveFileSet = (ArchiveFileSet) resourceCollection;
        }
        if (archiveFileSet == null || archiveFileSet.size() <= 1 || archiveFileSet.getFullpath(getProject()).length() <= 0) {
            TarFileSet asTarFileSet = asTarFileSet(archiveFileSet);
            if (isFileFileSet(resourceCollection)) {
                FileSet fileSet = (FileSet) resourceCollection;
                String[] fileNames = getFileNames(fileSet);
                for (int i = 0; i < fileNames.length; i++) {
                    tarFile(new File(fileSet.getDir(getProject()), fileNames[i]), tarOutputStream, fileNames[i].replace(File.separatorChar, '/'), asTarFileSet);
                }
                return;
            } else if (!resourceCollection.isFilesystemOnly()) {
                Iterator it = resourceCollection.iterator();
                while (it.hasNext()) {
                    Resource resource = (Resource) it.next();
                    tarResource(resource, tarOutputStream, resource.getName(), asTarFileSet);
                }
                return;
            } else {
                Iterator it2 = resourceCollection.iterator();
                while (it2.hasNext()) {
                    Resource resource2 = (Resource) it2.next();
                    if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                        cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                        class$org$apache$tools$ant$types$resources$FileProvider = cls;
                    } else {
                        cls = class$org$apache$tools$ant$types$resources$FileProvider;
                    }
                    File file = ((FileProvider) resource2.as(cls)).getFile();
                    tarFile(file, tarOutputStream, file.getName(), asTarFileSet);
                }
                return;
            }
        }
        throw new BuildException("fullpath attribute may only be specified for filesets that specify a single file.");
    }

    protected void tarFile(File file, TarOutputStream tarOutputStream, String str, TarFileSet tarFileSet) throws IOException {
        if (file.equals(this.tarFile)) {
            return;
        }
        tarResource(new FileResource(file), tarOutputStream, str, tarFileSet);
    }

    protected void tarResource(Resource resource, TarOutputStream tarOutputStream, String str, TarFileSet tarFileSet) throws IOException {
        int read;
        String stringBuffer;
        if (!resource.isExists()) {
            return;
        }
        boolean z = false;
        String str2 = str;
        if (tarFileSet != null) {
            String fullpath = tarFileSet.getFullpath(getProject());
            if (fullpath.length() > 0) {
                stringBuffer = fullpath;
            } else if (str.length() <= 0) {
                return;
            } else {
                String prefix = tarFileSet.getPrefix(getProject());
                String str3 = prefix;
                if (prefix.length() > 0) {
                    str3 = prefix;
                    if (!prefix.endsWith("/")) {
                        str3 = new StringBuffer().append(prefix).append("/").toString();
                    }
                }
                stringBuffer = new StringBuffer().append(str3).append(str).toString();
            }
            boolean preserveLeadingSlashes = tarFileSet.getPreserveLeadingSlashes();
            z = preserveLeadingSlashes;
            str2 = stringBuffer;
            if (stringBuffer.startsWith("/")) {
                z = preserveLeadingSlashes;
                str2 = stringBuffer;
                if (!preserveLeadingSlashes) {
                    int length = stringBuffer.length();
                    if (length <= 1) {
                        return;
                    }
                    str2 = stringBuffer.substring(1, length);
                    z = preserveLeadingSlashes;
                }
            }
        }
        String str4 = str2;
        if (resource.isDirectory()) {
            str4 = str2;
            if (!str2.endsWith("/")) {
                str4 = new StringBuffer().append(str2).append("/").toString();
            }
        }
        if (str4.length() >= 100) {
            if (this.longFileMode.isOmitMode()) {
                log(new StringBuffer().append("Omitting: ").append(str4).toString(), 2);
                return;
            } else if (this.longFileMode.isWarnMode()) {
                log(new StringBuffer().append("Entry: ").append(str4).append(" longer than ").append(100).append(" characters.").toString(), 1);
                if (!this.longWarningGiven) {
                    log("Resulting tar file can only be processed successfully by GNU compatible tar commands", 1);
                    this.longWarningGiven = true;
                }
            } else if (this.longFileMode.isFailMode()) {
                throw new BuildException(new StringBuffer().append("Entry: ").append(str4).append(" longer than ").append(100).append("characters.").toString(), getLocation());
            }
        }
        TarEntry tarEntry = new TarEntry(str4, z);
        tarEntry.setModTime(resource.getLastModified());
        if (resource instanceof ArchiveResource) {
            tarEntry.setMode(((ArchiveResource) resource).getMode());
            if (resource instanceof TarResource) {
                TarResource tarResource = (TarResource) resource;
                tarEntry.setUserName(tarResource.getUserName());
                tarEntry.setUserId(tarResource.getUid());
                tarEntry.setGroupName(tarResource.getGroup());
                tarEntry.setGroupId(tarResource.getGid());
            }
        }
        if (!resource.isDirectory()) {
            if (resource.size() > 8589934591L) {
                throw new BuildException(new StringBuffer().append("Resource: ").append(resource).append(" larger than ").append(8589934591L).append(" bytes.").toString());
            }
            tarEntry.setSize(resource.getSize());
            if (tarFileSet != null && tarFileSet.hasFileModeBeenSet()) {
                tarEntry.setMode(tarFileSet.getMode());
            }
        } else if (tarFileSet != null && tarFileSet.hasDirModeBeenSet()) {
            tarEntry.setMode(tarFileSet.getDirMode(getProject()));
        }
        if (tarFileSet != null) {
            if (tarFileSet.hasUserNameBeenSet()) {
                tarEntry.setUserName(tarFileSet.getUserName());
            }
            if (tarFileSet.hasGroupBeenSet()) {
                tarEntry.setGroupName(tarFileSet.getGroup());
            }
            if (tarFileSet.hasUserIdBeenSet()) {
                tarEntry.setUserId(tarFileSet.getUid());
            }
            if (tarFileSet.hasGroupIdBeenSet()) {
                tarEntry.setGroupId(tarFileSet.getGid());
            }
        }
        InputStream inputStream = null;
        InputStream inputStream2 = null;
        try {
            tarOutputStream.putNextEntry(tarEntry);
            if (resource.isDirectory()) {
                inputStream2 = inputStream;
                tarOutputStream.closeEntry();
                FileUtils.close(inputStream);
            }
            inputStream = resource.getInputStream();
            byte[] bArr = new byte[8192];
            int i = 0;
            do {
                tarOutputStream.write(bArr, 0, i);
                read = inputStream.read(bArr, 0, bArr.length);
                i = read;
            } while (read != -1);
            inputStream2 = inputStream;
            tarOutputStream.closeEntry();
            FileUtils.close(inputStream);
        } catch (Throwable th) {
            FileUtils.close(inputStream2);
            throw th;
        }
    }
}
