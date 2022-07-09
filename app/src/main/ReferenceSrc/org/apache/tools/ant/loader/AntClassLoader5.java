package org.apache.tools.ant.loader;

import java.io.Closeable;
import java.io.IOException;
import java.util.Enumeration;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Path;

/* loaded from: classes.jar:org/apache/tools/ant/loader/AntClassLoader5.class */
public class AntClassLoader5 extends AntClassLoader implements Closeable {
    public AntClassLoader5(ClassLoader classLoader, Project project, Path path, boolean z) {
        super(classLoader, project, path, z);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        cleanup();
    }

    @Override // java.lang.ClassLoader
    public Enumeration getResources(String str) throws IOException {
        return getNamedResources(str);
    }
}
