package com.google.gson;

import java.lang.reflect.Type;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface JsonSerializationContext {
    JsonElement serialize(Object obj);

    JsonElement serialize(Object obj, Type type);
}
