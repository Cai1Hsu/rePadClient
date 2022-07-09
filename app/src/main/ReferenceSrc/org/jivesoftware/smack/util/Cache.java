package org.jivesoftware.smack.util;

import java.util.AbstractCollection;
import java.util.AbstractSet;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.apache.commons.compress.archivers.tar.TarConstants;
import org.jivesoftware.smack.util.collections.AbstractMapEntry;

/* loaded from: classes.jar:org/jivesoftware/smack/util/Cache.class */
public class Cache<K, V> implements Map<K, V> {
    protected LinkedList ageList;
    protected long cacheHits;
    protected long cacheMisses = 0;
    protected LinkedList lastAccessedList;
    protected Map<K, CacheObject<V>> map;
    protected int maxCacheSize;
    protected long maxLifetime;

    /* renamed from: org.jivesoftware.smack.util.Cache$1 */
    /* loaded from: classes.jar:org/jivesoftware/smack/util/Cache$1.class */
    class AnonymousClass1 extends AbstractCollection<V> {
        Collection<CacheObject<V>> values;

        AnonymousClass1() {
            Cache.this = r4;
            this.values = Cache.this.map.values();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
        public Iterator<V> iterator() {
            return new Iterator<V>() { // from class: org.jivesoftware.smack.util.Cache.1.1
                Iterator<CacheObject<V>> it;

                {
                    AnonymousClass1.this = this;
                    this.it = AnonymousClass1.this.values.iterator();
                }

                @Override // java.util.Iterator
                public boolean hasNext() {
                    return this.it.hasNext();
                }

                @Override // java.util.Iterator
                public V next() {
                    return this.it.next().object;
                }

                @Override // java.util.Iterator
                public void remove() {
                    this.it.remove();
                }
            };
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public int size() {
            return this.values.size();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/Cache$CacheObject.class */
    private static class CacheObject<V> {
        public LinkedListNode ageListNode;
        public LinkedListNode lastAccessedListNode;
        public V object;
        public int readCount = 0;

        public CacheObject(V v) {
            this.object = v;
        }

        public boolean equals(Object obj) {
            return this == obj ? true : !(obj instanceof CacheObject) ? false : this.object.equals(((CacheObject) obj).object);
        }

        public int hashCode() {
            return this.object.hashCode();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/Cache$LinkedList.class */
    private static class LinkedList {
        private LinkedListNode head = new LinkedListNode("head", null, null);

        public LinkedList() {
            LinkedListNode linkedListNode = this.head;
            LinkedListNode linkedListNode2 = this.head;
            LinkedListNode linkedListNode3 = this.head;
            linkedListNode2.previous = linkedListNode3;
            linkedListNode.next = linkedListNode3;
        }

        public LinkedListNode addFirst(Object obj) {
            LinkedListNode linkedListNode = new LinkedListNode(obj, this.head.next, this.head);
            linkedListNode.previous.next = linkedListNode;
            linkedListNode.next.previous = linkedListNode;
            return linkedListNode;
        }

        public LinkedListNode addFirst(LinkedListNode linkedListNode) {
            linkedListNode.next = this.head.next;
            linkedListNode.previous = this.head;
            linkedListNode.previous.next = linkedListNode;
            linkedListNode.next.previous = linkedListNode;
            return linkedListNode;
        }

        public LinkedListNode addLast(Object obj) {
            LinkedListNode linkedListNode = new LinkedListNode(obj, this.head, this.head.previous);
            linkedListNode.previous.next = linkedListNode;
            linkedListNode.next.previous = linkedListNode;
            return linkedListNode;
        }

        public void clear() {
            LinkedListNode last = getLast();
            while (true) {
                LinkedListNode linkedListNode = last;
                if (linkedListNode == null) {
                    LinkedListNode linkedListNode2 = this.head;
                    LinkedListNode linkedListNode3 = this.head;
                    LinkedListNode linkedListNode4 = this.head;
                    linkedListNode3.previous = linkedListNode4;
                    linkedListNode2.next = linkedListNode4;
                    return;
                }
                linkedListNode.remove();
                last = getLast();
            }
        }

        public LinkedListNode getFirst() {
            LinkedListNode linkedListNode = this.head.next;
            LinkedListNode linkedListNode2 = linkedListNode;
            if (linkedListNode == this.head) {
                linkedListNode2 = null;
            }
            return linkedListNode2;
        }

        public LinkedListNode getLast() {
            LinkedListNode linkedListNode = this.head.previous;
            LinkedListNode linkedListNode2 = linkedListNode;
            if (linkedListNode == this.head) {
                linkedListNode2 = null;
            }
            return linkedListNode2;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            for (LinkedListNode linkedListNode = this.head.next; linkedListNode != this.head; linkedListNode = linkedListNode.next) {
                sb.append(linkedListNode.toString()).append(", ");
            }
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/Cache$LinkedListNode.class */
    private static class LinkedListNode {
        public LinkedListNode next;
        public Object object;
        public LinkedListNode previous;
        public long timestamp;

        public LinkedListNode(Object obj, LinkedListNode linkedListNode, LinkedListNode linkedListNode2) {
            this.object = obj;
            this.next = linkedListNode;
            this.previous = linkedListNode2;
        }

        public void remove() {
            this.previous.next = this.next;
            this.next.previous = this.previous;
        }

        public String toString() {
            return this.object.toString();
        }
    }

    public Cache(int i, long j) {
        if (i == 0) {
            throw new IllegalArgumentException("Max cache size cannot be 0.");
        }
        this.maxCacheSize = i;
        this.maxLifetime = j;
        this.map = new HashMap((int) TarConstants.LF_PAX_GLOBAL_EXTENDED_HEADER);
        this.lastAccessedList = new LinkedList();
        this.ageList = new LinkedList();
    }

    @Override // java.util.Map
    public void clear() {
        synchronized (this) {
            for (Object obj : this.map.keySet().toArray()) {
                remove(obj);
            }
            this.map.clear();
            this.lastAccessedList.clear();
            this.ageList.clear();
            this.cacheHits = 0L;
            this.cacheMisses = 0L;
        }
    }

    @Override // java.util.Map
    public boolean containsKey(Object obj) {
        boolean containsKey;
        synchronized (this) {
            deleteExpiredEntries();
            containsKey = this.map.containsKey(obj);
        }
        return containsKey;
    }

    @Override // java.util.Map
    public boolean containsValue(Object obj) {
        boolean containsValue;
        synchronized (this) {
            deleteExpiredEntries();
            containsValue = this.map.containsValue(new CacheObject(obj));
        }
        return containsValue;
    }

    protected void cullCache() {
        synchronized (this) {
            if (this.maxCacheSize >= 0 && this.map.size() > this.maxCacheSize) {
                deleteExpiredEntries();
                int i = (int) (this.maxCacheSize * 0.9d);
                for (int size = this.map.size(); size > i; size--) {
                    if (remove(this.lastAccessedList.getLast().object, true) == null) {
                        System.err.println("Error attempting to cullCache with remove(" + this.lastAccessedList.getLast().object.toString() + ") - cacheObject not found in cache!");
                        this.lastAccessedList.getLast().remove();
                    }
                }
            }
        }
    }

    protected void deleteExpiredEntries() {
        LinkedListNode last;
        synchronized (this) {
            if (this.maxLifetime > 0) {
                LinkedListNode last2 = this.ageList.getLast();
                if (last2 != null) {
                    long currentTimeMillis = System.currentTimeMillis();
                    long j = this.maxLifetime;
                    do {
                        if (currentTimeMillis - j <= last2.timestamp) {
                            break;
                        }
                        if (remove(last2.object, true) == null) {
                            System.err.println("Error attempting to remove(" + last2.object.toString() + ") - cacheObject not found in cache!");
                            last2.remove();
                        }
                        last = this.ageList.getLast();
                        last2 = last;
                    } while (last != null);
                }
            }
        }
    }

    @Override // java.util.Map
    public Set<Map.Entry<K, V>> entrySet() {
        AbstractSet<Map.Entry<K, V>> abstractSet;
        synchronized (this) {
            deleteExpiredEntries();
            abstractSet = new AbstractSet<Map.Entry<K, V>>() { // from class: org.jivesoftware.smack.util.Cache.2
                private final Set<Map.Entry<K, CacheObject<V>>> set;

                {
                    Cache.this = this;
                    this.set = Cache.this.map.entrySet();
                }

                @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
                public Iterator<Map.Entry<K, V>> iterator() {
                    return new Iterator<Map.Entry<K, V>>() { // from class: org.jivesoftware.smack.util.Cache.2.1
                        private final Iterator<Map.Entry<K, CacheObject<V>>> it;

                        {
                            AnonymousClass2.this = this;
                            this.it = AnonymousClass2.this.set.iterator();
                        }

                        @Override // java.util.Iterator
                        public boolean hasNext() {
                            return this.it.hasNext();
                        }

                        @Override // java.util.Iterator
                        public Map.Entry<K, V> next() {
                            Map.Entry<K, CacheObject<V>> next = this.it.next();
                            return new AbstractMapEntry<K, V>(next.getKey(), next.getValue().object) { // from class: org.jivesoftware.smack.util.Cache.2.1.1
                                @Override // org.jivesoftware.smack.util.collections.AbstractMapEntry, java.util.Map.Entry
                                public V setValue(V v) {
                                    throw new UnsupportedOperationException("Cannot set");
                                }
                            };
                        }

                        @Override // java.util.Iterator
                        public void remove() {
                            this.it.remove();
                        }
                    };
                }

                @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
                public int size() {
                    return this.set.size();
                }
            };
        }
        return abstractSet;
    }

    @Override // java.util.Map
    public V get(Object obj) {
        V v;
        synchronized (this) {
            deleteExpiredEntries();
            CacheObject<V> cacheObject = this.map.get(obj);
            if (cacheObject == null) {
                this.cacheMisses++;
                v = null;
            } else {
                cacheObject.lastAccessedListNode.remove();
                this.lastAccessedList.addFirst(cacheObject.lastAccessedListNode);
                this.cacheHits++;
                cacheObject.readCount++;
                v = cacheObject.object;
            }
        }
        return v;
    }

    public long getCacheHits() {
        return this.cacheHits;
    }

    public long getCacheMisses() {
        return this.cacheMisses;
    }

    public int getMaxCacheSize() {
        return this.maxCacheSize;
    }

    public long getMaxLifetime() {
        return this.maxLifetime;
    }

    @Override // java.util.Map
    public boolean isEmpty() {
        boolean isEmpty;
        synchronized (this) {
            deleteExpiredEntries();
            isEmpty = this.map.isEmpty();
        }
        return isEmpty;
    }

    @Override // java.util.Map
    public Set<K> keySet() {
        Set<K> unmodifiableSet;
        synchronized (this) {
            deleteExpiredEntries();
            unmodifiableSet = Collections.unmodifiableSet(this.map.keySet());
        }
        return unmodifiableSet;
    }

    @Override // java.util.Map
    public V put(K k, V v) {
        V v2;
        synchronized (this) {
            v2 = null;
            if (this.map.containsKey(k)) {
                v2 = remove((Object) k, true);
            }
            CacheObject<V> cacheObject = new CacheObject<>(v);
            this.map.put(k, cacheObject);
            cacheObject.lastAccessedListNode = this.lastAccessedList.addFirst(k);
            LinkedListNode addFirst = this.ageList.addFirst(k);
            addFirst.timestamp = System.currentTimeMillis();
            cacheObject.ageListNode = addFirst;
            cullCache();
        }
        return v2;
    }

    @Override // java.util.Map
    public void putAll(Map<? extends K, ? extends V> map) {
        for (Map.Entry<? extends K, ? extends V> entry : map.entrySet()) {
            V value = entry.getValue();
            V v = value;
            if (value instanceof CacheObject) {
                v = ((CacheObject) value).object;
            }
            put(entry.getKey(), v);
        }
    }

    @Override // java.util.Map
    public V remove(Object obj) {
        V remove;
        synchronized (this) {
            remove = remove(obj, false);
        }
        return remove;
    }

    public V remove(Object obj, boolean z) {
        V v;
        synchronized (this) {
            CacheObject<V> remove = this.map.remove(obj);
            if (remove == null) {
                v = null;
            } else {
                remove.lastAccessedListNode.remove();
                remove.ageListNode.remove();
                remove.ageListNode = null;
                remove.lastAccessedListNode = null;
                v = remove.object;
            }
        }
        return v;
    }

    public void setMaxCacheSize(int i) {
        synchronized (this) {
            this.maxCacheSize = i;
            cullCache();
        }
    }

    public void setMaxLifetime(long j) {
        this.maxLifetime = j;
    }

    @Override // java.util.Map
    public int size() {
        int size;
        synchronized (this) {
            deleteExpiredEntries();
            size = this.map.size();
        }
        return size;
    }

    @Override // java.util.Map
    public Collection<V> values() {
        Collection<V> unmodifiableCollection;
        synchronized (this) {
            deleteExpiredEntries();
            unmodifiableCollection = Collections.unmodifiableCollection(new AnonymousClass1());
        }
        return unmodifiableCollection;
    }
}
