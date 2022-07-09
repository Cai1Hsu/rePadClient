package org.apache.tools.ant.util.regexp;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.util.ClasspathUtils;

/* loaded from: classes.jar:org/apache/tools/ant/util/regexp/RegexpFactory.class */
public class RegexpFactory extends RegexpMatcherFactory {
    static Class class$org$apache$tools$ant$util$regexp$Regexp;
    static Class class$org$apache$tools$ant$util$regexp$RegexpFactory;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    protected Regexp createRegexpInstance(String str) throws BuildException {
        Class cls;
        Class cls2;
        if (class$org$apache$tools$ant$util$regexp$RegexpFactory == null) {
            cls = class$("org.apache.tools.ant.util.regexp.RegexpFactory");
            class$org$apache$tools$ant$util$regexp$RegexpFactory = cls;
        } else {
            cls = class$org$apache$tools$ant$util$regexp$RegexpFactory;
        }
        ClassLoader classLoader = cls.getClassLoader();
        if (class$org$apache$tools$ant$util$regexp$Regexp == null) {
            cls2 = class$("org.apache.tools.ant.util.regexp.Regexp");
            class$org$apache$tools$ant$util$regexp$Regexp = cls2;
        } else {
            cls2 = class$org$apache$tools$ant$util$regexp$Regexp;
        }
        return (Regexp) ClasspathUtils.newInstance(str, classLoader, cls2);
    }

    public Regexp newRegexp() throws BuildException {
        return newRegexp(null);
    }

    public Regexp newRegexp(Project project) throws BuildException {
        String property = project == null ? System.getProperty(MagicNames.REGEXP_IMPL) : project.getProperty(MagicNames.REGEXP_IMPL);
        return property != null ? createRegexpInstance(property) : new Jdk14RegexpRegexp();
    }
}
