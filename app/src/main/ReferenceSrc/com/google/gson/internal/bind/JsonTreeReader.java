package com.google.gson.internal.bind;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes.jar:com/google/gson/internal/bind/JsonTreeReader.class */
public final class JsonTreeReader extends JsonReader {
    private final List<Object> stack = new ArrayList();
    private static final Reader UNREADABLE_READER = new Reader() { // from class: com.google.gson.internal.bind.JsonTreeReader.1
        @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            throw new AssertionError();
        }

        @Override // java.io.Reader
        public int read(char[] cArr, int i, int i2) throws IOException {
            throw new AssertionError();
        }
    };
    private static final Object SENTINEL_CLOSED = new Object();

    public JsonTreeReader(JsonElement jsonElement) {
        super(UNREADABLE_READER);
        this.stack.add(jsonElement);
    }

    private void expect(JsonToken jsonToken) throws IOException {
        if (peek() != jsonToken) {
            throw new IllegalStateException("Expected " + jsonToken + " but was " + peek());
        }
    }

    private Object peekStack() {
        return this.stack.get(this.stack.size() - 1);
    }

    private Object popStack() {
        return this.stack.remove(this.stack.size() - 1);
    }

    @Override // com.google.gson.stream.JsonReader
    public void beginArray() throws IOException {
        expect(JsonToken.BEGIN_ARRAY);
        this.stack.add(((JsonArray) peekStack()).iterator());
    }

    @Override // com.google.gson.stream.JsonReader
    public void beginObject() throws IOException {
        expect(JsonToken.BEGIN_OBJECT);
        this.stack.add(((JsonObject) peekStack()).entrySet().iterator());
    }

    @Override // com.google.gson.stream.JsonReader, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.stack.clear();
        this.stack.add(SENTINEL_CLOSED);
    }

    @Override // com.google.gson.stream.JsonReader
    public void endArray() throws IOException {
        expect(JsonToken.END_ARRAY);
        popStack();
        popStack();
    }

    @Override // com.google.gson.stream.JsonReader
    public void endObject() throws IOException {
        expect(JsonToken.END_OBJECT);
        popStack();
        popStack();
    }

    @Override // com.google.gson.stream.JsonReader
    public boolean hasNext() throws IOException {
        JsonToken peek = peek();
        return (peek == JsonToken.END_OBJECT || peek == JsonToken.END_ARRAY) ? false : true;
    }

    @Override // com.google.gson.stream.JsonReader
    public boolean nextBoolean() throws IOException {
        expect(JsonToken.BOOLEAN);
        return ((JsonPrimitive) popStack()).getAsBoolean();
    }

    @Override // com.google.gson.stream.JsonReader
    public double nextDouble() throws IOException {
        JsonToken peek = peek();
        if (peek == JsonToken.NUMBER || peek == JsonToken.STRING) {
            double asDouble = ((JsonPrimitive) peekStack()).getAsDouble();
            if (!isLenient() && (Double.isNaN(asDouble) || Double.isInfinite(asDouble))) {
                throw new NumberFormatException("JSON forbids NaN and infinities: " + asDouble);
            }
            popStack();
            return asDouble;
        }
        throw new IllegalStateException("Expected " + JsonToken.NUMBER + " but was " + peek);
    }

    @Override // com.google.gson.stream.JsonReader
    public int nextInt() throws IOException {
        JsonToken peek = peek();
        if (peek == JsonToken.NUMBER || peek == JsonToken.STRING) {
            int asInt = ((JsonPrimitive) peekStack()).getAsInt();
            popStack();
            return asInt;
        }
        throw new IllegalStateException("Expected " + JsonToken.NUMBER + " but was " + peek);
    }

    @Override // com.google.gson.stream.JsonReader
    public long nextLong() throws IOException {
        JsonToken peek = peek();
        if (peek == JsonToken.NUMBER || peek == JsonToken.STRING) {
            long asLong = ((JsonPrimitive) peekStack()).getAsLong();
            popStack();
            return asLong;
        }
        throw new IllegalStateException("Expected " + JsonToken.NUMBER + " but was " + peek);
    }

    @Override // com.google.gson.stream.JsonReader
    public String nextName() throws IOException {
        expect(JsonToken.NAME);
        Map.Entry entry = (Map.Entry) ((Iterator) peekStack()).next();
        this.stack.add(entry.getValue());
        return (String) entry.getKey();
    }

    @Override // com.google.gson.stream.JsonReader
    public void nextNull() throws IOException {
        expect(JsonToken.NULL);
        popStack();
    }

    @Override // com.google.gson.stream.JsonReader
    public String nextString() throws IOException {
        JsonToken peek = peek();
        if (peek == JsonToken.STRING || peek == JsonToken.NUMBER) {
            return ((JsonPrimitive) popStack()).getAsString();
        }
        throw new IllegalStateException("Expected " + JsonToken.STRING + " but was " + peek);
    }

    @Override // com.google.gson.stream.JsonReader
    public JsonToken peek() throws IOException {
        JsonToken jsonToken;
        if (this.stack.isEmpty()) {
            jsonToken = JsonToken.END_DOCUMENT;
        } else {
            Object peekStack = peekStack();
            if (peekStack instanceof Iterator) {
                boolean z = this.stack.get(this.stack.size() - 2) instanceof JsonObject;
                Iterator it = (Iterator) peekStack;
                if (!it.hasNext()) {
                    jsonToken = z ? JsonToken.END_OBJECT : JsonToken.END_ARRAY;
                } else if (z) {
                    jsonToken = JsonToken.NAME;
                } else {
                    this.stack.add(it.next());
                    jsonToken = peek();
                }
            } else if (peekStack instanceof JsonObject) {
                jsonToken = JsonToken.BEGIN_OBJECT;
            } else if (peekStack instanceof JsonArray) {
                jsonToken = JsonToken.BEGIN_ARRAY;
            } else if (peekStack instanceof JsonPrimitive) {
                JsonPrimitive jsonPrimitive = (JsonPrimitive) peekStack;
                if (jsonPrimitive.isString()) {
                    jsonToken = JsonToken.STRING;
                } else if (jsonPrimitive.isBoolean()) {
                    jsonToken = JsonToken.BOOLEAN;
                } else if (!jsonPrimitive.isNumber()) {
                    throw new AssertionError();
                } else {
                    jsonToken = JsonToken.NUMBER;
                }
            } else if (!(peekStack instanceof JsonNull)) {
                if (peekStack != SENTINEL_CLOSED) {
                    throw new AssertionError();
                }
                throw new IllegalStateException("JsonReader is closed");
            } else {
                jsonToken = JsonToken.NULL;
            }
        }
        return jsonToken;
    }

    public void promoteNameToValue() throws IOException {
        expect(JsonToken.NAME);
        Map.Entry entry = (Map.Entry) ((Iterator) peekStack()).next();
        this.stack.add(entry.getValue());
        this.stack.add(new JsonPrimitive((String) entry.getKey()));
    }

    @Override // com.google.gson.stream.JsonReader
    public void skipValue() throws IOException {
        if (peek() == JsonToken.NAME) {
            nextName();
        } else {
            popStack();
        }
    }

    @Override // com.google.gson.stream.JsonReader
    public String toString() {
        return getClass().getSimpleName();
    }
}
