package com.pgyersdk.b;

import android.app.ProgressDialog;
import android.content.Context;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.Message;
import com.pgyersdk.c.l;
import com.pgyersdk.c.m;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.message.BasicNameValuePair;
import org.jivesoftware.smack.packet.PrivacyItem;
import org.jivesoftware.smackx.packet.JingleContent;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.jar:com/pgyersdk/b/e.class */
public final class e extends AsyncTask {
    private Context a;
    private Handler b;
    private String c;
    private String d;
    private List e;
    private String f;
    private ProgressDialog g;
    private boolean h = true;
    private int i = -1;

    public e(Context context, String str, String str2, List list, String str3, Handler handler) {
        this.a = context;
        this.c = str;
        this.d = str2;
        this.e = list;
        this.f = str3;
        this.b = handler;
        if (context != null) {
            com.pgyersdk.a.a.a(context);
        }
    }

    private String a(HttpClient httpClient) {
        String str;
        HttpPut httpPut;
        HttpResponse execute;
        String readLine;
        HttpPost httpPost = null;
        try {
            ArrayList arrayList = new ArrayList();
            arrayList.add(new BasicNameValuePair("agKey", com.pgyersdk.a.a.k));
            arrayList.add(new BasicNameValuePair(PrivacyItem.PrivacyRule.SUBSCRIPTION_FROM, com.pgyersdk.a.a.f));
            arrayList.add(new BasicNameValuePair(JingleContent.NODENAME, this.d));
            arrayList.add(new BasicNameValuePair("_api_key", "305092bc73c180b55c26012a94809131"));
            UrlEncodedFormEntity urlEncodedFormEntity = new UrlEncodedFormEntity(arrayList, "UTF-8");
            urlEncodedFormEntity.setContentEncoding("UTF-8");
            if (!m.a(this.f)) {
                this.c = String.valueOf(this.c) + this.f + "/";
                httpPut = new HttpPut(this.c);
            } else {
                httpPost = new HttpPost(this.c);
                httpPut = null;
            }
            if (httpPut != null) {
                httpPut.setEntity(urlEncodedFormEntity);
                execute = httpClient.execute(httpPut);
            } else {
                httpPost.setEntity(urlEncodedFormEntity);
                execute = httpClient.execute(httpPost);
            }
            str = "";
            if (execute != null) {
                str = "";
                if (execute.getStatusLine().getStatusCode() == 200) {
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(execute.getEntity().getContent(), "UTF-8"), 8);
                    StringBuilder sb = new StringBuilder();
                    while (true) {
                        if (bufferedReader.readLine() == null) {
                            break;
                        }
                        sb.append(String.valueOf(readLine) + "\n");
                    }
                    str = sb.toString();
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            str = "";
        } catch (ClientProtocolException e2) {
            e2.printStackTrace();
            str = "";
        } catch (IOException e3) {
            e3.printStackTrace();
            str = "";
        }
        return str;
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[MOVE]}, finally: {[MOVE, MOVE, INVOKE, INVOKE, INVOKE, MOVE_EXCEPTION, MOVE, INVOKE, INVOKE, INVOKE, MOVE_EXCEPTION, IF] complete} */
    private String b(HttpClient httpClient) {
        String str;
        HttpPost httpPost;
        HttpPut httpPut;
        HttpResponse execute;
        String str2;
        InputStream inputStream;
        String readLine;
        InputStream inputStream2 = null;
        InputStream inputStream3 = null;
        InputStream inputStream4 = null;
        InputStream inputStream5 = null;
        try {
            try {
                ArrayList<NameValuePair> arrayList = new ArrayList();
                arrayList.add(new BasicNameValuePair("agKey", com.pgyersdk.a.a.k));
                arrayList.add(new BasicNameValuePair(PrivacyItem.PrivacyRule.SUBSCRIPTION_FROM, com.pgyersdk.a.a.f));
                arrayList.add(new BasicNameValuePair(JingleContent.NODENAME, this.d));
                arrayList.add(new BasicNameValuePair("_api_key", "305092bc73c180b55c26012a94809131"));
                l lVar = new l();
                lVar.b();
                for (NameValuePair nameValuePair : arrayList) {
                    lVar.a(nameValuePair.getName(), nameValuePair.getValue());
                }
                int i = 0;
                while (i < this.e.size()) {
                    String str3 = (String) this.e.get(i);
                    lVar.a("image[]", str3.substring(str3.lastIndexOf("/") + 1), new FileInputStream(str3), i == this.e.size() - 1);
                    i++;
                }
                lVar.c();
                if (!m.a(this.f)) {
                    this.c = String.valueOf(this.c) + this.f + "/";
                    httpPut = new HttpPut(this.c);
                    httpPost = null;
                } else {
                    httpPost = new HttpPost(this.c);
                    httpPut = null;
                }
                if (httpPut != null) {
                    httpPut.setHeader("Content-type", "multipart/form-data; boundary=" + lVar.a());
                    httpPut.setEntity(lVar);
                    execute = httpClient.execute(httpPut);
                } else {
                    httpPost.setHeader("Content-type", "multipart/form-data; boundary=" + lVar.a());
                    httpPost.setEntity(lVar);
                    execute = httpClient.execute(httpPost);
                }
                if (execute == null || execute.getStatusLine().getStatusCode() != 200) {
                    str2 = "";
                    inputStream = null;
                } else {
                    InputStream content = execute.getEntity().getContent();
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(content, "UTF-8"), 8);
                    StringBuilder sb = new StringBuilder();
                    while (true) {
                        if (bufferedReader.readLine() == null) {
                            break;
                        }
                        sb.append(String.valueOf(readLine) + "\n");
                    }
                    inputStream2 = content;
                    inputStream3 = content;
                    inputStream4 = content;
                    inputStream5 = content;
                    str2 = sb.toString();
                    inputStream = content;
                }
                str = str2;
                if (inputStream != null) {
                    try {
                        inputStream.close();
                        str = str2;
                    } catch (IOException e) {
                        e.printStackTrace();
                        str = str2;
                    }
                }
            } catch (Throwable th) {
                if (inputStream5 != null) {
                    try {
                        inputStream5.close();
                    } catch (IOException e2) {
                        e2.printStackTrace();
                    }
                }
                throw th;
            }
        } catch (UnsupportedEncodingException e3) {
            e3.printStackTrace();
            if (inputStream2 != null) {
                try {
                    inputStream2.close();
                    str = "";
                } catch (IOException e4) {
                    e4.printStackTrace();
                    str = "";
                }
            }
            str = "";
        } catch (ClientProtocolException e5) {
            e5.printStackTrace();
            if (inputStream3 != null) {
                try {
                    inputStream3.close();
                    str = "";
                } catch (IOException e6) {
                    e6.printStackTrace();
                    str = "";
                }
            }
            str = "";
        } catch (IOException e7) {
            e7.printStackTrace();
            if (inputStream4 != null) {
                try {
                    inputStream4.close();
                    str = "";
                } catch (IOException e8) {
                    e8.printStackTrace();
                    str = "";
                }
            }
            str = "";
        }
        return str;
    }

    public final void a() {
        this.h = true;
    }

    @Override // android.os.AsyncTask
    protected final /* synthetic */ Object doInBackground(Object... objArr) {
        HttpClient b = com.pgyersdk.c.b.a().b();
        return this.e.isEmpty() ? a(b) : b(b);
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:15:0x0047 -> B:20:0x0013). Please submit an issue!!! */
    @Override // android.os.AsyncTask
    protected final /* synthetic */ void onPostExecute(Object obj) {
        String str = (String) obj;
        if (this.g != null) {
            try {
                this.g.dismiss();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        try {
            Message message = new Message();
            if (m.a(str)) {
                message.what = 20002;
            } else if (new JSONObject(str).getInt("code") == 0) {
                message.what = 20001;
            } else {
                message.what = 20002;
            }
            this.b.sendMessage(message);
        } catch (JSONException e2) {
            Message message2 = new Message();
            message2.what = 20002;
            this.b.sendMessage(message2);
        }
    }

    @Override // android.os.AsyncTask
    protected final void onPreExecute() {
        if ((this.g == null || !this.g.isShowing()) && this.h) {
            this.g = ProgressDialog.show(this.a, "", "正在发送反馈...", true, false);
        }
    }
}
