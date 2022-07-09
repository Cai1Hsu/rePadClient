package org.apache.tools.ant.types.resources;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.ResourceCollection;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/Last.class */
public class Last extends SizeLimitCollection {
    @Override // org.apache.tools.ant.types.resources.BaseResourceCollectionWrapper
    protected Collection getCollection() {
        int validCount = getValidCount();
        ResourceCollection resourceCollection = getResourceCollection();
        int i = validCount;
        Iterator it = resourceCollection.iterator();
        int size = resourceCollection.size();
        while (i < size) {
            it.next();
            i++;
        }
        ArrayList arrayList = new ArrayList(validCount);
        while (it.hasNext()) {
            arrayList.add(it.next());
            i++;
        }
        int size2 = arrayList.size();
        Collection collection = arrayList;
        if (size2 != validCount) {
            if (size >= validCount || size2 != size) {
                String stringBuffer = new StringBuffer().append("Resource collection ").append(resourceCollection).append(" reports size ").append(size).append(" but returns ").append(i).append(" elements.").toString();
                if (size2 <= validCount) {
                    throw new BuildException(stringBuffer);
                }
                log(stringBuffer, 1);
                collection = arrayList.subList(size2 - validCount, size2);
            } else {
                collection = arrayList;
            }
        }
        return collection;
    }
}
