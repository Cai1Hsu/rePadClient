package com.edutech.mobilestudyclient.util;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;
import com.edutech.mobilestudyclient.activity.service.sysProtectService;
import java.util.List;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/util/DensityUtil.class */
public class DensityUtil {
    public static int dip2px(Context context, float f) {
        return (int) ((f * context.getResources().getDisplayMetrics().density) + 0.5f);
    }

    public static String getLauncherPackageName(Context context) {
        String str;
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.addCategory("android.intent.category.HOME");
        if (Build.DISPLAY.contains("M1016Pro")) {
            str = "com.launcher.activity";
        } else if (Build.DISPLAY.contains("TB-8604F")) {
            List<ResolveInfo> queryIntentActivities = context.getPackageManager().queryIntentActivities(intent, 65536);
            str = null;
            if (queryIntentActivities != null) {
                str = null;
                if (queryIntentActivities.size() == 1) {
                    str = queryIntentActivities.get(0).activityInfo.packageName;
                }
            }
        } else {
            ResolveInfo resolveActivity = context.getPackageManager().resolveActivity(intent, 0);
            str = null;
            if (resolveActivity.activityInfo != null) {
                str = null;
                if (!resolveActivity.activityInfo.packageName.equals("android")) {
                    str = resolveActivity.activityInfo.packageName;
                }
            }
        }
        return str;
    }

    public static boolean isMyLauncherDefault(Context context) {
        boolean z = true;
        String packageName = context.getPackageName();
        if (!Build.DISPLAY.contains("M1016Pro")) {
            String str = null;
            try {
                str = getLauncherPackageName(context);
            } catch (Exception e) {
            }
            Log.d("Launcher", "launcherPackageName is " + str);
            if (str == null) {
                z = false;
            } else if (!packageName.equals(str)) {
                if (!TextUtils.isEmpty(str) && context != null) {
                    try {
                        Intent intent = new Intent(sysProtectService.UNSTALLAPK);
                        intent.putExtra("packagename", str);
                        context.sendBroadcast(intent);
                    } catch (Exception e2) {
                    }
                }
                z = false;
            }
        }
        return z;
    }

    public static int px2dip(Context context, float f) {
        return (int) ((f / context.getResources().getDisplayMetrics().density) + 0.5f);
    }
}
