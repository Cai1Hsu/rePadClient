package android.support.v4.app;

import android.annotation.TargetApi;
import android.os.Bundle;
import android.os.IBinder;
import android.support.annotation.RequiresApi;

@RequiresApi(18)
@TargetApi(18)
/* loaded from: classes.jar:android/support/v4/app/BundleCompatJellybeanMR2.class */
class BundleCompatJellybeanMR2 {
    BundleCompatJellybeanMR2() {
    }

    public static IBinder getBinder(Bundle bundle, String str) {
        return bundle.getBinder(str);
    }

    public static void putBinder(Bundle bundle, String str, IBinder iBinder) {
        bundle.putBinder(str, iBinder);
    }
}
