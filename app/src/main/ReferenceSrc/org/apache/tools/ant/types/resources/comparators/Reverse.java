package org.apache.tools.ant.types.resources.comparators;

import java.util.Stack;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.DataType;
import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/comparators/Reverse.class */
public class Reverse extends ResourceComparator {
    private static final String ONE_NESTED = "You must not nest more than one ResourceComparator for reversal.";
    private ResourceComparator nested;

    public Reverse() {
    }

    public Reverse(ResourceComparator resourceComparator) {
        add(resourceComparator);
    }

    public void add(ResourceComparator resourceComparator) {
        if (this.nested != null) {
            throw new BuildException(ONE_NESTED);
        }
        this.nested = resourceComparator;
        setChecked(false);
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        if (isChecked()) {
            return;
        }
        if (isReference()) {
            super.dieOnCircularReference(stack, project);
            return;
        }
        if (this.nested instanceof DataType) {
            pushAndInvokeCircularReferenceCheck(this.nested, stack, project);
        }
        setChecked(true);
    }

    @Override // org.apache.tools.ant.types.resources.comparators.ResourceComparator
    protected int resourceCompare(Resource resource, Resource resource2) {
        return (this.nested == null ? resource.compareTo(resource2) : this.nested.compare(resource, resource2)) * (-1);
    }
}
