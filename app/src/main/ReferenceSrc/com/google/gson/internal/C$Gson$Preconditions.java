package com.google.gson.internal;

/* renamed from: com.google.gson.internal.$Gson$Preconditions */
/* loaded from: classes.jar:com/google/gson/internal/$Gson$Preconditions.class */
public final class C$Gson$Preconditions {
    public static void checkArgument(boolean z) {
        if (!z) {
            throw new IllegalArgumentException();
        }
    }

    public static <T> T checkNotNull(T t) {
        if (t == null) {
            throw new NullPointerException();
        }
        return t;
    }
}
