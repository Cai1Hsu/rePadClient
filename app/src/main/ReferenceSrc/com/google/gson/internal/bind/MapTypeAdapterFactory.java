package com.google.gson.internal.bind;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSyntaxException;
import com.google.gson.TypeAdapter;
import com.google.gson.TypeAdapterFactory;
import com.google.gson.internal.C$Gson$Types;
import com.google.gson.internal.ConstructorConstructor;
import com.google.gson.internal.JsonReaderInternalAccess;
import com.google.gson.internal.ObjectConstructor;
import com.google.gson.internal.Streams;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Map;

/* loaded from: classes.jar:com/google/gson/internal/bind/MapTypeAdapterFactory.class */
public final class MapTypeAdapterFactory implements TypeAdapterFactory {
    private final boolean complexMapKeySerialization;
    private final ConstructorConstructor constructorConstructor;

    /* loaded from: classes.jar:com/google/gson/internal/bind/MapTypeAdapterFactory$Adapter.class */
    private final class Adapter<K, V> extends TypeAdapter<Map<K, V>> {
        private final ObjectConstructor<? extends Map<K, V>> constructor;
        private final TypeAdapter<K> keyTypeAdapter;
        private final TypeAdapter<V> valueTypeAdapter;

        public Adapter(Gson gson, Type type, TypeAdapter<K> typeAdapter, Type type2, TypeAdapter<V> typeAdapter2, ObjectConstructor<? extends Map<K, V>> objectConstructor) {
            MapTypeAdapterFactory.this = r8;
            this.keyTypeAdapter = new TypeAdapterRuntimeTypeWrapper(gson, typeAdapter, type);
            this.valueTypeAdapter = new TypeAdapterRuntimeTypeWrapper(gson, typeAdapter2, type2);
            this.constructor = objectConstructor;
        }

        private String keyToString(JsonElement jsonElement) {
            String str;
            if (jsonElement.isJsonPrimitive()) {
                JsonPrimitive asJsonPrimitive = jsonElement.getAsJsonPrimitive();
                if (asJsonPrimitive.isNumber()) {
                    str = String.valueOf(asJsonPrimitive.getAsNumber());
                } else if (asJsonPrimitive.isBoolean()) {
                    str = Boolean.toString(asJsonPrimitive.getAsBoolean());
                } else if (!asJsonPrimitive.isString()) {
                    throw new AssertionError();
                } else {
                    str = asJsonPrimitive.getAsString();
                }
            } else if (!jsonElement.isJsonNull()) {
                throw new AssertionError();
            } else {
                str = "null";
            }
            return str;
        }

        @Override // com.google.gson.TypeAdapter
        public Map<K, V> read(JsonReader jsonReader) throws IOException {
            Map<K, V> map;
            JsonToken peek = jsonReader.peek();
            if (peek == JsonToken.NULL) {
                jsonReader.nextNull();
                map = null;
            } else {
                Map<K, V> construct = this.constructor.construct();
                if (peek == JsonToken.BEGIN_ARRAY) {
                    jsonReader.beginArray();
                    while (jsonReader.hasNext()) {
                        jsonReader.beginArray();
                        K read = this.keyTypeAdapter.read(jsonReader);
                        if (construct.put(read, this.valueTypeAdapter.read(jsonReader)) != null) {
                            throw new JsonSyntaxException("duplicate key: " + read);
                        }
                        jsonReader.endArray();
                    }
                    jsonReader.endArray();
                    map = construct;
                } else {
                    jsonReader.beginObject();
                    while (jsonReader.hasNext()) {
                        JsonReaderInternalAccess.INSTANCE.promoteNameToValue(jsonReader);
                        K read2 = this.keyTypeAdapter.read(jsonReader);
                        if (construct.put(read2, this.valueTypeAdapter.read(jsonReader)) != null) {
                            throw new JsonSyntaxException("duplicate key: " + read2);
                        }
                    }
                    jsonReader.endObject();
                    map = construct;
                }
            }
            return map;
        }

        @Override // com.google.gson.TypeAdapter
        public /* bridge */ /* synthetic */ void write(JsonWriter jsonWriter, Object obj) throws IOException {
            write(jsonWriter, (Map) ((Map) obj));
        }

        /* JADX DEBUG: Multi-variable search result rejected for r0v22, resolved type: com.google.gson.TypeAdapter<V> */
        /* JADX DEBUG: Multi-variable search result rejected for r0v35, resolved type: com.google.gson.TypeAdapter<V> */
        /* JADX WARN: Multi-variable type inference failed */
        public void write(JsonWriter jsonWriter, Map<K, V> map) throws IOException {
            if (map == null) {
                jsonWriter.nullValue();
            } else if (!MapTypeAdapterFactory.this.complexMapKeySerialization) {
                jsonWriter.beginObject();
                for (Map.Entry<K, V> entry : map.entrySet()) {
                    jsonWriter.name(String.valueOf(entry.getKey()));
                    this.valueTypeAdapter.write(jsonWriter, entry.getValue());
                }
                jsonWriter.endObject();
            } else {
                boolean z = false;
                ArrayList arrayList = new ArrayList(map.size());
                ArrayList arrayList2 = new ArrayList(map.size());
                for (Map.Entry<K, V> entry2 : map.entrySet()) {
                    JsonElement jsonTree = this.keyTypeAdapter.toJsonTree(entry2.getKey());
                    arrayList.add(jsonTree);
                    arrayList2.add(entry2.getValue());
                    z |= jsonTree.isJsonArray() || jsonTree.isJsonObject();
                }
                if (!z) {
                    jsonWriter.beginObject();
                    for (int i = 0; i < arrayList.size(); i++) {
                        jsonWriter.name(keyToString((JsonElement) arrayList.get(i)));
                        this.valueTypeAdapter.write(jsonWriter, arrayList2.get(i));
                    }
                    jsonWriter.endObject();
                    return;
                }
                jsonWriter.beginArray();
                for (int i2 = 0; i2 < arrayList.size(); i2++) {
                    jsonWriter.beginArray();
                    Streams.write((JsonElement) arrayList.get(i2), jsonWriter);
                    this.valueTypeAdapter.write(jsonWriter, arrayList2.get(i2));
                    jsonWriter.endArray();
                }
                jsonWriter.endArray();
            }
        }
    }

    public MapTypeAdapterFactory(ConstructorConstructor constructorConstructor, boolean z) {
        this.constructorConstructor = constructorConstructor;
        this.complexMapKeySerialization = z;
    }

    private TypeAdapter<?> getKeyAdapter(Gson gson, Type type) {
        return (type == Boolean.TYPE || type == Boolean.class) ? TypeAdapters.BOOLEAN_AS_STRING : gson.getAdapter(TypeToken.get(type));
    }

    @Override // com.google.gson.TypeAdapterFactory
    public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken) {
        Adapter adapter;
        Type type = typeToken.getType();
        if (!Map.class.isAssignableFrom(typeToken.getRawType())) {
            adapter = null;
        } else {
            Type[] mapKeyAndValueTypes = C$Gson$Types.getMapKeyAndValueTypes(type, C$Gson$Types.getRawType(type));
            adapter = new Adapter(gson, mapKeyAndValueTypes[0], getKeyAdapter(gson, mapKeyAndValueTypes[0]), mapKeyAndValueTypes[1], gson.getAdapter(TypeToken.get(mapKeyAndValueTypes[1])), this.constructorConstructor.get(typeToken));
        }
        return adapter;
    }
}
