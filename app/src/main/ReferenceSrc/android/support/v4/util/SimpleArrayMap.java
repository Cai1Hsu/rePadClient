package android.support.v4.util;

import java.util.Map;

/* loaded from: classes.jar:android/support/v4/util/SimpleArrayMap.class */
public class SimpleArrayMap<K, V> {
    private static final int BASE_SIZE = 4;
    private static final int CACHE_SIZE = 10;
    private static final boolean DEBUG = false;
    private static final String TAG = "ArrayMap";
    static Object[] mBaseCache;
    static int mBaseCacheSize;
    static Object[] mTwiceBaseCache;
    static int mTwiceBaseCacheSize;
    Object[] mArray;
    int[] mHashes;
    int mSize;

    public SimpleArrayMap() {
        this.mHashes = ContainerHelpers.EMPTY_INTS;
        this.mArray = ContainerHelpers.EMPTY_OBJECTS;
        this.mSize = 0;
    }

    public SimpleArrayMap(int i) {
        if (i == 0) {
            this.mHashes = ContainerHelpers.EMPTY_INTS;
            this.mArray = ContainerHelpers.EMPTY_OBJECTS;
        } else {
            allocArrays(i);
        }
        this.mSize = 0;
    }

    public SimpleArrayMap(SimpleArrayMap simpleArrayMap) {
        this();
        if (simpleArrayMap != null) {
            putAll(simpleArrayMap);
        }
    }

    private void allocArrays(int i) {
        if (i == 8) {
            synchronized (ArrayMap.class) {
                try {
                    if (mTwiceBaseCache != null) {
                        Object[] objArr = mTwiceBaseCache;
                        this.mArray = objArr;
                        mTwiceBaseCache = (Object[]) objArr[0];
                        this.mHashes = (int[]) objArr[1];
                        objArr[1] = null;
                        objArr[0] = null;
                        mTwiceBaseCacheSize--;
                        return;
                    }
                } finally {
                }
            }
        } else if (i == 4) {
            synchronized (ArrayMap.class) {
                try {
                    if (mBaseCache != null) {
                        Object[] objArr2 = mBaseCache;
                        this.mArray = objArr2;
                        mBaseCache = (Object[]) objArr2[0];
                        this.mHashes = (int[]) objArr2[1];
                        objArr2[1] = null;
                        objArr2[0] = null;
                        mBaseCacheSize--;
                        return;
                    }
                } finally {
                }
            }
        }
        this.mHashes = new int[i];
        this.mArray = new Object[i << 1];
    }

    private static void freeArrays(int[] iArr, Object[] objArr, int i) {
        if (iArr.length == 8) {
            synchronized (ArrayMap.class) {
                try {
                    if (mTwiceBaseCacheSize < 10) {
                        objArr[0] = mTwiceBaseCache;
                        objArr[1] = iArr;
                        for (int i2 = (i << 1) - 1; i2 >= 2; i2--) {
                            objArr[i2] = null;
                        }
                        mTwiceBaseCache = objArr;
                        mTwiceBaseCacheSize++;
                    }
                } finally {
                }
            }
        } else if (iArr.length == 4) {
            synchronized (ArrayMap.class) {
                try {
                    if (mBaseCacheSize < 10) {
                        objArr[0] = mBaseCache;
                        objArr[1] = iArr;
                        for (int i3 = (i << 1) - 1; i3 >= 2; i3--) {
                            objArr[i3] = null;
                        }
                        mBaseCache = objArr;
                        mBaseCacheSize++;
                    }
                } finally {
                }
            }
        }
    }

    public void clear() {
        if (this.mSize != 0) {
            freeArrays(this.mHashes, this.mArray, this.mSize);
            this.mHashes = ContainerHelpers.EMPTY_INTS;
            this.mArray = ContainerHelpers.EMPTY_OBJECTS;
            this.mSize = 0;
        }
    }

    public boolean containsKey(Object obj) {
        return indexOfKey(obj) >= 0;
    }

    public boolean containsValue(Object obj) {
        return indexOfValue(obj) >= 0;
    }

    public void ensureCapacity(int i) {
        if (this.mHashes.length < i) {
            int[] iArr = this.mHashes;
            Object[] objArr = this.mArray;
            allocArrays(i);
            if (this.mSize > 0) {
                System.arraycopy(iArr, 0, this.mHashes, 0, this.mSize);
                System.arraycopy(objArr, 0, this.mArray, 0, this.mSize << 1);
            }
            freeArrays(iArr, objArr, this.mSize);
        }
    }

    public boolean equals(Object obj) {
        boolean z;
        if (this == obj) {
            z = true;
        } else if (obj instanceof SimpleArrayMap) {
            SimpleArrayMap simpleArrayMap = (SimpleArrayMap) obj;
            if (size() != simpleArrayMap.size()) {
                z = false;
            } else {
                int i = 0;
                while (true) {
                    z = true;
                    try {
                        if (i >= this.mSize) {
                            break;
                        }
                        K keyAt = keyAt(i);
                        V valueAt = valueAt(i);
                        Object obj2 = simpleArrayMap.get(keyAt);
                        if (valueAt == null) {
                            if (obj2 != null || !simpleArrayMap.containsKey(keyAt)) {
                                break;
                            }
                        } else if (!valueAt.equals(obj2)) {
                            z = false;
                            break;
                        }
                        i++;
                    } catch (ClassCastException e) {
                        z = false;
                    } catch (NullPointerException e2) {
                        z = false;
                    }
                }
                z = false;
            }
        } else if (obj instanceof Map) {
            Map map = (Map) obj;
            if (size() != map.size()) {
                z = false;
            } else {
                int i2 = 0;
                while (true) {
                    z = true;
                    try {
                        if (i2 >= this.mSize) {
                            break;
                        }
                        K keyAt2 = keyAt(i2);
                        V valueAt2 = valueAt(i2);
                        Object obj3 = map.get(keyAt2);
                        if (valueAt2 == null) {
                            if (obj3 != null || !map.containsKey(keyAt2)) {
                                break;
                            }
                        } else if (!valueAt2.equals(obj3)) {
                            z = false;
                            break;
                        }
                        i2++;
                    } catch (ClassCastException e3) {
                        z = false;
                    } catch (NullPointerException e4) {
                        z = false;
                    }
                }
                z = false;
            }
        } else {
            z = false;
        }
        return z;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v6, types: [java.lang.Object[]] */
    /* JADX WARN: Type inference failed for: r0v7 */
    public V get(Object obj) {
        int indexOfKey = indexOfKey(obj);
        return indexOfKey >= 0 ? this.mArray[(indexOfKey << 1) + 1] : null;
    }

    public int hashCode() {
        int[] iArr = this.mHashes;
        Object[] objArr = this.mArray;
        int i = 0;
        int i2 = 0;
        int i3 = 1;
        int i4 = this.mSize;
        while (i2 < i4) {
            Object obj = objArr[i3];
            i += (obj == null ? 0 : obj.hashCode()) ^ iArr[i2];
            i2++;
            i3 += 2;
        }
        return i;
    }

    int indexOf(Object obj, int i) {
        int i2;
        int i3 = this.mSize;
        if (i3 == 0) {
            i2 = -1;
        } else {
            int binarySearch = ContainerHelpers.binarySearch(this.mHashes, i3, i);
            i2 = binarySearch;
            if (binarySearch >= 0) {
                i2 = binarySearch;
                if (!obj.equals(this.mArray[binarySearch << 1])) {
                    i2 = binarySearch + 1;
                    while (i2 < i3 && this.mHashes[i2] == i) {
                        if (obj.equals(this.mArray[i2 << 1])) {
                            break;
                        }
                        i2++;
                    }
                    while (true) {
                        binarySearch--;
                        if (binarySearch < 0 || this.mHashes[binarySearch] != i) {
                            break;
                        } else if (obj.equals(this.mArray[binarySearch << 1])) {
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

    public int indexOfKey(Object obj) {
        return obj == null ? indexOfNull() : indexOf(obj, obj.hashCode());
    }

    int indexOfNull() {
        int i;
        int i2 = this.mSize;
        if (i2 == 0) {
            i = -1;
        } else {
            int binarySearch = ContainerHelpers.binarySearch(this.mHashes, i2, 0);
            i = binarySearch;
            if (binarySearch >= 0) {
                i = binarySearch;
                if (this.mArray[binarySearch << 1] != null) {
                    i = binarySearch + 1;
                    while (i < i2 && this.mHashes[i] == 0) {
                        if (this.mArray[i << 1] == null) {
                            break;
                        }
                        i++;
                    }
                    while (true) {
                        binarySearch--;
                        if (binarySearch < 0 || this.mHashes[binarySearch] != 0) {
                            break;
                        } else if (this.mArray[binarySearch << 1] == null) {
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

    int indexOfValue(Object obj) {
        int i;
        int i2 = this.mSize * 2;
        Object[] objArr = this.mArray;
        if (obj == null) {
            for (int i3 = 1; i3 < i2; i3 += 2) {
                if (objArr[i3] == null) {
                    i = i3 >> 1;
                    break;
                }
            }
            i = -1;
        } else {
            for (int i4 = 1; i4 < i2; i4 += 2) {
                if (obj.equals(objArr[i4])) {
                    i = i4 >> 1;
                    break;
                }
            }
            i = -1;
        }
        return i;
    }

    public boolean isEmpty() {
        return this.mSize <= 0;
    }

    public K keyAt(int i) {
        return (K) this.mArray[i << 1];
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v49, types: [java.lang.Object[]] */
    /* JADX WARN: Type inference failed for: r0v50 */
    public V put(K k, V v) {
        int hashCode;
        int indexOf;
        V v2;
        int i;
        if (k == null) {
            hashCode = 0;
            indexOf = indexOfNull();
        } else {
            hashCode = k.hashCode();
            indexOf = indexOf(k, hashCode);
        }
        if (indexOf >= 0) {
            int i2 = (indexOf << 1) + 1;
            v2 = this.mArray[i2];
            this.mArray[i2] = v;
        } else {
            int i3 = indexOf ^ (-1);
            if (this.mSize >= this.mHashes.length) {
                if (this.mSize >= 8) {
                    i = this.mSize + (this.mSize >> 1);
                } else {
                    i = 8;
                    if (this.mSize < 4) {
                        i = 4;
                    }
                }
                int[] iArr = this.mHashes;
                Object[] objArr = this.mArray;
                allocArrays(i);
                if (this.mHashes.length > 0) {
                    System.arraycopy(iArr, 0, this.mHashes, 0, iArr.length);
                    System.arraycopy(objArr, 0, this.mArray, 0, objArr.length);
                }
                freeArrays(iArr, objArr, this.mSize);
            }
            if (i3 < this.mSize) {
                System.arraycopy(this.mHashes, i3, this.mHashes, i3 + 1, this.mSize - i3);
                System.arraycopy(this.mArray, i3 << 1, this.mArray, (i3 + 1) << 1, (this.mSize - i3) << 1);
            }
            this.mHashes[i3] = hashCode;
            this.mArray[i3 << 1] = k;
            this.mArray[(i3 << 1) + 1] = v;
            this.mSize++;
            v2 = null;
        }
        return v2;
    }

    public void putAll(SimpleArrayMap<? extends K, ? extends V> simpleArrayMap) {
        int i = simpleArrayMap.mSize;
        ensureCapacity(this.mSize + i);
        if (this.mSize != 0) {
            for (int i2 = 0; i2 < i; i2++) {
                put(simpleArrayMap.keyAt(i2), simpleArrayMap.valueAt(i2));
            }
        } else if (i > 0) {
            System.arraycopy(simpleArrayMap.mHashes, 0, this.mHashes, 0, i);
            System.arraycopy(simpleArrayMap.mArray, 0, this.mArray, 0, i << 1);
            this.mSize = i;
        }
    }

    public V remove(Object obj) {
        int indexOfKey = indexOfKey(obj);
        return indexOfKey >= 0 ? removeAt(indexOfKey) : null;
    }

    public V removeAt(int i) {
        int i2 = 8;
        V v = (V) this.mArray[(i << 1) + 1];
        if (this.mSize <= 1) {
            freeArrays(this.mHashes, this.mArray, this.mSize);
            this.mHashes = ContainerHelpers.EMPTY_INTS;
            this.mArray = ContainerHelpers.EMPTY_OBJECTS;
            this.mSize = 0;
        } else if (this.mHashes.length <= 8 || this.mSize >= this.mHashes.length / 3) {
            this.mSize--;
            if (i < this.mSize) {
                System.arraycopy(this.mHashes, i + 1, this.mHashes, i, this.mSize - i);
                System.arraycopy(this.mArray, (i + 1) << 1, this.mArray, i << 1, (this.mSize - i) << 1);
            }
            this.mArray[this.mSize << 1] = null;
            this.mArray[(this.mSize << 1) + 1] = null;
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
                System.arraycopy(objArr, 0, this.mArray, 0, i << 1);
            }
            if (i < this.mSize) {
                System.arraycopy(iArr, i + 1, this.mHashes, i, this.mSize - i);
                System.arraycopy(objArr, (i + 1) << 1, this.mArray, i << 1, (this.mSize - i) << 1);
            }
        }
        return v;
    }

    public V setValueAt(int i, V v) {
        int i2 = (i << 1) + 1;
        V v2 = (V) this.mArray[i2];
        this.mArray[i2] = v;
        return v2;
    }

    public int size() {
        return this.mSize;
    }

    public String toString() {
        String sb;
        if (isEmpty()) {
            sb = "{}";
        } else {
            StringBuilder sb2 = new StringBuilder(this.mSize * 28);
            sb2.append('{');
            for (int i = 0; i < this.mSize; i++) {
                if (i > 0) {
                    sb2.append(", ");
                }
                K keyAt = keyAt(i);
                if (keyAt != this) {
                    sb2.append(keyAt);
                } else {
                    sb2.append("(this Map)");
                }
                sb2.append('=');
                V valueAt = valueAt(i);
                if (valueAt != this) {
                    sb2.append(valueAt);
                } else {
                    sb2.append("(this Map)");
                }
            }
            sb2.append('}');
            sb = sb2.toString();
        }
        return sb;
    }

    public V valueAt(int i) {
        return (V) this.mArray[(i << 1) + 1];
    }
}
