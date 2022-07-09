package android.support.v4.net;

import android.annotation.TargetApi;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.support.annotation.RequiresApi;

@RequiresApi(13)
@TargetApi(13)
/* loaded from: classes.jar:android/support/v4/net/ConnectivityManagerCompatHoneycombMR2.class */
class ConnectivityManagerCompatHoneycombMR2 {
    ConnectivityManagerCompatHoneycombMR2() {
    }

    public static boolean isActiveNetworkMetered(ConnectivityManager connectivityManager) {
        boolean z;
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        if (activeNetworkInfo != null) {
            z = true;
            switch (activeNetworkInfo.getType()) {
                case 0:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                    break;
                case 1:
                case 7:
                case 9:
                    z = false;
                    break;
                case 8:
                default:
                    z = true;
                    break;
            }
        } else {
            z = true;
        }
        return z;
    }
}
