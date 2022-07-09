package org.apache.tools.ant.taskdefs.optional.extension;

import java.io.File;
import java.util.Iterator;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask.class */
public class JarLibAvailableTask extends Task {
    private final Vector extensionFileSets = new Vector();
    private File libraryFile;
    private String propertyName;
    private ExtensionAdapter requiredExtension;

    private void validate() throws BuildException {
        if (this.requiredExtension == null) {
            throw new BuildException("Extension element must be specified.");
        }
        if (this.libraryFile == null && this.extensionFileSets.isEmpty()) {
            throw new BuildException("File attribute not specified.");
        }
        if (this.libraryFile != null && !this.libraryFile.exists()) {
            throw new BuildException(new StringBuffer().append("File '").append(this.libraryFile).append("' does not exist.").toString());
        }
        if (this.libraryFile != null && !this.libraryFile.isFile()) {
            throw new BuildException(new StringBuffer().append("'").append(this.libraryFile).append("' is not a file.").toString());
        }
    }

    public void addConfiguredExtension(ExtensionAdapter extensionAdapter) {
        if (this.requiredExtension != null) {
            throw new BuildException("Can not specify extension to search for multiple times.");
        }
        this.requiredExtension = extensionAdapter;
    }

    public void addConfiguredExtensionSet(ExtensionSet extensionSet) {
        this.extensionFileSets.addElement(extensionSet);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        validate();
        Extension extension = this.requiredExtension.toExtension();
        if (this.extensionFileSets.isEmpty()) {
            for (Extension extension2 : Extension.getAvailable(ExtensionUtil.getManifest(this.libraryFile))) {
                if (extension2.isCompatibleWith(extension)) {
                    getProject().setNewProperty(this.propertyName, "true");
                }
            }
            return;
        }
        Iterator it = this.extensionFileSets.iterator();
        while (it.hasNext()) {
            for (Extension extension3 : ((ExtensionSet) it.next()).toExtensions(getProject())) {
                if (extension3.isCompatibleWith(extension)) {
                    getProject().setNewProperty(this.propertyName, "true");
                }
            }
        }
    }

    public void setFile(File file) {
        this.libraryFile = file;
    }

    public void setProperty(String str) {
        this.propertyName = str;
    }
}
