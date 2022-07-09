package org.jivesoftware.smack.util.collections;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.AbstractCollection;
import java.util.AbstractMap;
import java.util.AbstractSet;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;

/* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractHashedMap.class */
public class AbstractHashedMap<K, V> extends AbstractMap<K, V> implements IterableMap<K, V> {
    protected static final int DEFAULT_CAPACITY = 16;
    protected static final float DEFAULT_LOAD_FACTOR = 0.75f;
    protected static final int DEFAULT_THRESHOLD = 12;
    protected static final String GETKEY_INVALID = "getKey() can only be called after next() and before remove()";
    protected static final String GETVALUE_INVALID = "getValue() can only be called after next() and before remove()";
    protected static final int MAXIMUM_CAPACITY = 1073741824;
    protected static final String NO_NEXT_ENTRY = "No next() entry in the iteration";
    protected static final String NO_PREVIOUS_ENTRY = "No previous() entry in the iteration";
    protected static final Object NULL = new Object();
    protected static final String REMOVE_INVALID = "remove() can only be called once after next()";
    protected static final String SETVALUE_INVALID = "setValue() can only be called after next() and before remove()";
    protected transient HashEntry<K, V>[] data;
    protected transient EntrySet<K, V> entrySet;
    protected transient KeySet<K, V> keySet;
    protected transient float loadFactor;
    protected transient int modCount;
    protected transient int size;
    protected transient int threshold;
    protected transient Values<K, V> values;

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySet.class */
    protected static class EntrySet<K, V> extends AbstractSet<Map.Entry<K, V>> {
        protected final AbstractHashedMap<K, V> parent;

        protected EntrySet(AbstractHashedMap<K, V> abstractHashedMap) {
            this.parent = abstractHashedMap;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public void clear() {
            this.parent.clear();
        }

        public boolean contains(Map.Entry<K, V> entry) {
            HashEntry<K, V> entry2 = this.parent.getEntry(entry.getKey());
            return entry2 != null && entry2.equals(entry);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public Iterator<Map.Entry<K, V>> iterator() {
            return this.parent.createEntrySetIterator();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean remove(Object obj) {
            boolean z = false;
            if ((obj instanceof Map.Entry) && contains(obj)) {
                this.parent.remove(((Map.Entry) obj).getKey());
                z = true;
            }
            return z;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return this.parent.size();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySetIterator.class */
    protected static class EntrySetIterator<K, V> extends HashIterator<K, V> implements Iterator<Map.Entry<K, V>> {
        protected EntrySetIterator(AbstractHashedMap<K, V> abstractHashedMap) {
            super(abstractHashedMap);
        }

        @Override // java.util.Iterator
        public HashEntry<K, V> next() {
            return super.nextEntry();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry.class */
    protected static class HashEntry<K, V> implements Map.Entry<K, V>, KeyValue<K, V> {
        protected int hashCode;
        private K key;
        protected HashEntry<K, V> next;
        private V value;

        protected HashEntry(HashEntry<K, V> hashEntry, int i, K k, V v) {
            this.next = hashEntry;
            this.hashCode = i;
            this.key = k;
            this.value = v;
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

        @Override // java.util.Map.Entry, org.jivesoftware.smack.util.collections.KeyValue
        public K getKey() {
            return this.key;
        }

        @Override // java.util.Map.Entry, org.jivesoftware.smack.util.collections.KeyValue
        public V getValue() {
            return this.value;
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

        public void setKey(K k) {
            this.key = k;
        }

        @Override // java.util.Map.Entry
        public V setValue(V v) {
            V v2 = this.value;
            this.value = v;
            return v2;
        }

        /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: K : 0x0008: INVOKE  (r1v2 K A[REMOVE]) = (r3v0 'this' org.jivesoftware.smack.util.collections.AbstractHashedMap$HashEntry<K, V> A[IMMUTABLE_TYPE, THIS]) type: VIRTUAL call: org.jivesoftware.smack.util.collections.AbstractHashedMap.HashEntry.getKey():java.lang.Object), ('=' char), (wrap: V : 0x0014: INVOKE  (r1v5 V A[REMOVE]) = (r3v0 'this' org.jivesoftware.smack.util.collections.AbstractHashedMap$HashEntry<K, V> A[IMMUTABLE_TYPE, THIS]) type: VIRTUAL call: org.jivesoftware.smack.util.collections.AbstractHashedMap.HashEntry.getValue():java.lang.Object)] */
        public String toString() {
            return new StringBuilder().append(getKey()).append('=').append(getValue()).toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator.class */
    protected static abstract class HashIterator<K, V> {
        protected int expectedModCount;
        protected int hashIndex;
        protected HashEntry<K, V> last;
        protected HashEntry<K, V> next;
        protected final AbstractHashedMap parent;

        protected HashIterator(AbstractHashedMap<K, V> abstractHashedMap) {
            HashEntry<K, V> hashEntry;
            this.parent = abstractHashedMap;
            HashEntry<K, V>[] hashEntryArr = abstractHashedMap.data;
            int length = hashEntryArr.length;
            HashEntry<K, V> hashEntry2 = null;
            while (true) {
                hashEntry = hashEntry2;
                if (length <= 0 || hashEntry != null) {
                    break;
                }
                length--;
                hashEntry2 = hashEntryArr[length];
            }
            this.next = hashEntry;
            this.hashIndex = length;
            this.expectedModCount = abstractHashedMap.modCount;
        }

        protected HashEntry<K, V> currentEntry() {
            return this.last;
        }

        public boolean hasNext() {
            return this.next != null;
        }

        protected HashEntry<K, V> nextEntry() {
            HashEntry<K, V> hashEntry;
            if (this.parent.modCount != this.expectedModCount) {
                throw new ConcurrentModificationException();
            }
            HashEntry<K, V> hashEntry2 = this.next;
            if (hashEntry2 == null) {
                throw new NoSuchElementException(AbstractHashedMap.NO_NEXT_ENTRY);
            }
            HashEntry<K, V>[] hashEntryArr = this.parent.data;
            int i = this.hashIndex;
            HashEntry<K, V> hashEntry3 = hashEntry2.next;
            while (true) {
                hashEntry = hashEntry3;
                if (hashEntry != null || i <= 0) {
                    break;
                }
                i--;
                hashEntry3 = hashEntryArr[i];
            }
            this.next = hashEntry;
            this.hashIndex = i;
            this.last = hashEntry2;
            return hashEntry2;
        }

        public void remove() {
            if (this.last == null) {
                throw new IllegalStateException(AbstractHashedMap.REMOVE_INVALID);
            }
            if (this.parent.modCount != this.expectedModCount) {
                throw new ConcurrentModificationException();
            }
            this.parent.remove(this.last.getKey());
            this.last = null;
            this.expectedModCount = this.parent.modCount;
        }

        public String toString() {
            return this.last != null ? "Iterator[" + this.last.getKey() + "=" + this.last.getValue() + "]" : "Iterator[]";
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractHashedMap$HashMapIterator.class */
    protected static class HashMapIterator<K, V> extends HashIterator<K, V> implements MapIterator<K, V> {
        protected HashMapIterator(AbstractHashedMap<K, V> abstractHashedMap) {
            super(abstractHashedMap);
        }

        @Override // org.jivesoftware.smack.util.collections.MapIterator
        public K getKey() {
            HashEntry<K, V> currentEntry = currentEntry();
            if (currentEntry == null) {
                throw new IllegalStateException(AbstractHashedMap.GETKEY_INVALID);
            }
            return currentEntry.getKey();
        }

        @Override // org.jivesoftware.smack.util.collections.MapIterator
        public V getValue() {
            HashEntry<K, V> currentEntry = currentEntry();
            if (currentEntry == null) {
                throw new IllegalStateException(AbstractHashedMap.GETVALUE_INVALID);
            }
            return currentEntry.getValue();
        }

        @Override // org.jivesoftware.smack.util.collections.MapIterator, java.util.Iterator
        public K next() {
            return super.nextEntry().getKey();
        }

        @Override // org.jivesoftware.smack.util.collections.MapIterator
        public V setValue(V v) {
            HashEntry<K, V> currentEntry = currentEntry();
            if (currentEntry == null) {
                throw new IllegalStateException(AbstractHashedMap.SETVALUE_INVALID);
            }
            return currentEntry.setValue(v);
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractHashedMap$KeySet.class */
    protected static class KeySet<K, V> extends AbstractSet<K> {
        protected final AbstractHashedMap<K, V> parent;

        protected KeySet(AbstractHashedMap<K, V> abstractHashedMap) {
            this.parent = abstractHashedMap;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public void clear() {
            this.parent.clear();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean contains(Object obj) {
            return this.parent.containsKey(obj);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public Iterator<K> iterator() {
            return this.parent.createKeySetIterator();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean remove(Object obj) {
            boolean containsKey = this.parent.containsKey(obj);
            this.parent.remove(obj);
            return containsKey;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return this.parent.size();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractHashedMap$KeySetIterator.class */
    protected static class KeySetIterator<K, V> extends HashIterator<K, V> implements Iterator<K> {
        protected KeySetIterator(AbstractHashedMap<K, V> abstractHashedMap) {
            super(abstractHashedMap);
        }

        @Override // java.util.Iterator
        public K next() {
            return super.nextEntry().getKey();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractHashedMap$Values.class */
    protected static class Values<K, V> extends AbstractCollection<V> {
        protected final AbstractHashedMap<K, V> parent;

        protected Values(AbstractHashedMap<K, V> abstractHashedMap) {
            this.parent = abstractHashedMap;
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public void clear() {
            this.parent.clear();
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean contains(Object obj) {
            return this.parent.containsValue(obj);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
        public Iterator<V> iterator() {
            return this.parent.createValuesIterator();
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public int size() {
            return this.parent.size();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/collections/AbstractHashedMap$ValuesIterator.class */
    protected static class ValuesIterator<K, V> extends HashIterator<K, V> implements Iterator<V> {
        protected ValuesIterator(AbstractHashedMap<K, V> abstractHashedMap) {
            super(abstractHashedMap);
        }

        @Override // java.util.Iterator
        public V next() {
            return super.nextEntry().getValue();
        }
    }

    protected AbstractHashedMap() {
    }

    protected AbstractHashedMap(int i) {
        this(i, DEFAULT_LOAD_FACTOR);
    }

    protected AbstractHashedMap(int i, float f) {
        if (i < 1) {
            throw new IllegalArgumentException("Initial capacity must be greater than 0");
        }
        if (f <= 0.0f || Float.isNaN(f)) {
            throw new IllegalArgumentException("Load factor must be greater than 0");
        }
        this.loadFactor = f;
        this.threshold = calculateThreshold(i, f);
        this.data = new HashEntry[calculateNewCapacity(i)];
        init();
    }

    protected AbstractHashedMap(int i, float f, int i2) {
        this.loadFactor = f;
        this.data = new HashEntry[i];
        this.threshold = i2;
        init();
    }

    protected AbstractHashedMap(Map<? extends K, ? extends V> map) {
        this(Math.max(map.size() * 2, 16), DEFAULT_LOAD_FACTOR);
        putAll(map);
    }

    protected void addEntry(HashEntry<K, V> hashEntry, int i) {
        this.data[i] = hashEntry;
    }

    protected void addMapping(int i, int i2, K k, V v) {
        this.modCount++;
        addEntry(createEntry(this.data[i], i2, k, v), i);
        this.size++;
        checkCapacity();
    }

    protected int calculateNewCapacity(int i) {
        int i2;
        int i3 = 1;
        if (i > MAXIMUM_CAPACITY) {
            i2 = MAXIMUM_CAPACITY;
        } else {
            while (i3 < i) {
                i3 <<= 1;
            }
            i2 = i3;
            if (i3 > MAXIMUM_CAPACITY) {
                i2 = MAXIMUM_CAPACITY;
            }
        }
        return i2;
    }

    protected int calculateThreshold(int i, float f) {
        return (int) (i * f);
    }

    protected void checkCapacity() {
        int length;
        if (this.size < this.threshold || (length = this.data.length * 2) > MAXIMUM_CAPACITY) {
            return;
        }
        ensureCapacity(length);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public void clear() {
        this.modCount++;
        HashEntry<K, V>[] hashEntryArr = this.data;
        for (int length = hashEntryArr.length - 1; length >= 0; length--) {
            hashEntryArr[length] = null;
        }
        this.size = 0;
    }

    @Override // java.util.AbstractMap
    protected Object clone() {
        AbstractHashedMap abstractHashedMap;
        try {
            abstractHashedMap = (AbstractHashedMap) super.clone();
            abstractHashedMap.data = new HashEntry[this.data.length];
            abstractHashedMap.entrySet = null;
            abstractHashedMap.keySet = null;
            abstractHashedMap.values = null;
            abstractHashedMap.modCount = 0;
            abstractHashedMap.size = 0;
            abstractHashedMap.init();
            abstractHashedMap.putAll(this);
        } catch (CloneNotSupportedException e) {
            abstractHashedMap = null;
        }
        return abstractHashedMap;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public boolean containsKey(Object obj) {
        boolean z;
        int hash = hash(obj == null ? NULL : obj);
        HashEntry<K, V> hashEntry = this.data[hashIndex(hash, this.data.length)];
        while (true) {
            HashEntry<K, V> hashEntry2 = hashEntry;
            if (hashEntry2 == null) {
                z = false;
                break;
            } else if (hashEntry2.hashCode == hash && isEqualKey(obj, hashEntry2.getKey())) {
                z = true;
                break;
            } else {
                hashEntry = hashEntry2.next;
            }
        }
        return z;
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x0035, code lost:
        r7 = r7 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0071, code lost:
        r7 = r7 + 1;
     */
    @Override // java.util.AbstractMap, java.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean containsValue(Object obj) {
        boolean z;
        if (obj == null) {
            int i = 0;
            int length = this.data.length;
            loop0: while (i < length) {
                HashEntry<K, V> hashEntry = this.data[i];
                while (true) {
                    HashEntry<K, V> hashEntry2 = hashEntry;
                    if (hashEntry2 != null) {
                        if (hashEntry2.getValue() == null) {
                            z = true;
                            break loop0;
                        }
                        hashEntry = hashEntry2.next;
                    }
                }
            }
            z = false;
        } else {
            int i2 = 0;
            int length2 = this.data.length;
            loop2: while (i2 < length2) {
                HashEntry<K, V> hashEntry3 = this.data[i2];
                while (true) {
                    HashEntry<K, V> hashEntry4 = hashEntry3;
                    if (hashEntry4 != null) {
                        z = true;
                        if (isEqualValue(obj, hashEntry4.getValue())) {
                            break loop2;
                        }
                        hashEntry3 = hashEntry4.next;
                    }
                }
            }
            z = false;
        }
        return z;
    }

    protected HashEntry<K, V> createEntry(HashEntry<K, V> hashEntry, int i, K k, V v) {
        return new HashEntry<>(hashEntry, i, k, v);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v4, types: [java.util.Iterator] */
    protected Iterator<Map.Entry<K, V>> createEntrySetIterator() {
        return size() == 0 ? EmptyIterator.INSTANCE : new EntrySetIterator(this);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v4, types: [java.util.Iterator] */
    protected Iterator<K> createKeySetIterator() {
        return size() == 0 ? EmptyIterator.INSTANCE : new KeySetIterator(this);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v4, types: [java.util.Iterator] */
    protected Iterator<V> createValuesIterator() {
        return size() == 0 ? EmptyIterator.INSTANCE : new ValuesIterator(this);
    }

    protected void destroyEntry(HashEntry<K, V> hashEntry) {
        hashEntry.next = null;
        ((HashEntry) hashEntry).key = null;
        ((HashEntry) hashEntry).value = null;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r5v0, resolved type: org.jivesoftware.smack.util.collections.AbstractHashedMap<K, V> */
    /* JADX WARN: Multi-variable type inference failed */
    protected void doReadObject(ObjectInputStream objectInputStream) throws IOException, ClassNotFoundException {
        this.loadFactor = objectInputStream.readFloat();
        int readInt = objectInputStream.readInt();
        int readInt2 = objectInputStream.readInt();
        init();
        this.data = new HashEntry[readInt];
        for (int i = 0; i < readInt2; i++) {
            put(objectInputStream.readObject(), objectInputStream.readObject());
        }
        this.threshold = calculateThreshold(this.data.length, this.loadFactor);
    }

    protected void doWriteObject(ObjectOutputStream objectOutputStream) throws IOException {
        objectOutputStream.writeFloat(this.loadFactor);
        objectOutputStream.writeInt(this.data.length);
        objectOutputStream.writeInt(this.size);
        MapIterator<K, V> mapIterator = mapIterator();
        while (mapIterator.hasNext()) {
            objectOutputStream.writeObject(mapIterator.next());
            objectOutputStream.writeObject(mapIterator.getValue());
        }
    }

    protected void ensureCapacity(int i) {
        HashEntry<K, V> hashEntry;
        int length = this.data.length;
        if (i <= length) {
            return;
        }
        if (this.size == 0) {
            this.threshold = calculateThreshold(i, this.loadFactor);
            this.data = new HashEntry[i];
            return;
        }
        HashEntry<K, V>[] hashEntryArr = this.data;
        HashEntry<K, V>[] hashEntryArr2 = new HashEntry[i];
        this.modCount++;
        while (true) {
            length--;
            if (length < 0) {
                this.threshold = calculateThreshold(i, this.loadFactor);
                this.data = hashEntryArr2;
                return;
            }
            HashEntry<K, V> hashEntry2 = hashEntryArr[length];
            if (hashEntry2 != null) {
                hashEntryArr[length] = null;
                do {
                    hashEntry = hashEntry2.next;
                    int hashIndex = hashIndex(hashEntry2.hashCode, i);
                    hashEntry2.next = hashEntryArr2[hashIndex];
                    hashEntryArr2[hashIndex] = hashEntry2;
                    hashEntry2 = hashEntry;
                } while (hashEntry != null);
            }
        }
    }

    protected int entryHashCode(HashEntry<K, V> hashEntry) {
        return hashEntry.hashCode;
    }

    protected K entryKey(HashEntry<K, V> hashEntry) {
        return (K) ((HashEntry) hashEntry).key;
    }

    protected HashEntry<K, V> entryNext(HashEntry<K, V> hashEntry) {
        return hashEntry.next;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Set<Map.Entry<K, V>> entrySet() {
        if (this.entrySet == null) {
            this.entrySet = new EntrySet<>(this);
        }
        return this.entrySet;
    }

    protected V entryValue(HashEntry<K, V> hashEntry) {
        return (V) ((HashEntry) hashEntry).value;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public boolean equals(Object obj) {
        boolean z;
        if (obj == this) {
            z = true;
        } else if (!(obj instanceof Map)) {
            z = false;
        } else {
            Map map = (Map) obj;
            if (map.size() != size()) {
                z = false;
            } else {
                MapIterator<K, V> mapIterator = mapIterator();
                while (true) {
                    z = true;
                    try {
                        if (!mapIterator.hasNext()) {
                            break;
                        }
                        K next = mapIterator.next();
                        V value = mapIterator.getValue();
                        if (value == null) {
                            if (map.get(next) != null || !map.containsKey(next)) {
                                break;
                            }
                        } else if (!value.equals(map.get(next))) {
                            z = false;
                            break;
                        }
                    } catch (ClassCastException e) {
                        z = false;
                    } catch (NullPointerException e2) {
                        z = false;
                    }
                }
                z = false;
            }
        }
        return z;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public V get(Object obj) {
        V v;
        int hash = hash(obj == null ? NULL : obj);
        HashEntry<K, V> hashEntry = this.data[hashIndex(hash, this.data.length)];
        while (true) {
            HashEntry<K, V> hashEntry2 = hashEntry;
            if (hashEntry2 == null) {
                v = null;
                break;
            } else if (hashEntry2.hashCode == hash && isEqualKey(obj, ((HashEntry) hashEntry2).key)) {
                v = hashEntry2.getValue();
                break;
            } else {
                hashEntry = hashEntry2.next;
            }
        }
        return v;
    }

    protected HashEntry<K, V> getEntry(Object obj) {
        HashEntry<K, V> hashEntry;
        int hash = hash(obj == null ? NULL : obj);
        HashEntry<K, V> hashEntry2 = this.data[hashIndex(hash, this.data.length)];
        while (true) {
            hashEntry = hashEntry2;
            if (hashEntry == null) {
                hashEntry = null;
                break;
            } else if (hashEntry.hashCode == hash && isEqualKey(obj, hashEntry.getKey())) {
                break;
            } else {
                hashEntry2 = hashEntry.next;
            }
        }
        return hashEntry;
    }

    protected int hash(Object obj) {
        int hashCode = obj.hashCode();
        int i = hashCode + ((hashCode << 9) ^ (-1));
        int i2 = i ^ (i >>> 14);
        int i3 = i2 + (i2 << 4);
        return i3 ^ (i3 >>> 10);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public int hashCode() {
        int i = 0;
        Iterator<Map.Entry<K, V>> createEntrySetIterator = createEntrySetIterator();
        while (createEntrySetIterator.hasNext()) {
            i += createEntrySetIterator.next().hashCode();
        }
        return i;
    }

    protected int hashIndex(int i, int i2) {
        return (i2 - 1) & i;
    }

    protected void init() {
    }

    @Override // java.util.AbstractMap, java.util.Map
    public boolean isEmpty() {
        return this.size == 0;
    }

    protected boolean isEqualKey(Object obj, Object obj2) {
        return obj == obj2 || (obj != null && obj.equals(obj2));
    }

    protected boolean isEqualValue(Object obj, Object obj2) {
        return obj == obj2 || obj.equals(obj2);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Set<K> keySet() {
        if (this.keySet == null) {
            this.keySet = new KeySet<>(this);
        }
        return this.keySet;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v4, types: [org.jivesoftware.smack.util.collections.MapIterator] */
    @Override // org.jivesoftware.smack.util.collections.IterableMap
    public MapIterator<K, V> mapIterator() {
        return this.size == 0 ? EmptyMapIterator.INSTANCE : new HashMapIterator(this);
    }

    /* JADX DEBUG: Multi-variable search result rejected for r0v23, resolved type: java.lang.Object */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.AbstractMap, java.util.Map
    public V put(K k, V v) {
        V v2;
        int hash = hash(k == null ? NULL : k);
        int hashIndex = hashIndex(hash, this.data.length);
        HashEntry<K, V> hashEntry = this.data[hashIndex];
        while (true) {
            HashEntry<K, V> hashEntry2 = hashEntry;
            if (hashEntry2 == null) {
                addMapping(hashIndex, hash, k, v);
                v2 = null;
                break;
            } else if (hashEntry2.hashCode == hash && isEqualKey(k, hashEntry2.getKey())) {
                v2 = hashEntry2.getValue();
                updateEntry(hashEntry2, v);
                break;
            } else {
                hashEntry = hashEntry2.next;
            }
        }
        return v2;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public void putAll(Map<? extends K, ? extends V> map) {
        int size = map.size();
        if (size == 0) {
            return;
        }
        ensureCapacity(calculateNewCapacity((int) (((this.size + size) / this.loadFactor) + 1.0f)));
        for (Map.Entry<? extends K, ? extends V> entry : map.entrySet()) {
            put(entry.getKey(), entry.getValue());
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public V remove(Object obj) {
        V v;
        int hash = hash(obj == null ? NULL : obj);
        int hashIndex = hashIndex(hash, this.data.length);
        HashEntry<K, V> hashEntry = this.data[hashIndex];
        HashEntry<K, V> hashEntry2 = null;
        while (true) {
            if (hashEntry == null) {
                v = null;
                break;
            } else if (hashEntry.hashCode == hash && isEqualKey(obj, hashEntry.getKey())) {
                v = hashEntry.getValue();
                removeMapping(hashEntry, hashIndex, hashEntry2);
                break;
            } else {
                hashEntry2 = hashEntry;
                hashEntry = hashEntry.next;
            }
        }
        return v;
    }

    protected void removeEntry(HashEntry<K, V> hashEntry, int i, HashEntry<K, V> hashEntry2) {
        if (hashEntry2 == null) {
            this.data[i] = hashEntry.next;
        } else {
            hashEntry2.next = hashEntry.next;
        }
    }

    protected void removeMapping(HashEntry<K, V> hashEntry, int i, HashEntry<K, V> hashEntry2) {
        this.modCount++;
        removeEntry(hashEntry, i, hashEntry2);
        this.size--;
        destroyEntry(hashEntry);
    }

    protected void reuseEntry(HashEntry<K, V> hashEntry, int i, int i2, K k, V v) {
        hashEntry.next = this.data[i];
        hashEntry.hashCode = i2;
        ((HashEntry) hashEntry).key = k;
        ((HashEntry) hashEntry).value = v;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public int size() {
        return this.size;
    }

    @Override // java.util.AbstractMap
    public String toString() {
        String sb;
        if (size() == 0) {
            sb = "{}";
        } else {
            StringBuilder sb2 = new StringBuilder(size() * 32);
            sb2.append('{');
            MapIterator<K, V> mapIterator = mapIterator();
            boolean hasNext = mapIterator.hasNext();
            while (hasNext) {
                K next = mapIterator.next();
                V value = mapIterator.getValue();
                K k = next;
                if (next == this) {
                    k = "(this Map)";
                }
                StringBuilder append = sb2.append(k).append('=');
                V v = value;
                if (value == this) {
                    v = "(this Map)";
                }
                append.append(v);
                boolean hasNext2 = mapIterator.hasNext();
                hasNext = hasNext2;
                if (hasNext2) {
                    sb2.append(',').append(' ');
                    hasNext = hasNext2;
                }
            }
            sb2.append('}');
            sb = sb2.toString();
        }
        return sb;
    }

    protected void updateEntry(HashEntry<K, V> hashEntry, V v) {
        hashEntry.setValue(v);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Collection<V> values() {
        if (this.values == null) {
            this.values = new Values<>(this);
        }
        return this.values;
    }
}
