package org.bson;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import org.bson.LazyBSONObject;
import org.bson.io.BSONByteBuffer;

/* loaded from: classes.jar:org/bson/LazyBSONList.class */
public class LazyBSONList extends LazyBSONObject implements List {

    /* loaded from: classes.jar:org/bson/LazyBSONList$LazyBSONListIterator.class */
    public class LazyBSONListIterator implements Iterator {
        List<LazyBSONObject.ElementRecord> elements;
        int pos = 0;

        public LazyBSONListIterator() {
            LazyBSONList.this = r4;
            this.elements = r4.getElements();
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.pos < this.elements.size();
        }

        @Override // java.util.Iterator
        public Object next() {
            LazyBSONList lazyBSONList = LazyBSONList.this;
            List<LazyBSONObject.ElementRecord> list = this.elements;
            int i = this.pos;
            this.pos = i + 1;
            return lazyBSONList.getElementValue(list.get(i));
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException("Read Only");
        }
    }

    public LazyBSONList(BSONByteBuffer bSONByteBuffer, int i, LazyBSONCallback lazyBSONCallback) {
        super(bSONByteBuffer, i, lazyBSONCallback);
    }

    public LazyBSONList(BSONByteBuffer bSONByteBuffer, LazyBSONCallback lazyBSONCallback) {
        super(bSONByteBuffer, lazyBSONCallback);
    }

    public LazyBSONList(byte[] bArr, int i, LazyBSONCallback lazyBSONCallback) {
        super(bArr, i, lazyBSONCallback);
    }

    public LazyBSONList(byte[] bArr, LazyBSONCallback lazyBSONCallback) {
        super(bArr, lazyBSONCallback);
    }

    @Override // java.util.List
    public void add(int i, Object obj) {
        throw new UnsupportedOperationException("Read Only");
    }

    @Override // java.util.List, java.util.Collection
    public boolean add(Object obj) {
        throw new UnsupportedOperationException("Read Only");
    }

    @Override // java.util.List
    public boolean addAll(int i, Collection collection) {
        throw new UnsupportedOperationException("Read Only");
    }

    @Override // java.util.List, java.util.Collection
    public boolean addAll(Collection collection) {
        throw new UnsupportedOperationException("Read Only");
    }

    @Override // java.util.List, java.util.Collection
    public void clear() {
        throw new UnsupportedOperationException("Read Only");
    }

    @Override // java.util.List, java.util.Collection
    public boolean contains(Object obj) {
        return indexOf(obj) > -1;
    }

    @Override // java.util.List, java.util.Collection
    public boolean containsAll(Collection collection) {
        boolean z;
        Iterator it = collection.iterator();
        while (true) {
            if (!it.hasNext()) {
                z = true;
                break;
            } else if (!contains(it.next())) {
                z = false;
                break;
            }
        }
        return z;
    }

    @Override // java.util.List
    public Object get(int i) {
        return get("" + i);
    }

    @Override // java.util.List
    public int indexOf(Object obj) {
        int i = 0;
        Iterator it = iterator();
        while (true) {
            if (!it.hasNext()) {
                i = -1;
                break;
            } else if (obj.equals(it.next())) {
                break;
            } else {
                i++;
            }
        }
        return i;
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    public Iterator iterator() {
        return new LazyBSONListIterator();
    }

    @Override // java.util.List
    public int lastIndexOf(Object obj) {
        int i = 0;
        int i2 = -1;
        Iterator it = iterator();
        while (it.hasNext()) {
            if (obj.equals(it.next())) {
                i2 = i;
            }
            i++;
        }
        return i2;
    }

    @Override // java.util.List
    public ListIterator listIterator() {
        throw new UnsupportedOperationException("Not Supported");
    }

    @Override // java.util.List
    public ListIterator listIterator(int i) {
        throw new UnsupportedOperationException("Not Supported");
    }

    @Override // java.util.List
    public Object remove(int i) {
        throw new UnsupportedOperationException("Read Only");
    }

    @Override // java.util.List, java.util.Collection
    public boolean remove(Object obj) {
        throw new UnsupportedOperationException("Read Only");
    }

    @Override // java.util.List, java.util.Collection
    public boolean removeAll(Collection collection) {
        throw new UnsupportedOperationException("Read Only");
    }

    @Override // java.util.List, java.util.Collection
    public boolean retainAll(Collection collection) {
        throw new UnsupportedOperationException("Read Only");
    }

    @Override // java.util.List
    public Object set(int i, Object obj) {
        throw new UnsupportedOperationException("Read Only");
    }

    @Override // java.util.List, java.util.Collection
    public int size() {
        return getElements().size();
    }

    @Override // java.util.List
    public List subList(int i, int i2) {
        throw new UnsupportedOperationException("Not Supported");
    }

    @Override // java.util.List, java.util.Collection
    public Object[] toArray() {
        throw new UnsupportedOperationException("Not Supported");
    }

    @Override // java.util.List, java.util.Collection
    public Object[] toArray(Object[] objArr) {
        throw new UnsupportedOperationException("Not Supported");
    }
}
