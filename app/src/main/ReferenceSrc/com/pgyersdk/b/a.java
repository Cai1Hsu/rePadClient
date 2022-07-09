package com.pgyersdk.b;

import android.app.Activity;
import android.content.Context;
import android.os.AsyncTask;
import android.provider.Settings;
import com.pgyersdk.c.g;
import com.pgyersdk.c.k;
import com.pgyersdk.c.m;
import com.pgyersdk.update.UpdateManagerListener;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Locale;
import org.apache.http.message.BasicNameValuePair;

/* loaded from: classes.jar:com/pgyersdk/b/a.class */
public class a extends AsyncTask {
    protected String a;
    protected String b;
    protected UpdateManagerListener c;
    private Context d;
    private long e = 0;

    public a(Activity activity, String str, String str2, UpdateManagerListener updateManagerListener) {
        this.a = null;
        this.b = null;
        this.d = null;
        this.b = str2;
        this.a = str;
        this.c = updateManagerListener;
        activity = activity == null ? null : activity;
        if (activity != null) {
            this.d = activity.getApplicationContext();
            com.pgyersdk.a.a.a(activity);
        }
    }

    private static String b(String str) {
        String str2;
        try {
            str2 = URLEncoder.encode(str, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            str2 = "";
        }
        return str2;
    }

    public void a() {
        this.d = null;
    }

    public final void a(Activity activity) {
        if (activity == null) {
            activity = null;
        }
        if (activity != null) {
            this.d = activity.getApplicationContext();
            com.pgyersdk.a.a.a(activity);
        }
    }

    /* renamed from: a */
    public void onPostExecute(String str) {
        if (!m.a(str)) {
            if (this.c == null) {
                return;
            }
            this.c.onNoUpdateAvailable();
        } else if (this.c == null) {
        } else {
            UpdateManagerListener updateManagerListener = this.c;
            int parseInt = Integer.parseInt(com.pgyersdk.a.a.b);
            StringBuilder sb = new StringBuilder();
            sb.append(this.a);
            sb.append("apiv1/update/check");
            sb.append("?agId=" + (this.b != null ? this.b : this.d.getPackageName()));
            sb.append("&version_code=" + parseInt);
            sb.append("&_api_key=305092bc73c180b55c26012a94809131");
            sb.append("&format=apk");
            if (Settings.Secure.getString(this.d.getContentResolver(), "android_id") != null) {
                sb.append("&udid=" + b(Settings.Secure.getString(this.d.getContentResolver(), "android_id")));
            }
            sb.append("&os=Android");
            sb.append("&os_version=" + b(com.pgyersdk.a.a.e));
            sb.append("&device=" + b(com.pgyersdk.a.a.f));
            sb.append("&oem=" + b(com.pgyersdk.a.a.g));
            sb.append("&app_version=" + b(com.pgyersdk.a.a.b));
            sb.append("&sdk=" + b("PgyerSDK"));
            sb.append("&sdk_version=" + b("1.0.0"));
            sb.append("&lang=" + b(Locale.getDefault().getLanguage()));
            sb.append("&usage_time=" + this.e);
            updateManagerListener.onUpdateAvailable(str, sb.toString());
        }
    }

    protected void b() {
        this.a = null;
        this.b = null;
    }

    @Override // android.os.AsyncTask
    protected /* synthetic */ Object doInBackground(Object... objArr) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("agKey", com.pgyersdk.a.a.k));
        arrayList.add(new BasicNameValuePair("versionNo", com.pgyersdk.a.a.b));
        arrayList.add(new BasicNameValuePair("buildNo", k.a(this.d, "buildNo")));
        arrayList.add(new BasicNameValuePair("_api_key", "305092bc73c180b55c26012a94809131"));
        return g.a("http://www.pgyer.com/apiv1/update/check", arrayList);
    }
}
