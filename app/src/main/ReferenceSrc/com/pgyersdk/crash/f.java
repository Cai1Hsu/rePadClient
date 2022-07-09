package com.pgyersdk.crash;

import android.os.AsyncTask;
import com.edutech.publicedu.log.LogHelp;
import java.util.ArrayList;
import org.apache.http.message.BasicNameValuePair;

/* loaded from: classes.dex */
final class f extends AsyncTask {
    f() {
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
        return com.pgyersdk.c.g.a("http://www.pgyer.com/apiv1/sdkstat/launch", arrayList);
    }
}
