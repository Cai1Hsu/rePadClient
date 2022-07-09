package com.handmark.pulltorefresh.library.internal;

import android.util.Log;

/* loaded from: classes.jar:com/handmark/pulltorefresh/library/internal/Utils.class */
public class Utils {
    static final String LOG_TAG = "PullToRefresh";

    public static void warnDeprecation(String str, String str2) {
        Log.w(LOG_TAG, "You're using the deprecated " + str + " attr, please switch over to " + str2);
    }
}
