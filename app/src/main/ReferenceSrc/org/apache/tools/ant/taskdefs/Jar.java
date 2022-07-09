package org.apache.tools.ant.taskdefs;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import java.util.TreeMap;
import java.util.Vector;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import org.apache.commons.compress.archivers.ArchiveStreamFactory;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.taskdefs.Manifest;
import org.apache.tools.ant.taskdefs.Zip;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.apache.tools.ant.types.ArchiveFileSet;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.ZipFileSet;
import org.apache.tools.ant.types.spi.Service;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.zip.JarMarker;
import org.apache.tools.zip.ZipExtraField;
import org.apache.tools.zip.ZipOutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Jar.class */
public class Jar extends Zip {
    private static final String INDEX_NAME = "META-INF/INDEX.LIST";
    private static final ZipExtraField[] JAR_MARKER = {JarMarker.getInstance()};
    private static final String MANIFEST_NAME = "META-INF/MANIFEST.MF";
    private Manifest configuredManifest;
    private Manifest filesetManifest;
    private FilesetManifestConfig filesetManifestConfig;
    private Path indexJars;
    private Manifest manifest;
    private String manifestEncoding;
    private File manifestFile;
    private Manifest originalManifest;
    private Manifest savedConfiguredManifest;
    private List serviceList = new ArrayList();
    private boolean mergeManifestsMain = true;
    private boolean index = false;
    private boolean indexMetaInf = false;
    private boolean createEmpty = false;
    private StrictMode strict = new StrictMode(Definer.OnError.POLICY_IGNORE);
    private boolean mergeClassPaths = false;
    private boolean flattenClassPaths = false;
    private Vector rootEntries = new Vector();

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Jar$FilesetManifestConfig.class */
    public static class FilesetManifestConfig extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{MSVSSConstants.WRITABLE_SKIP, "merge", "mergewithoutmain"};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Jar$StrictMode.class */
    public static class StrictMode extends EnumeratedAttribute {
        public StrictMode() {
        }

        public StrictMode(String str) {
            setValue(str);
        }

        public int getLogLevel() {
            return getValue().equals(Definer.OnError.POLICY_IGNORE) ? 3 : 1;
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"fail", "warn", Definer.OnError.POLICY_IGNORE};
        }
    }

    public Jar() {
        this.archiveType = ArchiveStreamFactory.JAR;
        this.emptyBehavior = "create";
        setEncoding("UTF8");
    }

    private void checkJarSpec() {
        String property = System.getProperty("line.separator");
        StringBuffer stringBuffer = new StringBuffer();
        Manifest.Section mainSection = this.configuredManifest == null ? null : this.configuredManifest.getMainSection();
        if (mainSection == null) {
            stringBuffer.append("No Implementation-Title set.");
            stringBuffer.append("No Implementation-Version set.");
            stringBuffer.append("No Implementation-Vendor set.");
        } else {
            if (mainSection.getAttribute("Implementation-Title") == null) {
                stringBuffer.append("No Implementation-Title set.");
            }
            if (mainSection.getAttribute("Implementation-Version") == null) {
                stringBuffer.append("No Implementation-Version set.");
            }
            if (mainSection.getAttribute("Implementation-Vendor") == null) {
                stringBuffer.append("No Implementation-Vendor set.");
            }
        }
        if (stringBuffer.length() > 0) {
            stringBuffer.append(property);
            stringBuffer.append("Location: ").append(getLocation());
            stringBuffer.append(property);
            if (this.strict.getValue().equalsIgnoreCase("fail")) {
                throw new BuildException(stringBuffer.toString(), getLocation());
            }
            logWhenWriting(stringBuffer.toString(), this.strict.getLogLevel());
        }
    }

    private void createIndexList(ZipOutputStream zipOutputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(byteArrayOutputStream, "UTF8"));
        printWriter.println("JarIndex-Version: 1.0");
        printWriter.println();
        printWriter.println(this.zipFile.getName());
        writeIndexLikeList(new ArrayList(this.addedDirs.keySet()), this.rootEntries, printWriter);
        printWriter.println();
        if (this.indexJars != null) {
            Manifest.Attribute attribute = createManifest().getMainSection().getAttribute(Manifest.ATTRIBUTE_CLASSPATH);
            String[] strArr = null;
            if (attribute != null) {
                strArr = null;
                if (attribute.getValue() != null) {
                    StringTokenizer stringTokenizer = new StringTokenizer(attribute.getValue(), " ");
                    String[] strArr2 = new String[stringTokenizer.countTokens()];
                    int i = 0;
                    while (true) {
                        strArr = strArr2;
                        if (!stringTokenizer.hasMoreTokens()) {
                            break;
                        }
                        strArr2[i] = stringTokenizer.nextToken();
                        i++;
                    }
                }
            }
            String[] list = this.indexJars.list();
            for (int i2 = 0; i2 < list.length; i2++) {
                String findJarName = findJarName(list[i2], strArr);
                if (findJarName != null) {
                    ArrayList arrayList = new ArrayList();
                    ArrayList arrayList2 = new ArrayList();
                    grabFilesAndDirs(list[i2], arrayList, arrayList2);
                    if (arrayList.size() + arrayList2.size() > 0) {
                        printWriter.println(findJarName);
                        writeIndexLikeList(arrayList, arrayList2, printWriter);
                        printWriter.println();
                    }
                }
            }
        }
        if (printWriter.checkError()) {
            throw new IOException("Encountered an error writing jar index");
        }
        printWriter.close();
        InputStream byteArrayInputStream = new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
        try {
            super.zipFile(byteArrayInputStream, zipOutputStream, INDEX_NAME, System.currentTimeMillis(), null, 33188);
        } finally {
            FileUtils.close(byteArrayInputStream);
        }
    }

    private Manifest createManifest() throws BuildException {
        try {
            Manifest defaultManifest = Manifest.getDefaultManifest();
            if (this.manifest == null && this.manifestFile != null) {
                this.manifest = getManifest(this.manifestFile);
            }
            if (isInUpdateMode()) {
                defaultManifest.merge(this.originalManifest, false, this.mergeClassPaths);
            }
            defaultManifest.merge(this.filesetManifest, false, this.mergeClassPaths);
            defaultManifest.merge(this.configuredManifest, !this.mergeManifestsMain, this.mergeClassPaths);
            defaultManifest.merge(this.manifest, !this.mergeManifestsMain, this.mergeClassPaths);
            return defaultManifest;
        } catch (ManifestException e) {
            log(new StringBuffer().append("Manifest is invalid: ").append(e.getMessage()).toString(), 0);
            throw new BuildException("Invalid Manifest", e, getLocation());
        }
    }

    private void filesetManifest(File file, InputStream inputStream) throws IOException {
        Manifest manifest;
        if (this.manifestFile != null && this.manifestFile.equals(file)) {
            log(new StringBuffer().append("Found manifest ").append(file).toString(), 3);
            try {
                if (inputStream != null) {
                    this.manifest = getManifest(this.manifestEncoding == null ? new InputStreamReader(inputStream) : new InputStreamReader(inputStream, this.manifestEncoding));
                } else {
                    this.manifest = getManifest(file);
                }
            } catch (UnsupportedEncodingException e) {
                throw new BuildException(new StringBuffer().append("Unsupported encoding while reading manifest: ").append(e.getMessage()).toString(), e);
            }
        } else if (this.filesetManifestConfig == null || this.filesetManifestConfig.getValue().equals(MSVSSConstants.WRITABLE_SKIP)) {
        } else {
            logWhenWriting(new StringBuffer().append("Found manifest to merge in file ").append(file).toString(), 3);
            try {
                if (inputStream != null) {
                    manifest = getManifest(this.manifestEncoding == null ? new InputStreamReader(inputStream) : new InputStreamReader(inputStream, this.manifestEncoding));
                } else {
                    manifest = getManifest(file);
                }
                if (this.filesetManifest == null) {
                    this.filesetManifest = manifest;
                } else {
                    this.filesetManifest.merge(manifest, false, this.mergeClassPaths);
                }
            } catch (UnsupportedEncodingException e2) {
                throw new BuildException(new StringBuffer().append("Unsupported encoding while reading manifest: ").append(e2.getMessage()).toString(), e2);
            } catch (ManifestException e3) {
                log(new StringBuffer().append("Manifest in file ").append(file).append(" is invalid: ").append(e3.getMessage()).toString(), 0);
                throw new BuildException("Invalid Manifest", e3, getLocation());
            }
        }
    }

    protected static String findJarName(String str, String[] strArr) {
        String str2;
        if (strArr == null) {
            str2 = new File(str).getName();
        } else {
            String replace = str.replace(File.separatorChar, '/');
            TreeMap treeMap = new TreeMap(new Comparator() { // from class: org.apache.tools.ant.taskdefs.Jar.1
                @Override // java.util.Comparator
                public int compare(Object obj, Object obj2) {
                    return (!(obj instanceof String) || !(obj2 instanceof String)) ? 0 : ((String) obj2).length() - ((String) obj).length();
                }
            });
            for (int i = 0; i < strArr.length; i++) {
                if (replace.endsWith(strArr[i])) {
                    treeMap.put(strArr[i], strArr[i]);
                } else {
                    int indexOf = strArr[i].indexOf("/");
                    String str3 = strArr[i];
                    while (true) {
                        if (indexOf > -1) {
                            str3 = str3.substring(indexOf + 1);
                            if (replace.endsWith(str3)) {
                                treeMap.put(str3, strArr[i]);
                                break;
                            }
                            indexOf = str3.indexOf("/");
                        }
                    }
                }
            }
            str2 = treeMap.size() == 0 ? null : (String) treeMap.get(treeMap.firstKey());
        }
        return str2;
    }

    private Manifest getManifest(File file) {
        IOException e;
        Throwable th;
        UnsupportedEncodingException e2;
        FileInputStream fileInputStream;
        InputStreamReader inputStreamReader;
        InputStreamReader inputStreamReader2 = null;
        InputStreamReader inputStreamReader3 = null;
        InputStreamReader inputStreamReader4 = null;
        try {
            try {
                fileInputStream = new FileInputStream(file);
                inputStreamReader = null;
                inputStreamReader2 = null;
                inputStreamReader3 = null;
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (UnsupportedEncodingException e3) {
            e2 = e3;
        } catch (IOException e4) {
            e = e4;
        }
        try {
            InputStreamReader inputStreamReader5 = this.manifestEncoding == null ? new InputStreamReader(fileInputStream) : new InputStreamReader(fileInputStream, this.manifestEncoding);
            inputStreamReader = inputStreamReader5;
            inputStreamReader2 = inputStreamReader5;
            inputStreamReader3 = inputStreamReader5;
            Manifest manifest = getManifest(inputStreamReader5);
            FileUtils.close(inputStreamReader5);
            return manifest;
        } catch (UnsupportedEncodingException e5) {
            e2 = e5;
            InputStreamReader inputStreamReader6 = inputStreamReader3;
            InputStreamReader inputStreamReader7 = inputStreamReader3;
            InputStreamReader inputStreamReader8 = inputStreamReader3;
            InputStreamReader inputStreamReader9 = inputStreamReader3;
            throw new BuildException(new StringBuffer().append("Unsupported encoding while reading manifest: ").append(e2.getMessage()).toString(), e2);
        } catch (IOException e6) {
            e = e6;
            InputStreamReader inputStreamReader10 = inputStreamReader2;
            InputStreamReader inputStreamReader11 = inputStreamReader2;
            InputStreamReader inputStreamReader12 = inputStreamReader2;
            InputStreamReader inputStreamReader13 = inputStreamReader2;
            throw new BuildException(new StringBuffer().append("Unable to read manifest file: ").append(file).append(" (").append(e.getMessage()).append(")").toString(), e);
        } catch (Throwable th3) {
            th = th3;
            inputStreamReader4 = inputStreamReader;
            FileUtils.close(inputStreamReader4);
            throw th;
        }
    }

    private Manifest getManifest(Reader reader) {
        try {
            return new Manifest(reader);
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("Unable to read manifest file (").append(e.getMessage()).append(")").toString(), e);
        } catch (ManifestException e2) {
            log(new StringBuffer().append("Manifest is invalid: ").append(e2.getMessage()).toString(), 0);
            throw new BuildException(new StringBuffer().append("Invalid Manifest: ").append(this.manifestFile).toString(), e2, getLocation());
        }
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:24:0x006c */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:39:0x0016 */
    /* JADX DEBUG: Multi-variable search result rejected for r5v0, resolved type: java.io.File */
    /* JADX WARN: Code restructure failed: missing block: B:11:0x002f, code lost:
        r0 = getManifest(new java.io.InputStreamReader(r0.getInputStream(r5), "UTF-8"));
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0046, code lost:
        r5 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0048, code lost:
        if (r0 == 0) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x004d, code lost:
        r0.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0052, code lost:
        r5 = r0;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private Manifest getManifestFromJar(File file) throws IOException {
        Throwable th;
        ZipFile zipFile;
        ZipFile zipFile2 = null;
        try {
            zipFile = new ZipFile(file);
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            Enumeration<? extends ZipEntry> entries = zipFile.entries();
            ZipEntry zipEntry = file;
            while (true) {
                try {
                    if (entries.hasMoreElements()) {
                        ZipEntry nextElement = entries.nextElement();
                        boolean equalsIgnoreCase = nextElement.getName().equalsIgnoreCase(MANIFEST_NAME);
                        zipEntry = nextElement;
                        if (equalsIgnoreCase) {
                            break;
                        }
                    } else {
                        zipEntry = null;
                        if (zipFile != 0) {
                            zipFile.close();
                            zipEntry = null;
                        }
                    }
                } catch (IOException e) {
                }
            }
            Manifest manifest = zipEntry == 1 ? 1 : 0;
            boolean z = zipEntry == 1 ? 1 : 0;
            boolean z2 = zipEntry == 1 ? 1 : 0;
            return manifest;
        } catch (Throwable th3) {
            th = th3;
            zipFile2 = zipFile;
            if (zipFile2 != null) {
                try {
                    zipFile2.close();
                } catch (IOException e2) {
                }
            }
            throw th;
        }
    }

    protected static void grabFilesAndDirs(String str, List list, List list2) throws IOException {
        org.apache.tools.zip.ZipFile zipFile;
        try {
            org.apache.tools.zip.ZipFile zipFile2 = new org.apache.tools.zip.ZipFile(str, "utf-8");
            try {
                Enumeration entries = zipFile2.getEntries();
                HashSet hashSet = new HashSet();
                while (entries.hasMoreElements()) {
                    org.apache.tools.zip.ZipEntry zipEntry = (org.apache.tools.zip.ZipEntry) entries.nextElement();
                    String name = zipEntry.getName();
                    if (zipEntry.isDirectory()) {
                        hashSet.add(name);
                    } else if (name.indexOf("/") == -1) {
                        list2.add(name);
                    } else {
                        hashSet.add(name.substring(0, name.lastIndexOf("/") + 1));
                    }
                }
                list.addAll(hashSet);
                if (zipFile2 == null) {
                    return;
                }
                zipFile2.close();
            } catch (Throwable th) {
                th = th;
                zipFile = zipFile2;
                if (zipFile != null) {
                    zipFile.close();
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            zipFile = null;
        }
    }

    /* JADX DEBUG: Multi-variable search result rejected for r0v16, resolved type: java.lang.Object[] */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v2, types: [org.apache.tools.ant.types.Resource[], org.apache.tools.ant.types.Resource[][]] */
    private Resource[][] grabManifests(ResourceCollection[] resourceCollectionArr) {
        ?? r0 = new Resource[resourceCollectionArr.length];
        for (int i = 0; i < resourceCollectionArr.length; i++) {
            Resource[][] grabResources = resourceCollectionArr[i] instanceof FileSet ? grabResources(new FileSet[]{(FileSet) resourceCollectionArr[i]}) : grabNonFileSetResources(new ResourceCollection[]{resourceCollectionArr[i]});
            int i2 = 0;
            while (true) {
                if (i2 >= grabResources[0].length) {
                    break;
                }
                String replace = grabResources[0][i2].getName().replace('\\', '/');
                String str = replace;
                if (resourceCollectionArr[i] instanceof ArchiveFileSet) {
                    ArchiveFileSet archiveFileSet = (ArchiveFileSet) resourceCollectionArr[i];
                    if (!"".equals(archiveFileSet.getFullpath(getProject()))) {
                        str = archiveFileSet.getFullpath(getProject());
                    } else {
                        str = replace;
                        if (!"".equals(archiveFileSet.getPrefix(getProject()))) {
                            String prefix = archiveFileSet.getPrefix(getProject());
                            String str2 = prefix;
                            if (!prefix.endsWith("/")) {
                                str2 = prefix;
                                if (!prefix.endsWith("\\")) {
                                    str2 = new StringBuffer().append(prefix).append("/").toString();
                                }
                            }
                            str = new StringBuffer().append(str2).append(replace).toString();
                        }
                    }
                }
                if (str.equalsIgnoreCase(MANIFEST_NAME)) {
                    Resource[] resourceArr = new Resource[1];
                    resourceArr[0] = grabResources[0][i2];
                    r0[i] = resourceArr;
                    break;
                }
                i2++;
            }
            if (r0[i] == 0) {
                r0[i] = new Resource[0];
            }
        }
        return r0;
    }

    private boolean jarHasIndex(File file) throws IOException {
        Throwable th;
        boolean z;
        ZipFile zipFile = null;
        try {
            ZipFile zipFile2 = new ZipFile(file);
            try {
                Enumeration<? extends ZipEntry> entries = zipFile2.entries();
                while (true) {
                    try {
                        if (entries.hasMoreElements()) {
                            z = entries.nextElement().getName().equalsIgnoreCase(INDEX_NAME);
                            if (z) {
                                z = true;
                                if (zipFile2 != null) {
                                    zipFile2.close();
                                    z = true;
                                }
                            }
                        } else {
                            z = false;
                            if (zipFile2 != null) {
                                zipFile2.close();
                                z = false;
                            }
                        }
                    } catch (IOException e) {
                    }
                }
                return z;
            } catch (Throwable th2) {
                th = th2;
                zipFile = zipFile2;
                if (zipFile != null) {
                    try {
                        zipFile.close();
                    } catch (IOException e2) {
                    }
                }
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }

    private void writeManifest(ZipOutputStream zipOutputStream, Manifest manifest) throws IOException {
        Enumeration warnings = manifest.getWarnings();
        while (warnings.hasMoreElements()) {
            log(new StringBuffer().append("Manifest warning: ").append(warnings.nextElement()).toString(), 1);
        }
        zipDir((Resource) null, zipOutputStream, "META-INF/", 16877, JAR_MARKER);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(byteArrayOutputStream, "UTF-8"));
        manifest.write(printWriter, this.flattenClassPaths);
        if (printWriter.checkError()) {
            throw new IOException("Encountered an error writing the manifest");
        }
        printWriter.close();
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
        try {
            super.zipFile(byteArrayInputStream, zipOutputStream, MANIFEST_NAME, System.currentTimeMillis(), null, 33188);
            FileUtils.close(byteArrayInputStream);
            super.initZipOutputStream(zipOutputStream);
        } catch (Throwable th) {
            FileUtils.close(byteArrayInputStream);
            throw th;
        }
    }

    private void writeServices(ZipOutputStream zipOutputStream) throws IOException {
        for (Service service : this.serviceList) {
            InputStream inputStream = null;
            try {
                super.zipFile(service.getAsStream(), zipOutputStream, new StringBuffer().append("META-INF/services/").append(service.getType()).toString(), System.currentTimeMillis(), null, 33188);
            } finally {
                FileUtils.close(inputStream);
            }
        }
    }

    public void addConfiguredIndexJars(Path path) {
        if (this.indexJars == null) {
            this.indexJars = new Path(getProject());
        }
        this.indexJars.append(path);
    }

    public void addConfiguredManifest(Manifest manifest) throws ManifestException {
        if (this.configuredManifest == null) {
            this.configuredManifest = manifest;
        } else {
            this.configuredManifest.merge(manifest, false, this.mergeClassPaths);
        }
        this.savedConfiguredManifest = this.configuredManifest;
    }

    public void addConfiguredService(Service service) {
        service.check();
        this.serviceList.add(service);
    }

    public void addMetainf(ZipFileSet zipFileSet) {
        zipFileSet.setPrefix("META-INF/");
        super.addFileset(zipFileSet);
    }

    @Override // org.apache.tools.ant.taskdefs.Zip
    protected void cleanUp() {
        super.cleanUp();
        checkJarSpec();
        if (!this.doubleFilePass || !this.skipWriting) {
            this.manifest = null;
            this.configuredManifest = this.savedConfiguredManifest;
            this.filesetManifest = null;
            this.originalManifest = null;
        }
        this.rootEntries.removeAllElements();
    }

    @Override // org.apache.tools.ant.taskdefs.Zip
    protected boolean createEmptyZip(File file) throws BuildException {
        ZipOutputStream zipOutputStream;
        Throwable th;
        ZipOutputStream zipOutputStream2;
        if (!this.createEmpty) {
            return true;
        }
        if (this.emptyBehavior.equals(MSVSSConstants.WRITABLE_SKIP)) {
            if (this.skipWriting) {
                return true;
            }
            log(new StringBuffer().append("Warning: skipping ").append(this.archiveType).append(" archive ").append(file).append(" because no files were included.").toString(), 1);
            return true;
        } else if (this.emptyBehavior.equals("fail")) {
            throw new BuildException(new StringBuffer().append("Cannot create ").append(this.archiveType).append(" archive ").append(file).append(": no files were included.").toString(), getLocation());
        } else {
            ZipOutputStream zipOutputStream3 = null;
            try {
                try {
                    if (!this.skipWriting) {
                        log(new StringBuffer().append("Building MANIFEST-only jar: ").append(getDestFile().getAbsolutePath()).toString());
                    }
                    zipOutputStream = new ZipOutputStream(new FileOutputStream(getDestFile()));
                } catch (IOException e) {
                    e = e;
                    zipOutputStream = null;
                }
            } catch (Throwable th2) {
                th = th2;
                zipOutputStream2 = zipOutputStream3;
            }
            try {
                zipOutputStream.setEncoding(getEncoding());
                if (isCompress()) {
                    zipOutputStream.setMethod(8);
                } else {
                    zipOutputStream.setMethod(0);
                }
                initZipOutputStream(zipOutputStream);
                finalizeZipOutputStream(zipOutputStream);
                FileUtils.close(zipOutputStream);
                this.createEmpty = false;
                return true;
            } catch (IOException e2) {
                e = e2;
                ZipOutputStream zipOutputStream4 = zipOutputStream;
                ZipOutputStream zipOutputStream5 = zipOutputStream;
                ZipOutputStream zipOutputStream6 = zipOutputStream;
                zipOutputStream3 = zipOutputStream;
                throw new BuildException(new StringBuffer().append("Could not create almost empty JAR archive (").append(e.getMessage()).append(")").toString(), e, getLocation());
            } catch (Throwable th3) {
                zipOutputStream2 = zipOutputStream;
                th = th3;
                FileUtils.close(zipOutputStream2);
                this.createEmpty = false;
                throw th;
            }
        }
    }

    @Override // org.apache.tools.ant.taskdefs.Zip
    protected void finalizeZipOutputStream(ZipOutputStream zipOutputStream) throws IOException, BuildException {
        if (this.index) {
            createIndexList(zipOutputStream);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.Zip
    protected Zip.ArchiveState getResourcesToAdd(ResourceCollection[] resourceCollectionArr, File file, boolean z) throws BuildException {
        Zip.ArchiveState resourcesToAdd;
        if (this.skipWriting) {
            Resource[][] grabManifests = grabManifests(resourceCollectionArr);
            int i = 0;
            for (Resource[] resourceArr : grabManifests) {
                i += resourceArr.length;
            }
            log(new StringBuffer().append("found a total of ").append(i).append(" manifests in ").append(grabManifests.length).append(" resource collections").toString(), 3);
            resourcesToAdd = new Zip.ArchiveState(true, grabManifests);
        } else {
            if (file.exists()) {
                try {
                    this.originalManifest = getManifestFromJar(file);
                    if (this.originalManifest == null) {
                        log("Updating jar since the current jar has no manifest", 3);
                        z = true;
                    } else if (!createManifest().equals(this.originalManifest)) {
                        log("Updating jar since jar manifest has changed", 3);
                        z = true;
                    }
                } catch (Throwable th) {
                    log(new StringBuffer().append("error while reading original manifest in file: ").append(file.toString()).append(" due to ").append(th.getMessage()).toString(), 1);
                    z = true;
                }
            } else {
                z = true;
            }
            this.createEmpty = z;
            boolean z2 = z;
            if (!z) {
                z2 = z;
                if (this.index) {
                    try {
                        z2 = !jarHasIndex(file);
                    } catch (IOException e) {
                        z2 = true;
                    }
                }
            }
            resourcesToAdd = super.getResourcesToAdd(resourceCollectionArr, file, z2);
        }
        return resourcesToAdd;
    }

    @Override // org.apache.tools.ant.taskdefs.Zip
    protected void initZipOutputStream(ZipOutputStream zipOutputStream) throws IOException, BuildException {
        if (!this.skipWriting) {
            writeManifest(zipOutputStream, createManifest());
            writeServices(zipOutputStream);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.Zip
    public void reset() {
        super.reset();
        this.emptyBehavior = "create";
        this.configuredManifest = null;
        this.filesetManifestConfig = null;
        this.mergeManifestsMain = false;
        this.manifestFile = null;
        this.index = false;
    }

    public void setFilesetmanifest(FilesetManifestConfig filesetManifestConfig) {
        this.filesetManifestConfig = filesetManifestConfig;
        this.mergeManifestsMain = "merge".equals(filesetManifestConfig.getValue());
        if (this.filesetManifestConfig == null || this.filesetManifestConfig.getValue().equals(MSVSSConstants.WRITABLE_SKIP)) {
            return;
        }
        this.doubleFilePass = true;
    }

    public void setFlattenAttributes(boolean z) {
        this.flattenClassPaths = z;
    }

    public void setIndex(boolean z) {
        this.index = z;
    }

    public void setIndexMetaInf(boolean z) {
        this.indexMetaInf = z;
    }

    public void setJarfile(File file) {
        setDestFile(file);
    }

    public void setManifest(File file) {
        if (!file.exists()) {
            throw new BuildException(new StringBuffer().append("Manifest file: ").append(file).append(DirectoryScanner.DOES_NOT_EXIST_POSTFIX).toString(), getLocation());
        }
        this.manifestFile = file;
    }

    public void setManifestEncoding(String str) {
        this.manifestEncoding = str;
    }

    public void setMergeClassPathAttributes(boolean z) {
        this.mergeClassPaths = z;
    }

    public void setStrict(StrictMode strictMode) {
        this.strict = strictMode;
    }

    @Override // org.apache.tools.ant.taskdefs.Zip
    public void setWhenempty(Zip.WhenEmpty whenEmpty) {
        log("JARs are never empty, they contain at least a manifest file", 1);
    }

    public void setWhenmanifestonly(Zip.WhenEmpty whenEmpty) {
        this.emptyBehavior = whenEmpty.getValue();
    }

    protected final void writeIndexLikeList(List list, List list2, PrintWriter printWriter) throws IOException {
        Collections.sort(list);
        Collections.sort(list2);
        Iterator it = list.iterator();
        while (it.hasNext()) {
            String replace = ((String) it.next()).replace('\\', '/');
            String str = replace;
            if (replace.startsWith("./")) {
                str = replace.substring(2);
            }
            while (str.startsWith("/")) {
                str = str.substring(1);
            }
            int lastIndexOf = str.lastIndexOf(47);
            String str2 = str;
            if (lastIndexOf != -1) {
                str2 = str.substring(0, lastIndexOf);
            }
            if (this.indexMetaInf || !str2.startsWith("META-INF")) {
                printWriter.println(str2);
            }
        }
        for (Object obj : list2) {
            printWriter.println(obj);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.Zip
    protected void zipFile(InputStream inputStream, ZipOutputStream zipOutputStream, String str, long j, File file, int i) throws IOException {
        if (MANIFEST_NAME.equalsIgnoreCase(str)) {
            if (!isFirstPass()) {
                return;
            }
            filesetManifest(file, inputStream);
        } else if (INDEX_NAME.equalsIgnoreCase(str) && this.index) {
            logWhenWriting(new StringBuffer().append("Warning: selected ").append(this.archiveType).append(" files include a ").append(INDEX_NAME).append(" which will").append(" be replaced by a newly generated one.").toString(), 1);
        } else {
            if (this.index && str.indexOf("/") == -1) {
                this.rootEntries.addElement(str);
            }
            super.zipFile(inputStream, zipOutputStream, str, j, file, i);
        }
    }
}
