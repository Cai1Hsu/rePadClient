package android.support.v4.os;

import android.content.Context;

/* loaded from: classes.jar:android/support/v4/os/UserManagerCompat.class */
public class UserManagerCompat {
    private UserManagerCompat() {
    }

    public static boolean isUserUnlocked(Context context) {
        return BuildCompat.isAtLeastN() ? UserManagerCompatApi24.isUserUnlocked(context) : true;
    }
}
