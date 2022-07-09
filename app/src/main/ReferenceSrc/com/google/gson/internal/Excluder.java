package com.google.gson.internal;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.google.gson.Gson;
import com.google.gson.TypeAdapter;
import com.google.gson.TypeAdapterFactory;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.Since;
import com.google.gson.annotations.Until;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes.jar:com/google/gson/internal/Excluder.class */
public final class Excluder implements TypeAdapterFactory, Cloneable {
    public static final Excluder DEFAULT = new Excluder();
    private static final double IGNORE_VERSIONS = -1.0d;
    private boolean requireExpose;
    private double version = IGNORE_VERSIONS;
    private int modifiers = 136;
    private boolean serializeInnerClasses = true;
    private List<ExclusionStrategy> serializationStrategies = Collections.emptyList();
    private List<ExclusionStrategy> deserializationStrategies = Collections.emptyList();

    private boolean isAnonymousOrLocal(Class<?> cls) {
        return !Enum.class.isAssignableFrom(cls) && (cls.isAnonymousClass() || cls.isLocalClass());
    }

    private boolean isInnerClass(Class<?> cls) {
        return cls.isMemberClass() && !isStatic(cls);
    }

    private boolean isStatic(Class<?> cls) {
        return (cls.getModifiers() & 8) != 0;
    }

    private boolean isValidSince(Since since) {
        return since == null || since.value() <= this.version;
    }

    private boolean isValidUntil(Until until) {
        return until == null || until.value() > this.version;
    }

    private boolean isValidVersion(Since since, Until until) {
        return isValidSince(since) && isValidUntil(until);
    }

    public Excluder clone() {
        try {
            return (Excluder) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new AssertionError();
        }
    }

    @Override // com.google.gson.TypeAdapterFactory
    public <T> TypeAdapter<T> create(final Gson gson, final TypeToken<T> typeToken) {
        Class<? super T> rawType = typeToken.getRawType();
        final boolean excludeClass = excludeClass(rawType, true);
        final boolean excludeClass2 = excludeClass(rawType, false);
        return (excludeClass || excludeClass2) ? new TypeAdapter<T>() { // from class: com.google.gson.internal.Excluder.1
            private TypeAdapter<T> delegate;

            private TypeAdapter<T> delegate() {
                TypeAdapter typeAdapter = this.delegate;
                if (typeAdapter == null) {
                    typeAdapter = gson.getDelegateAdapter(Excluder.this, typeToken);
                    this.delegate = typeAdapter;
                }
                return typeAdapter;
            }

            /* JADX DEBUG: Multi-variable search result rejected for r0v5, resolved type: T */
            /* JADX WARN: Multi-variable type inference failed */
            @Override // com.google.gson.TypeAdapter
            public T read(JsonReader jsonReader) throws IOException {
                Object read;
                if (excludeClass2) {
                    jsonReader.skipValue();
                    read = null;
                } else {
                    read = delegate().read(jsonReader);
                }
                return read;
            }

            @Override // com.google.gson.TypeAdapter
            public void write(JsonWriter jsonWriter, T t) throws IOException {
                if (excludeClass) {
                    jsonWriter.nullValue();
                } else {
                    delegate().write(jsonWriter, t);
                }
            }
        } : null;
    }

    public Excluder disableInnerClassSerialization() {
        Excluder clone = clone();
        clone.serializeInnerClasses = false;
        return clone;
    }

    public boolean excludeClass(Class<?> cls, boolean z) {
        boolean z2;
        if (this.version != IGNORE_VERSIONS && !isValidVersion((Since) cls.getAnnotation(Since.class), (Until) cls.getAnnotation(Until.class))) {
            z2 = true;
        } else if (!this.serializeInnerClasses && isInnerClass(cls)) {
            z2 = true;
        } else if (!isAnonymousOrLocal(cls)) {
            Iterator<ExclusionStrategy> it = (z ? this.serializationStrategies : this.deserializationStrategies).iterator();
            while (true) {
                if (!it.hasNext()) {
                    z2 = false;
                    break;
                } else if (it.next().shouldSkipClass(cls)) {
                    z2 = true;
                    break;
                }
            }
        } else {
            z2 = true;
        }
        return z2;
    }

    public boolean excludeField(Field field, boolean z) {
        boolean z2;
        Expose expose;
        if ((this.modifiers & field.getModifiers()) != 0) {
            z2 = true;
        } else if (this.version != IGNORE_VERSIONS && !isValidVersion((Since) field.getAnnotation(Since.class), (Until) field.getAnnotation(Until.class))) {
            z2 = true;
        } else if (field.isSynthetic()) {
            z2 = true;
        } else if (this.requireExpose && ((expose = (Expose) field.getAnnotation(Expose.class)) == null || (!z ? !expose.deserialize() : !expose.serialize()))) {
            z2 = true;
        } else if (!this.serializeInnerClasses && isInnerClass(field.getType())) {
            z2 = true;
        } else if (isAnonymousOrLocal(field.getType())) {
            z2 = true;
        } else {
            List<ExclusionStrategy> list = z ? this.serializationStrategies : this.deserializationStrategies;
            if (!list.isEmpty()) {
                FieldAttributes fieldAttributes = new FieldAttributes(field);
                for (ExclusionStrategy exclusionStrategy : list) {
                    if (exclusionStrategy.shouldSkipField(fieldAttributes)) {
                        z2 = true;
                        break;
                    }
                }
            }
            z2 = false;
        }
        return z2;
    }

    public Excluder excludeFieldsWithoutExposeAnnotation() {
        Excluder clone = clone();
        clone.requireExpose = true;
        return clone;
    }

    public Excluder withExclusionStrategy(ExclusionStrategy exclusionStrategy, boolean z, boolean z2) {
        Excluder clone = clone();
        if (z) {
            clone.serializationStrategies = new ArrayList(this.serializationStrategies);
            clone.serializationStrategies.add(exclusionStrategy);
        }
        if (z2) {
            clone.deserializationStrategies = new ArrayList(this.deserializationStrategies);
            clone.deserializationStrategies.add(exclusionStrategy);
        }
        return clone;
    }

    public Excluder withModifiers(int... iArr) {
        Excluder clone = clone();
        clone.modifiers = 0;
        for (int i : iArr) {
            clone.modifiers |= i;
        }
        return clone;
    }

    public Excluder withVersion(double d) {
        Excluder clone = clone();
        clone.version = d;
        return clone;
    }
}
