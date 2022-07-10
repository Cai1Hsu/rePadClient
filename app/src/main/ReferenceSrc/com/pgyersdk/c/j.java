package com.pgyersdk.c;

import android.os.Build;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class j {
    public static Boolean a() {
        try {
            return Build.VERSION.SDK_INT >= 9;
        } catch (NoClassDefFoundError e) {
            return false;
        }
    }
}
