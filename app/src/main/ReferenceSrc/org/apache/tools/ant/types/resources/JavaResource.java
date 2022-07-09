package org.apache.tools.ant.types.resources;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.resources.AbstractClasspathResource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/JavaResource.class */
public class JavaResource extends AbstractClasspathResource implements URLProvider {
    public JavaResource() {
    }

    public JavaResource(String str, Path path) {
        setName(str);
        setClasspath(path);
    }

    @Override // org.apache.tools.ant.types.Resource, java.lang.Comparable
    public int compareTo(Object obj) {
        int i = -1;
        if (isReference()) {
            i = ((Comparable) getCheckedRef()).compareTo(obj);
        } else if (obj.getClass().equals(getClass())) {
            JavaResource javaResource = (JavaResource) obj;
            if (!getName().equals(javaResource.getName())) {
                i = getName().compareTo(javaResource.getName());
            } else if (getLoader() == javaResource.getLoader()) {
                Path classpath = getClasspath();
                Path classpath2 = javaResource.getClasspath();
                if (classpath == classpath2) {
                    i = 0;
                } else if (classpath != null) {
                    i = classpath2 == null ? 1 : classpath.toString().compareTo(classpath2.toString());
                }
            } else if (getLoader() != null) {
                i = javaResource.getLoader() == null ? 1 : getLoader().getRefId().compareTo(javaResource.getLoader().getRefId());
            }
        } else {
            i = super.compareTo(obj);
        }
        return i;
    }

    @Override // org.apache.tools.ant.types.resources.URLProvider
    public URL getURL() {
        URL resource;
        if (isReference()) {
            resource = ((JavaResource) getCheckedRef()).getURL();
        } else {
            AbstractClasspathResource.ClassLoaderWithFlag classLoader = getClassLoader();
            if (classLoader.getLoader() == null) {
                resource = ClassLoader.getSystemResource(getName());
            } else {
                try {
                    resource = classLoader.getLoader().getResource(getName());
                } finally {
                    classLoader.cleanup();
                }
            }
        }
        return resource;
    }

    @Override // org.apache.tools.ant.types.resources.AbstractClasspathResource
    protected InputStream openInputStream(ClassLoader classLoader) throws IOException {
        InputStream inputStream;
        if (classLoader == null) {
            InputStream systemResourceAsStream = ClassLoader.getSystemResourceAsStream(getName());
            inputStream = systemResourceAsStream;
            if (systemResourceAsStream == null) {
                throw new FileNotFoundException(new StringBuffer().append("No resource ").append(getName()).append(" on Ant's classpath").toString());
            }
        } else {
            InputStream resourceAsStream = classLoader.getResourceAsStream(getName());
            inputStream = resourceAsStream;
            if (resourceAsStream == null) {
                throw new FileNotFoundException(new StringBuffer().append("No resource ").append(getName()).append(" on the classpath ").append(classLoader).toString());
            }
        }
        return inputStream;
    }
}
