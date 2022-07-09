package com.google.gson;

import java.lang.reflect.Type;

/* loaded from: classes.jar:com/google/gson/JsonSerializer.class */
public interface JsonSerializer<T> {
    JsonElement serialize(T t, Type type, JsonSerializationContext jsonSerializationContext);
}
