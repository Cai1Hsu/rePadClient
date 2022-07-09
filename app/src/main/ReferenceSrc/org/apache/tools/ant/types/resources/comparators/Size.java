package org.apache.tools.ant.types.resources.comparators;

import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/comparators/Size.class */
public class Size extends ResourceComparator {
    @Override // org.apache.tools.ant.types.resources.comparators.ResourceComparator
    protected int resourceCompare(Resource resource, Resource resource2) {
        return (int) (resource.getSize() - resource2.getSize());
    }
}
