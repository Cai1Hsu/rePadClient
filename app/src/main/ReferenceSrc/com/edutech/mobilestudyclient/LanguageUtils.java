package com.edutech.mobilestudyclient;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.LocaleList;
import android.util.DisplayMetrics;
import java.util.Locale;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class LanguageUtils {
    public static Context attachBaseContext(Context context, String language) {
        if (Build.VERSION.SDK_INT >= 24) {
            return updateResources(context, language);
        }
        return context;
    }

    public static void SetLanguage(Context context, String newLanguage) {
        Resources resources = context.getResources();
        Configuration configuration = resources.getConfiguration();
        Locale locale = getLocaleByLanguage(newLanguage);
        if (Build.VERSION.SDK_INT >= 17) {
            configuration.setLocale(locale);
        } else {
            configuration.locale = locale;
        }
        DisplayMetrics dm = resources.getDisplayMetrics();
        resources.updateConfiguration(configuration, dm);
    }

    private static Context updateResources(Context context, String language) {
        Resources resources = context.getResources();
        Locale locale = getLocaleByLanguage(language);
        Configuration configuration = resources.getConfiguration();
        configuration.setLocale(locale);
        configuration.setLocales(new LocaleList(locale));
        return context.createConfigurationContext(configuration);
    }

    private static Locale getLocaleByLanguage(String language) {
        return "en".equals(language) ? Locale.ENGLISH : Locale.SIMPLIFIED_CHINESE;
    }
}
