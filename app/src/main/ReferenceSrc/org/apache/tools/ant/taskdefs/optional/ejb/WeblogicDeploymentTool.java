package org.apache.tools.ant.taskdefs.optional.ejb;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Vector;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.jar.JarOutputStream;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Java;
import org.apache.tools.ant.taskdefs.optional.ejb.EjbJar;
import org.apache.tools.ant.types.Environment;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.FileUtils;
import org.xml.sax.InputSource;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/WeblogicDeploymentTool.class */
public class WeblogicDeploymentTool extends GenericDeploymentTool {
    protected static final String COMPILER_EJB11 = "weblogic.ejbc";
    protected static final String COMPILER_EJB20 = "weblogic.ejbc20";
    protected static final String DEFAULT_COMPILER = "default";
    protected static final String DEFAULT_WL51_DTD_LOCATION = "/weblogic/ejb/deployment/xml/weblogic-ejb-jar.dtd";
    protected static final String DEFAULT_WL51_EJB11_DTD_LOCATION = "/weblogic/ejb/deployment/xml/ejb-jar.dtd";
    protected static final String DEFAULT_WL60_51_DTD_LOCATION = "/weblogic/ejb20/dd/xml/weblogic510-ejb-jar.dtd";
    protected static final String DEFAULT_WL60_DTD_LOCATION = "/weblogic/ejb20/dd/xml/weblogic600-ejb-jar.dtd";
    protected static final String DEFAULT_WL60_EJB11_DTD_LOCATION = "/weblogic/ejb20/dd/xml/ejb11-jar.dtd";
    protected static final String DEFAULT_WL60_EJB20_DTD_LOCATION = "/weblogic/ejb20/dd/xml/ejb20-jar.dtd";
    protected static final String DEFAULT_WL70_DTD_LOCATION = "/weblogic/ejb20/dd/xml/weblogic700-ejb-jar.dtd";
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    public static final String PUBLICID_EJB11 = "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN";
    public static final String PUBLICID_EJB20 = "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 2.0//EN";
    public static final String PUBLICID_WEBLOGIC_EJB510 = "-//BEA Systems, Inc.//DTD WebLogic 5.1.0 EJB//EN";
    public static final String PUBLICID_WEBLOGIC_EJB600 = "-//BEA Systems, Inc.//DTD WebLogic 6.0.0 EJB//EN";
    public static final String PUBLICID_WEBLOGIC_EJB700 = "-//BEA Systems, Inc.//DTD WebLogic 7.0.0 EJB//EN";
    protected static final String WL_CMP_DD = "weblogic-cmp-rdbms-jar.xml";
    protected static final String WL_DD = "weblogic-ejb-jar.xml";
    private String ejb11DTD;
    private File outputDir;
    private String weblogicDTD;
    private String jarSuffix = ".jar";
    private boolean keepgenerated = false;
    private String ejbcClass = null;
    private String additionalArgs = "";
    private String additionalJvmArgs = "";
    private boolean keepGeneric = false;
    private String compiler = null;
    private boolean alwaysRebuild = true;
    private boolean noEJBC = false;
    private boolean newCMP = false;
    private Path wlClasspath = null;
    private Vector sysprops = new Vector();
    private Integer jvmDebugLevel = null;

    private void buildWeblogicJar(File file, File file2, String str) {
        String str2;
        Java java;
        if (this.noEJBC) {
            try {
                FILE_UTILS.copyFile(file, file2);
                if (this.keepgenerated) {
                    return;
                }
                file.delete();
                return;
            } catch (IOException e) {
                throw new BuildException("Unable to write EJB jar", e);
            }
        }
        String str3 = this.ejbcClass;
        try {
            java = new Java(getTask());
            str2 = str3;
        } catch (Exception e2) {
            e = e2;
            str2 = str3;
        }
        try {
            java.setTaskName("ejbc");
            java.createJvmarg().setLine(this.additionalJvmArgs);
            if (!this.sysprops.isEmpty()) {
                Enumeration elements = this.sysprops.elements();
                while (elements.hasMoreElements()) {
                    java.addSysproperty((Environment.Variable) elements.nextElement());
                }
            }
            if (getJvmDebugLevel() != null) {
                java.createJvmarg().setLine(new StringBuffer().append(" -Dweblogic.StdoutSeverityLevel=").append(this.jvmDebugLevel).toString());
            }
            String str4 = str3;
            if (str3 == null) {
                if ("-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN".equals(str)) {
                    str4 = COMPILER_EJB11;
                } else if ("-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 2.0//EN".equals(str)) {
                    str4 = COMPILER_EJB20;
                } else {
                    log(new StringBuffer().append("Unrecognized publicId ").append(str).append(" - using EJB 1.1 compiler").toString(), 1);
                    str4 = COMPILER_EJB11;
                }
            }
            java.setClassname(str4);
            String str5 = str4;
            java.createArg().setLine(this.additionalArgs);
            String str6 = str4;
            if (this.keepgenerated) {
                String str7 = str4;
                java.createArg().setValue("-keepgenerated");
            }
            String str8 = str4;
            if (this.compiler == null) {
                String str9 = str4;
                String property = getTask().getProject().getProperty("build.compiler");
                if (property != null && property.equals("jikes")) {
                    String str10 = str4;
                    java.createArg().setValue("-compiler");
                    String str11 = str4;
                    java.createArg().setValue("jikes");
                }
            } else if (!this.compiler.equals("default")) {
                String str12 = str4;
                java.createArg().setValue("-compiler");
                String str13 = str4;
                java.createArg().setLine(this.compiler);
            }
            String str14 = str4;
            Path combinedClasspath = getCombinedClasspath();
            String str15 = str4;
            if (this.wlClasspath != null && combinedClasspath != null && combinedClasspath.toString().trim().length() > 0) {
                String str16 = str4;
                java.createArg().setValue("-classpath");
                String str17 = str4;
                java.createArg().setPath(combinedClasspath);
            }
            String str18 = str4;
            java.createArg().setValue(file.getPath());
            String str19 = str4;
            if (this.outputDir == null) {
                String str20 = str4;
                java.createArg().setValue(file2.getPath());
            } else {
                java.createArg().setValue(this.outputDir.getPath());
            }
            String str21 = str4;
            Path path = this.wlClasspath;
            Path path2 = path;
            if (path == null) {
                path2 = getCombinedClasspath();
            }
            String str22 = str4;
            java.setFork(true);
            if (path2 != null) {
                java.setClasspath(path2);
            }
            String str23 = str4;
            String str24 = str4;
            String str25 = str4;
            log(new StringBuffer().append("Calling ").append(str4).append(" for ").append(file.toString()).toString(), 3);
            String str26 = str4;
            if (java.executeJava() == 0) {
                return;
            }
            String str27 = str4;
            String str28 = str4;
            str2 = str4;
            throw new BuildException("Ejbc reported an error");
        } catch (Exception e3) {
            e = e3;
            throw new BuildException(new StringBuffer().append("Exception while calling ").append(str2).append(". Details: ").append(e.toString()).toString(), e);
        }
    }

    public void addSysproperty(Environment.Variable variable) {
        this.sysprops.add(variable);
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected void addVendorFiles(Hashtable hashtable, String str) {
        File file = new File(getConfig().descriptorDir, new StringBuffer().append(str).append(WL_DD).toString());
        if (!file.exists()) {
            log(new StringBuffer().append("Unable to locate weblogic deployment descriptor. It was expected to be in ").append(file.getPath()).toString(), 1);
            return;
        }
        hashtable.put("META-INF/weblogic-ejb-jar.xml", file);
        if (!this.newCMP) {
            log("The old method for locating CMP files has been DEPRECATED.", 3);
            log("Please adjust your weblogic descriptor and set newCMP=\"true\" to use the new CMP descriptor inclusion mechanism. ", 3);
            File file2 = new File(getConfig().descriptorDir, new StringBuffer().append(str).append(WL_CMP_DD).toString());
            if (!file2.exists()) {
                return;
            }
            hashtable.put("META-INF/weblogic-cmp-rdbms-jar.xml", file2);
            return;
        }
        try {
            File file3 = (File) hashtable.get("META-INF/ejb-jar.xml");
            SAXParserFactory newInstance = SAXParserFactory.newInstance();
            newInstance.setValidating(true);
            SAXParser newSAXParser = newInstance.newSAXParser();
            DescriptorHandler weblogicDescriptorHandler = getWeblogicDescriptorHandler(file3.getParentFile());
            newSAXParser.parse(new InputSource(new FileInputStream(file)), weblogicDescriptorHandler);
            Hashtable files = weblogicDescriptorHandler.getFiles();
            Enumeration keys = files.keys();
            while (keys.hasMoreElements()) {
                String str2 = (String) keys.nextElement();
                hashtable.put(str2, files.get(str2));
            }
        } catch (Exception e) {
            throw new BuildException(new StringBuffer().append("Exception while adding Vendor specific files: ").append(e.toString()).toString(), e);
        }
    }

    public Path createWLClasspath() {
        if (this.wlClasspath == null) {
            this.wlClasspath = new Path(getTask().getProject());
        }
        return this.wlClasspath.createPath();
    }

    protected ClassLoader getClassLoaderFromJar(File file) throws IOException {
        Path path = new Path(getTask().getProject());
        path.setLocation(file);
        Path combinedClasspath = getCombinedClasspath();
        if (combinedClasspath != null) {
            path.append(combinedClasspath);
        }
        return getTask().getProject().createClassLoader(path);
    }

    public String getEjbcClass() {
        return this.ejbcClass;
    }

    public Integer getJvmDebugLevel() {
        return this.jvmDebugLevel;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    File getVendorOutputJarFile(String str) {
        return new File(getDestDir(), new StringBuffer().append(str).append(this.jarSuffix).toString());
    }

    protected DescriptorHandler getWeblogicDescriptorHandler(File file) {
        DescriptorHandler descriptorHandler = new DescriptorHandler(this, getTask(), file, file) { // from class: org.apache.tools.ant.taskdefs.optional.ejb.WeblogicDeploymentTool.1
            private final WeblogicDeploymentTool this$0;
            private final File val$srcDir;

            {
                this.this$0 = this;
                this.val$srcDir = file;
            }

            @Override // org.apache.tools.ant.taskdefs.optional.ejb.DescriptorHandler
            protected void processElement() {
                if (this.currentElement.equals("type-storage")) {
                    String str = this.currentText;
                    this.ejbFiles.put(str, new File(this.val$srcDir, str.substring("META-INF/".length(), str.length())));
                }
            }
        };
        descriptorHandler.registerDTD(PUBLICID_WEBLOGIC_EJB510, DEFAULT_WL51_DTD_LOCATION);
        descriptorHandler.registerDTD(PUBLICID_WEBLOGIC_EJB510, DEFAULT_WL60_51_DTD_LOCATION);
        descriptorHandler.registerDTD(PUBLICID_WEBLOGIC_EJB600, DEFAULT_WL60_DTD_LOCATION);
        descriptorHandler.registerDTD(PUBLICID_WEBLOGIC_EJB700, DEFAULT_WL70_DTD_LOCATION);
        descriptorHandler.registerDTD(PUBLICID_WEBLOGIC_EJB510, this.weblogicDTD);
        descriptorHandler.registerDTD(PUBLICID_WEBLOGIC_EJB600, this.weblogicDTD);
        Iterator it = getConfig().dtdLocations.iterator();
        while (it.hasNext()) {
            EjbJar.DTDLocation dTDLocation = (EjbJar.DTDLocation) it.next();
            descriptorHandler.registerDTD(dTDLocation.getPublicId(), dTDLocation.getLocation());
        }
        return descriptorHandler;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:258:0x089a -> B:296:0x0302). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:263:0x08b5 -> B:282:0x0840). Please submit an issue!!! */
    protected boolean isRebuildRequired(File file, File file2) {
        JarFile jarFile;
        ClassLoader classLoader;
        File file3;
        JarFile jarFile2;
        ClassLoader classLoader2;
        JarOutputStream jarOutputStream;
        File file4;
        JarFile jarFile3;
        Throwable th;
        JarFile jarFile4;
        boolean z;
        JarFile jarFile5;
        AntClassLoader antClassLoader;
        JarOutputStream jarOutputStream2;
        File file5;
        InputStream inputStream;
        JarFile jarFile6 = null;
        JarOutputStream jarOutputStream3 = null;
        AntClassLoader antClassLoader2 = null;
        JarOutputStream jarOutputStream4 = null;
        File file6 = null;
        try {
            try {
                log(new StringBuffer().append("Checking if weblogic Jar needs to be rebuilt for jar ").append(file2.getName()).toString(), 3);
                if (!file.exists() || !file.isFile() || !file2.exists() || !file2.isFile()) {
                    z = true;
                    jarFile5 = null;
                    antClassLoader = null;
                    jarOutputStream2 = null;
                    file5 = null;
                } else {
                    jarFile = new JarFile(file);
                    try {
                        jarFile3 = new JarFile(file2);
                        classLoader2 = null;
                        try {
                            Hashtable hashtable = new Hashtable();
                            Hashtable hashtable2 = new Hashtable();
                            Hashtable hashtable3 = new Hashtable();
                            Enumeration<JarEntry> entries = jarFile.entries();
                            while (entries.hasMoreElements()) {
                                JarEntry nextElement = entries.nextElement();
                                hashtable.put(nextElement.getName().replace('\\', '/'), nextElement);
                            }
                            Enumeration<JarEntry> entries2 = jarFile3.entries();
                            while (entries2.hasMoreElements()) {
                                JarEntry nextElement2 = entries2.nextElement();
                                hashtable2.put(nextElement2.getName(), nextElement2);
                            }
                            antClassLoader = getClassLoaderFromJar(file);
                            Enumeration keys = hashtable.keys();
                            while (true) {
                                z = false;
                                if (!keys.hasMoreElements()) {
                                    break;
                                }
                                String str = (String) keys.nextElement();
                                if (!hashtable2.containsKey(str)) {
                                    log(new StringBuffer().append("File ").append(str).append(" not present in weblogic jar").toString(), 3);
                                    z = true;
                                    break;
                                }
                                JarEntry jarEntry = (JarEntry) hashtable.get(str);
                                JarEntry jarEntry2 = (JarEntry) hashtable2.get(str);
                                if (jarEntry.getCrc() != jarEntry2.getCrc() || jarEntry.getSize() != jarEntry2.getSize()) {
                                    if (jarEntry.getName().endsWith(".class")) {
                                        String replace = jarEntry.getName().replace(File.separatorChar, '.').replace('/', '.');
                                        Class<?> loadClass = antClassLoader.loadClass(replace.substring(0, replace.lastIndexOf(".class")));
                                        if (loadClass.isInterface()) {
                                            log(new StringBuffer().append("Interface ").append(loadClass.getName()).append(" has changed").toString(), 3);
                                            z = true;
                                            break;
                                        }
                                        hashtable3.put(str, jarEntry);
                                    } else if (!jarEntry.getName().equals("META-INF/MANIFEST.MF")) {
                                        log(new StringBuffer().append("Non class file ").append(jarEntry.getName()).append(" has changed").toString(), 3);
                                        z = true;
                                        break;
                                    }
                                }
                            }
                            if (!z) {
                                log("No rebuild needed - updating jar", 3);
                                File file7 = new File(new StringBuffer().append(file2.getAbsolutePath()).append(".temp").toString());
                                try {
                                    if (file7.exists()) {
                                        file7.delete();
                                    }
                                    JarOutputStream jarOutputStream5 = new JarOutputStream(new FileOutputStream(file7));
                                    try {
                                        jarOutputStream5.setLevel(0);
                                        Enumeration elements = hashtable2.elements();
                                        while (elements.hasMoreElements()) {
                                            byte[] bArr = new byte[1024];
                                            JarEntry jarEntry3 = (JarEntry) elements.nextElement();
                                            if (jarEntry3.getCompressedSize() == -1 || jarEntry3.getCompressedSize() == jarEntry3.getSize()) {
                                                jarOutputStream5.setLevel(0);
                                            } else {
                                                jarOutputStream5.setLevel(9);
                                            }
                                            if (hashtable3.containsKey(jarEntry3.getName())) {
                                                log(new StringBuffer().append("Updating Bean class from generic Jar ").append(jarEntry3.getName()).toString(), 3);
                                                jarEntry3 = (JarEntry) hashtable3.get(jarEntry3.getName());
                                                inputStream = jarFile.getInputStream(jarEntry3);
                                            } else {
                                                inputStream = jarFile3.getInputStream(jarEntry3);
                                            }
                                            jarOutputStream5.putNextEntry(new JarEntry(jarEntry3.getName()));
                                            while (true) {
                                                int read = inputStream.read(bArr);
                                                if (read != -1) {
                                                    jarOutputStream5.write(bArr, 0, read);
                                                }
                                            }
                                            inputStream.close();
                                        }
                                        file5 = file7;
                                        jarOutputStream2 = jarOutputStream5;
                                    } catch (IOException e) {
                                        classLoader2 = antClassLoader;
                                        e = e;
                                        jarOutputStream = jarOutputStream5;
                                        file4 = file7;
                                        JarFile jarFile7 = jarFile;
                                        JarFile jarFile8 = jarFile;
                                        JarFile jarFile9 = jarFile;
                                        JarFile jarFile10 = jarFile;
                                        JarFile jarFile11 = jarFile;
                                        throw new BuildException(new StringBuffer().append("IOException while processing ejb-jar file . Details: ").append(e.getMessage()).toString(), e);
                                    } catch (ClassNotFoundException e2) {
                                        file3 = file7;
                                        e = e2;
                                        classLoader = antClassLoader;
                                        jarOutputStream3 = jarOutputStream5;
                                        jarFile2 = jarFile3;
                                        JarFile jarFile12 = jarFile;
                                        JarFile jarFile13 = jarFile;
                                        JarFile jarFile14 = jarFile;
                                        JarFile jarFile15 = jarFile;
                                        JarFile jarFile16 = jarFile;
                                        throw new BuildException(new StringBuffer().append("ClassNotFoundException while processing ejb-jar file. Details: ").append(e.getMessage()).toString(), e);
                                    } catch (Throwable th2) {
                                        jarOutputStream4 = jarOutputStream5;
                                        antClassLoader2 = antClassLoader;
                                        file6 = file7;
                                        jarFile4 = jarFile3;
                                        th = th2;
                                        if (jarFile != null) {
                                            try {
                                                jarFile.close();
                                            } catch (IOException e3) {
                                            }
                                        }
                                        if (jarFile4 != null) {
                                            try {
                                                jarFile4.close();
                                            } catch (IOException e4) {
                                            }
                                        }
                                        if (jarOutputStream4 != null) {
                                            try {
                                                jarOutputStream4.close();
                                            } catch (IOException e5) {
                                            }
                                            try {
                                                FILE_UTILS.rename(file6, file2);
                                            } catch (IOException e6) {
                                                log(e6.getMessage(), 1);
                                            }
                                        }
                                        if (antClassLoader2 != null && (antClassLoader2 instanceof AntClassLoader)) {
                                            antClassLoader2.cleanup();
                                        }
                                        throw th;
                                    }
                                } catch (IOException e7) {
                                    classLoader2 = antClassLoader;
                                    e = e7;
                                    jarOutputStream = null;
                                    file4 = file7;
                                } catch (ClassNotFoundException e8) {
                                    file3 = file7;
                                    e = e8;
                                    classLoader = antClassLoader;
                                    jarFile2 = jarFile3;
                                } catch (Throwable th3) {
                                    antClassLoader2 = antClassLoader;
                                    jarOutputStream4 = null;
                                    file6 = file7;
                                    jarFile4 = jarFile3;
                                    th = th3;
                                }
                            } else {
                                log("Weblogic Jar rebuild needed due to changed interface or XML", 3);
                                jarOutputStream2 = null;
                                file5 = null;
                            }
                            jarFile5 = jarFile;
                            jarFile6 = jarFile3;
                        } catch (IOException e9) {
                            e = e9;
                            file4 = null;
                            jarOutputStream = null;
                        } catch (ClassNotFoundException e10) {
                            jarFile2 = jarFile3;
                            file3 = null;
                            classLoader = null;
                            e = e10;
                        } catch (Throwable th4) {
                            jarFile4 = jarFile3;
                            antClassLoader2 = null;
                            jarOutputStream4 = null;
                            file6 = null;
                            th = th4;
                        }
                    } catch (IOException e11) {
                        e = e11;
                        classLoader2 = null;
                        jarOutputStream = null;
                        file4 = null;
                        jarFile3 = null;
                    } catch (ClassNotFoundException e12) {
                        e = e12;
                        classLoader = null;
                        file3 = null;
                        jarFile2 = null;
                    } catch (Throwable th5) {
                        th = th5;
                        antClassLoader2 = null;
                        jarOutputStream4 = null;
                        file6 = null;
                        jarFile4 = null;
                    }
                }
                if (jarFile5 != null) {
                    try {
                        jarFile5.close();
                    } catch (IOException e13) {
                    }
                }
                if (jarFile6 != null) {
                    try {
                        jarFile6.close();
                    } catch (IOException e14) {
                    }
                }
                boolean z2 = z;
                if (jarOutputStream2 != null) {
                    try {
                        jarOutputStream2.close();
                    } catch (IOException e15) {
                    }
                    try {
                        FILE_UTILS.rename(file5, file2);
                        z2 = z;
                    } catch (IOException e16) {
                        log(e16.getMessage(), 1);
                        z2 = true;
                    }
                }
                if (antClassLoader != null && (antClassLoader instanceof AntClassLoader)) {
                    antClassLoader.cleanup();
                }
                return z2;
            } catch (Throwable th6) {
                th = th6;
                jarFile4 = null;
                jarFile = null;
            }
        } catch (IOException e17) {
            e = e17;
            jarFile = null;
            classLoader2 = null;
            jarOutputStream = null;
            file4 = null;
            jarFile3 = null;
        } catch (ClassNotFoundException e18) {
            e = e18;
            jarFile = null;
            classLoader = null;
            file3 = null;
            jarFile2 = null;
        }
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected void registerKnownDTDs(DescriptorHandler descriptorHandler) {
        descriptorHandler.registerDTD("-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN", DEFAULT_WL51_EJB11_DTD_LOCATION);
        descriptorHandler.registerDTD("-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN", DEFAULT_WL60_EJB11_DTD_LOCATION);
        descriptorHandler.registerDTD("-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN", this.ejb11DTD);
        descriptorHandler.registerDTD("-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 2.0//EN", DEFAULT_WL60_EJB20_DTD_LOCATION);
    }

    public void setArgs(String str) {
        this.additionalArgs = str;
    }

    public void setCompiler(String str) {
        this.compiler = str;
    }

    public void setEJBdtd(String str) {
        this.ejb11DTD = str;
    }

    public void setEjbcClass(String str) {
        this.ejbcClass = str;
    }

    public void setJvmDebugLevel(Integer num) {
        this.jvmDebugLevel = num;
    }

    public void setJvmargs(String str) {
        this.additionalJvmArgs = str;
    }

    public void setKeepgenerated(String str) {
        this.keepgenerated = Boolean.valueOf(str).booleanValue();
    }

    public void setKeepgeneric(boolean z) {
        this.keepGeneric = z;
    }

    public void setNewCMP(boolean z) {
        this.newCMP = z;
    }

    public void setNoEJBC(boolean z) {
        this.noEJBC = z;
    }

    public void setOldCMP(boolean z) {
        this.newCMP = !z;
    }

    public void setOutputDir(File file) {
        this.outputDir = file;
    }

    public void setRebuild(boolean z) {
        this.alwaysRebuild = z;
    }

    public void setSuffix(String str) {
        this.jarSuffix = str;
    }

    public void setWLClasspath(Path path) {
        this.wlClasspath = path;
    }

    public void setWLdtd(String str) {
        this.weblogicDTD = str;
    }

    public void setWeblogicdtd(String str) {
        setEJBdtd(str);
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool, org.apache.tools.ant.taskdefs.optional.ejb.EJBDeploymentTool
    public void validateConfigured() throws BuildException {
        super.validateConfigured();
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected void writeJar(String str, File file, Hashtable hashtable, String str2) throws BuildException {
        File vendorOutputJarFile = super.getVendorOutputJarFile(str);
        super.writeJar(str, vendorOutputJarFile, hashtable, str2);
        if (this.alwaysRebuild || isRebuildRequired(vendorOutputJarFile, file)) {
            buildWeblogicJar(vendorOutputJarFile, file, str2);
        }
        if (!this.keepGeneric) {
            log(new StringBuffer().append("deleting generic jar ").append(vendorOutputJarFile.toString()).toString(), 3);
            vendorOutputJarFile.delete();
        }
    }
}
