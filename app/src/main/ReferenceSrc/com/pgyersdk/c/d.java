package com.pgyersdk.c;

import android.content.Context;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class d {
    public static int a(Context context) {
        return (int) (((context.getResources().getDisplayMetrics().densityDpi / 160.0f) * 1.0f) + 0.5f);
    }
}
