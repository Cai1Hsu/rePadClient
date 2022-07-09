package org.apache.tools.ant.taskdefs.condition;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/HasMethod.class */
public class HasMethod extends ProjectComponent implements Condition {
    private String classname;
    private Path classpath;
    private String field;
    private boolean ignoreSystemClasses = false;
    private AntClassLoader loader;
    private String method;

    private boolean isFieldFound(Class cls) {
        boolean z;
        Field[] declaredFields = cls.getDeclaredFields();
        int i = 0;
        while (true) {
            if (i >= declaredFields.length) {
                z = false;
                break;
            } else if (declaredFields[i].getName().equals(this.field)) {
                z = true;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    private boolean isMethodFound(Class cls) {
        boolean z;
        Method[] declaredMethods = cls.getDeclaredMethods();
        int i = 0;
        while (true) {
            if (i >= declaredMethods.length) {
                z = false;
                break;
            } else if (declaredMethods[i].getName().equals(this.method)) {
                z = true;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    private Class loadClass(String str) {
        Class cls;
        try {
            if (this.ignoreSystemClasses) {
                this.loader = getProject().createClassLoader(this.classpath);
                this.loader.setParentFirst(false);
                this.loader.addJavaLibraries();
                try {
                    cls = this.loader.findClass(str);
                } catch (SecurityException e) {
                    throw new BuildException(new StringBuffer().append("class \"").append(str).append("\" was found but a").append(" SecurityException has been").append(" raised while loading it").toString(), e);
                }
            } else if (this.loader != null) {
                cls = this.loader.loadClass(str);
            } else {
                ClassLoader classLoader = getClass().getClassLoader();
                cls = classLoader != null ? Class.forName(str, true, classLoader) : Class.forName(str);
            }
            return cls;
        } catch (ClassNotFoundException e2) {
            throw new BuildException(new StringBuffer().append("class \"").append(str).append("\" was not found").toString());
        } catch (NoClassDefFoundError e3) {
            throw new BuildException(new StringBuffer().append("Could not load dependent class \"").append(e3.getMessage()).append("\" for class \"").append(str).append("\"").toString());
        }
    }

    public Path createClasspath() {
        if (this.classpath == null) {
            this.classpath = new Path(getProject());
        }
        return this.classpath.createPath();
    }

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        boolean z;
        if (this.classname == null) {
            throw new BuildException("No classname defined");
        }
        AntClassLoader antClassLoader = this.loader;
        try {
            Class loadClass = loadClass(this.classname);
            if (this.method != null) {
                boolean isMethodFound = isMethodFound(loadClass);
                z = isMethodFound;
                if (antClassLoader != this.loader) {
                    z = isMethodFound;
                    if (this.loader != null) {
                        this.loader.cleanup();
                        z = isMethodFound;
                        this.loader = null;
                    }
                }
                return z;
            } else if (this.field == null) {
                throw new BuildException("Neither method nor field defined");
            } else {
                boolean isFieldFound = isFieldFound(loadClass);
                z = isFieldFound;
                if (antClassLoader != this.loader) {
                    z = isFieldFound;
                    if (this.loader != null) {
                        this.loader.cleanup();
                        z = isFieldFound;
                        this.loader = null;
                    }
                }
                return z;
            }
        } catch (Throwable th) {
            if (antClassLoader != this.loader && this.loader != null) {
                this.loader.cleanup();
                this.loader = null;
            }
            throw th;
        }
    }

    public void setClassname(String str) {
        this.classname = str;
    }

    public void setClasspath(Path path) {
        createClasspath().append(path);
    }

    public void setClasspathRef(Reference reference) {
        createClasspath().setRefid(reference);
    }

    public void setField(String str) {
        this.field = str;
    }

    public void setIgnoreSystemClasses(boolean z) {
        this.ignoreSystemClasses = z;
    }

    public void setMethod(String str) {
        this.method = str;
    }
}
