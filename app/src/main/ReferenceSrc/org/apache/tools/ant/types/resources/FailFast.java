package org.apache.tools.ant.types.resources;

import java.util.ConcurrentModificationException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.WeakHashMap;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/FailFast.class */
class FailFast implements Iterator {
    private static final WeakHashMap MAP = new WeakHashMap();
    private Object parent;
    private Iterator wrapped;

    FailFast(Object obj, Iterator it) {
        if (obj == null) {
            throw new IllegalArgumentException("parent object is null");
        }
        if (it == null) {
            throw new IllegalArgumentException("cannot wrap null iterator");
        }
        this.parent = obj;
        if (!it.hasNext()) {
            return;
        }
        this.wrapped = it;
        add(this);
    }

    private static void add(FailFast failFast) {
        synchronized (FailFast.class) {
            try {
                Set set = (Set) MAP.get(failFast.parent);
                Set set2 = set;
                if (set == null) {
                    set2 = new HashSet();
                    MAP.put(failFast.parent, set2);
                }
                set2.add(failFast);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    private static void failFast(FailFast failFast) {
        synchronized (FailFast.class) {
            try {
                if (!((Set) MAP.get(failFast.parent)).contains(failFast)) {
                    throw new ConcurrentModificationException();
                }
            } finally {
            }
        }
    }

    static void invalidate(Object obj) {
        synchronized (FailFast.class) {
            try {
                Set set = (Set) MAP.get(obj);
                if (set != null) {
                    set.clear();
                }
            } finally {
            }
        }
    }

    private static void remove(FailFast failFast) {
        synchronized (FailFast.class) {
            try {
                Set set = (Set) MAP.get(failFast.parent);
                if (set != null) {
                    set.remove(failFast);
                }
            } finally {
            }
        }
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        boolean hasNext;
        if (this.wrapped == null) {
            hasNext = false;
        } else {
            failFast(this);
            hasNext = this.wrapped.hasNext();
        }
        return hasNext;
    }

    @Override // java.util.Iterator
    public Object next() {
        if (this.wrapped == null || !this.wrapped.hasNext()) {
            throw new NoSuchElementException();
        }
        failFast(this);
        try {
            return this.wrapped.next();
        } finally {
            if (!this.wrapped.hasNext()) {
                this.wrapped = null;
                remove(this);
            }
        }
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException();
    }
}
