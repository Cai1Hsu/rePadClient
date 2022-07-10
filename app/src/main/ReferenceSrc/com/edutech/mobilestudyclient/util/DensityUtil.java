package com.edutech.mobilestudyclient.util;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;
import com.edutech.mobilestudyclient.activity.service.sysProtectService;
import java.util.List;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class DensityUtil {
    public static int dip2px(Context context, float dpValue) {
        float scale = context.getResources().getDisplayMetrics().density;
        return (int) ((dpValue * scale) + 0.5f);
    }

    public static int px2dip(Context context, float pxValue) {
        float scale = context.getResources().getDisplayMetrics().density;
        return (int) ((pxValue / scale) + 0.5f);
    }

    public static String getLauncherPackageName(Context context) {
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.addCategory("android.intent.category.HOME");
        if (Build.DISPLAY.contains("M1016Pro")) {
            return "com.launcher.activity";
        }
        if (Build.DISPLAY.contains("TB-8604F")) {
            List<ResolveInfo> resolveInfo = context.getPackageManager().queryIntentActivities(intent, 65536);
            if (resolveInfo != null && resolveInfo.size() == 1) {
                return resolveInfo.get(0).activityInfo.packageName;
            }
            return null;
        }
        ResolveInfo res = context.getPackageManager().resolveActivity(intent, 0);
        if (res.activityInfo != null && !res.activityInfo.packageName.equals("android")) {
            return res.activityInfo.packageName;
        }
        return null;
    }

    public static boolean isMyLauncherDefault(Context mContext) {
        String myPackageName = mContext.getPackageName();
        if (Build.DISPLAY.contains("M1016Pro")) {
            return true;
        }
        String launcherPackageName = null;
        try {
            launcherPackageName = getLauncherPackageName(mContext);
        } catch (Exception e) {
        }
        Log.d("Launcher", "launcherPackageName is " + launcherPackageName);
        if (launcherPackageName == null) {
            return false;
        }
        if (myPackageName.equals(launcherPackageName)) {
            return true;
        }
        if (!TextUtils.isEmpty(launcherPackageName) && mContext != null) {
            try {
                Intent installIntent = new Intent(sysProtectService.UNSTALLAPK);
                installIntent.putExtra("packagename", launcherPackageName);
                mContext.sendBroadcast(installIntent);
            } catch (Exception e2) {
            }
        }
        return false;
    }
}
