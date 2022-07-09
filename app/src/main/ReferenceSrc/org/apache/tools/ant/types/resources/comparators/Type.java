package org.apache.tools.ant.types.resources.comparators;

import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/comparators/Type.class */
public class Type extends ResourceComparator {
    @Override // org.apache.tools.ant.types.resources.comparators.ResourceComparator
    protected int resourceCompare(Resource resource, Resource resource2) {
        boolean isDirectory = resource.isDirectory();
        return isDirectory == resource2.isDirectory() ? 0 : isDirectory ? 1 : -1;
    }
}
