package org.bson.util;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes.jar:org/bson/util/ClassMap.class */
public class ClassMap<T> {
    private final Map<Class<?>, T> map = CopyOnWriteMap.newHashMap();
    private final Map<Class<?>, T> cache = ComputingMap.create(new ComputeFunction());

    /* loaded from: classes.jar:org/bson/util/ClassMap$ComputeFunction.class */
    private final class ComputeFunction implements Function<Class<?>, T> {
        private ComputeFunction() {
            ClassMap.this = r4;
        }

        /* JADX DEBUG: Multi-variable search result rejected for r0v13, resolved type: java.lang.Object */
        /* JADX WARN: Multi-variable type inference failed */
        public T apply(Class<?> cls) {
            T t;
            Iterator<Class<?>> it = ClassMap.getAncestry(cls).iterator();
            while (true) {
                if (!it.hasNext()) {
                    t = null;
                    break;
                }
                t = ClassMap.this.map.get(it.next());
                if (t != null) {
                    break;
                }
            }
            return t;
        }
    }

    public static <T> List<Class<?>> getAncestry(Class<T> cls) {
        return ClassAncestry.getAncestry(cls);
    }

    public void clear() {
        this.map.clear();
        this.cache.clear();
    }

    public T get(Object obj) {
        return this.cache.get(obj);
    }

    public boolean isEmpty() {
        return this.map.isEmpty();
    }

    public T put(Class<?> cls, T t) {
        try {
            return this.map.put(cls, t);
        } finally {
            this.cache.clear();
        }
    }

    public T remove(Object obj) {
        try {
            return this.map.remove(obj);
        } finally {
            this.cache.clear();
        }
    }

    public int size() {
        return this.map.size();
    }
}
