package android.support.v4.content.res;

import android.annotation.TargetApi;
import android.content.res.Resources;
import android.support.annotation.NonNull;
import android.support.annotation.RequiresApi;
import android.util.DisplayMetrics;

@RequiresApi(9)
@TargetApi(9)
/* loaded from: classes.jar:android/support/v4/content/res/ConfigurationHelperGingerbread.class */
class ConfigurationHelperGingerbread {
    ConfigurationHelperGingerbread() {
    }

    static int getDensityDpi(@NonNull Resources resources) {
        return resources.getDisplayMetrics().densityDpi;
    }

    static int getScreenHeightDp(@NonNull Resources resources) {
        DisplayMetrics displayMetrics = resources.getDisplayMetrics();
        return (int) (displayMetrics.heightPixels / displayMetrics.density);
    }

    static int getScreenWidthDp(@NonNull Resources resources) {
        DisplayMetrics displayMetrics = resources.getDisplayMetrics();
        return (int) (displayMetrics.widthPixels / displayMetrics.density);
    }

    static int getSmallestScreenWidthDp(@NonNull Resources resources) {
        return Math.min(getScreenWidthDp(resources), getScreenHeightDp(resources));
    }
}
