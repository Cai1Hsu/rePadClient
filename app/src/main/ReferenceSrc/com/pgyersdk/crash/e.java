package com.pgyersdk.crash;

import android.os.AsyncTask;
import com.edutech.publicedu.log.LogHelp;
import com.pgyersdk.c.k;
import com.pgyersdk.c.m;
import java.util.ArrayList;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.jar:com/pgyersdk/crash/e.class */
final class e extends AsyncTask {
    e() {
    }

    @Override // android.os.AsyncTask
    protected final /* synthetic */ Object doInBackground(Object... objArr) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("agKey", com.pgyersdk.a.a.k));
        arrayList.add(new BasicNameValuePair("deviceId", com.pgyersdk.a.a.i));
        arrayList.add(new BasicNameValuePair("osType", LogHelp.TYPE_MYWORK));
        arrayList.add(new BasicNameValuePair("deviceName", com.pgyersdk.a.a.g));
        arrayList.add(new BasicNameValuePair("osVersion", com.pgyersdk.a.a.e));
        arrayList.add(new BasicNameValuePair("sdkVersion", "1.0.0"));
        arrayList.add(new BasicNameValuePair("_api_key", "305092bc73c180b55c26012a94809131"));
        return com.pgyersdk.c.g.a("http://www.pgyer.com/apiv1/sdkstat/install", arrayList);
    }

    @Override // android.os.AsyncTask
    protected final /* synthetic */ void onPostExecute(Object obj) {
        String str = (String) obj;
        super.onPostExecute(str);
        if (!m.a(str)) {
            try {
                if (!"0".equals(new JSONObject(str).getString("code"))) {
                    return;
                }
                k.a("install", LogHelp.TYPE_GUIDANCE);
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }
}
