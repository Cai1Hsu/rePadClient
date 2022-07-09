package android.support.v4.media;

import android.os.Bundle;
import android.support.annotation.RestrictTo;

@RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
/* loaded from: classes.jar:android/support/v4/media/MediaBrowserCompatUtils.class */
public class MediaBrowserCompatUtils {
    public static boolean areSameOptions(Bundle bundle, Bundle bundle2) {
        boolean z = true;
        if (bundle != bundle2) {
            if (bundle == null) {
                if (bundle2.getInt(MediaBrowserCompat.EXTRA_PAGE, -1) != -1 || bundle2.getInt(MediaBrowserCompat.EXTRA_PAGE_SIZE, -1) != -1) {
                    z = false;
                }
            } else if (bundle2 == null) {
                if (bundle.getInt(MediaBrowserCompat.EXTRA_PAGE, -1) != -1 || bundle.getInt(MediaBrowserCompat.EXTRA_PAGE_SIZE, -1) != -1) {
                    z = false;
                }
            } else if (bundle.getInt(MediaBrowserCompat.EXTRA_PAGE, -1) != bundle2.getInt(MediaBrowserCompat.EXTRA_PAGE, -1) || bundle.getInt(MediaBrowserCompat.EXTRA_PAGE_SIZE, -1) != bundle2.getInt(MediaBrowserCompat.EXTRA_PAGE_SIZE, -1)) {
                z = false;
            }
        }
        return z;
    }

    public static boolean hasDuplicatedItems(Bundle bundle, Bundle bundle2) {
        int i;
        int i2;
        int i3;
        int i4;
        boolean z = true;
        int i5 = bundle == null ? -1 : bundle.getInt(MediaBrowserCompat.EXTRA_PAGE, -1);
        int i6 = bundle2 == null ? -1 : bundle2.getInt(MediaBrowserCompat.EXTRA_PAGE, -1);
        int i7 = bundle == null ? -1 : bundle.getInt(MediaBrowserCompat.EXTRA_PAGE_SIZE, -1);
        int i8 = bundle2 == null ? -1 : bundle2.getInt(MediaBrowserCompat.EXTRA_PAGE_SIZE, -1);
        if (i5 == -1 || i7 == -1) {
            i = 0;
            i2 = Integer.MAX_VALUE;
        } else {
            int i9 = i7 * i5;
            i2 = (i9 + i7) - 1;
            i = i9;
        }
        if (i6 == -1 || i8 == -1) {
            i4 = 0;
            i3 = Integer.MAX_VALUE;
        } else {
            i4 = i8 * i6;
            i3 = (i4 + i8) - 1;
        }
        if ((i > i4 || i4 > i2) && (i > i3 || i3 > i2)) {
            z = false;
        }
        return z;
    }
}
