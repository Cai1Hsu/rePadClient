package org.apache.tools.ant;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.CodeSource;
import java.security.ProtectionDomain;
import java.security.cert.Certificate;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.StringTokenizer;
import java.util.Vector;
import java.util.jar.Attributes;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.jar.Manifest;
import org.apache.tools.ant.launch.Locator;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.CollectionUtils;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.JavaEnvUtils;
import org.apache.tools.ant.util.LoaderUtils;
import org.apache.tools.ant.util.ReflectUtil;
import org.apache.tools.ant.util.VectorSet;

/* loaded from: classes.jar:org/apache/tools/ant/AntClassLoader.class */
public class AntClassLoader extends ClassLoader implements SubBuildListener {
    private static final int BUFFER_SIZE = 8192;
    private static final Class[] CONSTRUCTOR_ARGS;
    private static final int NUMBER_OF_STRINGS = 256;
    static Class class$java$lang$ClassLoader;
    static Class class$org$apache$tools$ant$AntClassLoader;
    static Class class$org$apache$tools$ant$Project;
    static Class class$org$apache$tools$ant$types$Path;
    private static Class subClassToLoad;
    private boolean ignoreBase;
    private boolean isContextLoaderSaved;
    private Hashtable jarFiles;
    private Vector loaderPackages;
    private ClassLoader parent;
    private boolean parentFirst;
    private Vector pathComponents;
    private Project project;
    private ClassLoader savedContextLoader;
    private Vector systemPackages;
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static Map pathMap = Collections.synchronizedMap(new HashMap());

    /* loaded from: classes.jar:org/apache/tools/ant/AntClassLoader$ResourceEnumeration.class */
    private class ResourceEnumeration implements Enumeration {
        private URL nextResource;
        private int pathElementsIndex = 0;
        private String resourceName;
        private final AntClassLoader this$0;

        ResourceEnumeration(AntClassLoader antClassLoader, String str) {
            this.this$0 = antClassLoader;
            this.resourceName = str;
            findNextResource();
        }

        private void findNextResource() {
            URL url = null;
            while (this.pathElementsIndex < this.this$0.pathComponents.size() && url == null) {
                try {
                    URL url2 = url;
                    url = this.this$0.getResourceURL((File) this.this$0.pathComponents.elementAt(this.pathElementsIndex), this.resourceName);
                    this.pathElementsIndex++;
                } catch (BuildException e) {
                    url = url;
                }
            }
            this.nextResource = url;
        }

        @Override // java.util.Enumeration
        public boolean hasMoreElements() {
            return this.nextResource != null;
        }

        @Override // java.util.Enumeration
        public Object nextElement() {
            URL url = this.nextResource;
            if (url == null) {
                throw new NoSuchElementException();
            }
            findNextResource();
            return url;
        }
    }

    static {
        Class cls;
        Class cls2;
        Class cls3;
        subClassToLoad = null;
        if (class$java$lang$ClassLoader == null) {
            cls = class$("java.lang.ClassLoader");
            class$java$lang$ClassLoader = cls;
        } else {
            cls = class$java$lang$ClassLoader;
        }
        if (class$org$apache$tools$ant$Project == null) {
            cls2 = class$("org.apache.tools.ant.Project");
            class$org$apache$tools$ant$Project = cls2;
        } else {
            cls2 = class$org$apache$tools$ant$Project;
        }
        if (class$org$apache$tools$ant$types$Path == null) {
            cls3 = class$("org.apache.tools.ant.types.Path");
            class$org$apache$tools$ant$types$Path = cls3;
        } else {
            cls3 = class$org$apache$tools$ant$types$Path;
        }
        CONSTRUCTOR_ARGS = new Class[]{cls, cls2, cls3, Boolean.TYPE};
        if (JavaEnvUtils.isAtLeastJavaVersion(JavaEnvUtils.JAVA_1_5)) {
            try {
                subClassToLoad = Class.forName("org.apache.tools.ant.loader.AntClassLoader5");
            } catch (ClassNotFoundException e) {
            }
        }
    }

    public AntClassLoader() {
        this.pathComponents = new VectorSet();
        this.parentFirst = true;
        this.systemPackages = new Vector();
        this.loaderPackages = new Vector();
        this.ignoreBase = false;
        this.parent = null;
        this.jarFiles = new Hashtable();
        this.savedContextLoader = null;
        this.isContextLoaderSaved = false;
        setParent(null);
    }

    public AntClassLoader(ClassLoader classLoader, Project project, Path path) {
        this.pathComponents = new VectorSet();
        this.parentFirst = true;
        this.systemPackages = new Vector();
        this.loaderPackages = new Vector();
        this.ignoreBase = false;
        this.parent = null;
        this.jarFiles = new Hashtable();
        this.savedContextLoader = null;
        this.isContextLoaderSaved = false;
        setParent(classLoader);
        setClassPath(path);
        setProject(project);
    }

    public AntClassLoader(ClassLoader classLoader, Project project, Path path, boolean z) {
        this(project, path);
        if (classLoader != null) {
            setParent(classLoader);
        }
        setParentFirst(z);
        addJavaLibraries();
    }

    public AntClassLoader(ClassLoader classLoader, boolean z) {
        this.pathComponents = new VectorSet();
        this.parentFirst = true;
        this.systemPackages = new Vector();
        this.loaderPackages = new Vector();
        this.ignoreBase = false;
        this.parent = null;
        this.jarFiles = new Hashtable();
        this.savedContextLoader = null;
        this.isContextLoaderSaved = false;
        setParent(classLoader);
        this.project = null;
        this.parentFirst = z;
    }

    public AntClassLoader(Project project, Path path) {
        this.pathComponents = new VectorSet();
        this.parentFirst = true;
        this.systemPackages = new Vector();
        this.loaderPackages = new Vector();
        this.ignoreBase = false;
        this.parent = null;
        this.jarFiles = new Hashtable();
        this.savedContextLoader = null;
        this.isContextLoaderSaved = false;
        setParent(null);
        setProject(project);
        setClassPath(path);
    }

    public AntClassLoader(Project project, Path path, boolean z) {
        this(null, project, path, z);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private Class findBaseClass(String str) throws ClassNotFoundException {
        return this.parent == null ? findSystemClass(str) : this.parent.loadClass(str);
    }

    private Class findClassInComponents(String str) throws ClassNotFoundException {
        InputStream resourceStream;
        InputStream inputStream = null;
        InputStream inputStream2 = null;
        String classFilename = getClassFilename(str);
        try {
            Enumeration elements = this.pathComponents.elements();
            while (true) {
                InputStream inputStream3 = inputStream2;
                if (!elements.hasMoreElements()) {
                    InputStream inputStream4 = inputStream2;
                    InputStream inputStream5 = inputStream2;
                    throw new ClassNotFoundException(str);
                }
                InputStream inputStream6 = inputStream2;
                File file = (File) elements.nextElement();
                InputStream inputStream7 = inputStream2;
                inputStream = inputStream2;
                try {
                    resourceStream = getResourceStream(file, classFilename);
                    inputStream2 = resourceStream;
                } catch (IOException e) {
                    InputStream inputStream8 = inputStream2;
                    InputStream inputStream9 = inputStream2;
                    log(new StringBuffer().append("Exception reading component ").append(file).append(" (reason: ").append(e.getMessage()).append(")").toString(), 3);
                } catch (SecurityException e2) {
                    throw e2;
                }
                if (resourceStream != null) {
                    log(new StringBuffer().append("Loaded from ").append(file).append(" ").append(classFilename).toString(), 4);
                    inputStream7 = resourceStream;
                    inputStream = resourceStream;
                    inputStream2 = resourceStream;
                    Class classFromStream = getClassFromStream(resourceStream, str, file);
                    FileUtils.close(resourceStream);
                    return classFromStream;
                }
                continue;
            }
        } catch (Throwable th) {
            FileUtils.close(inputStream);
            throw th;
        }
    }

    private Certificate[] getCertificates(File file, String str) throws IOException {
        Certificate[] certificateArr;
        if (file.isDirectory()) {
            certificateArr = null;
        } else {
            JarFile jarFile = (JarFile) this.jarFiles.get(file);
            certificateArr = null;
            if (jarFile != null) {
                JarEntry jarEntry = jarFile.getJarEntry(str);
                certificateArr = null;
                if (jarEntry != null) {
                    certificateArr = jarEntry.getCertificates();
                }
            }
        }
        return certificateArr;
    }

    private String getClassFilename(String str) {
        return new StringBuffer().append(str.replace('.', '/')).append(".class").toString();
    }

    private Class getClassFromStream(InputStream inputStream, String str, File file) throws IOException, SecurityException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] bArr = new byte[8192];
        while (true) {
            int read = inputStream.read(bArr, 0, 8192);
            if (read != -1) {
                byteArrayOutputStream.write(bArr, 0, read);
            } else {
                return defineClassFromData(file, byteArrayOutputStream.toByteArray(), str);
            }
        }
    }

    private Manifest getJarManifest(File file) throws IOException {
        Manifest manifest;
        if (file.isDirectory()) {
            manifest = null;
        } else {
            JarFile jarFile = (JarFile) this.jarFiles.get(file);
            manifest = null;
            if (jarFile != null) {
                manifest = jarFile.getManifest();
            }
        }
        return manifest;
    }

    private InputStream getResourceStream(File file, String str) {
        FileInputStream fileInputStream;
        JarFile jarFile;
        try {
            jarFile = (JarFile) this.jarFiles.get(file);
        } catch (Exception e) {
            log(new StringBuffer().append("Ignoring Exception ").append(e.getClass().getName()).append(": ").append(e.getMessage()).append(" reading resource ").append(str).append(" from ").append(file).toString(), 3);
        }
        if (jarFile != null || !file.isDirectory()) {
            JarFile jarFile2 = jarFile;
            if (jarFile == null) {
                if (file.exists()) {
                    this.jarFiles.put(file, new JarFile(file));
                    jarFile2 = (JarFile) this.jarFiles.get(file);
                } else {
                    fileInputStream = null;
                }
            }
            JarEntry jarEntry = jarFile2.getJarEntry(str);
            if (jarEntry != null) {
                fileInputStream = jarFile2.getInputStream(jarEntry);
            }
            fileInputStream = null;
        } else {
            File file2 = new File(file, str);
            if (file2.exists()) {
                fileInputStream = new FileInputStream(file2);
            }
            fileInputStream = null;
        }
        return fileInputStream;
    }

    private ClassLoader getRootLoader() {
        ClassLoader classLoader;
        ClassLoader classLoader2 = getClass().getClassLoader();
        while (true) {
            classLoader = classLoader2;
            if (classLoader == null || classLoader.getParent() == null) {
                break;
            }
            classLoader2 = classLoader.getParent();
        }
        return classLoader;
    }

    public static void initializeClass(Class cls) {
        Constructor<?>[] declaredConstructors = cls.getDeclaredConstructors();
        if (declaredConstructors == null || declaredConstructors.length <= 0 || declaredConstructors[0] == null) {
            return;
        }
        try {
            declaredConstructors[0].newInstance(new String[256]);
        } catch (Exception e) {
        }
    }

    private boolean isParentFirst(String str) {
        boolean z;
        boolean z2;
        boolean z3 = this.parentFirst;
        Enumeration elements = this.systemPackages.elements();
        while (true) {
            z = z3;
            if (elements.hasMoreElements()) {
                if (str.startsWith((String) elements.nextElement())) {
                    z = true;
                    break;
                }
            } else {
                break;
            }
        }
        Enumeration elements2 = this.loaderPackages.elements();
        while (true) {
            z2 = z;
            if (elements2.hasMoreElements()) {
                if (str.startsWith((String) elements2.nextElement())) {
                    z2 = false;
                    break;
                }
            } else {
                break;
            }
        }
        return z2;
    }

    private InputStream loadBaseResource(String str) {
        return this.parent == null ? super.getResourceAsStream(str) : this.parent.getResourceAsStream(str);
    }

    private InputStream loadResource(String str) {
        InputStream inputStream = null;
        Enumeration elements = this.pathComponents.elements();
        while (elements.hasMoreElements() && inputStream == null) {
            inputStream = getResourceStream((File) elements.nextElement(), str);
        }
        return inputStream;
    }

    public static AntClassLoader newAntClassLoader(ClassLoader classLoader, Project project, Path path, boolean z) {
        return subClassToLoad != null ? (AntClassLoader) ReflectUtil.newInstance(subClassToLoad, CONSTRUCTOR_ARGS, new Object[]{classLoader, project, path, Boolean.valueOf(z)}) : new AntClassLoader(classLoader, project, path, z);
    }

    public void addJavaLibraries() {
        Enumeration elements = JavaEnvUtils.getJrePackages().elements();
        while (elements.hasMoreElements()) {
            addSystemPackageRoot((String) elements.nextElement());
        }
    }

    public void addLoaderPackageRoot(String str) {
        this.loaderPackages.addElement(new StringBuffer().append(str).append(str.endsWith(".") ? "" : ".").toString());
    }

    public void addPathComponent(File file) {
        if (this.pathComponents.contains(file)) {
            return;
        }
        this.pathComponents.addElement(file);
    }

    public void addPathElement(String str) throws BuildException {
        try {
            addPathFile(this.project != null ? this.project.resolveFile(str) : new File(str));
        } catch (IOException e) {
            throw new BuildException(e);
        }
    }

    protected void addPathFile(File file) throws IOException {
        JarFile jarFile;
        Throwable th;
        if (!this.pathComponents.contains(file)) {
            this.pathComponents.addElement(file);
        }
        if (file.isDirectory()) {
            return;
        }
        String stringBuffer = new StringBuffer().append(file.getAbsolutePath()).append(file.lastModified()).append("-").append(file.length()).toString();
        String str = (String) pathMap.get(stringBuffer);
        String str2 = str;
        if (str == null) {
            try {
                jarFile = new JarFile(file);
            } catch (Throwable th2) {
                th = th2;
                jarFile = null;
            }
            try {
                Manifest manifest = jarFile.getManifest();
                if (manifest == null) {
                    if (jarFile == null) {
                        return;
                    }
                    jarFile.close();
                    return;
                }
                String value = manifest.getMainAttributes().getValue(Attributes.Name.CLASS_PATH);
                if (jarFile != null) {
                    jarFile.close();
                }
                str2 = value;
                if (value == null) {
                    str2 = "";
                }
                pathMap.put(stringBuffer, str2);
            } catch (Throwable th3) {
                th = th3;
                if (jarFile != null) {
                    jarFile.close();
                }
                throw th;
            }
        }
        if ("".equals(str2)) {
            return;
        }
        URL fileURL = FILE_UTILS.getFileURL(file);
        StringTokenizer stringTokenizer = new StringTokenizer(str2);
        while (stringTokenizer.hasMoreTokens()) {
            String nextToken = stringTokenizer.nextToken();
            URL url = new URL(fileURL, nextToken);
            if (!url.getProtocol().equals("file")) {
                log(new StringBuffer().append("Skipping jar library ").append(nextToken).append(" since only relative URLs are supported by this").append(" loader").toString(), 3);
            } else {
                File file2 = new File(Locator.decodeUri(url.getFile()));
                if (file2.exists() && !isInPath(file2)) {
                    addPathFile(file2);
                }
            }
        }
    }

    public void addSystemPackageRoot(String str) {
        this.systemPackages.addElement(new StringBuffer().append(str).append(str.endsWith(".") ? "" : ".").toString());
    }

    @Override // org.apache.tools.ant.BuildListener
    public void buildFinished(BuildEvent buildEvent) {
        cleanup();
    }

    @Override // org.apache.tools.ant.BuildListener
    public void buildStarted(BuildEvent buildEvent) {
    }

    public void cleanup() {
        synchronized (this) {
            Enumeration elements = this.jarFiles.elements();
            while (elements.hasMoreElements()) {
                try {
                    ((JarFile) elements.nextElement()).close();
                } catch (IOException e) {
                }
            }
            this.jarFiles = new Hashtable();
            if (this.project != null) {
                this.project.removeBuildListener(this);
            }
            this.project = null;
        }
    }

    protected Class defineClassFromData(File file, byte[] bArr, String str) throws IOException {
        Class cls;
        definePackage(file, str);
        if (class$org$apache$tools$ant$Project == null) {
            cls = class$("org.apache.tools.ant.Project");
            class$org$apache$tools$ant$Project = cls;
        } else {
            cls = class$org$apache$tools$ant$Project;
        }
        ProtectionDomain protectionDomain = cls.getProtectionDomain();
        return defineClass(str, bArr, 0, bArr.length, new ProtectionDomain(new CodeSource(FILE_UTILS.getFileURL(file), getCertificates(file, getClassFilename(str))), protectionDomain.getPermissions(), this, protectionDomain.getPrincipals()));
    }

    protected void definePackage(File file, String str) throws IOException {
        int lastIndexOf = str.lastIndexOf(46);
        if (lastIndexOf == -1) {
            return;
        }
        String substring = str.substring(0, lastIndexOf);
        if (getPackage(substring) != null) {
            return;
        }
        Manifest jarManifest = getJarManifest(file);
        if (jarManifest == null) {
            definePackage(substring, null, null, null, null, null, null, null);
        } else {
            definePackage(file, substring, jarManifest);
        }
    }

    protected void definePackage(File file, String str, Manifest manifest) {
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        String str6 = null;
        String str7 = null;
        String str8 = null;
        Attributes attributes = manifest.getAttributes(new StringBuffer().append(str.replace('.', '/')).append("/").toString());
        if (attributes != null) {
            str2 = attributes.getValue(Attributes.Name.SPECIFICATION_TITLE);
            str3 = attributes.getValue(Attributes.Name.SPECIFICATION_VENDOR);
            str4 = attributes.getValue(Attributes.Name.SPECIFICATION_VERSION);
            str5 = attributes.getValue(Attributes.Name.IMPLEMENTATION_TITLE);
            str6 = attributes.getValue(Attributes.Name.IMPLEMENTATION_VENDOR);
            str7 = attributes.getValue(Attributes.Name.IMPLEMENTATION_VERSION);
            str8 = attributes.getValue(Attributes.Name.SEALED);
        }
        Attributes mainAttributes = manifest.getMainAttributes();
        String str9 = str2;
        String str10 = str4;
        String str11 = str3;
        String str12 = str5;
        String str13 = str7;
        String str14 = str6;
        String str15 = str8;
        if (mainAttributes != null) {
            String str16 = str2;
            if (str2 == null) {
                str16 = mainAttributes.getValue(Attributes.Name.SPECIFICATION_TITLE);
            }
            String str17 = str3;
            if (str3 == null) {
                str17 = mainAttributes.getValue(Attributes.Name.SPECIFICATION_VENDOR);
            }
            String str18 = str4;
            if (str4 == null) {
                str18 = mainAttributes.getValue(Attributes.Name.SPECIFICATION_VERSION);
            }
            String str19 = str5;
            if (str5 == null) {
                str19 = mainAttributes.getValue(Attributes.Name.IMPLEMENTATION_TITLE);
            }
            String str20 = str6;
            if (str6 == null) {
                str20 = mainAttributes.getValue(Attributes.Name.IMPLEMENTATION_VENDOR);
            }
            String str21 = str7;
            if (str7 == null) {
                str21 = mainAttributes.getValue(Attributes.Name.IMPLEMENTATION_VERSION);
            }
            str9 = str16;
            str10 = str18;
            str11 = str17;
            str12 = str19;
            str13 = str21;
            str14 = str20;
            str15 = str8;
            if (str8 == null) {
                str15 = mainAttributes.getValue(Attributes.Name.SEALED);
                str14 = str20;
                str13 = str21;
                str12 = str19;
                str11 = str17;
                str10 = str18;
                str9 = str16;
            }
        }
        URL url = null;
        if (str15 != null) {
            url = null;
            if (str15.equalsIgnoreCase("true")) {
                try {
                    url = new URL(FileUtils.getFileUtils().toURI(file.getAbsolutePath()));
                } catch (MalformedURLException e) {
                    url = null;
                }
            }
        }
        definePackage(str, str9, str10, str11, str12, str13, str14, url);
    }

    @Override // java.lang.ClassLoader
    public Class findClass(String str) throws ClassNotFoundException {
        log(new StringBuffer().append("Finding class ").append(str).toString(), 4);
        return findClassInComponents(str);
    }

    @Override // java.lang.ClassLoader
    protected Enumeration findResources(String str) throws IOException {
        return findResources(str, true);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v14, types: [java.util.Enumeration] */
    /* JADX WARN: Type inference failed for: r0v17, types: [java.util.Enumeration] */
    /* JADX WARN: Type inference failed for: r0v9, types: [java.util.Enumeration] */
    protected Enumeration findResources(String str, boolean z) throws IOException {
        ResourceEnumeration append;
        ResourceEnumeration resourceEnumeration = new ResourceEnumeration(this, str);
        CollectionUtils.EmptyEnumeration emptyEnumeration = (this.parent == null || (z && this.parent == getParent())) ? new CollectionUtils.EmptyEnumeration() : this.parent.getResources(str);
        if (isParentFirst(str)) {
            append = CollectionUtils.append(emptyEnumeration, resourceEnumeration);
        } else if (this.ignoreBase) {
            append = resourceEnumeration;
            if (getRootLoader() != null) {
                append = CollectionUtils.append(resourceEnumeration, getRootLoader().getResources(str));
            }
        } else {
            append = CollectionUtils.append(resourceEnumeration, emptyEnumeration);
        }
        return append;
    }

    public Class forceLoadClass(String str) throws ClassNotFoundException {
        log(new StringBuffer().append("force loading ").append(str).toString(), 4);
        Class<?> findLoadedClass = findLoadedClass(str);
        Class<?> cls = findLoadedClass;
        if (findLoadedClass == null) {
            cls = findClass(str);
        }
        return cls;
    }

    public Class forceLoadSystemClass(String str) throws ClassNotFoundException {
        log(new StringBuffer().append("force system loading ").append(str).toString(), 4);
        Class<?> findLoadedClass = findLoadedClass(str);
        Class<?> cls = findLoadedClass;
        if (findLoadedClass == null) {
            cls = findBaseClass(str);
        }
        return cls;
    }

    public String getClasspath() {
        StringBuffer stringBuffer = new StringBuffer();
        boolean z = true;
        Enumeration elements = this.pathComponents.elements();
        while (elements.hasMoreElements()) {
            if (!z) {
                stringBuffer.append(System.getProperty("path.separator"));
            } else {
                z = false;
            }
            stringBuffer.append(((File) elements.nextElement()).getAbsolutePath());
        }
        return stringBuffer.toString();
    }

    public ClassLoader getConfiguredParent() {
        return this.parent;
    }

    public Enumeration getNamedResources(String str) throws IOException {
        return findResources(str, false);
    }

    @Override // java.lang.ClassLoader
    public URL getResource(String str) {
        URL url = null;
        if (isParentFirst(str)) {
            url = this.parent == null ? super.getResource(str) : this.parent.getResource(str);
        }
        if (url == null) {
            Enumeration elements = this.pathComponents.elements();
            URL url2 = url;
            while (true) {
                url = url2;
                if (!elements.hasMoreElements()) {
                    break;
                }
                url = url2;
                if (url2 != null) {
                    break;
                }
                URL resourceURL = getResourceURL((File) elements.nextElement(), str);
                url2 = resourceURL;
                if (resourceURL != null) {
                    log(new StringBuffer().append("Resource ").append(str).append(" loaded from ant loader").toString(), 4);
                    url2 = resourceURL;
                }
            }
        } else {
            log(new StringBuffer().append("Resource ").append(str).append(" loaded from parent loader").toString(), 4);
        }
        URL url3 = url;
        if (url == null) {
            url3 = url;
            if (!isParentFirst(str)) {
                URL resource = this.ignoreBase ? getRootLoader() == null ? null : getRootLoader().getResource(str) : this.parent == null ? super.getResource(str) : this.parent.getResource(str);
                url3 = resource;
                if (resource != null) {
                    log(new StringBuffer().append("Resource ").append(str).append(" loaded from parent loader").toString(), 4);
                    url3 = resource;
                }
            }
        }
        if (url3 == null) {
            log(new StringBuffer().append("Couldn't load Resource ").append(str).toString(), 4);
        }
        return url3;
    }

    @Override // java.lang.ClassLoader
    public InputStream getResourceAsStream(String str) {
        InputStream inputStream = null;
        if (isParentFirst(str)) {
            inputStream = loadBaseResource(str);
        }
        if (inputStream != null) {
            log(new StringBuffer().append("ResourceStream for ").append(str).append(" loaded from parent loader").toString(), 4);
        } else {
            InputStream loadResource = loadResource(str);
            inputStream = loadResource;
            if (loadResource != null) {
                log(new StringBuffer().append("ResourceStream for ").append(str).append(" loaded from ant loader").toString(), 4);
                inputStream = loadResource;
            }
        }
        InputStream inputStream2 = inputStream;
        if (inputStream == null) {
            inputStream2 = inputStream;
            if (!isParentFirst(str)) {
                InputStream resourceAsStream = this.ignoreBase ? getRootLoader() == null ? null : getRootLoader().getResourceAsStream(str) : loadBaseResource(str);
                inputStream2 = resourceAsStream;
                if (resourceAsStream != null) {
                    log(new StringBuffer().append("ResourceStream for ").append(str).append(" loaded from parent loader").toString(), 4);
                    inputStream2 = resourceAsStream;
                }
            }
        }
        if (inputStream2 == null) {
            log(new StringBuffer().append("Couldn't load ResourceStream for ").append(str).toString(), 4);
        }
        return inputStream2;
    }

    protected URL getResourceURL(File file, String str) {
        URL url;
        try {
            JarFile jarFile = (JarFile) this.jarFiles.get(file);
            if (jarFile != null || !file.isDirectory()) {
                JarFile jarFile2 = jarFile;
                if (jarFile == null) {
                    url = null;
                    if (file.exists()) {
                        this.jarFiles.put(file, new JarFile(file));
                        jarFile2 = (JarFile) this.jarFiles.get(file);
                    }
                }
                JarEntry jarEntry = jarFile2.getJarEntry(str);
                url = null;
                if (jarEntry != null) {
                    try {
                        url = new URL(new StringBuffer().append("jar:").append(FILE_UTILS.getFileURL(file)).append("!/").append(jarEntry).toString());
                    } catch (MalformedURLException e) {
                        url = null;
                    }
                }
            } else {
                File file2 = new File(file, str);
                url = null;
                if (file2.exists()) {
                    try {
                        url = FILE_UTILS.getFileURL(file2);
                    } catch (MalformedURLException e2) {
                        url = null;
                    }
                }
            }
        } catch (Exception e3) {
            String stringBuffer = new StringBuffer().append("Unable to obtain resource from ").append(file).append(": ").toString();
            log(new StringBuffer().append(stringBuffer).append(e3).toString(), 1);
            System.err.println(stringBuffer);
            e3.printStackTrace();
            url = null;
        }
        return url;
    }

    protected boolean isInPath(File file) {
        return this.pathComponents.contains(file);
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0054 A[Catch: all -> 0x0092, TRY_ENTER, TryCatch #1 {, blocks: (B:4:0x0002, B:11:0x0012, B:13:0x001e, B:17:0x0054, B:20:0x005d, B:26:0x0097, B:29:0x00c7, B:32:0x00cf, B:34:0x00d1), top: B:38:0x0002, inners: #0, #2 }] */
    @Override // java.lang.ClassLoader
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    protected Class loadClass(String str, boolean z) throws ClassNotFoundException {
        Class<?> cls;
        synchronized (this) {
            Class<?> findLoadedClass = findLoadedClass(str);
            if (findLoadedClass == null) {
                if (isParentFirst(str)) {
                    try {
                        Class<?> findBaseClass = findBaseClass(str);
                        log(new StringBuffer().append("Class ").append(str).append(" loaded from parent loader ").append("(parentFirst)").toString(), 4);
                        cls = findBaseClass;
                    } catch (ClassNotFoundException e) {
                        Class<?> findClass = findClass(str);
                        log(new StringBuffer().append("Class ").append(str).append(" loaded from ant loader ").append("(parentFirst)").toString(), 4);
                        cls = findClass;
                    }
                    if (z) {
                        resolveClass(cls);
                    }
                } else {
                    try {
                        Class<?> findClass2 = findClass(str);
                        log(new StringBuffer().append("Class ").append(str).append(" loaded from ant loader").toString(), 4);
                        cls = findClass2;
                    } catch (ClassNotFoundException e2) {
                        if (this.ignoreBase) {
                            throw e2;
                        }
                        Class<?> findBaseClass2 = findBaseClass(str);
                        log(new StringBuffer().append("Class ").append(str).append(" loaded from parent loader").toString(), 4);
                        cls = findBaseClass2;
                    }
                    if (z) {
                    }
                }
            }
            cls = findLoadedClass;
        }
        return cls;
    }

    protected void log(String str, int i) {
        if (this.project != null) {
            this.project.log(str, i);
        }
    }

    @Override // org.apache.tools.ant.BuildListener
    public void messageLogged(BuildEvent buildEvent) {
    }

    public void resetThreadContextLoader() {
        if (!LoaderUtils.isContextLoaderAvailable() || !this.isContextLoaderSaved) {
            return;
        }
        LoaderUtils.setContextClassLoader(this.savedContextLoader);
        this.savedContextLoader = null;
        this.isContextLoaderSaved = false;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:10:0x002c -> B:8:0x0025). Please submit an issue!!! */
    public void setClassPath(Path path) {
        this.pathComponents.removeAllElements();
        if (path != null) {
            for (String str : path.concatSystemClasspath(Definer.OnError.POLICY_IGNORE).list()) {
                try {
                    addPathElement(str);
                } catch (BuildException e) {
                }
            }
        }
    }

    public void setIsolated(boolean z) {
        synchronized (this) {
            this.ignoreBase = z;
        }
    }

    public void setParent(ClassLoader classLoader) {
        Class cls;
        ClassLoader classLoader2 = classLoader;
        if (classLoader == null) {
            if (class$org$apache$tools$ant$AntClassLoader == null) {
                cls = class$("org.apache.tools.ant.AntClassLoader");
                class$org$apache$tools$ant$AntClassLoader = cls;
            } else {
                cls = class$org$apache$tools$ant$AntClassLoader;
            }
            classLoader2 = cls.getClassLoader();
        }
        this.parent = classLoader2;
    }

    public void setParentFirst(boolean z) {
        this.parentFirst = z;
    }

    public void setProject(Project project) {
        this.project = project;
        if (project != null) {
            project.addBuildListener(this);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v15, types: [java.lang.ClassLoader] */
    public void setThreadContextLoader() {
        if (this.isContextLoaderSaved) {
            throw new BuildException("Context loader has not been reset");
        }
        if (!LoaderUtils.isContextLoaderAvailable()) {
            return;
        }
        this.savedContextLoader = LoaderUtils.getContextClassLoader();
        AntClassLoader antClassLoader = this;
        if (this.project != null) {
            antClassLoader = this;
            if ("only".equals(this.project.getProperty(MagicNames.BUILD_SYSCLASSPATH))) {
                antClassLoader = getClass().getClassLoader();
            }
        }
        LoaderUtils.setContextClassLoader(antClassLoader);
        this.isContextLoaderSaved = true;
    }

    @Override // org.apache.tools.ant.SubBuildListener
    public void subBuildFinished(BuildEvent buildEvent) {
        if (buildEvent.getProject() == this.project) {
            cleanup();
        }
    }

    @Override // org.apache.tools.ant.SubBuildListener
    public void subBuildStarted(BuildEvent buildEvent) {
    }

    @Override // org.apache.tools.ant.BuildListener
    public void targetFinished(BuildEvent buildEvent) {
    }

    @Override // org.apache.tools.ant.BuildListener
    public void targetStarted(BuildEvent buildEvent) {
    }

    @Override // org.apache.tools.ant.BuildListener
    public void taskFinished(BuildEvent buildEvent) {
    }

    @Override // org.apache.tools.ant.BuildListener
    public void taskStarted(BuildEvent buildEvent) {
    }

    public String toString() {
        return new StringBuffer().append("AntClassLoader[").append(getClasspath()).append("]").toString();
    }
}
