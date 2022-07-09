package org.apache.tools.ant.taskdefs;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.condition.Condition;
import org.apache.tools.ant.types.Comparison;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.ResourceCollection;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/ResourceCount.class */
public class ResourceCount extends Task implements Condition {
    private static final String COUNT_REQUIRED = "Use of the ResourceCount condition requires that the count attribute be set.";
    private static final String ONE_NESTED_MESSAGE = "ResourceCount can count resources from exactly one nested ResourceCollection.";
    private Integer count;
    private String property;
    private ResourceCollection rc;
    private Comparison when = Comparison.EQUAL;

    public void add(ResourceCollection resourceCollection) {
        if (this.rc != null) {
            throw new BuildException(ONE_NESTED_MESSAGE);
        }
        this.rc = resourceCollection;
    }

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() {
        if (this.rc == null) {
            throw new BuildException(ONE_NESTED_MESSAGE);
        }
        if (this.count != null) {
            return this.when.evaluate(new Integer(this.rc.size()).compareTo(this.count));
        }
        throw new BuildException(COUNT_REQUIRED);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() {
        if (this.rc == null) {
            throw new BuildException(ONE_NESTED_MESSAGE);
        }
        if (this.property == null) {
            log(new StringBuffer().append("resource count = ").append(this.rc.size()).toString());
        } else {
            getProject().setNewProperty(this.property, Integer.toString(this.rc.size()));
        }
    }

    public void setCount(int i) {
        this.count = new Integer(i);
    }

    public void setProperty(String str) {
        this.property = str;
    }

    public void setRefid(Reference reference) {
        Object referencedObject = reference.getReferencedObject();
        if (!(referencedObject instanceof ResourceCollection)) {
            throw new BuildException(new StringBuffer().append(reference.getRefId()).append(" doesn't denote a ResourceCollection").toString());
        }
        add((ResourceCollection) referencedObject);
    }

    public void setWhen(Comparison comparison) {
        this.when = comparison;
    }
}
