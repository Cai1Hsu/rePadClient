package org.apache.tools.ant.taskdefs.optional.script;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DynamicConfigurator;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/script/ScriptDefBase.class */
public class ScriptDefBase extends Task implements DynamicConfigurator {
    private String text;
    private Map nestedElementMap = new HashMap();
    private Map attributes = new HashMap();

    private ScriptDef getScript() {
        String taskType = getTaskType();
        Map map = (Map) getProject().getReference(MagicNames.SCRIPT_REPOSITORY);
        if (map == null) {
            throw new BuildException(new StringBuffer().append("Script repository not found for ").append(taskType).toString());
        }
        ScriptDef scriptDef = (ScriptDef) map.get(getTaskType());
        if (scriptDef != null) {
            return scriptDef;
        }
        throw new BuildException(new StringBuffer().append("Script definition not found for ").append(taskType).toString());
    }

    public void addText(String str) {
        this.text = getProject().replaceProperties(str);
    }

    @Override // org.apache.tools.ant.DynamicElement
    public Object createDynamicElement(String str) {
        List list = (List) this.nestedElementMap.get(str);
        ArrayList arrayList = list;
        if (list == null) {
            arrayList = new ArrayList();
            this.nestedElementMap.put(str, arrayList);
        }
        Object createNestedElement = getScript().createNestedElement(str);
        arrayList.add(createNestedElement);
        return createNestedElement;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() {
        getScript().executeScript(this.attributes, this.nestedElementMap, this);
    }

    public void fail(String str) {
        throw new BuildException(str);
    }

    public String getText() {
        return this.text;
    }

    @Override // org.apache.tools.ant.DynamicAttribute
    public void setDynamicAttribute(String str, String str2) {
        if (!getScript().isAttributeSupported(str)) {
            throw new BuildException(new StringBuffer().append("<").append(getTaskType()).append("> does not support the \"").append(str).append("\" attribute").toString());
        }
        this.attributes.put(str, str2);
    }
}
