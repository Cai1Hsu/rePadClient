package org.apache.tools.ant.types.resources;

import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Stack;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.DataType;
import org.apache.tools.ant.types.resources.comparators.DelegatedResourceComparator;
import org.apache.tools.ant.types.resources.comparators.ResourceComparator;
import org.apache.tools.ant.util.CollectionUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/Sort.class */
public class Sort extends BaseResourceCollectionWrapper {
    private DelegatedResourceComparator comp = new DelegatedResourceComparator();

    public void add(ResourceComparator resourceComparator) {
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            this.comp.add(resourceComparator);
            FailFast.invalidate(this);
            setChecked(false);
        }
    }

    @Override // org.apache.tools.ant.types.resources.AbstractResourceCollectionWrapper, org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        synchronized (this) {
            if (!isChecked()) {
                super.dieOnCircularReference(stack, project);
                if (!isReference()) {
                    DataType.pushAndInvokeCircularReferenceCheck(this.comp, stack, project);
                    setChecked(true);
                }
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v14, types: [java.util.Set] */
    @Override // org.apache.tools.ant.types.resources.BaseResourceCollectionWrapper
    protected Collection getCollection() {
        List list;
        synchronized (this) {
            Iterator it = getResourceCollection().iterator();
            if (!it.hasNext()) {
                list = Collections.EMPTY_SET;
            } else {
                list = (List) CollectionUtils.asCollection(it);
                Collections.sort(list, this.comp);
            }
        }
        return list;
    }
}
