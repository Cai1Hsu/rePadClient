package org.apache.tools.ant.util;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.launch.Locator;

/* loaded from: classes.jar:org/apache/tools/ant/util/LoaderUtils.class */
public class LoaderUtils {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    static Class class$org$apache$tools$ant$util$LoaderUtils;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public static boolean classExists(ClassLoader classLoader, String str) {
        return classLoader.getResource(classNameToResource(str)) != null;
    }

    public static String classNameToResource(String str) {
        return new StringBuffer().append(str.replace('.', '/')).append(".class").toString();
    }

    public static File getClassSource(Class cls) {
        return normalizeSource(Locator.getClassSource(cls));
    }

    public static ClassLoader getContextClassLoader() {
        return Thread.currentThread().getContextClassLoader();
    }

    public static File getResourceSource(ClassLoader classLoader, String str) {
        Class cls;
        ClassLoader classLoader2 = classLoader;
        if (classLoader == null) {
            if (class$org$apache$tools$ant$util$LoaderUtils == null) {
                cls = class$("org.apache.tools.ant.util.LoaderUtils");
                class$org$apache$tools$ant$util$LoaderUtils = cls;
            } else {
                cls = class$org$apache$tools$ant$util$LoaderUtils;
            }
            classLoader2 = cls.getClassLoader();
        }
        return normalizeSource(Locator.getResourceSource(classLoader2, str));
    }

    public static boolean isContextLoaderAvailable() {
        return true;
    }

    private static File normalizeSource(File file) {
        File file2 = file;
        if (file != null) {
            try {
                file2 = FILE_UTILS.normalize(file.getAbsolutePath());
            } catch (BuildException e) {
                file2 = file;
            }
        }
        return file2;
    }

    public static void setContextClassLoader(ClassLoader classLoader) {
        Thread.currentThread().setContextClassLoader(classLoader);
    }
}
