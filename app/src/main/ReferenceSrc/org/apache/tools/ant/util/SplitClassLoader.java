package org.apache.tools.ant.util;

import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Path;

/* loaded from: classes.jar:org/apache/tools/ant/util/SplitClassLoader.class */
public final class SplitClassLoader extends AntClassLoader {
    private final String[] splitClasses;

    public SplitClassLoader(ClassLoader classLoader, Path path, Project project, String[] strArr) {
        super(classLoader, project, path, true);
        this.splitClasses = strArr;
    }

    private boolean isSplit(String str) {
        boolean z;
        String substring = str.substring(str.lastIndexOf(46) + 1);
        for (int i = 0; i < this.splitClasses.length; i++) {
            if (substring.equals(this.splitClasses[i]) || substring.startsWith(new StringBuffer().append(this.splitClasses[i]).append('$').toString())) {
                z = true;
                break;
            }
        }
        z = false;
        return z;
    }

    @Override // org.apache.tools.ant.AntClassLoader, java.lang.ClassLoader
    protected Class loadClass(String str, boolean z) throws ClassNotFoundException {
        Class loadClass;
        synchronized (this) {
            Class findLoadedClass = findLoadedClass(str);
            if (findLoadedClass != null) {
                loadClass = findLoadedClass;
            } else if (isSplit(str)) {
                loadClass = findClass(str);
                if (z) {
                    resolveClass(loadClass);
                }
            } else {
                loadClass = super.loadClass(str, z);
            }
        }
        return loadClass;
    }
}
