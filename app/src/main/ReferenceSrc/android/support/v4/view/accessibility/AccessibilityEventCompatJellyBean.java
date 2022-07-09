package android.support.v4.view.accessibility;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.view.accessibility.AccessibilityEvent;

@RequiresApi(16)
@TargetApi(16)
/* loaded from: classes.jar:android/support/v4/view/accessibility/AccessibilityEventCompatJellyBean.class */
class AccessibilityEventCompatJellyBean {
    AccessibilityEventCompatJellyBean() {
    }

    public static int getAction(AccessibilityEvent accessibilityEvent) {
        return accessibilityEvent.getAction();
    }

    public static int getMovementGranularity(AccessibilityEvent accessibilityEvent) {
        return accessibilityEvent.getMovementGranularity();
    }

    public static void setAction(AccessibilityEvent accessibilityEvent, int i) {
        accessibilityEvent.setAction(i);
    }

    public static void setMovementGranularity(AccessibilityEvent accessibilityEvent, int i) {
        accessibilityEvent.setMovementGranularity(i);
    }
}
