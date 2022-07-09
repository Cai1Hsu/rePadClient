package com.pgyersdk.c;

import android.os.Build;

/* loaded from: classes.jar:com/pgyersdk/c/j.class */
public final class j {
    public static Boolean a() {
        Boolean bool;
        try {
            bool = Build.VERSION.SDK_INT >= 9;
        } catch (NoClassDefFoundError e) {
            bool = false;
        }
        return bool;
    }
}
