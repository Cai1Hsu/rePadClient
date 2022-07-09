package org.apache.tools.ant.types.resources;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Stack;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/AbstractClasspathResource.class */
public abstract class AbstractClasspathResource extends Resource {
    static Class class$org$apache$tools$ant$types$resources$JavaResource;
    private Path classpath;
    private Reference loader;
    private boolean parentFirst = true;

    /* loaded from: classes.jar:org/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag.class */
    public static class ClassLoaderWithFlag {
        private final boolean cleanup;
        private final ClassLoader loader;

        ClassLoaderWithFlag(ClassLoader classLoader, boolean z) {
            this.loader = classLoader;
            this.cleanup = z && (classLoader instanceof AntClassLoader);
        }

        public void cleanup() {
            if (this.cleanup) {
                ((AntClassLoader) this.loader).cleanup();
            }
        }

        public ClassLoader getLoader() {
            return this.loader;
        }

        public boolean needsCleanup() {
            return this.cleanup;
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public Path createClasspath() {
        checkChildrenAllowed();
        if (this.classpath == null) {
            this.classpath = new Path(getProject());
        }
        setChecked(false);
        return this.classpath.createPath();
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) {
        synchronized (this) {
            if (!isChecked()) {
                if (isReference()) {
                    super.dieOnCircularReference(stack, project);
                } else {
                    if (this.classpath != null) {
                        pushAndInvokeCircularReferenceCheck(this.classpath, stack, project);
                    }
                    setChecked(true);
                }
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v47, types: [java.lang.ClassLoader] */
    protected ClassLoaderWithFlag getClassLoader() {
        Class cls;
        AntClassLoader classLoader;
        AntClassLoader antClassLoader = null;
        boolean z = false;
        boolean z2 = false;
        if (this.loader != null) {
            antClassLoader = (ClassLoader) this.loader.getReferencedObject();
        }
        AntClassLoader antClassLoader2 = antClassLoader;
        if (antClassLoader == null) {
            if (getClasspath() != null) {
                Path concatSystemClasspath = getClasspath().concatSystemClasspath(Definer.OnError.POLICY_IGNORE);
                classLoader = this.parentFirst ? getProject().createClassLoader(concatSystemClasspath) : AntClassLoader.newAntClassLoader(getProject().getCoreLoader(), getProject(), concatSystemClasspath, false);
                z2 = this.loader == null;
            } else {
                if (class$org$apache$tools$ant$types$resources$JavaResource == null) {
                    cls = class$("org.apache.tools.ant.types.resources.JavaResource");
                    class$org$apache$tools$ant$types$resources$JavaResource = cls;
                } else {
                    cls = class$org$apache$tools$ant$types$resources$JavaResource;
                }
                classLoader = cls.getClassLoader();
            }
            antClassLoader2 = classLoader;
            z = z2;
            if (this.loader != null) {
                antClassLoader2 = classLoader;
                z = z2;
                if (classLoader != null) {
                    getProject().addReference(this.loader.getRefId(), classLoader);
                    z = z2;
                    antClassLoader2 = classLoader;
                }
            }
        }
        return new ClassLoaderWithFlag(antClassLoader2, z);
    }

    public Path getClasspath() {
        Path path;
        if (isReference()) {
            path = ((AbstractClasspathResource) getCheckedRef()).getClasspath();
        } else {
            dieOnCircularReference();
            path = this.classpath;
        }
        return path;
    }

    @Override // org.apache.tools.ant.types.Resource
    public InputStream getInputStream() throws IOException {
        FilterInputStream openInputStream;
        if (isReference()) {
            openInputStream = ((Resource) getCheckedRef()).getInputStream();
        } else {
            dieOnCircularReference();
            ClassLoaderWithFlag classLoader = getClassLoader();
            openInputStream = !classLoader.needsCleanup() ? openInputStream(classLoader.getLoader()) : new FilterInputStream(this, openInputStream(classLoader.getLoader()), classLoader) { // from class: org.apache.tools.ant.types.resources.AbstractClasspathResource.1
                private final AbstractClasspathResource this$0;
                private final ClassLoaderWithFlag val$classLoader;

                {
                    this.this$0 = this;
                    this.val$classLoader = classLoader;
                }

                @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
                public void close() throws IOException {
                    FileUtils.close(this.in);
                    this.val$classLoader.cleanup();
                }

                protected void finalize() throws Throwable {
                    try {
                        close();
                    } finally {
                        super.finalize();
                    }
                }
            };
        }
        return openInputStream;
    }

    public Reference getLoader() {
        Reference reference;
        if (isReference()) {
            reference = ((AbstractClasspathResource) getCheckedRef()).getLoader();
        } else {
            dieOnCircularReference();
            reference = this.loader;
        }
        return reference;
    }

    @Override // org.apache.tools.ant.types.Resource
    public boolean isExists() {
        boolean z = false;
        if (isReference()) {
            z = ((Resource) getCheckedRef()).isExists();
        } else {
            dieOnCircularReference();
            try {
                InputStream inputStream = getInputStream();
                z = false;
                if (inputStream != null) {
                    z = true;
                }
                FileUtils.close(inputStream);
            } catch (IOException e) {
                FileUtils.close((InputStream) null);
            } catch (Throwable th) {
                FileUtils.close((InputStream) null);
                throw th;
            }
        }
        return z;
    }

    protected abstract InputStream openInputStream(ClassLoader classLoader) throws IOException;

    public void setClasspath(Path path) {
        checkAttributesAllowed();
        if (this.classpath == null) {
            this.classpath = path;
        } else {
            this.classpath.append(path);
        }
        setChecked(false);
    }

    public void setClasspathRef(Reference reference) {
        checkAttributesAllowed();
        createClasspath().setRefid(reference);
    }

    public void setLoaderRef(Reference reference) {
        checkAttributesAllowed();
        this.loader = reference;
    }

    public void setParentFirst(boolean z) {
        this.parentFirst = z;
    }

    @Override // org.apache.tools.ant.types.Resource, org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) {
        if (this.loader == null && this.classpath == null) {
            super.setRefid(reference);
            return;
        }
        throw tooManyAttributes();
    }
}
