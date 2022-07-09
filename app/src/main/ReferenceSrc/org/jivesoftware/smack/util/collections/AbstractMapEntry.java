package org.jivesoftware.smack.util.collections;

import java.util.Map;

/* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractMapEntry.class */
public abstract class AbstractMapEntry<K, V> extends AbstractKeyValue<K, V> implements Map.Entry<K, V> {
    protected AbstractMapEntry(K k, V v) {
        super(k, v);
    }

    @Override // java.util.Map.Entry
    public boolean equals(Object obj) {
        boolean z = true;
        if (obj != this) {
            if (!(obj instanceof Map.Entry)) {
                z = false;
            } else {
                Map.Entry entry = (Map.Entry) obj;
                if (getKey() != null ? getKey().equals(entry.getKey()) : entry.getKey() == null) {
                    if (getValue() != null) {
                    }
                }
                z = false;
            }
        }
        return z;
    }

    @Override // java.util.Map.Entry
    public int hashCode() {
        int i = 0;
        int hashCode = getKey() == null ? 0 : getKey().hashCode();
        if (getValue() != null) {
            i = getValue().hashCode();
        }
        return hashCode ^ i;
    }

    public V setValue(V v) {
        V v2 = this.value;
        this.value = v;
        return v2;
    }
}
