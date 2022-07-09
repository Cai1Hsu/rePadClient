package org.apache.tools.ant.taskdefs.optional.script;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import org.apache.tools.ant.AntTypeDefinition;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ComponentHelper;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectHelper;
import org.apache.tools.ant.taskdefs.DefBase;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.util.ClasspathUtils;
import org.apache.tools.ant.util.ScriptRunnerBase;
import org.apache.tools.ant.util.ScriptRunnerHelper;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/script/ScriptDef.class */
public class ScriptDef extends DefBase {
    static Class class$org$apache$tools$ant$taskdefs$optional$script$ScriptDef;
    static Class class$org$apache$tools$ant$taskdefs$optional$script$ScriptDefBase;
    private Set attributeSet;
    private String name;
    private Map nestedElementMap;
    private ScriptRunnerHelper helper = new ScriptRunnerHelper();
    private List attributes = new ArrayList();
    private List nestedElements = new ArrayList();

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/script/ScriptDef$Attribute.class */
    public static class Attribute {
        private String name;

        public void setName(String str) {
            this.name = str.toLowerCase(Locale.ENGLISH);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement.class */
    public static class NestedElement {
        private String className;
        private String name;
        private String type;

        public void setClassName(String str) {
            this.className = str;
        }

        public void setName(String str) {
            this.name = str.toLowerCase(Locale.ENGLISH);
        }

        public void setType(String str) {
            this.type = str;
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private Map lookupScriptRepository() {
        Throwable th;
        Project project = getProject();
        synchronized (project) {
            try {
                Map map = (Map) project.getReference(MagicNames.SCRIPT_REPOSITORY);
                Map map2 = map;
                if (map == null) {
                    map2 = new HashMap();
                    try {
                        project.addReference(MagicNames.SCRIPT_REPOSITORY, map2);
                    } catch (Throwable th2) {
                        th = th2;
                        throw th;
                    }
                }
                return map2;
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    public void add(ResourceCollection resourceCollection) {
        this.helper.add(resourceCollection);
    }

    public void addAttribute(Attribute attribute) {
        this.attributes.add(attribute);
    }

    public void addElement(NestedElement nestedElement) {
        this.nestedElements.add(nestedElement);
    }

    public void addText(String str) {
        this.helper.addText(str);
    }

    public Object createNestedElement(String str) {
        Class cls;
        Object newInstance;
        NestedElement nestedElement = (NestedElement) this.nestedElementMap.get(str);
        if (nestedElement == null) {
            throw new BuildException(new StringBuffer().append("<").append(this.name).append("> does not support ").append("the <").append(str).append("> nested element").toString());
        }
        String str2 = nestedElement.className;
        if (str2 == null) {
            Object createTask = getProject().createTask(nestedElement.type);
            newInstance = createTask;
            if (createTask == null) {
                newInstance = getProject().createDataType(nestedElement.type);
            }
        } else {
            try {
                newInstance = ClasspathUtils.newInstance(str2, createLoader());
            } catch (BuildException e) {
                if (class$org$apache$tools$ant$taskdefs$optional$script$ScriptDef == null) {
                    cls = class$("org.apache.tools.ant.taskdefs.optional.script.ScriptDef");
                    class$org$apache$tools$ant$taskdefs$optional$script$ScriptDef = cls;
                } else {
                    cls = class$org$apache$tools$ant$taskdefs$optional$script$ScriptDef;
                }
                newInstance = ClasspathUtils.newInstance(str2, cls.getClassLoader());
            }
            getProject().setProjectReference(newInstance);
        }
        if (newInstance != null) {
            return newInstance;
        }
        throw new BuildException(new StringBuffer().append("<").append(this.name).append("> is unable to create ").append("the <").append(str).append("> nested element").toString());
    }

    @Override // org.apache.tools.ant.Task
    public void execute() {
        Class cls;
        if (this.name == null) {
            throw new BuildException("scriptdef requires a name attribute to name the script");
        }
        if (this.helper.getLanguage() == null) {
            throw new BuildException("<scriptdef> requires a language attribute to specify the script language");
        }
        if (getAntlibClassLoader() != null || hasCpDelegate()) {
            this.helper.setClassLoader(createLoader());
        }
        this.attributeSet = new HashSet();
        for (Attribute attribute : this.attributes) {
            if (attribute.name == null) {
                throw new BuildException("scriptdef <attribute> elements must specify an attribute name");
            }
            if (this.attributeSet.contains(attribute.name)) {
                throw new BuildException(new StringBuffer().append("scriptdef <").append(this.name).append("> declares ").append("the ").append(attribute.name).append(" attribute more than once").toString());
            }
            this.attributeSet.add(attribute.name);
        }
        this.nestedElementMap = new HashMap();
        for (NestedElement nestedElement : this.nestedElements) {
            if (nestedElement.name == null) {
                throw new BuildException("scriptdef <element> elements must specify an element name");
            }
            if (this.nestedElementMap.containsKey(nestedElement.name)) {
                throw new BuildException(new StringBuffer().append("scriptdef <").append(this.name).append("> declares ").append("the ").append(nestedElement.name).append(" nested element more ").append("than once").toString());
            }
            if (nestedElement.className == null && nestedElement.type == null) {
                throw new BuildException("scriptdef <element> elements must specify either a classname or type attribute");
            }
            if (nestedElement.className != null && nestedElement.type != null) {
                throw new BuildException("scriptdef <element> elements must specify only one of the classname and type attributes");
            }
            this.nestedElementMap.put(nestedElement.name, nestedElement);
        }
        Map lookupScriptRepository = lookupScriptRepository();
        this.name = ProjectHelper.genComponentName(getURI(), this.name);
        lookupScriptRepository.put(this.name, this);
        AntTypeDefinition antTypeDefinition = new AntTypeDefinition();
        antTypeDefinition.setName(this.name);
        if (class$org$apache$tools$ant$taskdefs$optional$script$ScriptDefBase == null) {
            cls = class$("org.apache.tools.ant.taskdefs.optional.script.ScriptDefBase");
            class$org$apache$tools$ant$taskdefs$optional$script$ScriptDefBase = cls;
        } else {
            cls = class$org$apache$tools$ant$taskdefs$optional$script$ScriptDefBase;
        }
        antTypeDefinition.setClass(cls);
        ComponentHelper.getComponentHelper(getProject()).addDataTypeDefinition(antTypeDefinition);
    }

    public void executeScript(Map map, Map map2) {
        executeScript(map, map2, null);
    }

    public void executeScript(Map map, Map map2, ScriptDefBase scriptDefBase) {
        ScriptRunnerBase scriptRunner = this.helper.getScriptRunner();
        scriptRunner.addBean("attributes", map);
        scriptRunner.addBean("elements", map2);
        scriptRunner.addBean("project", getProject());
        if (scriptDefBase != null) {
            scriptRunner.addBean("self", scriptDefBase);
        }
        scriptRunner.executeScript(new StringBuffer().append("scriptdef_").append(this.name).toString());
    }

    public boolean isAttributeSupported(String str) {
        return this.attributeSet.contains(str);
    }

    public void setLanguage(String str) {
        this.helper.setLanguage(str);
    }

    public void setManager(String str) {
        this.helper.setManager(str);
    }

    public void setName(String str) {
        this.name = str;
    }

    @Override // org.apache.tools.ant.ProjectComponent
    public void setProject(Project project) {
        super.setProject(project);
        this.helper.setProjectComponent(this);
        this.helper.setSetBeans(false);
    }

    public void setSrc(File file) {
        this.helper.setSrc(file);
    }
}
