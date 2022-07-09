package org.apache.tools.ant.taskdefs;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.filters.util.ChainReaderHelper;
import org.apache.tools.ant.types.FilterChain;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.JavaResource;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/LoadProperties.class */
public class LoadProperties extends Task {
    private Resource src = null;
    private final Vector filterChains = new Vector();
    private String encoding = null;
    private String prefix = null;
    private boolean prefixValues = true;

    private JavaResource getRequiredJavaResource() {
        JavaResource javaResource;
        synchronized (this) {
            if (this.src == null) {
                this.src = new JavaResource();
                this.src.setProject(getProject());
            } else if (!(this.src instanceof JavaResource)) {
                throw new BuildException("expected a java resource as source");
            }
            javaResource = (JavaResource) this.src;
        }
        return javaResource;
    }

    public void addConfigured(ResourceCollection resourceCollection) {
        synchronized (this) {
            if (this.src != null) {
                throw new BuildException("only a single source is supported");
            }
            if (resourceCollection.size() != 1) {
                throw new BuildException("only single-element resource collections are supported");
            }
            this.src = (Resource) resourceCollection.iterator().next();
        }
    }

    public final void addFilterChain(FilterChain filterChain) {
        this.filterChains.addElement(filterChain);
    }

    public Path createClasspath() {
        return getRequiredJavaResource().createClasspath();
    }

    @Override // org.apache.tools.ant.Task
    public final void execute() throws BuildException {
        Throwable th;
        BufferedInputStream bufferedInputStream;
        IOException e;
        if (this.src == null) {
            throw new BuildException("A source resource is required.");
        }
        if (!this.src.isExists()) {
            if (!(this.src instanceof JavaResource)) {
                throw new BuildException(new StringBuffer().append("Source resource does not exist: ").append(this.src).toString());
            }
            log(new StringBuffer().append("Unable to find resource ").append(this.src).toString(), 1);
            return;
        }
        ByteArrayInputStream byteArrayInputStream = null;
        BufferedInputStream bufferedInputStream2 = null;
        ByteArrayInputStream byteArrayInputStream2 = null;
        try {
            try {
                bufferedInputStream = new BufferedInputStream(this.src.getInputStream());
                try {
                    InputStreamReader inputStreamReader = this.encoding == null ? new InputStreamReader(bufferedInputStream) : new InputStreamReader(bufferedInputStream, this.encoding);
                    ChainReaderHelper chainReaderHelper = new ChainReaderHelper();
                    chainReaderHelper.setPrimaryReader(inputStreamReader);
                    chainReaderHelper.setFilterChains(this.filterChains);
                    chainReaderHelper.setProject(getProject());
                    String readFully = chainReaderHelper.readFully(chainReaderHelper.getAssembledReader());
                    ByteArrayInputStream byteArrayInputStream3 = null;
                    if (readFully != null) {
                        byteArrayInputStream3 = null;
                        if (readFully.length() != 0) {
                            String str = readFully;
                            if (!readFully.endsWith("\n")) {
                                str = new StringBuffer().append(readFully).append("\n").toString();
                            }
                            byteArrayInputStream3 = new ByteArrayInputStream(str.getBytes("ISO-8859-1"));
                            try {
                                Properties properties = new Properties();
                                properties.load(byteArrayInputStream3);
                                Property property = new Property();
                                property.bindToOwner(this);
                                property.setPrefix(this.prefix);
                                property.setPrefixValues(this.prefixValues);
                                property.addProperties(properties);
                            } catch (IOException e2) {
                                e = e2;
                                byteArrayInputStream = byteArrayInputStream3;
                                BufferedInputStream bufferedInputStream3 = bufferedInputStream;
                                BufferedInputStream bufferedInputStream4 = bufferedInputStream;
                                BufferedInputStream bufferedInputStream5 = bufferedInputStream;
                                BufferedInputStream bufferedInputStream6 = bufferedInputStream;
                                throw new BuildException(new StringBuffer().append("Unable to load file: ").append(e).toString(), e, getLocation());
                            } catch (Throwable th2) {
                                byteArrayInputStream2 = byteArrayInputStream3;
                                bufferedInputStream2 = bufferedInputStream;
                                th = th2;
                                FileUtils.close(bufferedInputStream2);
                                FileUtils.close(byteArrayInputStream2);
                                throw th;
                            }
                        }
                    }
                    FileUtils.close(bufferedInputStream);
                    FileUtils.close(byteArrayInputStream3);
                } catch (IOException e3) {
                    e = e3;
                } catch (Throwable th3) {
                    bufferedInputStream2 = bufferedInputStream;
                    byteArrayInputStream2 = null;
                    th = th3;
                }
            } catch (Throwable th4) {
                th = th4;
            }
        } catch (IOException e4) {
            e = e4;
            bufferedInputStream = null;
        }
    }

    public Path getClasspath() {
        return getRequiredJavaResource().getClasspath();
    }

    public void setClasspath(Path path) {
        getRequiredJavaResource().setClasspath(path);
    }

    public void setClasspathRef(Reference reference) {
        getRequiredJavaResource().setClasspathRef(reference);
    }

    public final void setEncoding(String str) {
        this.encoding = str;
    }

    public void setPrefix(String str) {
        this.prefix = str;
    }

    public void setPrefixValues(boolean z) {
        this.prefixValues = z;
    }

    public void setResource(String str) {
        getRequiredJavaResource().setName(str);
    }

    public final void setSrcFile(File file) {
        addConfigured(new FileResource(file));
    }
}
