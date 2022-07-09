package android.support.v4.util;

import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/* loaded from: classes.jar:android/support/v4/util/ArraySet.class */
public final class ArraySet<E> implements Collection<E>, Set<E> {
    private static final int BASE_SIZE = 4;
    private static final int CACHE_SIZE = 10;
    private static final boolean DEBUG = false;
    private static final int[] INT = new int[0];
    private static final Object[] OBJECT = new Object[0];
    private static final String TAG = "ArraySet";
    static Object[] sBaseCache;
    static int sBaseCacheSize;
    static Object[] sTwiceBaseCache;
    static int sTwiceBaseCacheSize;
    Object[] mArray;
    MapCollections<E, E> mCollections;
    int[] mHashes;
    final boolean mIdentityHashCode;
    int mSize;

    public ArraySet() {
        this(0, false);
    }

    public ArraySet(int i) {
        this(i, false);
    }

    public ArraySet(int i, boolean z) {
        this.mIdentityHashCode = z;
        if (i == 0) {
            this.mHashes = INT;
            this.mArray = OBJECT;
        } else {
            allocArrays(i);
        }
        this.mSize = 0;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r4v0, resolved type: android.support.v4.util.ArraySet<E> */
    /* JADX WARN: Multi-variable type inference failed */
    public ArraySet(ArraySet<E> arraySet) {
        this();
        if (arraySet != 0) {
            addAll((ArraySet) arraySet);
        }
    }

    /* JADX DEBUG: Multi-variable search result rejected for r4v0, resolved type: java.util.Collection<E> */
    /* JADX WARN: Multi-variable type inference failed */
    public ArraySet(Collection<E> collection) {
        this();
        if (collection != 0) {
            addAll(collection);
        }
    }

    private void allocArrays(int i) {
        if (i == 8) {
            synchronized (ArraySet.class) {
                try {
                    if (sTwiceBaseCache != null) {
                        Object[] objArr = sTwiceBaseCache;
                        this.mArray = objArr;
                        sTwiceBaseCache = (Object[]) objArr[0];
                        this.mHashes = (int[]) objArr[1];
                        objArr[1] = null;
                        objArr[0] = null;
                        sTwiceBaseCacheSize--;
                        return;
                    }
                } finally {
                }
            }
        } else if (i == 4) {
            synchronized (ArraySet.class) {
                try {
                    if (sBaseCache != null) {
                        Object[] objArr2 = sBaseCache;
                        this.mArray = objArr2;
                        sBaseCache = (Object[]) objArr2[0];
                        this.mHashes = (int[]) objArr2[1];
                        objArr2[1] = null;
                        objArr2[0] = null;
                        sBaseCacheSize--;
                        return;
                    }
                } finally {
                }
            }
        }
        this.mHashes = new int[i];
        this.mArray = new Object[i];
    }

    private static void freeArrays(int[] iArr, Object[] objArr, int i) {
        if (iArr.length == 8) {
            synchronized (ArraySet.class) {
                try {
                    if (sTwiceBaseCacheSize < 10) {
                        objArr[0] = sTwiceBaseCache;
                        objArr[1] = iArr;
                        while (true) {
                            i--;
                            if (i < 2) {
                                break;
                            }
                            objArr[i] = null;
                        }
                        sTwiceBaseCache = objArr;
                        sTwiceBaseCacheSize++;
                    }
                } finally {
                }
            }
        } else if (iArr.length != 4) {
        } else {
            synchronized (ArraySet.class) {
                try {
                    if (sBaseCacheSize < 10) {
                        objArr[0] = sBaseCache;
                        objArr[1] = iArr;
                        while (true) {
                            i--;
                            if (i < 2) {
                                break;
                            }
                            objArr[i] = null;
                        }
                        sBaseCache = objArr;
                        sBaseCacheSize++;
                    }
                } finally {
                }
            }
        }
    }

    private MapCollections<E, E> getCollection() {
        if (this.mCollections == null) {
            this.mCollections = new MapCollections<E, E>() { // from class: android.support.v4.util.ArraySet.1
                @Override // android.support.v4.util.MapCollections
                protected void colClear() {
                    ArraySet.this.clear();
                }

                @Override // android.support.v4.util.MapCollections
                protected Object colGetEntry(int i, int i2) {
                    return ArraySet.this.mArray[i];
                }

                @Override // android.support.v4.util.MapCollections
                protected Map<E, E> colGetMap() {
                    throw new UnsupportedOperationException("not a map");
                }

                @Override // android.support.v4.util.MapCollections
                protected int colGetSize() {
                    return ArraySet.this.mSize;
                }

                @Override // android.support.v4.util.MapCollections
                protected int colIndexOfKey(Object obj) {
                    return ArraySet.this.indexOf(obj);
                }

                @Override // android.support.v4.util.MapCollections
                protected int colIndexOfValue(Object obj) {
                    return ArraySet.this.indexOf(obj);
                }

                @Override // android.support.v4.util.MapCollections
                protected void colPut(E e, E e2) {
                    ArraySet.this.add(e);
                }

                @Override // android.support.v4.util.MapCollections
                protected void colRemoveAt(int i) {
                    ArraySet.this.removeAt(i);
                }

                @Override // android.support.v4.util.MapCollections
                protected E colSetValue(int i, E e) {
                    throw new UnsupportedOperationException("not a map");
                }
            };
        }
        return this.mCollections;
    }

    private int indexOf(Object obj, int i) {
        int i2;
        int i3 = this.mSize;
        if (i3 == 0) {
            i2 = -1;
        } else {
            int binarySearch = ContainerHelpers.binarySearch(this.mHashes, i3, i);
            i2 = binarySearch;
            if (binarySearch >= 0) {
                i2 = binarySearch;
                if (!obj.equals(this.mArray[binarySearch])) {
                    i2 = binarySearch + 1;
                    while (i2 < i3 && this.mHashes[i2] == i) {
                        if (obj.equals(this.mArray[i2])) {
                            break;
                        }
                        i2++;
                    }
                    while (true) {
                        binarySearch--;
                        if (binarySearch < 0 || this.mHashes[binarySearch] != i) {
                            break;
                        } else if (obj.equals(this.mArray[binarySearch])) {
                            i2 = binarySearch;
                            break;
                        }
                    }
                    i2 ^= -1;
                }
            }
        }
        return i2;
    }

    private int indexOfNull() {
        int i;
        int i2 = this.mSize;
        if (i2 == 0) {
            i = -1;
        } else {
            int binarySearch = ContainerHelpers.binarySearch(this.mHashes, i2, 0);
            i = binarySearch;
            if (binarySearch >= 0) {
                i = binarySearch;
                if (this.mArray[binarySearch] != null) {
                    i = binarySearch + 1;
                    while (i < i2 && this.mHashes[i] == 0) {
                        if (this.mArray[i] == null) {
                            break;
                        }
                        i++;
                    }
                    while (true) {
                        binarySearch--;
                        if (binarySearch < 0 || this.mHashes[binarySearch] != 0) {
                            break;
                        } else if (this.mArray[binarySearch] == null) {
                            i = binarySearch;
                            break;
                        }
                    }
                    i ^= -1;
                }
            }
        }
        return i;
    }

    @Override // java.util.Collection, java.util.Set
    public boolean add(E e) {
        int i;
        int indexOf;
        boolean z;
        int i2;
        if (e == null) {
            i = 0;
            indexOf = indexOfNull();
        } else {
            int identityHashCode = this.mIdentityHashCode ? System.identityHashCode(e) : e.hashCode();
            i = identityHashCode;
            indexOf = indexOf(e, identityHashCode);
        }
        if (indexOf >= 0) {
            z = false;
        } else {
            int i3 = indexOf ^ (-1);
            if (this.mSize >= this.mHashes.length) {
                if (this.mSize >= 8) {
                    i2 = this.mSize + (this.mSize >> 1);
                } else {
                    i2 = 8;
                    if (this.mSize < 4) {
                        i2 = 4;
                    }
                }
                int[] iArr = this.mHashes;
                Object[] objArr = this.mArray;
                allocArrays(i2);
                if (this.mHashes.length > 0) {
                    System.arraycopy(iArr, 0, this.mHashes, 0, iArr.length);
                    System.arraycopy(objArr, 0, this.mArray, 0, objArr.length);
                }
                freeArrays(iArr, objArr, this.mSize);
            }
            if (i3 < this.mSize) {
                System.arraycopy(this.mHashes, i3, this.mHashes, i3 + 1, this.mSize - i3);
                System.arraycopy(this.mArray, i3, this.mArray, i3 + 1, this.mSize - i3);
            }
            this.mHashes[i3] = i;
            this.mArray[i3] = e;
            this.mSize++;
            z = true;
        }
        return z;
    }

    public void addAll(ArraySet<? extends E> arraySet) {
        int i = arraySet.mSize;
        ensureCapacity(this.mSize + i);
        if (this.mSize != 0) {
            for (int i2 = 0; i2 < i; i2++) {
                add(arraySet.valueAt(i2));
            }
        } else if (i > 0) {
            System.arraycopy(arraySet.mHashes, 0, this.mHashes, 0, i);
            System.arraycopy(arraySet.mArray, 0, this.mArray, 0, i);
            this.mSize = i;
        }
    }

    @Override // java.util.Collection, java.util.Set
    public boolean addAll(Collection<? extends E> collection) {
        ensureCapacity(this.mSize + collection.size());
        boolean z = false;
        for (E e : collection) {
            z |= add(e);
        }
        return z;
    }

    public void append(E e) {
        int i = this.mSize;
        int identityHashCode = e == null ? 0 : this.mIdentityHashCode ? System.identityHashCode(e) : e.hashCode();
        if (i >= this.mHashes.length) {
            throw new IllegalStateException("Array is full");
        }
        if (i > 0 && this.mHashes[i - 1] > identityHashCode) {
            add(e);
            return;
        }
        this.mSize = i + 1;
        this.mHashes[i] = identityHashCode;
        this.mArray[i] = e;
    }

    @Override // java.util.Collection, java.util.Set
    public void clear() {
        if (this.mSize != 0) {
            freeArrays(this.mHashes, this.mArray, this.mSize);
            this.mHashes = INT;
            this.mArray = OBJECT;
            this.mSize = 0;
        }
    }

    @Override // java.util.Collection, java.util.Set
    public boolean contains(Object obj) {
        return indexOf(obj) >= 0;
    }

    @Override // java.util.Collection, java.util.Set
    public boolean containsAll(Collection<?> collection) {
        boolean z;
        Iterator<?> it = collection.iterator();
        while (true) {
            if (!it.hasNext()) {
                z = true;
                break;
            } else if (!contains(it.next())) {
                z = false;
                break;
            }
        }
        return z;
    }

    public void ensureCapacity(int i) {
        if (this.mHashes.length < i) {
            int[] iArr = this.mHashes;
            Object[] objArr = this.mArray;
            allocArrays(i);
            if (this.mSize > 0) {
                System.arraycopy(iArr, 0, this.mHashes, 0, this.mSize);
                System.arraycopy(objArr, 0, this.mArray, 0, this.mSize);
            }
            freeArrays(iArr, objArr, this.mSize);
        }
    }

    @Override // java.util.Collection, java.util.Set
    public boolean equals(Object obj) {
        boolean z;
        if (this == obj) {
            z = true;
        } else if (obj instanceof Set) {
            Set set = (Set) obj;
            if (size() != set.size()) {
                z = false;
            } else {
                int i = 0;
                while (true) {
                    z = true;
                    try {
                        if (i >= this.mSize) {
                            break;
                        } else if (!set.contains(valueAt(i))) {
                            z = false;
                            break;
                        } else {
                            i++;
                        }
                    } catch (ClassCastException e) {
                        z = false;
                    } catch (NullPointerException e2) {
                        z = false;
                    }
                }
            }
        } else {
            z = false;
        }
        return z;
    }

    @Override // java.util.Collection, java.util.Set
    public int hashCode() {
        int[] iArr = this.mHashes;
        int i = 0;
        int i2 = this.mSize;
        for (int i3 = 0; i3 < i2; i3++) {
            i += iArr[i3];
        }
        return i;
    }

    public int indexOf(Object obj) {
        int indexOf;
        if (obj == null) {
            indexOf = indexOfNull();
        } else {
            indexOf = indexOf(obj, this.mIdentityHashCode ? System.identityHashCode(obj) : obj.hashCode());
        }
        return indexOf;
    }

    @Override // java.util.Collection, java.util.Set
    public boolean isEmpty() {
        return this.mSize <= 0;
    }

    @Override // java.util.Collection, java.lang.Iterable, java.util.Set
    public Iterator<E> iterator() {
        return getCollection().getKeySet().iterator();
    }

    @Override // java.util.Collection, java.util.Set
    public boolean remove(Object obj) {
        boolean z;
        int indexOf = indexOf(obj);
        if (indexOf >= 0) {
            removeAt(indexOf);
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    public boolean removeAll(ArraySet<? extends E> arraySet) {
        int i = arraySet.mSize;
        int i2 = this.mSize;
        for (int i3 = 0; i3 < i; i3++) {
            remove(arraySet.valueAt(i3));
        }
        return i2 != this.mSize;
    }

    @Override // java.util.Collection, java.util.Set
    public boolean removeAll(Collection<?> collection) {
        boolean z = false;
        Iterator<?> it = collection.iterator();
        while (it.hasNext()) {
            z |= remove(it.next());
        }
        return z;
    }

    public E removeAt(int i) {
        int i2 = 8;
        E e = (E) this.mArray[i];
        if (this.mSize <= 1) {
            freeArrays(this.mHashes, this.mArray, this.mSize);
            this.mHashes = INT;
            this.mArray = OBJECT;
            this.mSize = 0;
        } else if (this.mHashes.length <= 8 || this.mSize >= this.mHashes.length / 3) {
            this.mSize--;
            if (i < this.mSize) {
                System.arraycopy(this.mHashes, i + 1, this.mHashes, i, this.mSize - i);
                System.arraycopy(this.mArray, i + 1, this.mArray, i, this.mSize - i);
            }
            this.mArray[this.mSize] = null;
        } else {
            if (this.mSize > 8) {
                i2 = this.mSize + (this.mSize >> 1);
            }
            int[] iArr = this.mHashes;
            Object[] objArr = this.mArray;
            allocArrays(i2);
            this.mSize--;
            if (i > 0) {
                System.arraycopy(iArr, 0, this.mHashes, 0, i);
                System.arraycopy(objArr, 0, this.mArray, 0, i);
            }
            if (i < this.mSize) {
                System.arraycopy(iArr, i + 1, this.mHashes, i, this.mSize - i);
                System.arraycopy(objArr, i + 1, this.mArray, i, this.mSize - i);
            }
        }
        return e;
    }

    @Override // java.util.Collection, java.util.Set
    public boolean retainAll(Collection<?> collection) {
        boolean z = false;
        for (int i = this.mSize - 1; i >= 0; i--) {
            if (!collection.contains(this.mArray[i])) {
                removeAt(i);
                z = true;
            }
        }
        return z;
    }

    @Override // java.util.Collection, java.util.Set
    public int size() {
        return this.mSize;
    }

    @Override // java.util.Collection, java.util.Set
    public Object[] toArray() {
        Object[] objArr = new Object[this.mSize];
        System.arraycopy(this.mArray, 0, objArr, 0, this.mSize);
        return objArr;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v13, types: [java.lang.Object[]] */
    @Override // java.util.Collection, java.util.Set
    public <T> T[] toArray(T[] tArr) {
        T[] tArr2 = tArr;
        if (tArr.length < this.mSize) {
            tArr2 = (Object[]) Array.newInstance(tArr.getClass().getComponentType(), this.mSize);
        }
        System.arraycopy(this.mArray, 0, tArr2, 0, this.mSize);
        if (tArr2.length > this.mSize) {
            tArr2[this.mSize] = null;
        }
        return tArr2;
    }

    public String toString() {
        String sb;
        if (isEmpty()) {
            sb = "{}";
        } else {
            StringBuilder sb2 = new StringBuilder(this.mSize * 14);
            sb2.append('{');
            for (int i = 0; i < this.mSize; i++) {
                if (i > 0) {
                    sb2.append(", ");
                }
                E valueAt = valueAt(i);
                if (valueAt != this) {
                    sb2.append(valueAt);
                } else {
                    sb2.append("(this Set)");
                }
            }
            sb2.append('}');
            sb = sb2.toString();
        }
        return sb;
    }

    public E valueAt(int i) {
        return (E) this.mArray[i];
    }
}
