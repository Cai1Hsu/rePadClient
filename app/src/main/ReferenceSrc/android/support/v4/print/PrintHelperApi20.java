package android.support.v4.print;

import android.annotation.TargetApi;
import android.content.Context;
import android.support.annotation.RequiresApi;

@RequiresApi(20)
@TargetApi(20)
/* loaded from: classes.jar:android/support/v4/print/PrintHelperApi20.class */
class PrintHelperApi20 extends PrintHelperKitkat {
    PrintHelperApi20(Context context) {
        super(context);
        this.mPrintActivityRespectsOrientation = false;
    }
}
