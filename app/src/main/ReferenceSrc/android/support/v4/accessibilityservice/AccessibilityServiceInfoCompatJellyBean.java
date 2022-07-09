package android.support.v4.accessibilityservice;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.annotation.TargetApi;
import android.content.pm.PackageManager;
import android.support.annotation.RequiresApi;

@RequiresApi(16)
@TargetApi(16)
/* loaded from: classes.jar:android/support/v4/accessibilityservice/AccessibilityServiceInfoCompatJellyBean.class */
class AccessibilityServiceInfoCompatJellyBean {
    AccessibilityServiceInfoCompatJellyBean() {
    }

    public static String loadDescription(AccessibilityServiceInfo accessibilityServiceInfo, PackageManager packageManager) {
        return accessibilityServiceInfo.loadDescription(packageManager);
    }
}
