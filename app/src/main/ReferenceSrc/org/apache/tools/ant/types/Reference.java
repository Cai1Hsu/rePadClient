package org.apache.tools.ant.types;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;

/* loaded from: classes.jar:org/apache/tools/ant/types/Reference.class */
public class Reference {
    private Project project;
    private String refid;

    public Reference() {
    }

    public Reference(String str) {
        setRefId(str);
    }

    public Reference(Project project, String str) {
        setRefId(str);
        setProject(project);
    }

    public Project getProject() {
        return this.project;
    }

    public String getRefId() {
        return this.refid;
    }

    public Object getReferencedObject() throws BuildException {
        if (this.project == null) {
            throw new BuildException(new StringBuffer().append("No project set on reference to ").append(this.refid).toString());
        }
        return getReferencedObject(this.project);
    }

    public Object getReferencedObject(Project project) throws BuildException {
        if (this.refid == null) {
            throw new BuildException("No reference specified");
        }
        Object reference = this.project == null ? project.getReference(this.refid) : this.project.getReference(this.refid);
        if (reference != null) {
            return reference;
        }
        throw new BuildException(new StringBuffer().append("Reference ").append(this.refid).append(" not found.").toString());
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public void setRefId(String str) {
        this.refid = str;
    }
}
