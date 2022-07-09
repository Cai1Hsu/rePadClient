package android.support.v4.app;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.support.annotation.Nullable;
import android.support.v4.content.IntentCompat;
import android.util.Log;

/* loaded from: classes.jar:android/support/v4/app/NavUtils.class */
public final class NavUtils {
    private static final NavUtilsImpl IMPL;
    public static final String PARENT_ACTIVITY = "android.support.PARENT_ACTIVITY";
    private static final String TAG = "NavUtils";

    /* loaded from: classes.jar:android/support/v4/app/NavUtils$NavUtilsImpl.class */
    interface NavUtilsImpl {
        Intent getParentActivityIntent(Activity activity);

        String getParentActivityName(Context context, ActivityInfo activityInfo);

        void navigateUpTo(Activity activity, Intent intent);

        boolean shouldUpRecreateTask(Activity activity, Intent intent);
    }

    /* loaded from: classes.jar:android/support/v4/app/NavUtils$NavUtilsImplBase.class */
    static class NavUtilsImplBase implements NavUtilsImpl {
        NavUtilsImplBase() {
        }

        @Override // android.support.v4.app.NavUtils.NavUtilsImpl
        public Intent getParentActivityIntent(Activity activity) {
            Intent intent;
            String parentActivityName = NavUtils.getParentActivityName(activity);
            if (parentActivityName == null) {
                intent = null;
            } else {
                ComponentName componentName = new ComponentName(activity, parentActivityName);
                try {
                    intent = NavUtils.getParentActivityName(activity, componentName) == null ? IntentCompat.makeMainActivity(componentName) : new Intent().setComponent(componentName);
                } catch (PackageManager.NameNotFoundException e) {
                    Log.e(NavUtils.TAG, "getParentActivityIntent: bad parentActivityName '" + parentActivityName + "' in manifest");
                    intent = null;
                }
            }
            return intent;
        }

        @Override // android.support.v4.app.NavUtils.NavUtilsImpl
        public String getParentActivityName(Context context, ActivityInfo activityInfo) {
            String str;
            if (activityInfo.metaData == null) {
                str = null;
            } else {
                String string = activityInfo.metaData.getString(NavUtils.PARENT_ACTIVITY);
                if (string == null) {
                    str = null;
                } else {
                    str = string;
                    if (string.charAt(0) == '.') {
                        str = context.getPackageName() + string;
                    }
                }
            }
            return str;
        }

        @Override // android.support.v4.app.NavUtils.NavUtilsImpl
        public void navigateUpTo(Activity activity, Intent intent) {
            intent.addFlags(67108864);
            activity.startActivity(intent);
            activity.finish();
        }

        @Override // android.support.v4.app.NavUtils.NavUtilsImpl
        public boolean shouldUpRecreateTask(Activity activity, Intent intent) {
            String action = activity.getIntent().getAction();
            return action != null && !action.equals("android.intent.action.MAIN");
        }
    }

    /* loaded from: classes.jar:android/support/v4/app/NavUtils$NavUtilsImplJB.class */
    static class NavUtilsImplJB extends NavUtilsImplBase {
        NavUtilsImplJB() {
        }

        @Override // android.support.v4.app.NavUtils.NavUtilsImplBase, android.support.v4.app.NavUtils.NavUtilsImpl
        public Intent getParentActivityIntent(Activity activity) {
            Intent parentActivityIntent = NavUtilsJB.getParentActivityIntent(activity);
            Intent intent = parentActivityIntent;
            if (parentActivityIntent == null) {
                intent = superGetParentActivityIntent(activity);
            }
            return intent;
        }

        @Override // android.support.v4.app.NavUtils.NavUtilsImplBase, android.support.v4.app.NavUtils.NavUtilsImpl
        public String getParentActivityName(Context context, ActivityInfo activityInfo) {
            String parentActivityName = NavUtilsJB.getParentActivityName(activityInfo);
            String str = parentActivityName;
            if (parentActivityName == null) {
                str = super.getParentActivityName(context, activityInfo);
            }
            return str;
        }

        @Override // android.support.v4.app.NavUtils.NavUtilsImplBase, android.support.v4.app.NavUtils.NavUtilsImpl
        public void navigateUpTo(Activity activity, Intent intent) {
            NavUtilsJB.navigateUpTo(activity, intent);
        }

        @Override // android.support.v4.app.NavUtils.NavUtilsImplBase, android.support.v4.app.NavUtils.NavUtilsImpl
        public boolean shouldUpRecreateTask(Activity activity, Intent intent) {
            return NavUtilsJB.shouldUpRecreateTask(activity, intent);
        }

        Intent superGetParentActivityIntent(Activity activity) {
            return super.getParentActivityIntent(activity);
        }
    }

    static {
        if (Build.VERSION.SDK_INT >= 16) {
            IMPL = new NavUtilsImplJB();
        } else {
            IMPL = new NavUtilsImplBase();
        }
    }

    private NavUtils() {
    }

    public static Intent getParentActivityIntent(Activity activity) {
        return IMPL.getParentActivityIntent(activity);
    }

    public static Intent getParentActivityIntent(Context context, ComponentName componentName) throws PackageManager.NameNotFoundException {
        Intent makeMainActivity;
        String parentActivityName = getParentActivityName(context, componentName);
        if (parentActivityName == null) {
            makeMainActivity = null;
        } else {
            ComponentName componentName2 = new ComponentName(componentName.getPackageName(), parentActivityName);
            makeMainActivity = getParentActivityName(context, componentName2) == null ? IntentCompat.makeMainActivity(componentName2) : new Intent().setComponent(componentName2);
        }
        return makeMainActivity;
    }

    public static Intent getParentActivityIntent(Context context, Class<?> cls) throws PackageManager.NameNotFoundException {
        Intent makeMainActivity;
        String parentActivityName = getParentActivityName(context, new ComponentName(context, cls));
        if (parentActivityName == null) {
            makeMainActivity = null;
        } else {
            ComponentName componentName = new ComponentName(context, parentActivityName);
            makeMainActivity = getParentActivityName(context, componentName) == null ? IntentCompat.makeMainActivity(componentName) : new Intent().setComponent(componentName);
        }
        return makeMainActivity;
    }

    @Nullable
    public static String getParentActivityName(Activity activity) {
        try {
            return getParentActivityName(activity, activity.getComponentName());
        } catch (PackageManager.NameNotFoundException e) {
            throw new IllegalArgumentException(e);
        }
    }

    @Nullable
    public static String getParentActivityName(Context context, ComponentName componentName) throws PackageManager.NameNotFoundException {
        return IMPL.getParentActivityName(context, context.getPackageManager().getActivityInfo(componentName, 128));
    }

    public static void navigateUpFromSameTask(Activity activity) {
        Intent parentActivityIntent = getParentActivityIntent(activity);
        if (parentActivityIntent == null) {
            throw new IllegalArgumentException("Activity " + activity.getClass().getSimpleName() + " does not have a parent activity name specified. (Did you forget to add the android.support.PARENT_ACTIVITY <meta-data>  element in your manifest?)");
        }
        navigateUpTo(activity, parentActivityIntent);
    }

    public static void navigateUpTo(Activity activity, Intent intent) {
        IMPL.navigateUpTo(activity, intent);
    }

    public static boolean shouldUpRecreateTask(Activity activity, Intent intent) {
        return IMPL.shouldUpRecreateTask(activity, intent);
    }
}
