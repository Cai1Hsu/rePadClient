package com.pgyersdk.c;

import android.os.Build;

/* loaded from: classes.dex */
public final class j {
    public static Boolean a() {
        try {
            return Build.VERSION.SDK_INT >= 9;
        } catch (NoClassDefFoundError e) {
            return false;
        }
    }
}
