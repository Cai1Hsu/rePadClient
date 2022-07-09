package android.support.v4.text;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Locale;

@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.jar:android/support/v4/text/ICUCompatIcs.class */
class ICUCompatIcs {
    private static final String TAG = "ICUCompatIcs";
    private static Method sAddLikelySubtagsMethod;
    private static Method sGetScriptMethod;

    static {
        try {
            Class<?> cls = Class.forName("libcore.icu.ICU");
            if (cls == null) {
                return;
            }
            sGetScriptMethod = cls.getMethod("getScript", String.class);
            sAddLikelySubtagsMethod = cls.getMethod("addLikelySubtags", String.class);
        } catch (Exception e) {
            sGetScriptMethod = null;
            sAddLikelySubtagsMethod = null;
            Log.w(TAG, e);
        }
    }

    ICUCompatIcs() {
    }

    private static String addLikelySubtags(Locale locale) {
        String locale2 = locale.toString();
        try {
            if (sAddLikelySubtagsMethod != null) {
                locale2 = (String) sAddLikelySubtagsMethod.invoke(null, locale2);
            }
        } catch (IllegalAccessException e) {
            Log.w(TAG, e);
        } catch (InvocationTargetException e2) {
            Log.w(TAG, e2);
        }
        return locale2;
    }

    private static String getScript(String str) {
        String str2;
        try {
        } catch (IllegalAccessException e) {
            Log.w(TAG, e);
        } catch (InvocationTargetException e2) {
            Log.w(TAG, e2);
        }
        if (sGetScriptMethod != null) {
            str2 = (String) sGetScriptMethod.invoke(null, str);
            return str2;
        }
        str2 = null;
        return str2;
    }

    public static String maximizeAndGetScript(Locale locale) {
        String addLikelySubtags = addLikelySubtags(locale);
        return addLikelySubtags != null ? getScript(addLikelySubtags) : null;
    }
}
