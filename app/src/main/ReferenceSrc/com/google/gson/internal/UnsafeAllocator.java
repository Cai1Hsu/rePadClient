package com.google.gson.internal;

import java.io.ObjectInputStream;
import java.io.ObjectStreamClass;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/* loaded from: classes.dex */
public abstract class UnsafeAllocator {
    public abstract <T> T newInstance(Class<T> cls) throws Exception;

    public static UnsafeAllocator create() {
        try {
            Class<?> unsafeClass = Class.forName("sun.misc.Unsafe");
            Field f = unsafeClass.getDeclaredField("theUnsafe");
            f.setAccessible(true);
            final Object unsafe = f.get(null);
            final Method allocateInstance = unsafeClass.getMethod("allocateInstance", Class.class);
            return new UnsafeAllocator() { // from class: com.google.gson.internal.UnsafeAllocator.1
                @Override // com.google.gson.internal.UnsafeAllocator
                public <T> T newInstance(Class<T> c) throws Exception {
                    return (T) allocateInstance.invoke(unsafe, c);
                }
            };
        } catch (Exception e) {
            try {
                final Method newInstance = ObjectInputStream.class.getDeclaredMethod("newInstance", Class.class, Class.class);
                newInstance.setAccessible(true);
                return new UnsafeAllocator() { // from class: com.google.gson.internal.UnsafeAllocator.2
                    @Override // com.google.gson.internal.UnsafeAllocator
                    public <T> T newInstance(Class<T> c) throws Exception {
                        return (T) newInstance.invoke(null, c, Object.class);
                    }
                };
            } catch (Exception e2) {
                try {
                    Method getConstructorId = ObjectStreamClass.class.getDeclaredMethod("getConstructorId", Class.class);
                    getConstructorId.setAccessible(true);
                    final int constructorId = ((Integer) getConstructorId.invoke(null, Object.class)).intValue();
                    final Method newInstance2 = ObjectStreamClass.class.getDeclaredMethod("newInstance", Class.class, Integer.TYPE);
                    newInstance2.setAccessible(true);
                    return new UnsafeAllocator() { // from class: com.google.gson.internal.UnsafeAllocator.3
                        @Override // com.google.gson.internal.UnsafeAllocator
                        public <T> T newInstance(Class<T> c) throws Exception {
                            return (T) newInstance2.invoke(null, c, Integer.valueOf(constructorId));
                        }
                    };
                } catch (Exception e3) {
                    return new UnsafeAllocator() { // from class: com.google.gson.internal.UnsafeAllocator.4
                        @Override // com.google.gson.internal.UnsafeAllocator
                        public <T> T newInstance(Class<T> c) {
                            throw new UnsupportedOperationException("Cannot allocate " + c);
                        }
                    };
                }
            }
        }
    }
}
