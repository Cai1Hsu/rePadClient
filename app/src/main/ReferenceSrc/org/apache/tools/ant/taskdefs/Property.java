package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.PropertyHelper;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.property.ResolvePropertyMap;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Property.class */
public class Property extends Task {
    static Class class$java$io$InputStream;
    private File basedir;
    protected Path classpath;
    protected String env;
    private Project fallback;
    protected File file;
    protected String name;
    protected String prefix;
    private boolean prefixValues;
    protected Reference ref;
    private boolean relative;
    protected String resource;
    private Object untypedValue;
    protected URL url;
    protected boolean userProperty;
    protected String value;
    private boolean valueAttributeUsed;

    public Property() {
        this(false);
    }

    protected Property(boolean z) {
        this(z, null);
    }

    protected Property(boolean z, Project project) {
        this.valueAttributeUsed = false;
        this.relative = false;
        this.prefixValues = false;
        this.userProperty = z;
        this.fallback = project;
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void internalSetValue(Object obj) {
        this.untypedValue = obj;
        this.value = obj == null ? null : obj.toString();
    }

    private void loadProperties(Properties properties, InputStream inputStream, boolean z) throws IOException {
        Class<?> cls;
        if (!z) {
            properties.load(inputStream);
            return;
        }
        try {
            Class<?> cls2 = properties.getClass();
            if (class$java$io$InputStream == null) {
                cls = class$("java.io.InputStream");
                class$java$io$InputStream = cls;
            } else {
                cls = class$java$io$InputStream;
            }
            cls2.getMethod("loadFromXML", cls).invoke(properties, inputStream);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
            log("Can not load xml based property definition on Java < 5");
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

    private void resolveAllProperties(Map map) throws BuildException {
        PropertyHelper propertyHelper = PropertyHelper.getPropertyHelper(getProject());
        new ResolvePropertyMap(getProject(), propertyHelper, propertyHelper.getExpanders()).resolveAllProperties(map, getPrefix(), getPrefixValues());
    }

    protected void addProperties(Properties properties) {
        HashMap hashMap = new HashMap(properties);
        resolveAllProperties(hashMap);
        for (Object obj : hashMap.keySet()) {
            if (obj instanceof String) {
                String str = (String) obj;
                String str2 = str;
                if (this.prefix != null) {
                    str2 = new StringBuffer().append(this.prefix).append(str).toString();
                }
                addProperty(str2, hashMap.get(obj));
            }
        }
    }

    protected void addProperty(String str, Object obj) {
        PropertyHelper propertyHelper = PropertyHelper.getPropertyHelper(getProject());
        if (!this.userProperty) {
            propertyHelper.setNewProperty(str, obj);
        } else if (propertyHelper.getUserProperty(str) == null) {
            propertyHelper.setInheritedProperty(str, obj);
        } else {
            log(new StringBuffer().append("Override ignored for ").append(str).toString(), 3);
        }
    }

    protected void addProperty(String str, String str2) {
        addProperty(str, (Object) str2);
    }

    public void addText(String str) {
        if (this.valueAttributeUsed) {
            if (str.trim().length() <= 0) {
                return;
            }
            throw new BuildException("can't combine nested text with value attribute");
        }
        String replaceProperties = getProject().replaceProperties(str);
        String value = getValue();
        String str2 = replaceProperties;
        if (value != null) {
            str2 = new StringBuffer().append(value).append(replaceProperties).toString();
        }
        internalSetValue(str2);
    }

    public Path createClasspath() {
        if (this.classpath == null) {
            this.classpath = new Path(getProject());
        }
        return this.classpath.createPath();
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (getProject() == null) {
            throw new IllegalStateException("project has not been set");
        }
        if (this.name != null) {
            if (this.untypedValue == null && this.ref == null) {
                throw new BuildException("You must specify value, location or refid with the name attribute", getLocation());
            }
        } else if (this.url == null && this.file == null && this.resource == null && this.env == null) {
            throw new BuildException("You must specify url, file, resource or environment when not using the name attribute", getLocation());
        }
        if (this.url == null && this.file == null && this.resource == null && this.prefix != null) {
            throw new BuildException("Prefix is only valid when loading from a url, file or resource", getLocation());
        }
        if (this.name != null && this.untypedValue != null) {
            if (this.relative) {
                try {
                    addProperty(this.name, FileUtils.getRelativePath(this.basedir != null ? this.basedir : getProject().getBaseDir(), this.untypedValue instanceof File ? (File) this.untypedValue : new File(this.untypedValue.toString())).replace('/', File.separatorChar));
                } catch (Exception e) {
                    throw new BuildException(e, getLocation());
                }
            } else {
                addProperty(this.name, this.untypedValue);
            }
        }
        if (this.file != null) {
            loadFile(this.file);
        }
        if (this.url != null) {
            loadUrl(this.url);
        }
        if (this.resource != null) {
            loadResource(this.resource);
        }
        if (this.env != null) {
            loadEnvironment(this.env);
        }
        if (this.name == null || this.ref == null) {
            return;
        }
        try {
            addProperty(this.name, this.ref.getReferencedObject(getProject()).toString());
        } catch (BuildException e2) {
            if (this.fallback == null) {
                throw e2;
            }
            addProperty(this.name, this.ref.getReferencedObject(this.fallback).toString());
        }
    }

    public Path getClasspath() {
        return this.classpath;
    }

    public String getEnvironment() {
        return this.env;
    }

    public File getFile() {
        return this.file;
    }

    public String getName() {
        return this.name;
    }

    public String getPrefix() {
        return this.prefix;
    }

    public boolean getPrefixValues() {
        return this.prefixValues;
    }

    public Reference getRefid() {
        return this.ref;
    }

    public String getResource() {
        return this.resource;
    }

    public URL getUrl() {
        return this.url;
    }

    public String getValue() {
        return this.value;
    }

    protected void loadEnvironment(String str) {
        Properties properties = new Properties();
        String str2 = str;
        if (!str.endsWith(".")) {
            str2 = new StringBuffer().append(str).append(".").toString();
        }
        log(new StringBuffer().append("Loading Environment ").append(str2).toString(), 3);
        for (Map.Entry entry : Execute.getEnvironmentVariables().entrySet()) {
            properties.put(new StringBuffer().append(str2).append(entry.getKey()).toString(), entry.getValue());
        }
        addProperties(properties);
    }

    protected void loadFile(File file) throws BuildException {
        Throwable th;
        Properties properties = new Properties();
        log(new StringBuffer().append("Loading ").append(file.getAbsolutePath()).toString(), 3);
        try {
            if (!file.exists()) {
                log(new StringBuffer().append("Unable to find property file: ").append(file.getAbsolutePath()).toString(), 3);
                return;
            }
            FileInputStream fileInputStream = null;
            try {
                FileInputStream fileInputStream2 = new FileInputStream(file);
                try {
                    loadProperties(properties, fileInputStream2, file.getName().endsWith(".xml"));
                    FileUtils.close(fileInputStream2);
                    addProperties(properties);
                } catch (Throwable th2) {
                    th = th2;
                    fileInputStream = fileInputStream2;
                    FileUtils.close(fileInputStream);
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (IOException e) {
            throw new BuildException(e, getLocation());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v44, types: [java.lang.ClassLoader] */
    protected void loadResource(String str) {
        AntClassLoader classLoader;
        Properties properties = new Properties();
        log(new StringBuffer().append("Resource Loading ").append(str).toString(), 3);
        InputStream inputStream = null;
        boolean z = false;
        try {
            try {
                if (this.classpath != null) {
                    z = true;
                    classLoader = getProject().createClassLoader(this.classpath);
                } else {
                    classLoader = getClass().getClassLoader();
                }
                InputStream systemResourceAsStream = classLoader == null ? ClassLoader.getSystemResourceAsStream(str) : classLoader.getResourceAsStream(str);
                if (systemResourceAsStream != null) {
                    loadProperties(properties, systemResourceAsStream, str.endsWith(".xml"));
                    AntClassLoader antClassLoader = classLoader;
                    addProperties(properties);
                } else {
                    AntClassLoader antClassLoader2 = classLoader;
                    AntClassLoader antClassLoader3 = classLoader;
                    log(new StringBuffer().append("Unable to find resource ").append(str).toString(), 1);
                }
                if (systemResourceAsStream != null) {
                    try {
                        systemResourceAsStream.close();
                    } catch (IOException e) {
                    }
                }
                if (!z || classLoader == null) {
                    return;
                }
                classLoader.cleanup();
            } catch (IOException e2) {
                throw new BuildException(e2, getLocation());
            }
        } catch (Throwable th) {
            if (0 != 0) {
                try {
                    inputStream.close();
                } catch (IOException e3) {
                }
            }
            if (0 != 0 && 0 != 0) {
                null.cleanup();
            }
            throw th;
        }
    }

    protected void loadUrl(URL url) throws BuildException {
        Properties properties = new Properties();
        log(new StringBuffer().append("Loading ").append(url).toString(), 3);
        try {
            InputStream openStream = url.openStream();
            loadProperties(properties, openStream, url.getFile().endsWith(".xml"));
            if (openStream != null) {
                openStream.close();
            }
            addProperties(properties);
        } catch (IOException e) {
            throw new BuildException(e, getLocation());
        }
    }

    public void setBasedir(File file) {
        this.basedir = file;
    }

    public void setClasspath(Path path) {
        if (this.classpath == null) {
            this.classpath = path;
        } else {
            this.classpath.append(path);
        }
    }

    public void setClasspathRef(Reference reference) {
        createClasspath().setRefid(reference);
    }

    public void setEnvironment(String str) {
        this.env = str;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setLocation(File file) {
        if (this.relative) {
            internalSetValue(file);
        } else {
            setValue(file.getAbsolutePath());
        }
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setPrefix(String str) {
        this.prefix = str;
        if (str == null || str.endsWith(".")) {
            return;
        }
        this.prefix = new StringBuffer().append(this.prefix).append(".").toString();
    }

    public void setPrefixValues(boolean z) {
        this.prefixValues = z;
    }

    public void setRefid(Reference reference) {
        this.ref = reference;
    }

    public void setRelative(boolean z) {
        this.relative = z;
    }

    public void setResource(String str) {
        this.resource = str;
    }

    public void setUrl(URL url) {
        this.url = url;
    }

    public void setUserProperty(boolean z) {
        log("DEPRECATED: Ignoring request to set user property in Property task.", 1);
    }

    public void setValue(Object obj) {
        this.valueAttributeUsed = true;
        internalSetValue(obj);
    }

    public void setValue(String str) {
        setValue((Object) str);
    }

    public String toString() {
        return this.value == null ? "" : this.value;
    }
}
