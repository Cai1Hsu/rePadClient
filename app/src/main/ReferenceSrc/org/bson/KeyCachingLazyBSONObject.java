package org.bson;

import java.util.HashMap;
import org.bson.LazyBSONObject;
import org.bson.io.BSONByteBuffer;

@Deprecated
/* loaded from: classes.jar:org/bson/KeyCachingLazyBSONObject.class */
public class KeyCachingLazyBSONObject extends LazyBSONObject {
    private HashMap<String, LazyBSONObject.ElementRecord> fieldIndex = new HashMap<>();

    public KeyCachingLazyBSONObject(BSONByteBuffer bSONByteBuffer, int i, LazyBSONCallback lazyBSONCallback) {
        super(bSONByteBuffer, i, lazyBSONCallback);
    }

    public KeyCachingLazyBSONObject(BSONByteBuffer bSONByteBuffer, LazyBSONCallback lazyBSONCallback) {
        super(bSONByteBuffer, lazyBSONCallback);
    }

    public KeyCachingLazyBSONObject(byte[] bArr, int i, LazyBSONCallback lazyBSONCallback) {
        super(bArr, i, lazyBSONCallback);
    }

    public KeyCachingLazyBSONObject(byte[] bArr, LazyBSONCallback lazyBSONCallback) {
        super(bArr, lazyBSONCallback);
    }

    private void ensureFieldList() {
        synchronized (this) {
            if (this.fieldIndex != null) {
                try {
                    int i = this._doc_start_offset;
                    int i2 = 4;
                    while (true) {
                        int i3 = i + i2;
                        if (isElementEmpty(i3)) {
                            break;
                        }
                        int sizeCString = sizeCString(i3);
                        int i4 = i3 + 1;
                        int elementBSONSize = getElementBSONSize(i3);
                        String cString = this._input.getCString(i4);
                        this.fieldIndex.put(cString, new LazyBSONObject.ElementRecord(cString, i4));
                        i = i4;
                        i2 = sizeCString + elementBSONSize;
                    }
                } catch (Exception e) {
                    this.fieldIndex = new HashMap<>();
                }
            }
        }
    }

    @Override // org.bson.LazyBSONObject, org.bson.BSONObject
    public boolean containsField(String str) {
        ensureFieldList();
        return !this.fieldIndex.containsKey(str) ? false : super.containsField(str);
    }

    @Override // org.bson.LazyBSONObject, org.bson.BSONObject
    public Object get(String str) {
        ensureFieldList();
        return super.get(str);
    }
}
