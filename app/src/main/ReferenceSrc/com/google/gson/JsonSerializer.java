package com.google.gson;

import java.lang.reflect.Type;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface JsonSerializer<T> {
    JsonElement serialize(T t, Type type, JsonSerializationContext jsonSerializationContext);
}
