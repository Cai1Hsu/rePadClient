package org.apache.tools.ant.taskdefs;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DynamicAttribute;
import org.apache.tools.ant.ProjectHelper;
import org.apache.tools.ant.RuntimeConfigurable;
import org.apache.tools.ant.Target;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.TaskContainer;
import org.apache.tools.ant.UnknownElement;
import org.apache.tools.ant.property.LocalProperties;
import org.apache.tools.ant.taskdefs.MacroDef;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/MacroInstance.class */
public class MacroInstance extends Task implements DynamicAttribute, TaskContainer {
    private static final int STATE_EXPECT_BRACKET = 1;
    private static final int STATE_EXPECT_NAME = 2;
    private static final int STATE_NORMAL = 0;
    private Hashtable localAttributes;
    private MacroDef macroDef;
    private Map presentElements;
    private Map map = new HashMap();
    private Map nsElements = null;
    private String text = null;
    private String implicitTag = null;
    private List unknownElements = new ArrayList();

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/MacroInstance$Element.class */
    public static class Element implements TaskContainer {
        private List unknownElements = new ArrayList();

        @Override // org.apache.tools.ant.TaskContainer
        public void addTask(Task task) {
            this.unknownElements.add(task);
        }

        public List getUnknownElements() {
            return this.unknownElements;
        }
    }

    private UnknownElement copy(UnknownElement unknownElement, boolean z) {
        UnknownElement unknownElement2 = new UnknownElement(unknownElement.getTag());
        unknownElement2.setNamespace(unknownElement.getNamespace());
        unknownElement2.setProject(getProject());
        unknownElement2.setQName(unknownElement.getQName());
        unknownElement2.setTaskType(unknownElement.getTaskType());
        unknownElement2.setTaskName(unknownElement.getTaskName());
        unknownElement2.setLocation(this.macroDef.getBackTrace() ? unknownElement.getLocation() : getLocation());
        if (getOwningTarget() == null) {
            Target target = new Target();
            target.setProject(getProject());
            unknownElement2.setOwningTarget(target);
        } else {
            unknownElement2.setOwningTarget(getOwningTarget());
        }
        RuntimeConfigurable runtimeConfigurable = new RuntimeConfigurable(unknownElement2, unknownElement.getTaskName());
        runtimeConfigurable.setPolyType(unknownElement.getWrapper().getPolyType());
        for (Map.Entry entry : unknownElement.getWrapper().getAttributeMap().entrySet()) {
            runtimeConfigurable.setAttribute((String) entry.getKey(), macroSubs((String) entry.getValue(), this.localAttributes));
        }
        runtimeConfigurable.addText(macroSubs(unknownElement.getWrapper().getText().toString(), this.localAttributes));
        Enumeration children = unknownElement.getWrapper().getChildren();
        while (children.hasMoreElements()) {
            UnknownElement unknownElement3 = (UnknownElement) ((RuntimeConfigurable) children.nextElement()).getProxy();
            String taskType = unknownElement3.getTaskType();
            String str = taskType;
            if (taskType != null) {
                str = taskType.toLowerCase(Locale.ENGLISH);
            }
            MacroDef.TemplateElement templateElement = (MacroDef.TemplateElement) getNsElements().get(str);
            if (templateElement == null || z) {
                UnknownElement copy = copy(unknownElement3, z);
                runtimeConfigurable.addChild(copy.getWrapper());
                unknownElement2.addChild(copy);
            } else if (!templateElement.isImplicit()) {
                UnknownElement unknownElement4 = (UnknownElement) this.presentElements.get(str);
                if (unknownElement4 != null) {
                    String stringBuffer = unknownElement4.getWrapper().getText().toString();
                    if (!"".equals(stringBuffer)) {
                        runtimeConfigurable.addText(macroSubs(stringBuffer, this.localAttributes));
                    }
                    List<UnknownElement> children2 = unknownElement4.getChildren();
                    if (children2 != null) {
                        for (UnknownElement unknownElement5 : children2) {
                            UnknownElement copy2 = copy(unknownElement5, true);
                            runtimeConfigurable.addChild(copy2.getWrapper());
                            unknownElement2.addChild(copy2);
                        }
                    }
                } else if (!templateElement.isOptional()) {
                    throw new BuildException(new StringBuffer().append("Required nested element ").append(templateElement.getName()).append(" missing").toString());
                }
            } else if (this.unknownElements.size() == 0 && !templateElement.isOptional()) {
                throw new BuildException(new StringBuffer().append("Missing nested elements for implicit element ").append(templateElement.getName()).toString());
            } else {
                for (UnknownElement unknownElement6 : this.unknownElements) {
                    UnknownElement copy3 = copy(unknownElement6, true);
                    runtimeConfigurable.addChild(copy3.getWrapper());
                    unknownElement2.addChild(copy3);
                }
            }
        }
        return unknownElement2;
    }

    private Map getNsElements() {
        if (this.nsElements == null) {
            this.nsElements = new HashMap();
            for (Map.Entry entry : this.macroDef.getElements().entrySet()) {
                this.nsElements.put((String) entry.getKey(), entry.getValue());
                MacroDef.TemplateElement templateElement = (MacroDef.TemplateElement) entry.getValue();
                if (templateElement.isImplicit()) {
                    this.implicitTag = templateElement.getName();
                }
            }
        }
        return this.nsElements;
    }

    private String macroSubs(String str, Map map) {
        String stringBuffer;
        if (str == null) {
            stringBuffer = null;
        } else {
            StringBuffer stringBuffer2 = new StringBuffer();
            StringBuffer stringBuffer3 = null;
            boolean z = false;
            for (int i = 0; i < str.length(); i++) {
                char charAt = str.charAt(i);
                switch (z) {
                    case false:
                        if (charAt == '@') {
                            z = true;
                            break;
                        } else {
                            stringBuffer2.append(charAt);
                            break;
                        }
                    case true:
                        if (charAt == '{') {
                            z = true;
                            stringBuffer3 = new StringBuffer();
                            break;
                        } else if (charAt == '@') {
                            z = false;
                            stringBuffer2.append('@');
                            break;
                        } else {
                            z = false;
                            stringBuffer2.append('@');
                            stringBuffer2.append(charAt);
                            break;
                        }
                    case true:
                        if (charAt == '}') {
                            z = false;
                            String lowerCase = stringBuffer3.toString().toLowerCase(Locale.ENGLISH);
                            String str2 = (String) map.get(lowerCase);
                            if (str2 == null) {
                                stringBuffer2.append("@{");
                                stringBuffer2.append(lowerCase);
                                stringBuffer2.append("}");
                            } else {
                                stringBuffer2.append(str2);
                            }
                            stringBuffer3 = null;
                            break;
                        } else {
                            stringBuffer3.append(charAt);
                            break;
                        }
                }
            }
            switch (z) {
                case true:
                    stringBuffer2.append('@');
                    break;
                case true:
                    stringBuffer2.append("@{");
                    stringBuffer2.append(stringBuffer3.toString());
                    break;
            }
            stringBuffer = stringBuffer2.toString();
        }
        return stringBuffer;
    }

    private void processTasks() {
        if (this.implicitTag != null) {
            return;
        }
        for (UnknownElement unknownElement : this.unknownElements) {
            String lowerCase = ProjectHelper.extractNameFromComponentName(unknownElement.getTag()).toLowerCase(Locale.ENGLISH);
            if (getNsElements().get(lowerCase) == null) {
                throw new BuildException(new StringBuffer().append("unsupported element ").append(lowerCase).toString());
            }
            if (this.presentElements.get(lowerCase) != null) {
                throw new BuildException(new StringBuffer().append("Element ").append(lowerCase).append(" already present").toString());
            }
            this.presentElements.put(lowerCase, unknownElement);
        }
    }

    @Override // org.apache.tools.ant.TaskContainer
    public void addTask(Task task) {
        this.unknownElements.add(task);
    }

    public void addText(String str) {
        this.text = str;
    }

    public Object createDynamicElement(String str) throws BuildException {
        throw new BuildException("Not implemented any more");
    }

    @Override // org.apache.tools.ant.Task
    public void execute() {
        this.presentElements = new HashMap();
        getNsElements();
        processTasks();
        this.localAttributes = new Hashtable();
        HashSet hashSet = new HashSet(this.map.keySet());
        for (MacroDef.Attribute attribute : this.macroDef.getAttributes()) {
            String str = (String) this.map.get(attribute.getName());
            String str2 = str;
            if (str == null) {
                str2 = str;
                if ("description".equals(attribute.getName())) {
                    str2 = getDescription();
                }
            }
            String str3 = str2;
            if (str2 == null) {
                str3 = macroSubs(attribute.getDefault(), this.localAttributes);
            }
            if (str3 == null) {
                throw new BuildException(new StringBuffer().append("required attribute ").append(attribute.getName()).append(" not set").toString());
            }
            this.localAttributes.put(attribute.getName(), str3);
            hashSet.remove(attribute.getName());
        }
        if (hashSet.contains("id")) {
            hashSet.remove("id");
        }
        if (this.macroDef.getText() != null) {
            if (this.text == null) {
                String str4 = this.macroDef.getText().getDefault();
                if (!this.macroDef.getText().getOptional() && str4 == null) {
                    throw new BuildException("required text missing");
                }
                String str5 = str4;
                if (str4 == null) {
                    str5 = "";
                }
                this.text = str5;
            }
            if (this.macroDef.getText().getTrim()) {
                this.text = this.text.trim();
            }
            this.localAttributes.put(this.macroDef.getText().getName(), this.text);
        } else if (this.text != null && !this.text.trim().equals("")) {
            throw new BuildException(new StringBuffer().append("The \"").append(getTaskName()).append("\" macro does not support").append(" nested text data.").toString());
        }
        if (hashSet.size() != 0) {
            throw new BuildException(new StringBuffer().append("Unknown attribute").append(hashSet.size() > 1 ? "s " : " ").append(hashSet).toString());
        }
        UnknownElement copy = copy(this.macroDef.getNestedTask(), false);
        copy.init();
        LocalProperties localProperties = LocalProperties.get(getProject());
        localProperties.enterScope();
        try {
            try {
                copy.perform();
            } catch (BuildException e) {
                if (this.macroDef.getBackTrace()) {
                    throw ProjectHelper.addLocationToBuildException(e, getLocation());
                }
                e.setLocation(getLocation());
                throw e;
            }
        } finally {
            this.presentElements = null;
            this.localAttributes = null;
            localProperties.exitScope();
        }
    }

    public MacroDef getMacroDef() {
        return this.macroDef;
    }

    @Override // org.apache.tools.ant.DynamicAttribute
    public void setDynamicAttribute(String str, String str2) {
        this.map.put(str, str2);
    }

    public void setMacroDef(MacroDef macroDef) {
        this.macroDef = macroDef;
    }
}
