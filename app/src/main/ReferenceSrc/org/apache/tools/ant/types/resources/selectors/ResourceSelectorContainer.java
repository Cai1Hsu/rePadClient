package org.apache.tools.ant.types.resources.selectors;

import java.util.Collections;
import java.util.Iterator;
import java.util.Stack;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.DataType;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer.class */
public class ResourceSelectorContainer extends DataType {
    private Vector v = new Vector();

    public ResourceSelectorContainer() {
    }

    public ResourceSelectorContainer(ResourceSelector[] resourceSelectorArr) {
        for (ResourceSelector resourceSelector : resourceSelectorArr) {
            add(resourceSelector);
        }
    }

    public void add(ResourceSelector resourceSelector) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        if (resourceSelector == null) {
            return;
        }
        this.v.add(resourceSelector);
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
        Iterator it = this.v.iterator();
        while (it.hasNext()) {
            Object next = it.next();
            if (next instanceof DataType) {
                pushAndInvokeCircularReferenceCheck((DataType) next, stack, project);
            }
        }
        setChecked(true);
    }

    public Iterator getSelectors() {
        Iterator it;
        if (isReference()) {
            it = ((ResourceSelectorContainer) getCheckedRef()).getSelectors();
        } else {
            dieOnCircularReference();
            it = Collections.unmodifiableList(this.v).iterator();
        }
        return it;
    }

    public boolean hasSelectors() {
        boolean z;
        if (isReference()) {
            z = ((ResourceSelectorContainer) getCheckedRef()).hasSelectors();
        } else {
            dieOnCircularReference();
            z = !this.v.isEmpty();
        }
        return z;
    }

    public int selectorCount() {
        int size;
        if (isReference()) {
            size = ((ResourceSelectorContainer) getCheckedRef()).selectorCount();
        } else {
            dieOnCircularReference();
            size = this.v.size();
        }
        return size;
    }
}
