package android.support.v4.text;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Locale;

@RequiresApi(23)
@TargetApi(23)
/* loaded from: classes.jar:android/support/v4/text/ICUCompatApi23.class */
class ICUCompatApi23 {
    private static final String TAG = "ICUCompatIcs";
    private static Method sAddLikelySubtagsMethod;

    static {
        try {
            sAddLikelySubtagsMethod = Class.forName("libcore.icu.ICU").getMethod("addLikelySubtags", Locale.class);
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
    }

    ICUCompatApi23() {
    }

    public static String maximizeAndGetScript(Locale locale) {
        String script;
        try {
            script = ((Locale) sAddLikelySubtagsMethod.invoke(null, locale)).getScript();
        } catch (IllegalAccessException e) {
            Log.w(TAG, e);
            script = locale.getScript();
            return script;
        } catch (InvocationTargetException e2) {
            Log.w(TAG, e2);
            script = locale.getScript();
            return script;
        }
        return script;
    }
}
