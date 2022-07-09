package org.jivesoftware.smack.util.collections;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.SoftReference;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import org.jivesoftware.smack.util.collections.AbstractHashedMap;

/* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap.class */
public abstract class AbstractReferenceMap<K, V> extends AbstractHashedMap<K, V> {
    public static final int HARD = 0;
    public static final int SOFT = 1;
    public static final int WEAK = 2;
    protected int keyType;
    protected boolean purgeValues;
    private transient ReferenceQueue queue;
    protected int valueType;

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry.class */
    protected static class ReferenceEntry<K, V> extends AbstractHashedMap.HashEntry<K, V> {
        protected final AbstractReferenceMap<K, V> parent;
        protected Reference<K> refKey;
        protected Reference<V> refValue;

        public ReferenceEntry(AbstractReferenceMap<K, V> abstractReferenceMap, ReferenceEntry<K, V> referenceEntry, int i, K k, V v) {
            super(referenceEntry, i, null, null);
            this.parent = abstractReferenceMap;
            if (abstractReferenceMap.keyType != 0) {
                this.refKey = (Reference<K>) toReference(abstractReferenceMap.keyType, k, i);
            } else {
                setKey(k);
            }
            if (abstractReferenceMap.valueType != 0) {
                this.refValue = (Reference<V>) toReference(abstractReferenceMap.valueType, v, i);
            } else {
                setValue(v);
            }
        }

        @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap.HashEntry, java.util.Map.Entry
        public boolean equals(Object obj) {
            boolean z = true;
            if (obj != this) {
                if (!(obj instanceof Map.Entry)) {
                    z = false;
                } else {
                    Map.Entry entry = (Map.Entry) obj;
                    Object key = entry.getKey();
                    Object value = entry.getValue();
                    if (key == null || value == null) {
                        z = false;
                    } else if (!this.parent.isEqualKey(key, getKey()) || !this.parent.isEqualValue(value, getValue())) {
                        z = false;
                    }
                }
            }
            return z;
        }

        @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap.HashEntry, java.util.Map.Entry, org.jivesoftware.smack.util.collections.KeyValue
        public K getKey() {
            return (K) (this.parent.keyType > 0 ? this.refKey.get() : super.getKey());
        }

        @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap.HashEntry, java.util.Map.Entry, org.jivesoftware.smack.util.collections.KeyValue
        public V getValue() {
            return (V) (this.parent.valueType > 0 ? this.refValue.get() : super.getValue());
        }

        @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap.HashEntry, java.util.Map.Entry
        public int hashCode() {
            return this.parent.hashEntry(getKey(), getValue());
        }

        protected ReferenceEntry<K, V> next() {
            return (ReferenceEntry) this.next;
        }

        boolean purge(Reference reference) {
            boolean z = (this.parent.keyType > 0 && this.refKey == reference) || (this.parent.valueType > 0 && this.refValue == reference);
            if (z) {
                if (this.parent.keyType > 0) {
                    this.refKey.clear();
                }
                if (this.parent.valueType > 0) {
                    this.refValue.clear();
                } else if (this.parent.purgeValues) {
                    setValue(null);
                }
            }
            return z;
        }

        @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap.HashEntry, java.util.Map.Entry
        public V setValue(V v) {
            V value = getValue();
            if (this.parent.valueType > 0) {
                this.refValue.clear();
                this.refValue = (Reference<V>) toReference(this.parent.valueType, v, this.hashCode);
            } else {
                super.setValue(v);
            }
            return value;
        }

        protected <T> Reference<T> toReference(int i, T t, int i2) {
            Reference weakRef;
            switch (i) {
                case 1:
                    weakRef = new SoftRef(i2, t, ((AbstractReferenceMap) this.parent).queue);
                    break;
                case 2:
                    weakRef = new WeakRef(i2, t, ((AbstractReferenceMap) this.parent).queue);
                    break;
                default:
                    throw new Error("Attempt to create hard reference in ReferenceMap!");
            }
            return weakRef;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntrySet.class */
    static class ReferenceEntrySet<K, V> extends AbstractHashedMap.EntrySet<K, V> {
        protected ReferenceEntrySet(AbstractHashedMap<K, V> abstractHashedMap) {
            super(abstractHashedMap);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public Object[] toArray() {
            return toArray(new Object[0]);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public <T> T[] toArray(T[] tArr) {
            ArrayList arrayList = new ArrayList();
            Iterator<Map.Entry<K, V>> it = iterator();
            while (it.hasNext()) {
                Map.Entry<K, V> next = it.next();
                arrayList.add(new DefaultMapEntry(next.getKey(), next.getValue()));
            }
            return (T[]) arrayList.toArray(tArr);
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntrySetIterator.class */
    static class ReferenceEntrySetIterator<K, V> extends ReferenceIteratorBase<K, V> implements Iterator<Map.Entry<K, V>> {
        public ReferenceEntrySetIterator(AbstractReferenceMap<K, V> abstractReferenceMap) {
            super(abstractReferenceMap);
        }

        @Override // java.util.Iterator
        public ReferenceEntry<K, V> next() {
            return superNext();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase.class */
    static class ReferenceIteratorBase<K, V> {
        K currentKey;
        V currentValue;
        ReferenceEntry<K, V> entry;
        int expectedModCount;
        int index;
        K nextKey;
        V nextValue;
        final AbstractReferenceMap<K, V> parent;
        ReferenceEntry<K, V> previous;

        public ReferenceIteratorBase(AbstractReferenceMap<K, V> abstractReferenceMap) {
            this.parent = abstractReferenceMap;
            this.index = abstractReferenceMap.size() != 0 ? abstractReferenceMap.data.length : 0;
            this.expectedModCount = abstractReferenceMap.modCount;
        }

        private void checkMod() {
            if (this.parent.modCount != this.expectedModCount) {
                throw new ConcurrentModificationException();
            }
        }

        private boolean nextNull() {
            return this.nextKey == null || this.nextValue == null;
        }

        protected ReferenceEntry<K, V> currentEntry() {
            checkMod();
            return this.previous;
        }

        public boolean hasNext() {
            boolean z;
            checkMod();
            while (true) {
                if (!nextNull()) {
                    z = true;
                    break;
                }
                ReferenceEntry<K, V> referenceEntry = this.entry;
                int i = this.index;
                while (referenceEntry == null && i > 0) {
                    i--;
                    referenceEntry = (ReferenceEntry) this.parent.data[i];
                }
                this.entry = referenceEntry;
                this.index = i;
                if (referenceEntry == null) {
                    this.currentKey = null;
                    this.currentValue = null;
                    z = false;
                    break;
                }
                this.nextKey = referenceEntry.getKey();
                this.nextValue = referenceEntry.getValue();
                if (nextNull()) {
                    this.entry = this.entry.next();
                }
            }
            return z;
        }

        protected ReferenceEntry<K, V> nextEntry() {
            checkMod();
            if (!nextNull() || hasNext()) {
                this.previous = this.entry;
                this.entry = this.entry.next();
                this.currentKey = this.nextKey;
                this.currentValue = this.nextValue;
                this.nextKey = null;
                this.nextValue = null;
                return this.previous;
            }
            throw new NoSuchElementException();
        }

        public void remove() {
            checkMod();
            if (this.previous == null) {
                throw new IllegalStateException();
            }
            this.parent.remove(this.currentKey);
            this.previous = null;
            this.currentKey = null;
            this.currentValue = null;
            this.expectedModCount = this.parent.modCount;
        }

        public ReferenceEntry<K, V> superNext() {
            return nextEntry();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceKeySet.class */
    static class ReferenceKeySet<K, V> extends AbstractHashedMap.KeySet<K, V> {
        protected ReferenceKeySet(AbstractHashedMap<K, V> abstractHashedMap) {
            super(abstractHashedMap);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public Object[] toArray() {
            return toArray(new Object[0]);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public <T> T[] toArray(T[] tArr) {
            ArrayList arrayList = new ArrayList(this.parent.size());
            Iterator<K> it = iterator();
            while (it.hasNext()) {
                arrayList.add(it.next());
            }
            return (T[]) arrayList.toArray(tArr);
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceKeySetIterator.class */
    static class ReferenceKeySetIterator<K, V> extends ReferenceIteratorBase<K, V> implements Iterator<K> {
        ReferenceKeySetIterator(AbstractReferenceMap<K, V> abstractReferenceMap) {
            super(abstractReferenceMap);
        }

        @Override // java.util.Iterator
        public K next() {
            return nextEntry().getKey();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceMapIterator.class */
    static class ReferenceMapIterator<K, V> extends ReferenceIteratorBase<K, V> implements MapIterator<K, V> {
        protected ReferenceMapIterator(AbstractReferenceMap<K, V> abstractReferenceMap) {
            super(abstractReferenceMap);
        }

        @Override // org.jivesoftware.smack.util.collections.MapIterator
        public K getKey() {
            ReferenceEntry<K, V> currentEntry = currentEntry();
            if (currentEntry == null) {
                throw new IllegalStateException("getKey() can only be called after next() and before remove()");
            }
            return currentEntry.getKey();
        }

        @Override // org.jivesoftware.smack.util.collections.MapIterator
        public V getValue() {
            ReferenceEntry<K, V> currentEntry = currentEntry();
            if (currentEntry == null) {
                throw new IllegalStateException("getValue() can only be called after next() and before remove()");
            }
            return currentEntry.getValue();
        }

        @Override // org.jivesoftware.smack.util.collections.MapIterator, java.util.Iterator
        public K next() {
            return nextEntry().getKey();
        }

        @Override // org.jivesoftware.smack.util.collections.MapIterator
        public V setValue(V v) {
            ReferenceEntry<K, V> currentEntry = currentEntry();
            if (currentEntry == null) {
                throw new IllegalStateException("setValue() can only be called after next() and before remove()");
            }
            return currentEntry.setValue(v);
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceValues.class */
    static class ReferenceValues<K, V> extends AbstractHashedMap.Values<K, V> {
        protected ReferenceValues(AbstractHashedMap<K, V> abstractHashedMap) {
            super(abstractHashedMap);
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public Object[] toArray() {
            return toArray(new Object[0]);
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public <T> T[] toArray(T[] tArr) {
            ArrayList arrayList = new ArrayList(this.parent.size());
            Iterator<V> it = iterator();
            while (it.hasNext()) {
                arrayList.add(it.next());
            }
            return (T[]) arrayList.toArray(tArr);
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceValuesIterator.class */
    static class ReferenceValuesIterator<K, V> extends ReferenceIteratorBase<K, V> implements Iterator<V> {
        ReferenceValuesIterator(AbstractReferenceMap<K, V> abstractReferenceMap) {
            super(abstractReferenceMap);
        }

        @Override // java.util.Iterator
        public V next() {
            return nextEntry().getValue();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$SoftRef.class */
    static class SoftRef<T> extends SoftReference<T> {
        private int hash;

        public SoftRef(int i, T t, ReferenceQueue referenceQueue) {
            super(t, referenceQueue);
            this.hash = i;
        }

        public int hashCode() {
            return this.hash;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$WeakRef.class */
    static class WeakRef<T> extends WeakReference<T> {
        private int hash;

        public WeakRef(int i, T t, ReferenceQueue referenceQueue) {
            super(t, referenceQueue);
            this.hash = i;
        }

        public int hashCode() {
            return this.hash;
        }
    }

    protected AbstractReferenceMap() {
    }

    protected AbstractReferenceMap(int i, int i2, int i3, float f, boolean z) {
        super(i3, f);
        verify("keyType", i);
        verify("valueType", i2);
        this.keyType = i;
        this.valueType = i2;
        this.purgeValues = z;
    }

    private static void verify(String str, int i) {
        if (i < 0 || i > 2) {
            throw new IllegalArgumentException(str + " must be HARD, SOFT, WEAK.");
        }
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public void clear() {
        super.clear();
        do {
        } while (this.queue.poll() != null);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public boolean containsKey(Object obj) {
        boolean z = false;
        purgeBeforeRead();
        AbstractHashedMap.HashEntry<K, V> entry = getEntry(obj);
        if (entry != null && entry.getValue() != null) {
            z = true;
        }
        return z;
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public boolean containsValue(Object obj) {
        purgeBeforeRead();
        return obj == null ? false : super.containsValue(obj);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    public AbstractHashedMap.HashEntry<K, V> createEntry(AbstractHashedMap.HashEntry<K, V> hashEntry, int i, K k, V v) {
        return new ReferenceEntry(this, (ReferenceEntry) hashEntry, i, k, v);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    protected Iterator<Map.Entry<K, V>> createEntrySetIterator() {
        return new ReferenceEntrySetIterator(this);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    protected Iterator<K> createKeySetIterator() {
        return new ReferenceKeySetIterator(this);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    protected Iterator<V> createValuesIterator() {
        return new ReferenceValuesIterator(this);
    }

    /* JADX DEBUG: Multi-variable search result rejected for r5v0, resolved type: org.jivesoftware.smack.util.collections.AbstractReferenceMap<K, V> */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    protected void doReadObject(ObjectInputStream objectInputStream) throws IOException, ClassNotFoundException {
        this.keyType = objectInputStream.readInt();
        this.valueType = objectInputStream.readInt();
        this.purgeValues = objectInputStream.readBoolean();
        this.loadFactor = objectInputStream.readFloat();
        int readInt = objectInputStream.readInt();
        init();
        this.data = new AbstractHashedMap.HashEntry[readInt];
        while (true) {
            Object readObject = objectInputStream.readObject();
            if (readObject == null) {
                this.threshold = calculateThreshold(this.data.length, this.loadFactor);
                return;
            }
            put(readObject, objectInputStream.readObject());
        }
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    protected void doWriteObject(ObjectOutputStream objectOutputStream) throws IOException {
        objectOutputStream.writeInt(this.keyType);
        objectOutputStream.writeInt(this.valueType);
        objectOutputStream.writeBoolean(this.purgeValues);
        objectOutputStream.writeFloat(this.loadFactor);
        objectOutputStream.writeInt(this.data.length);
        MapIterator<K, V> mapIterator = mapIterator();
        while (mapIterator.hasNext()) {
            objectOutputStream.writeObject(mapIterator.next());
            objectOutputStream.writeObject(mapIterator.getValue());
        }
        objectOutputStream.writeObject(null);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public Set<Map.Entry<K, V>> entrySet() {
        if (this.entrySet == null) {
            this.entrySet = new ReferenceEntrySet(this);
        }
        return this.entrySet;
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public V get(Object obj) {
        purgeBeforeRead();
        AbstractHashedMap.HashEntry<K, V> entry = getEntry(obj);
        return entry == null ? null : entry.getValue();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    protected AbstractHashedMap.HashEntry<K, V> getEntry(Object obj) {
        return obj == null ? null : super.getEntry(obj);
    }

    protected int hashEntry(Object obj, Object obj2) {
        int i = 0;
        int hashCode = obj == null ? 0 : obj.hashCode();
        if (obj2 != null) {
            i = obj2.hashCode();
        }
        return i ^ hashCode;
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    protected void init() {
        this.queue = new ReferenceQueue();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public boolean isEmpty() {
        purgeBeforeRead();
        return super.isEmpty();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    protected boolean isEqualKey(Object obj, Object obj2) {
        return obj == obj2 || obj.equals(obj2);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public Set<K> keySet() {
        if (this.keySet == null) {
            this.keySet = new ReferenceKeySet(this);
        }
        return this.keySet;
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, org.jivesoftware.smack.util.collections.IterableMap
    public MapIterator<K, V> mapIterator() {
        return new ReferenceMapIterator(this);
    }

    protected void purge() {
        Reference poll = this.queue.poll();
        while (true) {
            Reference reference = poll;
            if (reference != null) {
                purge(reference);
                poll = this.queue.poll();
            } else {
                return;
            }
        }
    }

    protected void purge(Reference reference) {
        int hashIndex = hashIndex(reference.hashCode(), this.data.length);
        AbstractHashedMap.HashEntry<K, V> hashEntry = null;
        AbstractHashedMap.HashEntry<K, V> hashEntry2 = this.data[hashIndex];
        while (true) {
            AbstractHashedMap.HashEntry<K, V> hashEntry3 = hashEntry2;
            if (hashEntry3 != null) {
                if (((ReferenceEntry) hashEntry3).purge(reference)) {
                    if (hashEntry == null) {
                        this.data[hashIndex] = hashEntry3.next;
                    } else {
                        hashEntry.next = hashEntry3.next;
                    }
                    this.size--;
                    return;
                }
                hashEntry = hashEntry3;
                hashEntry2 = hashEntry3.next;
            } else {
                return;
            }
        }
    }

    protected void purgeBeforeRead() {
        purge();
    }

    protected void purgeBeforeWrite() {
        purge();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public V put(K k, V v) {
        if (k == null) {
            throw new NullPointerException("null keys not allowed");
        }
        if (v == null) {
            throw new NullPointerException("null values not allowed");
        }
        purgeBeforeWrite();
        return (V) super.put(k, v);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public V remove(Object obj) {
        Object remove;
        if (obj == null) {
            remove = null;
        } else {
            purgeBeforeWrite();
            remove = super.remove(obj);
        }
        return (V) remove;
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public int size() {
        purgeBeforeRead();
        return super.size();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public Collection<V> values() {
        if (this.values == null) {
            this.values = new ReferenceValues(this);
        }
        return this.values;
    }
}
