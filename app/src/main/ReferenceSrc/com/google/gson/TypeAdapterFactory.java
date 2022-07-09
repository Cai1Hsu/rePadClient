package com.google.gson;

import com.google.gson.reflect.TypeToken;

/* loaded from: classes.jar:com/google/gson/TypeAdapterFactory.class */
public interface TypeAdapterFactory {
    <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken);
}
