package com.edutech.daoxueben.until;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

/* loaded from: classes.jar:com/edutech/daoxueben/until/NetWorkHelper.class */
public class NetWorkHelper {
    public static boolean isMobileConnected(Context context) {
        boolean z = false;
        if (context != null) {
            NetworkInfo networkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getNetworkInfo(0);
            z = false;
            if (networkInfo != null) {
                z = networkInfo.isAvailable();
            }
        }
        return z;
    }

    public static boolean isNetworkConnected(Context context) {
        NetworkInfo activeNetworkInfo;
        return (context == null || (activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo()) == null) ? false : activeNetworkInfo.isAvailable();
    }

    public static boolean isWifiConnected(Context context) {
        NetworkInfo networkInfo;
        return (context == null || (networkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getNetworkInfo(1)) == null) ? false : networkInfo.isAvailable();
    }
}
