package android.support.v4.content;

import android.annotation.TargetApi;
import android.content.ComponentName;
import android.content.Intent;
import android.support.annotation.RequiresApi;

@RequiresApi(11)
@TargetApi(11)
/* loaded from: classes.jar:android/support/v4/content/IntentCompatHoneycomb.class */
class IntentCompatHoneycomb {
    IntentCompatHoneycomb() {
    }

    public static Intent makeMainActivity(ComponentName componentName) {
        return Intent.makeMainActivity(componentName);
    }

    public static Intent makeRestartActivityTask(ComponentName componentName) {
        return Intent.makeRestartActivityTask(componentName);
    }
}
