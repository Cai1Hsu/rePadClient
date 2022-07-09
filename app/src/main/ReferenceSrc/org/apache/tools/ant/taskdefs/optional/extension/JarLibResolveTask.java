package org.apache.tools.ant.taskdefs.optional.extension;

import java.io.File;
import java.util.ArrayList;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.optional.extension.resolvers.AntResolver;
import org.apache.tools.ant.taskdefs.optional.extension.resolvers.LocationResolver;
import org.apache.tools.ant.taskdefs.optional.extension.resolvers.URLResolver;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask.class */
public class JarLibResolveTask extends Task {
    private String propertyName;
    private Extension requiredExtension;
    private final ArrayList resolvers = new ArrayList();
    private boolean checkExtension = true;
    private boolean failOnError = true;

    private void checkExtension(File file) {
        if (!file.exists()) {
            throw new BuildException(new StringBuffer().append("File ").append(file).append(" does not exist").toString());
        }
        if (!file.isFile()) {
            throw new BuildException(new StringBuffer().append("File ").append(file).append(" is not a file").toString());
        }
        if (!this.checkExtension) {
            getProject().log(new StringBuffer().append("Setting property to ").append(file).append(" without verifying library satisfies extension").toString(), 3);
            setLibraryProperty(file);
            return;
        }
        getProject().log(new StringBuffer().append("Checking file ").append(file).append(" to see if it satisfies extension").toString(), 3);
        for (Extension extension : Extension.getAvailable(ExtensionUtil.getManifest(file))) {
            if (extension.isCompatibleWith(this.requiredExtension)) {
                setLibraryProperty(file);
                return;
            }
        }
        String stringBuffer = new StringBuffer().append("File ").append(file).append(" skipped as it ").append("does not satisfy extension").toString();
        getProject().log(stringBuffer, 3);
        throw new BuildException(stringBuffer);
    }

    private void missingExtension() {
        if (this.failOnError) {
            throw new BuildException("Unable to resolve extension to a file");
        }
        getProject().log("Unable to resolve extension to a file", 0);
    }

    private void setLibraryProperty(File file) {
        getProject().setNewProperty(this.propertyName, file.getAbsolutePath());
    }

    private void validate() throws BuildException {
        if (this.propertyName == null) {
            throw new BuildException("Property attribute must be specified.");
        }
        if (this.requiredExtension != null) {
            return;
        }
        throw new BuildException("Extension element must be specified.");
    }

    public void addConfiguredAnt(AntResolver antResolver) {
        this.resolvers.add(antResolver);
    }

    public void addConfiguredExtension(ExtensionAdapter extensionAdapter) {
        if (this.requiredExtension != null) {
            throw new BuildException("Can not specify extension to resolve multiple times.");
        }
        this.requiredExtension = extensionAdapter.toExtension();
    }

    public void addConfiguredLocation(LocationResolver locationResolver) {
        this.resolvers.add(locationResolver);
    }

    public void addConfiguredUrl(URLResolver uRLResolver) {
        this.resolvers.add(uRLResolver);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        validate();
        getProject().log(new StringBuffer().append("Resolving extension: ").append(this.requiredExtension).toString(), 3);
        String property = getProject().getProperty(this.propertyName);
        if (property != null) {
            String stringBuffer = new StringBuffer().append("Property Already set to: ").append(property).toString();
            if (this.failOnError) {
                throw new BuildException(stringBuffer);
            }
            getProject().log(stringBuffer, 0);
            return;
        }
        int size = this.resolvers.size();
        for (int i = 0; i < size; i++) {
            ExtensionResolver extensionResolver = (ExtensionResolver) this.resolvers.get(i);
            getProject().log(new StringBuffer().append("Searching for extension using Resolver:").append(extensionResolver).toString(), 3);
            try {
                File resolve = extensionResolver.resolve(this.requiredExtension, getProject());
                try {
                    checkExtension(resolve);
                    return;
                } catch (BuildException e) {
                    getProject().log(new StringBuffer().append("File ").append(resolve).append(" returned by ").append("resolver failed to satisfy extension due to: ").append(e.getMessage()).toString(), 1);
                }
            } catch (BuildException e2) {
                getProject().log(new StringBuffer().append("Failed to resolve extension to file using resolver ").append(extensionResolver).append(" due to: ").append(e2).toString(), 1);
            }
        }
        missingExtension();
    }

    public void setCheckExtension(boolean z) {
        this.checkExtension = z;
    }

    public void setFailOnError(boolean z) {
        this.failOnError = z;
    }

    public void setProperty(String str) {
        this.propertyName = str;
    }
}
