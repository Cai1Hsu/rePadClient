package com.edutech.cloudclientsetting.activity;

import android.app.Activity;
import android.content.ContentValues;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import com.edutech.idauthentication.AppEnvironment;
import com.edutech.mobilestudyclient.util.My_md5;
import com.edutech.publicedu.log.LogHelp;
import com.launcher.activity.R;
import java.io.BufferedInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.zip.GZIPInputStream;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.tools.ant.MagicNames;
import org.jivesoftware.smackx.packet.JingleContent;
import org.jivesoftware.smackx.workgroup.packet.UserID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/DiscussActivity.class */
public class DiscussActivity extends Activity {
    private SimpleAdapter adapter;
    private List<HashMap<String, String>> contentList;
    private List<JSONObject> discussList;
    private ListView listView;
    private SqliteForDiscuss sqlite;
    private String TAG = "discuss";
    private String messageId = "";
    private String privatekey = "";
    private String ip = "";
    private String username = "";

    /* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync.class */
    class DiscussAsync extends AsyncTask<String, String, String> {
        HashMap<String, String> map;

        public DiscussAsync(HashMap<String, String> hashMap) {
            DiscussActivity.this = r4;
            this.map = hashMap;
        }

        public String doInBackground(String... strArr) {
            String str = "";
            String str2 = "";
            String str3 = "";
            String str4 = str2;
            String str5 = str3;
            String str6 = "";
            String str7 = str;
            if (this.map != null) {
                if (this.map.containsKey("keyword")) {
                    str2 = this.map.get("keyword");
                }
                if (this.map.containsKey("subjectid")) {
                    str = this.map.get("subjectid");
                }
                if (this.map.containsKey("page")) {
                    str3 = this.map.get("page");
                }
                str4 = str2;
                str5 = str3;
                str6 = "";
                str7 = str;
                if (this.map.containsKey("pagenum")) {
                    str6 = this.map.get("pagenum");
                    str7 = str;
                    str5 = str3;
                    str4 = str2;
                }
            }
            String str8 = "http://" + DiscussActivity.this.ip + "/api/interaction";
            String str9 = str8;
            if (!str4.equals("")) {
                str9 = str8;
                if (str4 != null) {
                    str9 = String.valueOf(str8) + "/keyword/" + str4;
                }
            }
            String str10 = str9;
            if (!str5.equals("")) {
                str10 = str9;
                if (str5 != null) {
                    str10 = String.valueOf(str9) + "/page/" + str5;
                }
            }
            String str11 = str10;
            if (!str7.equals("")) {
                str11 = str10;
                if (str7 != null) {
                    str11 = String.valueOf(str10) + "/subjectid/" + str7;
                }
            }
            String str12 = str11;
            if (!str6.equals("")) {
                str12 = str11;
                if (str6 != null) {
                    str12 = String.valueOf(str11) + "/pagenum/" + str6;
                }
            }
            try {
                String jsonStringFromGZIP = DiscussActivity.this.getJsonStringFromGZIP(new DefaultHttpClient().execute(DiscussActivity.this.HttpGet_Init(str12)));
                Log.e("updateresult", jsonStringFromGZIP);
                JSONObject jSONObject = new JSONObject(jsonStringFromGZIP);
                boolean z = jSONObject.getBoolean("status");
                int i = jSONObject.getInt("errorNum");
                if (!z && i != 0) {
                    return "";
                }
                DiscussActivity.this.initDiscuss(jSONObject.getJSONArray("data"));
                return "";
            } catch (Exception e) {
                e.printStackTrace();
                return "";
            }
        }

        public void onPostExecute(String str) {
            if (DiscussActivity.this.adapter != null) {
                DiscussActivity.this.adapter.notifyDataSetChanged();
            }
            if (DiscussActivity.this.messageId == null || DiscussActivity.this.messageId.equals("")) {
                return;
            }
            new DiscussDetailsAsync().execute("");
        }
    }

    /* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync.class */
    class DiscussDetailsAsync extends AsyncTask<String, String, String> {
        DiscussDetailsAsync() {
            DiscussActivity.this = r4;
        }

        public String doInBackground(String... strArr) {
            try {
                String jsonStringFromGZIP = DiscussActivity.this.getJsonStringFromGZIP(new DefaultHttpClient().execute(DiscussActivity.this.HttpGet_Init("http://" + DiscussActivity.this.ip + "/api/interaction/messageid/" + DiscussActivity.this.messageId)));
                Log.e("updateresult", jsonStringFromGZIP);
                JSONObject jSONObject = new JSONObject(jsonStringFromGZIP);
                boolean z = jSONObject.getBoolean("status");
                jSONObject.getInt("errorNum");
                if (!z) {
                }
                return "";
            } catch (Exception e) {
                e.printStackTrace();
                return "";
            }
        }

        public void onPostExecute(String str) {
            HashMap hashMap = new HashMap();
            HashMap hashMap2 = new HashMap();
            hashMap.put("type", LogHelp.TYPE_GUIDANCE);
            hashMap.put(JingleContent.NODENAME, "huan ying jia ru 讨论");
            hashMap2.put("type", LogHelp.TYPE_MYWORK);
            new DiscussReplyAsync(hashMap).execute("");
            new DiscussReplyAsync2().execute("");
        }
    }

    /* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync.class */
    class DiscussReplyAsync extends AsyncTask<String, String, String> {
        HashMap<String, String> map;

        public DiscussReplyAsync(HashMap<String, String> hashMap) {
            DiscussActivity.this = r4;
            this.map = hashMap;
        }

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x014d -> B:23:0x0107). Please submit an issue!!! */
        public String doInBackground(String... strArr) {
            String str = "http://" + DiscussActivity.this.ip + "/api/interaction/";
            String str2 = "";
            String str3 = "";
            String str4 = str2;
            if (this.map != null) {
                if (this.map.containsKey("type")) {
                    str2 = this.map.get("type");
                }
                str3 = "";
                str4 = str2;
                if (this.map.containsKey(JingleContent.NODENAME)) {
                    str3 = this.map.get(JingleContent.NODENAME);
                    str4 = str2;
                }
            }
            HttpPost HttpPost_Init = DiscussActivity.this.HttpPost_Init(str);
            Log.e(MagicNames.ANT_FILE_TYPE_URL, String.valueOf(str) + ",type:" + str4 + ",content:" + str3);
            try {
                MultipartEntity multipartEntity = new MultipartEntity();
                multipartEntity.addPart("messageid", new StringBody(DiscussActivity.this.messageId));
                if (str3 != null && !str3.equals("")) {
                    multipartEntity.addPart(JingleContent.NODENAME, new StringBody(str3, Charset.forName("UTF-8")));
                }
                if (str4 != null && !str4.equals("")) {
                    multipartEntity.addPart("type", new StringBody(str4));
                }
                HttpPost_Init.setEntity(multipartEntity);
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                String jsonStringFromGZIP = DiscussActivity.this.getJsonStringFromGZIP(new DefaultHttpClient().execute(HttpPost_Init));
                Log.e("updateresult", jsonStringFromGZIP);
                JSONObject jSONObject = new JSONObject(jsonStringFromGZIP);
                boolean z = jSONObject.getBoolean("status");
                jSONObject.getInt("errorNum");
                if (!z) {
                }
                return "";
            } catch (Exception e2) {
                e2.printStackTrace();
                return "";
            }
        }

        public void onPostExecute(String str) {
        }
    }

    /* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync2.class */
    class DiscussReplyAsync2 extends AsyncTask<String, String, String> {
        DiscussReplyAsync2() {
            DiscussActivity.this = r4;
        }

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:11:0x0098 -> B:4:0x0059). Please submit an issue!!! */
        public String doInBackground(String... strArr) {
            HttpPost HttpPost_Init = DiscussActivity.this.HttpPost_Init("http://" + DiscussActivity.this.ip + "/api/interaction/");
            try {
                MultipartEntity multipartEntity = new MultipartEntity();
                multipartEntity.addPart("messageid", new StringBody(DiscussActivity.this.messageId));
                multipartEntity.addPart("type", new StringBody(LogHelp.TYPE_MYWORK));
                HttpPost_Init.setEntity(multipartEntity);
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                String jsonStringFromGZIP = DiscussActivity.this.getJsonStringFromGZIP(new DefaultHttpClient().execute(HttpPost_Init));
                Log.e("updateresult", jsonStringFromGZIP);
                JSONObject jSONObject = new JSONObject(jsonStringFromGZIP);
                boolean z = jSONObject.getBoolean("status");
                jSONObject.getInt("errorNum");
                if (!z) {
                }
                return "";
            } catch (Exception e2) {
                e2.printStackTrace();
                return "";
            }
        }

        public void onPostExecute(String str) {
        }
    }

    /* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync.class */
    class DiscussSubjectsAsync extends AsyncTask<String, String, String> {
        DiscussSubjectsAsync() {
            DiscussActivity.this = r4;
        }

        public String doInBackground(String... strArr) {
            try {
                String jsonStringFromGZIP = DiscussActivity.this.getJsonStringFromGZIP(new DefaultHttpClient().execute(DiscussActivity.this.HttpGet_Init("http://" + DiscussActivity.this.ip + "/api/subject/")));
                Log.e("updateresult", jsonStringFromGZIP);
                JSONObject jSONObject = new JSONObject(jsonStringFromGZIP);
                boolean z = jSONObject.getBoolean("status");
                jSONObject.getInt("errorNum");
                Log.e("updateresult", "error:" + jSONObject.getString("errorInfo"));
                if (!z) {
                }
                return "";
            } catch (Exception e) {
                e.printStackTrace();
                return "";
            }
        }

        public void onPostExecute(String str) {
            if (DiscussActivity.this.adapter != null) {
                DiscussActivity.this.adapter.notifyDataSetChanged();
            }
            if (DiscussActivity.this.messageId == null || DiscussActivity.this.messageId.equals("")) {
                return;
            }
            new DiscussDetailsAsync().execute("");
        }
    }

    public HttpGet HttpGet_Init(String str) {
        HttpGet httpGet = new HttpGet(str);
        httpGet.addHeader("X-Edutech-Entity", this.username);
        long currentTimeMillis = System.currentTimeMillis();
        httpGet.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + My_md5.Md5(String.valueOf(currentTimeMillis) + this.username + this.privatekey));
        return httpGet;
    }

    public HttpPost HttpPost_Init(String str) {
        HttpPost httpPost = new HttpPost(str);
        httpPost.addHeader("X-Edutech-Entity", String.valueOf(this.username) + "+" + this.privatekey);
        Log.e(UserID.ELEMENT_NAME, String.valueOf(this.username) + "," + this.privatekey);
        long currentTimeMillis = System.currentTimeMillis();
        httpPost.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + My_md5.Md5(String.valueOf(currentTimeMillis) + this.username + this.privatekey));
        return httpPost;
    }

    public String getJsonStringFromGZIP(HttpResponse httpResponse) {
        String str;
        InputStream inputStream;
        try {
            if (httpResponse.getStatusLine().getStatusCode() == 200) {
                BufferedInputStream bufferedInputStream = new BufferedInputStream(httpResponse.getEntity().getContent());
                bufferedInputStream.mark(2);
                byte[] bArr = new byte[2];
                int read = bufferedInputStream.read(bArr);
                bufferedInputStream.reset();
                int i = getShort(bArr);
                if (read == -1 || i != 8075) {
                    Log.d(this.TAG, " not use GZIPInputStream");
                    inputStream = bufferedInputStream;
                } else {
                    Log.d(this.TAG, " use GZIPInputStream  ");
                    inputStream = new GZIPInputStream(bufferedInputStream);
                }
                InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
                char[] cArr = new char[100];
                StringBuffer stringBuffer = new StringBuffer();
                while (true) {
                    int read2 = inputStreamReader.read(cArr);
                    if (read2 <= 0) {
                        break;
                    }
                    stringBuffer.append(cArr, 0, read2);
                }
                str = stringBuffer.toString();
                bufferedInputStream.close();
                inputStreamReader.close();
            } else {
                Log.e(this.TAG, "与服务端连接失败。。。");
                Log.e(this.TAG, "ddddd=" + httpResponse.getStatusLine().getStatusCode());
                Log.e(this.TAG, "ddddd=" + httpResponse.getEntity());
                str = "";
            }
        } catch (Exception e) {
            Log.e(this.TAG, e.toString(), e);
            str = "";
        }
        Log.d(this.TAG, "getJsonStringFromGZIP net output : " + str);
        return str;
    }

    private int getShort(byte[] bArr) {
        return (bArr[0] << 8) | (bArr[1] & 255);
    }

    private void initDiscuss() {
        SharedPreferences sharedPreferences = getSharedPreferences("privatekey", 0);
        this.privatekey = sharedPreferences.getString("key", "");
        this.ip = sharedPreferences.getString("apihost", "");
        this.username = sharedPreferences.getString("name", "");
        this.sqlite = new SqliteForDiscuss(this);
    }

    public void initDiscuss(JSONArray jSONArray) {
        JSONException e;
        if (jSONArray == null || jSONArray.length() <= 0) {
            return;
        }
        this.discussList = new ArrayList();
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < jSONArray.length(); i++) {
            try {
                JSONObject jSONObject = jSONArray.getJSONObject(i);
                if (jSONObject != null) {
                    this.discussList.add(jSONObject);
                    ContentValues contentValues = new ContentValues();
                    try {
                        Log.e(this.TAG, jSONObject.toString());
                        String string = jSONObject.getString(JingleContent.NODENAME);
                        HashMap<String, String> hashMap = new HashMap<>();
                        hashMap.put(JingleContent.NODENAME, string);
                        this.contentList.add(hashMap);
                        this.messageId = jSONObject.getString("messageid");
                        if (!this.sqlite.containColums(SqliteForDiscuss.DISCUSS_TABLE, String.valueOf(SqliteForDiscuss.DISCUSS_MSGID) + "=? ", new String[]{this.messageId})) {
                            contentValues.put(SqliteForDiscuss.DISCUSS_AUTHOR, jSONObject.getString("createby"));
                            contentValues.put(SqliteForDiscuss.DISCUSS_CONTENT, jSONObject.getString(JingleContent.NODENAME));
                            contentValues.put(SqliteForDiscuss.DISCUSS_CTIME, jSONObject.getString(AppEnvironment.CreatTime));
                            contentValues.put(SqliteForDiscuss.DISCUSS_GOOD, Integer.valueOf(jSONObject.getInt("good")));
                            contentValues.put(SqliteForDiscuss.DISCUSS_ISGOOD, jSONObject.getString("isgood"));
                            contentValues.put(SqliteForDiscuss.DISCUSS_MSGID, jSONObject.getString("messageid"));
                            contentValues.put(SqliteForDiscuss.DISCUSS_READ, Integer.valueOf(jSONObject.getInt("isread")));
                            contentValues.put(SqliteForDiscuss.DISCUSS_REPLY, Integer.valueOf(jSONObject.getInt("reply")));
                            contentValues.put(SqliteForDiscuss.DISCUSS_SUBJECT, jSONObject.getString("subject"));
                            contentValues.put(SqliteForDiscuss.DISCUSS_SUBJID, jSONObject.getString("subjectid"));
                            contentValues.put(SqliteForDiscuss.DISCUSS_SUBNAME, jSONObject.getString("subjectname"));
                            arrayList.add(contentValues);
                            Log.e("add", "add:" + this.messageId);
                        }
                    } catch (JSONException e2) {
                        e = e2;
                        e.printStackTrace();
                    }
                }
            } catch (JSONException e3) {
                e = e3;
            }
        }
        Log.e("index", new StringBuilder(String.valueOf(this.sqlite.insertDiscuss(SqliteForDiscuss.DISCUSS_TABLE, arrayList))).toString());
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.discuss);
        initDiscuss();
        new DiscussSubjectsAsync().execute("");
        HashMap hashMap = new HashMap();
        this.contentList = new ArrayList();
        this.listView = (ListView) findViewById(R.id.discuss_list);
        this.adapter = new SimpleAdapter(this, this.contentList, R.layout.discuss_adapter, new String[]{JingleContent.NODENAME}, new int[]{R.id.discuss_adapter_web});
        this.listView.setAdapter((ListAdapter) this.adapter);
        new DiscussAsync(hashMap).execute("");
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        if (this.sqlite != null) {
            this.sqlite.close();
            this.sqlite = null;
            Log.e("sqlite", "sqlite closed");
        }
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i == 4) {
            finish();
        }
        return super.onKeyDown(i, keyEvent);
    }
}
