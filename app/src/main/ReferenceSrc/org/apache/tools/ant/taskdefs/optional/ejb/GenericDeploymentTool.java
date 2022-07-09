package org.apache.tools.ant.taskdefs.optional.ejb;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Set;
import java.util.jar.JarOutputStream;
import java.util.jar.Manifest;
import java.util.zip.ZipEntry;
import javax.xml.parsers.SAXParser;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Location;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.optional.ejb.EjbJar;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.depend.DependencyAnalyzer;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool.class */
public class GenericDeploymentTool implements EJBDeploymentTool {
    public static final String ANALYZER_CLASS_FULL = "org.apache.tools.ant.util.depend.bcel.FullAnalyzer";
    public static final String ANALYZER_CLASS_SUPER = "org.apache.tools.ant.util.depend.bcel.AncestorAnalyzer";
    public static final String ANALYZER_FULL = "full";
    public static final String ANALYZER_NONE = "none";
    public static final String ANALYZER_SUPER = "super";
    public static final String DEFAULT_ANALYZER = "super";
    public static final int DEFAULT_BUFFER_SIZE = 1024;
    protected static final String EJB_DD = "ejb-jar.xml";
    public static final int JAR_COMPRESS_LEVEL = 9;
    protected static final String MANIFEST = "META-INF/MANIFEST.MF";
    protected static final String META_DIR = "META-INF/";
    private Set addedfiles;
    private Path classpath;
    private EjbJar.Config config;
    private DependencyAnalyzer dependencyAnalyzer;
    private File destDir;
    private DescriptorHandler handler;
    private Task task;
    private String genericJarSuffix = "-generic.jar";
    private ClassLoader classpathLoader = null;

    private void createAnalyzer() {
        String str = this.config.analyzer;
        String str2 = str;
        if (str == null) {
            str2 = "super";
        }
        if (str2.equals("none")) {
            return;
        }
        if (str2.equals("super")) {
            str2 = ANALYZER_CLASS_SUPER;
        } else if (str2.equals(ANALYZER_FULL)) {
            str2 = "org.apache.tools.ant.util.depend.bcel.FullAnalyzer";
        }
        try {
            this.dependencyAnalyzer = (DependencyAnalyzer) Class.forName(str2).newInstance();
            this.dependencyAnalyzer.addClassPath(new Path(this.task.getProject(), this.config.srcDir.getPath()));
            this.dependencyAnalyzer.addClassPath(this.config.classpath);
        } catch (Exception e) {
            this.dependencyAnalyzer = null;
            this.task.log(new StringBuffer().append("Unable to load dependency analyzer: ").append(str2).append(" - exception: ").append(e.getMessage()).toString(), 1);
        } catch (NoClassDefFoundError e2) {
            this.dependencyAnalyzer = null;
            this.task.log(new StringBuffer().append("Unable to load dependency analyzer: ").append(str2).append(" - dependent class not found: ").append(e2.getMessage()).toString(), 1);
        }
    }

    protected void addFileToJar(JarOutputStream jarOutputStream, File file, String str) throws BuildException {
        Throwable th;
        IOException e;
        FileInputStream fileInputStream;
        int read;
        FileInputStream fileInputStream2 = null;
        FileInputStream fileInputStream3 = null;
        try {
            try {
                try {
                    if (!this.addedfiles.contains(str)) {
                        fileInputStream2 = new FileInputStream(file);
                        try {
                            jarOutputStream.putNextEntry(new ZipEntry(str.replace('\\', '/')));
                            byte[] bArr = new byte[2048];
                            int i = 0;
                            do {
                                jarOutputStream.write(bArr, 0, i);
                                read = fileInputStream2.read(bArr, 0, bArr.length);
                                i = read;
                            } while (read != -1);
                            this.addedfiles.add(str);
                        } catch (IOException e2) {
                            fileInputStream = fileInputStream2;
                            e = e2;
                            FileInputStream fileInputStream4 = fileInputStream;
                            fileInputStream3 = fileInputStream;
                            log(new StringBuffer().append("WARNING: IOException while adding entry ").append(str).append(" to jarfile from ").append(file.getPath()).append(" ").append(e.getClass().getName()).append("-").append(e.getMessage()).toString(), 1);
                            if (fileInputStream == null) {
                                return;
                            }
                            fileInputStream.close();
                        } catch (Throwable th2) {
                            th = th2;
                            fileInputStream3 = fileInputStream2;
                            if (fileInputStream3 != null) {
                                try {
                                    fileInputStream3.close();
                                } catch (IOException e3) {
                                }
                            }
                            throw th;
                        }
                    }
                } catch (IOException e4) {
                    e = e4;
                    fileInputStream = null;
                }
                if (fileInputStream2 == null) {
                    return;
                }
                fileInputStream2.close();
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (IOException e5) {
        }
    }

    protected void addSupportClasses(Hashtable hashtable) {
        Project project = this.task.getProject();
        for (FileSet fileSet : this.config.supportFileSets) {
            File dir = fileSet.getDir(project);
            DirectoryScanner directoryScanner = fileSet.getDirectoryScanner(project);
            directoryScanner.scan();
            String[] includedFiles = directoryScanner.getIncludedFiles();
            for (int i = 0; i < includedFiles.length; i++) {
                hashtable.put(includedFiles[i], new File(dir, includedFiles[i]));
            }
        }
    }

    protected void addVendorFiles(Hashtable hashtable, String str) {
    }

    protected void checkAndAddDependants(Hashtable hashtable) throws BuildException {
        if (this.dependencyAnalyzer == null) {
            return;
        }
        this.dependencyAnalyzer.reset();
        for (String str : hashtable.keySet()) {
            if (str.endsWith(".class")) {
                this.dependencyAnalyzer.addRootClass(str.substring(0, str.length() - ".class".length()).replace(File.separatorChar, '/').replace('/', '.'));
            }
        }
        Enumeration classDependencies = this.dependencyAnalyzer.getClassDependencies();
        while (classDependencies.hasMoreElements()) {
            String str2 = (String) classDependencies.nextElement();
            String stringBuffer = new StringBuffer().append(str2.replace('.', File.separatorChar)).append(".class").toString();
            File file = new File(this.config.srcDir, stringBuffer);
            if (file.exists()) {
                hashtable.put(stringBuffer, file);
                log(new StringBuffer().append("dependent class: ").append(str2).append(" - ").append(file).toString(), 3);
            }
        }
    }

    protected void checkConfiguration(String str, SAXParser sAXParser) throws BuildException {
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.EJBDeploymentTool
    public void configure(EjbJar.Config config) {
        this.config = config;
        createAnalyzer();
        this.classpathLoader = null;
    }

    public Path createClasspath() {
        if (this.classpath == null) {
            this.classpath = new Path(this.task.getProject());
        }
        return this.classpath.createPath();
    }

    protected ClassLoader getClassLoaderForBuild() {
        ClassLoader classLoader;
        if (this.classpathLoader != null) {
            classLoader = this.classpathLoader;
        } else {
            Path combinedClasspath = getCombinedClasspath();
            if (combinedClasspath == null) {
                this.classpathLoader = getClass().getClassLoader();
            } else {
                this.classpathLoader = getTask().getProject().createClassLoader(combinedClasspath);
            }
            classLoader = this.classpathLoader;
        }
        return classLoader;
    }

    protected Path getCombinedClasspath() {
        Path path = this.classpath;
        Path path2 = path;
        if (this.config.classpath != null) {
            if (path == null) {
                path2 = this.config.classpath;
            } else {
                path.append(this.config.classpath);
                path2 = path;
            }
        }
        return path2;
    }

    protected EjbJar.Config getConfig() {
        return this.config;
    }

    protected DescriptorHandler getDescriptorHandler(File file) {
        DescriptorHandler descriptorHandler = new DescriptorHandler(getTask(), file);
        registerKnownDTDs(descriptorHandler);
        Iterator it = getConfig().dtdLocations.iterator();
        while (it.hasNext()) {
            EjbJar.DTDLocation dTDLocation = (EjbJar.DTDLocation) it.next();
            descriptorHandler.registerDTD(dTDLocation.getPublicId(), dTDLocation.getLocation());
        }
        return descriptorHandler;
    }

    protected File getDestDir() {
        return this.destDir;
    }

    protected String getJarBaseName(String str) {
        String str2;
        String str3 = "";
        if (this.config.namingScheme.getValue().equals(EjbJar.NamingScheme.BASEJARNAME)) {
            int lastIndexOf = str.replace('\\', '/').lastIndexOf(47);
            if (lastIndexOf != -1) {
                str3 = str.substring(0, lastIndexOf + 1);
            }
            str2 = new StringBuffer().append(str3).append(this.config.baseJarName).toString();
        } else if (this.config.namingScheme.getValue().equals(EjbJar.NamingScheme.DESCRIPTOR)) {
            int lastIndexOf2 = str.lastIndexOf(File.separator);
            int indexOf = lastIndexOf2 != -1 ? str.indexOf(this.config.baseNameTerminator, lastIndexOf2) : str.indexOf(this.config.baseNameTerminator);
            if (indexOf == -1) {
                throw new BuildException(new StringBuffer().append("Unable to determine jar name from descriptor \"").append(str).append("\"").toString());
            }
            str2 = str.substring(0, indexOf);
        } else if (this.config.namingScheme.getValue().equals(EjbJar.NamingScheme.DIRECTORY)) {
            String absolutePath = new File(this.config.descriptorDir, str).getAbsolutePath();
            int lastIndexOf3 = absolutePath.lastIndexOf(File.separator);
            if (lastIndexOf3 == -1) {
                throw new BuildException("Unable to determine directory name holding descriptor");
            }
            String substring = absolutePath.substring(0, lastIndexOf3);
            int lastIndexOf4 = substring.lastIndexOf(File.separator);
            str2 = substring;
            if (lastIndexOf4 != -1) {
                str2 = substring.substring(lastIndexOf4 + 1);
            }
        } else {
            str2 = str3;
            if (this.config.namingScheme.getValue().equals(EjbJar.NamingScheme.EJB_NAME)) {
                str2 = this.handler.getEjbName();
            }
        }
        return str2;
    }

    protected Location getLocation() {
        return getTask().getLocation();
    }

    protected File getManifestFile(String str) {
        File file = new File(getConfig().descriptorDir, new StringBuffer().append(str).append("manifest.mf").toString());
        if (!file.exists()) {
            file = this.config.manifest != null ? this.config.manifest : null;
        }
        return file;
    }

    protected String getPublicId() {
        return this.handler.getPublicId();
    }

    protected Task getTask() {
        return this.task;
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0068, code lost:
        if (r5.config.namingScheme.getValue().equals(org.apache.tools.ant.taskdefs.optional.ejb.EjbJar.NamingScheme.DIRECTORY) != false) goto L13;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public String getVendorDDPrefix(String str, String str2) {
        String substring;
        if (this.config.namingScheme.getValue().equals(EjbJar.NamingScheme.DESCRIPTOR)) {
            substring = new StringBuffer().append(str).append(this.config.baseNameTerminator).toString();
        } else {
            if (!this.config.namingScheme.getValue().equals(EjbJar.NamingScheme.BASEJARNAME) && !this.config.namingScheme.getValue().equals(EjbJar.NamingScheme.EJB_NAME)) {
                substring = null;
            }
            int lastIndexOf = str2.replace('\\', '/').lastIndexOf(47);
            substring = lastIndexOf == -1 ? "" : str2.substring(0, lastIndexOf + 1);
        }
        return substring;
    }

    File getVendorOutputJarFile(String str) {
        return new File(this.destDir, new StringBuffer().append(str).append(this.genericJarSuffix).toString());
    }

    protected void log(String str, int i) {
        getTask().log(str, i);
    }

    protected boolean needToRebuild(Hashtable hashtable, File file) {
        boolean z = true;
        if (file.exists()) {
            long lastModified = file.lastModified();
            Iterator it = hashtable.values().iterator();
            while (true) {
                if (!it.hasNext()) {
                    z = false;
                    break;
                }
                File file2 = (File) it.next();
                if (lastModified < file2.lastModified()) {
                    log(new StringBuffer().append("Build needed because ").append(file2.getPath()).append(" is out of date").toString(), 3);
                    z = true;
                    break;
                }
            }
        }
        return z;
    }

    protected Hashtable parseEjbFiles(String str, SAXParser sAXParser) throws IOException, SAXException {
        FileInputStream fileInputStream;
        Throwable th;
        FileInputStream fileInputStream2;
        try {
            fileInputStream2 = new FileInputStream(new File(this.config.descriptorDir, str));
        } catch (Throwable th2) {
            th = th2;
            fileInputStream = null;
        }
        try {
            sAXParser.parse(new InputSource(fileInputStream2), this.handler);
            Hashtable files = this.handler.getFiles();
            if (fileInputStream2 != null) {
                try {
                    fileInputStream2.close();
                } catch (IOException e) {
                }
            }
            return files;
        } catch (Throwable th3) {
            th = th3;
            fileInputStream = fileInputStream2;
            if (fileInputStream != null) {
                try {
                    fileInputStream.close();
                } catch (IOException e2) {
                }
            }
            throw th;
        }
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.EJBDeploymentTool
    public void processDescriptor(String str, SAXParser sAXParser) {
        checkConfiguration(str, sAXParser);
        try {
            this.handler = getDescriptorHandler(this.config.srcDir);
            Hashtable parseEjbFiles = parseEjbFiles(str, sAXParser);
            addSupportClasses(parseEjbFiles);
            String jarBaseName = getJarBaseName(str);
            String vendorDDPrefix = getVendorDDPrefix(jarBaseName, str);
            File manifestFile = getManifestFile(vendorDDPrefix);
            if (manifestFile != null) {
                parseEjbFiles.put(MANIFEST, manifestFile);
            }
            parseEjbFiles.put("META-INF/ejb-jar.xml", new File(this.config.descriptorDir, str));
            addVendorFiles(parseEjbFiles, vendorDDPrefix);
            checkAndAddDependants(parseEjbFiles);
            String str2 = jarBaseName;
            if (this.config.flatDestDir) {
                str2 = jarBaseName;
                if (jarBaseName.length() != 0) {
                    int lastIndexOf = jarBaseName.lastIndexOf(File.separator);
                    int i = lastIndexOf;
                    if (lastIndexOf == -1) {
                        i = 0;
                    }
                    str2 = jarBaseName.substring(i, jarBaseName.length());
                }
            }
            File vendorOutputJarFile = getVendorOutputJarFile(str2);
            if (!needToRebuild(parseEjbFiles, vendorOutputJarFile)) {
                log(new StringBuffer().append(vendorOutputJarFile.toString()).append(" is up to date.").toString(), 3);
                return;
            }
            log(new StringBuffer().append("building ").append(vendorOutputJarFile.getName()).append(" with ").append(String.valueOf(parseEjbFiles.size())).append(" files").toString(), 2);
            writeJar(str2, vendorOutputJarFile, parseEjbFiles, getPublicId());
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("IOException while parsing'").append(str).append("'.  This probably indicates that the descriptor").append(" doesn't exist. Details: ").append(e.getMessage()).toString(), e);
        } catch (SAXException e2) {
            throw new BuildException(new StringBuffer().append("SAXException while parsing '").append(str).append("'. This probably indicates badly-formed XML.").append("  Details: ").append(e2.getMessage()).toString(), e2);
        }
    }

    protected void registerKnownDTDs(DescriptorHandler descriptorHandler) {
    }

    public void setClasspath(Path path) {
        this.classpath = path;
    }

    public void setDestdir(File file) {
        this.destDir = file;
    }

    public void setGenericJarSuffix(String str) {
        this.genericJarSuffix = str;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.EJBDeploymentTool
    public void setTask(Task task) {
        this.task = task;
    }

    protected boolean usingBaseJarName() {
        return this.config.baseJarName != null;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.EJBDeploymentTool
    public void validateConfigured() throws BuildException {
        if (this.destDir == null || !this.destDir.isDirectory()) {
            throw new BuildException("A valid destination directory must be specified using the \"destdir\" attribute.", getLocation());
        }
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[]}, finally: {[IF] complete} */
    protected void writeJar(String str, File file, Hashtable hashtable, String str2) throws BuildException {
        IOException e;
        JarOutputStream jarOutputStream;
        InputStream inputStream;
        JarOutputStream jarOutputStream2;
        JarOutputStream jarOutputStream3 = null;
        try {
            try {
                if (this.addedfiles == null) {
                    this.addedfiles = new HashSet();
                } else {
                    this.addedfiles.clear();
                }
                if (file.exists()) {
                    file.delete();
                }
                file.getParentFile().mkdirs();
                file.createNewFile();
                InputStream inputStream2 = null;
                try {
                    try {
                        File file2 = (File) hashtable.get(MANIFEST);
                        if (file2 == null || !file2.exists()) {
                            InputStream resourceAsStream = getClass().getResourceAsStream("/org/apache/tools/ant/defaultManifest.mf");
                            inputStream = resourceAsStream;
                            if (resourceAsStream == null) {
                                throw new BuildException(new StringBuffer().append("Could not find default manifest: ").append("/org/apache/tools/ant/defaultManifest.mf").toString());
                            }
                        } else {
                            inputStream = new FileInputStream(file2);
                        }
                        InputStream inputStream3 = inputStream;
                        InputStream inputStream4 = inputStream;
                        Manifest manifest = new Manifest(inputStream);
                        if (inputStream != null) {
                            inputStream.close();
                        }
                        jarOutputStream2 = new JarOutputStream(new FileOutputStream(file), manifest);
                    } catch (IOException e2) {
                        throw new BuildException("Unable to read manifest", e2, getLocation());
                    }
                } catch (Throwable th) {
                    if (0 != 0) {
                        inputStream2.close();
                    }
                    throw th;
                }
            } catch (IOException e3) {
                e = e3;
                jarOutputStream = null;
            }
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            jarOutputStream2.setMethod(8);
            for (String str3 : hashtable.keySet()) {
                if (!str3.equals(MANIFEST)) {
                    File file3 = (File) hashtable.get(str3);
                    log(new StringBuffer().append("adding file '").append(str3).append("'").toString(), 3);
                    addFileToJar(jarOutputStream2, file3, str3);
                    String[] list = file3.getParentFile().list(new InnerClassFilenameFilter(file3.getName()));
                    if (list != null) {
                        int length = list.length;
                        for (int i = 0; i < length; i++) {
                            int lastIndexOf = str3.lastIndexOf(file3.getName()) - 1;
                            str3 = lastIndexOf < 0 ? list[i] : new StringBuffer().append(str3.substring(0, lastIndexOf)).append(File.separatorChar).append(list[i]).toString();
                            file3 = new File(this.config.srcDir, str3);
                            log(new StringBuffer().append("adding innerclass file '").append(str3).append("'").toString(), 3);
                            addFileToJar(jarOutputStream2, file3, str3);
                        }
                    }
                }
            }
            if (jarOutputStream2 == null) {
                return;
            }
            try {
                jarOutputStream2.close();
            } catch (IOException e4) {
            }
        } catch (IOException e5) {
            e = e5;
            jarOutputStream = jarOutputStream2;
            JarOutputStream jarOutputStream4 = jarOutputStream;
            JarOutputStream jarOutputStream5 = jarOutputStream;
            JarOutputStream jarOutputStream6 = jarOutputStream;
            JarOutputStream jarOutputStream7 = jarOutputStream;
            JarOutputStream jarOutputStream8 = jarOutputStream;
            throw new BuildException(new StringBuffer().append("IOException while processing ejb-jar file '").append(file.toString()).append("'. Details: ").append(e.getMessage()).toString(), e);
        } catch (Throwable th3) {
            th = th3;
            jarOutputStream3 = jarOutputStream2;
            if (jarOutputStream3 != null) {
                try {
                    jarOutputStream3.close();
                } catch (IOException e6) {
                }
            }
            throw th;
        }
    }
}
