package org.bson.util;

import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

/* loaded from: classes.jar:org/bson/util/StringRangeSet.class */
public class StringRangeSet implements Set<String> {
    private static final String[] NUMSTRS = new String[100];
    private static final int NUMSTR_LEN = 100;
    private final int size;

    static {
        for (int i = 0; i < 100; i++) {
            NUMSTRS[i] = String.valueOf(i);
        }
    }

    public StringRangeSet(int i) {
        this.size = i;
    }

    public boolean add(String str) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Set, java.util.Collection
    public boolean addAll(Collection<? extends String> collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Set, java.util.Collection
    public void clear() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Set, java.util.Collection
    public boolean contains(Object obj) {
        int parseInt = Integer.parseInt(String.valueOf(obj));
        return parseInt >= 0 && parseInt < this.size;
    }

    @Override // java.util.Set, java.util.Collection
    public boolean containsAll(Collection<?> collection) {
        boolean z;
        Iterator<?> it = collection.iterator();
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

    @Override // java.util.Set, java.util.Collection
    public boolean isEmpty() {
        return false;
    }

    @Override // java.util.Set, java.util.Collection, java.lang.Iterable
    public Iterator<String> iterator() {
        return new Iterator<String>() { // from class: org.bson.util.StringRangeSet.1
            int index = 0;

            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.index < StringRangeSet.this.size;
            }

            @Override // java.util.Iterator
            public String next() {
                String valueOf;
                if (this.index < 100) {
                    String[] strArr = StringRangeSet.NUMSTRS;
                    int i = this.index;
                    this.index = i + 1;
                    valueOf = strArr[i];
                } else {
                    int i2 = this.index;
                    this.index = i2 + 1;
                    valueOf = String.valueOf(i2);
                }
                return valueOf;
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException();
            }
        };
    }

    @Override // java.util.Set, java.util.Collection
    public boolean remove(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Set, java.util.Collection
    public boolean removeAll(Collection<?> collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Set, java.util.Collection
    public boolean retainAll(Collection<?> collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Set, java.util.Collection
    public int size() {
        return this.size;
    }

    @Override // java.util.Set, java.util.Collection
    public Object[] toArray() {
        String[] strArr = new String[size()];
        for (int i = 0; i < this.size; i++) {
            if (i < 100) {
                strArr[i] = NUMSTRS[i];
            } else {
                strArr[i] = String.valueOf(i);
            }
        }
        return strArr;
    }

    @Override // java.util.Set, java.util.Collection
    public <T> T[] toArray(T[] tArr) {
        throw new UnsupportedOperationException();
    }
}
