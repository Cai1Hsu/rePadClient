package com.edutech.mobilestudyclient;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.LocaleList;
import java.util.Locale;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/LanguageUtils.class */
public class LanguageUtils {
    public static void SetLanguage(Context context, String str) {
        Resources resources = context.getResources();
        Configuration configuration = resources.getConfiguration();
        Locale localeByLanguage = getLocaleByLanguage(str);
        if (Build.VERSION.SDK_INT >= 17) {
            configuration.setLocale(localeByLanguage);
        } else {
            configuration.locale = localeByLanguage;
        }
        resources.updateConfiguration(configuration, resources.getDisplayMetrics());
    }

    public static Context attachBaseContext(Context context, String str) {
        Context context2 = context;
        if (Build.VERSION.SDK_INT >= 24) {
            context2 = updateResources(context, str);
        }
        return context2;
    }

    private static Locale getLocaleByLanguage(String str) {
        return "en".equals(str) ? Locale.ENGLISH : Locale.SIMPLIFIED_CHINESE;
    }

    private static Context updateResources(Context context, String str) {
        Resources resources = context.getResources();
        Locale localeByLanguage = getLocaleByLanguage(str);
        Configuration configuration = resources.getConfiguration();
        configuration.setLocale(localeByLanguage);
        configuration.setLocales(new LocaleList(localeByLanguage));
        return context.createConfigurationContext(configuration);
    }
}
