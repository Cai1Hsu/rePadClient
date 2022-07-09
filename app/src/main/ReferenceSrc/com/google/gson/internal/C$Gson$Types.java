package com.google.gson.internal;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.Arrays;
import java.util.Collection;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Properties;

/* renamed from: com.google.gson.internal.$Gson$Types */
/* loaded from: classes.jar:com/google/gson/internal/$Gson$Types.class */
public final class C$Gson$Types {
    static final Type[] EMPTY_TYPE_ARRAY = new Type[0];

    /* renamed from: com.google.gson.internal.$Gson$Types$GenericArrayTypeImpl */
    /* loaded from: classes.jar:com/google/gson/internal/$Gson$Types$GenericArrayTypeImpl.class */
    private static final class GenericArrayTypeImpl implements GenericArrayType, Serializable {
        private static final long serialVersionUID = 0;
        private final Type componentType;

        public GenericArrayTypeImpl(Type type) {
            this.componentType = C$Gson$Types.canonicalize(type);
        }

        public boolean equals(Object obj) {
            return (obj instanceof GenericArrayType) && C$Gson$Types.equals(this, (GenericArrayType) obj);
        }

        @Override // java.lang.reflect.GenericArrayType
        public Type getGenericComponentType() {
            return this.componentType;
        }

        public int hashCode() {
            return this.componentType.hashCode();
        }

        public String toString() {
            return C$Gson$Types.typeToString(this.componentType) + "[]";
        }
    }

    /* renamed from: com.google.gson.internal.$Gson$Types$ParameterizedTypeImpl */
    /* loaded from: classes.jar:com/google/gson/internal/$Gson$Types$ParameterizedTypeImpl.class */
    private static final class ParameterizedTypeImpl implements ParameterizedType, Serializable {
        private static final long serialVersionUID = 0;
        private final Type ownerType;
        private final Type rawType;
        private final Type[] typeArguments;

        /* JADX WARN: Code restructure failed: missing block: B:12:0x0035, code lost:
            if (r0.getEnclosingClass() != null) goto L13;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public ParameterizedTypeImpl(Type type, Type type2, Type... typeArr) {
            if (type2 instanceof Class) {
                Class cls = (Class) type2;
                C$Gson$Preconditions.checkArgument(type != null || cls.getEnclosingClass() == null);
                boolean z = type != null ? false : z;
                z = true;
                C$Gson$Preconditions.checkArgument(z);
            }
            this.ownerType = type == null ? null : C$Gson$Types.canonicalize(type);
            this.rawType = C$Gson$Types.canonicalize(type2);
            this.typeArguments = (Type[]) typeArr.clone();
            for (int i = 0; i < this.typeArguments.length; i++) {
                C$Gson$Preconditions.checkNotNull(this.typeArguments[i]);
                C$Gson$Types.checkNotPrimitive(this.typeArguments[i]);
                this.typeArguments[i] = C$Gson$Types.canonicalize(this.typeArguments[i]);
            }
        }

        public boolean equals(Object obj) {
            return (obj instanceof ParameterizedType) && C$Gson$Types.equals(this, (ParameterizedType) obj);
        }

        @Override // java.lang.reflect.ParameterizedType
        public Type[] getActualTypeArguments() {
            return (Type[]) this.typeArguments.clone();
        }

        @Override // java.lang.reflect.ParameterizedType
        public Type getOwnerType() {
            return this.ownerType;
        }

        @Override // java.lang.reflect.ParameterizedType
        public Type getRawType() {
            return this.rawType;
        }

        public int hashCode() {
            return (Arrays.hashCode(this.typeArguments) ^ this.rawType.hashCode()) ^ C$Gson$Types.hashCodeOrZero(this.ownerType);
        }

        public String toString() {
            String sb;
            StringBuilder sb2 = new StringBuilder((this.typeArguments.length + 1) * 30);
            sb2.append(C$Gson$Types.typeToString(this.rawType));
            if (this.typeArguments.length == 0) {
                sb = sb2.toString();
            } else {
                sb2.append("<").append(C$Gson$Types.typeToString(this.typeArguments[0]));
                for (int i = 1; i < this.typeArguments.length; i++) {
                    sb2.append(", ").append(C$Gson$Types.typeToString(this.typeArguments[i]));
                }
                sb = sb2.append(">").toString();
            }
            return sb;
        }
    }

    /* renamed from: com.google.gson.internal.$Gson$Types$WildcardTypeImpl */
    /* loaded from: classes.jar:com/google/gson/internal/$Gson$Types$WildcardTypeImpl.class */
    private static final class WildcardTypeImpl implements WildcardType, Serializable {
        private static final long serialVersionUID = 0;
        private final Type lowerBound;
        private final Type upperBound;

        public WildcardTypeImpl(Type[] typeArr, Type[] typeArr2) {
            C$Gson$Preconditions.checkArgument(typeArr2.length <= 1);
            C$Gson$Preconditions.checkArgument(typeArr.length == 1);
            if (typeArr2.length != 1) {
                C$Gson$Preconditions.checkNotNull(typeArr[0]);
                C$Gson$Types.checkNotPrimitive(typeArr[0]);
                this.lowerBound = null;
                this.upperBound = C$Gson$Types.canonicalize(typeArr[0]);
                return;
            }
            C$Gson$Preconditions.checkNotNull(typeArr2[0]);
            C$Gson$Types.checkNotPrimitive(typeArr2[0]);
            C$Gson$Preconditions.checkArgument(typeArr[0] == Object.class);
            this.lowerBound = C$Gson$Types.canonicalize(typeArr2[0]);
            this.upperBound = Object.class;
        }

        public boolean equals(Object obj) {
            return (obj instanceof WildcardType) && C$Gson$Types.equals(this, (WildcardType) obj);
        }

        @Override // java.lang.reflect.WildcardType
        public Type[] getLowerBounds() {
            return this.lowerBound != null ? new Type[]{this.lowerBound} : C$Gson$Types.EMPTY_TYPE_ARRAY;
        }

        @Override // java.lang.reflect.WildcardType
        public Type[] getUpperBounds() {
            return new Type[]{this.upperBound};
        }

        public int hashCode() {
            return (this.lowerBound != null ? this.lowerBound.hashCode() + 31 : 1) ^ (this.upperBound.hashCode() + 31);
        }

        public String toString() {
            return this.lowerBound != null ? "? super " + C$Gson$Types.typeToString(this.lowerBound) : this.upperBound == Object.class ? "?" : "? extends " + C$Gson$Types.typeToString(this.upperBound);
        }
    }

    private C$Gson$Types() {
    }

    public static GenericArrayType arrayOf(Type type) {
        return new GenericArrayTypeImpl(type);
    }

    public static Type canonicalize(Type type) {
        if (type instanceof Class) {
            Class cls = (Class) type;
            type = cls;
            if (cls.isArray()) {
                type = new GenericArrayTypeImpl(canonicalize(cls.getComponentType()));
            }
        } else if (type instanceof ParameterizedType) {
            ParameterizedType parameterizedType = (ParameterizedType) type;
            type = new ParameterizedTypeImpl(parameterizedType.getOwnerType(), parameterizedType.getRawType(), parameterizedType.getActualTypeArguments());
        } else if (type instanceof GenericArrayType) {
            type = new GenericArrayTypeImpl(((GenericArrayType) type).getGenericComponentType());
        } else if (type instanceof WildcardType) {
            WildcardType wildcardType = (WildcardType) type;
            type = new WildcardTypeImpl(wildcardType.getUpperBounds(), wildcardType.getLowerBounds());
        }
        return type;
    }

    public static void checkNotPrimitive(Type type) {
        C$Gson$Preconditions.checkArgument(!(type instanceof Class) || !((Class) type).isPrimitive());
    }

    private static Class<?> declaringClassOf(TypeVariable<?> typeVariable) {
        Object genericDeclaration = typeVariable.getGenericDeclaration();
        return genericDeclaration instanceof Class ? (Class) genericDeclaration : null;
    }

    static boolean equal(Object obj, Object obj2) {
        return obj == obj2 || (obj != null && obj.equals(obj2));
    }

    public static boolean equals(Type type, Type type2) {
        boolean z;
        if (type == type2) {
            z = true;
        } else if (type instanceof Class) {
            z = type.equals(type2);
        } else if (type instanceof ParameterizedType) {
            z = false;
            if (type2 instanceof ParameterizedType) {
                ParameterizedType parameterizedType = (ParameterizedType) type;
                ParameterizedType parameterizedType2 = (ParameterizedType) type2;
                z = equal(parameterizedType.getOwnerType(), parameterizedType2.getOwnerType()) && parameterizedType.getRawType().equals(parameterizedType2.getRawType()) && Arrays.equals(parameterizedType.getActualTypeArguments(), parameterizedType2.getActualTypeArguments());
            }
        } else if (type instanceof GenericArrayType) {
            z = false;
            if (type2 instanceof GenericArrayType) {
                z = equals(((GenericArrayType) type).getGenericComponentType(), ((GenericArrayType) type2).getGenericComponentType());
            }
        } else if (type instanceof WildcardType) {
            z = false;
            if (type2 instanceof WildcardType) {
                WildcardType wildcardType = (WildcardType) type;
                WildcardType wildcardType2 = (WildcardType) type2;
                z = Arrays.equals(wildcardType.getUpperBounds(), wildcardType2.getUpperBounds()) && Arrays.equals(wildcardType.getLowerBounds(), wildcardType2.getLowerBounds());
            }
        } else {
            z = false;
            if (type instanceof TypeVariable) {
                z = false;
                if (type2 instanceof TypeVariable) {
                    TypeVariable typeVariable = (TypeVariable) type;
                    TypeVariable typeVariable2 = (TypeVariable) type2;
                    z = typeVariable.getGenericDeclaration() == typeVariable2.getGenericDeclaration() && typeVariable.getName().equals(typeVariable2.getName());
                }
            }
        }
        return z;
    }

    public static Type getArrayComponentType(Type type) {
        return type instanceof GenericArrayType ? ((GenericArrayType) type).getGenericComponentType() : ((Class) type).getComponentType();
    }

    public static Type getCollectionElementType(Type type, Class<?> cls) {
        Type supertype = getSupertype(type, cls, Collection.class);
        Type type2 = supertype;
        if (supertype instanceof WildcardType) {
            type2 = ((WildcardType) supertype).getUpperBounds()[0];
        }
        return type2 instanceof ParameterizedType ? ((ParameterizedType) type2).getActualTypeArguments()[0] : Object.class;
    }

    static Type getGenericSupertype(Type type, Class<?> cls, Class<?> cls2) {
        if (cls2 != cls) {
            if (cls2.isInterface()) {
                Class<?>[] interfaces = cls.getInterfaces();
                int length = interfaces.length;
                for (int i = 0; i < length; i++) {
                    if (interfaces[i] == cls2) {
                        type = cls.getGenericInterfaces()[i];
                        break;
                    } else if (cls2.isAssignableFrom(interfaces[i])) {
                        type = getGenericSupertype(cls.getGenericInterfaces()[i], interfaces[i], cls2);
                        break;
                    }
                }
            }
            if (!cls.isInterface()) {
                while (cls != Object.class) {
                    Class<? super Object> superclass = cls.getSuperclass();
                    if (superclass == cls2) {
                        type = cls.getGenericSuperclass();
                        break;
                    } else if (cls2.isAssignableFrom(superclass)) {
                        type = getGenericSupertype(cls.getGenericSuperclass(), superclass, cls2);
                        break;
                    } else {
                        cls = superclass;
                    }
                }
            }
            type = cls2;
        }
        return type;
    }

    public static Type[] getMapKeyAndValueTypes(Type type, Class<?> cls) {
        Type[] actualTypeArguments;
        if (type == Properties.class) {
            actualTypeArguments = new Type[]{String.class, String.class};
        } else {
            Type supertype = getSupertype(type, cls, Map.class);
            actualTypeArguments = supertype instanceof ParameterizedType ? ((ParameterizedType) supertype).getActualTypeArguments() : new Type[]{Object.class, Object.class};
        }
        return actualTypeArguments;
    }

    public static Class<?> getRawType(Type type) {
        Class<?> rawType;
        if (type instanceof Class) {
            rawType = (Class) type;
        } else if (type instanceof ParameterizedType) {
            Type rawType2 = ((ParameterizedType) type).getRawType();
            C$Gson$Preconditions.checkArgument(rawType2 instanceof Class);
            rawType = (Class) rawType2;
        } else if (type instanceof GenericArrayType) {
            rawType = Array.newInstance(getRawType(((GenericArrayType) type).getGenericComponentType()), 0).getClass();
        } else if (type instanceof TypeVariable) {
            rawType = Object.class;
        } else if (!(type instanceof WildcardType)) {
            throw new IllegalArgumentException("Expected a Class, ParameterizedType, or GenericArrayType, but <" + type + "> is of type " + (type == null ? "null" : type.getClass().getName()));
        } else {
            rawType = getRawType(((WildcardType) type).getUpperBounds()[0]);
        }
        return rawType;
    }

    static Type getSupertype(Type type, Class<?> cls, Class<?> cls2) {
        C$Gson$Preconditions.checkArgument(cls2.isAssignableFrom(cls));
        return resolve(type, cls, getGenericSupertype(type, cls, cls2));
    }

    public static int hashCodeOrZero(Object obj) {
        return obj != null ? obj.hashCode() : 0;
    }

    private static int indexOf(Object[] objArr, Object obj) {
        for (int i = 0; i < objArr.length; i++) {
            if (obj.equals(objArr[i])) {
                return i;
            }
        }
        throw new NoSuchElementException();
    }

    public static ParameterizedType newParameterizedTypeWithOwner(Type type, Type type2, Type... typeArr) {
        return new ParameterizedTypeImpl(type, type2, typeArr);
    }

    /* JADX WARN: Code restructure failed: missing block: B:0:?, code lost:
        r7 = r7;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Type resolve(Type type, Class<?> cls, Type type2) {
        Type type3;
        GenericArrayType genericArrayType;
        while (true) {
            if (type3 instanceof TypeVariable) {
                TypeVariable typeVariable = (TypeVariable) type3;
                Type resolveTypeVariable = resolveTypeVariable(type, cls, typeVariable);
                type3 = resolveTypeVariable;
                if (resolveTypeVariable == typeVariable) {
                    genericArrayType = resolveTypeVariable;
                    break;
                }
            } else if ((type3 instanceof Class) && ((Class) type3).isArray()) {
                Class cls2 = (Class) type3;
                Class<?> componentType = cls2.getComponentType();
                Type resolve = resolve(type, cls, componentType);
                genericArrayType = componentType == resolve ? cls2 : arrayOf(resolve);
            } else if (type3 instanceof GenericArrayType) {
                GenericArrayType genericArrayType2 = (GenericArrayType) type3;
                Type genericComponentType = genericArrayType2.getGenericComponentType();
                Type resolve2 = resolve(type, cls, genericComponentType);
                genericArrayType = genericArrayType2;
                if (genericComponentType != resolve2) {
                    genericArrayType = arrayOf(resolve2);
                }
            } else if (type3 instanceof ParameterizedType) {
                ParameterizedType parameterizedType = (ParameterizedType) type3;
                Type ownerType = parameterizedType.getOwnerType();
                Type resolve3 = resolve(type, cls, ownerType);
                boolean z = resolve3 != ownerType;
                Type[] actualTypeArguments = parameterizedType.getActualTypeArguments();
                int i = 0;
                int length = actualTypeArguments.length;
                while (i < length) {
                    Type resolve4 = resolve(type, cls, actualTypeArguments[i]);
                    Type[] typeArr = actualTypeArguments;
                    boolean z2 = z;
                    if (resolve4 != actualTypeArguments[i]) {
                        typeArr = actualTypeArguments;
                        z2 = z;
                        if (!z) {
                            typeArr = (Type[]) actualTypeArguments.clone();
                            z2 = true;
                        }
                        typeArr[i] = resolve4;
                    }
                    i++;
                    actualTypeArguments = typeArr;
                    z = z2;
                }
                genericArrayType = parameterizedType;
                if (z) {
                    genericArrayType = newParameterizedTypeWithOwner(resolve3, parameterizedType.getRawType(), actualTypeArguments);
                }
            } else {
                boolean z3 = type3 instanceof WildcardType;
                genericArrayType = type3;
                if (z3) {
                    WildcardType wildcardType = (WildcardType) type3;
                    Type[] lowerBounds = wildcardType.getLowerBounds();
                    Type[] upperBounds = wildcardType.getUpperBounds();
                    if (lowerBounds.length == 1) {
                        Type resolve5 = resolve(type, cls, lowerBounds[0]);
                        genericArrayType = wildcardType;
                        if (resolve5 != lowerBounds[0]) {
                            genericArrayType = supertypeOf(resolve5);
                        }
                    } else {
                        genericArrayType = wildcardType;
                        if (upperBounds.length == 1) {
                            Type resolve6 = resolve(type, cls, upperBounds[0]);
                            genericArrayType = wildcardType;
                            if (resolve6 != upperBounds[0]) {
                                genericArrayType = subtypeOf(resolve6);
                            }
                        }
                    }
                }
            }
        }
        return genericArrayType;
    }

    static Type resolveTypeVariable(Type type, Class<?> cls, TypeVariable<?> typeVariable) {
        TypeVariable<?> typeVariable2;
        Class<?> declaringClassOf = declaringClassOf(typeVariable);
        if (declaringClassOf == null) {
            typeVariable2 = typeVariable;
        } else {
            Type genericSupertype = getGenericSupertype(type, cls, declaringClassOf);
            typeVariable2 = typeVariable;
            if (genericSupertype instanceof ParameterizedType) {
                typeVariable2 = ((ParameterizedType) genericSupertype).getActualTypeArguments()[indexOf(declaringClassOf.getTypeParameters(), typeVariable)];
            }
        }
        return typeVariable2;
    }

    public static WildcardType subtypeOf(Type type) {
        return new WildcardTypeImpl(new Type[]{type}, EMPTY_TYPE_ARRAY);
    }

    public static WildcardType supertypeOf(Type type) {
        return new WildcardTypeImpl(new Type[]{Object.class}, new Type[]{type});
    }

    public static String typeToString(Type type) {
        return type instanceof Class ? ((Class) type).getName() : type.toString();
    }
}
