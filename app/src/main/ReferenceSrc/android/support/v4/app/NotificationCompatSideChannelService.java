package android.support.v4.app;

import android.app.Notification;
import android.app.Service;
import android.content.Intent;
import android.os.Build;
import android.os.IBinder;
import android.os.RemoteException;
import android.support.v4.app.INotificationSideChannel;

/* loaded from: classes.jar:android/support/v4/app/NotificationCompatSideChannelService.class */
public abstract class NotificationCompatSideChannelService extends Service {

    /* loaded from: classes.jar:android/support/v4/app/NotificationCompatSideChannelService$NotificationSideChannelStub.class */
    private class NotificationSideChannelStub extends INotificationSideChannel.Stub {
        NotificationSideChannelStub() {
            NotificationCompatSideChannelService.this = r4;
        }

        @Override // android.support.v4.app.INotificationSideChannel
        public void cancel(String str, int i, String str2) throws RemoteException {
            NotificationCompatSideChannelService.this.checkPermission(getCallingUid(), str);
            long clearCallingIdentity = clearCallingIdentity();
            try {
                NotificationCompatSideChannelService.this.cancel(str, i, str2);
            } finally {
                restoreCallingIdentity(clearCallingIdentity);
            }
        }

        @Override // android.support.v4.app.INotificationSideChannel
        public void cancelAll(String str) {
            NotificationCompatSideChannelService.this.checkPermission(getCallingUid(), str);
            long clearCallingIdentity = clearCallingIdentity();
            try {
                NotificationCompatSideChannelService.this.cancelAll(str);
            } finally {
                restoreCallingIdentity(clearCallingIdentity);
            }
        }

        @Override // android.support.v4.app.INotificationSideChannel
        public void notify(String str, int i, String str2, Notification notification) throws RemoteException {
            NotificationCompatSideChannelService.this.checkPermission(getCallingUid(), str);
            long clearCallingIdentity = clearCallingIdentity();
            try {
                NotificationCompatSideChannelService.this.notify(str, i, str2, notification);
            } finally {
                restoreCallingIdentity(clearCallingIdentity);
            }
        }
    }

    public abstract void cancel(String str, int i, String str2);

    public abstract void cancelAll(String str);

    void checkPermission(int i, String str) {
        for (String str2 : getPackageManager().getPackagesForUid(i)) {
            if (str2.equals(str)) {
                return;
            }
        }
        throw new SecurityException("NotificationSideChannelService: Uid " + i + " is not authorized for package " + str);
    }

    public abstract void notify(String str, int i, String str2, Notification notification);

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        NotificationSideChannelStub notificationSideChannelStub = null;
        if (intent.getAction().equals(NotificationManagerCompat.ACTION_BIND_SIDE_CHANNEL)) {
            notificationSideChannelStub = Build.VERSION.SDK_INT > 19 ? null : new NotificationSideChannelStub();
        }
        return notificationSideChannelStub;
    }
}
