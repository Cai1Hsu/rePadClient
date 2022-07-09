package org.apache.tools.ant.types.resources;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.ResourceCollection;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/Difference.class */
public class Difference extends BaseResourceCollectionContainer {
    private static ResourceCollection nextRC(Iterator it) {
        return (ResourceCollection) it.next();
    }

    @Override // org.apache.tools.ant.types.resources.BaseResourceCollectionContainer
    protected Collection getCollection() {
        List resourceCollections = getResourceCollections();
        int size = resourceCollections.size();
        if (size < 2) {
            throw new BuildException(new StringBuffer().append("The difference of ").append(size).append(" resource collection").append(size == 1 ? "" : "s").append(" is undefined.").toString());
        }
        HashSet hashSet = new HashSet();
        ArrayList arrayList = new ArrayList();
        Iterator it = resourceCollections.iterator();
        while (it.hasNext()) {
            for (Object obj : nextRC(it)) {
                if (hashSet.add(obj)) {
                    arrayList.add(obj);
                } else {
                    arrayList.remove(obj);
                }
            }
        }
        return arrayList;
    }
}
