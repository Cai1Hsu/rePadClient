package org.jivesoftware.smack.util.collections;

import java.util.Iterator;

/* loaded from: classes.jar:org/jivesoftware/smack/util/collections/MapIterator.class */
public interface MapIterator<K, V> extends Iterator<K> {
    K getKey();

    V getValue();

    @Override // java.util.Iterator
    boolean hasNext();

    @Override // java.util.Iterator
    K next();

    @Override // java.util.Iterator
    void remove();

    V setValue(V v);
}
