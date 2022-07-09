package org.apache.tools.ant.types;

import java.util.Enumeration;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.Stack;
import java.util.TreeMap;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Mapper;
import org.apache.tools.ant.types.resources.MappedResource;
import org.apache.tools.ant.types.resources.PropertyResource;
import org.apache.tools.ant.types.selectors.FilenameSelector;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.regexp.RegexpMatcher;
import org.apache.tools.ant.util.regexp.RegexpMatcherFactory;

/* loaded from: classes.jar:org/apache/tools/ant/types/PropertySet.class */
public class PropertySet extends DataType implements ResourceCollection {
    static Class class$org$apache$tools$ant$types$PropertySet;
    private Set cachedNames;
    private Mapper mapper;
    private boolean dynamic = true;
    private boolean negate = false;
    private Vector ptyRefs = new Vector();
    private Vector setRefs = new Vector();
    private boolean noAttributeSet = true;

    /* loaded from: classes.jar:org/apache/tools/ant/types/PropertySet$BuiltinPropertySetName.class */
    public static class BuiltinPropertySetName extends EnumeratedAttribute {
        static final String ALL = "all";
        static final String COMMANDLINE = "commandline";
        static final String SYSTEM = "system";

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{ALL, SYSTEM, COMMANDLINE};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/types/PropertySet$PropertyRef.class */
    public static class PropertyRef {
        private String builtin;
        private int count;
        private String name;
        private String prefix;
        private String regex;

        private void assertValid(String str, String str2) {
            if (str2 == null || str2.length() < 1) {
                throw new BuildException(new StringBuffer().append("Invalid attribute: ").append(str).toString());
            }
            int i = this.count + 1;
            this.count = i;
            if (i == 1) {
                return;
            }
            throw new BuildException("Attributes name, regex, and prefix are mutually exclusive");
        }

        public void setBuiltin(BuiltinPropertySetName builtinPropertySetName) {
            String value = builtinPropertySetName.getValue();
            assertValid("builtin", value);
            this.builtin = value;
        }

        public void setName(String str) {
            assertValid("name", str);
            this.name = str;
        }

        public void setPrefix(String str) {
            assertValid("prefix", str);
            this.prefix = str;
        }

        public void setRegex(String str) {
            assertValid(FilenameSelector.REGEX_KEY, str);
            this.regex = str;
        }

        public String toString() {
            return new StringBuffer().append("name=").append(this.name).append(", regex=").append(this.regex).append(", prefix=").append(this.prefix).append(", builtin=").append(this.builtin).toString();
        }
    }

    private void addPropertyNames(Set set, Hashtable hashtable) {
        if (isReference()) {
            getRef().addPropertyNames(set, hashtable);
        }
        dieOnCircularReference();
        Enumeration elements = this.ptyRefs.elements();
        while (elements.hasMoreElements()) {
            PropertyRef propertyRef = (PropertyRef) elements.nextElement();
            if (propertyRef.name != null) {
                if (hashtable.get(propertyRef.name) != null) {
                    set.add(propertyRef.name);
                }
            } else if (propertyRef.prefix != null) {
                Enumeration keys = hashtable.keys();
                while (keys.hasMoreElements()) {
                    String str = (String) keys.nextElement();
                    if (str.startsWith(propertyRef.prefix)) {
                        set.add(str);
                    }
                }
            } else if (propertyRef.regex != null) {
                RegexpMatcher newRegexpMatcher = new RegexpMatcherFactory().newRegexpMatcher();
                newRegexpMatcher.setPattern(propertyRef.regex);
                Enumeration keys2 = hashtable.keys();
                while (keys2.hasMoreElements()) {
                    String str2 = (String) keys2.nextElement();
                    if (newRegexpMatcher.matches(str2)) {
                        set.add(str2);
                    }
                }
            } else if (propertyRef.builtin == null) {
                throw new BuildException("Impossible: Invalid PropertyRef!");
            } else {
                if (propertyRef.builtin.equals("all")) {
                    set.addAll(hashtable.keySet());
                } else if (propertyRef.builtin.equals("system")) {
                    set.addAll(System.getProperties().keySet());
                } else if (!propertyRef.builtin.equals("commandline")) {
                    throw new BuildException("Impossible: Invalid builtin attribute!");
                } else {
                    set.addAll(getProject().getUserProperties().keySet());
                }
            }
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private Hashtable getAllSystemProperties() {
        Hashtable hashtable = new Hashtable();
        Enumeration<?> propertyNames = System.getProperties().propertyNames();
        while (propertyNames.hasMoreElements()) {
            String str = (String) propertyNames.nextElement();
            hashtable.put(str, System.getProperties().getProperty(str));
        }
        return hashtable;
    }

    private Hashtable getEffectiveProperties() {
        Project project = getProject();
        Hashtable allSystemProperties = project == null ? getAllSystemProperties() : project.getProperties();
        Enumeration elements = this.setRefs.elements();
        while (elements.hasMoreElements()) {
            allSystemProperties.putAll(((PropertySet) elements.nextElement()).getProperties());
        }
        return allSystemProperties;
    }

    private Set getPropertyNames(Hashtable hashtable) {
        HashSet hashSet;
        if (getDynamic() || this.cachedNames == null) {
            HashSet hashSet2 = new HashSet();
            addPropertyNames(hashSet2, hashtable);
            Enumeration elements = this.setRefs.elements();
            while (elements.hasMoreElements()) {
                hashSet2.addAll(((PropertySet) elements.nextElement()).getProperties().keySet());
            }
            HashSet hashSet3 = hashSet2;
            if (this.negate) {
                hashSet3 = new HashSet(hashtable.keySet());
                hashSet3.removeAll(hashSet2);
            }
            hashSet = hashSet3;
            if (!getDynamic()) {
                this.cachedNames = hashSet3;
                hashSet = hashSet3;
            }
        } else {
            hashSet = this.cachedNames;
        }
        return hashSet;
    }

    public void add(FileNameMapper fileNameMapper) {
        createMapper().add(fileNameMapper);
    }

    public void addPropertyref(PropertyRef propertyRef) {
        assertNotReference();
        setChecked(false);
        this.ptyRefs.addElement(propertyRef);
    }

    public void addPropertyset(PropertySet propertySet) {
        assertNotReference();
        setChecked(false);
        this.setRefs.addElement(propertySet);
    }

    public void appendBuiltin(BuiltinPropertySetName builtinPropertySetName) {
        PropertyRef propertyRef = new PropertyRef();
        propertyRef.setBuiltin(builtinPropertySetName);
        addPropertyref(propertyRef);
    }

    public void appendName(String str) {
        PropertyRef propertyRef = new PropertyRef();
        propertyRef.setName(str);
        addPropertyref(propertyRef);
    }

    public void appendPrefix(String str) {
        PropertyRef propertyRef = new PropertyRef();
        propertyRef.setPrefix(str);
        addPropertyref(propertyRef);
    }

    public void appendRegex(String str) {
        PropertyRef propertyRef = new PropertyRef();
        propertyRef.setRegex(str);
        addPropertyref(propertyRef);
    }

    protected final void assertNotReference() {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.noAttributeSet = false;
    }

    public Mapper createMapper() {
        assertNotReference();
        if (this.mapper != null) {
            throw new BuildException("Too many <mapper>s!");
        }
        this.mapper = new Mapper(getProject());
        setChecked(false);
        return this.mapper;
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        synchronized (this) {
            if (!isChecked()) {
                if (isReference()) {
                    super.dieOnCircularReference(stack, project);
                } else {
                    if (this.mapper != null) {
                        pushAndInvokeCircularReferenceCheck(this.mapper, stack, project);
                    }
                    Iterator it = this.setRefs.iterator();
                    while (it.hasNext()) {
                        pushAndInvokeCircularReferenceCheck((PropertySet) it.next(), stack, project);
                    }
                    setChecked(true);
                }
            }
        }
    }

    public boolean getDynamic() {
        boolean z;
        if (isReference()) {
            z = getRef().dynamic;
        } else {
            dieOnCircularReference();
            z = this.dynamic;
        }
        return z;
    }

    public Mapper getMapper() {
        Mapper mapper;
        if (isReference()) {
            mapper = getRef().mapper;
        } else {
            dieOnCircularReference();
            mapper = this.mapper;
        }
        return mapper;
    }

    public Properties getProperties() {
        Properties properties;
        if (!isReference()) {
            dieOnCircularReference();
            Hashtable effectiveProperties = getEffectiveProperties();
            Set propertyNames = getPropertyNames(effectiveProperties);
            FileNameMapper fileNameMapper = null;
            Mapper mapper = getMapper();
            if (mapper != null) {
                fileNameMapper = mapper.getImplementation();
            }
            Properties properties2 = new Properties();
            Iterator it = propertyNames.iterator();
            while (true) {
                properties = properties2;
                if (!it.hasNext()) {
                    break;
                }
                String str = (String) it.next();
                String str2 = (String) effectiveProperties.get(str);
                if (str2 != null) {
                    String str3 = str;
                    if (fileNameMapper != null) {
                        String[] mapFileName = fileNameMapper.mapFileName(str);
                        str3 = str;
                        if (mapFileName != null) {
                            str3 = mapFileName[0];
                        }
                    }
                    properties2.setProperty(str3, str2);
                }
            }
        } else {
            properties = getRef().getProperties();
        }
        return properties;
    }

    protected PropertySet getRef() {
        Class cls;
        if (class$org$apache$tools$ant$types$PropertySet == null) {
            cls = class$("org.apache.tools.ant.types.PropertySet");
            class$org$apache$tools$ant$types$PropertySet = cls;
        } else {
            cls = class$org$apache$tools$ant$types$PropertySet;
        }
        return (PropertySet) getCheckedRef(cls, "propertyset");
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public boolean isFilesystemOnly() {
        boolean z;
        if (isReference()) {
            z = getRef().isFilesystemOnly();
        } else {
            dieOnCircularReference();
            z = false;
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public Iterator iterator() {
        Iterator it;
        if (isReference()) {
            it = getRef().iterator();
        } else {
            dieOnCircularReference();
            Set propertyNames = getPropertyNames(getEffectiveProperties());
            Mapper mapper = getMapper();
            it = new Iterator(this, propertyNames.iterator(), mapper == null ? null : mapper.getImplementation()) { // from class: org.apache.tools.ant.types.PropertySet.1
                private final PropertySet this$0;
                private final Iterator val$iter;
                private final FileNameMapper val$m;

                {
                    this.this$0 = this;
                    this.val$iter = r5;
                    this.val$m = r6;
                }

                @Override // java.util.Iterator
                public boolean hasNext() {
                    return this.val$iter.hasNext();
                }

                @Override // java.util.Iterator
                public Object next() {
                    Resource propertyResource = new PropertyResource(this.this$0.getProject(), (String) this.val$iter.next());
                    if (this.val$m != null) {
                        propertyResource = new MappedResource(propertyResource, this.val$m);
                    }
                    return propertyResource;
                }

                @Override // java.util.Iterator
                public void remove() {
                    throw new UnsupportedOperationException();
                }
            };
        }
        return it;
    }

    public void setDynamic(boolean z) {
        assertNotReference();
        this.dynamic = z;
    }

    public void setMapper(String str, String str2, String str3) {
        Mapper createMapper = createMapper();
        Mapper.MapperType mapperType = new Mapper.MapperType();
        mapperType.setValue(str);
        createMapper.setType(mapperType);
        createMapper.setFrom(str2);
        createMapper.setTo(str3);
    }

    public void setNegate(boolean z) {
        assertNotReference();
        this.negate = z;
    }

    @Override // org.apache.tools.ant.types.DataType
    public final void setRefid(Reference reference) {
        if (!this.noAttributeSet) {
            throw tooManyAttributes();
        }
        super.setRefid(reference);
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public int size() {
        return isReference() ? getRef().size() : getProperties().size();
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        String stringBuffer;
        if (isReference()) {
            stringBuffer = getRef().toString();
        } else {
            dieOnCircularReference();
            StringBuffer stringBuffer2 = new StringBuffer();
            for (Map.Entry entry : new TreeMap(getProperties()).entrySet()) {
                if (stringBuffer2.length() != 0) {
                    stringBuffer2.append(", ");
                }
                stringBuffer2.append(entry.getKey().toString());
                stringBuffer2.append("=");
                stringBuffer2.append(entry.getValue().toString());
            }
            stringBuffer = stringBuffer2.toString();
        }
        return stringBuffer;
    }
}
