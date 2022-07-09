package org.apache.tools.ant.taskdefs;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.Stack;
import java.util.Vector;
import java.util.zip.CRC32;
import org.apache.commons.compress.archivers.ArchiveStreamFactory;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.apache.tools.ant.types.ArchiveFileSet;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.ZipFileSet;
import org.apache.tools.ant.types.ZipScanner;
import org.apache.tools.ant.types.resources.ArchiveResource;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.types.resources.ZipResource;
import org.apache.tools.ant.types.resources.selectors.ResourceSelector;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.GlobPatternMapper;
import org.apache.tools.ant.util.IdentityMapper;
import org.apache.tools.ant.util.MergingMapper;
import org.apache.tools.ant.util.ResourceUtils;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipExtraField;
import org.apache.tools.zip.ZipFile;
import org.apache.tools.zip.ZipOutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Zip.class */
public class Zip extends MatchingTask {
    private static final int BUFFER_SIZE = 8192;
    private static final int ROUNDUP_MILLIS = 1999;
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private File baseDir;
    private String encoding;
    protected File zipFile;
    private ZipScanner zs;
    private static final long EMPTY_CRC = new CRC32().getValue();
    private static final ResourceSelector MISSING_SELECTOR = new ResourceSelector() { // from class: org.apache.tools.ant.taskdefs.Zip.1
        @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
        public boolean isSelected(Resource resource) {
            return !resource.isExists();
        }
    };
    private static final ResourceUtils.ResourceSelectorProvider MISSING_DIR_PROVIDER = new ResourceUtils.ResourceSelectorProvider() { // from class: org.apache.tools.ant.taskdefs.Zip.2
        @Override // org.apache.tools.ant.util.ResourceUtils.ResourceSelectorProvider
        public ResourceSelector getTargetSelectorForSource(Resource resource) {
            return Zip.MISSING_SELECTOR;
        }
    };
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static ThreadLocal haveNonFileSetResourcesToAdd = new ThreadLocal() { // from class: org.apache.tools.ant.taskdefs.Zip.3
        @Override // java.lang.ThreadLocal
        protected Object initialValue() {
            return Boolean.FALSE;
        }
    };
    private static ThreadLocal currentZipExtra = new ThreadLocal() { // from class: org.apache.tools.ant.taskdefs.Zip.5
        @Override // java.lang.ThreadLocal
        protected Object initialValue() {
            return null;
        }
    };
    protected Hashtable entries = new Hashtable();
    private Vector groupfilesets = new Vector();
    private Vector filesetsFromGroupfilesets = new Vector();
    protected String duplicate = "add";
    private boolean doCompress = true;
    private boolean doUpdate = false;
    private boolean savedDoUpdate = false;
    private boolean doFilesonly = false;
    protected String archiveType = ArchiveStreamFactory.ZIP;
    protected String emptyBehavior = MSVSSConstants.WRITABLE_SKIP;
    private Vector resources = new Vector();
    protected Hashtable addedDirs = new Hashtable();
    private Vector addedFiles = new Vector();
    protected boolean doubleFilePass = false;
    protected boolean skipWriting = false;
    private boolean updatedFile = false;
    private boolean addingNewFiles = false;
    private boolean keepCompression = false;
    private boolean roundUp = true;
    private String comment = "";
    private int level = -1;
    private boolean preserve0Permissions = false;
    private boolean useLanguageEncodingFlag = true;
    private UnicodeExtraField createUnicodeExtraFields = UnicodeExtraField.NEVER;
    private boolean fallBackToUTF8 = false;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Zip$ArchiveState.class */
    public static class ArchiveState {
        private boolean outOfDate;
        private Resource[][] resourcesToAdd;

        ArchiveState(boolean z, Resource[][] resourceArr) {
            this.outOfDate = z;
            this.resourcesToAdd = resourceArr;
        }

        public Resource[][] getResourcesToAdd() {
            return this.resourcesToAdd;
        }

        public boolean isOutOfDate() {
            return this.outOfDate;
        }

        public boolean isWithoutAnyResources() {
            boolean z;
            if (this.resourcesToAdd != null) {
                int i = 0;
                while (true) {
                    z = true;
                    if (i < this.resourcesToAdd.length) {
                        if (this.resourcesToAdd[i] != null && this.resourcesToAdd[i].length > 0) {
                            z = false;
                            break;
                        }
                        i++;
                    } else {
                        break;
                    }
                }
            } else {
                z = true;
            }
            return z;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Zip$Duplicate.class */
    public static class Duplicate extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"add", "preserve", "fail"};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Zip$UnicodeExtraField.class */
    public static final class UnicodeExtraField extends EnumeratedAttribute {
        private static final String ALWAYS_KEY = "always";
        private static final String N_E_KEY = "not-encodeable";
        private static final Map POLICIES = new HashMap();
        private static final String NEVER_KEY = "never";
        public static final UnicodeExtraField NEVER = new UnicodeExtraField(NEVER_KEY);

        static {
            POLICIES.put(NEVER_KEY, ZipOutputStream.UnicodeExtraFieldPolicy.NEVER);
            POLICIES.put(ALWAYS_KEY, ZipOutputStream.UnicodeExtraFieldPolicy.ALWAYS);
            POLICIES.put(N_E_KEY, ZipOutputStream.UnicodeExtraFieldPolicy.NOT_ENCODEABLE);
        }

        public UnicodeExtraField() {
        }

        private UnicodeExtraField(String str) {
            setValue(str);
        }

        public ZipOutputStream.UnicodeExtraFieldPolicy getPolicy() {
            return (ZipOutputStream.UnicodeExtraFieldPolicy) POLICIES.get(getValue());
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{NEVER_KEY, ALWAYS_KEY, N_E_KEY};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Zip$WhenEmpty.class */
    public static class WhenEmpty extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"fail", MSVSSConstants.WRITABLE_SKIP, "create"};
        }
    }

    private void addDirectoryResource(Resource resource, String str, String str2, File file, ZipOutputStream zipOutputStream, int i, int i2) throws IOException {
        String str3 = str;
        if (!str.endsWith("/")) {
            str3 = new StringBuffer().append(str).append("/").toString();
        }
        int lastIndexOf = str3.lastIndexOf("/", str3.length() - 2);
        if (lastIndexOf != -1) {
            addParentDirs(file, str3.substring(0, lastIndexOf + 1), zipOutputStream, str2, i);
        }
        zipDir(resource, zipOutputStream, new StringBuffer().append(str2).append(str3).toString(), i2, resource instanceof ZipResource ? ((ZipResource) resource).getExtraFields() : null);
    }

    private void addResource(Resource resource, String str, String str2, ZipOutputStream zipOutputStream, int i, ZipFile zipFile, File file) throws IOException {
        InputStream inputStream;
        if (zipFile == null) {
            inputStream = null;
            try {
                InputStream inputStream2 = resource.getInputStream();
                inputStream = inputStream2;
                zipFile(inputStream2, zipOutputStream, new StringBuffer().append(str2).append(str).toString(), resource.getLastModified(), file, i, resource instanceof ZipResource ? ((ZipResource) resource).getExtraFields() : null);
                FileUtils.close(inputStream2);
                return;
            } finally {
                FileUtils.close(inputStream);
            }
        }
        ZipEntry entry = zipFile.getEntry(resource.getName());
        if (entry == null) {
            return;
        }
        boolean z = this.doCompress;
        if (this.keepCompression) {
            this.doCompress = entry.getMethod() == 8;
        }
        InputStream inputStream3 = null;
        try {
            InputStream inputStream4 = zipFile.getInputStream(entry);
            inputStream3 = inputStream4;
            zipFile(inputStream4, zipOutputStream, new StringBuffer().append(str2).append(str).toString(), entry.getTime(), file, i, entry.getExtraFields(true));
            this.doCompress = z;
            FileUtils.close(inputStream4);
        } catch (Throwable th) {
            this.doCompress = z;
            throw th;
        }
    }

    private void checkAttributesAndElements() {
        if (this.baseDir == null && this.resources.size() == 0 && this.groupfilesets.size() == 0 && ArchiveStreamFactory.ZIP.equals(this.archiveType)) {
            throw new BuildException("basedir attribute must be set, or at least one resource collection must be given!");
        }
        if (this.zipFile == null) {
            throw new BuildException(new StringBuffer().append("You must specify the ").append(this.archiveType).append(" file to create!").toString());
        }
        if (this.zipFile.exists() && !this.zipFile.isFile()) {
            throw new BuildException(new StringBuffer().append(this.zipFile).append(" is not a file.").toString());
        }
        if (this.zipFile.exists() && !this.zipFile.canWrite()) {
            throw new BuildException(new StringBuffer().append(this.zipFile).append(" is read-only.").toString());
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void closeZout(ZipOutputStream zipOutputStream, boolean z) throws IOException {
        if (zipOutputStream == null) {
            return;
        }
        try {
            zipOutputStream.close();
        } catch (IOException e) {
            if (!z) {
                return;
            }
            throw e;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:7:0x0022, code lost:
        if (r0 == 16384) goto L8;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private int getUnixMode(Resource resource, ZipFile zipFile, int i) throws IOException {
        int i2 = i;
        if (zipFile != null) {
            int unixMode = zipFile.getEntry(resource.getName()).getUnixMode();
            if (unixMode != 0) {
                i2 = unixMode;
            }
            i2 = unixMode;
            if (!this.preserve0Permissions) {
                i2 = i;
            }
        } else if (resource instanceof ArchiveResource) {
            i2 = ((ArchiveResource) resource).getMode();
        }
        return i2;
    }

    private ZipScanner getZipScanner() {
        ZipScanner zipScanner;
        synchronized (this) {
            if (this.zs == null) {
                this.zs = new ZipScanner();
                this.zs.setEncoding(this.encoding);
                this.zs.setSrc(this.zipFile);
            }
            zipScanner = this.zs;
        }
        return zipScanner;
    }

    protected static final boolean isEmpty(Resource[][] resourceArr) {
        boolean z;
        int i = 0;
        while (true) {
            if (i >= resourceArr.length) {
                z = true;
                break;
            } else if (resourceArr[i].length > 0) {
                z = false;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    private void processDoUpdate() {
        if (!this.doUpdate || this.zipFile.exists()) {
            return;
        }
        this.doUpdate = false;
        logWhenWriting(new StringBuffer().append("ignoring update attribute as ").append(this.archiveType).append(" doesn't exist.").toString(), 4);
    }

    private void processGroupFilesets() {
        int size = this.groupfilesets.size();
        for (int i = 0; i < size; i++) {
            logWhenWriting("Processing groupfileset ", 3);
            DirectoryScanner directoryScanner = ((FileSet) this.groupfilesets.elementAt(i)).getDirectoryScanner(getProject());
            String[] includedFiles = directoryScanner.getIncludedFiles();
            File basedir = directoryScanner.getBasedir();
            for (int i2 = 0; i2 < includedFiles.length; i2++) {
                logWhenWriting(new StringBuffer().append("Adding file ").append(includedFiles[i2]).append(" to fileset").toString(), 3);
                ZipFileSet zipFileSet = new ZipFileSet();
                zipFileSet.setProject(getProject());
                zipFileSet.setSrc(new File(basedir, includedFiles[i2]));
                add(zipFileSet);
                this.filesetsFromGroupfilesets.addElement(zipFileSet);
            }
        }
    }

    private File renameFile() {
        File createTempFile = FILE_UTILS.createTempFile(ArchiveStreamFactory.ZIP, ".tmp", this.zipFile.getParentFile(), true, false);
        try {
            FILE_UTILS.rename(this.zipFile, createTempFile);
            return createTempFile;
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("Unable to rename old file (").append(this.zipFile.getAbsolutePath()).append(") to temporary file").toString());
        } catch (SecurityException e2) {
            throw new BuildException(new StringBuffer().append("Not allowed to rename old file (").append(this.zipFile.getAbsolutePath()).append(") to temporary file").toString());
        }
    }

    private Resource[] selectOutOfDateResources(Resource[] resourceArr, FileNameMapper fileNameMapper) {
        Resource[] selectOutOfDateSources = ResourceUtils.selectOutOfDateSources(this, selectFileResources(resourceArr), fileNameMapper, getZipScanner());
        Resource[] resourceArr2 = selectOutOfDateSources;
        if (!this.doFilesonly) {
            Union union = new Union();
            union.addAll(Arrays.asList(selectDirectoryResources(resourceArr)));
            ResourceCollection selectSources = ResourceUtils.selectSources(this, union, fileNameMapper, getZipScanner(), MISSING_DIR_PROVIDER);
            resourceArr2 = selectOutOfDateSources;
            if (selectSources.size() > 0) {
                ArrayList arrayList = new ArrayList();
                arrayList.addAll(Arrays.asList(((Union) selectSources).listResources()));
                arrayList.addAll(Arrays.asList(selectOutOfDateSources));
                resourceArr2 = (Resource[]) arrayList.toArray(selectOutOfDateSources);
            }
        }
        return resourceArr2;
    }

    public void add(ResourceCollection resourceCollection) {
        this.resources.add(resourceCollection);
    }

    public void addFileset(FileSet fileSet) {
        add(fileSet);
    }

    protected final void addParentDirs(File file, String str, ZipOutputStream zipOutputStream, String str2, int i) throws IOException {
        if (!this.doFilesonly) {
            Stack stack = new Stack();
            int length = str.length();
            while (true) {
                length = str.lastIndexOf(47, length - 1);
                if (length == -1) {
                    break;
                }
                String substring = str.substring(0, length + 1);
                if (this.addedDirs.get(new StringBuffer().append(str2).append(substring).toString()) != null) {
                    break;
                }
                stack.push(substring);
            }
            while (!stack.isEmpty()) {
                String str3 = (String) stack.pop();
                zipDir(file != null ? new File(file, str3) : new File(str3), zipOutputStream, new StringBuffer().append(str2).append(str3).toString(), i);
            }
        }
    }

    /* JADX DEBUG: Incorrect finally slice size: {[MOVE, CONST_STR] complete}, expected: {[MOVE, MOVE, INVOKE, IF] complete} */
    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:112:0x02a5  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x02a1 A[EDGE_INSN: B:116:0x02a1->B:110:0x02a1 ?: BREAK  , SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:122:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x010f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    protected final void addResources(FileSet fileSet, Resource[] resourceArr, ZipOutputStream zipOutputStream) throws IOException {
        ZipFile zipFile;
        boolean z;
        File file;
        ZipFile zipFile2;
        int i;
        String str = "";
        String str2 = "";
        int i2 = 16877;
        int i3 = 33188;
        ArchiveFileSet archiveFileSet = null;
        if (fileSet instanceof ArchiveFileSet) {
            archiveFileSet = (ArchiveFileSet) fileSet;
            str = archiveFileSet.getPrefix(getProject());
            str2 = archiveFileSet.getFullpath(getProject());
            i2 = archiveFileSet.getDirMode(getProject());
            i3 = archiveFileSet.getFileMode(getProject());
        }
        if (str.length() <= 0 || str2.length() <= 0) {
            if (resourceArr.length != 1 && str2.length() > 0) {
                throw new BuildException("fullpath attribute may only be specified for filesets that specify a single file.");
            }
            String str3 = str;
            if (str.length() > 0) {
                str3 = str;
                if (!str.endsWith("/")) {
                    str3 = str;
                    if (!str.endsWith("\\")) {
                        str3 = new StringBuffer().append(str).append("/").toString();
                    }
                }
                addParentDirs(null, str3, zipOutputStream, "", i2);
            }
            if (archiveFileSet != null) {
                zipFile = null;
                try {
                    if (archiveFileSet.getSrc(getProject()) != null) {
                        file = null;
                        zipFile2 = null;
                        z = false;
                        if (archiveFileSet instanceof ZipFileSet) {
                            zipFile2 = new ZipFile(archiveFileSet.getSrc(getProject()), this.encoding);
                            file = null;
                            z = false;
                        }
                        i = 0;
                        while (true) {
                            zipFile = zipFile2;
                            if (i < resourceArr.length) {
                                break;
                            }
                            ZipFile zipFile3 = zipFile2;
                            String replace = (str2.length() > 0 ? str2 : resourceArr[i].getName()).replace(File.separatorChar, '/');
                            ZipFile zipFile4 = zipFile2;
                            if (!"".equals(replace)) {
                                if (resourceArr[i].isDirectory()) {
                                    ZipFile zipFile5 = zipFile2;
                                    if (!this.doFilesonly) {
                                        addDirectoryResource(resourceArr[i], replace, str3, file, zipOutputStream, i2, (archiveFileSet == null || !archiveFileSet.hasDirModeBeenSet()) ? getUnixMode(resourceArr[i], zipFile2, i2) : i2);
                                    }
                                } else {
                                    addParentDirs(file, replace, zipOutputStream, str3, i2);
                                    if (z) {
                                        ZipFile zipFile6 = zipFile2;
                                        ZipFile zipFile7 = zipFile2;
                                        ZipFile zipFile8 = zipFile2;
                                        zipFile(FILE_UTILS.resolveFile(file, resourceArr[i].getName()), zipOutputStream, new StringBuffer().append(str3).append(replace).toString(), i3);
                                    } else {
                                        addResource(resourceArr[i], replace, str3, zipOutputStream, (archiveFileSet == null || !archiveFileSet.hasFileModeBeenSet()) ? getUnixMode(resourceArr[i], zipFile2, i3) : i3, zipFile2, archiveFileSet == null ? null : archiveFileSet.getSrc(getProject()));
                                    }
                                }
                            }
                            i++;
                        }
                        if (zipFile2 != null) {
                            return;
                        }
                        zipFile2.close();
                        return;
                    }
                } catch (Throwable th) {
                    if (zipFile != null) {
                        zipFile.close();
                    }
                    throw th;
                }
            }
            z = true;
            file = fileSet.getDir(getProject());
            zipFile2 = null;
            i = 0;
            while (true) {
                zipFile = zipFile2;
                if (i < resourceArr.length) {
                }
                i++;
            }
            if (zipFile2 != null) {
            }
        } else {
            throw new BuildException("Both prefix and fullpath attributes must not be set on the same fileset.");
        }
    }

    protected final void addResources(ResourceCollection resourceCollection, Resource[] resourceArr, ZipOutputStream zipOutputStream) throws IOException {
        Class cls;
        if (resourceCollection instanceof FileSet) {
            addResources((FileSet) resourceCollection, resourceArr, zipOutputStream);
            return;
        }
        for (int i = 0; i < resourceArr.length; i++) {
            String replace = resourceArr[i].getName().replace(File.separatorChar, '/');
            if (!"".equals(replace) && (!resourceArr[i].isDirectory() || !this.doFilesonly)) {
                Resource resource = resourceArr[i];
                if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                    cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                    class$org$apache$tools$ant$types$resources$FileProvider = cls;
                } else {
                    cls = class$org$apache$tools$ant$types$resources$FileProvider;
                }
                FileProvider fileProvider = (FileProvider) resource.as(cls);
                File file = null;
                if (fileProvider != null) {
                    file = ResourceUtils.asFileResource(fileProvider).getBaseDir();
                }
                if (resourceArr[i].isDirectory()) {
                    addDirectoryResource(resourceArr[i], replace, "", file, zipOutputStream, 16877, 16877);
                } else {
                    addParentDirs(file, replace, zipOutputStream, "", 16877);
                    if (fileProvider != null) {
                        zipFile(fileProvider.getFile(), zipOutputStream, replace, 33188);
                    } else {
                        addResource(resourceArr[i], replace, "", zipOutputStream, 33188, null, null);
                    }
                }
            }
        }
    }

    public void addZipGroupFileset(FileSet fileSet) {
        this.groupfilesets.addElement(fileSet);
    }

    public void addZipfileset(ZipFileSet zipFileSet) {
        add(zipFileSet);
    }

    protected void cleanUp() {
        this.addedDirs.clear();
        this.addedFiles.removeAllElements();
        this.entries.clear();
        this.addingNewFiles = false;
        this.doUpdate = this.savedDoUpdate;
        Enumeration elements = this.filesetsFromGroupfilesets.elements();
        while (elements.hasMoreElements()) {
            this.resources.removeElement((ZipFileSet) elements.nextElement());
        }
        this.filesetsFromGroupfilesets.removeAllElements();
        haveNonFileSetResourcesToAdd.set(Boolean.FALSE);
    }

    protected boolean createEmptyZip(File file) throws BuildException {
        Throwable th;
        IOException e;
        FileOutputStream fileOutputStream;
        FileOutputStream fileOutputStream2;
        if (!this.skipWriting) {
            log(new StringBuffer().append("Note: creating empty ").append(this.archiveType).append(" archive ").append(file).toString(), 2);
        }
        FileOutputStream fileOutputStream3 = null;
        try {
            try {
                fileOutputStream2 = new FileOutputStream(file);
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (IOException e2) {
            e = e2;
            fileOutputStream = null;
        }
        try {
            byte[] bArr = new byte[22];
            bArr[0] = (byte) 80;
            bArr[1] = (byte) 75;
            bArr[2] = (byte) 5;
            bArr[3] = (byte) 6;
            fileOutputStream2.write(bArr);
            FileUtils.close(fileOutputStream2);
            return true;
        } catch (IOException e3) {
            e = e3;
            fileOutputStream = fileOutputStream2;
            FileOutputStream fileOutputStream4 = fileOutputStream;
            FileOutputStream fileOutputStream5 = fileOutputStream;
            FileOutputStream fileOutputStream6 = fileOutputStream;
            FileOutputStream fileOutputStream7 = fileOutputStream;
            throw new BuildException(new StringBuffer().append("Could not create empty ZIP archive (").append(e.getMessage()).append(")").toString(), e, getLocation());
        } catch (Throwable th3) {
            th = th3;
            fileOutputStream3 = fileOutputStream2;
            FileUtils.close(fileOutputStream3);
            throw th;
        }
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (!this.doubleFilePass) {
            executeMain();
            return;
        }
        this.skipWriting = true;
        executeMain();
        this.skipWriting = false;
        executeMain();
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x0121, code lost:
        if (0 != 0) goto L44;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void executeMain() throws BuildException {
        String str;
        ZipOutputStream zipOutputStream;
        Throwable th;
        checkAttributesAndElements();
        File file = null;
        File file2 = null;
        this.addingNewFiles = true;
        processDoUpdate();
        processGroupFilesets();
        Vector vector = new Vector();
        if (this.baseDir != null) {
            FileSet fileSet = (FileSet) getImplicitFileSet().clone();
            fileSet.setDir(this.baseDir);
            vector.addElement(fileSet);
        }
        int size = this.resources.size();
        for (int i = 0; i < size; i++) {
            vector.addElement((ResourceCollection) this.resources.elementAt(i));
        }
        ResourceCollection[] resourceCollectionArr = new ResourceCollection[vector.size()];
        vector.copyInto(resourceCollectionArr);
        try {
            try {
                ArchiveState resourcesToAdd = getResourcesToAdd(resourceCollectionArr, this.zipFile, false);
                if (!resourcesToAdd.isOutOfDate()) {
                    return;
                }
                File parentFile = this.zipFile.getParentFile();
                if (parentFile != null && !parentFile.isDirectory() && !parentFile.mkdirs()) {
                    throw new BuildException(new StringBuffer().append("Failed to create missing parent directory for ").append(this.zipFile).toString());
                }
                this.updatedFile = true;
                if (!this.zipFile.exists() && resourcesToAdd.isWithoutAnyResources()) {
                    createEmptyZip(this.zipFile);
                    return;
                }
                Resource[][] resourcesToAdd2 = resourcesToAdd.getResourcesToAdd();
                if (this.doUpdate) {
                    file = renameFile();
                }
                File file3 = file;
                String str2 = this.doUpdate ? "Updating " : "Building ";
                if (!this.skipWriting) {
                    File file4 = file;
                    File file5 = file;
                    File file6 = file;
                    log(new StringBuffer().append(str2).append(this.archiveType).append(": ").append(this.zipFile.getAbsolutePath()).toString());
                }
                ZipOutputStream zipOutputStream2 = null;
                ZipOutputStream zipOutputStream3 = null;
                try {
                    if (!this.skipWriting) {
                        zipOutputStream2 = new ZipOutputStream(this.zipFile);
                        try {
                            zipOutputStream2.setEncoding(this.encoding);
                            zipOutputStream2.setUseLanguageEncodingFlag(this.useLanguageEncodingFlag);
                            zipOutputStream2.setCreateUnicodeExtraFields(this.createUnicodeExtraFields.getPolicy());
                            zipOutputStream2.setFallbackToUTF8(this.fallBackToUTF8);
                            zipOutputStream2.setMethod(this.doCompress ? 8 : 0);
                            zipOutputStream2.setLevel(this.level);
                        } catch (Throwable th2) {
                            zipOutputStream = zipOutputStream2;
                            th = th2;
                            closeZout(zipOutputStream, false);
                            File file7 = file;
                            throw th;
                        }
                    }
                    ZipOutputStream zipOutputStream4 = zipOutputStream2;
                    initZipOutputStream(zipOutputStream2);
                    for (int i2 = 0; i2 < resourceCollectionArr.length; i2++) {
                        ZipOutputStream zipOutputStream5 = zipOutputStream2;
                        if (resourcesToAdd2[i2].length != 0) {
                            ZipOutputStream zipOutputStream6 = zipOutputStream2;
                            addResources(resourceCollectionArr[i2], resourcesToAdd2[i2], zipOutputStream2);
                        }
                    }
                    if (this.doUpdate) {
                        ZipOutputStream zipOutputStream7 = zipOutputStream2;
                        this.addingNewFiles = false;
                        ZipOutputStream zipOutputStream8 = zipOutputStream2;
                        ZipOutputStream zipOutputStream9 = zipOutputStream2;
                        ZipFileSet zipFileSet = new ZipFileSet();
                        ZipOutputStream zipOutputStream10 = zipOutputStream2;
                        zipFileSet.setProject(getProject());
                        ZipOutputStream zipOutputStream11 = zipOutputStream2;
                        zipFileSet.setSrc(file);
                        ZipOutputStream zipOutputStream12 = zipOutputStream2;
                        zipFileSet.setDefaultexcludes(false);
                        ZipOutputStream zipOutputStream13 = zipOutputStream2;
                        int size2 = this.addedFiles.size();
                        for (int i3 = 0; i3 < size2; i3++) {
                            zipFileSet.createExclude().setName((String) this.addedFiles.elementAt(i3));
                        }
                        DirectoryScanner directoryScanner = zipFileSet.getDirectoryScanner(getProject());
                        ZipOutputStream zipOutputStream14 = zipOutputStream2;
                        ((ZipScanner) directoryScanner).setEncoding(this.encoding);
                        ZipOutputStream zipOutputStream15 = zipOutputStream2;
                        String[] includedFiles = directoryScanner.getIncludedFiles();
                        ZipOutputStream zipOutputStream16 = zipOutputStream2;
                        Resource[] resourceArr = new Resource[includedFiles.length];
                        for (int i4 = 0; i4 < includedFiles.length; i4++) {
                            ZipOutputStream zipOutputStream17 = zipOutputStream2;
                            resourceArr[i4] = directoryScanner.getResource(includedFiles[i4]);
                        }
                        Resource[] resourceArr2 = resourceArr;
                        if (!this.doFilesonly) {
                            ZipOutputStream zipOutputStream18 = zipOutputStream2;
                            String[] includedDirectories = directoryScanner.getIncludedDirectories();
                            ZipOutputStream zipOutputStream19 = zipOutputStream2;
                            Resource[] resourceArr3 = new Resource[includedDirectories.length];
                            for (int i5 = 0; i5 < includedDirectories.length; i5++) {
                                ZipOutputStream zipOutputStream20 = zipOutputStream2;
                                resourceArr3[i5] = directoryScanner.getResource(includedDirectories[i5]);
                            }
                            resourceArr2 = new Resource[resourceArr.length + resourceArr3.length];
                            ZipOutputStream zipOutputStream21 = zipOutputStream2;
                            System.arraycopy(resourceArr3, 0, resourceArr2, 0, resourceArr3.length);
                            ZipOutputStream zipOutputStream22 = zipOutputStream2;
                            System.arraycopy(resourceArr, 0, resourceArr2, resourceArr3.length, resourceArr.length);
                        }
                        ZipOutputStream zipOutputStream23 = zipOutputStream2;
                        addResources((FileSet) zipFileSet, resourceArr2, zipOutputStream2);
                    }
                    if (zipOutputStream2 != null) {
                        zipOutputStream2.setComment(this.comment);
                    }
                    ZipOutputStream zipOutputStream24 = zipOutputStream2;
                    finalizeZipOutputStream(zipOutputStream2);
                    ZipOutputStream zipOutputStream25 = zipOutputStream2;
                    if (this.doUpdate) {
                        ZipOutputStream zipOutputStream26 = zipOutputStream2;
                        if (!file.delete()) {
                            ZipOutputStream zipOutputStream27 = zipOutputStream2;
                            ZipOutputStream zipOutputStream28 = zipOutputStream2;
                            zipOutputStream3 = zipOutputStream2;
                            log(new StringBuffer().append("Warning: unable to delete temporary file ").append(file.getName()).toString(), 1);
                        }
                    }
                    File file8 = file;
                    closeZout(zipOutputStream2, true);
                } catch (Throwable th3) {
                    th = th3;
                    zipOutputStream = zipOutputStream3;
                }
            } catch (IOException e) {
                String stringBuffer = new StringBuffer().append("Problem creating ").append(this.archiveType).append(": ").append(e.getMessage()).toString();
                if (this.doUpdate) {
                    str = stringBuffer;
                }
                str = stringBuffer;
                if (!this.zipFile.delete()) {
                    str = new StringBuffer().append(stringBuffer).append(" (and the archive is probably corrupt but I could not delete it)").toString();
                }
                String str3 = str;
                if (this.doUpdate) {
                    str3 = str;
                    if (0 != 0) {
                        try {
                            FILE_UTILS.rename(null, this.zipFile);
                            str3 = str;
                        } catch (IOException e2) {
                            str3 = new StringBuffer().append(str).append(" (and I couldn't rename the temporary file ").append(file2.getName()).append(" back)").toString();
                        }
                    }
                }
                throw new BuildException(str3, e, getLocation());
            }
        } finally {
            cleanUp();
        }
    }

    protected void finalizeZipOutputStream(ZipOutputStream zipOutputStream) throws IOException, BuildException {
    }

    public String getComment() {
        return this.comment;
    }

    public UnicodeExtraField getCreateUnicodeExtraFields() {
        return this.createUnicodeExtraFields;
    }

    protected final ZipExtraField[] getCurrentExtraFields() {
        return (ZipExtraField[]) currentZipExtra.get();
    }

    public File getDestFile() {
        return this.zipFile;
    }

    public String getEncoding() {
        return this.encoding;
    }

    public boolean getFallBackToUTF8() {
        return this.fallBackToUTF8;
    }

    public int getLevel() {
        return this.level;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r0v38, resolved type: java.lang.Object[] */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v14, types: [org.apache.tools.ant.types.Resource[], org.apache.tools.ant.types.Resource[][]] */
    protected ArchiveState getNonFileSetResourcesToAdd(ResourceCollection[] resourceCollectionArr, File file, boolean z) throws BuildException {
        boolean z2;
        ArchiveState archiveState;
        boolean z3;
        Class cls;
        Resource[][] grabNonFileSetResources = grabNonFileSetResources(resourceCollectionArr);
        boolean isEmpty = isEmpty(grabNonFileSetResources);
        haveNonFileSetResourcesToAdd.set(Boolean.valueOf(!isEmpty));
        if (isEmpty) {
            archiveState = new ArchiveState(z, grabNonFileSetResources);
        } else if (!file.exists()) {
            archiveState = new ArchiveState(true, grabNonFileSetResources);
        } else if (!z || this.doUpdate) {
            ?? r0 = new Resource[resourceCollectionArr.length];
            int i = 0;
            while (true) {
                z2 = z;
                if (i >= resourceCollectionArr.length) {
                    break;
                }
                if (grabNonFileSetResources[i].length == 0) {
                    r0[i] = new Resource[0];
                    z3 = z;
                } else {
                    for (int i2 = 0; i2 < grabNonFileSetResources[i].length; i2++) {
                        Resource resource = grabNonFileSetResources[i][i2];
                        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                            cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                            class$org$apache$tools$ant$types$resources$FileProvider = cls;
                        } else {
                            cls = class$org$apache$tools$ant$types$resources$FileProvider;
                        }
                        FileProvider fileProvider = (FileProvider) resource.as(cls);
                        if (fileProvider != null && file.equals(fileProvider.getFile())) {
                            throw new BuildException("A zip file cannot include itself", getLocation());
                        }
                    }
                    r0[i] = selectOutOfDateResources(grabNonFileSetResources[i], new IdentityMapper());
                    boolean z4 = z || r0[i].length > 0;
                    z3 = z4;
                    if (z4) {
                        z3 = z4;
                        if (!this.doUpdate) {
                            z2 = z4;
                            break;
                        }
                    } else {
                        continue;
                    }
                }
                i++;
                z = z3;
            }
            archiveState = (!z2 || this.doUpdate) ? new ArchiveState(z2, r0) : new ArchiveState(true, grabNonFileSetResources);
        } else {
            archiveState = new ArchiveState(true, grabNonFileSetResources);
        }
        return archiveState;
    }

    public boolean getPreserve0Permissions() {
        return this.preserve0Permissions;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r0v38, resolved type: java.lang.Object[] */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v9, types: [org.apache.tools.ant.types.Resource[], org.apache.tools.ant.types.Resource[][]] */
    protected ArchiveState getResourcesToAdd(FileSet[] fileSetArr, File file, boolean z) throws BuildException {
        boolean z2;
        ArchiveState archiveState;
        boolean z3;
        Resource[][] grabResources = grabResources(fileSetArr);
        if (isEmpty(grabResources)) {
            boolean z4 = z;
            if (Boolean.FALSE.equals(haveNonFileSetResourcesToAdd.get())) {
                if (z && this.doUpdate) {
                    archiveState = new ArchiveState(true, grabResources);
                } else if (this.emptyBehavior.equals(MSVSSConstants.WRITABLE_SKIP)) {
                    if (this.doUpdate) {
                        logWhenWriting(new StringBuffer().append(this.archiveType).append(" archive ").append(file).append(" not updated because no new files were").append(" included.").toString(), 3);
                        z4 = z;
                    } else {
                        logWhenWriting(new StringBuffer().append("Warning: skipping ").append(this.archiveType).append(" archive ").append(file).append(" because no files were included.").toString(), 1);
                        z4 = z;
                    }
                } else if (this.emptyBehavior.equals("fail")) {
                    throw new BuildException(new StringBuffer().append("Cannot create ").append(this.archiveType).append(" archive ").append(file).append(": no files were included.").toString(), getLocation());
                } else {
                    z4 = z;
                    if (!file.exists()) {
                        z4 = true;
                    }
                }
            }
            archiveState = new ArchiveState(z4, grabResources);
        } else if (!file.exists()) {
            archiveState = new ArchiveState(true, grabResources);
        } else if (!z || this.doUpdate) {
            ?? r0 = new Resource[fileSetArr.length];
            for (int i = 0; i < fileSetArr.length; i++) {
                if (!(this.fileset instanceof ZipFileSet) || ((ZipFileSet) this.fileset).getSrc(getProject()) == null) {
                    File dir = fileSetArr[i].getDir(getProject());
                    for (int i2 = 0; i2 < grabResources[i].length; i2++) {
                        if (FILE_UTILS.resolveFile(dir, grabResources[i][i2].getName()).equals(file)) {
                            throw new BuildException("A zip file cannot include itself", getLocation());
                        }
                    }
                    continue;
                }
            }
            int i3 = 0;
            while (true) {
                z2 = z;
                if (i3 >= fileSetArr.length) {
                    break;
                }
                if (grabResources[i3].length == 0) {
                    r0[i3] = new Resource[0];
                    z3 = z;
                } else {
                    IdentityMapper identityMapper = new IdentityMapper();
                    MergingMapper mergingMapper = identityMapper;
                    if (fileSetArr[i3] instanceof ZipFileSet) {
                        ZipFileSet zipFileSet = (ZipFileSet) fileSetArr[i3];
                        if (zipFileSet.getFullpath(getProject()) == null || zipFileSet.getFullpath(getProject()).equals("")) {
                            mergingMapper = identityMapper;
                            if (zipFileSet.getPrefix(getProject()) != null) {
                                mergingMapper = identityMapper;
                                if (!zipFileSet.getPrefix(getProject()).equals("")) {
                                    GlobPatternMapper globPatternMapper = new GlobPatternMapper();
                                    globPatternMapper.setFrom("*");
                                    String prefix = zipFileSet.getPrefix(getProject());
                                    String str = prefix;
                                    if (!prefix.endsWith("/")) {
                                        str = prefix;
                                        if (!prefix.endsWith("\\")) {
                                            str = new StringBuffer().append(prefix).append("/").toString();
                                        }
                                    }
                                    globPatternMapper.setTo(new StringBuffer().append(str).append("*").toString());
                                    mergingMapper = globPatternMapper;
                                }
                            }
                        } else {
                            MergingMapper mergingMapper2 = new MergingMapper();
                            mergingMapper2.setTo(zipFileSet.getFullpath(getProject()));
                            mergingMapper = mergingMapper2;
                        }
                    }
                    r0[i3] = selectOutOfDateResources(grabResources[i3], mergingMapper);
                    boolean z5 = z || r0[i3].length > 0;
                    z3 = z5;
                    if (z5) {
                        z3 = z5;
                        if (!this.doUpdate) {
                            z2 = z5;
                            break;
                        }
                    } else {
                        continue;
                    }
                }
                i3++;
                z = z3;
            }
            archiveState = (!z2 || this.doUpdate) ? new ArchiveState(z2, r0) : new ArchiveState(true, grabResources);
        } else {
            archiveState = new ArchiveState(true, grabResources);
        }
        return archiveState;
    }

    /* JADX WARN: Type inference failed for: r0v16, types: [org.apache.tools.ant.types.Resource[], org.apache.tools.ant.types.Resource[][]] */
    protected ArchiveState getResourcesToAdd(ResourceCollection[] resourceCollectionArr, File file, boolean z) throws BuildException {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (int i = 0; i < resourceCollectionArr.length; i++) {
            if (resourceCollectionArr[i] instanceof FileSet) {
                arrayList.add(resourceCollectionArr[i]);
            } else {
                arrayList2.add(resourceCollectionArr[i]);
            }
        }
        ResourceCollection[] resourceCollectionArr2 = (ResourceCollection[]) arrayList2.toArray(new ResourceCollection[arrayList2.size()]);
        ArchiveState nonFileSetResourcesToAdd = getNonFileSetResourcesToAdd(resourceCollectionArr2, file, z);
        ArchiveState resourcesToAdd = getResourcesToAdd((FileSet[]) arrayList.toArray(new FileSet[arrayList.size()]), file, nonFileSetResourcesToAdd.isOutOfDate());
        ArchiveState archiveState = nonFileSetResourcesToAdd;
        if (!nonFileSetResourcesToAdd.isOutOfDate()) {
            archiveState = nonFileSetResourcesToAdd;
            if (resourcesToAdd.isOutOfDate()) {
                archiveState = getNonFileSetResourcesToAdd(resourceCollectionArr2, file, true);
            }
        }
        ?? r0 = new Resource[resourceCollectionArr.length];
        int i2 = 0;
        int i3 = 0;
        for (int i4 = 0; i4 < resourceCollectionArr.length; i4++) {
            if (resourceCollectionArr[i4] instanceof FileSet) {
                r0[i4] = resourcesToAdd.getResourcesToAdd()[i2];
                i2++;
            } else {
                r0[i4] = archiveState.getResourcesToAdd()[i3];
                i3++;
            }
        }
        return new ArchiveState(resourcesToAdd.isOutOfDate(), r0);
    }

    public boolean getUseLanguageEnodingFlag() {
        return this.useLanguageEncodingFlag;
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [org.apache.tools.ant.types.Resource[], org.apache.tools.ant.types.Resource[][]] */
    protected Resource[][] grabNonFileSetResources(ResourceCollection[] resourceCollectionArr) {
        ?? r0 = new Resource[resourceCollectionArr.length];
        for (int i = 0; i < resourceCollectionArr.length; i++) {
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            for (Resource resource : resourceCollectionArr[i]) {
                if (resource.isExists()) {
                    if (resource.isDirectory()) {
                        arrayList.add(resource);
                    } else {
                        arrayList2.add(resource);
                    }
                }
            }
            Collections.sort(arrayList, new Comparator(this) { // from class: org.apache.tools.ant.taskdefs.Zip.4
                private final Zip this$0;

                {
                    this.this$0 = this;
                }

                @Override // java.util.Comparator
                public int compare(Object obj, Object obj2) {
                    return ((Resource) obj).getName().compareTo(((Resource) obj2).getName());
                }
            });
            ArrayList arrayList3 = new ArrayList(arrayList);
            arrayList3.addAll(arrayList2);
            r0[i] = (Resource[]) arrayList3.toArray(new Resource[arrayList3.size()]);
        }
        return r0;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r1v11, resolved type: java.lang.Object[] */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v2, types: [org.apache.tools.ant.types.Resource[], org.apache.tools.ant.types.Resource[][]] */
    protected Resource[][] grabResources(FileSet[] fileSetArr) {
        ?? r0 = new Resource[fileSetArr.length];
        for (int i = 0; i < fileSetArr.length; i++) {
            boolean z = true;
            if (fileSetArr[i] instanceof ZipFileSet) {
                ZipFileSet zipFileSet = (ZipFileSet) fileSetArr[i];
                z = zipFileSet.getPrefix(getProject()).equals("") && zipFileSet.getFullpath(getProject()).equals("");
            }
            DirectoryScanner directoryScanner = fileSetArr[i].getDirectoryScanner(getProject());
            if (directoryScanner instanceof ZipScanner) {
                ((ZipScanner) directoryScanner).setEncoding(this.encoding);
            }
            Vector vector = new Vector();
            if (!this.doFilesonly) {
                String[] includedDirectories = directoryScanner.getIncludedDirectories();
                for (int i2 = 0; i2 < includedDirectories.length; i2++) {
                    if (!"".equals(includedDirectories[i2]) || !z) {
                        vector.addElement(directoryScanner.getResource(includedDirectories[i2]));
                    }
                }
            }
            String[] includedFiles = directoryScanner.getIncludedFiles();
            for (int i3 = 0; i3 < includedFiles.length; i3++) {
                if (!"".equals(includedFiles[i3]) || !z) {
                    vector.addElement(directoryScanner.getResource(includedFiles[i3]));
                }
            }
            r0[i] = new Resource[vector.size()];
            vector.copyInto(r0[i]);
        }
        return r0;
    }

    protected boolean hasUpdatedFile() {
        return this.updatedFile;
    }

    protected void initZipOutputStream(ZipOutputStream zipOutputStream) throws IOException, BuildException {
    }

    protected final boolean isAddingNewFiles() {
        return this.addingNewFiles;
    }

    public boolean isCompress() {
        return this.doCompress;
    }

    protected final boolean isFirstPass() {
        return !this.doubleFilePass || this.skipWriting;
    }

    public boolean isInUpdateMode() {
        return this.doUpdate;
    }

    protected void logWhenWriting(String str, int i) {
        if (!this.skipWriting) {
            log(str, i);
        }
    }

    public void reset() {
        this.resources.removeAllElements();
        this.zipFile = null;
        this.baseDir = null;
        this.groupfilesets.removeAllElements();
        this.duplicate = "add";
        this.archiveType = ArchiveStreamFactory.ZIP;
        this.doCompress = true;
        this.emptyBehavior = MSVSSConstants.WRITABLE_SKIP;
        this.doUpdate = false;
        this.doFilesonly = false;
        this.encoding = null;
    }

    protected Resource[] selectDirectoryResources(Resource[] resourceArr) {
        return selectResources(resourceArr, new ResourceSelector(this) { // from class: org.apache.tools.ant.taskdefs.Zip.7
            private final Zip this$0;

            {
                this.this$0 = this;
            }

            @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
            public boolean isSelected(Resource resource) {
                return resource.isDirectory();
            }
        });
    }

    protected Resource[] selectFileResources(Resource[] resourceArr) {
        return selectResources(resourceArr, new ResourceSelector(this) { // from class: org.apache.tools.ant.taskdefs.Zip.6
            private final Zip this$0;

            {
                this.this$0 = this;
            }

            @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
            public boolean isSelected(Resource resource) {
                boolean z;
                if (!resource.isDirectory()) {
                    z = true;
                } else {
                    if (this.this$0.doFilesonly) {
                        this.this$0.logWhenWriting(new StringBuffer().append("Ignoring directory ").append(resource.getName()).append(" as only files will").append(" be added.").toString(), 3);
                    }
                    z = false;
                }
                return z;
            }
        });
    }

    protected Resource[] selectResources(Resource[] resourceArr, ResourceSelector resourceSelector) {
        Resource[] resourceArr2;
        if (resourceArr.length == 0) {
            resourceArr2 = resourceArr;
        } else {
            ArrayList arrayList = new ArrayList(resourceArr.length);
            for (int i = 0; i < resourceArr.length; i++) {
                if (resourceSelector.isSelected(resourceArr[i])) {
                    arrayList.add(resourceArr[i]);
                }
            }
            resourceArr2 = resourceArr;
            if (arrayList.size() != resourceArr.length) {
                resourceArr2 = (Resource[]) arrayList.toArray(new Resource[arrayList.size()]);
            }
        }
        return resourceArr2;
    }

    public void setBasedir(File file) {
        this.baseDir = file;
    }

    public void setComment(String str) {
        this.comment = str;
    }

    public void setCompress(boolean z) {
        this.doCompress = z;
    }

    public void setCreateUnicodeExtraFields(UnicodeExtraField unicodeExtraField) {
        this.createUnicodeExtraFields = unicodeExtraField;
    }

    protected final void setCurrentExtraFields(ZipExtraField[] zipExtraFieldArr) {
        currentZipExtra.set(zipExtraFieldArr);
    }

    public void setDestFile(File file) {
        this.zipFile = file;
    }

    public void setDuplicate(Duplicate duplicate) {
        this.duplicate = duplicate.getValue();
    }

    public void setEncoding(String str) {
        this.encoding = str;
    }

    public void setFallBackToUTF8(boolean z) {
        this.fallBackToUTF8 = z;
    }

    public void setFile(File file) {
        setDestFile(file);
    }

    public void setFilesonly(boolean z) {
        this.doFilesonly = z;
    }

    public void setKeepCompression(boolean z) {
        this.keepCompression = z;
    }

    public void setLevel(int i) {
        this.level = i;
    }

    public void setPreserve0Permissions(boolean z) {
        this.preserve0Permissions = z;
    }

    public void setRoundUp(boolean z) {
        this.roundUp = z;
    }

    public void setUpdate(boolean z) {
        this.doUpdate = z;
        this.savedDoUpdate = z;
    }

    public void setUseLanguageEncodingFlag(boolean z) {
        this.useLanguageEncodingFlag = z;
    }

    public void setWhenempty(WhenEmpty whenEmpty) {
        this.emptyBehavior = whenEmpty.getValue();
    }

    public void setZipfile(File file) {
        setDestFile(file);
    }

    protected void zipDir(File file, ZipOutputStream zipOutputStream, String str, int i) throws IOException {
        zipDir(file, zipOutputStream, str, i, (ZipExtraField[]) null);
    }

    protected void zipDir(File file, ZipOutputStream zipOutputStream, String str, int i, ZipExtraField[] zipExtraFieldArr) throws IOException {
        zipDir(file == null ? null : new FileResource(file), zipOutputStream, str, i, zipExtraFieldArr);
    }

    protected void zipDir(Resource resource, ZipOutputStream zipOutputStream, String str, int i, ZipExtraField[] zipExtraFieldArr) throws IOException {
        if (this.doFilesonly) {
            logWhenWriting(new StringBuffer().append("skipping directory ").append(str).append(" for file-only archive").toString(), 3);
        } else if (this.addedDirs.get(str) != null) {
        } else {
            logWhenWriting(new StringBuffer().append("adding directory ").append(str).toString(), 3);
            this.addedDirs.put(str, str);
            if (this.skipWriting) {
                return;
            }
            ZipEntry zipEntry = new ZipEntry(str);
            int i2 = this.roundUp ? ROUNDUP_MILLIS : 0;
            if (resource == null || !resource.isExists()) {
                zipEntry.setTime(System.currentTimeMillis() + i2);
            } else {
                zipEntry.setTime(resource.getLastModified() + i2);
            }
            zipEntry.setSize(0L);
            zipEntry.setMethod(0);
            zipEntry.setCrc(EMPTY_CRC);
            zipEntry.setUnixMode(i);
            if (zipExtraFieldArr != null) {
                zipEntry.setExtraFields(zipExtraFieldArr);
            }
            zipOutputStream.putNextEntry(zipEntry);
        }
    }

    protected void zipFile(File file, ZipOutputStream zipOutputStream, String str, int i) throws IOException {
        if (file.equals(this.zipFile)) {
            throw new BuildException("A zip file cannot include itself", getLocation());
        }
        FileInputStream fileInputStream = new FileInputStream(file);
        try {
            zipFile(fileInputStream, zipOutputStream, str, (this.roundUp ? ROUNDUP_MILLIS : 0) + file.lastModified(), null, i);
        } finally {
            fileInputStream.close();
        }
    }

    protected void zipFile(InputStream inputStream, ZipOutputStream zipOutputStream, String str, long j, File file, int i) throws IOException {
        int read;
        long j2;
        int read2;
        long j3;
        int read3;
        if (!this.entries.containsKey(str)) {
            logWhenWriting(new StringBuffer().append("adding entry ").append(str).toString(), 3);
        } else if (this.duplicate.equals("preserve")) {
            logWhenWriting(new StringBuffer().append(str).append(" already added, skipping").toString(), 2);
            return;
        } else if (this.duplicate.equals("fail")) {
            throw new BuildException(new StringBuffer().append("Duplicate file ").append(str).append(" was found and the duplicate ").append("attribute is 'fail'.").toString());
        } else {
            logWhenWriting(new StringBuffer().append("duplicate file ").append(str).append(" found, adding.").toString(), 3);
        }
        this.entries.put(str, str);
        if (this.skipWriting) {
            this.addedFiles.addElement(str);
        }
        ZipEntry zipEntry = new ZipEntry(str);
        zipEntry.setTime(j);
        zipEntry.setMethod(this.doCompress ? 8 : 0);
        InputStream inputStream2 = inputStream;
        if (!zipOutputStream.isSeekable()) {
            inputStream2 = inputStream;
            if (!this.doCompress) {
                long j4 = 0;
                CRC32 crc32 = new CRC32();
                if (!inputStream.markSupported()) {
                    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                    byte[] bArr = new byte[8192];
                    int i2 = 0;
                    long j5 = 0;
                    do {
                        j3 = j5 + i2;
                        crc32.update(bArr, 0, i2);
                        byteArrayOutputStream.write(bArr, 0, i2);
                        read3 = inputStream.read(bArr, 0, bArr.length);
                        i2 = read3;
                        j5 = j3;
                    } while (read3 != -1);
                    inputStream = new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
                } else {
                    inputStream.mark(Execute.INVALID);
                    byte[] bArr2 = new byte[8192];
                    int i3 = 0;
                    do {
                        j2 = j4 + i3;
                        crc32.update(bArr2, 0, i3);
                        read2 = inputStream.read(bArr2, 0, bArr2.length);
                        i3 = read2;
                        j4 = j2;
                    } while (read2 != -1);
                    inputStream.reset();
                    j3 = j2;
                }
                zipEntry.setSize(j3);
                zipEntry.setCrc(crc32.getValue());
                inputStream2 = inputStream;
            }
        }
        zipEntry.setUnixMode(i);
        ZipExtraField[] currentExtraFields = getCurrentExtraFields();
        if (currentExtraFields != null) {
            zipEntry.setExtraFields(currentExtraFields);
        }
        zipOutputStream.putNextEntry(zipEntry);
        byte[] bArr3 = new byte[8192];
        int i4 = 0;
        do {
            if (i4 != 0) {
                zipOutputStream.write(bArr3, 0, i4);
            }
            read = inputStream2.read(bArr3, 0, bArr3.length);
            i4 = read;
        } while (read != -1);
        this.addedFiles.addElement(str);
    }

    protected final void zipFile(InputStream inputStream, ZipOutputStream zipOutputStream, String str, long j, File file, int i, ZipExtraField[] zipExtraFieldArr) throws IOException {
        try {
            setCurrentExtraFields(zipExtraFieldArr);
            zipFile(inputStream, zipOutputStream, str, j, file, i);
        } finally {
            setCurrentExtraFields(null);
        }
    }
}
