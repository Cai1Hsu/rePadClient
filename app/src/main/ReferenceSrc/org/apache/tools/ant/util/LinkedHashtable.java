package org.apache.tools.ant.util;

import java.util.Collection;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/* loaded from: classes.jar:org/apache/tools/ant/util/LinkedHashtable.class */
public class LinkedHashtable extends Hashtable {
    private final LinkedHashMap map;

    public LinkedHashtable() {
        this.map = new LinkedHashMap();
    }

    public LinkedHashtable(int i) {
        this.map = new LinkedHashMap(i);
    }

    public LinkedHashtable(int i, float f) {
        this.map = new LinkedHashMap(i, f);
    }

    public LinkedHashtable(Map map) {
        this.map = new LinkedHashMap(map);
    }

    @Override // java.util.Hashtable, java.util.Map
    public void clear() {
        synchronized (this) {
            this.map.clear();
        }
    }

    @Override // java.util.Hashtable
    public boolean contains(Object obj) {
        return containsKey(obj);
    }

    @Override // java.util.Hashtable, java.util.Map
    public boolean containsKey(Object obj) {
        boolean containsKey;
        synchronized (this) {
            containsKey = this.map.containsKey(obj);
        }
        return containsKey;
    }

    @Override // java.util.Hashtable, java.util.Map
    public boolean containsValue(Object obj) {
        boolean containsValue;
        synchronized (this) {
            containsValue = this.map.containsValue(obj);
        }
        return containsValue;
    }

    @Override // java.util.Hashtable, java.util.Dictionary
    public Enumeration elements() {
        return CollectionUtils.asEnumeration(values().iterator());
    }

    @Override // java.util.Hashtable, java.util.Map
    public Set entrySet() {
        Set entrySet;
        synchronized (this) {
            entrySet = this.map.entrySet();
        }
        return entrySet;
    }

    @Override // java.util.Hashtable, java.util.Map
    public boolean equals(Object obj) {
        boolean equals;
        synchronized (this) {
            equals = this.map.equals(obj);
        }
        return equals;
    }

    @Override // java.util.Hashtable, java.util.Dictionary, java.util.Map
    public Object get(Object obj) {
        Object obj2;
        synchronized (this) {
            obj2 = this.map.get(obj);
        }
        return obj2;
    }

    @Override // java.util.Hashtable, java.util.Map
    public int hashCode() {
        int hashCode;
        synchronized (this) {
            hashCode = this.map.hashCode();
        }
        return hashCode;
    }

    @Override // java.util.Hashtable, java.util.Dictionary, java.util.Map
    public boolean isEmpty() {
        boolean isEmpty;
        synchronized (this) {
            isEmpty = this.map.isEmpty();
        }
        return isEmpty;
    }

    @Override // java.util.Hashtable, java.util.Map
    public Set keySet() {
        Set keySet;
        synchronized (this) {
            keySet = this.map.keySet();
        }
        return keySet;
    }

    @Override // java.util.Hashtable, java.util.Dictionary
    public Enumeration keys() {
        return CollectionUtils.asEnumeration(keySet().iterator());
    }

    @Override // java.util.Hashtable, java.util.Dictionary, java.util.Map
    public Object put(Object obj, Object obj2) {
        Object put;
        synchronized (this) {
            put = this.map.put(obj, obj2);
        }
        return put;
    }

    @Override // java.util.Hashtable, java.util.Map
    public void putAll(Map map) {
        synchronized (this) {
            this.map.putAll(map);
        }
    }

    @Override // java.util.Hashtable, java.util.Dictionary, java.util.Map
    public Object remove(Object obj) {
        Object remove;
        synchronized (this) {
            remove = this.map.remove(obj);
        }
        return remove;
    }

    @Override // java.util.Hashtable, java.util.Dictionary, java.util.Map
    public int size() {
        int size;
        synchronized (this) {
            size = this.map.size();
        }
        return size;
    }

    @Override // java.util.Hashtable
    public String toString() {
        String linkedHashMap;
        synchronized (this) {
            linkedHashMap = this.map.toString();
        }
        return linkedHashMap;
    }

    @Override // java.util.Hashtable, java.util.Map
    public Collection values() {
        Collection values;
        synchronized (this) {
            values = this.map.values();
        }
        return values;
    }
}
