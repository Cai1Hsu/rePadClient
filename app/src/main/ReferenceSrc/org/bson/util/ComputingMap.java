package org.bson.util;

import java.util.Collection;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentMap;

/* loaded from: classes.jar:org/bson/util/ComputingMap.class */
final class ComputingMap<K, V> implements Map<K, V>, Function<K, V> {
    private final Function<K, V> function;
    private final ConcurrentMap<K, V> map;

    ComputingMap(ConcurrentMap<K, V> concurrentMap, Function<K, V> function) {
        this.map = (ConcurrentMap) Assertions.notNull("map", concurrentMap);
        this.function = (Function) Assertions.notNull("function", function);
    }

    public static <K, V> Map<K, V> create(Function<K, V> function) {
        return new ComputingMap(CopyOnWriteMap.newHashMap(), function);
    }

    @Override // org.bson.util.Function
    public V apply(K k) {
        return get(k);
    }

    @Override // java.util.Map
    public void clear() {
        this.map.clear();
    }

    @Override // java.util.Map
    public boolean containsKey(Object obj) {
        return this.map.containsKey(obj);
    }

    @Override // java.util.Map
    public boolean containsValue(Object obj) {
        return this.map.containsValue(obj);
    }

    @Override // java.util.Map
    public Set<Map.Entry<K, V>> entrySet() {
        return this.map.entrySet();
    }

    @Override // java.util.Map
    public boolean equals(Object obj) {
        return this.map.equals(obj);
    }

    @Override // java.util.Map
    public V get(Object obj) {
        V v;
        while (true) {
            V v2 = this.map.get(obj);
            if (v2 != null) {
                v = v2;
                break;
            }
            V apply = this.function.apply(obj);
            if (apply == null) {
                v = null;
                break;
            }
            this.map.putIfAbsent(obj, apply);
        }
        return v;
    }

    @Override // java.util.Map
    public int hashCode() {
        return this.map.hashCode();
    }

    @Override // java.util.Map
    public boolean isEmpty() {
        return this.map.isEmpty();
    }

    @Override // java.util.Map
    public Set<K> keySet() {
        return this.map.keySet();
    }

    @Override // java.util.Map
    public V put(K k, V v) {
        return this.map.put(k, v);
    }

    @Override // java.util.Map
    public void putAll(Map<? extends K, ? extends V> map) {
        this.map.putAll(map);
    }

    @Override // java.util.Map
    public V putIfAbsent(K k, V v) {
        return this.map.putIfAbsent(k, v);
    }

    @Override // java.util.Map
    public V remove(Object obj) {
        return this.map.remove(obj);
    }

    @Override // java.util.Map
    public boolean remove(Object obj, Object obj2) {
        return this.map.remove(obj, obj2);
    }

    @Override // java.util.Map
    public V replace(K k, V v) {
        return this.map.replace(k, v);
    }

    @Override // java.util.Map
    public boolean replace(K k, V v, V v2) {
        return this.map.replace(k, v, v2);
    }

    @Override // java.util.Map
    public int size() {
        return this.map.size();
    }

    @Override // java.util.Map
    public Collection<V> values() {
        return this.map.values();
    }
}
