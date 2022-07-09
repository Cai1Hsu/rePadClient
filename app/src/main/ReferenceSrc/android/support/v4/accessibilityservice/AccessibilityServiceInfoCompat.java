package android.support.v4.accessibilityservice;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Build;

/* loaded from: classes.jar:android/support/v4/accessibilityservice/AccessibilityServiceInfoCompat.class */
public final class AccessibilityServiceInfoCompat {
    public static final int CAPABILITY_CAN_FILTER_KEY_EVENTS = 8;
    public static final int CAPABILITY_CAN_REQUEST_ENHANCED_WEB_ACCESSIBILITY = 4;
    public static final int CAPABILITY_CAN_REQUEST_TOUCH_EXPLORATION = 2;
    public static final int CAPABILITY_CAN_RETRIEVE_WINDOW_CONTENT = 1;
    public static final int DEFAULT = 1;
    public static final int FEEDBACK_ALL_MASK = -1;
    public static final int FEEDBACK_BRAILLE = 32;
    public static final int FLAG_INCLUDE_NOT_IMPORTANT_VIEWS = 2;
    public static final int FLAG_REPORT_VIEW_IDS = 16;
    public static final int FLAG_REQUEST_ENHANCED_WEB_ACCESSIBILITY = 8;
    public static final int FLAG_REQUEST_FILTER_KEY_EVENTS = 32;
    public static final int FLAG_REQUEST_TOUCH_EXPLORATION_MODE = 4;
    private static final AccessibilityServiceInfoVersionImpl IMPL;

    /* loaded from: classes.jar:android/support/v4/accessibilityservice/AccessibilityServiceInfoCompat$AccessibilityServiceInfoIcsImpl.class */
    static class AccessibilityServiceInfoIcsImpl extends AccessibilityServiceInfoStubImpl {
        AccessibilityServiceInfoIcsImpl() {
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoStubImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public boolean getCanRetrieveWindowContent(AccessibilityServiceInfo accessibilityServiceInfo) {
            return AccessibilityServiceInfoCompatIcs.getCanRetrieveWindowContent(accessibilityServiceInfo);
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoStubImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public int getCapabilities(AccessibilityServiceInfo accessibilityServiceInfo) {
            return getCanRetrieveWindowContent(accessibilityServiceInfo) ? 1 : 0;
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoStubImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public String getDescription(AccessibilityServiceInfo accessibilityServiceInfo) {
            return AccessibilityServiceInfoCompatIcs.getDescription(accessibilityServiceInfo);
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoStubImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public String getId(AccessibilityServiceInfo accessibilityServiceInfo) {
            return AccessibilityServiceInfoCompatIcs.getId(accessibilityServiceInfo);
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoStubImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public ResolveInfo getResolveInfo(AccessibilityServiceInfo accessibilityServiceInfo) {
            return AccessibilityServiceInfoCompatIcs.getResolveInfo(accessibilityServiceInfo);
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoStubImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public String getSettingsActivityName(AccessibilityServiceInfo accessibilityServiceInfo) {
            return AccessibilityServiceInfoCompatIcs.getSettingsActivityName(accessibilityServiceInfo);
        }
    }

    /* loaded from: classes.jar:android/support/v4/accessibilityservice/AccessibilityServiceInfoCompat$AccessibilityServiceInfoJellyBeanImpl.class */
    static class AccessibilityServiceInfoJellyBeanImpl extends AccessibilityServiceInfoIcsImpl {
        AccessibilityServiceInfoJellyBeanImpl() {
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoStubImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public String loadDescription(AccessibilityServiceInfo accessibilityServiceInfo, PackageManager packageManager) {
            return AccessibilityServiceInfoCompatJellyBean.loadDescription(accessibilityServiceInfo, packageManager);
        }
    }

    /* loaded from: classes.jar:android/support/v4/accessibilityservice/AccessibilityServiceInfoCompat$AccessibilityServiceInfoJellyBeanMr2Impl.class */
    static class AccessibilityServiceInfoJellyBeanMr2Impl extends AccessibilityServiceInfoJellyBeanImpl {
        AccessibilityServiceInfoJellyBeanMr2Impl() {
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoIcsImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoStubImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public int getCapabilities(AccessibilityServiceInfo accessibilityServiceInfo) {
            return AccessibilityServiceInfoCompatJellyBeanMr2.getCapabilities(accessibilityServiceInfo);
        }
    }

    /* loaded from: classes.jar:android/support/v4/accessibilityservice/AccessibilityServiceInfoCompat$AccessibilityServiceInfoStubImpl.class */
    static class AccessibilityServiceInfoStubImpl implements AccessibilityServiceInfoVersionImpl {
        AccessibilityServiceInfoStubImpl() {
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public boolean getCanRetrieveWindowContent(AccessibilityServiceInfo accessibilityServiceInfo) {
            return false;
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public int getCapabilities(AccessibilityServiceInfo accessibilityServiceInfo) {
            return 0;
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public String getDescription(AccessibilityServiceInfo accessibilityServiceInfo) {
            return null;
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public String getId(AccessibilityServiceInfo accessibilityServiceInfo) {
            return null;
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public ResolveInfo getResolveInfo(AccessibilityServiceInfo accessibilityServiceInfo) {
            return null;
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public String getSettingsActivityName(AccessibilityServiceInfo accessibilityServiceInfo) {
            return null;
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public String loadDescription(AccessibilityServiceInfo accessibilityServiceInfo, PackageManager packageManager) {
            return null;
        }
    }

    /* loaded from: classes.jar:android/support/v4/accessibilityservice/AccessibilityServiceInfoCompat$AccessibilityServiceInfoVersionImpl.class */
    interface AccessibilityServiceInfoVersionImpl {
        boolean getCanRetrieveWindowContent(AccessibilityServiceInfo accessibilityServiceInfo);

        int getCapabilities(AccessibilityServiceInfo accessibilityServiceInfo);

        String getDescription(AccessibilityServiceInfo accessibilityServiceInfo);

        String getId(AccessibilityServiceInfo accessibilityServiceInfo);

        ResolveInfo getResolveInfo(AccessibilityServiceInfo accessibilityServiceInfo);

        String getSettingsActivityName(AccessibilityServiceInfo accessibilityServiceInfo);

        String loadDescription(AccessibilityServiceInfo accessibilityServiceInfo, PackageManager packageManager);
    }

    static {
        if (Build.VERSION.SDK_INT >= 18) {
            IMPL = new AccessibilityServiceInfoJellyBeanMr2Impl();
        } else if (Build.VERSION.SDK_INT >= 16) {
            IMPL = new AccessibilityServiceInfoJellyBeanImpl();
        } else if (Build.VERSION.SDK_INT >= 14) {
            IMPL = new AccessibilityServiceInfoIcsImpl();
        } else {
            IMPL = new AccessibilityServiceInfoStubImpl();
        }
    }

    private AccessibilityServiceInfoCompat() {
    }

    public static String capabilityToString(int i) {
        String str;
        switch (i) {
            case 1:
                str = "CAPABILITY_CAN_RETRIEVE_WINDOW_CONTENT";
                break;
            case 2:
                str = "CAPABILITY_CAN_REQUEST_TOUCH_EXPLORATION";
                break;
            case 3:
            case 5:
            case 6:
            case 7:
            default:
                str = "UNKNOWN";
                break;
            case 4:
                str = "CAPABILITY_CAN_REQUEST_ENHANCED_WEB_ACCESSIBILITY";
                break;
            case 8:
                str = "CAPABILITY_CAN_FILTER_KEY_EVENTS";
                break;
        }
        return str;
    }

    public static String feedbackTypeToString(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        while (i > 0) {
            int numberOfTrailingZeros = 1 << Integer.numberOfTrailingZeros(i);
            i &= numberOfTrailingZeros ^ (-1);
            if (sb.length() > 1) {
                sb.append(", ");
            }
            switch (numberOfTrailingZeros) {
                case 1:
                    sb.append("FEEDBACK_SPOKEN");
                    break;
                case 2:
                    sb.append("FEEDBACK_HAPTIC");
                    break;
                case 4:
                    sb.append("FEEDBACK_AUDIBLE");
                    break;
                case 8:
                    sb.append("FEEDBACK_VISUAL");
                    break;
                case 16:
                    sb.append("FEEDBACK_GENERIC");
                    break;
            }
        }
        sb.append("]");
        return sb.toString();
    }

    public static String flagToString(int i) {
        String str;
        switch (i) {
            case 1:
                str = "DEFAULT";
                break;
            case 2:
                str = "FLAG_INCLUDE_NOT_IMPORTANT_VIEWS";
                break;
            case 4:
                str = "FLAG_REQUEST_TOUCH_EXPLORATION_MODE";
                break;
            case 8:
                str = "FLAG_REQUEST_ENHANCED_WEB_ACCESSIBILITY";
                break;
            case 16:
                str = "FLAG_REPORT_VIEW_IDS";
                break;
            case 32:
                str = "FLAG_REQUEST_FILTER_KEY_EVENTS";
                break;
            default:
                str = null;
                break;
        }
        return str;
    }

    public static boolean getCanRetrieveWindowContent(AccessibilityServiceInfo accessibilityServiceInfo) {
        return IMPL.getCanRetrieveWindowContent(accessibilityServiceInfo);
    }

    public static int getCapabilities(AccessibilityServiceInfo accessibilityServiceInfo) {
        return IMPL.getCapabilities(accessibilityServiceInfo);
    }

    public static String getDescription(AccessibilityServiceInfo accessibilityServiceInfo) {
        return IMPL.getDescription(accessibilityServiceInfo);
    }

    public static String getId(AccessibilityServiceInfo accessibilityServiceInfo) {
        return IMPL.getId(accessibilityServiceInfo);
    }

    public static ResolveInfo getResolveInfo(AccessibilityServiceInfo accessibilityServiceInfo) {
        return IMPL.getResolveInfo(accessibilityServiceInfo);
    }

    public static String getSettingsActivityName(AccessibilityServiceInfo accessibilityServiceInfo) {
        return IMPL.getSettingsActivityName(accessibilityServiceInfo);
    }

    public static String loadDescription(AccessibilityServiceInfo accessibilityServiceInfo, PackageManager packageManager) {
        return IMPL.loadDescription(accessibilityServiceInfo, packageManager);
    }
}
