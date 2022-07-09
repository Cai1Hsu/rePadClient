package org.apache.tools.ant.taskdefs;

import org.apache.tools.ant.RuntimeConfigurable;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.TypeAdapter;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/AugmentReference.class */
public class AugmentReference extends Task implements TypeAdapter {
    private String id;

    private void hijackId() {
        synchronized (this) {
            if (this.id == null) {
                RuntimeConfigurable wrapper = getWrapper();
                this.id = wrapper.getId();
                if (this.id == null) {
                    throw new IllegalStateException(new StringBuffer().append(getTaskName()).append(" attribute 'id' unset").toString());
                }
                wrapper.setAttribute("id", null);
                wrapper.removeAttribute("id");
                wrapper.setElementTag(new StringBuffer().append("augmented reference \"").append(this.id).append("\"").toString());
            }
        }
    }

    private void restoreWrapperId() {
        synchronized (this) {
            if (this.id != null) {
                log(new StringBuffer().append("restoring augment wrapper ").append(this.id).toString(), 4);
                RuntimeConfigurable wrapper = getWrapper();
                wrapper.setAttribute("id", this.id);
                wrapper.setElementTag(getTaskName());
                this.id = null;
            }
        }
    }

    @Override // org.apache.tools.ant.TypeAdapter
    public void checkProxyClass(Class cls) {
    }

    @Override // org.apache.tools.ant.Task
    public void execute() {
        restoreWrapperId();
    }

    @Override // org.apache.tools.ant.TypeAdapter
    public Object getProxy() {
        Object reference;
        synchronized (this) {
            if (getProject() == null) {
                throw new IllegalStateException(new StringBuffer().append(getTaskName()).append("Project owner unset").toString());
            }
            hijackId();
            if (!getProject().hasReference(this.id)) {
                throw new IllegalStateException(new StringBuffer().append("Unknown reference \"").append(this.id).append("\"").toString());
            }
            reference = getProject().getReference(this.id);
            log(new StringBuffer().append("project reference ").append(this.id).append("=").append(String.valueOf(reference)).toString(), 4);
        }
        return reference;
    }

    @Override // org.apache.tools.ant.TypeAdapter
    public void setProxy(Object obj) {
        throw new UnsupportedOperationException();
    }
}
