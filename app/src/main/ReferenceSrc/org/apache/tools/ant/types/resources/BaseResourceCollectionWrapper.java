package org.apache.tools.ant.types.resources;

import java.util.Collection;
import java.util.Iterator;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/BaseResourceCollectionWrapper.class */
public abstract class BaseResourceCollectionWrapper extends AbstractResourceCollectionWrapper {
    private Collection coll = null;

    private Collection cacheCollection() {
        Collection collection;
        synchronized (this) {
            if (this.coll == null || !isCache()) {
                this.coll = getCollection();
            }
            collection = this.coll;
        }
        return collection;
    }

    @Override // org.apache.tools.ant.types.resources.AbstractResourceCollectionWrapper
    protected Iterator createIterator() {
        return cacheCollection().iterator();
    }

    protected abstract Collection getCollection();

    @Override // org.apache.tools.ant.types.resources.AbstractResourceCollectionWrapper
    protected int getSize() {
        return cacheCollection().size();
    }
}
