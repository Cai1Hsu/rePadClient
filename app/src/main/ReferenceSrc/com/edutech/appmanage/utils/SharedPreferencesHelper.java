package com.edutech.appmanage.utils;

import android.content.SharedPreferences;

/* loaded from: classes.dex */
public class SharedPreferencesHelper {
    public static SharedPreferences preferences;

    public static void save_info(String info) {
        SharedPreferences.Editor editor = preferences.edit();
        editor.putString("info", info);
        editor.commit();
    }

    public static String load_info() {
        String info = preferences.getString("info", "");
        return info;
    }
}
