package com.pgyersdk.c;

import android.content.Context;

/* loaded from: classes.jar:com/pgyersdk/c/d.class */
public final class d {
    public static int a(Context context) {
        return (int) (((context.getResources().getDisplayMetrics().densityDpi / 160.0f) * 1.0f) + 0.5f);
    }
}
