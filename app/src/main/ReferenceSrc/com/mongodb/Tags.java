package com.mongodb;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import org.bson.util.Assertions;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class Tags implements Map<String, String> {
    private final boolean frozen;
    private final Map<String, String> wrapped;

    public static Tags freeze(Tags tags) {
        return new Tags(tags);
    }

    public Tags() {
        this.wrapped = new HashMap();
        this.frozen = false;
    }

    public Tags(String key, String value) {
        this.wrapped = new HashMap();
        this.wrapped.put(key, value);
        this.frozen = false;
    }

    Tags(Map<String, String> wrapped) {
        this.wrapped = new HashMap(wrapped);
        this.frozen = true;
    }

    public Tags append(String key, String value) {
        Assertions.isTrue("not frozen", !this.frozen);
        this.wrapped.put(key, value);
        return this;
    }

    @Override // java.util.Map
    public int size() {
        return this.wrapped.size();
    }

    @Override // java.util.Map
    public boolean isEmpty() {
        return this.wrapped.isEmpty();
    }

    @Override // java.util.Map
    public boolean containsKey(Object key) {
        return this.wrapped.containsKey(key);
    }

    @Override // java.util.Map
    public boolean containsValue(Object value) {
        return this.wrapped.containsValue(value);
    }

    @Override // java.util.Map
    public String get(Object key) {
        return this.wrapped.get(key);
    }

    public String put(String key, String value) {
        Assertions.isTrue("not frozen", !this.frozen);
        return this.wrapped.put(key, value);
    }

    @Override // java.util.Map
    public String remove(Object key) {
        Assertions.isTrue("not frozen", !this.frozen);
        return this.wrapped.remove(key);
    }

    @Override // java.util.Map
    public void putAll(Map<? extends String, ? extends String> m) {
        Assertions.isTrue("not frozen", !this.frozen);
        this.wrapped.putAll(m);
    }

    @Override // java.util.Map
    public void clear() {
        Assertions.isTrue("not frozen", !this.frozen);
        this.wrapped.clear();
    }

    @Override // java.util.Map
    public Set<String> keySet() {
        return this.wrapped.keySet();
    }

    @Override // java.util.Map
    public Collection<String> values() {
        return this.wrapped.values();
    }

    @Override // java.util.Map
    public Set<Map.Entry<String, String>> entrySet() {
        return this.wrapped.entrySet();
    }

    @Override // java.util.Map
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Tags tags = (Tags) o;
        return this.wrapped.equals(tags.wrapped);
    }

    @Override // java.util.Map
    public int hashCode() {
        return this.wrapped.hashCode();
    }

    public String toString() {
        return "TagSet" + this.wrapped.toString();
    }
}
