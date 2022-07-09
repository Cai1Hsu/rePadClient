package com.google.gson.reflect;

import com.google.gson.internal.C$Gson$Preconditions;
import com.google.gson.internal.C$Gson$Types;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.jar:com/google/gson/reflect/TypeToken.class */
public class TypeToken<T> {
    final int hashCode;
    final Class<? super T> rawType;
    final Type type;

    protected TypeToken() {
        this.type = getSuperclassTypeParameter(getClass());
        this.rawType = (Class<? super T>) C$Gson$Types.getRawType(this.type);
        this.hashCode = this.type.hashCode();
    }

    TypeToken(Type type) {
        this.type = C$Gson$Types.canonicalize((Type) C$Gson$Preconditions.checkNotNull(type));
        this.rawType = (Class<? super T>) C$Gson$Types.getRawType(this.type);
        this.hashCode = this.type.hashCode();
    }

    private static AssertionError buildUnexpectedTypeError(Type type, Class<?>... clsArr) {
        StringBuilder sb = new StringBuilder("Unexpected type. Expected one of: ");
        for (Class<?> cls : clsArr) {
            sb.append(cls.getName()).append(", ");
        }
        sb.append("but got: ").append(type.getClass().getName()).append(", for type token: ").append(type.toString()).append('.');
        return new AssertionError(sb.toString());
    }

    public static <T> TypeToken<T> get(Class<T> cls) {
        return new TypeToken<>(cls);
    }

    public static TypeToken<?> get(Type type) {
        return new TypeToken<>(type);
    }

    static Type getSuperclassTypeParameter(Class<?> cls) {
        Type genericSuperclass = cls.getGenericSuperclass();
        if (genericSuperclass instanceof Class) {
            throw new RuntimeException("Missing type parameter.");
        }
        return C$Gson$Types.canonicalize(((ParameterizedType) genericSuperclass).getActualTypeArguments()[0]);
    }

    private static boolean isAssignableFrom(Type type, GenericArrayType genericArrayType) {
        boolean z;
        Class<?> cls;
        Type genericComponentType = genericArrayType.getGenericComponentType();
        if (genericComponentType instanceof ParameterizedType) {
            Class<?> cls2 = type;
            if (type instanceof GenericArrayType) {
                cls2 = ((GenericArrayType) type).getGenericComponentType();
            } else if (type instanceof Class) {
                Class<?> cls3 = (Class) type;
                while (true) {
                    cls = cls3;
                    if (!cls.isArray()) {
                        break;
                    }
                    cls3 = cls.getComponentType();
                }
                cls2 = cls;
            }
            z = isAssignableFrom(cls2, (ParameterizedType) genericComponentType, new HashMap());
        } else {
            z = true;
        }
        return z;
    }

    private static boolean isAssignableFrom(Type type, ParameterizedType parameterizedType, Map<String, Type> map) {
        boolean isAssignableFrom;
        if (type == null) {
            isAssignableFrom = false;
        } else if (!parameterizedType.equals(type)) {
            Class<?> rawType = C$Gson$Types.getRawType(type);
            ParameterizedType parameterizedType2 = null;
            if (type instanceof ParameterizedType) {
                parameterizedType2 = (ParameterizedType) type;
            }
            if (parameterizedType2 != null) {
                Type[] actualTypeArguments = parameterizedType2.getActualTypeArguments();
                TypeVariable<Class<?>>[] typeParameters = rawType.getTypeParameters();
                for (int i = 0; i < actualTypeArguments.length; i++) {
                    Type type2 = actualTypeArguments[i];
                    TypeVariable<Class<?>> typeVariable = typeParameters[i];
                    while (type2 instanceof TypeVariable) {
                        type2 = map.get(((TypeVariable) type2).getName());
                    }
                    map.put(typeVariable.getName(), type2);
                }
                if (typeEquals(parameterizedType2, parameterizedType, map)) {
                    isAssignableFrom = true;
                }
            }
            Type[] genericInterfaces = rawType.getGenericInterfaces();
            int length = genericInterfaces.length;
            int i2 = 0;
            while (true) {
                if (i2 >= length) {
                    isAssignableFrom = isAssignableFrom(rawType.getGenericSuperclass(), parameterizedType, new HashMap(map));
                    break;
                } else if (isAssignableFrom(genericInterfaces[i2], parameterizedType, new HashMap(map))) {
                    isAssignableFrom = true;
                    break;
                } else {
                    i2++;
                }
            }
        } else {
            isAssignableFrom = true;
        }
        return isAssignableFrom;
    }

    private static boolean matches(Type type, Type type2, Map<String, Type> map) {
        return type2.equals(type) || ((type instanceof TypeVariable) && type2.equals(map.get(((TypeVariable) type).getName())));
    }

    private static boolean typeEquals(ParameterizedType parameterizedType, ParameterizedType parameterizedType2, Map<String, Type> map) {
        boolean z = false;
        if (parameterizedType.getRawType().equals(parameterizedType2.getRawType())) {
            Type[] actualTypeArguments = parameterizedType.getActualTypeArguments();
            Type[] actualTypeArguments2 = parameterizedType2.getActualTypeArguments();
            int i = 0;
            while (true) {
                if (i >= actualTypeArguments.length) {
                    z = true;
                    break;
                } else if (!matches(actualTypeArguments[i], actualTypeArguments2[i], map)) {
                    z = false;
                    break;
                } else {
                    i++;
                }
            }
        }
        return z;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof TypeToken) && C$Gson$Types.equals(this.type, ((TypeToken) obj).type);
    }

    public final Class<? super T> getRawType() {
        return this.rawType;
    }

    public final Type getType() {
        return this.type;
    }

    public final int hashCode() {
        return this.hashCode;
    }

    @Deprecated
    public boolean isAssignableFrom(TypeToken<?> typeToken) {
        return isAssignableFrom(typeToken.getType());
    }

    @Deprecated
    public boolean isAssignableFrom(Class<?> cls) {
        return isAssignableFrom((Type) cls);
    }

    @Deprecated
    public boolean isAssignableFrom(Type type) {
        boolean z = false;
        if (type != null) {
            if (this.type.equals(type)) {
                z = true;
            } else if (this.type instanceof Class) {
                z = this.rawType.isAssignableFrom(C$Gson$Types.getRawType(type));
            } else if (this.type instanceof ParameterizedType) {
                z = isAssignableFrom(type, (ParameterizedType) this.type, new HashMap());
            } else if (!(this.type instanceof GenericArrayType)) {
                throw buildUnexpectedTypeError(this.type, Class.class, ParameterizedType.class, GenericArrayType.class);
            } else {
                z = this.rawType.isAssignableFrom(C$Gson$Types.getRawType(type)) && isAssignableFrom(type, (GenericArrayType) this.type);
            }
        }
        return z;
    }

    public final String toString() {
        return C$Gson$Types.typeToString(this.type);
    }
}
