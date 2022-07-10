package com.google.gson;

import java.lang.reflect.Type;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface JsonDeserializationContext {
    <T> T deserialize(JsonElement jsonElement, Type type) throws JsonParseException;
}
