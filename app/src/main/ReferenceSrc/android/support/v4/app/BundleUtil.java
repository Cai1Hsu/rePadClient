package android.support.v4.app;

import android.os.Bundle;
import android.os.Parcelable;
import java.util.Arrays;

/* loaded from: classes.jar:android/support/v4/app/BundleUtil.class */
class BundleUtil {
    BundleUtil() {
    }

    public static Bundle[] getBundleArrayFromBundle(Bundle bundle, String str) {
        Bundle[] bundleArr;
        Parcelable[] parcelableArray = bundle.getParcelableArray(str);
        if ((parcelableArray instanceof Bundle[]) || parcelableArray == null) {
            bundleArr = (Bundle[]) parcelableArray;
        } else {
            Bundle[] bundleArr2 = (Bundle[]) Arrays.copyOf(parcelableArray, parcelableArray.length, Bundle[].class);
            bundle.putParcelableArray(str, bundleArr2);
            bundleArr = bundleArr2;
        }
        return bundleArr;
    }
}
