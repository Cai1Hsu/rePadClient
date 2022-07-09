package org.jivesoftware.smack.util.collections;

import java.util.Map;

/* loaded from: classes.jar:org/jivesoftware/smack/util/collections/IterableMap.class */
public interface IterableMap<K, V> extends Map<K, V> {
    MapIterator<K, V> mapIterator();
}
