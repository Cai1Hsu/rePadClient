package android.support.v4.app;

import android.app.Service;
import android.support.annotation.RestrictTo;
import android.support.v4.os.BuildCompat;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* loaded from: classes.jar:android/support/v4/app/ServiceCompat.class */
public final class ServiceCompat {
    static final ServiceCompatImpl IMPL;
    public static final int START_STICKY = 1;
    public static final int STOP_FOREGROUND_DETACH = 2;
    public static final int STOP_FOREGROUND_REMOVE = 1;

    /* loaded from: classes.jar:android/support/v4/app/ServiceCompat$Api24ServiceCompatImpl.class */
    static class Api24ServiceCompatImpl implements ServiceCompatImpl {
        Api24ServiceCompatImpl() {
        }

        @Override // android.support.v4.app.ServiceCompat.ServiceCompatImpl
        public void stopForeground(Service service, int i) {
            ServiceCompatApi24.stopForeground(service, i);
        }
    }

    /* loaded from: classes.jar:android/support/v4/app/ServiceCompat$BaseServiceCompatImpl.class */
    static class BaseServiceCompatImpl implements ServiceCompatImpl {
        BaseServiceCompatImpl() {
        }

        @Override // android.support.v4.app.ServiceCompat.ServiceCompatImpl
        public void stopForeground(Service service, int i) {
            service.stopForeground((i & 1) != 0);
        }
    }

    /* loaded from: classes.jar:android/support/v4/app/ServiceCompat$ServiceCompatImpl.class */
    interface ServiceCompatImpl {
        void stopForeground(Service service, int i);
    }

    @Retention(RetentionPolicy.SOURCE)
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    /* loaded from: classes.jar:android/support/v4/app/ServiceCompat$StopForegroundFlags.class */
    public @interface StopForegroundFlags {
    }

    static {
        if (BuildCompat.isAtLeastN()) {
            IMPL = new Api24ServiceCompatImpl();
        } else {
            IMPL = new BaseServiceCompatImpl();
        }
    }

    private ServiceCompat() {
    }

    public static void stopForeground(Service service, int i) {
        IMPL.stopForeground(service, i);
    }
}
