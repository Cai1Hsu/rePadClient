package android.support.v4.app;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import android.content.pm.PackageManager;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.support.annotation.IntRange;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.ActivityCompatApi21;
import android.support.v4.app.ActivityCompatApi23;
import android.support.v4.app.SharedElementCallback;
import android.support.v4.content.ContextCompat;
import android.view.View;
import java.util.List;
import java.util.Map;

/* loaded from: classes.jar:android/support/v4/app/ActivityCompat.class */
public class ActivityCompat extends ContextCompat {

    /* loaded from: classes.jar:android/support/v4/app/ActivityCompat$OnRequestPermissionsResultCallback.class */
    public interface OnRequestPermissionsResultCallback {
        void onRequestPermissionsResult(int i, @NonNull String[] strArr, @NonNull int[] iArr);
    }

    /* loaded from: classes.jar:android/support/v4/app/ActivityCompat$SharedElementCallback21Impl.class */
    private static class SharedElementCallback21Impl extends ActivityCompatApi21.SharedElementCallback21 {
        private SharedElementCallback mCallback;

        public SharedElementCallback21Impl(SharedElementCallback sharedElementCallback) {
            this.mCallback = sharedElementCallback;
        }

        @Override // android.support.v4.app.ActivityCompatApi21.SharedElementCallback21
        public Parcelable onCaptureSharedElementSnapshot(View view, Matrix matrix, RectF rectF) {
            return this.mCallback.onCaptureSharedElementSnapshot(view, matrix, rectF);
        }

        @Override // android.support.v4.app.ActivityCompatApi21.SharedElementCallback21
        public View onCreateSnapshotView(Context context, Parcelable parcelable) {
            return this.mCallback.onCreateSnapshotView(context, parcelable);
        }

        @Override // android.support.v4.app.ActivityCompatApi21.SharedElementCallback21
        public void onMapSharedElements(List<String> list, Map<String, View> map) {
            this.mCallback.onMapSharedElements(list, map);
        }

        @Override // android.support.v4.app.ActivityCompatApi21.SharedElementCallback21
        public void onRejectSharedElements(List<View> list) {
            this.mCallback.onRejectSharedElements(list);
        }

        @Override // android.support.v4.app.ActivityCompatApi21.SharedElementCallback21
        public void onSharedElementEnd(List<String> list, List<View> list2, List<View> list3) {
            this.mCallback.onSharedElementEnd(list, list2, list3);
        }

        @Override // android.support.v4.app.ActivityCompatApi21.SharedElementCallback21
        public void onSharedElementStart(List<String> list, List<View> list2, List<View> list3) {
            this.mCallback.onSharedElementStart(list, list2, list3);
        }
    }

    /* loaded from: classes.jar:android/support/v4/app/ActivityCompat$SharedElementCallback23Impl.class */
    private static class SharedElementCallback23Impl extends ActivityCompatApi23.SharedElementCallback23 {
        private SharedElementCallback mCallback;

        public SharedElementCallback23Impl(SharedElementCallback sharedElementCallback) {
            this.mCallback = sharedElementCallback;
        }

        @Override // android.support.v4.app.ActivityCompatApi21.SharedElementCallback21
        public Parcelable onCaptureSharedElementSnapshot(View view, Matrix matrix, RectF rectF) {
            return this.mCallback.onCaptureSharedElementSnapshot(view, matrix, rectF);
        }

        @Override // android.support.v4.app.ActivityCompatApi21.SharedElementCallback21
        public View onCreateSnapshotView(Context context, Parcelable parcelable) {
            return this.mCallback.onCreateSnapshotView(context, parcelable);
        }

        @Override // android.support.v4.app.ActivityCompatApi21.SharedElementCallback21
        public void onMapSharedElements(List<String> list, Map<String, View> map) {
            this.mCallback.onMapSharedElements(list, map);
        }

        @Override // android.support.v4.app.ActivityCompatApi21.SharedElementCallback21
        public void onRejectSharedElements(List<View> list) {
            this.mCallback.onRejectSharedElements(list);
        }

        @Override // android.support.v4.app.ActivityCompatApi21.SharedElementCallback21
        public void onSharedElementEnd(List<String> list, List<View> list2, List<View> list3) {
            this.mCallback.onSharedElementEnd(list, list2, list3);
        }

        @Override // android.support.v4.app.ActivityCompatApi21.SharedElementCallback21
        public void onSharedElementStart(List<String> list, List<View> list2, List<View> list3) {
            this.mCallback.onSharedElementStart(list, list2, list3);
        }

        @Override // android.support.v4.app.ActivityCompatApi23.SharedElementCallback23
        public void onSharedElementsArrived(List<String> list, List<View> list2, final ActivityCompatApi23.OnSharedElementsReadyListenerBridge onSharedElementsReadyListenerBridge) {
            this.mCallback.onSharedElementsArrived(list, list2, new SharedElementCallback.OnSharedElementsReadyListener() { // from class: android.support.v4.app.ActivityCompat.SharedElementCallback23Impl.1
                @Override // android.support.v4.app.SharedElementCallback.OnSharedElementsReadyListener
                public void onSharedElementsReady() {
                    onSharedElementsReadyListenerBridge.onSharedElementsReady();
                }
            });
        }
    }

    protected ActivityCompat() {
    }

    private static ActivityCompatApi21.SharedElementCallback21 createCallback(SharedElementCallback sharedElementCallback) {
        SharedElementCallback21Impl sharedElementCallback21Impl = null;
        if (sharedElementCallback != null) {
            sharedElementCallback21Impl = new SharedElementCallback21Impl(sharedElementCallback);
        }
        return sharedElementCallback21Impl;
    }

    private static ActivityCompatApi23.SharedElementCallback23 createCallback23(SharedElementCallback sharedElementCallback) {
        SharedElementCallback23Impl sharedElementCallback23Impl = null;
        if (sharedElementCallback != null) {
            sharedElementCallback23Impl = new SharedElementCallback23Impl(sharedElementCallback);
        }
        return sharedElementCallback23Impl;
    }

    public static void finishAffinity(Activity activity) {
        if (Build.VERSION.SDK_INT >= 16) {
            ActivityCompatJB.finishAffinity(activity);
        } else {
            activity.finish();
        }
    }

    public static void finishAfterTransition(Activity activity) {
        if (Build.VERSION.SDK_INT >= 21) {
            ActivityCompatApi21.finishAfterTransition(activity);
        } else {
            activity.finish();
        }
    }

    @Nullable
    public static Uri getReferrer(Activity activity) {
        Uri uri;
        if (Build.VERSION.SDK_INT >= 22) {
            uri = ActivityCompatApi22.getReferrer(activity);
        } else {
            Intent intent = activity.getIntent();
            Uri uri2 = (Uri) intent.getParcelableExtra("android.intent.extra.REFERRER");
            uri = uri2;
            if (uri2 == null) {
                String stringExtra = intent.getStringExtra("android.intent.extra.REFERRER_NAME");
                uri = stringExtra != null ? Uri.parse(stringExtra) : null;
            }
        }
        return uri;
    }

    public static boolean invalidateOptionsMenu(Activity activity) {
        boolean z;
        if (Build.VERSION.SDK_INT >= 11) {
            ActivityCompatHoneycomb.invalidateOptionsMenu(activity);
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    public static void postponeEnterTransition(Activity activity) {
        if (Build.VERSION.SDK_INT >= 21) {
            ActivityCompatApi21.postponeEnterTransition(activity);
        }
    }

    public static void requestPermissions(@NonNull final Activity activity, @NonNull final String[] strArr, @IntRange(from = 0) final int i) {
        if (Build.VERSION.SDK_INT >= 23) {
            ActivityCompatApi23.requestPermissions(activity, strArr, i);
        } else if (!(activity instanceof OnRequestPermissionsResultCallback)) {
        } else {
            new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: android.support.v4.app.ActivityCompat.1
                @Override // java.lang.Runnable
                public void run() {
                    int[] iArr = new int[strArr.length];
                    PackageManager packageManager = activity.getPackageManager();
                    String packageName = activity.getPackageName();
                    int length = strArr.length;
                    for (int i2 = 0; i2 < length; i2++) {
                        iArr[i2] = packageManager.checkPermission(strArr[i2], packageName);
                    }
                    ((OnRequestPermissionsResultCallback) activity).onRequestPermissionsResult(i, strArr, iArr);
                }
            });
        }
    }

    public static void setEnterSharedElementCallback(Activity activity, SharedElementCallback sharedElementCallback) {
        if (Build.VERSION.SDK_INT >= 23) {
            ActivityCompatApi23.setEnterSharedElementCallback(activity, createCallback23(sharedElementCallback));
        } else if (Build.VERSION.SDK_INT < 21) {
        } else {
            ActivityCompatApi21.setEnterSharedElementCallback(activity, createCallback(sharedElementCallback));
        }
    }

    public static void setExitSharedElementCallback(Activity activity, SharedElementCallback sharedElementCallback) {
        if (Build.VERSION.SDK_INT >= 23) {
            ActivityCompatApi23.setExitSharedElementCallback(activity, createCallback23(sharedElementCallback));
        } else if (Build.VERSION.SDK_INT < 21) {
        } else {
            ActivityCompatApi21.setExitSharedElementCallback(activity, createCallback(sharedElementCallback));
        }
    }

    public static boolean shouldShowRequestPermissionRationale(@NonNull Activity activity, @NonNull String str) {
        return Build.VERSION.SDK_INT >= 23 ? ActivityCompatApi23.shouldShowRequestPermissionRationale(activity, str) : false;
    }

    public static void startActivityForResult(Activity activity, Intent intent, int i, @Nullable Bundle bundle) {
        if (Build.VERSION.SDK_INT >= 16) {
            ActivityCompatJB.startActivityForResult(activity, intent, i, bundle);
        } else {
            activity.startActivityForResult(intent, i);
        }
    }

    public static void startIntentSenderForResult(Activity activity, IntentSender intentSender, int i, Intent intent, int i2, int i3, int i4, @Nullable Bundle bundle) throws IntentSender.SendIntentException {
        if (Build.VERSION.SDK_INT >= 16) {
            ActivityCompatJB.startIntentSenderForResult(activity, intentSender, i, intent, i2, i3, i4, bundle);
        } else {
            activity.startIntentSenderForResult(intentSender, i, intent, i2, i3, i4);
        }
    }

    public static void startPostponedEnterTransition(Activity activity) {
        if (Build.VERSION.SDK_INT >= 21) {
            ActivityCompatApi21.startPostponedEnterTransition(activity);
        }
    }
}
