package org.apache.tools.ant.types.resources.comparators;

import java.util.Iterator;
import java.util.Stack;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.DataType;
import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator.class */
public class DelegatedResourceComparator extends ResourceComparator {
    private Vector v = null;

    public void add(ResourceComparator resourceComparator) {
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            if (resourceComparator != null) {
                this.v = this.v == null ? new Vector() : this.v;
                this.v.add(resourceComparator);
                setChecked(false);
            }
        }
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
        if (this.v != null && !this.v.isEmpty()) {
            Iterator it = this.v.iterator();
            while (it.hasNext()) {
                Object next = it.next();
                if (next instanceof DataType) {
                    pushAndInvokeCircularReferenceCheck((DataType) next, stack, project);
                }
            }
        }
        setChecked(true);
    }

    @Override // org.apache.tools.ant.types.resources.comparators.ResourceComparator, java.util.Comparator
    public boolean equals(Object obj) {
        boolean z = true;
        synchronized (this) {
            if (obj != this) {
                if (isReference()) {
                    z = getCheckedRef().equals(obj);
                } else if (!(obj instanceof DelegatedResourceComparator)) {
                    z = false;
                } else {
                    Vector vector = ((DelegatedResourceComparator) obj).v;
                    if (this.v != null) {
                        z = this.v.equals(vector);
                    } else if (vector != null) {
                        z = false;
                    }
                }
            }
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.resources.comparators.ResourceComparator
    public int hashCode() {
        int hashCode;
        synchronized (this) {
            hashCode = isReference() ? getCheckedRef().hashCode() : this.v == null ? 0 : this.v.hashCode();
        }
        return hashCode;
    }

    @Override // org.apache.tools.ant.types.resources.comparators.ResourceComparator
    protected int resourceCompare(Resource resource, Resource resource2) {
        int i;
        synchronized (this) {
            if (this.v != null && !this.v.isEmpty()) {
                int i2 = 0;
                Iterator it = this.v.iterator();
                while (true) {
                    i = i2;
                    if (i2 != 0) {
                        break;
                    }
                    i = i2;
                    if (!it.hasNext()) {
                        break;
                    }
                    i2 = ((ResourceComparator) it.next()).resourceCompare(resource, resource2);
                }
            } else {
                i = resource.compareTo(resource2);
            }
        }
        return i;
    }
}
