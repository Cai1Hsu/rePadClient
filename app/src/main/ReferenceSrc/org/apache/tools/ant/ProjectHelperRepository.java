package org.apache.tools.ant;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Constructor;
import java.net.URL;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.util.LoaderUtils;

/* loaded from: classes.jar:org/apache/tools/ant/ProjectHelperRepository.class */
public class ProjectHelperRepository {
    private static Constructor PROJECTHELPER2_CONSTRUCTOR;
    static Class class$org$apache$tools$ant$helper$ProjectHelper2;
    private List helpers = new ArrayList();
    private static final String DEBUG_PROJECT_HELPER_REPOSITORY = "ant.project-helper-repo.debug";
    private static final boolean DEBUG = "true".equals(System.getProperty(DEBUG_PROJECT_HELPER_REPOSITORY));
    private static ProjectHelperRepository instance = new ProjectHelperRepository();
    private static final Class[] NO_CLASS = new Class[0];
    private static final Object[] NO_OBJECT = new Object[0];

    /* loaded from: classes.jar:org/apache/tools/ant/ProjectHelperRepository$ConstructingIterator.class */
    private static class ConstructingIterator implements Iterator {
        private boolean empty = false;
        private final Iterator nested;

        ConstructingIterator(Iterator it) {
            this.nested = it;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.nested.hasNext() || !this.empty;
        }

        @Override // java.util.Iterator
        public Object next() {
            Constructor constructor;
            if (this.nested.hasNext()) {
                constructor = (Constructor) this.nested.next();
            } else {
                this.empty = true;
                constructor = ProjectHelperRepository.PROJECTHELPER2_CONSTRUCTOR;
            }
            try {
                return constructor.newInstance(ProjectHelperRepository.NO_OBJECT);
            } catch (Exception e) {
                throw new BuildException(new StringBuffer().append("Failed to invoke no-arg constructor on ").append(constructor.getName()).toString());
            }
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException("remove is not supported");
        }
    }

    static {
        Class cls;
        try {
            if (class$org$apache$tools$ant$helper$ProjectHelper2 == null) {
                cls = class$("org.apache.tools.ant.helper.ProjectHelper2");
                class$org$apache$tools$ant$helper$ProjectHelper2 = cls;
            } else {
                cls = class$org$apache$tools$ant$helper$ProjectHelper2;
            }
            PROJECTHELPER2_CONSTRUCTOR = cls.getConstructor(NO_CLASS);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private ProjectHelperRepository() {
        collectProjectHelpers();
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void collectProjectHelpers() {
        registerProjectHelper(getProjectHelperBySystemProperty());
        try {
            ClassLoader contextClassLoader = LoaderUtils.getContextClassLoader();
            if (contextClassLoader != null) {
                Enumeration<URL> resources = contextClassLoader.getResources("META-INF/services/org.apache.tools.ant.ProjectHelper");
                while (resources.hasMoreElements()) {
                    registerProjectHelper(getProjectHelperByService(resources.nextElement().openStream()));
                }
            }
            InputStream systemResourceAsStream = ClassLoader.getSystemResourceAsStream("META-INF/services/org.apache.tools.ant.ProjectHelper");
            if (systemResourceAsStream == null) {
                return;
            }
            registerProjectHelper(getProjectHelperByService(systemResourceAsStream));
        } catch (Exception e) {
            System.err.println(new StringBuffer().append("Unable to load ProjectHelper from service META-INF/services/org.apache.tools.ant.ProjectHelper (").append(e.getClass().getName()).append(": ").append(e.getMessage()).append(")").toString());
            if (!DEBUG) {
                return;
            }
            e.printStackTrace(System.err);
        }
    }

    private Constructor getHelperConstructor(String str) throws BuildException {
        ClassLoader contextClassLoader = LoaderUtils.getContextClassLoader();
        Class<?> cls = null;
        if (contextClassLoader != null) {
            try {
                try {
                    cls = contextClassLoader.loadClass(str);
                } catch (Exception e) {
                    throw new BuildException(e);
                }
            } catch (ClassNotFoundException e2) {
                cls = null;
            }
        }
        Class<?> cls2 = cls;
        if (cls == null) {
            cls2 = Class.forName(str);
        }
        return cls2.getConstructor(NO_CLASS);
    }

    public static ProjectHelperRepository getInstance() {
        return instance;
    }

    private Constructor getProjectHelperByService(InputStream inputStream) {
        Constructor constructor;
        InputStreamReader inputStreamReader;
        String readLine;
        try {
            try {
                inputStreamReader = new InputStreamReader(inputStream, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                inputStreamReader = new InputStreamReader(inputStream);
            }
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
            readLine = bufferedReader.readLine();
            bufferedReader.close();
        } catch (Exception e2) {
            System.out.println(new StringBuffer().append("Unable to load ProjectHelper from service META-INF/services/org.apache.tools.ant.ProjectHelper (").append(e2.getMessage()).append(")").toString());
            if (DEBUG) {
                e2.printStackTrace(System.err);
            }
        }
        if (readLine != null && !"".equals(readLine)) {
            constructor = getHelperConstructor(readLine);
            return constructor;
        }
        constructor = null;
        return constructor;
    }

    private Constructor getProjectHelperBySystemProperty() {
        Constructor helperConstructor;
        String property = System.getProperty("org.apache.tools.ant.ProjectHelper");
        if (property != null) {
            try {
                helperConstructor = getHelperConstructor(property);
            } catch (SecurityException e) {
                System.err.println(new StringBuffer().append("Unable to load ProjectHelper class \"").append(property).append(" specified in system property ").append("org.apache.tools.ant.ProjectHelper").append(" (").append(e.getMessage()).append(")").toString());
                if (DEBUG) {
                    e.printStackTrace(System.err);
                }
            }
            return helperConstructor;
        }
        helperConstructor = null;
        return helperConstructor;
    }

    private void registerProjectHelper(Constructor constructor) {
        if (constructor == null) {
            return;
        }
        if (DEBUG) {
            System.out.println(new StringBuffer().append("ProjectHelper ").append(constructor.getClass().getName()).append(" registered.").toString());
        }
        this.helpers.add(constructor);
    }

    public Iterator getHelpers() {
        return new ConstructingIterator(this.helpers.iterator());
    }

    public ProjectHelper getProjectHelperForAntlib(Resource resource) throws BuildException {
        Iterator helpers = getHelpers();
        while (helpers.hasNext()) {
            ProjectHelper projectHelper = (ProjectHelper) helpers.next();
            if (projectHelper.canParseAntlibDescriptor(resource)) {
                if (DEBUG) {
                    System.out.println(new StringBuffer().append("ProjectHelper ").append(projectHelper.getClass().getName()).append(" selected for the antlib ").append(resource).toString());
                }
                return projectHelper;
            }
        }
        throw new RuntimeException(new StringBuffer().append("BUG: at least the ProjectHelper2 should have supported the file ").append(resource).toString());
    }

    public ProjectHelper getProjectHelperForBuildFile(Resource resource) throws BuildException {
        Iterator helpers = getHelpers();
        while (helpers.hasNext()) {
            ProjectHelper projectHelper = (ProjectHelper) helpers.next();
            if (projectHelper.canParseBuildFile(resource)) {
                if (DEBUG) {
                    System.out.println(new StringBuffer().append("ProjectHelper ").append(projectHelper.getClass().getName()).append(" selected for the build file ").append(resource).toString());
                }
                return projectHelper;
            }
        }
        throw new RuntimeException(new StringBuffer().append("BUG: at least the ProjectHelper2 should have supported the file ").append(resource).toString());
    }

    public void registerProjectHelper(Class cls) throws BuildException {
        try {
            registerProjectHelper(cls.getConstructor(NO_CLASS));
        } catch (NoSuchMethodException e) {
            throw new BuildException(new StringBuffer().append("Couldn't find no-arg constructor in ").append(cls.getName()).toString());
        }
    }

    public void registerProjectHelper(String str) throws BuildException {
        registerProjectHelper(getHelperConstructor(str));
    }
}
