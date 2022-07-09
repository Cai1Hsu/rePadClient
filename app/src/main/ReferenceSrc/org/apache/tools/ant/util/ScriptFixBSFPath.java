package org.apache.tools.ant.util;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/util/ScriptFixBSFPath.class */
public class ScriptFixBSFPath {
    private static final String[] BSF_LANGUAGES = {"js", "org.mozilla.javascript.Scriptable", "javascript", "org.mozilla.javascript.Scriptable", "jacl", "tcl.lang.Interp", "netrexx", "netrexx.lang.Rexx", "nrx", "netrexx.lang.Rexx", "jython", "org.python.core.Py", "py", "org.python.core.Py", "xslt", "org.apache.xpath.objects.XObject"};
    private static final Map BSF_LANGUAGE_MAP = new HashMap();
    private static final String BSF_MANAGER = "org.apache.bsf.BSFManager";
    private static final String BSF_PACKAGE = "org.apache.bsf";
    private static final String BSF_SCRIPT_RUNNER = "org.apache.tools.ant.util.optional.ScriptRunner";
    private static final String UTIL_OPTIONAL_PACKAGE = "org.apache.tools.ant.util.optional";

    static {
        for (int i = 0; i < BSF_LANGUAGES.length; i += 2) {
            BSF_LANGUAGE_MAP.put(BSF_LANGUAGES[i], BSF_LANGUAGES[i + 1]);
        }
    }

    private File getClassSource(ClassLoader classLoader, String str) {
        return LoaderUtils.getResourceSource(classLoader, LoaderUtils.classNameToResource(str));
    }

    private File getClassSource(String str) {
        return getClassSource(getClass().getClassLoader(), str);
    }

    public void fixClassLoader(ClassLoader classLoader, String str) {
        if (classLoader == getClass().getClassLoader() || !(classLoader instanceof AntClassLoader)) {
            return;
        }
        ClassLoader classLoader2 = getClass().getClassLoader();
        AntClassLoader antClassLoader = (AntClassLoader) classLoader;
        File classSource = getClassSource(BSF_MANAGER);
        boolean z = classSource == null;
        String str2 = (String) BSF_LANGUAGE_MAP.get(str);
        boolean z2 = classSource != null && str2 != null && !LoaderUtils.classExists(classLoader2, str2) && LoaderUtils.classExists(classLoader, str2);
        boolean z3 = z || z2;
        File file = classSource;
        if (classSource == null) {
            file = getClassSource(classLoader, BSF_MANAGER);
        }
        if (file == null) {
            throw new BuildException("Unable to find BSF classes for scripting");
        }
        if (z2) {
            antClassLoader.addPathComponent(file);
            antClassLoader.addLoaderPackageRoot(BSF_PACKAGE);
        }
        if (!z3) {
            return;
        }
        antClassLoader.addPathComponent(LoaderUtils.getResourceSource(antClassLoader, LoaderUtils.classNameToResource(BSF_SCRIPT_RUNNER)));
        antClassLoader.addLoaderPackageRoot(UTIL_OPTIONAL_PACKAGE);
    }
}
