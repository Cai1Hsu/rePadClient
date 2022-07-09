package android.support.v4.text;

import android.os.Build;
import java.util.Locale;

/* loaded from: classes.jar:android/support/v4/text/ICUCompat.class */
public final class ICUCompat {
    private static final ICUCompatImpl IMPL;

    /* loaded from: classes.jar:android/support/v4/text/ICUCompat$ICUCompatImpl.class */
    interface ICUCompatImpl {
        String maximizeAndGetScript(Locale locale);
    }

    /* loaded from: classes.jar:android/support/v4/text/ICUCompat$ICUCompatImplBase.class */
    static class ICUCompatImplBase implements ICUCompatImpl {
        ICUCompatImplBase() {
        }

        @Override // android.support.v4.text.ICUCompat.ICUCompatImpl
        public String maximizeAndGetScript(Locale locale) {
            return null;
        }
    }

    /* loaded from: classes.jar:android/support/v4/text/ICUCompat$ICUCompatImplIcs.class */
    static class ICUCompatImplIcs implements ICUCompatImpl {
        ICUCompatImplIcs() {
        }

        @Override // android.support.v4.text.ICUCompat.ICUCompatImpl
        public String maximizeAndGetScript(Locale locale) {
            return ICUCompatIcs.maximizeAndGetScript(locale);
        }
    }

    /* loaded from: classes.jar:android/support/v4/text/ICUCompat$ICUCompatImplLollipop.class */
    static class ICUCompatImplLollipop implements ICUCompatImpl {
        ICUCompatImplLollipop() {
        }

        @Override // android.support.v4.text.ICUCompat.ICUCompatImpl
        public String maximizeAndGetScript(Locale locale) {
            return ICUCompatApi23.maximizeAndGetScript(locale);
        }
    }

    static {
        int i = Build.VERSION.SDK_INT;
        if (i >= 21) {
            IMPL = new ICUCompatImplLollipop();
        } else if (i >= 14) {
            IMPL = new ICUCompatImplIcs();
        } else {
            IMPL = new ICUCompatImplBase();
        }
    }

    private ICUCompat() {
    }

    public static String maximizeAndGetScript(Locale locale) {
        return IMPL.maximizeAndGetScript(locale);
    }
}
