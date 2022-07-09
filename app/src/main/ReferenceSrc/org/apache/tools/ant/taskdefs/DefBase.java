package org.apache.tools.ant.taskdefs;

import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.util.ClasspathUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/DefBase.class */
public abstract class DefBase extends AntlibDefinition {
    private ClasspathUtils.Delegate cpDelegate;
    private ClassLoader createdLoader;

    private ClasspathUtils.Delegate getDelegate() {
        if (this.cpDelegate == null) {
            this.cpDelegate = ClasspathUtils.getDelegate(this);
        }
        return this.cpDelegate;
    }

    public Path createClasspath() {
        return getDelegate().createClasspath();
    }

    protected ClassLoader createLoader() {
        ClassLoader classLoader;
        if (getAntlibClassLoader() == null || this.cpDelegate != null) {
            if (this.createdLoader == null) {
                this.createdLoader = getDelegate().getClassLoader();
                ((AntClassLoader) this.createdLoader).addSystemPackageRoot("org.apache.tools.ant");
            }
            classLoader = this.createdLoader;
        } else {
            classLoader = getAntlibClassLoader();
        }
        return classLoader;
    }

    public Path getClasspath() {
        return getDelegate().getClasspath();
    }

    public String getClasspathId() {
        return getDelegate().getClassLoadId();
    }

    public String getLoaderId() {
        return getDelegate().getClassLoadId();
    }

    protected boolean hasCpDelegate() {
        return this.cpDelegate != null;
    }

    @Override // org.apache.tools.ant.Task
    public void init() throws BuildException {
        super.init();
    }

    public boolean isReverseLoader() {
        return getDelegate().isReverseLoader();
    }

    public void setClasspath(Path path) {
        getDelegate().setClasspath(path);
    }

    public void setClasspathRef(Reference reference) {
        getDelegate().setClasspathref(reference);
    }

    public void setLoaderRef(Reference reference) {
        getDelegate().setLoaderRef(reference);
    }

    public void setReverseLoader(boolean z) {
        getDelegate().setReverseLoader(z);
        log("The reverseloader attribute is DEPRECATED. It will be removed", 1);
    }
}
