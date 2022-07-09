package org.apache.tools.ant.types.resources.comparators;

import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/comparators/Exists.class */
public class Exists extends ResourceComparator {
    @Override // org.apache.tools.ant.types.resources.comparators.ResourceComparator
    protected int resourceCompare(Resource resource, Resource resource2) {
        boolean isExists = resource.isExists();
        return isExists == resource2.isExists() ? 0 : isExists ? 1 : -1;
    }
}
