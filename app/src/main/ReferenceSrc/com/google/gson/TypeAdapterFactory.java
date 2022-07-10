package com.google.gson;

import com.google.gson.reflect.TypeToken;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface TypeAdapterFactory {
    <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken);
}
