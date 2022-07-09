package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.types.ZipFileSet;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.zip.ZipOutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/War.class */
public class War extends Jar {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static final String XML_DESCRIPTOR_PATH = "WEB-INF/web.xml";
    private File addedWebXmlFile;
    private File deploymentDescriptor;
    private boolean needxmlfile = true;

    public War() {
        this.archiveType = "war";
        this.emptyBehavior = "create";
    }

    public void addClasses(ZipFileSet zipFileSet) {
        zipFileSet.setPrefix("WEB-INF/classes/");
        super.addFileset(zipFileSet);
    }

    public void addLib(ZipFileSet zipFileSet) {
        zipFileSet.setPrefix("WEB-INF/lib/");
        super.addFileset(zipFileSet);
    }

    public void addWebinf(ZipFileSet zipFileSet) {
        zipFileSet.setPrefix("WEB-INF/");
        super.addFileset(zipFileSet);
    }

    @Override // org.apache.tools.ant.taskdefs.Jar, org.apache.tools.ant.taskdefs.Zip
    protected void cleanUp() {
        if (this.addedWebXmlFile != null || this.deploymentDescriptor != null || !this.needxmlfile || isInUpdateMode() || !hasUpdatedFile()) {
            this.addedWebXmlFile = null;
            super.cleanUp();
            return;
        }
        throw new BuildException("No WEB-INF/web.xml file was added.\nIf this is your intent, set needxmlfile='false' ");
    }

    @Override // org.apache.tools.ant.taskdefs.Jar, org.apache.tools.ant.taskdefs.Zip
    protected void initZipOutputStream(ZipOutputStream zipOutputStream) throws IOException, BuildException {
        super.initZipOutputStream(zipOutputStream);
    }

    public void setNeedxmlfile(boolean z) {
        this.needxmlfile = z;
    }

    public void setWarfile(File file) {
        setDestFile(file);
    }

    public void setWebxml(File file) {
        this.deploymentDescriptor = file;
        if (!this.deploymentDescriptor.exists()) {
            throw new BuildException(new StringBuffer().append("Deployment descriptor: ").append(this.deploymentDescriptor).append(DirectoryScanner.DOES_NOT_EXIST_POSTFIX).toString());
        }
        ZipFileSet zipFileSet = new ZipFileSet();
        zipFileSet.setFile(this.deploymentDescriptor);
        zipFileSet.setFullpath(XML_DESCRIPTOR_PATH);
        super.addFileset(zipFileSet);
    }

    @Override // org.apache.tools.ant.taskdefs.Zip
    protected void zipFile(File file, ZipOutputStream zipOutputStream, String str, int i) throws IOException {
        boolean z = true;
        if (XML_DESCRIPTOR_PATH.equalsIgnoreCase(str)) {
            if (this.addedWebXmlFile != null) {
                z = false;
                if (!FILE_UTILS.fileNameEquals(this.addedWebXmlFile, file)) {
                    logWhenWriting(new StringBuffer().append("Warning: selected ").append(this.archiveType).append(" files include a second ").append(XML_DESCRIPTOR_PATH).append(" which will be ignored.\n").append("The duplicate entry is at ").append(file).append('\n').append("The file that will be used is ").append(this.addedWebXmlFile).toString(), 1);
                    z = false;
                }
            } else {
                this.addedWebXmlFile = file;
                z = true;
                this.deploymentDescriptor = file;
            }
        }
        if (z) {
            super.zipFile(file, zipOutputStream, str, i);
        }
    }
}
