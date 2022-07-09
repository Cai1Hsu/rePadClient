package org.apache.tools.ant.taskdefs.optional.ejb;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.jar.JarOutputStream;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Java;
import org.apache.tools.ant.taskdefs.optional.ejb.EjbJar;
import org.apache.tools.ant.types.Environment;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool.class */
public class WebsphereDeploymentTool extends GenericDeploymentTool {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    public static final String PUBLICID_EJB11 = "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN";
    public static final String PUBLICID_EJB20 = "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 2.0//EN";
    protected static final String SCHEMA_DIR = "Schema/";
    protected static final String WAS_BND = "ibm-ejb-jar-bnd.xmi";
    protected static final String WAS_CMP_MAP = "Map.mapxmi";
    protected static final String WAS_CMP_SCHEMA = "Schema.dbxmi";
    protected static final String WAS_EXT = "ibm-ejb-jar-ext.xmi";
    private boolean codegen;
    private String dbName;
    private String dbSchema;
    private String dbVendor;
    private String ejb11DTD;
    private boolean noinform;
    private boolean novalidate;
    private boolean nowarn;
    private String rmicOptions;
    private boolean trace;
    private boolean use35MappingRules;
    private File websphereHome;
    private String jarSuffix = ".jar";
    private boolean keepGeneric = false;
    private boolean alwaysRebuild = true;
    private boolean ejbdeploy = true;
    private boolean newCMP = false;
    private Path wasClasspath = null;
    private boolean quiet = true;
    private String tempdir = "_ejbdeploy_temp";

    private void buildWebsphereJar(File file, File file2) {
        try {
            if (!this.ejbdeploy) {
                return;
            }
            Java java = new Java(getTask());
            java.createJvmarg().setValue("-Xms64m");
            java.createJvmarg().setValue("-Xmx128m");
            Environment.Variable variable = new Environment.Variable();
            variable.setKey("websphere.lib.dir");
            variable.setValue(new File(this.websphereHome, "lib").getAbsolutePath());
            java.addSysproperty(variable);
            java.setDir(this.websphereHome);
            java.setTaskName("ejbdeploy");
            java.setClassname("com.ibm.etools.ejbdeploy.EJBDeploy");
            java.createArg().setValue(file.getPath());
            java.createArg().setValue(this.tempdir);
            java.createArg().setValue(file2.getPath());
            java.createArg().setLine(getOptions());
            if (getCombinedClasspath() != null && getCombinedClasspath().toString().length() > 0) {
                java.createArg().setValue("-cp");
                java.createArg().setValue(getCombinedClasspath().toString());
            }
            Path path = this.wasClasspath;
            Path path2 = path;
            if (path == null) {
                path2 = getCombinedClasspath();
            }
            java.setFork(true);
            if (path2 != null) {
                java.setClasspath(path2);
            }
            log(new StringBuffer().append("Calling websphere.ejbdeploy for ").append(file.toString()).toString(), 3);
            java.execute();
        } catch (Exception e) {
            throw new BuildException(new StringBuffer().append("Exception while calling ejbdeploy. Details: ").append(e.toString()).toString(), e);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected void addVendorFiles(Hashtable hashtable, String str) {
        if (usingBaseJarName()) {
            str = "";
        }
        String stringBuffer = this.dbVendor == null ? "" : new StringBuffer().append(this.dbVendor).append("-").toString();
        File file = new File(getConfig().descriptorDir, new StringBuffer().append(str).append(WAS_EXT).toString());
        if (file.exists()) {
            hashtable.put("META-INF/ibm-ejb-jar-ext.xmi", file);
        } else {
            log(new StringBuffer().append("Unable to locate websphere extensions. It was expected to be in ").append(file.getPath()).toString(), 3);
        }
        File file2 = new File(getConfig().descriptorDir, new StringBuffer().append(str).append(WAS_BND).toString());
        if (file2.exists()) {
            hashtable.put("META-INF/ibm-ejb-jar-bnd.xmi", file2);
        } else {
            log(new StringBuffer().append("Unable to locate websphere bindings. It was expected to be in ").append(file2.getPath()).toString(), 3);
        }
        if (!this.newCMP) {
            log("The old method for locating CMP files has been DEPRECATED.", 3);
            log("Please adjust your websphere descriptor and set newCMP=\"true\" to use the new CMP descriptor inclusion mechanism. ", 3);
            return;
        }
        try {
            File file3 = new File(getConfig().descriptorDir, new StringBuffer().append(str).append(stringBuffer).append(WAS_CMP_MAP).toString());
            if (file3.exists()) {
                hashtable.put("META-INF/Map.mapxmi", file3);
            } else {
                log(new StringBuffer().append("Unable to locate the websphere Map: ").append(file3.getPath()).toString(), 3);
            }
            File file4 = new File(getConfig().descriptorDir, new StringBuffer().append(str).append(stringBuffer).append(WAS_CMP_SCHEMA).toString());
            if (file4.exists()) {
                hashtable.put("META-INF/Schema/Schema.dbxmi", file4);
            } else {
                log(new StringBuffer().append("Unable to locate the websphere Schema: ").append(file4.getPath()).toString(), 3);
            }
        } catch (Exception e) {
            throw new BuildException(new StringBuffer().append("Exception while adding Vendor specific files: ").append(e.toString()).toString(), e);
        }
    }

    public Path createWASClasspath() {
        if (this.wasClasspath == null) {
            this.wasClasspath = new Path(getTask().getProject());
        }
        return this.wasClasspath.createPath();
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

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected DescriptorHandler getDescriptorHandler(File file) {
        DescriptorHandler descriptorHandler = new DescriptorHandler(getTask(), file);
        descriptorHandler.registerDTD("-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN", this.ejb11DTD);
        Iterator it = getConfig().dtdLocations.iterator();
        while (it.hasNext()) {
            EjbJar.DTDLocation dTDLocation = (EjbJar.DTDLocation) it.next();
            descriptorHandler.registerDTD(dTDLocation.getPublicId(), dTDLocation.getLocation());
        }
        return descriptorHandler;
    }

    protected String getOptions() {
        StringBuffer stringBuffer = new StringBuffer();
        if (this.dbVendor != null) {
            stringBuffer.append(" -dbvendor ").append(this.dbVendor);
        }
        if (this.dbName != null) {
            stringBuffer.append(" -dbname \"").append(this.dbName).append("\"");
        }
        if (this.dbSchema != null) {
            stringBuffer.append(" -dbschema \"").append(this.dbSchema).append("\"");
        }
        if (this.codegen) {
            stringBuffer.append(" -codegen");
        }
        if (this.quiet) {
            stringBuffer.append(" -quiet");
        }
        if (this.novalidate) {
            stringBuffer.append(" -novalidate");
        }
        if (this.nowarn) {
            stringBuffer.append(" -nowarn");
        }
        if (this.noinform) {
            stringBuffer.append(" -noinform");
        }
        if (this.trace) {
            stringBuffer.append(" -trace");
        }
        if (this.use35MappingRules) {
            stringBuffer.append(" -35");
        }
        if (this.rmicOptions != null) {
            stringBuffer.append(" -rmic \"").append(this.rmicOptions).append("\"");
        }
        return stringBuffer.toString();
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    File getVendorOutputJarFile(String str) {
        return new File(getDestDir(), new StringBuffer().append(str).append(this.jarSuffix).toString());
    }

    protected DescriptorHandler getWebsphereDescriptorHandler(File file) {
        DescriptorHandler descriptorHandler = new DescriptorHandler(this, getTask(), file) { // from class: org.apache.tools.ant.taskdefs.optional.ejb.WebsphereDeploymentTool.1
            private final WebsphereDeploymentTool this$0;

            {
                this.this$0 = this;
            }

            @Override // org.apache.tools.ant.taskdefs.optional.ejb.DescriptorHandler
            protected void processElement() {
            }
        };
        Iterator it = getConfig().dtdLocations.iterator();
        while (it.hasNext()) {
            EjbJar.DTDLocation dTDLocation = (EjbJar.DTDLocation) it.next();
            descriptorHandler.registerDTD(dTDLocation.getPublicId(), dTDLocation.getLocation());
        }
        return descriptorHandler;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:258:0x0896 -> B:282:0x0302). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:263:0x08b1 -> B:284:0x083c). Please submit an issue!!! */
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
                log(new StringBuffer().append("Checking if websphere Jar needs to be rebuilt for jar ").append(file2.getName()).toString(), 3);
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
                                    log(new StringBuffer().append("File ").append(str).append(" not present in websphere jar").toString(), 3);
                                    z = true;
                                    break;
                                }
                                JarEntry jarEntry = (JarEntry) hashtable.get(str);
                                JarEntry jarEntry2 = (JarEntry) hashtable2.get(str);
                                if (jarEntry.getCrc() != jarEntry2.getCrc() || jarEntry.getSize() != jarEntry2.getSize()) {
                                    if (jarEntry.getName().endsWith(".class")) {
                                        String replace = jarEntry.getName().replace(File.separatorChar, '.');
                                        Class<?> loadClass = antClassLoader.loadClass(replace.substring(0, replace.lastIndexOf(".class")));
                                        if (loadClass.isInterface()) {
                                            log(new StringBuffer().append("Interface ").append(loadClass.getName()).append(" has changed").toString(), 3);
                                            z = true;
                                            break;
                                        }
                                        hashtable3.put(str, jarEntry);
                                    } else {
                                        z = false;
                                        if (!jarEntry.getName().equals("META-INF/MANIFEST.MF")) {
                                            log(new StringBuffer().append("Non class file ").append(jarEntry.getName()).append(" has changed").toString(), 3);
                                            z = true;
                                        }
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
                                        jarOutputStream3 = jarOutputStream5;
                                        e = e2;
                                        classLoader = antClassLoader;
                                        file3 = file7;
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
                                    e = e8;
                                    classLoader = antClassLoader;
                                    file3 = file7;
                                    jarFile2 = jarFile3;
                                } catch (Throwable th3) {
                                    antClassLoader2 = antClassLoader;
                                    jarOutputStream4 = null;
                                    file6 = file7;
                                    jarFile4 = jarFile3;
                                    th = th3;
                                }
                            } else {
                                log("websphere Jar rebuild needed due to changed interface or XML", 3);
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

    public void setCodegen(boolean z) {
        this.codegen = z;
    }

    public void setDbname(String str) {
        this.dbName = str;
    }

    public void setDbschema(String str) {
        this.dbSchema = str;
    }

    public void setDbvendor(String str) {
        this.dbVendor = str;
    }

    public void setEJBdtd(String str) {
        this.ejb11DTD = str;
    }

    public void setEjbdeploy(boolean z) {
        this.ejbdeploy = z;
    }

    public void setKeepgeneric(boolean z) {
        this.keepGeneric = z;
    }

    public void setNewCMP(boolean z) {
        this.newCMP = z;
    }

    public void setNoinform(boolean z) {
        this.noinform = z;
    }

    public void setNovalidate(boolean z) {
        this.novalidate = z;
    }

    public void setNowarn(boolean z) {
        this.nowarn = z;
    }

    public void setOldCMP(boolean z) {
        this.newCMP = !z;
    }

    public void setQuiet(boolean z) {
        this.quiet = z;
    }

    public void setRebuild(boolean z) {
        this.alwaysRebuild = z;
    }

    public void setRmicoptions(String str) {
        this.rmicOptions = str;
    }

    public void setSuffix(String str) {
        this.jarSuffix = str;
    }

    public void setTempdir(String str) {
        this.tempdir = str;
    }

    public void setTrace(boolean z) {
        this.trace = z;
    }

    public void setUse35(boolean z) {
        this.use35MappingRules = z;
    }

    public void setWASClasspath(Path path) {
        this.wasClasspath = path;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool, org.apache.tools.ant.taskdefs.optional.ejb.EJBDeploymentTool
    public void validateConfigured() throws BuildException {
        super.validateConfigured();
        if (this.ejbdeploy) {
            String property = getTask().getProject().getProperty("websphere.home");
            if (property == null) {
                throw new BuildException("The 'websphere.home' property must be set when 'ejbdeploy=true'");
            }
            this.websphereHome = getTask().getProject().resolveFile(property);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected void writeJar(String str, File file, Hashtable hashtable, String str2) throws BuildException {
        if (!this.ejbdeploy) {
            super.writeJar(str, file, hashtable, str2);
            return;
        }
        File vendorOutputJarFile = super.getVendorOutputJarFile(str);
        super.writeJar(str, vendorOutputJarFile, hashtable, str2);
        if (this.alwaysRebuild || isRebuildRequired(vendorOutputJarFile, file)) {
            buildWebsphereJar(vendorOutputJarFile, file);
        }
        if (this.keepGeneric) {
            return;
        }
        log(new StringBuffer().append("deleting generic jar ").append(vendorOutputJarFile.toString()).toString(), 3);
        vendorOutputJarFile.delete();
    }
}
