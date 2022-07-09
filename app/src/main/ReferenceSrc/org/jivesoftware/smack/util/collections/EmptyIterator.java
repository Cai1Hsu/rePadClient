package org.jivesoftware.smack.util.collections;

import java.util.Iterator;

/* loaded from: classes.jar:org/jivesoftware/smack/util/collections/EmptyIterator.class */
public class EmptyIterator<E> extends AbstractEmptyIterator<E> implements ResettableIterator<E> {
    public static final ResettableIterator RESETTABLE_INSTANCE = new EmptyIterator();
    public static final Iterator INSTANCE = RESETTABLE_INSTANCE;

    protected EmptyIterator() {
    }

    public static <T> Iterator<T> getInstance() {
        return INSTANCE;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r4v0, resolved type: java.lang.Object */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ void add(Object obj) {
        super.add(obj);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ Object getKey() {
        return super.getKey();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ Object getValue() {
        return super.getValue();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator, java.util.Iterator
    public /* bridge */ /* synthetic */ boolean hasNext() {
        return super.hasNext();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ boolean hasPrevious() {
        return super.hasPrevious();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator, java.util.Iterator
    public /* bridge */ /* synthetic */ Object next() {
        return super.next();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ int nextIndex() {
        return super.nextIndex();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ Object previous() {
        return super.previous();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ int previousIndex() {
        return super.previousIndex();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator, java.util.Iterator
    public /* bridge */ /* synthetic */ void remove() {
        super.remove();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator, org.jivesoftware.smack.util.collections.ResettableIterator
    public /* bridge */ /* synthetic */ void reset() {
        super.reset();
    }

    /* JADX DEBUG: Multi-variable search result rejected for r4v0, resolved type: java.lang.Object */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ void set(Object obj) {
        super.set(obj);
    }

    /* JADX DEBUG: Multi-variable search result rejected for r4v0, resolved type: java.lang.Object */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ Object setValue(Object obj) {
        return super.setValue(obj);
    }
}
