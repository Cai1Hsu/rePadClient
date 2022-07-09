package org.apache.tools.ant.types.resources;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/LazyResourceCollectionWrapper.class */
public class LazyResourceCollectionWrapper extends AbstractResourceCollectionWrapper {
    private List cachedResources = new ArrayList();
    private FilteringIterator filteringIterator;

    /* loaded from: classes.jar:org/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$CachedIterator.class */
    private class CachedIterator implements Iterator {
        int cusrsor = 0;
        private final Iterator it;
        private final LazyResourceCollectionWrapper this$0;

        public CachedIterator(LazyResourceCollectionWrapper lazyResourceCollectionWrapper, Iterator it) {
            this.this$0 = lazyResourceCollectionWrapper;
            this.it = it;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            boolean z = true;
            synchronized (this.this$0.cachedResources) {
                if (this.this$0.cachedResources.size() <= this.cusrsor) {
                    if (!this.it.hasNext()) {
                        z = false;
                    } else {
                        this.this$0.cachedResources.add((Resource) this.it.next());
                    }
                }
            }
            return z;
        }

        @Override // java.util.Iterator
        public Object next() {
            Object obj;
            if (!hasNext()) {
                throw new NoSuchElementException();
            }
            synchronized (this.this$0.cachedResources) {
                List list = this.this$0.cachedResources;
                int i = this.cusrsor;
                this.cusrsor = i + 1;
                obj = list.get(i);
            }
            return obj;
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException();
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/types/resources/LazyResourceCollectionWrapper$FilteringIterator.class */
    private class FilteringIterator implements Iterator {
        protected final Iterator it;
        private final LazyResourceCollectionWrapper this$0;
        Resource next = null;
        boolean ended = false;

        public FilteringIterator(LazyResourceCollectionWrapper lazyResourceCollectionWrapper, Iterator it) {
            this.this$0 = lazyResourceCollectionWrapper;
            this.it = it;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            boolean z;
            if (!this.ended) {
                while (true) {
                    if (this.next != null) {
                        z = true;
                        break;
                    } else if (!this.it.hasNext()) {
                        this.ended = true;
                        z = false;
                        break;
                    } else {
                        this.next = (Resource) this.it.next();
                        if (this.this$0.filterResource(this.next)) {
                            this.next = null;
                        }
                    }
                }
            } else {
                z = false;
            }
            return z;
        }

        @Override // java.util.Iterator
        public Object next() {
            if (!hasNext()) {
                throw new UnsupportedOperationException();
            }
            Resource resource = this.next;
            this.next = null;
            return resource;
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException();
        }
    }

    @Override // org.apache.tools.ant.types.resources.AbstractResourceCollectionWrapper
    protected Iterator createIterator() {
        Iterator filteringIterator;
        if (isCache()) {
            if (this.filteringIterator == null) {
                this.filteringIterator = new FilteringIterator(this, getResourceCollection().iterator());
            }
            filteringIterator = new CachedIterator(this, this.filteringIterator);
        } else {
            filteringIterator = new FilteringIterator(this, getResourceCollection().iterator());
        }
        return filteringIterator;
    }

    protected boolean filterResource(Resource resource) {
        return false;
    }

    @Override // org.apache.tools.ant.types.resources.AbstractResourceCollectionWrapper
    protected int getSize() {
        Iterator createIterator = createIterator();
        int i = 0;
        while (createIterator.hasNext()) {
            createIterator.next();
            i++;
        }
        return i;
    }
}
