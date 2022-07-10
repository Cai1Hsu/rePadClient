package com.google.gson.internal.bind;

import com.google.gson.FieldNamingStrategy;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.google.gson.TypeAdapter;
import com.google.gson.TypeAdapterFactory;
import com.google.gson.annotations.SerializedName;
import com.google.gson.internal.C$Gson$Types;
import com.google.gson.internal.ConstructorConstructor;
import com.google.gson.internal.Excluder;
import com.google.gson.internal.ObjectConstructor;
import com.google.gson.internal.Primitives;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Type;
import java.util.LinkedHashMap;
import java.util.Map;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class ReflectiveTypeAdapterFactory implements TypeAdapterFactory {
    private final ConstructorConstructor constructorConstructor;
    private final Excluder excluder;
    private final FieldNamingStrategy fieldNamingPolicy;

    public ReflectiveTypeAdapterFactory(ConstructorConstructor constructorConstructor, FieldNamingStrategy fieldNamingPolicy, Excluder excluder) {
        this.constructorConstructor = constructorConstructor;
        this.fieldNamingPolicy = fieldNamingPolicy;
        this.excluder = excluder;
    }

    public boolean excludeField(Field f, boolean serialize) {
        return !this.excluder.excludeClass(f.getType(), serialize) && !this.excluder.excludeField(f, serialize);
    }

    private String getFieldName(Field f) {
        SerializedName serializedName = (SerializedName) f.getAnnotation(SerializedName.class);
        return serializedName == null ? this.fieldNamingPolicy.translateName(f) : serializedName.value();
    }

    @Override // com.google.gson.TypeAdapterFactory
    public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> type) {
        Class<? super T> raw = type.getRawType();
        if (!Object.class.isAssignableFrom(raw)) {
            return null;
        }
        ObjectConstructor<T> constructor = this.constructorConstructor.get(type);
        return new Adapter(constructor, getBoundFields(gson, type, raw), null);
    }

    private BoundField createBoundField(Gson context, Field field, String name, TypeToken<?> fieldType, boolean serialize, boolean deserialize) {
        boolean isPrimitive = Primitives.isPrimitive(fieldType.getRawType());
        return new AnonymousClass1(name, serialize, deserialize, context, fieldType, field, isPrimitive);
    }

    /* renamed from: com.google.gson.internal.bind.ReflectiveTypeAdapterFactory$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 extends BoundField {
        final TypeAdapter<?> typeAdapter;
        final /* synthetic */ Gson val$context;
        final /* synthetic */ Field val$field;
        final /* synthetic */ TypeToken val$fieldType;
        final /* synthetic */ boolean val$isPrimitive;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass1(String x0, boolean x1, boolean x2, Gson gson, TypeToken typeToken, Field field, boolean z) {
            super(x0, x1, x2);
            ReflectiveTypeAdapterFactory.this = r3;
            this.val$context = gson;
            this.val$fieldType = typeToken;
            this.val$field = field;
            this.val$isPrimitive = z;
            this.typeAdapter = this.val$context.getAdapter(this.val$fieldType);
        }

        @Override // com.google.gson.internal.bind.ReflectiveTypeAdapterFactory.BoundField
        void write(JsonWriter writer, Object value) throws IOException, IllegalAccessException {
            Object fieldValue = this.val$field.get(value);
            TypeAdapter t = new TypeAdapterRuntimeTypeWrapper(this.val$context, this.typeAdapter, this.val$fieldType.getType());
            t.write(writer, fieldValue);
        }

        @Override // com.google.gson.internal.bind.ReflectiveTypeAdapterFactory.BoundField
        void read(JsonReader reader, Object value) throws IOException, IllegalAccessException {
            Object fieldValue = this.typeAdapter.read(reader);
            if (fieldValue != null || !this.val$isPrimitive) {
                this.val$field.set(value, fieldValue);
            }
        }
    }

    private Map<String, BoundField> getBoundFields(Gson context, TypeToken<?> type, Class<?> raw) {
        Map<String, BoundField> result = new LinkedHashMap<>();
        if (!raw.isInterface()) {
            Type declaredType = type.getType();
            while (raw != Object.class) {
                Field[] fields = raw.getDeclaredFields();
                for (Field field : fields) {
                    boolean serialize = excludeField(field, true);
                    boolean deserialize = excludeField(field, false);
                    if (serialize || deserialize) {
                        field.setAccessible(true);
                        Type fieldType = C$Gson$Types.resolve(type.getType(), raw, field.getGenericType());
                        BoundField boundField = createBoundField(context, field, getFieldName(field), TypeToken.get(fieldType), serialize, deserialize);
                        BoundField previous = result.put(boundField.name, boundField);
                        if (previous != null) {
                            throw new IllegalArgumentException(declaredType + " declares multiple JSON fields named " + previous.name);
                        }
                    }
                }
                type = TypeToken.get(C$Gson$Types.resolve(type.getType(), raw, raw.getGenericSuperclass()));
                raw = type.getRawType();
            }
        }
        return result;
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static abstract class BoundField {
        final boolean deserialized;
        final String name;
        final boolean serialized;

        abstract void read(JsonReader jsonReader, Object obj) throws IOException, IllegalAccessException;

        abstract void write(JsonWriter jsonWriter, Object obj) throws IOException, IllegalAccessException;

        protected BoundField(String name, boolean serialized, boolean deserialized) {
            this.name = name;
            this.serialized = serialized;
            this.deserialized = deserialized;
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    public static final class Adapter<T> extends TypeAdapter<T> {
        private final Map<String, BoundField> boundFields;
        private final ObjectConstructor<T> constructor;

        /* synthetic */ Adapter(ObjectConstructor x0, Map x1, AnonymousClass1 x2) {
            this(x0, x1);
        }

        private Adapter(ObjectConstructor<T> constructor, Map<String, BoundField> boundFields) {
            this.constructor = constructor;
            this.boundFields = boundFields;
        }

        @Override // com.google.gson.TypeAdapter
        public T read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            T instance = this.constructor.construct();
            try {
                in.beginObject();
                while (in.hasNext()) {
                    String name = in.nextName();
                    BoundField field = this.boundFields.get(name);
                    if (field == null || !field.deserialized) {
                        in.skipValue();
                    } else {
                        field.read(in, instance);
                    }
                }
                in.endObject();
                return instance;
            } catch (IllegalAccessException e) {
                throw new AssertionError(e);
            } catch (IllegalStateException e2) {
                throw new JsonSyntaxException(e2);
            }
        }

        @Override // com.google.gson.TypeAdapter
        public void write(JsonWriter out, T value) throws IOException {
            if (value == null) {
                out.nullValue();
                return;
            }
            out.beginObject();
            try {
                for (BoundField boundField : this.boundFields.values()) {
                    if (boundField.serialized) {
                        out.name(boundField.name);
                        boundField.write(out, value);
                    }
                }
                out.endObject();
            } catch (IllegalAccessException e) {
                throw new AssertionError();
            }
        }
    }
}
