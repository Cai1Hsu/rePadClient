package org.apache.tools.ant.taskdefs.optional.ejb;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Hashtable;
import javax.xml.parsers.SAXParser;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Java;
import org.apache.tools.ant.taskdefs.optional.ejb.EjbJar;
import org.apache.tools.ant.taskdefs.optional.sos.SOSCmd;
import org.apache.tools.ant.types.Path;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/JonasDeploymentTool.class */
public class JonasDeploymentTool extends GenericDeploymentTool {
    protected static final String DAVID_ORB = "DAVID";
    protected static final String EJB_JAR_1_1_DTD = "ejb-jar_1_1.dtd";
    protected static final String EJB_JAR_1_1_PUBLIC_ID = "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN";
    protected static final String EJB_JAR_2_0_DTD = "ejb-jar_2_0.dtd";
    protected static final String EJB_JAR_2_0_PUBLIC_ID = "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 2.0//EN";
    protected static final String GENIC_CLASS = "org.objectweb.jonas_ejb.genic.GenIC";
    protected static final String JEREMIE_ORB = "JEREMIE";
    protected static final String JONAS_DD = "jonas-ejb-jar.xml";
    protected static final String JONAS_EJB_JAR_2_4_DTD = "jonas-ejb-jar_2_4.dtd";
    protected static final String JONAS_EJB_JAR_2_4_PUBLIC_ID = "-//ObjectWeb//DTD JOnAS 2.4//EN";
    protected static final String JONAS_EJB_JAR_2_5_DTD = "jonas-ejb-jar_2_5.dtd";
    protected static final String JONAS_EJB_JAR_2_5_PUBLIC_ID = "-//ObjectWeb//DTD JOnAS 2.5//EN";
    protected static final String OLD_GENIC_CLASS_1 = "org.objectweb.jonas_ejb.tools.GenWholeIC";
    protected static final String OLD_GENIC_CLASS_2 = "org.objectweb.jonas_ejb.tools.GenIC";
    protected static final String RMI_ORB = "RMI";
    private String additionalargs;
    private String descriptorName;
    private String javac;
    private String javacopts;
    private String jonasDescriptorName;
    private File jonasroot;
    private String orb;
    private File outputdir;
    private String rmicopts;
    private boolean keepgenerated = false;
    private boolean nocompil = false;
    private boolean novalidation = false;
    private boolean secpropag = false;
    private boolean verbose = false;
    private boolean keepgeneric = false;
    private String suffix = ".jar";
    private boolean nogenic = false;

    private void addAllFiles(File file, String str, Hashtable hashtable) {
        if (!file.exists()) {
            throw new IllegalArgumentException();
        }
        if (!file.isDirectory()) {
            hashtable.put(str, file);
            return;
        }
        File[] listFiles = file.listFiles();
        for (int i = 0; i < listFiles.length; i++) {
            addAllFiles(listFiles[i], str.length() > 0 ? new StringBuffer().append(str).append(File.separator).append(listFiles[i].getName()).toString() : listFiles[i].getName(), hashtable);
        }
    }

    private void addGenICGeneratedFiles(File file, Hashtable hashtable) {
        if (this.nogenic) {
            return;
        }
        Java java = new Java(getTask());
        java.setTaskName("genic");
        java.setFork(true);
        java.createJvmarg().setValue(new StringBuffer().append("-Dinstall.root=").append(this.jonasroot).toString());
        String stringBuffer = new StringBuffer().append(this.jonasroot).append(File.separator).append("config").toString();
        File file2 = new File(stringBuffer, "java.policy");
        if (file2.exists()) {
            java.createJvmarg().setValue(new StringBuffer().append("-Djava.security.policy=").append(file2.toString()).toString());
        }
        try {
            this.outputdir = createTempDir();
            log(new StringBuffer().append("Using temporary output directory: ").append(this.outputdir).toString(), 3);
            java.createArg().setValue("-d");
            java.createArg().setFile(this.outputdir);
            Enumeration keys = hashtable.keys();
            while (keys.hasMoreElements()) {
                new File(new StringBuffer().append(this.outputdir).append(File.separator).append((String) keys.nextElement()).toString()).getParentFile().mkdirs();
            }
            log("Worked around a bug of GenIC 2.5.", 3);
            Path combinedClasspath = getCombinedClasspath();
            Path path = combinedClasspath;
            if (combinedClasspath == null) {
                path = new Path(getTask().getProject());
            }
            path.append(new Path(path.getProject(), stringBuffer));
            path.append(new Path(path.getProject(), this.outputdir.toString()));
            if (this.orb != null) {
                path.append(new Path(path.getProject(), new StringBuffer().append(this.jonasroot).append(File.separator).append("lib").append(File.separator).append(this.orb).append("_jonas.jar").toString()));
            }
            log(new StringBuffer().append("Using classpath: ").append(path.toString()).toString(), 3);
            java.setClasspath(path);
            String genicClassName = getGenicClassName(path);
            if (genicClassName == null) {
                log("Cannot find GenIC class in classpath.", 0);
                throw new BuildException("GenIC class not found, please check the classpath.");
            }
            log(new StringBuffer().append("Using '").append(genicClassName).append("' GenIC class.").toString(), 3);
            java.setClassname(genicClassName);
            if (this.keepgenerated) {
                java.createArg().setValue("-keepgenerated");
            }
            if (this.nocompil) {
                java.createArg().setValue("-nocompil");
            }
            if (this.novalidation) {
                java.createArg().setValue("-novalidation");
            }
            if (this.javac != null) {
                java.createArg().setValue("-javac");
                java.createArg().setLine(this.javac);
            }
            if (this.javacopts != null && !this.javacopts.equals("")) {
                java.createArg().setValue("-javacopts");
                java.createArg().setLine(this.javacopts);
            }
            if (this.rmicopts != null && !this.rmicopts.equals("")) {
                java.createArg().setValue("-rmicopts");
                java.createArg().setLine(this.rmicopts);
            }
            if (this.secpropag) {
                java.createArg().setValue("-secpropag");
            }
            if (this.verbose) {
                java.createArg().setValue(SOSCmd.FLAG_VERBOSE);
            }
            if (this.additionalargs != null) {
                java.createArg().setValue(this.additionalargs);
            }
            java.createArg().setValue("-noaddinjar");
            java.createArg().setValue(file.getPath());
            log(new StringBuffer().append("Calling ").append(genicClassName).append(" for ").append(getConfig().descriptorDir).append(File.separator).append(this.descriptorName).append(".").toString(), 3);
            if (java.executeJava() == 0) {
                addAllFiles(this.outputdir, "", hashtable);
                return;
            }
            log(new StringBuffer().append("Deleting temp output directory '").append(this.outputdir).append("'.").toString(), 3);
            deleteAllFiles(this.outputdir);
            if (!this.keepgeneric) {
                log(new StringBuffer().append("Deleting generic JAR ").append(file.toString()).toString(), 3);
                file.delete();
            }
            throw new BuildException("GenIC reported an error.");
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("Cannot create temp dir: ").append(e.getMessage()).toString(), e);
        }
    }

    private File createTempDir() throws IOException {
        File createTempFile = File.createTempFile("genic", null, null);
        createTempFile.delete();
        if (!createTempFile.mkdir()) {
            throw new IOException(new StringBuffer().append("Cannot create the temporary directory '").append(createTempFile).append("'.").toString());
        }
        return createTempFile;
    }

    private void deleteAllFiles(File file) {
        if (file.isDirectory()) {
            for (File file2 : file.listFiles()) {
                deleteAllFiles(file2);
            }
        }
        file.delete();
    }

    private String getJonasDescriptorName() {
        String str;
        String str2;
        String stringBuffer;
        boolean z = false;
        int lastIndexOf = this.descriptorName.lastIndexOf(File.separatorChar);
        if (lastIndexOf != -1) {
            str = this.descriptorName.substring(0, lastIndexOf + 1);
            str2 = this.descriptorName.substring(lastIndexOf + 1);
        } else {
            str = "";
            str2 = this.descriptorName;
        }
        if (str2.startsWith("ejb-jar.xml")) {
            stringBuffer = new StringBuffer().append(str).append(JONAS_DD).toString();
        } else {
            int indexOf = this.descriptorName.indexOf(getConfig().baseNameTerminator, lastIndexOf);
            int i = indexOf;
            if (indexOf < 0) {
                int lastIndexOf2 = this.descriptorName.lastIndexOf(46) - 1;
                i = lastIndexOf2;
                if (lastIndexOf2 < 0) {
                    i = this.descriptorName.length() - 1;
                }
                z = true;
            }
            String substring = this.descriptorName.substring(lastIndexOf + 1, i + 1);
            stringBuffer = z ? new StringBuffer().append(str).append("jonas-").append(substring).append(".xml").toString() : new StringBuffer().append(str).append(substring).append("jonas-").append(this.descriptorName.substring(i + 1)).toString();
            log(new StringBuffer().append("Standard EJB descriptor name: ").append(this.descriptorName).toString(), 3);
            log(new StringBuffer().append("JOnAS-specific descriptor name: ").append(stringBuffer).toString(), 3);
        }
        return stringBuffer;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected void addVendorFiles(Hashtable hashtable, String str) {
        this.jonasDescriptorName = getJonasDescriptorName();
        File file = new File(getConfig().descriptorDir, this.jonasDescriptorName);
        if (file.exists()) {
            hashtable.put("META-INF/jonas-ejb-jar.xml", file);
        } else {
            log(new StringBuffer().append("Unable to locate the JOnAS deployment descriptor. It was expected to be in: ").append(file.getPath()).append(".").toString(), 1);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected void checkConfiguration(String str, SAXParser sAXParser) throws BuildException {
        if (this.jonasroot == null) {
            throw new BuildException("The jonasroot attribut is not set.");
        }
        if (!this.jonasroot.isDirectory()) {
            throw new BuildException(new StringBuffer().append("The jonasroot attribut '").append(this.jonasroot).append("' is not a valid directory.").toString());
        }
        if (this.orb != null && !this.orb.equals(RMI_ORB) && !this.orb.equals(JEREMIE_ORB) && !this.orb.equals(DAVID_ORB)) {
            throw new BuildException(new StringBuffer().append("The orb attribut '").append(this.orb).append("' is not valid (must be either ").append(RMI_ORB).append(", ").append(JEREMIE_ORB).append(" or ").append(DAVID_ORB).append(").").toString());
        }
        if (this.additionalargs != null && this.additionalargs.equals("")) {
            throw new BuildException("Empty additionalargs attribut.");
        }
        if (this.javac != null && this.javac.equals("")) {
            throw new BuildException("Empty javac attribut.");
        }
    }

    String getGenicClassName(Path path) {
        String str;
        log(new StringBuffer().append("Looking for GenIC class in classpath: ").append(path.toString()).toString(), 3);
        AntClassLoader antClassLoader = null;
        try {
            AntClassLoader createClassLoader = path.getProject().createClassLoader(path);
            antClassLoader = createClassLoader;
            try {
                createClassLoader.loadClass(GENIC_CLASS);
                antClassLoader = createClassLoader;
                log("Found GenIC class 'org.objectweb.jonas_ejb.genic.GenIC' in classpath.", 3);
                str = GENIC_CLASS;
                if (createClassLoader != null) {
                    createClassLoader.cleanup();
                    str = GENIC_CLASS;
                }
            } catch (ClassNotFoundException e) {
                log("GenIC class 'org.objectweb.jonas_ejb.genic.GenIC' not found in classpath.", 3);
                antClassLoader = createClassLoader;
                try {
                    createClassLoader.loadClass(OLD_GENIC_CLASS_1);
                    antClassLoader = createClassLoader;
                    log("Found GenIC class 'org.objectweb.jonas_ejb.tools.GenWholeIC' in classpath.", 3);
                    str = OLD_GENIC_CLASS_1;
                    if (createClassLoader != null) {
                        createClassLoader.cleanup();
                        str = OLD_GENIC_CLASS_1;
                    }
                } catch (ClassNotFoundException e2) {
                    log("GenIC class 'org.objectweb.jonas_ejb.tools.GenWholeIC' not found in classpath.", 3);
                    antClassLoader = createClassLoader;
                    try {
                        createClassLoader.loadClass(OLD_GENIC_CLASS_2);
                        antClassLoader = createClassLoader;
                        log("Found GenIC class 'org.objectweb.jonas_ejb.tools.GenIC' in classpath.", 3);
                        str = OLD_GENIC_CLASS_2;
                        if (createClassLoader != null) {
                            createClassLoader.cleanup();
                            str = OLD_GENIC_CLASS_2;
                        }
                    } catch (ClassNotFoundException e3) {
                        log("GenIC class 'org.objectweb.jonas_ejb.tools.GenIC' not found in classpath.", 3);
                        if (createClassLoader != null) {
                            createClassLoader.cleanup();
                        }
                        str = null;
                    }
                }
            }
            return str;
        } catch (Throwable th) {
            if (antClassLoader != null) {
                antClassLoader.cleanup();
            }
            throw th;
        }
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected String getJarBaseName(String str) {
        String str2 = null;
        if (getConfig().namingScheme.getValue().equals(EjbJar.NamingScheme.DESCRIPTOR)) {
            str2 = null;
            if (str.indexOf(getConfig().baseNameTerminator) == -1) {
                int lastIndexOf = str.replace('\\', '/').lastIndexOf(47);
                int indexOf = lastIndexOf != -1 ? str.indexOf(".xml", lastIndexOf) : str.indexOf(".xml");
                str2 = null;
                if (indexOf != -1) {
                    str2 = str.substring(0, indexOf);
                }
            }
        }
        String str3 = str2;
        if (str2 == null) {
            str3 = super.getJarBaseName(str);
        }
        log(new StringBuffer().append("JAR base name: ").append(str3).toString(), 3);
        return str3;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected File getVendorOutputJarFile(String str) {
        return new File(getDestDir(), new StringBuffer().append(str).append(this.suffix).toString());
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool, org.apache.tools.ant.taskdefs.optional.ejb.EJBDeploymentTool
    public void processDescriptor(String str, SAXParser sAXParser) {
        this.descriptorName = str;
        log(new StringBuffer().append("JOnAS Deployment Tool processing: ").append(this.descriptorName).toString(), 3);
        super.processDescriptor(this.descriptorName, sAXParser);
        if (this.outputdir != null) {
            log(new StringBuffer().append("Deleting temp output directory '").append(this.outputdir).append("'.").toString(), 3);
            deleteAllFiles(this.outputdir);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected void registerKnownDTDs(DescriptorHandler descriptorHandler) {
        descriptorHandler.registerDTD("-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN", new StringBuffer().append(this.jonasroot).append(File.separator).append("xml").append(File.separator).append(EJB_JAR_1_1_DTD).toString());
        descriptorHandler.registerDTD("-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 2.0//EN", new StringBuffer().append(this.jonasroot).append(File.separator).append("xml").append(File.separator).append(EJB_JAR_2_0_DTD).toString());
        descriptorHandler.registerDTD(JONAS_EJB_JAR_2_4_PUBLIC_ID, new StringBuffer().append(this.jonasroot).append(File.separator).append("xml").append(File.separator).append(JONAS_EJB_JAR_2_4_DTD).toString());
        descriptorHandler.registerDTD(JONAS_EJB_JAR_2_5_PUBLIC_ID, new StringBuffer().append(this.jonasroot).append(File.separator).append("xml").append(File.separator).append(JONAS_EJB_JAR_2_5_DTD).toString());
    }

    public void setAdditionalargs(String str) {
        this.additionalargs = str;
    }

    public void setJarsuffix(String str) {
        this.suffix = str;
    }

    public void setJavac(String str) {
        this.javac = str;
    }

    public void setJavacopts(String str) {
        this.javacopts = str;
    }

    public void setJonasroot(File file) {
        this.jonasroot = file;
    }

    public void setKeepgenerated(boolean z) {
        this.keepgenerated = z;
    }

    public void setKeepgeneric(boolean z) {
        this.keepgeneric = z;
    }

    public void setNocompil(boolean z) {
        this.nocompil = z;
    }

    public void setNogenic(boolean z) {
        this.nogenic = z;
    }

    public void setNovalidation(boolean z) {
        this.novalidation = z;
    }

    public void setOrb(String str) {
        this.orb = str;
    }

    public void setRmicopts(String str) {
        this.rmicopts = str;
    }

    public void setSecpropag(boolean z) {
        this.secpropag = z;
    }

    public void setVerbose(boolean z) {
        this.verbose = z;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected void writeJar(String str, File file, Hashtable hashtable, String str2) throws BuildException {
        File vendorOutputJarFile = super.getVendorOutputJarFile(str);
        super.writeJar(str, vendorOutputJarFile, hashtable, str2);
        addGenICGeneratedFiles(vendorOutputJarFile, hashtable);
        super.writeJar(str, getVendorOutputJarFile(str), hashtable, str2);
        if (!this.keepgeneric) {
            log(new StringBuffer().append("Deleting generic JAR ").append(vendorOutputJarFile.toString()).toString(), 3);
            vendorOutputJarFile.delete();
        }
    }
}
