package com.mongodb.util;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

@Deprecated
/* loaded from: classes.dex */
public class WeakBag<T> implements Iterable<T> {
    private final List<WeakBag<T>.MyRef> _refs = new LinkedList();

    public void add(T t) {
        this._refs.add(new MyRef(t));
    }

    public boolean remove(T t) {
        Iterator<WeakBag<T>.MyRef> i = this._refs.iterator();
        while (i.hasNext()) {
            WeakBag<T>.MyRef ref = i.next();
            if (ref != null) {
                Object obj = ref.get();
                if (obj == null) {
                    i.remove();
                } else if (obj == t) {
                    i.remove();
                    return true;
                }
            }
        }
        return false;
    }

    public boolean contains(T t) {
        for (WeakBag<T>.MyRef ref : this._refs) {
            if (ref.get() == t) {
                return true;
            }
        }
        return false;
    }

    public int size() {
        clean();
        return this._refs.size();
    }

    public void clear() {
        this._refs.clear();
    }

    public void clean() {
        Iterator<WeakBag<T>.MyRef> i = this._refs.iterator();
        while (i.hasNext()) {
            WeakBag<T>.MyRef ref = i.next();
            if (ref.get() == null) {
                i.remove();
            }
        }
    }

    @Override // java.lang.Iterable
    public Iterator<T> iterator() {
        return getAll().iterator();
    }

    public List<T> getAll() {
        ArrayList arrayList = new ArrayList();
        Iterator<WeakBag<T>.MyRef> i = this._refs.iterator();
        while (i.hasNext()) {
            WeakBag<T>.MyRef ref = i.next();
            Object obj = ref.get();
            if (obj == null) {
                i.remove();
            } else {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    /* loaded from: classes.dex */
    class MyRef extends WeakReference<T> {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        MyRef(T t) {
            super(t);
            WeakBag.this = r1;
        }
    }
}
