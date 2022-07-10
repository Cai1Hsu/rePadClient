package com.google.gson.internal;

import com.google.gson.InstanceCreator;
import com.google.gson.JsonIOException;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collection;
import java.util.EnumSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class ConstructorConstructor {
    private final Map<Type, InstanceCreator<?>> instanceCreators;

    public ConstructorConstructor(Map<Type, InstanceCreator<?>> instanceCreators) {
        this.instanceCreators = instanceCreators;
    }

    public <T> ObjectConstructor<T> get(TypeToken<T> typeToken) {
        Type type = typeToken.getType();
        Class<? super T> rawType = typeToken.getRawType();
        InstanceCreator<?> instanceCreator = this.instanceCreators.get(type);
        if (instanceCreator != null) {
            return new AnonymousClass1(instanceCreator, type);
        }
        InstanceCreator<?> instanceCreator2 = this.instanceCreators.get(rawType);
        if (instanceCreator2 != null) {
            return new AnonymousClass2(instanceCreator2, type);
        }
        ObjectConstructor<T> defaultConstructor = newDefaultConstructor(rawType);
        if (defaultConstructor == null) {
            ObjectConstructor<T> defaultImplementation = newDefaultImplementationConstructor(type, rawType);
            return defaultImplementation != null ? defaultImplementation : newUnsafeAllocator(type, rawType);
        }
        return defaultConstructor;
    }

    /* renamed from: com.google.gson.internal.ConstructorConstructor$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 implements ObjectConstructor<T> {
        final /* synthetic */ Type val$type;
        final /* synthetic */ InstanceCreator val$typeCreator;

        AnonymousClass1(InstanceCreator instanceCreator, Type type) {
            ConstructorConstructor.this = r1;
            this.val$typeCreator = instanceCreator;
            this.val$type = type;
        }

        /* JADX WARN: Type inference failed for: r0v1, types: [T, java.lang.Object] */
        @Override // com.google.gson.internal.ObjectConstructor
        public T construct() {
            return this.val$typeCreator.createInstance(this.val$type);
        }
    }

    /* renamed from: com.google.gson.internal.ConstructorConstructor$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass2 implements ObjectConstructor<T> {
        final /* synthetic */ InstanceCreator val$rawTypeCreator;
        final /* synthetic */ Type val$type;

        AnonymousClass2(InstanceCreator instanceCreator, Type type) {
            ConstructorConstructor.this = r1;
            this.val$rawTypeCreator = instanceCreator;
            this.val$type = type;
        }

        /* JADX WARN: Type inference failed for: r0v1, types: [T, java.lang.Object] */
        @Override // com.google.gson.internal.ObjectConstructor
        public T construct() {
            return this.val$rawTypeCreator.createInstance(this.val$type);
        }
    }

    private <T> ObjectConstructor<T> newDefaultConstructor(Class<? super T> rawType) {
        try {
            Constructor<? super T> constructor = rawType.getDeclaredConstructor(new Class[0]);
            if (!constructor.isAccessible()) {
                constructor.setAccessible(true);
            }
            return new AnonymousClass3(constructor);
        } catch (NoSuchMethodException e) {
            return null;
        }
    }

    /* renamed from: com.google.gson.internal.ConstructorConstructor$3 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass3 implements ObjectConstructor<T> {
        final /* synthetic */ Constructor val$constructor;

        AnonymousClass3(Constructor constructor) {
            ConstructorConstructor.this = r1;
            this.val$constructor = constructor;
        }

        /* JADX WARN: Type inference failed for: r2v4, types: [T, java.lang.Object] */
        @Override // com.google.gson.internal.ObjectConstructor
        public T construct() {
            try {
                return this.val$constructor.newInstance(null);
            } catch (IllegalAccessException e) {
                throw new AssertionError(e);
            } catch (InstantiationException e2) {
                throw new RuntimeException("Failed to invoke " + this.val$constructor + " with no args", e2);
            } catch (InvocationTargetException e3) {
                throw new RuntimeException("Failed to invoke " + this.val$constructor + " with no args", e3.getTargetException());
            }
        }
    }

    private <T> ObjectConstructor<T> newDefaultImplementationConstructor(Type type, Class<? super T> rawType) {
        if (Collection.class.isAssignableFrom(rawType)) {
            if (SortedSet.class.isAssignableFrom(rawType)) {
                return new AnonymousClass4();
            }
            if (EnumSet.class.isAssignableFrom(rawType)) {
                return new AnonymousClass5(type);
            }
            if (Set.class.isAssignableFrom(rawType)) {
                return new AnonymousClass6();
            }
            if (Queue.class.isAssignableFrom(rawType)) {
                return new AnonymousClass7();
            }
            return new AnonymousClass8();
        } else if (Map.class.isAssignableFrom(rawType)) {
            if (SortedMap.class.isAssignableFrom(rawType)) {
                return new AnonymousClass9();
            }
            if ((type instanceof ParameterizedType) && !String.class.isAssignableFrom(TypeToken.get(((ParameterizedType) type).getActualTypeArguments()[0]).getRawType())) {
                return new AnonymousClass10();
            }
            return new AnonymousClass11();
        } else {
            return null;
        }
    }

    /* renamed from: com.google.gson.internal.ConstructorConstructor$4 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass4 implements ObjectConstructor<T> {
        AnonymousClass4() {
            ConstructorConstructor.this = r1;
        }

        /* JADX WARN: Type inference failed for: r0v0, types: [T, java.util.TreeSet] */
        @Override // com.google.gson.internal.ObjectConstructor
        public T construct() {
            return new TreeSet();
        }
    }

    /* renamed from: com.google.gson.internal.ConstructorConstructor$5 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass5 implements ObjectConstructor<T> {
        final /* synthetic */ Type val$type;

        AnonymousClass5(Type type) {
            ConstructorConstructor.this = r1;
            this.val$type = type;
        }

        /* JADX WARN: Type inference failed for: r1v8, types: [T, java.util.EnumSet] */
        @Override // com.google.gson.internal.ObjectConstructor
        public T construct() {
            if (this.val$type instanceof ParameterizedType) {
                Type elementType = ((ParameterizedType) this.val$type).getActualTypeArguments()[0];
                if (elementType instanceof Class) {
                    return EnumSet.noneOf((Class) elementType);
                }
                throw new JsonIOException("Invalid EnumSet type: " + this.val$type.toString());
            }
            throw new JsonIOException("Invalid EnumSet type: " + this.val$type.toString());
        }
    }

    /* renamed from: com.google.gson.internal.ConstructorConstructor$6 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass6 implements ObjectConstructor<T> {
        AnonymousClass6() {
            ConstructorConstructor.this = r1;
        }

        /* JADX WARN: Type inference failed for: r0v0, types: [T, java.util.LinkedHashSet] */
        @Override // com.google.gson.internal.ObjectConstructor
        public T construct() {
            return new LinkedHashSet();
        }
    }

    /* renamed from: com.google.gson.internal.ConstructorConstructor$7 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass7 implements ObjectConstructor<T> {
        AnonymousClass7() {
            ConstructorConstructor.this = r1;
        }

        /* JADX WARN: Type inference failed for: r0v0, types: [T, java.util.LinkedList] */
        @Override // com.google.gson.internal.ObjectConstructor
        public T construct() {
            return new LinkedList();
        }
    }

    /* renamed from: com.google.gson.internal.ConstructorConstructor$8 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass8 implements ObjectConstructor<T> {
        AnonymousClass8() {
            ConstructorConstructor.this = r1;
        }

        /* JADX WARN: Type inference failed for: r0v0, types: [T, java.util.ArrayList] */
        @Override // com.google.gson.internal.ObjectConstructor
        public T construct() {
            return new ArrayList();
        }
    }

    /* renamed from: com.google.gson.internal.ConstructorConstructor$9 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass9 implements ObjectConstructor<T> {
        AnonymousClass9() {
            ConstructorConstructor.this = r1;
        }

        /* JADX WARN: Type inference failed for: r0v0, types: [java.util.TreeMap, T] */
        @Override // com.google.gson.internal.ObjectConstructor
        public T construct() {
            return new TreeMap();
        }
    }

    /* renamed from: com.google.gson.internal.ConstructorConstructor$10 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass10 implements ObjectConstructor<T> {
        AnonymousClass10() {
            ConstructorConstructor.this = r1;
        }

        /* JADX WARN: Type inference failed for: r0v0, types: [java.util.LinkedHashMap, T] */
        @Override // com.google.gson.internal.ObjectConstructor
        public T construct() {
            return new LinkedHashMap();
        }
    }

    /* renamed from: com.google.gson.internal.ConstructorConstructor$11 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass11 implements ObjectConstructor<T> {
        AnonymousClass11() {
            ConstructorConstructor.this = r1;
        }

        /* JADX WARN: Type inference failed for: r0v0, types: [T, com.google.gson.internal.LinkedTreeMap] */
        @Override // com.google.gson.internal.ObjectConstructor
        public T construct() {
            return new LinkedTreeMap();
        }
    }

    /* renamed from: com.google.gson.internal.ConstructorConstructor$12 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass12 implements ObjectConstructor<T> {
        private final UnsafeAllocator unsafeAllocator = UnsafeAllocator.create();
        final /* synthetic */ Class val$rawType;
        final /* synthetic */ Type val$type;

        AnonymousClass12(Class cls, Type type) {
            ConstructorConstructor.this = r2;
            this.val$rawType = cls;
            this.val$type = type;
        }

        /* JADX WARN: Type inference failed for: r1v0, types: [T, java.lang.Object] */
        @Override // com.google.gson.internal.ObjectConstructor
        public T construct() {
            try {
                return this.unsafeAllocator.newInstance(this.val$rawType);
            } catch (Exception e) {
                throw new RuntimeException("Unable to invoke no-args constructor for " + this.val$type + ". Register an InstanceCreator with Gson for this type may fix this problem.", e);
            }
        }
    }

    private <T> ObjectConstructor<T> newUnsafeAllocator(Type type, Class<? super T> rawType) {
        return new AnonymousClass12(rawType, type);
    }

    public String toString() {
        return this.instanceCreators.toString();
    }
}
