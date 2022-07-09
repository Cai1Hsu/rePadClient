package org.apache.tools.ant.types.resources;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/First.class */
public class First extends SizeLimitCollection {
    @Override // org.apache.tools.ant.types.resources.BaseResourceCollectionWrapper
    protected Collection getCollection() {
        int validCount = getValidCount();
        Iterator it = getResourceCollection().iterator();
        ArrayList arrayList = new ArrayList(validCount);
        for (int i = 0; i < validCount && it.hasNext(); i++) {
            arrayList.add(it.next());
        }
        return arrayList;
    }
}
