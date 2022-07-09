package android.support.v4.app;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.PendingIntent;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;
import android.support.v4.util.Pair;
import android.view.View;

/* loaded from: classes.jar:android/support/v4/app/ActivityOptionsCompat.class */
public class ActivityOptionsCompat {
    public static final String EXTRA_USAGE_TIME_REPORT = "android.activity.usage_time";
    public static final String EXTRA_USAGE_TIME_REPORT_PACKAGES = "android.usage_time_packages";

    @RequiresApi(21)
    @TargetApi(21)
    /* loaded from: classes.jar:android/support/v4/app/ActivityOptionsCompat$ActivityOptionsImpl21.class */
    private static class ActivityOptionsImpl21 extends ActivityOptionsCompat {
        private final ActivityOptionsCompat21 mImpl;

        ActivityOptionsImpl21(ActivityOptionsCompat21 activityOptionsCompat21) {
            this.mImpl = activityOptionsCompat21;
        }

        @Override // android.support.v4.app.ActivityOptionsCompat
        public Bundle toBundle() {
            return this.mImpl.toBundle();
        }

        @Override // android.support.v4.app.ActivityOptionsCompat
        public void update(ActivityOptionsCompat activityOptionsCompat) {
            if (activityOptionsCompat instanceof ActivityOptionsImpl21) {
                this.mImpl.update(((ActivityOptionsImpl21) activityOptionsCompat).mImpl);
            }
        }
    }

    @RequiresApi(23)
    @TargetApi(23)
    /* loaded from: classes.jar:android/support/v4/app/ActivityOptionsCompat$ActivityOptionsImpl23.class */
    private static class ActivityOptionsImpl23 extends ActivityOptionsCompat {
        private final ActivityOptionsCompat23 mImpl;

        ActivityOptionsImpl23(ActivityOptionsCompat23 activityOptionsCompat23) {
            this.mImpl = activityOptionsCompat23;
        }

        @Override // android.support.v4.app.ActivityOptionsCompat
        public void requestUsageTimeReport(PendingIntent pendingIntent) {
            this.mImpl.requestUsageTimeReport(pendingIntent);
        }

        @Override // android.support.v4.app.ActivityOptionsCompat
        public Bundle toBundle() {
            return this.mImpl.toBundle();
        }

        @Override // android.support.v4.app.ActivityOptionsCompat
        public void update(ActivityOptionsCompat activityOptionsCompat) {
            if (activityOptionsCompat instanceof ActivityOptionsImpl23) {
                this.mImpl.update(((ActivityOptionsImpl23) activityOptionsCompat).mImpl);
            }
        }
    }

    @RequiresApi(24)
    @TargetApi(24)
    /* loaded from: classes.jar:android/support/v4/app/ActivityOptionsCompat$ActivityOptionsImpl24.class */
    private static class ActivityOptionsImpl24 extends ActivityOptionsCompat {
        private final ActivityOptionsCompat24 mImpl;

        ActivityOptionsImpl24(ActivityOptionsCompat24 activityOptionsCompat24) {
            this.mImpl = activityOptionsCompat24;
        }

        @Override // android.support.v4.app.ActivityOptionsCompat
        public Rect getLaunchBounds() {
            return this.mImpl.getLaunchBounds();
        }

        @Override // android.support.v4.app.ActivityOptionsCompat
        public void requestUsageTimeReport(PendingIntent pendingIntent) {
            this.mImpl.requestUsageTimeReport(pendingIntent);
        }

        @Override // android.support.v4.app.ActivityOptionsCompat
        public ActivityOptionsCompat setLaunchBounds(@Nullable Rect rect) {
            return new ActivityOptionsImpl24(this.mImpl.setLaunchBounds(rect));
        }

        @Override // android.support.v4.app.ActivityOptionsCompat
        public Bundle toBundle() {
            return this.mImpl.toBundle();
        }

        @Override // android.support.v4.app.ActivityOptionsCompat
        public void update(ActivityOptionsCompat activityOptionsCompat) {
            if (activityOptionsCompat instanceof ActivityOptionsImpl24) {
                this.mImpl.update(((ActivityOptionsImpl24) activityOptionsCompat).mImpl);
            }
        }
    }

    @RequiresApi(16)
    @TargetApi(16)
    /* loaded from: classes.jar:android/support/v4/app/ActivityOptionsCompat$ActivityOptionsImplJB.class */
    private static class ActivityOptionsImplJB extends ActivityOptionsCompat {
        private final ActivityOptionsCompatJB mImpl;

        ActivityOptionsImplJB(ActivityOptionsCompatJB activityOptionsCompatJB) {
            this.mImpl = activityOptionsCompatJB;
        }

        @Override // android.support.v4.app.ActivityOptionsCompat
        public Bundle toBundle() {
            return this.mImpl.toBundle();
        }

        @Override // android.support.v4.app.ActivityOptionsCompat
        public void update(ActivityOptionsCompat activityOptionsCompat) {
            if (activityOptionsCompat instanceof ActivityOptionsImplJB) {
                this.mImpl.update(((ActivityOptionsImplJB) activityOptionsCompat).mImpl);
            }
        }
    }

    protected ActivityOptionsCompat() {
    }

    public static ActivityOptionsCompat makeBasic() {
        return Build.VERSION.SDK_INT >= 24 ? new ActivityOptionsImpl24(ActivityOptionsCompat24.makeBasic()) : Build.VERSION.SDK_INT >= 23 ? new ActivityOptionsImpl23(ActivityOptionsCompat23.makeBasic()) : new ActivityOptionsCompat();
    }

    public static ActivityOptionsCompat makeClipRevealAnimation(View view, int i, int i2, int i3, int i4) {
        return Build.VERSION.SDK_INT >= 24 ? new ActivityOptionsImpl24(ActivityOptionsCompat24.makeClipRevealAnimation(view, i, i2, i3, i4)) : Build.VERSION.SDK_INT >= 23 ? new ActivityOptionsImpl23(ActivityOptionsCompat23.makeClipRevealAnimation(view, i, i2, i3, i4)) : new ActivityOptionsCompat();
    }

    public static ActivityOptionsCompat makeCustomAnimation(Context context, int i, int i2) {
        return Build.VERSION.SDK_INT >= 24 ? new ActivityOptionsImpl24(ActivityOptionsCompat24.makeCustomAnimation(context, i, i2)) : Build.VERSION.SDK_INT >= 23 ? new ActivityOptionsImpl23(ActivityOptionsCompat23.makeCustomAnimation(context, i, i2)) : Build.VERSION.SDK_INT >= 21 ? new ActivityOptionsImpl21(ActivityOptionsCompat21.makeCustomAnimation(context, i, i2)) : Build.VERSION.SDK_INT >= 16 ? new ActivityOptionsImplJB(ActivityOptionsCompatJB.makeCustomAnimation(context, i, i2)) : new ActivityOptionsCompat();
    }

    public static ActivityOptionsCompat makeScaleUpAnimation(View view, int i, int i2, int i3, int i4) {
        return Build.VERSION.SDK_INT >= 24 ? new ActivityOptionsImpl24(ActivityOptionsCompat24.makeScaleUpAnimation(view, i, i2, i3, i4)) : Build.VERSION.SDK_INT >= 23 ? new ActivityOptionsImpl23(ActivityOptionsCompat23.makeScaleUpAnimation(view, i, i2, i3, i4)) : Build.VERSION.SDK_INT >= 21 ? new ActivityOptionsImpl21(ActivityOptionsCompat21.makeScaleUpAnimation(view, i, i2, i3, i4)) : Build.VERSION.SDK_INT >= 16 ? new ActivityOptionsImplJB(ActivityOptionsCompatJB.makeScaleUpAnimation(view, i, i2, i3, i4)) : new ActivityOptionsCompat();
    }

    public static ActivityOptionsCompat makeSceneTransitionAnimation(Activity activity, View view, String str) {
        return Build.VERSION.SDK_INT >= 24 ? new ActivityOptionsImpl24(ActivityOptionsCompat24.makeSceneTransitionAnimation(activity, view, str)) : Build.VERSION.SDK_INT >= 23 ? new ActivityOptionsImpl23(ActivityOptionsCompat23.makeSceneTransitionAnimation(activity, view, str)) : Build.VERSION.SDK_INT >= 21 ? new ActivityOptionsImpl21(ActivityOptionsCompat21.makeSceneTransitionAnimation(activity, view, str)) : new ActivityOptionsCompat();
    }

    public static ActivityOptionsCompat makeSceneTransitionAnimation(Activity activity, Pair<View, String>... pairArr) {
        ActivityOptionsImpl24 activityOptionsCompat;
        if (Build.VERSION.SDK_INT >= 21) {
            View[] viewArr = null;
            String[] strArr = null;
            if (pairArr != null) {
                View[] viewArr2 = new View[pairArr.length];
                String[] strArr2 = new String[pairArr.length];
                int i = 0;
                while (true) {
                    strArr = strArr2;
                    viewArr = viewArr2;
                    if (i >= pairArr.length) {
                        break;
                    }
                    viewArr2[i] = pairArr[i].first;
                    strArr2[i] = pairArr[i].second;
                    i++;
                }
            }
            activityOptionsCompat = Build.VERSION.SDK_INT >= 24 ? new ActivityOptionsImpl24(ActivityOptionsCompat24.makeSceneTransitionAnimation(activity, viewArr, strArr)) : Build.VERSION.SDK_INT >= 23 ? new ActivityOptionsImpl23(ActivityOptionsCompat23.makeSceneTransitionAnimation(activity, viewArr, strArr)) : new ActivityOptionsImpl21(ActivityOptionsCompat21.makeSceneTransitionAnimation(activity, viewArr, strArr));
        } else {
            activityOptionsCompat = new ActivityOptionsCompat();
        }
        return activityOptionsCompat;
    }

    public static ActivityOptionsCompat makeTaskLaunchBehind() {
        return Build.VERSION.SDK_INT >= 24 ? new ActivityOptionsImpl24(ActivityOptionsCompat24.makeTaskLaunchBehind()) : Build.VERSION.SDK_INT >= 23 ? new ActivityOptionsImpl23(ActivityOptionsCompat23.makeTaskLaunchBehind()) : Build.VERSION.SDK_INT >= 21 ? new ActivityOptionsImpl21(ActivityOptionsCompat21.makeTaskLaunchBehind()) : new ActivityOptionsCompat();
    }

    public static ActivityOptionsCompat makeThumbnailScaleUpAnimation(View view, Bitmap bitmap, int i, int i2) {
        return Build.VERSION.SDK_INT >= 24 ? new ActivityOptionsImpl24(ActivityOptionsCompat24.makeThumbnailScaleUpAnimation(view, bitmap, i, i2)) : Build.VERSION.SDK_INT >= 23 ? new ActivityOptionsImpl23(ActivityOptionsCompat23.makeThumbnailScaleUpAnimation(view, bitmap, i, i2)) : Build.VERSION.SDK_INT >= 21 ? new ActivityOptionsImpl21(ActivityOptionsCompat21.makeThumbnailScaleUpAnimation(view, bitmap, i, i2)) : Build.VERSION.SDK_INT >= 16 ? new ActivityOptionsImplJB(ActivityOptionsCompatJB.makeThumbnailScaleUpAnimation(view, bitmap, i, i2)) : new ActivityOptionsCompat();
    }

    @Nullable
    public Rect getLaunchBounds() {
        return null;
    }

    public void requestUsageTimeReport(PendingIntent pendingIntent) {
    }

    public ActivityOptionsCompat setLaunchBounds(@Nullable Rect rect) {
        return null;
    }

    public Bundle toBundle() {
        return null;
    }

    public void update(ActivityOptionsCompat activityOptionsCompat) {
    }
}
