package org.apache.tools.ant.taskdefs.optional.ejb;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.taskdefs.MatchingTask;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Path;
import org.xml.sax.SAXException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/EjbJar.class */
public class EjbJar extends MatchingTask {
    private File destDir;
    private Config config = new Config();
    private String genericJarSuffix = "-generic.jar";
    private String cmpVersion = "1.0";
    private ArrayList deploymentTools = new ArrayList();

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/EjbJar$CMPVersion.class */
    public static class CMPVersion extends EnumeratedAttribute {
        public static final String CMP1_0 = "1.0";
        public static final String CMP2_0 = "2.0";

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"1.0", CMP2_0};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config.class */
    static class Config {
        public String analyzer;
        public String baseJarName;
        public Path classpath;
        public File descriptorDir;
        public File manifest;
        public NamingScheme namingScheme;
        public File srcDir;
        public String baseNameTerminator = "-";
        public boolean flatDestDir = false;
        public List supportFileSets = new ArrayList();
        public ArrayList dtdLocations = new ArrayList();

        Config() {
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation.class */
    public static class DTDLocation extends org.apache.tools.ant.types.DTDLocation {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme.class */
    public static class NamingScheme extends EnumeratedAttribute {
        public static final String BASEJARNAME = "basejarname";
        public static final String DESCRIPTOR = "descriptor";
        public static final String DIRECTORY = "directory";
        public static final String EJB_NAME = "ejb-name";

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{EJB_NAME, DIRECTORY, DESCRIPTOR, BASEJARNAME};
        }
    }

    private void validateConfig() throws BuildException {
        if (this.config.srcDir == null) {
            throw new BuildException("The srcDir attribute must be specified");
        }
        if (this.config.descriptorDir == null) {
            this.config.descriptorDir = this.config.srcDir;
        }
        if (this.config.namingScheme == null) {
            this.config.namingScheme = new NamingScheme();
            this.config.namingScheme.setValue(NamingScheme.DESCRIPTOR);
        } else if (this.config.namingScheme.getValue().equals(NamingScheme.BASEJARNAME) && this.config.baseJarName == null) {
            throw new BuildException("The basejarname attribute must be specified with the basejarname naming scheme");
        }
    }

    protected void addDeploymentTool(EJBDeploymentTool eJBDeploymentTool) {
        eJBDeploymentTool.setTask(this);
        this.deploymentTools.add(eJBDeploymentTool);
    }

    public BorlandDeploymentTool createBorland() {
        log("Borland deployment tools", 3);
        BorlandDeploymentTool borlandDeploymentTool = new BorlandDeploymentTool();
        borlandDeploymentTool.setTask(this);
        this.deploymentTools.add(borlandDeploymentTool);
        return borlandDeploymentTool;
    }

    public Path createClasspath() {
        if (this.config.classpath == null) {
            this.config.classpath = new Path(getProject());
        }
        return this.config.classpath.createPath();
    }

    public DTDLocation createDTD() {
        DTDLocation dTDLocation = new DTDLocation();
        this.config.dtdLocations.add(dTDLocation);
        return dTDLocation;
    }

    public IPlanetDeploymentTool createIplanet() {
        log("iPlanet Application Server deployment tools", 3);
        IPlanetDeploymentTool iPlanetDeploymentTool = new IPlanetDeploymentTool();
        addDeploymentTool(iPlanetDeploymentTool);
        return iPlanetDeploymentTool;
    }

    public JbossDeploymentTool createJboss() {
        JbossDeploymentTool jbossDeploymentTool = new JbossDeploymentTool();
        addDeploymentTool(jbossDeploymentTool);
        return jbossDeploymentTool;
    }

    public JonasDeploymentTool createJonas() {
        log("JOnAS deployment tools", 3);
        JonasDeploymentTool jonasDeploymentTool = new JonasDeploymentTool();
        addDeploymentTool(jonasDeploymentTool);
        return jonasDeploymentTool;
    }

    public FileSet createSupport() {
        FileSet fileSet = new FileSet();
        this.config.supportFileSets.add(fileSet);
        return fileSet;
    }

    public WeblogicDeploymentTool createWeblogic() {
        WeblogicDeploymentTool weblogicDeploymentTool = new WeblogicDeploymentTool();
        addDeploymentTool(weblogicDeploymentTool);
        return weblogicDeploymentTool;
    }

    public WeblogicTOPLinkDeploymentTool createWeblogictoplink() {
        log("The <weblogictoplink> element is no longer required. Please use the <weblogic> element and set newCMP=\"true\"", 2);
        WeblogicTOPLinkDeploymentTool weblogicTOPLinkDeploymentTool = new WeblogicTOPLinkDeploymentTool();
        addDeploymentTool(weblogicTOPLinkDeploymentTool);
        return weblogicTOPLinkDeploymentTool;
    }

    public WebsphereDeploymentTool createWebsphere() {
        WebsphereDeploymentTool websphereDeploymentTool = new WebsphereDeploymentTool();
        addDeploymentTool(websphereDeploymentTool);
        return websphereDeploymentTool;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        validateConfig();
        if (this.deploymentTools.size() == 0) {
            GenericDeploymentTool genericDeploymentTool = new GenericDeploymentTool();
            genericDeploymentTool.setTask(this);
            genericDeploymentTool.setDestdir(this.destDir);
            genericDeploymentTool.setGenericJarSuffix(this.genericJarSuffix);
            this.deploymentTools.add(genericDeploymentTool);
        }
        Iterator it = this.deploymentTools.iterator();
        while (it.hasNext()) {
            EJBDeploymentTool eJBDeploymentTool = (EJBDeploymentTool) it.next();
            eJBDeploymentTool.configure(this.config);
            eJBDeploymentTool.validateConfigured();
        }
        try {
            SAXParserFactory newInstance = SAXParserFactory.newInstance();
            newInstance.setValidating(true);
            SAXParser newSAXParser = newInstance.newSAXParser();
            DirectoryScanner directoryScanner = getDirectoryScanner(this.config.descriptorDir);
            directoryScanner.scan();
            String[] includedFiles = directoryScanner.getIncludedFiles();
            log(new StringBuffer().append(includedFiles.length).append(" deployment descriptors located.").toString(), 3);
            for (String str : includedFiles) {
                Iterator it2 = this.deploymentTools.iterator();
                while (it2.hasNext()) {
                    ((EJBDeploymentTool) it2.next()).processDescriptor(str, newSAXParser);
                }
            }
        } catch (ParserConfigurationException e) {
            throw new BuildException(new StringBuffer().append("ParserConfigurationException while creating parser. Details: ").append(e.getMessage()).toString(), e);
        } catch (SAXException e2) {
            throw new BuildException(new StringBuffer().append("SAXException while creating parser.  Details: ").append(e2.getMessage()).toString(), e2);
        }
    }

    public String getCmpversion() {
        return this.cmpVersion;
    }

    public File getDestdir() {
        return this.destDir;
    }

    public void setBasejarname(String str) {
        this.config.baseJarName = str;
        if (this.config.namingScheme != null) {
            if (this.config.namingScheme.getValue().equals(NamingScheme.BASEJARNAME)) {
                return;
            }
            throw new BuildException(new StringBuffer().append("The basejarname attribute is not compatible with the ").append(this.config.namingScheme.getValue()).append(" naming scheme").toString());
        }
        this.config.namingScheme = new NamingScheme();
        this.config.namingScheme.setValue(NamingScheme.BASEJARNAME);
    }

    public void setBasenameterminator(String str) {
        this.config.baseNameTerminator = str;
    }

    public void setClasspath(Path path) {
        this.config.classpath = path;
    }

    public void setCmpversion(CMPVersion cMPVersion) {
        this.cmpVersion = cMPVersion.getValue();
    }

    public void setDependency(String str) {
        this.config.analyzer = str;
    }

    public void setDescriptordir(File file) {
        this.config.descriptorDir = file;
    }

    public void setDestdir(File file) {
        this.destDir = file;
    }

    public void setFlatdestdir(boolean z) {
        this.config.flatDestDir = z;
    }

    public void setGenericjarsuffix(String str) {
        this.genericJarSuffix = str;
    }

    public void setManifest(File file) {
        this.config.manifest = file;
    }

    public void setNaming(NamingScheme namingScheme) {
        this.config.namingScheme = namingScheme;
        if (this.config.namingScheme.getValue().equals(NamingScheme.BASEJARNAME) || this.config.baseJarName == null) {
            return;
        }
        throw new BuildException(new StringBuffer().append("The basejarname attribute is not compatible with the ").append(this.config.namingScheme.getValue()).append(" naming scheme").toString());
    }

    public void setSrcdir(File file) {
        this.config.srcDir = file;
    }
}
