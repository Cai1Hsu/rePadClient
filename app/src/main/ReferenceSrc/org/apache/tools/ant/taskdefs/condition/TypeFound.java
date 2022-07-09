package org.apache.tools.ant.taskdefs.condition;

import org.apache.tools.ant.AntTypeDefinition;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ComponentHelper;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.ProjectHelper;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/TypeFound.class */
public class TypeFound extends ProjectComponent implements Condition {
    private String name;
    private String uri;

    protected boolean doesTypeExist(String str) {
        boolean z = false;
        boolean z2 = false;
        ComponentHelper componentHelper = ComponentHelper.getComponentHelper(getProject());
        String genComponentName = ProjectHelper.genComponentName(this.uri, str);
        AntTypeDefinition definition = componentHelper.getDefinition(genComponentName);
        if (definition != null) {
            if (definition.getExposedClass(getProject()) != null) {
                z = true;
            }
            z2 = z;
            if (!z) {
                log(componentHelper.diagnoseCreationFailure(genComponentName, "type"), 3);
                z2 = z;
            }
        }
        return z2;
    }

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        if (this.name == null) {
            throw new BuildException("No type specified");
        }
        return doesTypeExist(this.name);
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setURI(String str) {
        this.uri = str;
    }
}
