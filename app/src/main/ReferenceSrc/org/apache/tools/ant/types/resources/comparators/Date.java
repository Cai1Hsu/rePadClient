package org.apache.tools.ant.types.resources.comparators;

import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/comparators/Date.class */
public class Date extends ResourceComparator {
    @Override // org.apache.tools.ant.types.resources.comparators.ResourceComparator
    protected int resourceCompare(Resource resource, Resource resource2) {
        long lastModified = resource.getLastModified() - resource2.getLastModified();
        return lastModified > 0 ? 1 : lastModified < 0 ? -1 : 0;
    }
}
