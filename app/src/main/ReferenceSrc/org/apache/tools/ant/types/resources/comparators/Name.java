package org.apache.tools.ant.types.resources.comparators;

import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/comparators/Name.class */
public class Name extends ResourceComparator {
    @Override // org.apache.tools.ant.types.resources.comparators.ResourceComparator
    protected int resourceCompare(Resource resource, Resource resource2) {
        return resource.getName().compareTo(resource2.getName());
    }
}
