package com.edutech.appmanage.utils;

import android.content.SharedPreferences;

/* loaded from: classes.jar:com/edutech/appmanage/utils/SharedPreferencesHelper.class */
public class SharedPreferencesHelper {
    public static SharedPreferences preferences;

    public static String load_info() {
        return preferences.getString("info", "");
    }

    public static void save_info(String str) {
        SharedPreferences.Editor edit = preferences.edit();
        edit.putString("info", str);
        edit.commit();
    }
}
