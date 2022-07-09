package android.support.v4.app;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.support.annotation.RequiresApi;

@RequiresApi(16)
@TargetApi(16)
/* loaded from: classes.jar:android/support/v4/app/NavUtilsJB.class */
class NavUtilsJB {
    NavUtilsJB() {
    }

    public static Intent getParentActivityIntent(Activity activity) {
        return activity.getParentActivityIntent();
    }

    public static String getParentActivityName(ActivityInfo activityInfo) {
        return activityInfo.parentActivityName;
    }

    public static void navigateUpTo(Activity activity, Intent intent) {
        activity.navigateUpTo(intent);
    }

    public static boolean shouldUpRecreateTask(Activity activity, Intent intent) {
        return activity.shouldUpRecreateTask(intent);
    }
}
