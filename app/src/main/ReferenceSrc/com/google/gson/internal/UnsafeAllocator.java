package com.google.gson.internal;

import java.io.ObjectInputStream;
import java.io.ObjectStreamClass;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public abstract class UnsafeAllocator {
    public abstract <T> T newInstance(Class<T> cls) throws Exception;

    public static UnsafeAllocator create() {
        try {
            Class<?> unsafeClass = Class.forName("sun.misc.Unsafe");
            Field f = unsafeClass.getDeclaredField("theUnsafe");
            f.setAccessible(true);
            Object unsafe = f.get(null);
            Method allocateInstance = unsafeClass.getMethod("allocateInstance", Class.class);
            return new AnonymousClass1(allocateInstance, unsafe);
        } catch (Exception e) {
            try {
                Method newInstance = ObjectInputStream.class.getDeclaredMethod("newInstance", Class.class, Class.class);
                newInstance.setAccessible(true);
                return new AnonymousClass2(newInstance);
            } catch (Exception e2) {
                try {
                    Method getConstructorId = ObjectStreamClass.class.getDeclaredMethod("getConstructorId", Class.class);
                    getConstructorId.setAccessible(true);
                    int constructorId = ((Integer) getConstructorId.invoke(null, Object.class)).intValue();
                    Method newInstance2 = ObjectStreamClass.class.getDeclaredMethod("newInstance", Class.class, Integer.TYPE);
                    newInstance2.setAccessible(true);
                    return new AnonymousClass3(newInstance2, constructorId);
                } catch (Exception e3) {
                    return new AnonymousClass4();
                }
            }
        }
    }

    /* renamed from: com.google.gson.internal.UnsafeAllocator$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass1 extends UnsafeAllocator {
        final /* synthetic */ Method val$allocateInstance;
        final /* synthetic */ Object val$unsafe;

        AnonymousClass1(Method method, Object obj) {
            this.val$allocateInstance = method;
            this.val$unsafe = obj;
        }

        @Override // com.google.gson.internal.UnsafeAllocator
        public <T> T newInstance(Class<T> c) throws Exception {
            return (T) this.val$allocateInstance.invoke(this.val$unsafe, c);
        }
    }

    /* renamed from: com.google.gson.internal.UnsafeAllocator$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass2 extends UnsafeAllocator {
        final /* synthetic */ Method val$newInstance;

        AnonymousClass2(Method method) {
            this.val$newInstance = method;
        }

        @Override // com.google.gson.internal.UnsafeAllocator
        public <T> T newInstance(Class<T> c) throws Exception {
            return (T) this.val$newInstance.invoke(null, c, Object.class);
        }
    }

    /* renamed from: com.google.gson.internal.UnsafeAllocator$3 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass3 extends UnsafeAllocator {
        final /* synthetic */ int val$constructorId;
        final /* synthetic */ Method val$newInstance;

        AnonymousClass3(Method method, int i) {
            this.val$newInstance = method;
            this.val$constructorId = i;
        }

        @Override // com.google.gson.internal.UnsafeAllocator
        public <T> T newInstance(Class<T> c) throws Exception {
            return (T) this.val$newInstance.invoke(null, c, Integer.valueOf(this.val$constructorId));
        }
    }

    /* renamed from: com.google.gson.internal.UnsafeAllocator$4 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass4 extends UnsafeAllocator {
        AnonymousClass4() {
        }

        @Override // com.google.gson.internal.UnsafeAllocator
        public <T> T newInstance(Class<T> c) {
            throw new UnsupportedOperationException("Cannot allocate " + c);
        }
    }
}
