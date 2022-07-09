package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.types.ZipFileSet;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.zip.ZipOutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Ear.class */
public class Ear extends Jar {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static final String XML_DESCRIPTOR_PATH = "META-INF/application.xml";
    private File deploymentDescriptor;
    private boolean descriptorAdded;

    public Ear() {
        this.archiveType = "ear";
        this.emptyBehavior = "create";
    }

    public void addArchives(ZipFileSet zipFileSet) {
        zipFileSet.setPrefix("/");
        super.addFileset(zipFileSet);
    }

    @Override // org.apache.tools.ant.taskdefs.Jar, org.apache.tools.ant.taskdefs.Zip
    protected void cleanUp() {
        this.descriptorAdded = false;
        super.cleanUp();
    }

    @Override // org.apache.tools.ant.taskdefs.Jar, org.apache.tools.ant.taskdefs.Zip
    protected void initZipOutputStream(ZipOutputStream zipOutputStream) throws IOException, BuildException {
        if (this.deploymentDescriptor != null || isInUpdateMode()) {
            super.initZipOutputStream(zipOutputStream);
            return;
        }
        throw new BuildException("appxml attribute is required", getLocation());
    }

    public void setAppxml(File file) {
        this.deploymentDescriptor = file;
        if (!this.deploymentDescriptor.exists()) {
            throw new BuildException(new StringBuffer().append("Deployment descriptor: ").append(this.deploymentDescriptor).append(DirectoryScanner.DOES_NOT_EXIST_POSTFIX).toString());
        }
        ZipFileSet zipFileSet = new ZipFileSet();
        zipFileSet.setFile(this.deploymentDescriptor);
        zipFileSet.setFullpath(XML_DESCRIPTOR_PATH);
        super.addFileset(zipFileSet);
    }

    public void setEarfile(File file) {
        setDestFile(file);
    }

    @Override // org.apache.tools.ant.taskdefs.Zip
    protected void zipFile(File file, ZipOutputStream zipOutputStream, String str, int i) throws IOException {
        if (!XML_DESCRIPTOR_PATH.equalsIgnoreCase(str)) {
            super.zipFile(file, zipOutputStream, str, i);
        } else if (this.deploymentDescriptor == null || !FILE_UTILS.fileNameEquals(this.deploymentDescriptor, file) || this.descriptorAdded) {
            logWhenWriting(new StringBuffer().append("Warning: selected ").append(this.archiveType).append(" files include a ").append(XML_DESCRIPTOR_PATH).append(" which will").append(" be ignored (please use appxml attribute to ").append(this.archiveType).append(" task)").toString(), 1);
        } else {
            super.zipFile(file, zipOutputStream, str, i);
            this.descriptorAdded = true;
        }
    }
}
