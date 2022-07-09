package org.apache.tools.ant.taskdefs;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Unpack.class */
public abstract class Unpack extends Task {
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    protected File dest;
    protected File source;
    protected Resource srcResource;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void createDestFile(String str) {
        String name = this.source.getName();
        int length = name.length();
        if (str == null || length <= str.length() || !str.equalsIgnoreCase(name.substring(length - str.length()))) {
            this.dest = new File(this.dest, name);
        } else {
            this.dest = new File(this.dest, name.substring(0, length - str.length()));
        }
    }

    private void validate() throws BuildException {
        if (this.srcResource == null) {
            throw new BuildException("No Src specified", getLocation());
        }
        if (this.dest == null) {
            this.dest = new File(this.source.getParent());
        }
        if (!this.dest.isDirectory()) {
            return;
        }
        createDestFile(getDefaultExtension());
    }

    public void addConfigured(ResourceCollection resourceCollection) {
        if (resourceCollection.size() != 1) {
            throw new BuildException("only single argument resource collections are supported as archives");
        }
        setSrcResource((Resource) resourceCollection.iterator().next());
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        File file = this.dest;
        try {
            validate();
            extract();
        } finally {
            this.dest = file;
        }
    }

    protected abstract void extract();

    protected abstract String getDefaultExtension();

    public void setDest(File file) {
        this.dest = file;
    }

    public void setDest(String str) {
        log("DEPRECATED - The setDest(String) method has been deprecated. Use setDest(File) instead.");
        setDest(getProject().resolveFile(str));
    }

    public void setSrc(File file) {
        setSrcResource(new FileResource(file));
    }

    public void setSrc(String str) {
        log("DEPRECATED - The setSrc(String) method has been deprecated. Use setSrc(File) instead.");
        setSrc(getProject().resolveFile(str));
    }

    public void setSrcResource(Resource resource) {
        Class cls;
        if (!resource.isExists()) {
            throw new BuildException(new StringBuffer().append("the archive ").append(resource.getName()).append(" doesn't exist").toString());
        }
        if (resource.isDirectory()) {
            throw new BuildException(new StringBuffer().append("the archive ").append(resource.getName()).append(" can't be a directory").toString());
        }
        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
            cls = class$("org.apache.tools.ant.types.resources.FileProvider");
            class$org$apache$tools$ant$types$resources$FileProvider = cls;
        } else {
            cls = class$org$apache$tools$ant$types$resources$FileProvider;
        }
        FileProvider fileProvider = (FileProvider) resource.as(cls);
        if (fileProvider != null) {
            this.source = fileProvider.getFile();
        } else if (!supportsNonFileResources()) {
            throw new BuildException(new StringBuffer().append("The source ").append(resource.getName()).append(" is not a FileSystem ").append("Only FileSystem resources are").append(" supported.").toString());
        }
        this.srcResource = resource;
    }

    protected boolean supportsNonFileResources() {
        return false;
    }
}
