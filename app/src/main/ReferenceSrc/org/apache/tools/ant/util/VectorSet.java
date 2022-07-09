package org.apache.tools.ant.util;

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Vector;

/* loaded from: classes.jar:org/apache/tools/ant/util/VectorSet.class */
public final class VectorSet extends Vector {
    private final HashSet set = new HashSet();

    public VectorSet() {
    }

    public VectorSet(int i) {
        super(i);
    }

    public VectorSet(int i, int i2) {
        super(i, i2);
    }

    public VectorSet(Collection collection) {
        if (collection != null) {
            for (Object obj : collection) {
                add(obj);
            }
        }
    }

    private void doAdd(int i, Object obj) {
        synchronized (this) {
            if (this.set.add(obj)) {
                int size = size();
                ensureCapacity(size + 1);
                if (i != size) {
                    System.arraycopy(this.elementData, i, this.elementData, i + 1, size - i);
                }
                this.elementData[i] = obj;
                this.elementCount++;
            }
        }
    }

    private boolean doRemove(Object obj) {
        boolean z;
        synchronized (this) {
            if (this.set.remove(obj)) {
                int indexOf = indexOf(obj);
                if (indexOf < this.elementData.length - 1) {
                    System.arraycopy(this.elementData, indexOf + 1, this.elementData, indexOf, (this.elementData.length - indexOf) - 1);
                }
                this.elementCount--;
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }

    @Override // java.util.Vector, java.util.AbstractList, java.util.List
    public void add(int i, Object obj) {
        doAdd(i, obj);
    }

    @Override // java.util.Vector, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public boolean add(Object obj) {
        boolean z;
        synchronized (this) {
            if (!this.set.contains(obj)) {
                doAdd(size(), obj);
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }

    @Override // java.util.Vector, java.util.AbstractList, java.util.List
    public boolean addAll(int i, Collection collection) {
        Throwable th;
        synchronized (this) {
            boolean z = false;
            try {
                for (Object obj : collection) {
                    try {
                        if (!this.set.contains(obj)) {
                            int i2 = i + 1;
                            doAdd(i, obj);
                            z = true;
                            i = i2;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        throw th;
                    }
                }
                return z;
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    @Override // java.util.Vector, java.util.AbstractCollection, java.util.Collection, java.util.List
    public boolean addAll(Collection collection) {
        boolean z;
        synchronized (this) {
            z = false;
            for (Object obj : collection) {
                z |= add(obj);
            }
        }
        return z;
    }

    @Override // java.util.Vector
    public void addElement(Object obj) {
        synchronized (this) {
            doAdd(size(), obj);
        }
    }

    @Override // java.util.Vector, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public void clear() {
        synchronized (this) {
            super.clear();
            this.set.clear();
        }
    }

    @Override // java.util.Vector
    public Object clone() {
        VectorSet vectorSet = (VectorSet) super.clone();
        vectorSet.set.addAll(this.set);
        return vectorSet;
    }

    @Override // java.util.Vector, java.util.AbstractCollection, java.util.Collection, java.util.List
    public boolean contains(Object obj) {
        boolean contains;
        synchronized (this) {
            contains = this.set.contains(obj);
        }
        return contains;
    }

    @Override // java.util.Vector, java.util.AbstractCollection, java.util.Collection, java.util.List
    public boolean containsAll(Collection collection) {
        boolean containsAll;
        synchronized (this) {
            containsAll = this.set.containsAll(collection);
        }
        return containsAll;
    }

    @Override // java.util.Vector
    public void insertElementAt(Object obj, int i) {
        doAdd(i, obj);
    }

    @Override // java.util.Vector, java.util.AbstractList, java.util.List
    public Object remove(int i) {
        Object obj;
        synchronized (this) {
            obj = get(i);
            remove(obj);
        }
        return obj;
    }

    @Override // java.util.Vector, java.util.AbstractCollection, java.util.Collection, java.util.List
    public boolean remove(Object obj) {
        return doRemove(obj);
    }

    @Override // java.util.Vector, java.util.AbstractCollection, java.util.Collection, java.util.List
    public boolean removeAll(Collection collection) {
        boolean z;
        synchronized (this) {
            z = false;
            for (Object obj : collection) {
                z |= remove(obj);
            }
        }
        return z;
    }

    @Override // java.util.Vector
    public void removeAllElements() {
        synchronized (this) {
            this.set.clear();
            super.removeAllElements();
        }
    }

    @Override // java.util.Vector
    public boolean removeElement(Object obj) {
        return doRemove(obj);
    }

    @Override // java.util.Vector
    public void removeElementAt(int i) {
        synchronized (this) {
            remove(get(i));
        }
    }

    @Override // java.util.Vector, java.util.AbstractList
    public void removeRange(int i, int i2) {
        synchronized (this) {
            while (i2 > i) {
                i2--;
                remove(i2);
            }
        }
    }

    @Override // java.util.Vector, java.util.AbstractCollection, java.util.Collection, java.util.List
    public boolean retainAll(Collection collection) {
        boolean z;
        synchronized (this) {
            LinkedList linkedList = new LinkedList();
            Iterator it = iterator();
            while (it.hasNext()) {
                Object next = it.next();
                if (!collection.contains(next)) {
                    linkedList.addLast(next);
                }
            }
            if (!linkedList.isEmpty()) {
                removeAll(linkedList);
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }

    @Override // java.util.Vector, java.util.AbstractList, java.util.List
    public Object set(int i, Object obj) {
        Object obj2;
        synchronized (this) {
            obj2 = get(i);
            if (this.set.add(obj)) {
                this.elementData[i] = obj;
                this.set.remove(obj2);
            } else {
                int indexOf = indexOf(obj);
                remove(obj);
                remove(obj2);
                if (indexOf <= i) {
                    i--;
                }
                add(i, obj);
            }
        }
        return obj2;
    }

    @Override // java.util.Vector
    public void setElementAt(Object obj, int i) {
        set(i, obj);
    }
}
