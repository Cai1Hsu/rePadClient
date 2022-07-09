package org.apache.tools.ant.types;

import java.util.Stack;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ComponentHelper;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.util.IdentityStack;

/* loaded from: classes.jar:org/apache/tools/ant/types/DataType.class */
public abstract class DataType extends ProjectComponent implements Cloneable {
    protected boolean checked = true;
    protected Reference ref;

    public static void invokeCircularReferenceCheck(DataType dataType, Stack stack, Project project) {
        dataType.dieOnCircularReference(stack, project);
    }

    public static void pushAndInvokeCircularReferenceCheck(DataType dataType, Stack stack, Project project) {
        stack.push(dataType);
        dataType.dieOnCircularReference(stack, project);
        stack.pop();
    }

    protected void checkAttributesAllowed() {
        if (isReference()) {
            throw tooManyAttributes();
        }
    }

    protected void checkChildrenAllowed() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
    }

    protected BuildException circularReference() {
        return new BuildException("This data type contains a circular reference.");
    }

    @Override // org.apache.tools.ant.ProjectComponent
    public Object clone() throws CloneNotSupportedException {
        DataType dataType = (DataType) super.clone();
        dataType.setDescription(getDescription());
        if (getRefid() != null) {
            dataType.setRefid(getRefid());
        }
        dataType.setChecked(isChecked());
        return dataType;
    }

    protected void dieOnCircularReference() {
        dieOnCircularReference(getProject());
    }

    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        if (this.checked || !isReference()) {
            return;
        }
        Object referencedObject = this.ref.getReferencedObject(project);
        if (referencedObject instanceof DataType) {
            IdentityStack identityStack = IdentityStack.getInstance(stack);
            if (identityStack.contains(referencedObject)) {
                throw circularReference();
            }
            identityStack.push(referencedObject);
            ((DataType) referencedObject).dieOnCircularReference(identityStack, project);
            identityStack.pop();
        }
        this.checked = true;
    }

    protected void dieOnCircularReference(Project project) {
        if (this.checked || !isReference()) {
            return;
        }
        dieOnCircularReference(new IdentityStack(this), project);
    }

    protected Object getCheckedRef() {
        return getCheckedRef(getProject());
    }

    protected Object getCheckedRef(Class cls, String str) {
        return getCheckedRef(cls, str, getProject());
    }

    protected Object getCheckedRef(Class cls, String str, Project project) {
        if (project == null) {
            throw new BuildException("No Project specified");
        }
        dieOnCircularReference(project);
        Object referencedObject = this.ref.getReferencedObject(project);
        if (cls.isAssignableFrom(referencedObject.getClass())) {
            return referencedObject;
        }
        log(new StringBuffer().append("Class ").append(referencedObject.getClass()).append(" is not a subclass of ").append(cls).toString(), 3);
        throw new BuildException(new StringBuffer().append(this.ref.getRefId()).append(" doesn't denote a ").append(str).toString());
    }

    protected Object getCheckedRef(Project project) {
        return getCheckedRef(getClass(), getDataTypeName(), project);
    }

    protected String getDataTypeName() {
        return ComponentHelper.getElementName(getProject(), this, true);
    }

    public Reference getRefid() {
        return this.ref;
    }

    protected boolean isChecked() {
        return this.checked;
    }

    public boolean isReference() {
        return this.ref != null;
    }

    protected BuildException noChildrenAllowed() {
        return new BuildException("You must not specify nested elements when using refid");
    }

    protected void setChecked(boolean z) {
        this.checked = z;
    }

    public void setRefid(Reference reference) {
        this.ref = reference;
        this.checked = false;
    }

    public String toString() {
        String description = getDescription();
        return description == null ? getDataTypeName() : new StringBuffer().append(getDataTypeName()).append(" ").append(description).toString();
    }

    protected BuildException tooManyAttributes() {
        return new BuildException("You must not specify more than one attribute when using refid");
    }
}
