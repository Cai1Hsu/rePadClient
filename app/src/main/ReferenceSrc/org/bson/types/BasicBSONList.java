package org.bson.types;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import org.bson.BSONObject;
import org.bson.util.StringRangeSet;

/* loaded from: classes.jar:org/bson/types/BasicBSONList.class */
public class BasicBSONList extends ArrayList<Object> implements BSONObject {
    private static final long serialVersionUID = -4415279469780082174L;

    int _getInt(String str) {
        return _getInt(str, true);
    }

    int _getInt(String str, boolean z) {
        int i;
        try {
            i = Integer.parseInt(str);
        } catch (Exception e) {
            if (z) {
                throw new IllegalArgumentException("BasicBSONList can only work with numeric keys, not: [" + str + "]");
            }
            i = -1;
        }
        return i;
    }

    @Override // org.bson.BSONObject
    public boolean containsField(String str) {
        boolean z;
        int _getInt = _getInt(str, false);
        if (_getInt < 0) {
            z = false;
        } else {
            z = false;
            if (_getInt >= 0) {
                z = false;
                if (_getInt < size()) {
                    z = true;
                }
            }
        }
        return z;
    }

    @Override // org.bson.BSONObject
    @Deprecated
    public boolean containsKey(String str) {
        return containsField(str);
    }

    @Override // org.bson.BSONObject
    public Object get(String str) {
        Object obj;
        int _getInt = _getInt(str);
        if (_getInt < 0) {
            obj = null;
        } else {
            obj = null;
            if (_getInt < size()) {
                obj = get(_getInt);
            }
        }
        return obj;
    }

    @Override // org.bson.BSONObject
    public Set<String> keySet() {
        return new StringRangeSet(size());
    }

    public Object put(int i, Object obj) {
        while (i >= size()) {
            add(null);
        }
        set(i, obj);
        return obj;
    }

    @Override // org.bson.BSONObject
    public Object put(String str, Object obj) {
        return put(_getInt(str), obj);
    }

    @Override // org.bson.BSONObject
    public void putAll(Map map) {
        for (Map.Entry entry : map.entrySet()) {
            put(entry.getKey().toString(), entry.getValue());
        }
    }

    @Override // org.bson.BSONObject
    public void putAll(BSONObject bSONObject) {
        for (String str : bSONObject.keySet()) {
            put(str, bSONObject.get(str));
        }
    }

    @Override // org.bson.BSONObject
    public Object removeField(String str) {
        Object obj;
        int _getInt = _getInt(str);
        if (_getInt < 0) {
            obj = null;
        } else {
            obj = null;
            if (_getInt < size()) {
                obj = remove(_getInt);
            }
        }
        return obj;
    }

    @Override // org.bson.BSONObject
    public Map toMap() {
        HashMap hashMap = new HashMap();
        for (String str : keySet()) {
            hashMap.put(str, get(String.valueOf(str)));
        }
        return hashMap;
    }
}
