package org.apache.tools.ant.util.regexp;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.util.ClasspathUtils;

/* loaded from: classes.jar:org/apache/tools/ant/util/regexp/RegexpMatcherFactory.class */
public class RegexpMatcherFactory {
    static Class class$org$apache$tools$ant$util$regexp$RegexpMatcher;
    static Class class$org$apache$tools$ant$util$regexp$RegexpMatcherFactory;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public static boolean regexpMatcherPresent(Project project) {
        boolean z;
        try {
            new RegexpMatcherFactory().newRegexpMatcher(project);
            z = true;
        } catch (Throwable th) {
            z = false;
        }
        return z;
    }

    protected RegexpMatcher createInstance(String str) throws BuildException {
        Class cls;
        Class cls2;
        if (class$org$apache$tools$ant$util$regexp$RegexpMatcherFactory == null) {
            cls = class$("org.apache.tools.ant.util.regexp.RegexpMatcherFactory");
            class$org$apache$tools$ant$util$regexp$RegexpMatcherFactory = cls;
        } else {
            cls = class$org$apache$tools$ant$util$regexp$RegexpMatcherFactory;
        }
        ClassLoader classLoader = cls.getClassLoader();
        if (class$org$apache$tools$ant$util$regexp$RegexpMatcher == null) {
            cls2 = class$("org.apache.tools.ant.util.regexp.RegexpMatcher");
            class$org$apache$tools$ant$util$regexp$RegexpMatcher = cls2;
        } else {
            cls2 = class$org$apache$tools$ant$util$regexp$RegexpMatcher;
        }
        return (RegexpMatcher) ClasspathUtils.newInstance(str, classLoader, cls2);
    }

    public RegexpMatcher newRegexpMatcher() throws BuildException {
        return newRegexpMatcher(null);
    }

    public RegexpMatcher newRegexpMatcher(Project project) throws BuildException {
        String property = project == null ? System.getProperty(MagicNames.REGEXP_IMPL) : project.getProperty(MagicNames.REGEXP_IMPL);
        return property != null ? createInstance(property) : new Jdk14RegexpMatcher();
    }

    protected void testAvailability(String str) throws BuildException {
        try {
            Class.forName(str);
        } catch (Throwable th) {
            throw new BuildException(th);
        }
    }
}
