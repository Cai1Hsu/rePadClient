package com.google.gson;

import java.lang.reflect.Type;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface JsonDeserializer<T> {
    T deserialize(JsonElement jsonElement, Type type, JsonDeserializationContext jsonDeserializationContext) throws JsonParseException;
}
