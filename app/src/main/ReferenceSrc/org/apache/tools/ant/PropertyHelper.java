package org.apache.tools.ant;

import java.text.ParsePosition;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.Vector;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.tools.ant.property.GetProperty;
import org.apache.tools.ant.property.NullReturn;
import org.apache.tools.ant.property.ParseNextProperty;
import org.apache.tools.ant.property.ParseProperties;
import org.apache.tools.ant.property.PropertyExpander;

/* loaded from: classes.jar:org/apache/tools/ant/PropertyHelper.class */
public class PropertyHelper implements GetProperty {
    static Class class$org$apache$tools$ant$PropertyHelper$Delegate;
    static Class class$org$apache$tools$ant$PropertyHelper$PropertyEvaluator;
    static Class class$org$apache$tools$ant$PropertyHelper$PropertySetter;
    static Class class$org$apache$tools$ant$property$PropertyExpander;
    private PropertyHelper next;
    private Project project;
    private static final PropertyEvaluator TO_STRING = new PropertyEvaluator() { // from class: org.apache.tools.ant.PropertyHelper.1
        private final String PREFIX = "toString:";
        private final int PREFIX_LEN = "toString:".length();

        @Override // org.apache.tools.ant.PropertyHelper.PropertyEvaluator
        public Object evaluate(String str, PropertyHelper propertyHelper) {
            Object obj = null;
            if (str.startsWith("toString:")) {
                obj = null;
                if (propertyHelper.getProject() != null) {
                    obj = propertyHelper.getProject().getReference(str.substring(this.PREFIX_LEN));
                }
            }
            return obj == null ? null : obj.toString();
        }
    };
    private static final PropertyExpander DEFAULT_EXPANDER = new PropertyExpander() { // from class: org.apache.tools.ant.PropertyHelper.2
        @Override // org.apache.tools.ant.property.PropertyExpander
        public String parsePropertyName(String str, ParsePosition parsePosition, ParseNextProperty parseNextProperty) {
            String str2;
            int index = parsePosition.getIndex();
            if (str.length() - index >= 3 && '$' == str.charAt(index) && '{' == str.charAt(index + 1)) {
                int i = index + 2;
                int indexOf = str.indexOf(FTPReply.DATA_CONNECTION_ALREADY_OPEN, i);
                if (indexOf < 0) {
                    throw new BuildException(new StringBuffer().append("Syntax error in property: ").append(str.substring(index)).toString());
                }
                parsePosition.setIndex(indexOf + 1);
                str2 = i == indexOf ? "" : str.substring(i, indexOf);
            } else {
                str2 = null;
            }
            return str2;
        }
    };
    private static final PropertyExpander SKIP_DOUBLE_DOLLAR = new PropertyExpander() { // from class: org.apache.tools.ant.PropertyHelper.3
        @Override // org.apache.tools.ant.property.PropertyExpander
        public String parsePropertyName(String str, ParsePosition parsePosition, ParseNextProperty parseNextProperty) {
            int index = parsePosition.getIndex();
            if (str.length() - index < 2 || '$' != str.charAt(index)) {
                return null;
            }
            int i = index + 1;
            if ('$' != str.charAt(i)) {
                return null;
            }
            parsePosition.setIndex(i);
            return null;
        }
    };
    private static final PropertyEvaluator FROM_REF = new PropertyEvaluator() { // from class: org.apache.tools.ant.PropertyHelper.4
        private final String PREFIX = "ant.refid:";
        private final int PREFIX_LEN = "ant.refid:".length();

        @Override // org.apache.tools.ant.PropertyHelper.PropertyEvaluator
        public Object evaluate(String str, PropertyHelper propertyHelper) {
            return (!str.startsWith("ant.refid:") || propertyHelper.getProject() == null) ? null : propertyHelper.getProject().getReference(str.substring(this.PREFIX_LEN));
        }
    };
    private Hashtable delegates = new Hashtable();
    private Hashtable properties = new Hashtable();
    private Hashtable userProperties = new Hashtable();
    private Hashtable inheritedProperties = new Hashtable();

    /* loaded from: classes.jar:org/apache/tools/ant/PropertyHelper$Delegate.class */
    public interface Delegate {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/PropertyHelper$PropertyEvaluator.class */
    public interface PropertyEvaluator extends Delegate {
        Object evaluate(String str, PropertyHelper propertyHelper);
    }

    /* loaded from: classes.jar:org/apache/tools/ant/PropertyHelper$PropertySetter.class */
    public interface PropertySetter extends Delegate {
        boolean set(String str, Object obj, PropertyHelper propertyHelper);

        boolean setNew(String str, Object obj, PropertyHelper propertyHelper);
    }

    protected PropertyHelper() {
        add(FROM_REF);
        add(TO_STRING);
        add(SKIP_DOUBLE_DOLLAR);
        add(DEFAULT_EXPANDER);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private boolean evalAsBooleanOrPropertyName(Object obj) {
        Boolean bool = toBoolean(obj);
        return bool != null ? bool.booleanValue() : getProperty(String.valueOf(obj)) != null;
    }

    protected static Set getDelegateInterfaces(Delegate delegate) {
        Class cls;
        Class cls2;
        HashSet hashSet = new HashSet();
        Class<?> cls3 = delegate.getClass();
        while (true) {
            Class<?> cls4 = cls3;
            if (cls4 == null) {
                break;
            }
            Class<?>[] interfaces = cls4.getInterfaces();
            for (int i = 0; i < interfaces.length; i++) {
                if (class$org$apache$tools$ant$PropertyHelper$Delegate == null) {
                    cls2 = class$("org.apache.tools.ant.PropertyHelper$Delegate");
                    class$org$apache$tools$ant$PropertyHelper$Delegate = cls2;
                } else {
                    cls2 = class$org$apache$tools$ant$PropertyHelper$Delegate;
                }
                if (cls2.isAssignableFrom(interfaces[i])) {
                    hashSet.add(interfaces[i]);
                }
            }
            cls3 = cls4.getSuperclass();
        }
        if (class$org$apache$tools$ant$PropertyHelper$Delegate == null) {
            cls = class$("org.apache.tools.ant.PropertyHelper$Delegate");
            class$org$apache$tools$ant$PropertyHelper$Delegate = cls;
        } else {
            cls = class$org$apache$tools$ant$PropertyHelper$Delegate;
        }
        hashSet.remove(cls);
        return hashSet;
    }

    public static Object getProperty(Project project, String str) {
        return getPropertyHelper(project).getProperty(str);
    }

    public static PropertyHelper getPropertyHelper(Project project) {
        PropertyHelper propertyHelper;
        Throwable th;
        synchronized (PropertyHelper.class) {
            if (project != null) {
                try {
                    propertyHelper = (PropertyHelper) project.getReference(MagicNames.REFID_PROPERTY_HELPER);
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            } else {
                propertyHelper = null;
            }
            if (propertyHelper == null) {
                try {
                    propertyHelper = new PropertyHelper();
                    propertyHelper.setProject(project);
                    if (project != null) {
                        project.addReference(MagicNames.REFID_PROPERTY_HELPER, propertyHelper);
                    }
                } catch (Throwable th3) {
                    th = th3;
                    throw th;
                }
            }
            return propertyHelper;
        }
    }

    private static boolean nullOrEmpty(Object obj) {
        return obj == null || "".equals(obj);
    }

    static void parsePropertyStringDefault(String str, Vector vector, Vector vector2) throws BuildException {
        int i = 0;
        while (true) {
            int indexOf = str.indexOf("$", i);
            if (indexOf < 0) {
                if (i >= str.length()) {
                    return;
                }
                vector.addElement(str.substring(i));
                return;
            }
            if (indexOf > 0) {
                vector.addElement(str.substring(i, indexOf));
            }
            if (indexOf == str.length() - 1) {
                vector.addElement("$");
                i = indexOf + 1;
            } else if (str.charAt(indexOf + 1) == '{') {
                int indexOf2 = str.indexOf(FTPReply.DATA_CONNECTION_ALREADY_OPEN, indexOf);
                if (indexOf2 < 0) {
                    throw new BuildException(new StringBuffer().append("Syntax error in property: ").append(str).toString());
                }
                String substring = str.substring(indexOf + 2, indexOf2);
                vector.addElement(null);
                vector2.addElement(substring);
                i = indexOf2 + 1;
            } else if (str.charAt(indexOf + 1) == '$') {
                vector.addElement("$");
                i = indexOf + 2;
            } else {
                vector.addElement(str.substring(indexOf, indexOf + 2));
                i = indexOf + 2;
            }
        }
    }

    public static void setNewProperty(Project project, String str, Object obj) {
        getPropertyHelper(project).setNewProperty(str, obj);
    }

    public static void setProperty(Project project, String str, Object obj) {
        getPropertyHelper(project).setProperty(str, obj, true);
    }

    public static Boolean toBoolean(Object obj) {
        Boolean bool;
        if (obj instanceof Boolean) {
            bool = (Boolean) obj;
        } else {
            if (obj instanceof String) {
                String str = (String) obj;
                if (Project.toBoolean(str)) {
                    bool = Boolean.TRUE;
                } else if ("off".equalsIgnoreCase(str) || "false".equalsIgnoreCase(str) || "no".equalsIgnoreCase(str)) {
                    bool = Boolean.FALSE;
                }
            }
            bool = null;
        }
        return bool;
    }

    public void add(Delegate delegate) {
        ArrayList arrayList;
        synchronized (this.delegates) {
            for (Object obj : getDelegateInterfaces(delegate)) {
                List list = (List) this.delegates.get(obj);
                if (list == null) {
                    arrayList = new ArrayList();
                } else {
                    arrayList = new ArrayList(list);
                    arrayList.remove(delegate);
                }
                arrayList.add(0, delegate);
                this.delegates.put(obj, Collections.unmodifiableList(arrayList));
            }
        }
    }

    public boolean containsProperties(String str) {
        return new ParseProperties(getProject(), getExpanders(), this).containsProperties(str);
    }

    public void copyInheritedProperties(Project project) {
        synchronized (this.inheritedProperties) {
            Enumeration keys = this.inheritedProperties.keys();
            while (keys.hasMoreElements()) {
                String obj = keys.nextElement().toString();
                if (project.getUserProperty(obj) == null) {
                    project.setInheritedProperty(obj, this.inheritedProperties.get(obj).toString());
                }
            }
        }
    }

    public void copyUserProperties(Project project) {
        synchronized (this.userProperties) {
            Enumeration keys = this.userProperties.keys();
            while (keys.hasMoreElements()) {
                Object nextElement = keys.nextElement();
                if (!this.inheritedProperties.containsKey(nextElement)) {
                    project.setUserProperty(nextElement.toString(), this.userProperties.get(nextElement).toString());
                }
            }
        }
    }

    protected List getDelegates(Class cls) {
        List list = (List) this.delegates.get(cls);
        List list2 = list;
        if (list == null) {
            list2 = Collections.EMPTY_LIST;
        }
        return list2;
    }

    public Collection getExpanders() {
        Class cls;
        if (class$org$apache$tools$ant$property$PropertyExpander == null) {
            cls = class$("org.apache.tools.ant.property.PropertyExpander");
            class$org$apache$tools$ant$property$PropertyExpander = cls;
        } else {
            cls = class$org$apache$tools$ant$property$PropertyExpander;
        }
        return getDelegates(cls);
    }

    public Hashtable getInheritedProperties() {
        Hashtable hashtable;
        synchronized (this.inheritedProperties) {
            hashtable = new Hashtable(this.inheritedProperties);
        }
        return hashtable;
    }

    protected Hashtable getInternalInheritedProperties() {
        return this.inheritedProperties;
    }

    protected Hashtable getInternalProperties() {
        return this.properties;
    }

    protected Hashtable getInternalUserProperties() {
        return this.userProperties;
    }

    public PropertyHelper getNext() {
        return this.next;
    }

    public Project getProject() {
        return this.project;
    }

    public Hashtable getProperties() {
        Hashtable hashtable;
        synchronized (this.properties) {
            hashtable = new Hashtable(this.properties);
        }
        return hashtable;
    }

    @Override // org.apache.tools.ant.property.GetProperty
    public Object getProperty(String str) {
        Class cls;
        Object obj;
        if (str != null) {
            if (class$org$apache$tools$ant$PropertyHelper$PropertyEvaluator == null) {
                cls = class$("org.apache.tools.ant.PropertyHelper$PropertyEvaluator");
                class$org$apache$tools$ant$PropertyHelper$PropertyEvaluator = cls;
            } else {
                cls = class$org$apache$tools$ant$PropertyHelper$PropertyEvaluator;
            }
            Iterator it = getDelegates(cls).iterator();
            while (true) {
                if (!it.hasNext()) {
                    obj = this.properties.get(str);
                    break;
                }
                Object evaluate = ((PropertyEvaluator) it.next()).evaluate(str, this);
                if (evaluate != null) {
                    obj = evaluate;
                    if (evaluate instanceof NullReturn) {
                        obj = null;
                    }
                }
            }
        } else {
            obj = null;
        }
        return obj;
    }

    public Object getProperty(String str, String str2) {
        return getProperty(str2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:5:0x0016, code lost:
        if (r6 != null) goto L6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object getPropertyHook(String str, String str2, boolean z) {
        String str3;
        if (getNext() != null) {
            str3 = getNext().getPropertyHook(str, str2, z);
        }
        str3 = null;
        if (this.project != null) {
            str3 = null;
            if (str2.startsWith("toString:")) {
                Object reference = this.project.getReference(str2.substring("toString:".length()));
                str3 = null;
                if (reference != null) {
                    str3 = reference.toString();
                }
            }
        }
        return str3;
    }

    public Hashtable getUserProperties() {
        Hashtable hashtable;
        synchronized (this.userProperties) {
            hashtable = new Hashtable(this.userProperties);
        }
        return hashtable;
    }

    public Object getUserProperty(String str) {
        return str == null ? null : this.userProperties.get(str);
    }

    public Object getUserProperty(String str, String str2) {
        return getUserProperty(str2);
    }

    public Object parseProperties(String str) throws BuildException {
        return new ParseProperties(getProject(), getExpanders(), this).parseProperties(str);
    }

    public void parsePropertyString(String str, Vector vector, Vector vector2) throws BuildException {
        parsePropertyStringDefault(str, vector, vector2);
    }

    public String replaceProperties(String str) throws BuildException {
        Object parseProperties = parseProperties(str);
        return (parseProperties == null || (parseProperties instanceof String)) ? (String) parseProperties : parseProperties.toString();
    }

    public String replaceProperties(String str, String str2, Hashtable hashtable) throws BuildException {
        return replaceProperties(str2);
    }

    public void setInheritedProperty(String str, Object obj) {
        if (this.project != null) {
            this.project.log(new StringBuffer().append("Setting ro project property: ").append(str).append(" -> ").append(obj).toString(), 4);
        }
        synchronized (this) {
            this.inheritedProperties.put(str, obj);
            this.userProperties.put(str, obj);
            this.properties.put(str, obj);
        }
    }

    public void setInheritedProperty(String str, String str2, Object obj) {
        setInheritedProperty(str2, obj);
    }

    public void setNewProperty(String str, Object obj) {
        Class cls;
        if (class$org$apache$tools$ant$PropertyHelper$PropertySetter == null) {
            cls = class$("org.apache.tools.ant.PropertyHelper$PropertySetter");
            class$org$apache$tools$ant$PropertyHelper$PropertySetter = cls;
        } else {
            cls = class$org$apache$tools$ant$PropertyHelper$PropertySetter;
        }
        for (PropertySetter propertySetter : getDelegates(cls)) {
            if (propertySetter.setNew(str, obj, this)) {
                return;
            }
        }
        synchronized (this) {
            if (this.project != null && this.properties.containsKey(str)) {
                this.project.log(new StringBuffer().append("Override ignored for property \"").append(str).append("\"").toString(), 3);
                return;
            }
            if (this.project != null) {
                this.project.log(new StringBuffer().append("Setting project property: ").append(str).append(" -> ").append(obj).toString(), 4);
            }
            if (str != null && obj != null) {
                this.properties.put(str, obj);
            }
        }
    }

    public void setNewProperty(String str, String str2, Object obj) {
        setNewProperty(str2, obj);
    }

    public void setNext(PropertyHelper propertyHelper) {
        this.next = propertyHelper;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public boolean setProperty(String str, Object obj, boolean z) {
        Class cls;
        boolean z2;
        if (class$org$apache$tools$ant$PropertyHelper$PropertySetter == null) {
            cls = class$("org.apache.tools.ant.PropertyHelper$PropertySetter");
            class$org$apache$tools$ant$PropertyHelper$PropertySetter = cls;
        } else {
            cls = class$org$apache$tools$ant$PropertyHelper$PropertySetter;
        }
        Iterator it = getDelegates(cls).iterator();
        while (true) {
            if (!it.hasNext()) {
                synchronized (this) {
                    if (this.userProperties.containsKey(str)) {
                        if (this.project != null && z) {
                            this.project.log(new StringBuffer().append("Override ignored for user property \"").append(str).append("\"").toString(), 3);
                        }
                        z2 = false;
                    } else {
                        if (this.project != null && z) {
                            if (this.properties.containsKey(str)) {
                                this.project.log(new StringBuffer().append("Overriding previous definition of property \"").append(str).append("\"").toString(), 3);
                            }
                            this.project.log(new StringBuffer().append("Setting project property: ").append(str).append(" -> ").append(obj).toString(), 4);
                        }
                        if (str != null && obj != null) {
                            this.properties.put(str, obj);
                        }
                        z2 = true;
                    }
                }
            } else if (((PropertySetter) it.next()).set(str, obj, this)) {
                z2 = true;
                break;
            }
        }
        return z2;
    }

    public boolean setProperty(String str, String str2, Object obj, boolean z) {
        return setProperty(str2, obj, z);
    }

    public boolean setPropertyHook(String str, String str2, Object obj, boolean z, boolean z2, boolean z3) {
        return getNext() != null && getNext().setPropertyHook(str, str2, obj, z, z2, z3);
    }

    public void setUserProperty(String str, Object obj) {
        if (this.project != null) {
            this.project.log(new StringBuffer().append("Setting ro project property: ").append(str).append(" -> ").append(obj).toString(), 4);
        }
        synchronized (this) {
            this.userProperties.put(str, obj);
            this.properties.put(str, obj);
        }
    }

    public void setUserProperty(String str, String str2, Object obj) {
        setUserProperty(str2, obj);
    }

    public boolean testIfCondition(Object obj) {
        return nullOrEmpty(obj) || evalAsBooleanOrPropertyName(obj);
    }

    public boolean testUnlessCondition(Object obj) {
        return nullOrEmpty(obj) || !evalAsBooleanOrPropertyName(obj);
    }
}
