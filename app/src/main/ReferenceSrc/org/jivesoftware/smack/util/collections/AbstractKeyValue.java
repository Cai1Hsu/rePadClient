package org.jivesoftware.smack.util.collections;

/* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractKeyValue.class */
public abstract class AbstractKeyValue<K, V> implements KeyValue<K, V> {
    protected K key;
    protected V value;

    protected AbstractKeyValue(K k, V v) {
        this.key = k;
        this.value = v;
    }

    @Override // org.jivesoftware.smack.util.collections.KeyValue
    public K getKey() {
        return this.key;
    }

    @Override // org.jivesoftware.smack.util.collections.KeyValue
    public V getValue() {
        return this.value;
    }

    /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: K : 0x0008: INVOKE  (r1v2 K A[REMOVE]) = (r3v0 'this' org.jivesoftware.smack.util.collections.AbstractKeyValue<K, V> A[IMMUTABLE_TYPE, THIS]) type: VIRTUAL call: org.jivesoftware.smack.util.collections.AbstractKeyValue.getKey():java.lang.Object), ('=' char), (wrap: V : 0x0014: INVOKE  (r1v5 V A[REMOVE]) = (r3v0 'this' org.jivesoftware.smack.util.collections.AbstractKeyValue<K, V> A[IMMUTABLE_TYPE, THIS]) type: VIRTUAL call: org.jivesoftware.smack.util.collections.AbstractKeyValue.getValue():java.lang.Object)] */
    public String toString() {
        return new StringBuilder().append(getKey()).append('=').append(getValue()).toString();
    }
}
