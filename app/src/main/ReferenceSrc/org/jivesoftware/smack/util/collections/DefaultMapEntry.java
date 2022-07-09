package org.jivesoftware.smack.util.collections;

import java.util.Map;

/* loaded from: classes.jar:org/jivesoftware/smack/util/collections/DefaultMapEntry.class */
public final class DefaultMapEntry<K, V> extends AbstractMapEntry<K, V> {
    public DefaultMapEntry(K k, V v) {
        super(k, v);
    }

    public DefaultMapEntry(Map.Entry<K, V> entry) {
        super(entry.getKey(), entry.getValue());
    }

    public DefaultMapEntry(KeyValue<K, V> keyValue) {
        super(keyValue.getKey(), keyValue.getValue());
    }
}
