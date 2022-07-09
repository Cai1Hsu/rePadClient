package org.apache.tools.ant.taskdefs.condition;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.types.Reference;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/IsReference.class */
public class IsReference extends ProjectComponent implements Condition {
    private Reference ref;
    private String type;

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        boolean z = false;
        if (this.ref == null) {
            throw new BuildException("No reference specified for isreference condition");
        }
        String refId = this.ref.getRefId();
        if (getProject().hasReference(refId)) {
            if (this.type == null) {
                z = true;
            } else {
                Object reference = getProject().getReference(refId);
                Class cls = (Class) getProject().getDataTypeDefinitions().get(this.type);
                Class cls2 = cls;
                if (cls == null) {
                    cls2 = (Class) getProject().getTaskDefinitions().get(this.type);
                }
                if (cls2 != null) {
                    z = cls2.isAssignableFrom(reference.getClass());
                }
            }
        }
        return z;
    }

    public void setRefid(Reference reference) {
        this.ref = reference;
    }

    public void setType(String str) {
        this.type = str;
    }
}
