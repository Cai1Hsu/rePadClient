package org.bson.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ConcurrentMap;

/* loaded from: classes.jar:org/bson/util/ClassAncestry.class */
class ClassAncestry {
    private static final ConcurrentMap<Class<?>, List<Class<?>>> _ancestryCache = CopyOnWriteMap.newHashMap();

    ClassAncestry() {
    }

    private static List<Class<?>> computeAncestry(Class<?> cls) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(Object.class);
        computeAncestry(cls, arrayList);
        Collections.reverse(arrayList);
        return Collections.unmodifiableList(new ArrayList(arrayList));
    }

    private static <T> void computeAncestry(Class<T> cls, List<Class<?>> list) {
        if (cls == null || cls == Object.class) {
            return;
        }
        Class<?>[] interfaces = cls.getInterfaces();
        for (int length = interfaces.length - 1; length >= 0; length--) {
            computeAncestry(interfaces[length], list);
        }
        computeAncestry(cls.getSuperclass(), list);
        if (list.contains(cls)) {
            return;
        }
        list.add(cls);
    }

    public static <T> List<Class<?>> getAncestry(Class<T> cls) {
        ConcurrentMap<Class<?>, List<Class<?>>> classAncestryCache = getClassAncestryCache();
        while (true) {
            List<Class<?>> list = classAncestryCache.get(cls);
            if (list != null) {
                return list;
            }
            classAncestryCache.putIfAbsent(cls, computeAncestry(cls));
        }
    }

    private static ConcurrentMap<Class<?>, List<Class<?>>> getClassAncestryCache() {
        return _ancestryCache;
    }
}
