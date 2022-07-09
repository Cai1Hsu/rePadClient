package com.google.gson.internal;

/* renamed from: com.google.gson.internal.$Gson$Preconditions */
/* loaded from: classes.dex */
public final class C$Gson$Preconditions {
    public static <T> T checkNotNull(T obj) {
        if (obj == null) {
            throw new NullPointerException();
        }
        return obj;
    }

    public static void checkArgument(boolean condition) {
        if (!condition) {
            throw new IllegalArgumentException();
        }
    }
}
