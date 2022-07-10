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
import org.bson.BSON;
import org.jivesoftware.smackx.packet.JingleContent;
import org.jivesoftware.smackx.workgroup.packet.UserID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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

    static /* synthetic */ String access$5(DiscussActivity discussActivity) {
        return discussActivity.messageId;
    }

    static /* synthetic */ SimpleAdapter access$4(DiscussActivity discussActivity) {
        return discussActivity.adapter;
    }

    static /* synthetic */ String access$0(DiscussActivity discussActivity) {
        return discussActivity.ip;
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.discuss);
        initDiscuss();
        new DiscussSubjectsAsync().execute("");
        HashMap<String, String> map = new HashMap<>();
        this.contentList = new ArrayList();
        this.listView = (ListView) findViewById(R.id.discuss_list);
        this.adapter = new SimpleAdapter(this, this.contentList, R.layout.discuss_adapter, new String[]{JingleContent.NODENAME}, new int[]{R.id.discuss_adapter_web});
        this.listView.setAdapter((ListAdapter) this.adapter);
        new DiscussAsync(map).execute("");
    }

    private void initDiscuss() {
        SharedPreferences sharePre = getSharedPreferences("privatekey", 0);
        this.privatekey = sharePre.getString("key", "");
        this.ip = sharePre.getString("apihost", "");
        this.username = sharePre.getString("name", "");
        this.sqlite = new SqliteForDiscuss(this);
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class DiscussAsync extends AsyncTask<String, String, String> {
        HashMap<String, String> map;

        public DiscussAsync(HashMap<String, String> hmap) {
            DiscussActivity.this = r1;
            this.map = hmap;
        }

        public String doInBackground(String... arg0) {
            String subjectId = "";
            String keyword = "";
            String page = "";
            String pagenum = "";
            if (this.map != null) {
                if (this.map.containsKey("keyword")) {
                    keyword = this.map.get("keyword");
                }
                if (this.map.containsKey("subjectid")) {
                    subjectId = this.map.get("subjectid");
                }
                if (this.map.containsKey("page")) {
                    page = this.map.get("page");
                }
                if (this.map.containsKey("pagenum")) {
                    pagenum = this.map.get("pagenum");
                }
            }
            String url = "http://" + DiscussActivity.access$0(DiscussActivity.this) + "/api/interaction";
            if (!keyword.equals("") && keyword != null) {
                url = String.valueOf(url) + "/keyword/" + keyword;
            }
            if (!page.equals("") && page != null) {
                url = String.valueOf(url) + "/page/" + page;
            }
            if (!subjectId.equals("") && subjectId != null) {
                url = String.valueOf(url) + "/subjectid/" + subjectId;
            }
            if (!pagenum.equals("") && pagenum != null) {
                url = String.valueOf(url) + "/pagenum/" + pagenum;
            }
            HttpGet get = DiscussActivity.access$1(DiscussActivity.this, url);
            DefaultHttpClient client = new DefaultHttpClient();
            try {
                HttpResponse response = client.execute(get);
                String result = DiscussActivity.access$2(DiscussActivity.this, response);
                Log.e("updateresult", result);
                JSONObject jobj = new JSONObject(result);
                boolean status = jobj.getBoolean("status");
                int errorNum = jobj.getInt("errorNum");
                if (status || errorNum == 0) {
                    JSONArray data = jobj.getJSONArray("data");
                    DiscussActivity.access$3(DiscussActivity.this, data);
                    return "";
                }
                return "";
            } catch (Exception e) {
                e.printStackTrace();
                return "";
            }
        }

        public void onPostExecute(String result) {
            if (DiscussActivity.access$4(DiscussActivity.this) != null) {
                DiscussActivity.access$4(DiscussActivity.this).notifyDataSetChanged();
            }
            if (DiscussActivity.access$5(DiscussActivity.this) != null && !DiscussActivity.access$5(DiscussActivity.this).equals("")) {
                new DiscussDetailsAsync().execute("");
            }
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class DiscussSubjectsAsync extends AsyncTask<String, String, String> {
        DiscussSubjectsAsync() {
            DiscussActivity.this = r1;
        }

        public String doInBackground(String... arg0) {
            String url = "http://" + DiscussActivity.access$0(DiscussActivity.this) + "/api/subject/";
            HttpGet get = DiscussActivity.access$1(DiscussActivity.this, url);
            DefaultHttpClient client = new DefaultHttpClient();
            try {
                HttpResponse response = client.execute(get);
                String result = DiscussActivity.access$2(DiscussActivity.this, response);
                Log.e("updateresult", result);
                JSONObject jobj = new JSONObject(result);
                boolean status = jobj.getBoolean("status");
                jobj.getInt("errorNum");
                String errorInfo = jobj.getString("errorInfo");
                Log.e("updateresult", "error:" + errorInfo);
                if (!status) {
                }
                return "";
            } catch (Exception e) {
                e.printStackTrace();
                return "";
            }
        }

        public void onPostExecute(String result) {
            if (DiscussActivity.access$4(DiscussActivity.this) != null) {
                DiscussActivity.access$4(DiscussActivity.this).notifyDataSetChanged();
            }
            if (DiscussActivity.access$5(DiscussActivity.this) != null && !DiscussActivity.access$5(DiscussActivity.this).equals("")) {
                new DiscussDetailsAsync().execute("");
            }
        }
    }

    static /* synthetic */ void access$3(DiscussActivity discussActivity, JSONArray jSONArray) {
        discussActivity.initDiscuss(jSONArray);
    }

    private void initDiscuss(JSONArray jarray) {
        JSONException e;
        if (jarray != null && jarray.length() > 0) {
            this.discussList = new ArrayList();
            List<ContentValues> values = new ArrayList<>();
            for (int i = 0; i < jarray.length(); i++) {
                try {
                    JSONObject jobj = jarray.getJSONObject(i);
                    if (jobj != null) {
                        this.discussList.add(jobj);
                        ContentValues value = new ContentValues();
                        try {
                            Log.e(this.TAG, jobj.toString());
                            String webContent = jobj.getString(JingleContent.NODENAME);
                            HashMap<String, String> map = new HashMap<>();
                            map.put(JingleContent.NODENAME, webContent);
                            this.contentList.add(map);
                            this.messageId = jobj.getString("messageid");
                            boolean boo = this.sqlite.containColums(SqliteForDiscuss.DISCUSS_TABLE, String.valueOf(SqliteForDiscuss.DISCUSS_MSGID) + "=? ", new String[]{this.messageId});
                            if (!boo) {
                                value.put(SqliteForDiscuss.DISCUSS_AUTHOR, jobj.getString("createby"));
                                value.put(SqliteForDiscuss.DISCUSS_CONTENT, jobj.getString(JingleContent.NODENAME));
                                value.put(SqliteForDiscuss.DISCUSS_CTIME, jobj.getString(AppEnvironment.CreatTime));
                                value.put(SqliteForDiscuss.DISCUSS_GOOD, Integer.valueOf(jobj.getInt("good")));
                                value.put(SqliteForDiscuss.DISCUSS_ISGOOD, jobj.getString("isgood"));
                                value.put(SqliteForDiscuss.DISCUSS_MSGID, jobj.getString("messageid"));
                                value.put(SqliteForDiscuss.DISCUSS_READ, Integer.valueOf(jobj.getInt("isread")));
                                value.put(SqliteForDiscuss.DISCUSS_REPLY, Integer.valueOf(jobj.getInt("reply")));
                                value.put(SqliteForDiscuss.DISCUSS_SUBJECT, jobj.getString("subject"));
                                value.put(SqliteForDiscuss.DISCUSS_SUBJID, jobj.getString("subjectid"));
                                value.put(SqliteForDiscuss.DISCUSS_SUBNAME, jobj.getString("subjectname"));
                                values.add(value);
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
            long index = this.sqlite.insertDiscuss(SqliteForDiscuss.DISCUSS_TABLE, values);
            Log.e("index", new StringBuilder(String.valueOf(index)).toString());
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class DiscussDetailsAsync extends AsyncTask<String, String, String> {
        DiscussDetailsAsync() {
            DiscussActivity.this = r1;
        }

        public String doInBackground(String... arg0) {
            String url = "http://" + DiscussActivity.access$0(DiscussActivity.this) + "/api/interaction/messageid/" + DiscussActivity.access$5(DiscussActivity.this);
            HttpGet get = DiscussActivity.access$1(DiscussActivity.this, url);
            DefaultHttpClient client = new DefaultHttpClient();
            try {
                HttpResponse response = client.execute(get);
                String result = DiscussActivity.access$2(DiscussActivity.this, response);
                Log.e("updateresult", result);
                JSONObject jobj = new JSONObject(result);
                boolean status = jobj.getBoolean("status");
                jobj.getInt("errorNum");
                if (!status) {
                }
                return "";
            } catch (Exception e) {
                e.printStackTrace();
                return "";
            }
        }

        public void onPostExecute(String result) {
            HashMap<String, String> map1 = new HashMap<>();
            HashMap<String, String> map2 = new HashMap<>();
            map1.put("type", LogHelp.TYPE_GUIDANCE);
            map1.put(JingleContent.NODENAME, "huan ying jia ru 讨论");
            map2.put("type", LogHelp.TYPE_MYWORK);
            new DiscussReplyAsync(map1).execute("");
            new DiscussReplyAsync2().execute("");
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class DiscussReplyAsync extends AsyncTask<String, String, String> {
        HashMap<String, String> map;

        public DiscussReplyAsync(HashMap<String, String> hmap) {
            DiscussActivity.this = r1;
            this.map = hmap;
        }

        public String doInBackground(String... arg0) {
            String url = "http://" + DiscussActivity.access$0(DiscussActivity.this) + "/api/interaction/";
            String type = "";
            String content = "";
            if (this.map != null) {
                if (this.map.containsKey("type")) {
                    type = this.map.get("type");
                }
                if (this.map.containsKey(JingleContent.NODENAME)) {
                    content = this.map.get(JingleContent.NODENAME);
                }
            }
            HttpPost put = DiscussActivity.access$6(DiscussActivity.this, url);
            Log.e(MagicNames.ANT_FILE_TYPE_URL, String.valueOf(url) + ",type:" + type + ",content:" + content);
            try {
                MultipartEntity entity = new MultipartEntity();
                entity.addPart("messageid", new StringBody(DiscussActivity.access$5(DiscussActivity.this)));
                if (content != null && !content.equals("")) {
                    entity.addPart(JingleContent.NODENAME, new StringBody(content, Charset.forName("UTF-8")));
                }
                if (type != null && !type.equals("")) {
                    entity.addPart("type", new StringBody(type));
                }
                put.setEntity(entity);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
            DefaultHttpClient client = new DefaultHttpClient();
            try {
                HttpResponse response = client.execute(put);
                String result = DiscussActivity.access$2(DiscussActivity.this, response);
                Log.e("updateresult", result);
                JSONObject jobj = new JSONObject(result);
                boolean status = jobj.getBoolean("status");
                jobj.getInt("errorNum");
                if (!status) {
                }
                return "";
            } catch (Exception e) {
                e.printStackTrace();
                return "";
            }
        }

        public void onPostExecute(String result) {
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class DiscussReplyAsync2 extends AsyncTask<String, String, String> {
        DiscussReplyAsync2() {
            DiscussActivity.this = r1;
        }

        public String doInBackground(String... arg0) {
            String url = "http://" + DiscussActivity.access$0(DiscussActivity.this) + "/api/interaction/";
            HttpPost put = DiscussActivity.access$6(DiscussActivity.this, url);
            try {
                MultipartEntity entity = new MultipartEntity();
                entity.addPart("messageid", new StringBody(DiscussActivity.access$5(DiscussActivity.this)));
                entity.addPart("type", new StringBody(LogHelp.TYPE_MYWORK));
                put.setEntity(entity);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
            DefaultHttpClient client = new DefaultHttpClient();
            try {
                HttpResponse response = client.execute(put);
                String result = DiscussActivity.access$2(DiscussActivity.this, response);
                Log.e("updateresult", result);
                JSONObject jobj = new JSONObject(result);
                boolean status = jobj.getBoolean("status");
                jobj.getInt("errorNum");
                if (!status) {
                }
                return "";
            } catch (Exception e) {
                e.printStackTrace();
                return "";
            }
        }

        public void onPostExecute(String result) {
        }
    }

    static /* synthetic */ String access$2(DiscussActivity discussActivity, HttpResponse httpResponse) {
        return discussActivity.getJsonStringFromGZIP(httpResponse);
    }

    private String getJsonStringFromGZIP(HttpResponse response) {
        String jsonString;
        InputStream is;
        try {
            if (response.getStatusLine().getStatusCode() == 200) {
                InputStream is2 = response.getEntity().getContent();
                BufferedInputStream bis = new BufferedInputStream(is2);
                bis.mark(2);
                byte[] header = new byte[2];
                int result = bis.read(header);
                bis.reset();
                int headerData = getShort(header);
                if (result != -1 && headerData == 8075) {
                    Log.d(this.TAG, " use GZIPInputStream  ");
                    is = new GZIPInputStream(bis);
                } else {
                    Log.d(this.TAG, " not use GZIPInputStream");
                    is = bis;
                }
                InputStreamReader reader = new InputStreamReader(is, "utf-8");
                char[] data = new char[100];
                StringBuffer sb = new StringBuffer();
                while (true) {
                    int readSize = reader.read(data);
                    if (readSize <= 0) {
                        break;
                    }
                    sb.append(data, 0, readSize);
                }
                jsonString = sb.toString();
                bis.close();
                reader.close();
            } else {
                Log.e(this.TAG, "与服务端连接失败。。。");
                Log.e(this.TAG, "ddddd=" + response.getStatusLine().getStatusCode());
                Log.e(this.TAG, "ddddd=" + response.getEntity());
                jsonString = "";
            }
        } catch (Exception e) {
            Log.e(this.TAG, e.toString(), e);
            jsonString = "";
        }
        Log.d(this.TAG, "getJsonStringFromGZIP net output : " + jsonString);
        return jsonString;
    }

    private int getShort(byte[] data) {
        return (data[0] << 8) | (data[1] & BSON.MINKEY);
    }

    static /* synthetic */ HttpGet access$1(DiscussActivity discussActivity, String str) {
        return discussActivity.HttpGet_Init(str);
    }

    private HttpGet HttpGet_Init(String url) {
        HttpGet get = new HttpGet(url);
        get.addHeader("X-Edutech-Entity", this.username);
        long imestamp = System.currentTimeMillis();
        String sign = My_md5.Md5(String.valueOf(imestamp) + this.username + this.privatekey);
        get.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
        return get;
    }

    static /* synthetic */ HttpPost access$6(DiscussActivity discussActivity, String str) {
        return discussActivity.HttpPost_Init(str);
    }

    private HttpPost HttpPost_Init(String url) {
        HttpPost put = new HttpPost(url);
        put.addHeader("X-Edutech-Entity", String.valueOf(this.username) + "+" + this.privatekey);
        Log.e(UserID.ELEMENT_NAME, String.valueOf(this.username) + "," + this.privatekey);
        long imestamp = System.currentTimeMillis();
        String sign = My_md5.Md5(String.valueOf(imestamp) + this.username + this.privatekey);
        put.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
        return put;
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == 4) {
            finish();
        }
        return super.onKeyDown(keyCode, event);
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
}
