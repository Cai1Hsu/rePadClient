package org.apache.tools.ant.taskdefs.optional.ejb;

import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import java.util.Iterator;
import javax.xml.parsers.SAXParser;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.optional.ejb.EjbJar;
import org.apache.tools.ant.taskdefs.optional.ejb.IPlanetEjbc;
import org.xml.sax.SAXException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool.class */
public class IPlanetDeploymentTool extends GenericDeploymentTool {
    private static final String IAS_DD = "ias-ejb-jar.xml";
    private String descriptorName;
    private String displayName;
    private String iasDescriptorName;
    private File iashome;
    private String jarSuffix = ".jar";
    private boolean keepgenerated = false;
    private boolean debug = false;

    private String getIasDescriptorName() {
        String substring;
        String substring2;
        String str;
        if (this.iasDescriptorName != null) {
            str = this.iasDescriptorName;
        } else {
            String str2 = "";
            int lastIndexOf = this.descriptorName.lastIndexOf(File.separatorChar);
            if (lastIndexOf != -1) {
                str2 = this.descriptorName.substring(0, lastIndexOf + 1);
            }
            if (this.descriptorName.substring(lastIndexOf + 1).equals("ejb-jar.xml")) {
                substring = "";
                substring2 = "ejb-jar.xml";
            } else {
                int indexOf = this.descriptorName.indexOf(getConfig().baseNameTerminator, lastIndexOf);
                int i = indexOf;
                if (indexOf < 0) {
                    int lastIndexOf2 = this.descriptorName.lastIndexOf(46) - 1;
                    i = lastIndexOf2;
                    if (lastIndexOf2 < 0) {
                        i = this.descriptorName.length() - 1;
                    }
                }
                substring = this.descriptorName.substring(lastIndexOf + 1, i + 1);
                substring2 = this.descriptorName.substring(i + 1);
            }
            this.iasDescriptorName = new StringBuffer().append(str2).append(substring).append("ias-").append(substring2).toString();
            str = this.iasDescriptorName;
        }
        return str;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected void addVendorFiles(Hashtable hashtable, String str) {
        hashtable.put("META-INF/ias-ejb-jar.xml", new File(getConfig().descriptorDir, getIasDescriptorName()));
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected void checkConfiguration(String str, SAXParser sAXParser) throws BuildException {
        if (!str.substring(str.lastIndexOf(File.separatorChar) + 1).equals("ejb-jar.xml") || getConfig().baseJarName != null) {
            File file = new File(getConfig().descriptorDir, getIasDescriptorName());
            if (!file.exists() || !file.isFile()) {
                throw new BuildException(new StringBuffer().append("The iAS-specific EJB descriptor (").append(file).append(") was not found.").toString(), getLocation());
            }
            if (this.iashome != null && !this.iashome.isDirectory()) {
                throw new BuildException(new StringBuffer().append("If \"iashome\" is specified, it must be a valid directory (it was set to ").append(this.iashome).append(").").toString(), getLocation());
            }
            return;
        }
        throw new BuildException("No name specified for the completed JAR file.  The EJB descriptor should be prepended with the JAR name or it should be specified using the attribute \"basejarname\" in the \"ejbjar\" task.", getLocation());
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected String getPublicId() {
        return null;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    File getVendorOutputJarFile(String str) {
        File file = new File(getDestDir(), new StringBuffer().append(str).append(this.jarSuffix).toString());
        log(new StringBuffer().append("JAR file name: ").append(file.toString()).toString(), 3);
        return file;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected Hashtable parseEjbFiles(String str, SAXParser sAXParser) throws IOException, SAXException {
        IPlanetEjbc iPlanetEjbc = new IPlanetEjbc(new File(getConfig().descriptorDir, str), new File(getConfig().descriptorDir, getIasDescriptorName()), getConfig().srcDir, getCombinedClasspath().toString(), sAXParser);
        iPlanetEjbc.setRetainSource(this.keepgenerated);
        iPlanetEjbc.setDebugOutput(this.debug);
        if (this.iashome != null) {
            iPlanetEjbc.setIasHomeDir(this.iashome);
        }
        if (getConfig().dtdLocations != null) {
            Iterator it = getConfig().dtdLocations.iterator();
            while (it.hasNext()) {
                EjbJar.DTDLocation dTDLocation = (EjbJar.DTDLocation) it.next();
                iPlanetEjbc.registerDTD(dTDLocation.getPublicId(), dTDLocation.getLocation());
            }
        }
        try {
            iPlanetEjbc.execute();
            this.displayName = iPlanetEjbc.getDisplayName();
            Hashtable ejbFiles = iPlanetEjbc.getEjbFiles();
            String[] cmpDescriptors = iPlanetEjbc.getCmpDescriptors();
            if (cmpDescriptors.length > 0) {
                File file = getConfig().descriptorDir;
                String substring = str.substring(0, str.lastIndexOf(File.separator) + 1);
                for (int i = 0; i < cmpDescriptors.length; i++) {
                    File file2 = new File(file, new StringBuffer().append(substring).append(cmpDescriptors[i].substring(cmpDescriptors[i].lastIndexOf(47) + 1)).toString());
                    if (!file2.exists()) {
                        throw new BuildException(new StringBuffer().append("The CMP descriptor file (").append(file2).append(") could not be found.").toString(), getLocation());
                    }
                    ejbFiles.put(cmpDescriptors[i], file2);
                }
            }
            return ejbFiles;
        } catch (IPlanetEjbc.EjbcException e) {
            throw new BuildException("An error has occurred while trying to execute the iAS ejbc utility", e, getLocation());
        }
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool, org.apache.tools.ant.taskdefs.optional.ejb.EJBDeploymentTool
    public void processDescriptor(String str, SAXParser sAXParser) {
        this.descriptorName = str;
        this.iasDescriptorName = null;
        log(new StringBuffer().append("iPlanet Deployment Tool processing: ").append(str).append(" (and ").append(getIasDescriptorName()).append(")").toString(), 3);
        super.processDescriptor(str, sAXParser);
    }

    public void setDebug(boolean z) {
        this.debug = z;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    public void setGenericJarSuffix(String str) {
        log("Since a generic JAR file is not created during processing, the iPlanet Deployment Tool does not support the \"genericjarsuffix\" attribute.  It will be ignored.", 1);
    }

    public void setIashome(File file) {
        this.iashome = file;
    }

    public void setKeepgenerated(boolean z) {
        this.keepgenerated = z;
    }

    public void setSuffix(String str) {
        this.jarSuffix = str;
    }
}
