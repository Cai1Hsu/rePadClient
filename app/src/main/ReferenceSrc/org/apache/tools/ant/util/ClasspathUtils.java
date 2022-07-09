package org.apache.tools.ant.util;

import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.taskdefs.rmic.RmicAdapterFactory;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;

/* loaded from: classes.jar:org/apache/tools/ant/util/ClasspathUtils.class */
public class ClasspathUtils {
    public static final String REUSE_LOADER_REF = "ant.reuse.loader";
    static Class class$java$lang$Object;

    /* loaded from: classes.jar:org/apache/tools/ant/util/ClasspathUtils$Delegate.class */
    public static class Delegate {
        private String className;
        private Path classpath;
        private String classpathId;
        private final ProjectComponent component;
        private String loaderId;
        private boolean reverseLoader = false;

        Delegate(ProjectComponent projectComponent) {
            this.component = projectComponent;
        }

        private Project getContextProject() {
            return this.component.getProject();
        }

        public Path createClasspath() {
            if (this.classpath == null) {
                this.classpath = new Path(this.component.getProject());
            }
            return this.classpath.createPath();
        }

        public String getClassLoadId() {
            return (this.loaderId != null || this.classpathId == null) ? this.loaderId : new StringBuffer().append(MagicNames.REFID_CLASSPATH_LOADER_PREFIX).append(this.classpathId).toString();
        }

        public ClassLoader getClassLoader() {
            return ClasspathUtils.getClassLoaderForPath(getContextProject(), this.classpath, getClassLoadId(), this.reverseLoader, this.loaderId != null || ClasspathUtils.isMagicPropertySet(getContextProject()));
        }

        public Path getClasspath() {
            return this.classpath;
        }

        public boolean isReverseLoader() {
            return this.reverseLoader;
        }

        public Object newInstance() {
            return ClasspathUtils.newInstance(this.className, getClassLoader());
        }

        public void setClassname(String str) {
            this.className = str;
        }

        public void setClasspath(Path path) {
            if (this.classpath == null) {
                this.classpath = path;
            } else {
                this.classpath.append(path);
            }
        }

        public void setClasspathref(Reference reference) {
            this.classpathId = reference.getRefId();
            createClasspath().setRefid(reference);
        }

        public void setLoaderRef(Reference reference) {
            this.loaderId = reference.getRefId();
        }

        public void setReverseLoader(boolean z) {
            this.reverseLoader = z;
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public static ClassLoader getClassLoaderForPath(Project project, Path path, String str) {
        return getClassLoaderForPath(project, path, str, false);
    }

    public static ClassLoader getClassLoaderForPath(Project project, Path path, String str, boolean z) {
        return getClassLoaderForPath(project, path, str, z, isMagicPropertySet(project));
    }

    public static ClassLoader getClassLoaderForPath(Project project, Path path, String str, boolean z, boolean z2) {
        ClassLoader classLoader = null;
        if (str != null) {
            classLoader = null;
            if (z2) {
                Object reference = project.getReference(str);
                if (reference != null && !(reference instanceof ClassLoader)) {
                    throw new BuildException(new StringBuffer().append("The specified loader id ").append(str).append(" does not reference a class loader").toString());
                }
                classLoader = (ClassLoader) reference;
            }
        }
        ClassLoader classLoader2 = classLoader;
        if (classLoader == null) {
            ClassLoader uniqueClassLoaderForPath = getUniqueClassLoaderForPath(project, path, z);
            classLoader2 = uniqueClassLoaderForPath;
            if (str != null) {
                classLoader2 = uniqueClassLoaderForPath;
                if (z2) {
                    project.addReference(str, uniqueClassLoaderForPath);
                    classLoader2 = uniqueClassLoaderForPath;
                }
            }
        }
        return classLoader2;
    }

    public static ClassLoader getClassLoaderForPath(Project project, Reference reference) {
        return getClassLoaderForPath(project, reference, false);
    }

    public static ClassLoader getClassLoaderForPath(Project project, Reference reference, boolean z) {
        String refId = reference.getRefId();
        Object reference2 = project.getReference(refId);
        if (!(reference2 instanceof Path)) {
            throw new BuildException(new StringBuffer().append("The specified classpathref ").append(refId).append(" does not reference a Path.").toString());
        }
        return getClassLoaderForPath(project, (Path) reference2, new StringBuffer().append(MagicNames.REFID_CLASSPATH_LOADER_PREFIX).append(refId).toString(), z);
    }

    public static Delegate getDelegate(ProjectComponent projectComponent) {
        return new Delegate(projectComponent);
    }

    public static ClassLoader getUniqueClassLoaderForPath(Project project, Path path, boolean z) {
        AntClassLoader createClassLoader = project.createClassLoader(path);
        if (z) {
            createClassLoader.setParentFirst(false);
            createClassLoader.addJavaLibraries();
        }
        return createClassLoader;
    }

    public static boolean isMagicPropertySet(Project project) {
        return project.getProperty("ant.reuse.loader") != null;
    }

    public static Object newInstance(String str, ClassLoader classLoader) {
        Class cls;
        if (class$java$lang$Object == null) {
            cls = class$("java.lang.Object");
            class$java$lang$Object = cls;
        } else {
            cls = class$java$lang$Object;
        }
        return newInstance(str, classLoader, cls);
    }

    public static Object newInstance(String str, ClassLoader classLoader, Class cls) {
        try {
            Object newInstance = Class.forName(str, true, classLoader).newInstance();
            if (cls.isInstance(newInstance)) {
                return newInstance;
            }
            throw new BuildException(new StringBuffer().append(RmicAdapterFactory.ERROR_NOT_RMIC_ADAPTER).append(str).append(" expected :").append(cls).toString());
        } catch (ClassNotFoundException e) {
            throw new BuildException(new StringBuffer().append(RmicAdapterFactory.ERROR_UNKNOWN_COMPILER).append(str).toString(), e);
        } catch (IllegalAccessException e2) {
            throw new BuildException(new StringBuffer().append("Could not instantiate ").append(str).append(". Specified class should have a ").append("public constructor.").toString(), e2);
        } catch (InstantiationException e3) {
            throw new BuildException(new StringBuffer().append("Could not instantiate ").append(str).append(". Specified class should have a no ").append("argument constructor.").toString(), e3);
        } catch (LinkageError e4) {
            throw new BuildException(new StringBuffer().append("Class ").append(str).append(" could not be loaded because of an invalid dependency.").toString(), e4);
        }
    }
}
