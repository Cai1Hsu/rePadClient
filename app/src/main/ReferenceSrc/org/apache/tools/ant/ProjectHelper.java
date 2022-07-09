package org.apache.tools.ant;

import java.io.File;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Vector;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.util.LoaderUtils;
import org.xml.sax.AttributeList;

/* loaded from: classes.jar:org/apache/tools/ant/ProjectHelper.class */
public class ProjectHelper {
    public static final String ANTLIB_URI = "antlib:";
    public static final String ANT_CORE_URI = "antlib:org.apache.tools.ant";
    public static final String ANT_CURRENT_URI = "ant:current";
    public static final String ANT_TYPE = "ant-type";
    public static final String HELPER_PROPERTY = "org.apache.tools.ant.ProjectHelper";
    public static final String PROJECTHELPER_REFERENCE = "ant.projectHelper";
    public static final String SERVICE_ID = "META-INF/services/org.apache.tools.ant.ProjectHelper";
    private static final ThreadLocal targetPrefix = new ThreadLocal() { // from class: org.apache.tools.ant.ProjectHelper.1
        @Override // java.lang.ThreadLocal
        protected Object initialValue() {
            return null;
        }
    };
    private static final ThreadLocal prefixSeparator = new ThreadLocal() { // from class: org.apache.tools.ant.ProjectHelper.2
        @Override // java.lang.ThreadLocal
        protected Object initialValue() {
            return ".";
        }
    };
    private static final ThreadLocal inIncludeMode = new ThreadLocal() { // from class: org.apache.tools.ant.ProjectHelper.3
        @Override // java.lang.ThreadLocal
        protected Object initialValue() {
            return Boolean.FALSE;
        }
    };
    private Vector importStack = new Vector();
    private List extensionStack = new LinkedList();

    /* loaded from: classes.jar:org/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint.class */
    public static final class OnMissingExtensionPoint {
        private final String name;
        public static final OnMissingExtensionPoint FAIL = new OnMissingExtensionPoint("fail");
        public static final OnMissingExtensionPoint WARN = new OnMissingExtensionPoint("warn");
        public static final OnMissingExtensionPoint IGNORE = new OnMissingExtensionPoint(Definer.OnError.POLICY_IGNORE);
        private static final OnMissingExtensionPoint[] values = {FAIL, WARN, IGNORE};

        private OnMissingExtensionPoint(String str) {
            this.name = str;
        }

        public static OnMissingExtensionPoint valueOf(String str) {
            if (str == null) {
                throw new NullPointerException();
            }
            for (int i = 0; i < values.length; i++) {
                if (str.equals(values[i].name())) {
                    return values[i];
                }
            }
            throw new IllegalArgumentException(new StringBuffer().append("Unknown onMissingExtensionPoint ").append(str).toString());
        }

        public String name() {
            return this.name;
        }

        public String toString() {
            return this.name;
        }
    }

    public static BuildException addLocationToBuildException(BuildException buildException, Location location) {
        BuildException buildException2 = buildException;
        if (buildException.getLocation() != null) {
            if (buildException.getMessage() == null) {
                buildException2 = buildException;
            } else {
                String stringBuffer = new StringBuffer().append("The following error occurred while executing this line:").append(System.getProperty("line.separator")).append(buildException.getLocation().toString()).append(buildException.getMessage()).toString();
                buildException2 = location == null ? new BuildException(stringBuffer, buildException) : new BuildException(stringBuffer, buildException, location);
            }
        }
        return buildException2;
    }

    public static void addText(Project project, Object obj, String str) throws BuildException {
        if (str == null) {
            return;
        }
        Object obj2 = obj;
        if (obj instanceof TypeAdapter) {
            obj2 = ((TypeAdapter) obj).getProxy();
        }
        IntrospectionHelper.getHelper(project, obj2.getClass()).addText(project, obj2, str);
    }

    public static void addText(Project project, Object obj, char[] cArr, int i, int i2) throws BuildException {
        addText(project, obj, new String(cArr, i, i2));
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:13:0x006b -> B:10:0x0056). Please submit an issue!!! */
    public static void configure(Object obj, AttributeList attributeList, Project project) throws BuildException {
        Object obj2 = obj;
        if (obj instanceof TypeAdapter) {
            obj2 = ((TypeAdapter) obj).getProxy();
        }
        IntrospectionHelper helper = IntrospectionHelper.getHelper(project, obj2.getClass());
        int length = attributeList.getLength();
        for (int i = 0; i < length; i++) {
            try {
                helper.setAttribute(project, obj2, attributeList.getName(i).toLowerCase(Locale.ENGLISH), replaceProperties(project, attributeList.getValue(i), project.getProperties()));
            } catch (BuildException e) {
                if (!attributeList.getName(i).equals("id")) {
                    throw e;
                }
            }
        }
    }

    public static void configureProject(Project project, File file) throws BuildException {
        ProjectHelper projectHelperForBuildFile = ProjectHelperRepository.getInstance().getProjectHelperForBuildFile(new FileResource(file));
        project.addReference("ant.projectHelper", projectHelperForBuildFile);
        projectHelperForBuildFile.parse(project, file);
    }

    public static String extractNameFromComponentName(String str) {
        int lastIndexOf = str.lastIndexOf(58);
        if (lastIndexOf != -1) {
            str = str.substring(lastIndexOf + 1);
        }
        return str;
    }

    public static String extractUriFromComponentName(String str) {
        String substring;
        if (str == null) {
            substring = "";
        } else {
            int lastIndexOf = str.lastIndexOf(58);
            substring = lastIndexOf == -1 ? "" : str.substring(0, lastIndexOf);
        }
        return substring;
    }

    public static String genComponentName(String str, String str2) {
        String str3 = str2;
        if (str != null) {
            str3 = str2;
            if (!str.equals("")) {
                str3 = str.equals(ANT_CORE_URI) ? str2 : new StringBuffer().append(str).append(":").append(str2).toString();
            }
        }
        return str3;
    }

    public static ClassLoader getContextClassLoader() {
        return LoaderUtils.isContextLoaderAvailable() ? LoaderUtils.getContextClassLoader() : null;
    }

    public static String getCurrentPrefixSeparator() {
        return (String) prefixSeparator.get();
    }

    public static String getCurrentTargetPrefix() {
        return (String) targetPrefix.get();
    }

    public static ProjectHelper getProjectHelper() {
        return (ProjectHelper) ProjectHelperRepository.getInstance().getHelpers().next();
    }

    public static boolean isInIncludeMode() {
        return inIncludeMode.get() == Boolean.TRUE;
    }

    public static void parsePropertyString(String str, Vector vector, Vector vector2) throws BuildException {
        PropertyHelper.parsePropertyStringDefault(str, vector, vector2);
    }

    public static String replaceProperties(Project project, String str) throws BuildException {
        return project.replaceProperties(str);
    }

    public static String replaceProperties(Project project, String str, Hashtable hashtable) throws BuildException {
        return PropertyHelper.getPropertyHelper(project).replaceProperties(null, str, hashtable);
    }

    public static void setCurrentPrefixSeparator(String str) {
        prefixSeparator.set(str);
    }

    public static void setCurrentTargetPrefix(String str) {
        targetPrefix.set(str);
    }

    public static void setInIncludeMode(boolean z) {
        inIncludeMode.set(z ? Boolean.TRUE : Boolean.FALSE);
    }

    public static void storeChild(Project project, Object obj, Object obj2, String str) {
        IntrospectionHelper.getHelper(project, obj.getClass()).storeElement(project, obj, obj2, str);
    }

    public boolean canParseAntlibDescriptor(Resource resource) {
        return false;
    }

    public boolean canParseBuildFile(Resource resource) {
        return true;
    }

    public String getDefaultBuildFile() {
        return Main.DEFAULT_BUILD_FILENAME;
    }

    public List getExtensionStack() {
        return this.extensionStack;
    }

    public Vector getImportStack() {
        return this.importStack;
    }

    public void parse(Project project, Object obj) throws BuildException {
        throw new BuildException(new StringBuffer().append("ProjectHelper.parse() must be implemented in a helper plugin ").append(getClass().getName()).toString());
    }

    public UnknownElement parseAntlibDescriptor(Project project, Resource resource) {
        throw new BuildException("can't parse antlib descriptors");
    }
}
