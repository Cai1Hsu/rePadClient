package org.apache.tools.ant.types.resources;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.ResourceCollection;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/Intersect.class */
public class Intersect extends BaseResourceCollectionContainer {
    private ArrayList collect(Object obj) {
        ArrayList arrayList = new ArrayList();
        for (Object obj2 : (ResourceCollection) obj) {
            arrayList.add(obj2);
        }
        return arrayList;
    }

    @Override // org.apache.tools.ant.types.resources.BaseResourceCollectionContainer
    protected Collection getCollection() {
        List resourceCollections = getResourceCollections();
        int size = resourceCollections.size();
        if (size < 2) {
            throw new BuildException(new StringBuffer().append("The intersection of ").append(size).append(" resource collection").append(size == 1 ? "" : "s").append(" is undefined.").toString());
        }
        ArrayList arrayList = new ArrayList();
        Iterator it = resourceCollections.iterator();
        arrayList.addAll(collect(it.next()));
        while (it.hasNext()) {
            arrayList.retainAll(collect(it.next()));
        }
        return arrayList;
    }
}
