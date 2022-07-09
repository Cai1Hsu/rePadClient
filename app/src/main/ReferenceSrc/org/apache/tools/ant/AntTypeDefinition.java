package org.apache.tools.ant;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

/* loaded from: classes.jar:org/apache/tools/ant/AntTypeDefinition.class */
public class AntTypeDefinition {
    static Class class$org$apache$tools$ant$Project;
    private Class adaptToClass;
    private Class adapterClass;
    private ClassLoader classLoader;
    private String className;
    private Class clazz;
    private String name;
    private boolean restrict = false;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private Object createAndSet(Project project, Class cls) {
        try {
            return innerCreateAndSet(cls, project);
        } catch (IllegalAccessException e) {
            throw new BuildException(new StringBuffer().append("Could not create type ").append(this.name).append(" as the constructor ").append(cls).append(" is not accessible").toString());
        } catch (InstantiationException e2) {
            throw new BuildException(new StringBuffer().append("Could not create type ").append(this.name).append(" as the class ").append(cls).append(" is abstract").toString());
        } catch (NoClassDefFoundError e3) {
            throw new BuildException(new StringBuffer().append("Type ").append(this.name).append(": A class needed by class ").append(cls).append(" cannot be found: ").append(e3.getMessage()).toString(), e3);
        } catch (NoSuchMethodException e4) {
            throw new BuildException(new StringBuffer().append("Could not create type ").append(this.name).append(" as the class ").append(cls).append(" has no compatible constructor").toString());
        } catch (InvocationTargetException e5) {
            Throwable targetException = e5.getTargetException();
            throw new BuildException(new StringBuffer().append("Could not create type ").append(this.name).append(" due to ").append(targetException).toString(), targetException);
        } catch (Throwable th) {
            throw new BuildException(new StringBuffer().append("Could not create type ").append(this.name).append(" due to ").append(th).toString(), th);
        }
    }

    private String extractClassname(Class cls) {
        return cls == null ? "<null>" : cls.getClass().getName();
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0038, code lost:
        if (r4.adaptToClass.isAssignableFrom(r0.getClass()) == false) goto L15;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private Object icreate(Project project) {
        TypeAdapter typeAdapter;
        Class typeClass = getTypeClass(project);
        if (typeClass == null) {
            typeAdapter = null;
        } else {
            Object createAndSet = createAndSet(project, typeClass);
            typeAdapter = createAndSet;
            if (createAndSet != null) {
                typeAdapter = createAndSet;
                if (this.adapterClass != null) {
                    if (this.adaptToClass != null) {
                        typeAdapter = createAndSet;
                    }
                    TypeAdapter typeAdapter2 = (TypeAdapter) createAndSet(project, this.adapterClass);
                    if (typeAdapter2 == null) {
                        typeAdapter = null;
                    } else {
                        typeAdapter2.setProxy(createAndSet);
                        typeAdapter = typeAdapter2;
                    }
                }
            }
        }
        return typeAdapter;
    }

    public void checkClass(Project project) {
        if (this.clazz == null) {
            this.clazz = getTypeClass(project);
            if (this.clazz == null) {
                throw new BuildException(new StringBuffer().append("Unable to create class for ").append(getName()).toString());
            }
        }
        if (this.adapterClass != null) {
            if (this.adaptToClass != null && this.adaptToClass.isAssignableFrom(this.clazz)) {
                return;
            }
            TypeAdapter typeAdapter = (TypeAdapter) createAndSet(project, this.adapterClass);
            if (typeAdapter == null) {
                throw new BuildException("Unable to create adapter object");
            }
            typeAdapter.checkProxyClass(this.clazz);
        }
    }

    public Object create(Project project) {
        return icreate(project);
    }

    public ClassLoader getClassLoader() {
        return this.classLoader;
    }

    public String getClassName() {
        return this.className;
    }

    public Class getExposedClass(Project project) {
        Class<?> typeClass;
        if (this.adaptToClass != null) {
            Class<?> typeClass2 = getTypeClass(project);
            typeClass = typeClass2;
            if (typeClass2 != null) {
                if (this.adaptToClass.isAssignableFrom(typeClass2)) {
                    typeClass = typeClass2;
                }
            }
            return typeClass;
        }
        typeClass = this.adapterClass == null ? getTypeClass(project) : this.adapterClass;
        return typeClass;
    }

    public String getName() {
        return this.name;
    }

    public Class getTypeClass(Project project) {
        Class cls;
        try {
            cls = innerGetTypeClass();
        } catch (ClassNotFoundException e) {
            project.log(new StringBuffer().append("Could not load class (").append(this.className).append(") for type ").append(this.name).toString(), 4);
            cls = null;
            return cls;
        } catch (NoClassDefFoundError e2) {
            project.log(new StringBuffer().append("Could not load a dependent class (").append(e2.getMessage()).append(") for type ").append(this.name).toString(), 4);
            cls = null;
            return cls;
        }
        return cls;
    }

    public Object innerCreateAndSet(Class cls, Project project) throws NoSuchMethodException, InstantiationException, IllegalAccessException, InvocationTargetException {
        Class<?> cls2;
        Constructor constructor;
        boolean z;
        try {
            constructor = cls.getConstructor(new Class[0]);
            z = true;
        } catch (NoSuchMethodException e) {
            if (class$org$apache$tools$ant$Project == null) {
                cls2 = class$("org.apache.tools.ant.Project");
                class$org$apache$tools$ant$Project = cls2;
            } else {
                cls2 = class$org$apache$tools$ant$Project;
            }
            constructor = cls.getConstructor(cls2);
            z = false;
        }
        Object newInstance = constructor.newInstance(z ? new Object[0] : new Object[]{project});
        project.setProjectReference(newInstance);
        return newInstance;
    }

    public Class innerGetTypeClass() throws ClassNotFoundException {
        Class cls;
        if (this.clazz != null) {
            cls = this.clazz;
        } else {
            if (this.classLoader == null) {
                this.clazz = Class.forName(this.className);
            } else {
                this.clazz = this.classLoader.loadClass(this.className);
            }
            cls = this.clazz;
        }
        return cls;
    }

    public boolean isRestrict() {
        return this.restrict;
    }

    public boolean sameDefinition(AntTypeDefinition antTypeDefinition, Project project) {
        return antTypeDefinition != null && antTypeDefinition.getClass() == getClass() && antTypeDefinition.getTypeClass(project).equals(getTypeClass(project)) && antTypeDefinition.getExposedClass(project).equals(getExposedClass(project)) && antTypeDefinition.restrict == this.restrict && antTypeDefinition.adapterClass == this.adapterClass && antTypeDefinition.adaptToClass == this.adaptToClass;
    }

    public void setAdaptToClass(Class cls) {
        this.adaptToClass = cls;
    }

    public void setAdapterClass(Class cls) {
        this.adapterClass = cls;
    }

    public void setClass(Class cls) {
        this.clazz = cls;
        if (cls == null) {
            return;
        }
        this.classLoader = this.classLoader == null ? cls.getClassLoader() : this.classLoader;
        this.className = this.className == null ? cls.getName() : this.className;
    }

    public void setClassLoader(ClassLoader classLoader) {
        this.classLoader = classLoader;
    }

    public void setClassName(String str) {
        this.className = str;
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setRestrict(boolean z) {
        this.restrict = z;
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x00a2, code lost:
        if (((org.apache.tools.ant.AntClassLoader) r0).getClasspath().equals(((org.apache.tools.ant.AntClassLoader) r0).getClasspath()) != false) goto L25;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean similarDefinition(AntTypeDefinition antTypeDefinition, Project project) {
        boolean z = false;
        if (antTypeDefinition != null) {
            z = false;
            if (getClass() == antTypeDefinition.getClass()) {
                z = false;
                if (getClassName().equals(antTypeDefinition.getClassName())) {
                    z = false;
                    if (extractClassname(this.adapterClass).equals(extractClassname(antTypeDefinition.adapterClass))) {
                        z = false;
                        if (extractClassname(this.adaptToClass).equals(extractClassname(antTypeDefinition.adaptToClass))) {
                            if (this.restrict != antTypeDefinition.restrict) {
                                z = false;
                            } else {
                                ClassLoader classLoader = antTypeDefinition.getClassLoader();
                                ClassLoader classLoader2 = getClassLoader();
                                if (classLoader != classLoader2) {
                                    z = false;
                                    if (classLoader instanceof AntClassLoader) {
                                        z = false;
                                        if (classLoader2 instanceof AntClassLoader) {
                                            z = false;
                                        }
                                    }
                                }
                                z = true;
                            }
                        }
                    }
                }
            }
        }
        return z;
    }
}
