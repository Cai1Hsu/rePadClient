package org.bson;

import com.mongodb.util.JSONSerializers;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;
import org.bson.types.BasicBSONList;
import org.bson.types.ObjectId;

/* loaded from: classes.jar:org/bson/BasicBSONObject.class */
public class BasicBSONObject extends LinkedHashMap<String, Object> implements BSONObject {
    private static final long serialVersionUID = -4415279469780082174L;

    public BasicBSONObject() {
    }

    public BasicBSONObject(int i) {
        super(i);
    }

    public BasicBSONObject(String str, Object obj) {
        put(str, obj);
    }

    public BasicBSONObject(Map map) {
        super(map);
    }

    private static Object canonicalize(Object obj) {
        BasicBSONObject basicBSONObject;
        if ((obj instanceof BSONObject) && !(obj instanceof BasicBSONList)) {
            basicBSONObject = canonicalizeBSONObject((BSONObject) obj);
        } else if (obj instanceof List) {
            basicBSONObject = canonicalizeList((List) obj);
        } else {
            basicBSONObject = obj;
            if (obj instanceof Map) {
                basicBSONObject = canonicalizeMap((Map) obj);
            }
        }
        return basicBSONObject;
    }

    private static BasicBSONObject canonicalizeBSONObject(BSONObject bSONObject) {
        BasicBSONObject basicBSONObject = new BasicBSONObject();
        Iterator it = new TreeSet(bSONObject.keySet()).iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            basicBSONObject.put(str, canonicalize(bSONObject.get(str)));
        }
        return basicBSONObject;
    }

    private static List canonicalizeList(List<Object> list) {
        ArrayList arrayList = new ArrayList(list.size());
        for (Object obj : list) {
            arrayList.add(canonicalize(obj));
        }
        return arrayList;
    }

    private static Map<String, Object> canonicalizeMap(Map<String, Object> map) {
        LinkedHashMap linkedHashMap = new LinkedHashMap(map.size());
        Iterator it = new TreeSet(map.keySet()).iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            linkedHashMap.put(str, canonicalize(map.get(str)));
        }
        return linkedHashMap;
    }

    private BSONObject decode(byte[] bArr) {
        return new BasicBSONDecoder().readObject(bArr);
    }

    private byte[] encode() {
        return new BasicBSONEncoder().encode(this);
    }

    public BasicBSONObject append(String str, Object obj) {
        put(str, obj);
        return this;
    }

    @Override // org.bson.BSONObject
    public boolean containsField(String str) {
        return super.containsKey((Object) str);
    }

    @Override // org.bson.BSONObject
    @Deprecated
    public boolean containsKey(String str) {
        return containsField(str);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public boolean equals(Object obj) {
        boolean z;
        if (obj == this) {
            z = true;
        } else {
            z = false;
            if (obj instanceof BSONObject) {
                BSONObject bSONObject = (BSONObject) obj;
                z = false;
                if (keySet().equals(bSONObject.keySet())) {
                    z = Arrays.equals(canonicalizeBSONObject(this).encode(), canonicalizeBSONObject(bSONObject).encode());
                }
            }
        }
        return z;
    }

    @Override // org.bson.BSONObject
    public Object get(String str) {
        return super.get((Object) str);
    }

    public boolean getBoolean(String str) {
        return getBoolean(str, false);
    }

    public boolean getBoolean(String str, boolean z) {
        Object obj = get(str);
        if (obj != null) {
            if (obj instanceof Number) {
                z = ((Number) obj).intValue() > 0;
            } else if (!(obj instanceof Boolean)) {
                throw new IllegalArgumentException("can't coerce to bool:" + obj.getClass());
            } else {
                z = ((Boolean) obj).booleanValue();
            }
        }
        return z;
    }

    public Date getDate(String str) {
        return (Date) get(str);
    }

    public Date getDate(String str, Date date) {
        Object obj = get(str);
        return obj != null ? (Date) obj : date;
    }

    public double getDouble(String str) {
        return ((Number) get(str)).doubleValue();
    }

    public double getDouble(String str, double d) {
        Object obj = get(str);
        if (obj != null) {
            d = ((Number) obj).doubleValue();
        }
        return d;
    }

    public int getInt(String str) {
        Object obj = get(str);
        if (obj == null) {
            throw new NullPointerException("no value for: " + str);
        }
        return BSON.toInt(obj);
    }

    public int getInt(String str, int i) {
        Object obj = get(str);
        if (obj != null) {
            i = BSON.toInt(obj);
        }
        return i;
    }

    public long getLong(String str) {
        return ((Number) get(str)).longValue();
    }

    public long getLong(String str, long j) {
        Object obj = get(str);
        if (obj != null) {
            j = ((Number) obj).longValue();
        }
        return j;
    }

    public ObjectId getObjectId(String str) {
        return (ObjectId) get(str);
    }

    public ObjectId getObjectId(String str, ObjectId objectId) {
        Object obj = get(str);
        return obj != null ? (ObjectId) obj : objectId;
    }

    public String getString(String str) {
        Object obj = get(str);
        return obj == null ? null : obj.toString();
    }

    public String getString(String str, String str2) {
        Object obj = get(str);
        if (obj != null) {
            str2 = obj.toString();
        }
        return str2;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public int hashCode() {
        return Arrays.hashCode(canonicalizeBSONObject(this).encode());
    }

    @Override // org.bson.BSONObject
    public Object put(String str, Object obj) {
        return super.put((BasicBSONObject) str, (String) obj);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map, org.bson.BSONObject
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
        return remove(str);
    }

    @Override // org.bson.BSONObject
    public Map toMap() {
        return new LinkedHashMap(this);
    }

    @Override // java.util.AbstractMap
    public String toString() {
        return JSONSerializers.getStrict().serialize(this);
    }
}
