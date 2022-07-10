package com.pgyersdk.c;

import android.content.Context;
import android.content.SharedPreferences;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class k {
    private static SharedPreferences a = null;

    public static String a(Context context, String str) {
        if (a == null) {
            a = context.getSharedPreferences("pgyersdk", 0);
        }
        return a.getString(str, "");
    }

    public static void a(String str, String str2) {
        a.edit().putString(str, str2).commit();
    }
}
