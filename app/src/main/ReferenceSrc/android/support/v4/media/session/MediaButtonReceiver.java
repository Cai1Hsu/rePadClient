package android.support.v4.media.session;

import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.support.v4.media.MediaBrowserServiceCompat;
import android.util.Log;
import android.view.KeyEvent;
import java.util.List;

/* loaded from: classes.jar:android/support/v4/media/session/MediaButtonReceiver.class */
public class MediaButtonReceiver extends BroadcastReceiver {
    private static final String TAG = "MediaButtonReceiver";

    public static PendingIntent buildMediaButtonPendingIntent(Context context, long j) {
        PendingIntent buildMediaButtonPendingIntent;
        ComponentName mediaButtonReceiverComponent = getMediaButtonReceiverComponent(context);
        if (mediaButtonReceiverComponent == null) {
            Log.w(TAG, "A unique media button receiver could not be found in the given context, so couldn't build a pending intent.");
            buildMediaButtonPendingIntent = null;
        } else {
            buildMediaButtonPendingIntent = buildMediaButtonPendingIntent(context, mediaButtonReceiverComponent, j);
        }
        return buildMediaButtonPendingIntent;
    }

    public static PendingIntent buildMediaButtonPendingIntent(Context context, ComponentName componentName, long j) {
        PendingIntent broadcast;
        if (componentName == null) {
            Log.w(TAG, "The component name of media button receiver should be provided.");
            broadcast = null;
        } else {
            int keyCode = PlaybackStateCompat.toKeyCode(j);
            if (keyCode == 0) {
                Log.w(TAG, "Cannot build a media button pending intent with the given action: " + j);
                broadcast = null;
            } else {
                Intent intent = new Intent("android.intent.action.MEDIA_BUTTON");
                intent.setComponent(componentName);
                intent.putExtra("android.intent.extra.KEY_EVENT", new KeyEvent(0, keyCode));
                broadcast = PendingIntent.getBroadcast(context, keyCode, intent, 0);
            }
        }
        return broadcast;
    }

    static ComponentName getMediaButtonReceiverComponent(Context context) {
        ComponentName componentName;
        Intent intent = new Intent("android.intent.action.MEDIA_BUTTON");
        intent.setPackage(context.getPackageName());
        List<ResolveInfo> queryBroadcastReceivers = context.getPackageManager().queryBroadcastReceivers(intent, 0);
        if (queryBroadcastReceivers.size() == 1) {
            ResolveInfo resolveInfo = queryBroadcastReceivers.get(0);
            componentName = new ComponentName(resolveInfo.activityInfo.packageName, resolveInfo.activityInfo.name);
        } else {
            if (queryBroadcastReceivers.size() > 1) {
                Log.w(TAG, "More than one BroadcastReceiver that handles android.intent.action.MEDIA_BUTTON was found, returning null.");
            }
            componentName = null;
        }
        return componentName;
    }

    public static KeyEvent handleIntent(MediaSessionCompat mediaSessionCompat, Intent intent) {
        KeyEvent keyEvent;
        if (mediaSessionCompat == null || intent == null || !"android.intent.action.MEDIA_BUTTON".equals(intent.getAction()) || !intent.hasExtra("android.intent.extra.KEY_EVENT")) {
            keyEvent = null;
        } else {
            KeyEvent keyEvent2 = (KeyEvent) intent.getParcelableExtra("android.intent.extra.KEY_EVENT");
            mediaSessionCompat.getController().dispatchMediaButtonEvent(keyEvent2);
            keyEvent = keyEvent2;
        }
        return keyEvent;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        Intent intent2 = new Intent("android.intent.action.MEDIA_BUTTON");
        intent2.setPackage(context.getPackageName());
        PackageManager packageManager = context.getPackageManager();
        List<ResolveInfo> queryIntentServices = packageManager.queryIntentServices(intent2, 0);
        List<ResolveInfo> list = queryIntentServices;
        if (queryIntentServices.isEmpty()) {
            intent2.setAction(MediaBrowserServiceCompat.SERVICE_INTERFACE);
            list = packageManager.queryIntentServices(intent2, 0);
        }
        if (list.isEmpty()) {
            throw new IllegalStateException("Could not find any Service that handles android.intent.action.MEDIA_BUTTON or a media browser service implementation");
        }
        if (list.size() != 1) {
            throw new IllegalStateException("Expected 1 Service that handles " + intent2.getAction() + ", found " + list.size());
        }
        ResolveInfo resolveInfo = list.get(0);
        intent.setComponent(new ComponentName(resolveInfo.serviceInfo.packageName, resolveInfo.serviceInfo.name));
        context.startService(intent);
    }
}
