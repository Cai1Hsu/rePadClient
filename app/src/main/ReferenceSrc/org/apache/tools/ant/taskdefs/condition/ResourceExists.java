package org.apache.tools.ant.taskdefs.condition;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/ResourceExists.class */
public class ResourceExists extends ProjectComponent implements Condition {
    private Resource resource;

    public void add(Resource resource) {
        if (this.resource != null) {
            throw new BuildException("only one resource can be tested");
        }
        this.resource = resource;
    }

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        validate();
        return this.resource.isExists();
    }

    protected void validate() throws BuildException {
        if (this.resource == null) {
            throw new BuildException("resource is required");
        }
    }
}
