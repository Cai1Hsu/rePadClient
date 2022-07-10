package com.google.gson;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface ExclusionStrategy {
    boolean shouldSkipClass(Class<?> cls);

    boolean shouldSkipField(FieldAttributes fieldAttributes);
}
