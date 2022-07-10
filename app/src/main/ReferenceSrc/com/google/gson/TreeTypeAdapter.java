package com.google.gson;

import com.google.gson.internal.C$Gson$Preconditions;
import com.google.gson.internal.Streams;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class TreeTypeAdapter<T> extends TypeAdapter<T> {
    private TypeAdapter<T> delegate;
    private final JsonDeserializer<T> deserializer;
    private final Gson gson;
    private final JsonSerializer<T> serializer;
    private final TypeAdapterFactory skipPast;
    private final TypeToken<T> typeToken;

    /* synthetic */ TreeTypeAdapter(JsonSerializer x0, JsonDeserializer x1, Gson x2, TypeToken x3, TypeAdapterFactory x4, AnonymousClass1 x5) {
        this(x0, x1, x2, x3, x4);
    }

    private TreeTypeAdapter(JsonSerializer<T> serializer, JsonDeserializer<T> deserializer, Gson gson, TypeToken<T> typeToken, TypeAdapterFactory skipPast) {
        this.serializer = serializer;
        this.deserializer = deserializer;
        this.gson = gson;
        this.typeToken = typeToken;
        this.skipPast = skipPast;
    }

    @Override // com.google.gson.TypeAdapter
    public T read(JsonReader in) throws IOException {
        if (this.deserializer == null) {
            return delegate().read(in);
        }
        JsonElement value = Streams.parse(in);
        if (value.isJsonNull()) {
            return null;
        }
        return this.deserializer.deserialize(value, this.typeToken.getType(), this.gson.deserializationContext);
    }

    @Override // com.google.gson.TypeAdapter
    public void write(JsonWriter out, T value) throws IOException {
        if (this.serializer == null) {
            delegate().write(out, value);
        } else if (value == null) {
            out.nullValue();
        } else {
            JsonElement tree = this.serializer.serialize(value, this.typeToken.getType(), this.gson.serializationContext);
            Streams.write(tree, out);
        }
    }

    private TypeAdapter<T> delegate() {
        TypeAdapter<T> d = this.delegate;
        if (d != null) {
            return d;
        }
        TypeAdapter<T> d2 = this.gson.getDelegateAdapter(this.skipPast, this.typeToken);
        this.delegate = d2;
        return d2;
    }

    public static TypeAdapterFactory newFactory(TypeToken<?> exactType, Object typeAdapter) {
        return new SingleTypeFactory(typeAdapter, exactType, false, null, null);
    }

    public static TypeAdapterFactory newFactoryWithMatchRawType(TypeToken<?> exactType, Object typeAdapter) {
        boolean matchRawType = exactType.getType() == exactType.getRawType();
        return new SingleTypeFactory(typeAdapter, exactType, matchRawType, null, null);
    }

    public static TypeAdapterFactory newTypeHierarchyFactory(Class<?> hierarchyType, Object typeAdapter) {
        return new SingleTypeFactory(typeAdapter, null, false, hierarchyType, null);
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private static class SingleTypeFactory implements TypeAdapterFactory {
        private final JsonDeserializer<?> deserializer;
        private final TypeToken<?> exactType;
        private final Class<?> hierarchyType;
        private final boolean matchRawType;
        private final JsonSerializer<?> serializer;

        /* synthetic */ SingleTypeFactory(Object x0, TypeToken x1, boolean x2, Class x3, AnonymousClass1 x4) {
            this(x0, x1, x2, x3);
        }

        private SingleTypeFactory(Object typeAdapter, TypeToken<?> exactType, boolean matchRawType, Class<?> hierarchyType) {
            this.serializer = typeAdapter instanceof JsonSerializer ? (JsonSerializer) typeAdapter : null;
            this.deserializer = typeAdapter instanceof JsonDeserializer ? (JsonDeserializer) typeAdapter : null;
            C$Gson$Preconditions.checkArgument((this.serializer == null && this.deserializer == null) ? false : true);
            this.exactType = exactType;
            this.matchRawType = matchRawType;
            this.hierarchyType = hierarchyType;
        }

        @Override // com.google.gson.TypeAdapterFactory
        public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> type) {
            boolean matches;
            if (this.exactType != null) {
                matches = this.exactType.equals(type) || (this.matchRawType && this.exactType.getType() == type.getRawType());
            } else {
                matches = this.hierarchyType.isAssignableFrom(type.getRawType());
            }
            if (matches) {
                return new TreeTypeAdapter(this.serializer, this.deserializer, gson, type, this, null);
            }
            return null;
        }
    }
}
