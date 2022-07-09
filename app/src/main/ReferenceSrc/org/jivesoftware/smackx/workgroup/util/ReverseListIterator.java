package org.jivesoftware.smackx.workgroup.util;

import java.util.Iterator;
import java.util.ListIterator;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/util/ReverseListIterator.class */
class ReverseListIterator<T> implements Iterator<T> {
    private ListIterator<T> _i;

    ReverseListIterator(ListIterator<T> listIterator) {
        this._i = listIterator;
        while (this._i.hasNext()) {
            this._i.next();
        }
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        return this._i.hasPrevious();
    }

    @Override // java.util.Iterator
    public T next() {
        return this._i.previous();
    }

    @Override // java.util.Iterator
    public void remove() {
        this._i.remove();
    }
}
