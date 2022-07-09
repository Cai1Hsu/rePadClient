package org.apache.tools.ant.taskdefs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.apache.tools.ant.AntTypeDefinition;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ComponentHelper;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectHelper;
import org.apache.tools.ant.RuntimeConfigurable;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.TaskContainer;
import org.apache.tools.ant.UnknownElement;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/MacroDef.class */
public class MacroDef extends AntlibDefinition {
    static Class class$org$apache$tools$ant$taskdefs$MacroInstance;
    private String name;
    private NestedSequential nestedSequential;
    private boolean backTrace = true;
    private List attributes = new ArrayList();
    private Map elements = new HashMap();
    private String textName = null;
    private Text text = null;
    private boolean hasImplicitElement = false;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/MacroDef$Attribute.class */
    public static class Attribute {
        private String defaultValue;
        private String description;
        private boolean doubleExpanding = true;
        private String name;

        /* JADX WARN: Code restructure failed: missing block: B:12:0x0029, code lost:
            if (r0.name == null) goto L13;
         */
        /* JADX WARN: Code restructure failed: missing block: B:16:0x0039, code lost:
            if (r0.defaultValue == null) goto L17;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public boolean equals(Object obj) {
            boolean z;
            if (obj == null) {
                z = false;
            } else {
                z = false;
                if (obj.getClass() == getClass()) {
                    Attribute attribute = (Attribute) obj;
                    if (this.name == null) {
                        z = false;
                    } else {
                        if (!this.name.equals(attribute.name)) {
                            z = false;
                        }
                        if (this.defaultValue == null) {
                            z = false;
                        } else {
                            if (!this.defaultValue.equals(attribute.defaultValue)) {
                                z = false;
                            }
                            z = true;
                        }
                    }
                }
            }
            return z;
        }

        public String getDefault() {
            return this.defaultValue;
        }

        public String getDescription() {
            return this.description;
        }

        public String getName() {
            return this.name;
        }

        public int hashCode() {
            return MacroDef.objectHashCode(this.defaultValue) + MacroDef.objectHashCode(this.name);
        }

        public boolean isDoubleExpanding() {
            return this.doubleExpanding;
        }

        public void setDefault(String str) {
            this.defaultValue = str;
        }

        public void setDescription(String str) {
            this.description = str;
        }

        public void setDoubleExpanding(boolean z) {
            this.doubleExpanding = z;
        }

        public void setName(String str) {
            if (!MacroDef.isValidName(str)) {
                throw new BuildException(new StringBuffer().append("Illegal name [").append(str).append("] for attribute").toString());
            }
            this.name = str.toLowerCase(Locale.ENGLISH);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition.class */
    private static class MyAntTypeDefinition extends AntTypeDefinition {
        private MacroDef macroDef;

        public MyAntTypeDefinition(MacroDef macroDef) {
            this.macroDef = macroDef;
        }

        @Override // org.apache.tools.ant.AntTypeDefinition
        public Object create(Project project) {
            Object create = super.create(project);
            if (create == null) {
                create = null;
            } else {
                ((MacroInstance) create).setMacroDef(this.macroDef);
            }
            return create;
        }

        @Override // org.apache.tools.ant.AntTypeDefinition
        public boolean sameDefinition(AntTypeDefinition antTypeDefinition, Project project) {
            return !super.sameDefinition(antTypeDefinition, project) ? false : this.macroDef.sameDefinition(((MyAntTypeDefinition) antTypeDefinition).macroDef);
        }

        @Override // org.apache.tools.ant.AntTypeDefinition
        public boolean similarDefinition(AntTypeDefinition antTypeDefinition, Project project) {
            return !super.similarDefinition(antTypeDefinition, project) ? false : this.macroDef.similar(((MyAntTypeDefinition) antTypeDefinition).macroDef);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/MacroDef$NestedSequential.class */
    public static class NestedSequential implements TaskContainer {
        private List nested = new ArrayList();

        @Override // org.apache.tools.ant.TaskContainer
        public void addTask(Task task) {
            this.nested.add(task);
        }

        public List getNested() {
            return this.nested;
        }

        public boolean similar(NestedSequential nestedSequential) {
            boolean z;
            int size = this.nested.size();
            if (size == nestedSequential.nested.size()) {
                int i = 0;
                while (true) {
                    if (i >= size) {
                        z = true;
                        break;
                    }
                    z = false;
                    if (!((UnknownElement) this.nested.get(i)).similar((UnknownElement) nestedSequential.nested.get(i))) {
                        break;
                    }
                    i++;
                }
            } else {
                z = false;
            }
            return z;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/MacroDef$TemplateElement.class */
    public static class TemplateElement {
        private String description;
        private String name;
        private boolean optional = false;
        private boolean implicit = false;

        /* JADX WARN: Code restructure failed: missing block: B:18:0x0046, code lost:
            if (r3.implicit == r0.implicit) goto L4;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public boolean equals(Object obj) {
            boolean z = true;
            if (obj != this) {
                if (obj == null || !obj.getClass().equals(getClass())) {
                    z = false;
                } else {
                    TemplateElement templateElement = (TemplateElement) obj;
                    if (this.name != null ? this.name.equals(templateElement.name) : templateElement.name == null) {
                        if (this.optional == templateElement.optional) {
                        }
                    }
                    z = false;
                }
            }
            return z;
        }

        public String getDescription() {
            return this.description;
        }

        public String getName() {
            return this.name;
        }

        public int hashCode() {
            int i = 1;
            int objectHashCode = MacroDef.objectHashCode(this.name);
            int i2 = this.optional ? 1 : 0;
            if (!this.implicit) {
                i = 0;
            }
            return i2 + objectHashCode + i;
        }

        public boolean isImplicit() {
            return this.implicit;
        }

        public boolean isOptional() {
            return this.optional;
        }

        public void setDescription(String str) {
            this.description = str;
        }

        public void setImplicit(boolean z) {
            this.implicit = z;
        }

        public void setName(String str) {
            if (!MacroDef.isValidName(str)) {
                throw new BuildException(new StringBuffer().append("Illegal name [").append(str).append("] for macro element").toString());
            }
            this.name = str.toLowerCase(Locale.ENGLISH);
        }

        public void setOptional(boolean z) {
            this.optional = z;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/MacroDef$Text.class */
    public static class Text {
        private String defaultString;
        private String description;
        private String name;
        private boolean optional;
        private boolean trim;

        public boolean equals(Object obj) {
            boolean z;
            if (obj == null) {
                z = false;
            } else {
                z = false;
                if (obj.getClass() == getClass()) {
                    Text text = (Text) obj;
                    z = false;
                    if (MacroDef.safeCompare(this.name, text.name)) {
                        z = false;
                        if (this.optional == text.optional) {
                            z = false;
                            if (this.trim == text.trim) {
                                z = false;
                                if (MacroDef.safeCompare(this.defaultString, text.defaultString)) {
                                    z = true;
                                }
                            }
                        }
                    }
                }
            }
            return z;
        }

        public String getDefault() {
            return this.defaultString;
        }

        public String getDescription() {
            return this.description;
        }

        public String getName() {
            return this.name;
        }

        public boolean getOptional() {
            return this.optional;
        }

        public boolean getTrim() {
            return this.trim;
        }

        public int hashCode() {
            return MacroDef.objectHashCode(this.name);
        }

        public void setDefault(String str) {
            this.defaultString = str;
        }

        public void setDescription(String str) {
            this.description = str;
        }

        public void setName(String str) {
            if (!MacroDef.isValidName(str)) {
                throw new BuildException(new StringBuffer().append("Illegal name [").append(str).append("] for attribute").toString());
            }
            this.name = str.toLowerCase(Locale.ENGLISH);
        }

        public void setOptional(boolean z) {
            this.optional = z;
        }

        public void setTrim(boolean z) {
            this.trim = z;
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public static boolean isValidName(String str) {
        boolean z;
        if (str.length() != 0) {
            int i = 0;
            while (true) {
                if (i >= str.length()) {
                    z = true;
                    break;
                }
                z = false;
                if (!isValidNameCharacter(str.charAt(i))) {
                    break;
                }
                i++;
            }
        } else {
            z = false;
        }
        return z;
    }

    public static boolean isValidNameCharacter(char c) {
        return Character.isLetterOrDigit(c) || c == '.' || c == '-';
    }

    public static int objectHashCode(Object obj) {
        return obj == null ? 0 : obj.hashCode();
    }

    public static boolean safeCompare(Object obj, Object obj2) {
        return obj == null ? obj2 == null : obj.equals(obj2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x008a, code lost:
        if (r0.text == null) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00cc, code lost:
        if (r0.getURI().equals(org.apache.tools.ant.ProjectHelper.ANT_CORE_URI) != false) goto L43;
     */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00e1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean sameOrSimilar(Object obj, boolean z) {
        boolean z2;
        if (obj == this) {
            z2 = true;
        } else {
            z2 = false;
            if (obj != null) {
                z2 = false;
                if (obj.getClass().equals(getClass())) {
                    MacroDef macroDef = (MacroDef) obj;
                    if (this.name == null) {
                        z2 = macroDef.name == null;
                    } else {
                        z2 = false;
                        if (this.name.equals(macroDef.name)) {
                            if (macroDef.getLocation() != null && macroDef.getLocation().equals(getLocation()) && !z) {
                                z2 = true;
                            } else if (this.text == null) {
                                z2 = false;
                            } else {
                                if (!this.text.equals(macroDef.text)) {
                                    z2 = false;
                                }
                                if (getURI() == null || getURI().equals("") || getURI().equals(ProjectHelper.ANT_CORE_URI)) {
                                    if (macroDef.getURI() != null && !macroDef.getURI().equals("")) {
                                        z2 = false;
                                    }
                                    z2 = false;
                                    if (this.nestedSequential.similar(macroDef.nestedSequential)) {
                                        z2 = false;
                                        if (this.attributes.equals(macroDef.attributes)) {
                                            z2 = false;
                                            if (this.elements.equals(macroDef.elements)) {
                                                z2 = true;
                                            }
                                        }
                                    }
                                } else {
                                    if (!getURI().equals(macroDef.getURI())) {
                                        z2 = false;
                                    }
                                    z2 = false;
                                    if (this.nestedSequential.similar(macroDef.nestedSequential)) {
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return z2;
    }

    public void addConfiguredAttribute(Attribute attribute) {
        if (attribute.getName() == null) {
            throw new BuildException("the attribute nested element needed a \"name\" attribute");
        }
        if (attribute.getName().equals(this.textName)) {
            throw new BuildException(new StringBuffer().append("the name \"").append(attribute.getName()).append("\" has already been used by the text element").toString());
        }
        int size = this.attributes.size();
        for (int i = 0; i < size; i++) {
            if (((Attribute) this.attributes.get(i)).getName().equals(attribute.getName())) {
                throw new BuildException(new StringBuffer().append("the name \"").append(attribute.getName()).append("\" has already been used in ").append("another attribute element").toString());
            }
        }
        this.attributes.add(attribute);
    }

    public void addConfiguredElement(TemplateElement templateElement) {
        if (templateElement.getName() == null) {
            throw new BuildException("the element nested element needed a \"name\" attribute");
        }
        if (this.elements.get(templateElement.getName()) != null) {
            throw new BuildException(new StringBuffer().append("the element ").append(templateElement.getName()).append(" has already been specified").toString());
        }
        if (this.hasImplicitElement || (templateElement.isImplicit() && this.elements.size() != 0)) {
            throw new BuildException("Only one element allowed when using implicit elements");
        }
        this.hasImplicitElement = templateElement.isImplicit();
        this.elements.put(templateElement.getName(), templateElement);
    }

    public void addConfiguredText(Text text) {
        if (this.text != null) {
            throw new BuildException("Only one nested text element allowed");
        }
        if (text.getName() == null) {
            throw new BuildException("the text nested element needed a \"name\" attribute");
        }
        for (Attribute attribute : this.attributes) {
            if (text.getName().equals(attribute.getName())) {
                throw new BuildException(new StringBuffer().append("the name \"").append(text.getName()).append("\" is already used as an attribute").toString());
            }
        }
        this.text = text;
        this.textName = text.getName();
    }

    public NestedSequential createSequential() {
        if (this.nestedSequential != null) {
            throw new BuildException("Only one sequential allowed");
        }
        this.nestedSequential = new NestedSequential();
        return this.nestedSequential;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() {
        Class cls;
        if (this.nestedSequential == null) {
            throw new BuildException("Missing sequential element");
        }
        if (this.name == null) {
            throw new BuildException("Name not specified");
        }
        this.name = ProjectHelper.genComponentName(getURI(), this.name);
        MyAntTypeDefinition myAntTypeDefinition = new MyAntTypeDefinition(this);
        myAntTypeDefinition.setName(this.name);
        if (class$org$apache$tools$ant$taskdefs$MacroInstance == null) {
            cls = class$("org.apache.tools.ant.taskdefs.MacroInstance");
            class$org$apache$tools$ant$taskdefs$MacroInstance = cls;
        } else {
            cls = class$org$apache$tools$ant$taskdefs$MacroInstance;
        }
        myAntTypeDefinition.setClass(cls);
        ComponentHelper.getComponentHelper(getProject()).addDataTypeDefinition(myAntTypeDefinition);
        log(new StringBuffer().append("creating macro  ").append(this.name).toString(), 3);
    }

    public List getAttributes() {
        return this.attributes;
    }

    public boolean getBackTrace() {
        return this.backTrace;
    }

    public Map getElements() {
        return this.elements;
    }

    public UnknownElement getNestedTask() {
        UnknownElement unknownElement = new UnknownElement("sequential");
        unknownElement.setTaskName("sequential");
        unknownElement.setNamespace("");
        unknownElement.setQName("sequential");
        new RuntimeConfigurable(unknownElement, "sequential");
        int size = this.nestedSequential.getNested().size();
        for (int i = 0; i < size; i++) {
            UnknownElement unknownElement2 = (UnknownElement) this.nestedSequential.getNested().get(i);
            unknownElement.addChild(unknownElement2);
            unknownElement.getWrapper().addChild(unknownElement2.getWrapper());
        }
        return unknownElement;
    }

    public Text getText() {
        return this.text;
    }

    public boolean sameDefinition(Object obj) {
        return sameOrSimilar(obj, true);
    }

    public void setBackTrace(boolean z) {
        this.backTrace = z;
    }

    public void setName(String str) {
        this.name = str;
    }

    public boolean similar(Object obj) {
        return sameOrSimilar(obj, false);
    }
}
