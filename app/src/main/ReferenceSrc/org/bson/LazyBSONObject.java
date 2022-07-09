package org.bson;

import com.mongodb.util.JSON;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import org.bson.io.BSONByteBuffer;
import org.bson.types.BSONTimestamp;
import org.bson.types.Code;
import org.bson.types.CodeWScope;
import org.bson.types.MaxKey;
import org.bson.types.MinKey;
import org.bson.types.ObjectId;
import org.bson.types.Symbol;

/* loaded from: classes.jar:org/bson/LazyBSONObject.class */
public class LazyBSONObject implements BSONObject {
    static final int FIRST_ELMT_OFFSET = 4;
    private static final Logger log = Logger.getLogger("org.bson.LazyBSONObject");
    @Deprecated
    protected final LazyBSONCallback _callback;
    @Deprecated
    protected final int _doc_start_offset;
    @Deprecated
    protected final BSONByteBuffer _input;

    /* loaded from: classes.jar:org/bson/LazyBSONObject$ElementRecord.class */
    class ElementRecord {
        final int fieldNameSize;
        final String name;
        final int offset;
        final byte type;
        final int valueOffset;

        ElementRecord(String str, int i) {
            LazyBSONObject.this = r6;
            this.name = str;
            this.offset = i;
            this.type = r6.getElementType(i - 1);
            this.fieldNameSize = r6.sizeCString(i);
            this.valueOffset = this.fieldNameSize + i;
        }
    }

    /* loaded from: classes.jar:org/bson/LazyBSONObject$LazyBSONEntryIterator.class */
    class LazyBSONEntryIterator implements Iterator<Map.Entry<String, Object>> {
        int offset;

        LazyBSONEntryIterator() {
            LazyBSONObject.this = r5;
            this.offset = LazyBSONObject.this._doc_start_offset + 4;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return !LazyBSONObject.this.isElementEmpty(this.offset);
        }

        @Override // java.util.Iterator
        public Map.Entry<String, Object> next() {
            int sizeCString = LazyBSONObject.this.sizeCString(this.offset + 1);
            int elementBSONSize = LazyBSONObject.this.getElementBSONSize(this.offset);
            String cString = LazyBSONObject.this._input.getCString(this.offset + 1);
            LazyBSONObject lazyBSONObject = LazyBSONObject.this;
            int i = this.offset + 1;
            this.offset = i;
            final ElementRecord elementRecord = new ElementRecord(cString, i);
            this.offset += sizeCString + elementBSONSize;
            return new Map.Entry<String, Object>() { // from class: org.bson.LazyBSONObject.LazyBSONEntryIterator.1
                @Override // java.util.Map.Entry
                public boolean equals(Object obj) {
                    boolean z;
                    if (!(obj instanceof Map.Entry)) {
                        z = false;
                    } else {
                        Map.Entry entry = (Map.Entry) obj;
                        z = false;
                        if (getKey().equals(entry.getKey())) {
                            z = false;
                            if (getValue().equals(entry.getValue())) {
                                z = true;
                            }
                        }
                    }
                    return z;
                }

                @Override // java.util.Map.Entry
                public String getKey() {
                    return elementRecord.name;
                }

                @Override // java.util.Map.Entry
                public Object getValue() {
                    return LazyBSONObject.this.getElementValue(elementRecord);
                }

                @Override // java.util.Map.Entry
                public int hashCode() {
                    return getKey().hashCode() ^ getValue().hashCode();
                }

                @Override // java.util.Map.Entry
                public Object setValue(Object obj) {
                    throw new UnsupportedOperationException("Read only");
                }

                public String toString() {
                    return getKey() + "=" + getValue();
                }
            };
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException("Read only");
        }
    }

    /* loaded from: classes.jar:org/bson/LazyBSONObject$LazyBSONEntrySet.class */
    class LazyBSONEntrySet extends ReadOnlySet<Map.Entry<String, Object>> {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        LazyBSONEntrySet() {
            super();
            LazyBSONObject.this = r4;
        }

        @Override // java.util.Set, java.util.Collection
        public boolean contains(Object obj) {
            boolean z;
            Iterator<Map.Entry<String, Object>> it = iterator();
            while (true) {
                if (!it.hasNext()) {
                    z = false;
                    break;
                } else if (it.next().equals(obj)) {
                    z = true;
                    break;
                }
            }
            return z;
        }

        @Override // java.util.Set, java.util.Collection
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

        @Override // java.util.Set, java.util.Collection
        public boolean isEmpty() {
            return LazyBSONObject.this.isEmpty();
        }

        @Override // java.util.Set, java.util.Collection, java.lang.Iterable
        public Iterator<Map.Entry<String, Object>> iterator() {
            return new LazyBSONEntryIterator();
        }

        @Override // java.util.Set, java.util.Collection
        public int size() {
            return LazyBSONObject.this.keySet().size();
        }

        @Override // java.util.Set, java.util.Collection
        public Object[] toArray() {
            return toArray(new Map.Entry[size()]);
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v8, types: [java.lang.Object[]] */
        @Override // java.util.Set, java.util.Collection
        public <T> T[] toArray(T[] tArr) {
            int size = size();
            if (tArr.length < size) {
                tArr = (Object[]) Array.newInstance(tArr.getClass().getComponentType(), size);
            }
            Iterator<Map.Entry<String, Object>> it = iterator();
            int i = 0;
            while (it.hasNext()) {
                tArr[i] = it.next();
                i++;
            }
            if (tArr.length > i) {
                tArr[i] = null;
            }
            return tArr;
        }
    }

    /* loaded from: classes.jar:org/bson/LazyBSONObject$LazyBSONKeyIterator.class */
    class LazyBSONKeyIterator implements Iterator<String> {
        int offset;

        LazyBSONKeyIterator() {
            LazyBSONObject.this = r5;
            this.offset = LazyBSONObject.this._doc_start_offset + 4;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return !LazyBSONObject.this.isElementEmpty(this.offset);
        }

        @Override // java.util.Iterator
        public String next() {
            int sizeCString = LazyBSONObject.this.sizeCString(this.offset + 1);
            int elementBSONSize = LazyBSONObject.this.getElementBSONSize(this.offset);
            String cString = LazyBSONObject.this._input.getCString(this.offset + 1);
            this.offset += sizeCString + elementBSONSize + 1;
            return cString;
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException("Read only");
        }
    }

    @Deprecated
    /* loaded from: classes.jar:org/bson/LazyBSONObject$LazyBSONKeySet.class */
    public class LazyBSONKeySet extends ReadOnlySet<String> {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public LazyBSONKeySet() {
            super();
            LazyBSONObject.this = r4;
        }

        public boolean add(String str) {
            throw new UnsupportedOperationException("Not supported yet.");
        }

        @Override // org.bson.LazyBSONObject.ReadOnlySet, java.util.Set, java.util.Collection
        public /* bridge */ /* synthetic */ boolean addAll(Collection collection) {
            return super.addAll(collection);
        }

        @Override // org.bson.LazyBSONObject.ReadOnlySet, java.util.Set, java.util.Collection
        public /* bridge */ /* synthetic */ void clear() {
            super.clear();
        }

        @Override // java.util.Set, java.util.Collection
        public boolean contains(Object obj) {
            boolean z;
            Iterator<String> it = iterator();
            while (true) {
                if (!it.hasNext()) {
                    z = false;
                    break;
                } else if (it.next().equals(obj)) {
                    z = true;
                    break;
                }
            }
            return z;
        }

        @Override // java.util.Set, java.util.Collection
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

        @Override // java.util.Set, java.util.Collection
        public boolean isEmpty() {
            return LazyBSONObject.this.isEmpty();
        }

        @Override // java.util.Set, java.util.Collection, java.lang.Iterable
        public Iterator<String> iterator() {
            return new LazyBSONKeyIterator();
        }

        @Override // org.bson.LazyBSONObject.ReadOnlySet, java.util.Set, java.util.Collection
        public boolean remove(Object obj) {
            throw new UnsupportedOperationException("Not supported yet.");
        }

        @Override // org.bson.LazyBSONObject.ReadOnlySet, java.util.Set, java.util.Collection
        public /* bridge */ /* synthetic */ boolean removeAll(Collection collection) {
            return super.removeAll(collection);
        }

        @Override // org.bson.LazyBSONObject.ReadOnlySet, java.util.Set, java.util.Collection
        public /* bridge */ /* synthetic */ boolean retainAll(Collection collection) {
            return super.retainAll(collection);
        }

        @Override // java.util.Set, java.util.Collection
        public int size() {
            int i = 0;
            Iterator<String> it = iterator();
            while (it.hasNext()) {
                it.next();
                i++;
            }
            return i;
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v8, types: [java.lang.Object[]] */
        @Override // java.util.Set, java.util.Collection
        public <T> T[] toArray(T[] tArr) {
            int size = size();
            if (tArr.length < size) {
                tArr = (Object[]) Array.newInstance(tArr.getClass().getComponentType(), size);
            }
            int i = 0;
            Iterator<String> it = iterator();
            while (it.hasNext()) {
                tArr[i] = it.next();
                i++;
            }
            if (tArr.length > i) {
                tArr[i] = null;
            }
            return tArr;
        }

        @Override // java.util.Set, java.util.Collection
        public String[] toArray() {
            return (String[]) toArray(new String[size()]);
        }
    }

    /* loaded from: classes.jar:org/bson/LazyBSONObject$ReadOnlySet.class */
    abstract class ReadOnlySet<E> implements Set<E> {
        ReadOnlySet() {
            LazyBSONObject.this = r4;
        }

        @Override // java.util.Set, java.util.Collection
        public boolean add(E e) {
            throw new UnsupportedOperationException("Read-only Set");
        }

        @Override // java.util.Set, java.util.Collection
        public boolean addAll(Collection<? extends E> collection) {
            throw new UnsupportedOperationException("Read-only Set");
        }

        @Override // java.util.Set, java.util.Collection
        public void clear() {
            throw new UnsupportedOperationException("Read-only Set");
        }

        @Override // java.util.Set, java.util.Collection
        public boolean remove(Object obj) {
            throw new UnsupportedOperationException("Read-only Set");
        }

        @Override // java.util.Set, java.util.Collection
        public boolean removeAll(Collection<?> collection) {
            throw new UnsupportedOperationException("Read-only Set");
        }

        @Override // java.util.Set, java.util.Collection
        public boolean retainAll(Collection<?> collection) {
            throw new UnsupportedOperationException("Read-only Set");
        }
    }

    public LazyBSONObject(BSONByteBuffer bSONByteBuffer, int i, LazyBSONCallback lazyBSONCallback) {
        this._callback = lazyBSONCallback;
        this._input = bSONByteBuffer;
        this._doc_start_offset = i;
    }

    public LazyBSONObject(BSONByteBuffer bSONByteBuffer, LazyBSONCallback lazyBSONCallback) {
        this(bSONByteBuffer, 0, lazyBSONCallback);
    }

    public LazyBSONObject(byte[] bArr, int i, LazyBSONCallback lazyBSONCallback) {
        this(BSONByteBuffer.wrap(bArr, i, bArr.length - i), i, lazyBSONCallback);
    }

    public LazyBSONObject(byte[] bArr, LazyBSONCallback lazyBSONCallback) {
        this(BSONByteBuffer.wrap(bArr), lazyBSONCallback);
    }

    private int getBSONSize(int i) {
        return this._input.getInt(i);
    }

    private String getElementFieldName(int i) {
        return this._input.getCString(i);
    }

    /* JADX DEBUG: Multi-variable search result rejected for r0v19, resolved type: byte[] */
    /* JADX DEBUG: Multi-variable search result rejected for r0v26, resolved type: byte[] */
    /* JADX DEBUG: Multi-variable search result rejected for r0v32, resolved type: byte[] */
    /* JADX WARN: Multi-variable type inference failed */
    private Object readBinary(int i) {
        UUID uuid;
        int i2 = this._input.getInt(i);
        int i3 = i + 4;
        int i4 = i3 + 1;
        switch (this._input.get(i3)) {
            case 0:
                byte[] bArr = new byte[i2];
                int i5 = 0;
                while (true) {
                    uuid = bArr;
                    if (i5 >= i2) {
                        break;
                    } else {
                        bArr[i5] = this._input.get(i4 + i5);
                        i5++;
                    }
                }
            case 1:
            default:
                byte[] bArr2 = new byte[i2];
                int i6 = 0;
                while (true) {
                    uuid = bArr2;
                    if (i6 >= i2) {
                        break;
                    } else {
                        bArr2[i6] = this._input.get(i4 + i6);
                        i6++;
                    }
                }
            case 2:
                int i7 = this._input.getInt(i4);
                if (i7 + 4 == i2) {
                    byte[] bArr3 = new byte[i7];
                    int i8 = 0;
                    while (true) {
                        uuid = bArr3;
                        if (i8 >= i7) {
                            break;
                        } else {
                            bArr3[i8] = this._input.get(i4 + 4 + i8);
                            i8++;
                        }
                    }
                } else {
                    throw new IllegalArgumentException("Bad Data Size; Binary Subtype 2.  { actual len: " + i7 + " expected totalLen: " + i2 + "}");
                }
            case 3:
                if (i2 == 16) {
                    uuid = new UUID(this._input.getLong(i4), this._input.getLong(i4 + 8));
                    break;
                } else {
                    throw new IllegalArgumentException("Bad Data Size; Binary Subtype 3 (UUID). { total length: " + i2 + " != 16");
                }
        }
        return uuid;
    }

    @Override // org.bson.BSONObject
    public boolean containsField(String str) {
        return keySet().contains(str);
    }

    @Override // org.bson.BSONObject
    @Deprecated
    public boolean containsKey(String str) {
        return containsField(str);
    }

    public Set<Map.Entry<String, Object>> entrySet() {
        return new LazyBSONEntrySet();
    }

    public boolean equals(Object obj) {
        return this == obj ? true : (obj == null || getClass() != obj.getClass()) ? false : Arrays.equals(this._input.array(), ((LazyBSONObject) obj)._input.array());
    }

    @Override // org.bson.BSONObject
    public Object get(String str) {
        ElementRecord element = getElement(str);
        return element == null ? null : getElementValue(element);
    }

    public int getBSONSize() {
        return getBSONSize(this._doc_start_offset);
    }

    protected byte[] getBytes() {
        return this._input.array();
    }

    ElementRecord getElement(String str) {
        ElementRecord elementRecord;
        int i = this._doc_start_offset;
        int i2 = 4;
        while (true) {
            int i3 = i + i2;
            if (isElementEmpty(i3)) {
                elementRecord = null;
                break;
            }
            int sizeCString = sizeCString(i3 + 1);
            int elementBSONSize = getElementBSONSize(i3);
            int i4 = i3 + 1;
            String cString = this._input.getCString(i4);
            if (cString.equals(str)) {
                elementRecord = new ElementRecord(cString, i4);
                break;
            }
            i = i4;
            i2 = sizeCString + elementBSONSize;
        }
        return elementRecord;
    }

    @Deprecated
    protected int getElementBSONSize(int i) {
        int i2 = i + 1;
        byte elementType = getElementType(i);
        int sizeCString = i2 + sizeCString(i2);
        int i3 = 0;
        switch (elementType) {
            case -1:
            case 0:
            case 6:
            case 10:
            case Byte.MAX_VALUE:
                break;
            case 1:
            case 9:
            case 17:
            case 18:
                i3 = 8;
                break;
            case 2:
            case 13:
            case 14:
                i3 = this._input.getInt(sizeCString) + 4;
                break;
            case 3:
            case 4:
                i3 = this._input.getInt(sizeCString);
                break;
            case 5:
                i3 = this._input.getInt(sizeCString) + 4 + 1;
                break;
            case 7:
                i3 = 12;
                break;
            case 8:
                i3 = 1;
                break;
            case 11:
                int sizeCString2 = sizeCString(sizeCString);
                i3 = sizeCString2 + sizeCString(sizeCString + sizeCString2);
                break;
            case 12:
                i3 = this._input.getInt(sizeCString) + 4 + 12;
                break;
            case 15:
                i3 = this._input.getInt(sizeCString);
                break;
            case 16:
                i3 = 4;
                break;
            default:
                throw new BSONException("Invalid type " + ((int) elementType) + " for field " + getElementFieldName(i2));
        }
        return i3;
    }

    @Deprecated
    protected byte getElementType(int i) {
        return this._input.get(i);
    }

    @Deprecated
    protected Object getElementValue(ElementRecord elementRecord) {
        MaxKey compile;
        switch (elementRecord.type) {
            case -1:
                compile = new MinKey();
                break;
            case 0:
            case 6:
            case 10:
                compile = null;
                break;
            case 1:
                compile = Double.valueOf(Double.longBitsToDouble(this._input.getLong(elementRecord.valueOffset)));
                break;
            case 2:
                compile = this._input.getUTF8String(elementRecord.valueOffset);
                break;
            case 3:
                compile = this._callback.createObject(this._input.array(), elementRecord.valueOffset);
                break;
            case 4:
                compile = this._callback.createArray(this._input.array(), elementRecord.valueOffset);
                break;
            case 5:
                compile = readBinary(elementRecord.valueOffset);
                break;
            case 7:
                compile = new ObjectId(this._input.getIntBE(elementRecord.valueOffset), this._input.getIntBE(elementRecord.valueOffset + 4), this._input.getIntBE(elementRecord.valueOffset + 8));
                break;
            case 8:
                compile = Boolean.valueOf(this._input.get(elementRecord.valueOffset) != 0);
                break;
            case 9:
                compile = new Date(this._input.getLong(elementRecord.valueOffset));
                break;
            case 11:
                compile = Pattern.compile(this._input.getCString(elementRecord.valueOffset), BSON.regexFlags(this._input.getCString(elementRecord.valueOffset + sizeCString(elementRecord.valueOffset))));
                break;
            case 12:
                int i = this._input.getInt(elementRecord.valueOffset);
                String cString = this._input.getCString(elementRecord.valueOffset + 4);
                int i2 = elementRecord.valueOffset + i + 4;
                compile = this._callback.createDBRef(cString, new ObjectId(this._input.getIntBE(i2), this._input.getIntBE(i2 + 4), this._input.getIntBE(i2 + 8)));
                break;
            case 13:
                compile = new Code(this._input.getUTF8String(elementRecord.valueOffset));
                break;
            case 14:
                compile = new Symbol(this._input.getUTF8String(elementRecord.valueOffset));
                break;
            case 15:
                compile = new CodeWScope(this._input.getUTF8String(elementRecord.valueOffset + 4), (BSONObject) this._callback.createObject(this._input.array(), elementRecord.valueOffset + 4 + 4 + this._input.getInt(elementRecord.valueOffset + 4)));
                break;
            case 16:
                compile = Integer.valueOf(this._input.getInt(elementRecord.valueOffset));
                break;
            case 17:
                compile = new BSONTimestamp(this._input.getInt(elementRecord.valueOffset + 4), this._input.getInt(elementRecord.valueOffset));
                break;
            case 18:
                compile = Long.valueOf(this._input.getLong(elementRecord.valueOffset));
                break;
            case Byte.MAX_VALUE:
                compile = new MaxKey();
                break;
            default:
                throw new BSONException("Invalid type " + ((int) elementRecord.type) + " for field " + getElementFieldName(elementRecord.offset));
        }
        return compile;
    }

    List<ElementRecord> getElements() {
        int i = this._doc_start_offset + 4;
        ArrayList arrayList = new ArrayList();
        while (!isElementEmpty(i)) {
            int sizeCString = sizeCString(i + 1);
            int elementBSONSize = getElementBSONSize(i);
            int i2 = i + 1;
            arrayList.add(new ElementRecord(this._input.getCString(i2), i2));
            i = i2 + sizeCString + elementBSONSize;
        }
        return arrayList;
    }

    protected int getOffset() {
        return this._doc_start_offset;
    }

    public int hashCode() {
        return Arrays.hashCode(this._input.array());
    }

    @Deprecated
    protected boolean isElementEmpty(int i) {
        return getElementType(i) == 0;
    }

    public boolean isEmpty() {
        return isElementEmpty(this._doc_start_offset + 4);
    }

    @Override // org.bson.BSONObject
    public Set<String> keySet() {
        return new LazyBSONKeySet();
    }

    public int pipe(OutputStream outputStream) throws IOException {
        outputStream.write(this._input.array(), this._doc_start_offset, getBSONSize());
        return getBSONSize();
    }

    @Override // org.bson.BSONObject
    public Object put(String str, Object obj) {
        throw new UnsupportedOperationException("Object is read only");
    }

    @Override // org.bson.BSONObject
    public void putAll(Map map) {
        throw new UnsupportedOperationException("Object is read only");
    }

    @Override // org.bson.BSONObject
    public void putAll(BSONObject bSONObject) {
        throw new UnsupportedOperationException("Object is read only");
    }

    @Override // org.bson.BSONObject
    public Object removeField(String str) {
        throw new UnsupportedOperationException("Object is read only");
    }

    @Deprecated
    protected int sizeCString(int i) {
        int i2 = i;
        while (this._input.get(i2) != 0) {
            i2++;
        }
        return (i2 - i) + 1;
    }

    @Override // org.bson.BSONObject
    public Map toMap() {
        throw new UnsupportedOperationException("Not Supported");
    }

    public String toString() {
        return JSON.serialize(this);
    }
}
