package org.apache.tools.ant.types.resources.selectors;

import org.apache.tools.ant.AntTypeDefinition;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ComponentHelper;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectHelper;
import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/selectors/InstanceOf.class */
public class InstanceOf implements ResourceSelector {
    private static final String ONE_ONLY = "Exactly one of class|type must be set.";
    private Class clazz;
    private Project project;
    private String type;
    private String uri;

    public Class getCheckClass() {
        return this.clazz;
    }

    public String getType() {
        return this.type;
    }

    public String getURI() {
        return this.uri;
    }

    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
    public boolean isSelected(Resource resource) {
        boolean z = true;
        boolean z2 = this.clazz == null;
        if (this.type != null) {
            z = false;
        }
        if (z2 == z) {
            throw new BuildException(ONE_ONLY);
        }
        Class cls = this.clazz;
        if (this.type != null) {
            if (this.project == null) {
                throw new BuildException("No project set for InstanceOf ResourceSelector; the type attribute is invalid.");
            }
            AntTypeDefinition definition = ComponentHelper.getComponentHelper(this.project).getDefinition(ProjectHelper.genComponentName(this.uri, this.type));
            if (definition == null) {
                throw new BuildException(new StringBuffer().append("type ").append(this.type).append(" not found.").toString());
            }
            try {
                cls = definition.innerGetTypeClass();
            } catch (ClassNotFoundException e) {
                throw new BuildException(e);
            }
        }
        return cls.isAssignableFrom(resource.getClass());
    }

    public void setClass(Class cls) {
        if (this.clazz != null) {
            throw new BuildException("The class attribute has already been set.");
        }
        this.clazz = cls;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public void setType(String str) {
        this.type = str;
    }

    public void setURI(String str) {
        this.uri = str;
    }
}
