package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Pack.class */
public abstract class Pack extends Task {
    private static final int BUFFER_SIZE = 8192;
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    protected File source;
    private Resource src;
    protected File zipFile;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void validate() throws BuildException {
        if (this.zipFile == null) {
            throw new BuildException("zipfile attribute is required", getLocation());
        }
        if (this.zipFile.isDirectory()) {
            throw new BuildException("zipfile attribute must not represent a directory!", getLocation());
        }
        if (getSrcResource() != null) {
            return;
        }
        throw new BuildException("src attribute or nested resource is required", getLocation());
    }

    private void zipFile(InputStream inputStream, OutputStream outputStream) throws IOException {
        int read;
        byte[] bArr = new byte[8192];
        int i = 0;
        do {
            outputStream.write(bArr, 0, i);
            read = inputStream.read(bArr, 0, bArr.length);
            i = read;
        } while (read != -1);
    }

    public void addConfigured(ResourceCollection resourceCollection) {
        if (resourceCollection.size() == 0) {
            throw new BuildException(new StringBuffer().append("No resource selected, ").append(getTaskName()).append(" needs exactly one resource.").toString());
        }
        if (resourceCollection.size() != 1) {
            throw new BuildException(new StringBuffer().append(getTaskName()).append(" cannot handle multiple resources at once. (").append(resourceCollection.size()).append(" resources were selected.)").toString());
        }
        setSrcResource((Resource) resourceCollection.iterator().next());
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        validate();
        Resource srcResource = getSrcResource();
        if (!srcResource.isExists()) {
            log(new StringBuffer().append("Nothing to do: ").append(srcResource.toString()).append(" doesn't exist.").toString());
        } else if (this.zipFile.lastModified() >= srcResource.getLastModified()) {
            log(new StringBuffer().append("Nothing to do: ").append(this.zipFile.getAbsolutePath()).append(" is up to date.").toString());
        } else {
            log(new StringBuffer().append("Building: ").append(this.zipFile.getAbsolutePath()).toString());
            pack();
        }
    }

    public Resource getSrcResource() {
        return this.src;
    }

    protected abstract void pack();

    public void setDestfile(File file) {
        setZipfile(file);
    }

    public void setSrc(File file) {
        setSrcResource(new FileResource(file));
    }

    public void setSrcResource(Resource resource) {
        Class cls;
        if (resource.isDirectory()) {
            throw new BuildException("the source can't be a directory");
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
            throw new BuildException("Only FileSystem resources are supported.");
        }
        this.src = resource;
    }

    public void setZipfile(File file) {
        this.zipFile = file;
    }

    protected boolean supportsNonFileResources() {
        return false;
    }

    protected void zipFile(File file, OutputStream outputStream) throws IOException {
        zipResource(new FileResource(file), outputStream);
    }

    protected void zipResource(Resource resource, OutputStream outputStream) throws IOException {
        InputStream inputStream = resource.getInputStream();
        try {
            zipFile(inputStream, outputStream);
        } finally {
            inputStream.close();
        }
    }
}
