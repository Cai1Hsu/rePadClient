package com.edutech.appmanage;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.DownloadManager;
import android.app.ProgressDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.AbsListView;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.edutech.appmanage.utils.ApkController;
import com.edutech.appmanage.utils.Delete_APKfile;
import com.edutech.appmanage.utils.DownloadManagerPro;
import com.edutech.appmanage.utils.SharedPreferencesHelper;
import com.edutech.idauthentication.AppEnvironment;
import com.edutech.idauthentication.JsonHelper;
import com.edutech.json.KeyEnvironment;
import com.edutech.mobilestudyclient.util.My_md5;
import com.edutech.mobilestudyclient.util.XmlLoadHelper;
import com.edutech.publicedu.log.LogHelp;
import com.launcher.activity.R;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.cookie.ClientCookie;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.jivesoftware.smackx.entitycaps.EntityCapsManager;
import org.jivesoftware.smackx.workgroup.packet.UserID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* loaded from: classes.dex */
public class MainActivity extends Activity {
    private static final String TAG = "AppmanageMainActivity";
    public static DownloadManager downloadManager;
    public static DownloadManagerPro downloadManagerPro;
    public static LinkedList<AppInfo> market_applist;
    public static LinkedList<AppInfo> market_applist_local;
    private MyAdapter adapter;
    ProgressDialog changed_progress;
    private CompleteReceiver completeReceiver;
    CompleteReceiver completereceiver;
    GetBroadcast getbroadcast;
    private GridView gv;
    Handler handler;
    private ImageView img_appwarning;
    private RelativeLayout layout_appwarning;
    int login_res;
    ArrayList<String> silent_uninstall;
    TextView wrong_net;
    public static final String URLFILEPATH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/setting.xml";
    public static ArrayList<String> delete_apkfile = new ArrayList<>();
    private static int count = 0;
    private static int apk_install = 0;
    private static int apk_uninstall = 1;
    public static final String FOLDER_MAIN = "MobileStudyClient" + File.separatorChar + ".System" + File.separatorChar + "AppManager" + File.separatorChar;
    private int height = 0;
    private int pic_width = 0;
    private int pic_height = 0;
    public boolean firststart = true;
    com.edutech.idauthentication.MainActivity idauth = new com.edutech.idauthentication.MainActivity(this);
    private HashMap<String, String> hashmap = null;
    private String ip = "";
    private String usercode = "";
    private String password = "";
    private String pwd = "";
    private String privatekey = EntityCapsManager.ELEMENT;
    private String username = "";
    private boolean data_load = false;
    private boolean pic_load = false;
    private boolean isrun = true;
    private Timer mTimer = null;
    private TimerTask mTimerTask = null;
    private boolean toast_unlink = false;
    Runnable net_thread = new Runnable() { // from class: com.edutech.appmanage.MainActivity.1
        @Override // java.lang.Runnable
        public synchronized void run() {
            MainActivity.this.progress_handler.sendEmptyMessage(3);
            MainActivity.this.progress_handler.sendEmptyMessage(1);
            MainActivity.this.login_res = MainActivity.this.userLogin(MainActivity.this.ip, MainActivity.this.usercode, MainActivity.this.pwd);
            Log.i(MainActivity.TAG, "LOGIN_RES   :" + MainActivity.this.login_res);
            if (MainActivity.this.login_res != 0) {
                if (-1 == MainActivity.this.login_res) {
                    MainActivity.this.wrong_handler.sendEmptyMessage(2);
                } else if (2 == MainActivity.this.login_res) {
                    MainActivity.this.wrong_handler.sendEmptyMessage(2);
                } else if (MainActivity.this.login_res != 0) {
                    MainActivity.this.wrong_handler.sendEmptyMessage(2);
                }
                MainActivity.this.unlink_parse(SharedPreferencesHelper.load_info());
            } else {
                Log.i(MainActivity.TAG, "usercode==" + MainActivity.this.usercode);
                String res_id = HttpHelper.getin("http://" + MainActivity.this.ip + "/api/pad-login/code/" + MainActivity.this.usercode + "/pwd/" + MainActivity.this.pwd, MainActivity.this.usercode, MainActivity.this.privatekey);
                Log.i(MainActivity.TAG, "333---RES_ID  :" + res_id);
                if (res_id != null) {
                    String stu_id = MainActivity.this.parse_studentid(res_id);
                    if (stu_id == null) {
                        Log.i(MainActivity.TAG, "338");
                        MainActivity.this.handler_toast.sendEmptyMessage(4);
                    } else {
                        String infor = HttpHelper.getin("http://" + MainActivity.this.ip + "/api/app/projectcode/myapp/os/android", MainActivity.this.usercode, MainActivity.this.privatekey);
                        Log.i(MainActivity.TAG, "346-infor--->" + infor);
                        if (infor != null) {
                            MainActivity.this.unlink_handler.sendEmptyMessage(3);
                            SharedPreferencesHelper.save_info(infor);
                            MainActivity.this.parse_json();
                        } else {
                            MainActivity.this.handler_toast.sendEmptyMessage(4);
                        }
                    }
                } else {
                    Log.i(MainActivity.TAG, "345");
                    MainActivity.this.handler_toast.sendEmptyMessage(4);
                }
            }
        }
    };
    Handler unlink_handler = new Handler() { // from class: com.edutech.appmanage.MainActivity.2
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            switch (msg.what) {
                case 1:
                    if (MainActivity.market_applist.size() == 0) {
                        MainActivity.this.wrong_net.setText(MainActivity.this.getResources().getString(R.string.appmanager_errornetwork));
                        MainActivity.this.wrong_net.setVisibility(0);
                        MainActivity.this.img_appwarning.setBackgroundResource(R.drawable.nointernet);
                        MainActivity.this.layout_appwarning.setVisibility(0);
                        MainActivity.this.gv.setVisibility(8);
                        return;
                    }
                    MainActivity.this.wrong_net.setVisibility(8);
                    MainActivity.this.layout_appwarning.setVisibility(8);
                    MainActivity.this.gv.setVisibility(0);
                    return;
                case 2:
                    Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_errornetwork), 0).show();
                    return;
                case 3:
                    MainActivity.this.wrong_net.setVisibility(8);
                    MainActivity.this.layout_appwarning.setVisibility(8);
                    MainActivity.this.gv.setVisibility(0);
                    return;
                default:
                    return;
            }
        }
    };
    Handler handler_toast = new Handler() { // from class: com.edutech.appmanage.MainActivity.3
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            switch (msg.what) {
                case 1:
                    Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_nonefile), 0).show();
                    return;
                case 2:
                    Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_installok), 0).show();
                    return;
                case 3:
                    Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_nonememory), 0).show();
                    return;
                case 4:
                    Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_errornet), 0).show();
                    MainActivity.this.progress_handler.sendEmptyMessage(2);
                    return;
                default:
                    return;
            }
        }
    };
    Handler wrong_handler = new Handler() { // from class: com.edutech.appmanage.MainActivity.4
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            switch (msg.what) {
                case 1:
                    MainActivity.this.wrong_net.setText(MainActivity.this.getResources().getString(R.string.appmanager_errorsetting));
                    MainActivity.this.img_appwarning.setBackgroundResource(R.drawable.errorsetting);
                    MainActivity.this.data_load = true;
                    MainActivity.this.pic_load = true;
                    break;
                case 2:
                    MainActivity.this.wrong_net.setText(MainActivity.this.getResources().getString(R.string.appmanager_errornetwork));
                    MainActivity.this.img_appwarning.setBackgroundResource(R.drawable.nointernet);
                    MainActivity.this.data_load = true;
                    MainActivity.this.pic_load = true;
                    break;
                case 3:
                    MainActivity.this.wrong_net.setText(MainActivity.this.getResources().getString(R.string.appmanager_noneapp));
                    MainActivity.this.img_appwarning.setBackgroundResource(R.drawable.nodetails);
                    MainActivity.this.data_load = true;
                    MainActivity.this.pic_load = true;
                    MainActivity.this.wrong_net.setVisibility(0);
                    MainActivity.this.layout_appwarning.setVisibility(0);
                    MainActivity.this.gv.setVisibility(8);
                    break;
            }
            MainActivity.this.progress_handler.sendEmptyMessage(2);
        }
    };
    Handler progress_handler = new Handler() { // from class: com.edutech.appmanage.MainActivity.5
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            switch (msg.what) {
                case 1:
                    if (!MainActivity.this.isFinishing()) {
                        try {
                            MainActivity.this.changed_progress.show();
                        } catch (Exception e) {
                        }
                    }
                    MainActivity.this.startTimer();
                    return;
                case 2:
                    MainActivity.this.stopTimer();
                    if (!MainActivity.this.isFinishing()) {
                        try {
                            MainActivity.this.changed_progress.dismiss();
                            return;
                        } catch (Exception e2) {
                            return;
                        }
                    }
                    return;
                case 3:
                    if (!MainActivity.this.isFinishing()) {
                        try {
                            MainActivity.this.changed_progress.setTitle(MainActivity.this.getResources().getString(R.string.appmanager_jiazaiing));
                            return;
                        } catch (Exception e3) {
                            return;
                        }
                    }
                    return;
                case 4:
                    if (!MainActivity.this.isFinishing()) {
                        try {
                            MainActivity.this.changed_progress.setTitle(MainActivity.this.getResources().getString(R.string.appmanager_uninstalling));
                            return;
                        } catch (Exception e4) {
                            return;
                        }
                    }
                    return;
                default:
                    return;
            }
        }
    };
    Runnable runnableUi = new Runnable() { // from class: com.edutech.appmanage.MainActivity.6
        @Override // java.lang.Runnable
        public void run() {
            MainActivity.this.adapter.notifyDataSetChanged();
        }
    };
    private Handler mHandlerApk = new Handler() { // from class: com.edutech.appmanage.MainActivity.7
        /* JADX WARN: Type inference failed for: r1v3, types: [com.edutech.appmanage.MainActivity$7$2] */
        /* JADX WARN: Type inference failed for: r1v5, types: [com.edutech.appmanage.MainActivity$7$1] */
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            if (msg.what != MainActivity.apk_install) {
                if (msg.what == MainActivity.apk_uninstall) {
                    final String path = (String) msg.obj;
                    Log.i(MainActivity.TAG, "path-->" + path);
                    new Thread() { // from class: com.edutech.appmanage.MainActivity.7.2
                        @Override // java.lang.Thread, java.lang.Runnable
                        public void run() {
                            if (!ApkController.uninstall(path, MainActivity.this.getApplicationContext())) {
                                MainActivity.this.toast(MainActivity.this.getResources().getString(R.string.appmanager_uninstallfailed));
                            }
                        }
                    }.start();
                }
            } else {
                final String path2 = (String) msg.obj;
                Log.i(MainActivity.TAG, "path-->" + path2);
                new Thread() { // from class: com.edutech.appmanage.MainActivity.7.1
                    @Override // java.lang.Thread, java.lang.Runnable
                    public void run() {
                        Log.i(MainActivity.TAG, "path-->" + path2);
                        if (!ApkController.install(path2, MainActivity.this.getApplicationContext())) {
                            MainActivity.this.toast(MainActivity.this.getResources().getString(R.string.appmanager_installfailed));
                        }
                    }
                }.start();
            }
            super.handleMessage(msg);
        }
    };
    Runnable runnable_GetConfig_Infor = new Runnable() { // from class: com.edutech.appmanage.MainActivity.8
        @Override // java.lang.Runnable
        public void run() {
            String url = "http://" + MainActivity.this.ip + "/api/config/";
            Log.e(MainActivity.TAG, "URL:" + url);
            String result = MainActivity.this.Get_Config_Json(url, MainActivity.this.username);
            if (result != null) {
                MainActivity.this.jsonToConfig(result);
            }
            Message msg = MainActivity.this.getMarkertHandler.obtainMessage();
            msg.what = 1;
            msg.sendToTarget();
        }
    };
    Handler getMarkertHandler = new Handler() { // from class: com.edutech.appmanage.MainActivity.9
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            int what = msg.what;
            switch (what) {
                case 1:
                    ConnectivityManager manager = (ConnectivityManager) MainActivity.this.getSystemService("connectivity");
                    NetworkInfo.State wifi = manager.getNetworkInfo(1).getState();
                    if (wifi == NetworkInfo.State.CONNECTED) {
                        new Thread(MainActivity.this.net_thread).start();
                        return;
                    } else {
                        MainActivity.this.unlink_parse(SharedPreferencesHelper.load_info());
                        return;
                    }
                default:
                    return;
            }
        }
    };

    /* loaded from: classes.dex */
    class AppInfo {
        public int apptype = 0;
        public int versionCode = 0;
        public String local_versionName = "";
        public String apkname = "";
        public String appname = "";
        public String packagename = "";
        public String appsize = "";
        public String versionName = "";
        public String webpath = "";
        public String iconurl = "";
        public String classname = "";
        public Drawable appicon = null;
        public boolean update = false;
        public boolean doing = false;
        public boolean islocal = false;

        AppInfo() {
            MainActivity.this = r3;
        }
    }

    @Override // android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setFlags(1024, 1024);
        setContentView(R.layout.pic_show);
        findview();
        this.wrong_net = (TextView) findViewById(R.id.tv_wrong_net);
        this.layout_appwarning = (RelativeLayout) findViewById(R.id.layout_appwarn);
        this.img_appwarning = (ImageView) findViewById(R.id.img_appwarn);
        WindowManager manager = (WindowManager) getApplication().getSystemService("window");
        downloadManager = (DownloadManager) getSystemService("download");
        downloadManagerPro = new DownloadManagerPro(downloadManager);
        SharedPreferencesHelper.preferences = getSharedPreferences("configure", 0);
        DisplayMetrics dm = new DisplayMetrics();
        manager.getDefaultDisplay().getMetrics(dm);
        int width2 = dm.widthPixels;
        int height2 = dm.heightPixels;
        this.height = ((width2 - 60) * height2) / (width2 * 4);
        this.pic_height = (this.height * 5) / 10;
        this.pic_width = this.pic_height;
        this.gv = (GridView) findViewById(R.id.GridView01);
        this.changed_progress = new ProgressDialog(this);
        this.changed_progress.setCancelable(false);
        this.firststart = true;
        this.handler = new Handler();
        market_applist = new LinkedList<>();
        market_applist_local = new LinkedList<>();
        this.hashmap = XmlLoadHelper.loadXml();
        this.ip = this.hashmap.get("ip");
        this.usercode = this.hashmap.get("usercode");
        this.username = this.hashmap.get("username");
        Log.i(TAG, "usercode=222==" + this.usercode + "," + this.ip + "," + this.username);
        this.password = this.hashmap.get(AppEnvironment.PASSWORD);
        this.pwd = this.hashmap.get("pwd");
        this.privatekey = this.hashmap.get("privatekey");
        this.gv.setNumColumns(3);
        this.adapter = new MyAdapter(this);
        this.gv.setAdapter((ListAdapter) this.adapter);
        if (this.ip != null && !this.ip.equals("") && this.username != null && !this.username.equals("")) {
            new Thread(this.runnable_GetConfig_Infor).start();
        }
        this.completeReceiver = new CompleteReceiver();
        this.getbroadcast = new GetBroadcast();
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.intent.action.PACKAGE_ADDED");
        filter.addAction("android.intent.action.PACKAGE_REMOVED");
        filter.addAction("android.intent.action.PACKAGE_REPLACED");
        filter.addDataScheme("package");
        registerReceiver(this.getbroadcast, filter);
        this.completereceiver = new CompleteReceiver();
        IntentFilter filters = new IntentFilter();
        filters.addAction("android.intent.action.DOWNLOAD_COMPLETE");
        registerReceiver(this.completereceiver, filters);
    }

    private void findview() {
        findViewById(R.id.btn_refresh).setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.10
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (MainActivity.this.data_load) {
                    if (MainActivity.this.pic_load) {
                        MainActivity.this.data_load = false;
                        MainActivity.this.pic_load = false;
                        MainActivity.this.toast_unlink = false;
                        Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.action_refresh), 0).show();
                        MainActivity.this.getMarketInfor();
                        return;
                    }
                    Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_iconunloading), 0).show();
                    return;
                }
                Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_unloading), 0).show();
            }
        });
        findViewById(R.id.tv_exit).setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.11
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                MainActivity.this.finish();
            }
        });
    }

    public String parse_studentid(String res) {
        JSONObject all_infor;
        String err;
        String type = null;
        JSONTokener jsonparse = new JSONTokener(res);
        try {
            all_infor = (JSONObject) jsonparse.nextValue();
            err = all_infor.getString("errorNum");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        if (!"0".equals(err)) {
            return null;
        }
        JSONObject jo = all_infor.getJSONObject("data");
        type = jo.getString("studentid");
        return type;
    }

    public void shared_getinfo(String dir) {
        StringBuffer sb = new StringBuffer();
        try {
            BufferedReader br = new BufferedReader(new FileReader(dir));
            for (String data = br.readLine(); data != null; data = br.readLine()) {
                sb.append(data);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
        String res = sb.toString();
        SharedPreferencesHelper.save_info(res);
    }

    public synchronized void parse_json() {
        try {
            ConnectivityManager manager = (ConnectivityManager) getSystemService("connectivity");
            NetworkInfo.State wifi = manager.getNetworkInfo(1).getState();
            if (wifi == NetworkInfo.State.CONNECTED) {
                if (this.login_res != 0) {
                    if (-1 == this.login_res) {
                        this.wrong_handler.sendEmptyMessage(2);
                    } else if (2 == this.login_res) {
                        this.wrong_handler.sendEmptyMessage(2);
                    } else if (this.login_res != 0) {
                        this.wrong_handler.sendEmptyMessage(2);
                    }
                    unlink_parse(SharedPreferencesHelper.load_info());
                } else {
                    parse(SharedPreferencesHelper.load_info());
                }
            } else {
                unlink_parse(SharedPreferencesHelper.load_info());
            }
        } catch (Exception e) {
        }
    }

    public void unlink_parse(String string) {
        PackageInfo packageInfo;
        JSONTokener jsonparse = new JSONTokener(string);
        try {
            JSONObject all_infor = (JSONObject) jsonparse.nextValue();
            JSONObject jo = all_infor.getJSONObject("data");
            JSONArray data = jo.getJSONArray("app");
            market_applist = new LinkedList<>();
            market_applist_local = new LinkedList<>();
            for (int i = 0; i < data.length(); i++) {
                AppInfo tmpInfo = new AppInfo();
                JSONObject tmp = (JSONObject) data.get(i);
                String type = tmp.getString("apptype");
                tmpInfo.apptype = Integer.parseInt(type);
                tmpInfo.apkname = tmp.getString("apkname");
                tmpInfo.appname = tmp.getString("appname");
                tmpInfo.packagename = tmp.getString("packagename");
                if (!"".equals(tmpInfo.packagename)) {
                    try {
                        packageInfo = getPackageManager().getPackageInfo(tmpInfo.packagename, 0);
                    } catch (PackageManager.NameNotFoundException e) {
                        packageInfo = null;
                        e.printStackTrace();
                    }
                    if (packageInfo != null) {
                        tmpInfo.islocal = true;
                        tmpInfo.appsize = tmp.getString("appsize");
                        String code = tmp.getString("versioncode");
                        tmpInfo.versionCode = Integer.parseInt(code);
                        if (tmp.getString("versionname").length() > 10) {
                            tmpInfo.versionName = String.valueOf(tmp.getString("versionname").substring(0, 10)) + "...";
                        } else {
                            tmpInfo.versionName = tmp.getString("versionname");
                        }
                        tmpInfo.webpath = tmp.getString(KeyEnvironment.KEYWEBPATH);
                        tmpInfo.iconurl = tmp.getString("iconurl");
                        market_applist.add(tmpInfo);
                        market_applist_local.add(tmpInfo);
                    }
                }
            }
        } catch (JSONException e2) {
            e2.printStackTrace();
        }
        Collections.sort(market_applist, new Comparator<AppInfo>() { // from class: com.edutech.appmanage.MainActivity.12
            public int compare(AppInfo lhs, AppInfo rhs) {
                int a = 0;
                int b = 0;
                if (lhs.islocal) {
                    a = 1;
                }
                if (rhs.islocal) {
                    b = 1;
                }
                if (a > b) {
                    return -1;
                }
                if (a == b) {
                    return 0;
                }
                return 1;
            }
        });
        this.data_load = true;
        this.pic_load = true;
        if (!this.toast_unlink) {
            if (market_applist.size() != 0) {
                this.unlink_handler.sendEmptyMessage(2);
            }
            this.toast_unlink = true;
        }
        this.unlink_handler.sendEmptyMessage(1);
        this.progress_handler.sendEmptyMessage(2);
        this.handler.post(this.runnableUi);
    }

    /* JADX WARN: Type inference failed for: r10v5, types: [com.edutech.appmanage.MainActivity$13] */
    public void parse(String string) {
        JSONTokener jsonparse = new JSONTokener(string);
        try {
            JSONObject all_infor = (JSONObject) jsonparse.nextValue();
            JSONObject jo = all_infor.getJSONObject("data");
            JSONArray data = jo.getJSONArray("app");
            market_applist = new LinkedList<>();
            market_applist_local = new LinkedList<>();
            for (int i = 0; i < data.length(); i++) {
                AppInfo tmpInfo = new AppInfo();
                JSONObject tmp = (JSONObject) data.get(i);
                String type = tmp.getString("apptype");
                tmpInfo.apptype = Integer.parseInt(type);
                tmpInfo.apkname = tmp.getString("apkname");
                tmpInfo.appname = tmp.getString("appname");
                tmpInfo.packagename = tmp.getString("packagename");
                if (!"".equals(tmpInfo.packagename)) {
                    tmpInfo.appsize = tmp.getString("appsize");
                    String code = tmp.getString("versioncode");
                    tmpInfo.versionCode = Integer.parseInt(code);
                    if (tmp.getString("versionname").length() > 10) {
                        tmpInfo.versionName = String.valueOf(tmp.getString("versionname").substring(0, 10)) + "...";
                    } else {
                        tmpInfo.versionName = tmp.getString("versionname");
                    }
                    tmpInfo.webpath = tmp.getString(KeyEnvironment.KEYWEBPATH);
                    tmpInfo.iconurl = tmp.getString("iconurl");
                    market_applist.add(tmpInfo);
                    market_applist_local.add(tmpInfo);
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        if (market_applist.size() == 0) {
            this.wrong_handler.sendEmptyMessage(3);
            this.progress_handler.sendEmptyMessage(2);
            this.handler.post(this.runnableUi);
            return;
        }
        this.wrong_net.setVisibility(8);
        this.layout_appwarning.setVisibility(8);
        this.gv.setVisibility(0);
        new Thread() { // from class: com.edutech.appmanage.MainActivity.13
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                File file = new File(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + File.separatorChar + "icon");
                if (!file.exists()) {
                    file.mkdirs();
                }
                for (int k = 0; k < MainActivity.market_applist_local.size(); k++) {
                    HttpHelper.httpDownload(MainActivity.market_applist_local.get(k).iconurl, String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + File.separatorChar + "icon" + File.separatorChar + MainActivity.market_applist_local.get(k).packagename + ".png", MainActivity.this);
                }
                while (!MainActivity.this.data_load) {
                    try {
                        sleep(500L);
                    } catch (InterruptedException e2) {
                        e2.printStackTrace();
                    }
                }
                for (int i2 = 0; i2 < MainActivity.market_applist.size(); i2++) {
                    int j = 0;
                    while (true) {
                        if (j < MainActivity.market_applist_local.size()) {
                            if (!MainActivity.market_applist.get(i2).packagename.equals(MainActivity.market_applist_local.get(j).packagename)) {
                                j++;
                            } else {
                                try {
                                    MainActivity.market_applist.get(i2).appicon = MainActivity.this.getImageDrawable(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + File.separatorChar + "icon" + File.separatorChar + MainActivity.market_applist.get(i2).packagename + ".png");
                                    break;
                                } catch (IOException e3) {
                                    e3.printStackTrace();
                                }
                            }
                        }
                    }
                }
                MainActivity.this.handler.post(MainActivity.this.runnableUi);
            }
        }.start();
        compare();
        this.progress_handler.sendEmptyMessage(2);
        this.handler.post(this.runnableUi);
    }

    /* JADX WARN: Type inference failed for: r6v13, types: [com.edutech.appmanage.MainActivity$15] */
    public void compare() {
        PackageInfo packageInfo;
        PackageInfo packageInfo2;
        ArrayList<String> uninstall_list = new ArrayList<>();
        if (this.silent_uninstall == null) {
            this.silent_uninstall = new ArrayList<>();
        }
        for (int j = 0; j < market_applist.size(); j++) {
            if (2 == market_applist_local.get(j).apptype) {
                try {
                    packageInfo2 = getPackageManager().getPackageInfo(market_applist_local.get(j).packagename, 0);
                } catch (PackageManager.NameNotFoundException e) {
                    packageInfo2 = null;
                    e.printStackTrace();
                }
                if (packageInfo2 != null) {
                    if (!this.silent_uninstall.contains(market_applist_local.get(j).packagename)) {
                        this.silent_uninstall.add(market_applist_local.get(j).packagename);
                    }
                } else if (this.silent_uninstall.contains(market_applist_local.get(j).packagename)) {
                    this.silent_uninstall.remove(market_applist_local.get(j).packagename);
                }
                uninstall_list.add(market_applist_local.get(j).packagename);
            }
        }
        for (int i = 0; i < this.silent_uninstall.size(); i++) {
        }
        for (int i2 = 0; i2 < uninstall_list.size(); i2++) {
            int j2 = 0;
            while (true) {
                if (j2 < market_applist.size()) {
                    if (!uninstall_list.get(i2).equals(market_applist.get(j2).packagename)) {
                        j2++;
                    } else {
                        market_applist.remove(j2);
                        break;
                    }
                }
            }
        }
        if (HttpHelper.install_num.size() != 0) {
            for (int i3 = 0; i3 < this.silent_uninstall.size(); i3++) {
                for (int j3 = 0; j3 < HttpHelper.install_num.size(); j3++) {
                    if (this.silent_uninstall.get(i3).equals((String) HttpHelper.install_num.get(j3).get("packagename"))) {
                        downloadManager.remove(((Long) HttpHelper.install_num.get(j3).get("downid")).longValue());
                        HttpHelper.install_num.remove(j3);
                    }
                }
            }
        }
        for (int i4 = 0; i4 < market_applist.size(); i4++) {
            try {
                packageInfo = getPackageManager().getPackageInfo(market_applist.get(i4).packagename, 0);
            } catch (PackageManager.NameNotFoundException e2) {
                packageInfo = null;
                e2.printStackTrace();
            }
            if (packageInfo != null) {
                market_applist.get(i4).islocal = true;
                if (packageInfo.versionCode != market_applist.get(i4).versionCode) {
                    if (packageInfo.versionName.length() > 10) {
                        market_applist.get(i4).local_versionName = String.valueOf(packageInfo.versionName.substring(0, 10)) + "...";
                    } else {
                        market_applist.get(i4).local_versionName = packageInfo.versionName;
                    }
                    market_applist.get(i4).update = true;
                }
            } else {
                market_applist.get(i4).islocal = false;
            }
        }
        Collections.sort(market_applist, new Comparator<AppInfo>() { // from class: com.edutech.appmanage.MainActivity.14
            public int compare(AppInfo lhs, AppInfo rhs) {
                int a = 0;
                int b = 0;
                if (lhs.islocal) {
                    a = 1;
                }
                if (rhs.islocal) {
                    b = 1;
                }
                if (a > b) {
                    return -1;
                }
                if (a == b) {
                    return 0;
                }
                return 1;
            }
        });
        if (this.silent_uninstall.size() != 0) {
            Intent uninstall_intent = new Intent(this, SilentUninstall_Service.class);
            uninstall_intent.putStringArrayListExtra("uninstall_list", this.silent_uninstall);
            startService(uninstall_intent);
        }
        this.data_load = true;
        new Thread() { // from class: com.edutech.appmanage.MainActivity.15
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                for (int i5 = 0; i5 < MainActivity.market_applist.size(); i5++) {
                    int j4 = 0;
                    while (true) {
                        if (j4 < MainActivity.market_applist_local.size()) {
                            if (!MainActivity.market_applist.get(i5).packagename.equals(MainActivity.market_applist_local.get(j4).packagename)) {
                                j4++;
                            } else {
                                try {
                                    MainActivity.market_applist.get(i5).appicon = MainActivity.this.getImageDrawable(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + File.separatorChar + "icon" + File.separatorChar + MainActivity.market_applist.get(i5).packagename + ".png");
                                    break;
                                } catch (IOException e3) {
                                    e3.printStackTrace();
                                }
                            }
                        }
                    }
                }
                MainActivity.this.pic_load = true;
            }
        }.start();
    }

    public BitmapDrawable getImageDrawable(String path) throws IOException {
        File file = new File(path);
        if (!file.exists()) {
            return null;
        }
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        byte[] bt = new byte[1024];
        InputStream in = new FileInputStream(file);
        for (int readLength = in.read(bt); readLength != -1; readLength = in.read(bt)) {
            outStream.write(bt, 0, readLength);
        }
        byte[] data = outStream.toByteArray();
        Bitmap bitmap = BitmapFactory.decodeByteArray(data, 0, data.length);
        return new BitmapDrawable(bitmap);
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        unregisterReceiver(this.getbroadcast);
        unregisterReceiver(this.completereceiver);
        this.isrun = false;
        this.changed_progress.dismiss();
        Intent intent = new Intent(this, Delete_APKfile.class);
        if (delete_apkfile != null) {
            intent.putStringArrayListExtra("deletefile", delete_apkfile);
        }
        intent.putExtra("deleteicon", String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + FOLDER_MAIN + File.separatorChar + "icon");
        if (HttpHelper.install_num != null) {
            ArrayList<String> apk_list = new ArrayList<>();
            for (int i = 0; i < HttpHelper.install_num.size(); i++) {
                apk_list.add((String) HttpHelper.install_num.get(i).get("apkname"));
            }
            intent.putExtra("install", apk_list);
        }
        intent.putExtra("deleteapks", String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + FOLDER_MAIN);
        startService(intent);
    }

    /* JADX WARN: Type inference failed for: r2v11, types: [com.edutech.appmanage.MainActivity$16] */
    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        if (this.firststart) {
            this.firststart = false;
            return;
        }
        this.toast_unlink = false;
        this.hashmap = XmlLoadHelper.loadXml();
        if (this.hashmap != null && this.ip != null && this.usercode != null && this.password != null && this.hashmap.containsKey("ip") && this.hashmap.containsKey("usercode") && this.hashmap.containsKey(AppEnvironment.PASSWORD) && this.hashmap.containsKey("pwd") && (!this.ip.equals(this.hashmap.get("ip")) || !this.usercode.equals(this.hashmap.get("usercode")) || !this.password.equals(this.hashmap.get(AppEnvironment.PASSWORD)) || !this.pwd.equals(this.hashmap.get("pwd")))) {
            this.data_load = false;
            this.pic_load = false;
            this.ip = this.hashmap.get("ip");
            this.usercode = this.hashmap.get("usercode");
            Log.i(TAG, "usercode=1205==" + this.usercode);
            this.password = this.hashmap.get(AppEnvironment.PASSWORD);
            this.pwd = this.hashmap.get("pwd");
            this.privatekey = this.hashmap.get("privatekey");
            if (this.ip != null && !this.ip.equals("") && this.username != null && !this.username.equals("")) {
                new Thread(this.runnable_GetConfig_Infor).start();
                return;
            }
            return;
        }
        ConnectivityManager manager = (ConnectivityManager) getSystemService("connectivity");
        NetworkInfo.State wifi = manager.getNetworkInfo(1).getState();
        if (wifi == NetworkInfo.State.CONNECTED) {
            if (this.login_res != 0) {
                if (-1 == this.login_res) {
                    this.wrong_handler.sendEmptyMessage(2);
                } else if (2 == this.login_res) {
                    this.wrong_handler.sendEmptyMessage(2);
                } else if (this.login_res != 0) {
                    this.wrong_handler.sendEmptyMessage(2);
                }
                unlink_parse(SharedPreferencesHelper.load_info());
                return;
            }
            this.gv.setVisibility(0);
            this.wrong_net.setVisibility(8);
            this.layout_appwarning.setVisibility(8);
            new Thread() { // from class: com.edutech.appmanage.MainActivity.16
                @Override // java.lang.Thread, java.lang.Runnable
                public synchronized void run() {
                    MainActivity.this.parse_json();
                }
            }.start();
            return;
        }
        parse_json();
    }

    public void getMarketInfor() {
        ConnectivityManager manager = (ConnectivityManager) getSystemService("connectivity");
        NetworkInfo.State wifi = manager.getNetworkInfo(1).getState();
        if (wifi == NetworkInfo.State.CONNECTED) {
            new Thread(this.net_thread).start();
        } else {
            unlink_parse(SharedPreferencesHelper.load_info());
        }
    }

    /* loaded from: classes.dex */
    class MyAdapter extends BaseAdapter {
        AppInfo appinfo;
        Context context;
        private LayoutInflater mInflater;

        MyAdapter(Context context) {
            MainActivity.this = r2;
            this.context = context;
            this.mInflater = LayoutInflater.from(context);
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return MainActivity.market_applist.size();
        }

        @Override // android.widget.Adapter
        public Object getItem(int item) {
            return Integer.valueOf(item);
        }

        @Override // android.widget.Adapter
        public long getItemId(int id) {
            return id;
        }

        @Override // android.widget.Adapter
        public View getView(final int position, View convertView, ViewGroup parent) {
            final ViewHolder holder;
            if (convertView == null) {
                convertView = this.mInflater.inflate(R.layout.pic_item, (ViewGroup) null);
                AbsListView.LayoutParams params = new AbsListView.LayoutParams(-1, MainActivity.this.height);
                convertView.setLayoutParams(params);
                holder = new ViewHolder();
                holder.layout = (LinearLayout) convertView.findViewById(R.id.linearlayout_pre);
                holder.name = (TextView) convertView.findViewById(R.id.textView_pre);
                holder.code = (TextView) convertView.findViewById(R.id.textView_versioncode);
                holder.image = (ImageView) convertView.findViewById(R.id.imageView_pre);
                holder.btn_start = (Button) convertView.findViewById(R.id.btn_start);
                holder.btn_uninstall = (Button) convertView.findViewById(R.id.btn_uninstall);
                ViewGroup.LayoutParams para = holder.image.getLayoutParams();
                para.height = MainActivity.this.pic_height;
                para.width = MainActivity.this.pic_width;
                holder.image.setLayoutParams(para);
                convertView.setTag(holder);
            } else {
                holder = (ViewHolder) convertView.getTag();
            }
            if (MainActivity.market_applist != null && position < MainActivity.market_applist.size()) {
                this.appinfo = new AppInfo();
                this.appinfo = MainActivity.market_applist.get(position);
                Log.i(MainActivity.TAG, this.appinfo.appname);
                if (this.appinfo.islocal) {
                    holder.btn_start.setFocusable(false);
                    holder.btn_uninstall.setFocusable(false);
                    holder.btn_start.setText(MainActivity.this.getResources().getString(R.string.open_app));
                    holder.btn_start.setBackgroundDrawable(MainActivity.this.getApplicationContext().getResources().getDrawable(R.drawable.btn_open));
                    holder.btn_uninstall.setBackgroundDrawable(MainActivity.this.getApplicationContext().getResources().getDrawable(R.drawable.btn_open));
                    holder.btn_uninstall.setTextColor(MainActivity.this.getResources().getColor(R.color.whilte));
                    if (position < MainActivity.market_applist.size() && this.appinfo.doing) {
                        holder.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_updatingapp));
                    }
                    if (position < MainActivity.market_applist.size()) {
                        String apkname = this.appinfo.apkname;
                        int i = 0;
                        while (true) {
                            if (i >= HttpHelper.install_num.size()) {
                                break;
                            } else if (!HttpHelper.install_num.get(i).get("apkname").equals(apkname)) {
                                i++;
                            } else {
                                holder.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_updatingapp));
                                break;
                            }
                        }
                    }
                    holder.btn_uninstall.setVisibility(0);
                    if (position < MainActivity.market_applist.size()) {
                        holder.name.setText(this.appinfo.appname);
                        if (this.appinfo.update) {
                            holder.code.setText(String.valueOf(MainActivity.this.getResources().getString(R.string.appmanager_version)) + this.appinfo.local_versionName + "\r\n" + MainActivity.this.getResources().getString(R.string.appmanager_newversion) + this.appinfo.versionName);
                            holder.btn_start.setBackgroundDrawable(MainActivity.this.getApplicationContext().getResources().getDrawable(R.drawable.btn_update));
                            holder.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_updateapp));
                            holder.btn_start.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.1
                                @Override // android.view.View.OnClickListener
                                public void onClick(View v) {
                                    Log.i("TAGS", String.valueOf(position) + "====" + position + "更新");
                                    if (MainActivity.this.getResources().getString(R.string.appmanager_updatingapp).equals(holder.btn_start.getText())) {
                                        Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_updating), 0).show();
                                        return;
                                    }
                                    Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_startupdate), 0).show();
                                    holder.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_updatingapp));
                                    File file = new File(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + MyAdapter.this.appinfo.apkname);
                                    if (file.exists()) {
                                        file.delete();
                                    }
                                    HttpHelper.download(position, 0);
                                }
                            });
                            convertView.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.2
                                @Override // android.view.View.OnClickListener
                                public void onClick(View v) {
                                    Log.i(MainActivity.TAG, "准备打开。。。");
                                    if (MainActivity.this.getResources().getString(R.string.appmanager_updatingapp).equals(holder.btn_start.getText())) {
                                        Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_updating), 0).show();
                                        return;
                                    }
                                    new Intent();
                                    Intent intent = MainActivity.this.getPackageManager().getLaunchIntentForPackage(MainActivity.market_applist.get(position).packagename);
                                    MainActivity.this.startActivity(intent);
                                }
                            });
                        } else {
                            holder.code.setText(String.valueOf(MainActivity.this.getResources().getString(R.string.appmanager_version)) + this.appinfo.versionName);
                            convertView.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.3
                                @Override // android.view.View.OnClickListener
                                public void onClick(View v) {
                                    Log.i(MainActivity.TAG, "准备打开。。。");
                                    if (MainActivity.this.getResources().getString(R.string.appmanager_updatingapp).equals(holder.btn_start.getText())) {
                                        Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_updating), 0).show();
                                        return;
                                    }
                                    new Intent();
                                    Intent intent = MainActivity.this.getPackageManager().getLaunchIntentForPackage(MainActivity.market_applist.get(position).packagename);
                                    MainActivity.this.startActivity(intent);
                                }
                            });
                        }
                    }
                    if (MainActivity.market_applist != null && position < MainActivity.market_applist.size()) {
                        if (this.appinfo.appicon != null) {
                            holder.image.setImageDrawable(this.appinfo.appicon);
                        } else {
                            holder.image.setImageResource(R.drawable.default_icon);
                        }
                    }
                    convertView.findViewById(R.id.btn_start).setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.4
                        @Override // android.view.View.OnClickListener
                        public void onClick(View v) {
                            if (MainActivity.this.getResources().getString(R.string.appmanager_updatingapp).equals(holder.btn_start.getText())) {
                                Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_updating), 0).show();
                            } else if (MainActivity.this.getResources().getString(R.string.appmanager_updateapp).equals(holder.btn_start.getText())) {
                                Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_startupdate), 0).show();
                                holder.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_updatingapp));
                                File file = new File(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + MyAdapter.this.appinfo.apkname);
                                if (file.exists()) {
                                    file.delete();
                                }
                                HttpHelper.download(position, 0);
                            } else {
                                new Intent();
                                Intent intent = MainActivity.this.getPackageManager().getLaunchIntentForPackage(MainActivity.market_applist.get(position).packagename);
                                MainActivity.this.startActivity(intent);
                            }
                        }
                    });
                    convertView.findViewById(R.id.btn_uninstall).setOnClickListener(new AnonymousClass5(position));
                } else if (MainActivity.market_applist.size() != 0) {
                    synchronized (MainActivity.market_applist) {
                        holder.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_install));
                        if (position < MainActivity.market_applist.size() && this.appinfo.doing) {
                            holder.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_installing));
                        }
                        holder.btn_start.setBackgroundDrawable(MainActivity.this.getApplicationContext().getResources().getDrawable(R.drawable.btn_open));
                        holder.btn_uninstall.setBackgroundDrawable(MainActivity.this.getApplicationContext().getResources().getDrawable(R.drawable.btn_uninstall));
                        holder.btn_uninstall.setTextColor(MainActivity.this.getResources().getColor(R.color.btn_uninstall));
                        if (position < MainActivity.market_applist.size()) {
                            String apkname2 = this.appinfo.apkname;
                            int i2 = 0;
                            while (true) {
                                if (i2 < HttpHelper.install_num.size()) {
                                    boolean islocal = this.appinfo.islocal;
                                    if (!HttpHelper.install_num.get(i2).get("apkname").equals(apkname2) || islocal) {
                                        i2++;
                                    } else {
                                        holder.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_installing));
                                        break;
                                    }
                                } else {
                                    break;
                                }
                            }
                        }
                        holder.name.setText(this.appinfo.appname);
                        holder.code.setText(String.valueOf(MainActivity.this.getResources().getString(R.string.appmanager_version)) + this.appinfo.versionName);
                        if (position < MainActivity.market_applist.size()) {
                            if (this.appinfo.appicon != null) {
                                holder.image.setImageDrawable(this.appinfo.appicon);
                            } else {
                                holder.image.setImageResource(R.drawable.default_icon);
                            }
                        }
                        convertView.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.6
                            @Override // android.view.View.OnClickListener
                            public void onClick(View v) {
                            }
                        });
                        convertView.findViewById(R.id.btn_start).setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.7
                            @Override // android.view.View.OnClickListener
                            public void onClick(View v) {
                                if (!MainActivity.this.getResources().getString(R.string.appmanager_installing).equals(holder.btn_start.getText())) {
                                    Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_startdown), 0).show();
                                    if (MainActivity.market_applist.size() > position) {
                                        String apkname3 = MainActivity.market_applist.get(position).apkname;
                                        holder.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_installing));
                                        File file = new File(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + apkname3);
                                        if (file.exists()) {
                                            file.delete();
                                        }
                                        HttpHelper.download(position, 1);
                                    }
                                }
                            }
                        });
                    }
                }
            }
            return convertView;
        }

        /* renamed from: com.edutech.appmanage.MainActivity$MyAdapter$5 */
        /* loaded from: classes.dex */
        class AnonymousClass5 implements View.OnClickListener {
            private final /* synthetic */ int val$position;

            AnonymousClass5(int i) {
                MyAdapter.this = r1;
                this.val$position = i;
            }

            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                final String packagename = MainActivity.market_applist.get(this.val$position).packagename;
                AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
                builder.setTitle(MainActivity.this.getResources().getString(R.string.uninstall)).setMessage(String.valueOf(MainActivity.this.getResources().getString(R.string.appmanager_quituninstall)) + MainActivity.market_applist.get(this.val$position).appname + MainActivity.this.getResources().getString(R.string.appmanager_ma));
                builder.setNegativeButton(MainActivity.this.getResources().getString(R.string.appmanager_ok), new DialogInterface.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.5.1
                    /* JADX WARN: Type inference failed for: r0v0, types: [com.edutech.appmanage.MainActivity$MyAdapter$5$1$1] */
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int which) {
                        final String str = packagename;
                        new Thread() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.5.1.1
                            @Override // java.lang.Thread, java.lang.Runnable
                            public void run() {
                                super.run();
                                Message message = MainActivity.this.mHandlerApk.obtainMessage();
                                message.what = MainActivity.apk_uninstall;
                                message.obj = str;
                                MainActivity.this.mHandlerApk.sendMessage(message);
                            }
                        }.start();
                    }
                });
                builder.setPositiveButton(MainActivity.this.getResources().getString(R.string.appmanager_cancel), new DialogInterface.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.5.2
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                });
                builder.create().show();
            }
        }

        /* loaded from: classes.dex */
        public final class ViewHolder {
            public Button btn_start;
            public Button btn_uninstall;
            public TextView code;
            public ImageView image;
            public LinearLayout layout;
            public TextView name;

            public ViewHolder() {
                MyAdapter.this = r1;
            }
        }
    }

    public void startTimer() {
        if (this.mTimer == null) {
            this.mTimer = new Timer();
        }
        if (this.mTimerTask == null) {
            this.mTimerTask = new TimerTask() { // from class: com.edutech.appmanage.MainActivity.17
                @Override // java.util.TimerTask, java.lang.Runnable
                public void run() {
                    MainActivity.count++;
                    Log.e(MainActivity.TAG, new StringBuilder(String.valueOf(MainActivity.count)).toString());
                    if (30 == MainActivity.count) {
                        MainActivity.this.progress_handler.sendEmptyMessage(2);
                        MainActivity.this.wrong_handler.sendEmptyMessage(2);
                    }
                }
            };
        }
        if (this.mTimer != null && this.mTimerTask != null) {
            this.mTimer.schedule(this.mTimerTask, 0L, 1000L);
        }
    }

    public void stopTimer() {
        if (this.mTimer != null) {
            this.mTimer.cancel();
            this.mTimer = null;
        }
        if (this.mTimerTask != null) {
            this.mTimerTask.cancel();
            this.mTimerTask = null;
        }
        count = 0;
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        return true;
    }

    public int userLogin(String mServerIp, String musercode, String mPassWord) {
        int result = -1;
        String url = LOGINURL(mServerIp, musercode, mPassWord);
        HttpPost httpRequest = new HttpPost(url);
        try {
            List<NameValuePair> params = new ArrayList<>();
            httpRequest.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
            HttpResponse httpResponse = new DefaultHttpClient().execute(httpRequest);
            if (httpResponse.getStatusLine().getStatusCode() == 200) {
                String strResult = EntityUtils.toString(httpResponse.getEntity());
                result = JsonHelper.parseHttpPostReturnJson(strResult);
                Log.i(TAG, "RES:" + result);
                return result;
            }
        } catch (ClientProtocolException e) {
            Log.i(TAG, LogHelp.TYPE_GUIDANCE);
            e.printStackTrace();
        } catch (IOException e2) {
            Log.i(TAG, LogHelp.TYPE_MYWORK);
            e2.printStackTrace();
        } catch (Exception e3) {
            Log.i(TAG, LogHelp.TYPE_HWHELP);
            e3.printStackTrace();
        }
        return result;
    }

    public static String LOGINURL(String ip, String usercode, String pwd) {
        return "http://" + ip + "/default/index/pad-login/code/" + usercode + "/pwd/" + pwd;
    }

    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btn_refresh /* 2131362262 */:
                if (!this.data_load) {
                    Toast.makeText(getApplication(), getResources().getString(R.string.appmanager_unloading), 0).show();
                    return;
                } else if (!this.pic_load) {
                    Toast.makeText(getApplication(), getResources().getString(R.string.appmanager_iconunloading), 0).show();
                    return;
                } else {
                    this.data_load = false;
                    this.pic_load = false;
                    this.toast_unlink = false;
                    Toast.makeText(getApplication(), getResources().getString(R.string.action_refresh), 0).show();
                    getMarketInfor();
                    return;
                }
            default:
                return;
        }
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.edutech.appmanage.MainActivity$18] */
    public void complete() {
        new Thread() { // from class: com.edutech.appmanage.MainActivity.18
            @Override // java.lang.Thread, java.lang.Runnable
            public synchronized void run() {
                MainActivity.this.parse_json();
            }
        }.start();
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public boolean deleteFile(String sPath) {
        File file = new File(sPath);
        if (!file.isFile() || !file.exists()) {
            return false;
        }
        boolean flag = file.delete();
        return flag;
    }

    /* loaded from: classes.dex */
    class GetBroadcast extends BroadcastReceiver {
        GetBroadcast() {
            MainActivity.this = r1;
        }

        @Override // android.content.BroadcastReceiver
        public synchronized void onReceive(Context context, Intent intent) {
            String package_name = intent.getDataString().split(":")[1];
            Log.i(MainActivity.TAG, intent.getAction());
            if ("android.intent.action.PACKAGE_ADDED".equals(intent.getAction())) {
                if (MainActivity.market_applist != null) {
                    int j = 0;
                    while (true) {
                        if (j >= MainActivity.market_applist.size()) {
                            break;
                        } else if (!MainActivity.market_applist.get(j).packagename.equals(package_name)) {
                            j++;
                        } else {
                            MainActivity.market_applist.get(j).doing = false;
                            MainActivity.market_applist.get(j).islocal = true;
                            break;
                        }
                    }
                }
                if (HttpHelper.install_num != null) {
                    int j2 = 0;
                    while (true) {
                        if (j2 >= HttpHelper.install_num.size()) {
                            break;
                        } else if (!package_name.equals(HttpHelper.install_num.get(j2).get("packagename").toString())) {
                            j2++;
                        } else {
                            MainActivity.this.deleteFile(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + HttpHelper.install_num.get(j2).get("apkname").toString());
                            HttpHelper.install_num.remove(j2);
                            break;
                        }
                    }
                }
                MainActivity.this.complete();
            } else if ("android.intent.action.PACKAGE_REMOVED".equals(intent.getAction())) {
                if (MainActivity.market_applist != null) {
                    int j3 = 0;
                    while (true) {
                        if (j3 >= MainActivity.market_applist.size()) {
                            break;
                        } else if (!MainActivity.market_applist.get(j3).packagename.equals(package_name)) {
                            j3++;
                        } else {
                            MainActivity.market_applist.get(j3).doing = false;
                            MainActivity.market_applist.get(j3).islocal = false;
                            break;
                        }
                    }
                }
                if (HttpHelper.install_num != null) {
                    int j4 = 0;
                    while (true) {
                        if (j4 >= HttpHelper.install_num.size()) {
                            break;
                        } else if (!package_name.equals(HttpHelper.install_num.get(j4).get("packagename").toString())) {
                            j4++;
                        } else {
                            HttpHelper.install_num.remove(j4);
                            break;
                        }
                    }
                }
                MainActivity.this.complete();
            } else if ("android.intent.action.PACKAGE_REPLACED".equals(intent.getAction())) {
                if (MainActivity.market_applist != null) {
                    int j5 = 0;
                    while (true) {
                        if (j5 >= MainActivity.market_applist.size()) {
                            break;
                        } else if (!MainActivity.market_applist.get(j5).packagename.equals(package_name)) {
                            j5++;
                        } else {
                            MainActivity.market_applist.get(j5).doing = false;
                            MainActivity.market_applist.get(j5).update = false;
                            break;
                        }
                    }
                }
                if (HttpHelper.install_num != null) {
                    int j6 = 0;
                    while (true) {
                        if (j6 >= HttpHelper.install_num.size()) {
                            break;
                        } else if (!package_name.equals(HttpHelper.install_num.get(j6).get("packagename").toString())) {
                            j6++;
                        } else {
                            MainActivity.this.deleteFile(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + HttpHelper.install_num.get(j6).get("apkname").toString());
                            HttpHelper.install_num.remove(j6);
                            break;
                        }
                    }
                }
                MainActivity.this.complete();
            }
        }
    }

    /* loaded from: classes.dex */
    class CompleteReceiver extends BroadcastReceiver {
        long completeDownloadId = 0;
        Handler handler = new Handler() { // from class: com.edutech.appmanage.MainActivity.CompleteReceiver.1
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                super.handleMessage(msg);
                switch (msg.what) {
                    case 1:
                        Toast.makeText(CompleteReceiver.this.mycontext, MainActivity.this.getResources().getString(R.string.appmanager_downerror), 0).show();
                        return;
                    case 2:
                        Toast.makeText(CompleteReceiver.this.mycontext, MainActivity.this.getResources().getString(R.string.appmanager_installerror1), 0).show();
                        return;
                    case 3:
                        Toast.makeText(CompleteReceiver.this.mycontext, MainActivity.this.getResources().getString(R.string.appmanager_installerror2), 0).show();
                        return;
                    default:
                        return;
                }
            }
        };
        Context mycontext;

        CompleteReceiver() {
            MainActivity.this = r3;
        }

        /* JADX WARN: Type inference failed for: r5v51, types: [com.edutech.appmanage.MainActivity$CompleteReceiver$2] */
        @Override // android.content.BroadcastReceiver
        public synchronized void onReceive(final Context context, Intent intent) {
            Log.i(MainActivity.TAG, "2586---RECEIVICE" + intent.getAction());
            if (intent.getAction().equals("android.intent.action.DOWNLOAD_COMPLETE") && this.completeDownloadId != intent.getLongExtra("extra_download_id", -1L)) {
                this.completeDownloadId = intent.getLongExtra("extra_download_id", -1L);
                if (MainActivity.downloadManagerPro != null) {
                    Log.i(MainActivity.TAG, "2603---RECEIVICE" + MainActivity.downloadManagerPro.getStatusById(this.completeDownloadId));
                    if (MainActivity.downloadManagerPro.getStatusById(this.completeDownloadId) == 8) {
                        new Thread() { // from class: com.edutech.appmanage.MainActivity.CompleteReceiver.2
                            @Override // java.lang.Thread, java.lang.Runnable
                            public synchronized void run() {
                                super.run();
                                long id = CompleteReceiver.this.completeDownloadId;
                                Log.i(MainActivity.TAG, "2618---aaa  :" + HttpHelper.install_num.size());
                                int i = 0;
                                while (true) {
                                    if (i >= HttpHelper.install_num.size()) {
                                        break;
                                    } else if (id != ((Long) HttpHelper.install_num.get(i).get("downid")).longValue()) {
                                        i++;
                                    } else {
                                        MainActivity.downloadManager.remove(id);
                                        if (!((Boolean) HttpHelper.install_num.get(i).get("setuped")).booleanValue()) {
                                            HttpHelper.install_num.get(i).put("setuped", true);
                                            int num = ((Integer) HttpHelper.install_num.get(i).get("position")).intValue();
                                            int type = ((Integer) HttpHelper.install_num.get(i).get("type")).intValue();
                                            String name = (String) HttpHelper.install_num.get(i).get("apkname");
                                            Log.i(MainActivity.TAG, "2638---name--->" + name);
                                            Log.i(MainActivity.TAG, "2639---type--->" + type);
                                            if (1 == type) {
                                                File file = new File(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + name);
                                                if (!file.exists() || 0 == file.length()) {
                                                    CompleteReceiver.this.mycontext = context;
                                                    CompleteReceiver.this.handler.sendEmptyMessage(1);
                                                } else {
                                                    Log.i(MainActivity.TAG, "2671");
                                                    Message message = MainActivity.this.mHandlerApk.obtainMessage();
                                                    message.what = MainActivity.apk_install;
                                                    message.obj = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + name;
                                                    MainActivity.this.mHandlerApk.sendMessage(message);
                                                }
                                                int j = 0;
                                                while (true) {
                                                    if (j >= HttpHelper.install_num.size()) {
                                                        break;
                                                    } else if (!name.equals(HttpHelper.install_num.get(j).get("apkname").toString())) {
                                                        j++;
                                                    } else {
                                                        HttpHelper.install_num.remove(j);
                                                        break;
                                                    }
                                                }
                                                if (!MainActivity.delete_apkfile.contains(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + name)) {
                                                    MainActivity.delete_apkfile.add(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + name);
                                                }
                                            } else if (type == 0) {
                                                String name2 = MainActivity.market_applist.get(num).apkname;
                                                File file2 = new File(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + name2);
                                                if (!file2.exists() || 0 == file2.length()) {
                                                    CompleteReceiver.this.mycontext = context;
                                                    CompleteReceiver.this.handler.sendEmptyMessage(1);
                                                } else {
                                                    Log.i(MainActivity.TAG, "2782");
                                                    Message message2 = MainActivity.this.mHandlerApk.obtainMessage();
                                                    message2.what = 0;
                                                    message2.obj = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + name2;
                                                    MainActivity.this.mHandlerApk.sendMessage(message2);
                                                }
                                                int j2 = 0;
                                                while (true) {
                                                    if (j2 >= HttpHelper.install_num.size()) {
                                                        break;
                                                    } else if (!name2.equals(HttpHelper.install_num.get(j2).get("apkname").toString())) {
                                                        j2++;
                                                    } else {
                                                        HttpHelper.install_num.remove(j2);
                                                        break;
                                                    }
                                                }
                                                if (!MainActivity.delete_apkfile.contains(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + name2)) {
                                                    MainActivity.delete_apkfile.add(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + name2);
                                                }
                                            }
                                        }
                                    }
                                }
                                MainActivity.this.complete();
                            }
                        }.start();
                    } else if (MainActivity.downloadManagerPro.getStatusById(this.completeDownloadId) != 4) {
                        long id = this.completeDownloadId;
                        for (int i = 0; i < HttpHelper.install_num.size(); i++) {
                            if (id == ((Long) HttpHelper.install_num.get(i).get("downid")).longValue()) {
                                if (((Boolean) HttpHelper.install_num.get(i).get("setuped")).booleanValue()) {
                                    break;
                                }
                                this.mycontext = context;
                                this.handler.sendEmptyMessage(1);
                                String name = (String) HttpHelper.install_num.get(i).get("apkname");
                                int j = 0;
                                while (true) {
                                    if (j < HttpHelper.install_num.size()) {
                                        if (!name.equals(HttpHelper.install_num.get(j).get("apkname").toString())) {
                                            j++;
                                        } else {
                                            HttpHelper.install_num.remove(j);
                                            break;
                                        }
                                    } else {
                                        break;
                                    }
                                }
                                int j2 = 0;
                                while (true) {
                                    if (j2 < MainActivity.market_applist.size()) {
                                        if (!MainActivity.market_applist.get(j2).packagename.equals(name)) {
                                            j2++;
                                        } else {
                                            MainActivity.market_applist.get(j2).doing = false;
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                        MainActivity.this.complete();
                    }
                }
            }
        }
    }

    public void toast(final String text) {
        runOnUiThread(new Runnable() { // from class: com.edutech.appmanage.MainActivity.19
            @Override // java.lang.Runnable
            public void run() {
                Toast.makeText(MainActivity.this.getApplicationContext(), text, 0).show();
            }
        });
    }

    public String Get_Config_Json(String url, String username) {
        if (url == null || url.equals("") || username == null || username.equals("")) {
            Log.e(TAG, "Get_Config_Json 入参有问题。。。");
            return null;
        }
        try {
            HttpResponse httpResponse = Get_http_addheader(url, username);
            Log.e(TAG, "解析返回的内容...");
            if (httpResponse == null) {
                return null;
            }
            if (httpResponse.getStatusLine().getStatusCode() == 200) {
                StringBuilder builder = new StringBuilder();
                BufferedReader bufferedReader2 = new BufferedReader(new InputStreamReader(httpResponse.getEntity().getContent(), "UTF-8"));
                for (String s = bufferedReader2.readLine(); s != null; s = bufferedReader2.readLine()) {
                    builder.append(s);
                }
                String resultString = builder.toString();
                System.out.println(resultString);
                Log.e(TAG, "学校和用户个人信息获取完成。。。");
                return resultString;
            }
            Log.e(TAG, "与服务端连接失败。。。");
            Log.e(TAG, "连接状态码Status=" + httpResponse.getStatusLine().getStatusCode());
            Log.e(TAG, "ddddd=" + httpResponse.getEntity());
            return null;
        } catch (ClientProtocolException e) {
            e.printStackTrace();
            return null;
        } catch (IOException e2) {
            e2.printStackTrace();
            return null;
        }
    }

    private HttpResponse Get_http_addheader(String url, String user_Name) throws IOException, ClientProtocolException {
        HttpGet request = new HttpGet(url);
        request.addHeader("X-Edutech-Entity", user_Name);
        long imestamp = System.currentTimeMillis();
        String sign = My_md5.Md5(String.valueOf(imestamp) + user_Name);
        Log.e(TAG, "timestamp=" + imestamp + "   sign=" + sign);
        request.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
        DefaultHttpClient httpClient = new DefaultHttpClient();
        HttpResponse httpResponse = httpClient.execute(request);
        return httpResponse;
    }

    public boolean jsonToConfig(String json_str) {
        if (json_str == null || json_str.equals("")) {
            return false;
        }
        try {
            JSONObject info = new JSONObject(json_str);
            Log.i(TAG, "info :" + info);
            String status = info.getString("status");
            String errorNum = info.getString("errorNum");
            String errorInfo = info.getString("errorInfo");
            if (errorNum.equals("0")) {
                JSONObject data = info.getJSONObject("data");
                Log.i(TAG, "status :" + status);
                Log.i(TAG, "errorNum :" + errorNum);
                Log.i(TAG, "errorInfo :" + errorInfo);
                Log.i(TAG, "data :" + data);
                String privatekey = data.getString("privatekey");
                JSONObject userArray = data.getJSONObject(UserID.ELEMENT_NAME);
                try {
                    this.usercode = userArray.getString("usercode");
                } catch (Exception e) {
                    e.printStackTrace();
                }
                Log.i(TAG, "privatekey :" + privatekey);
                Log.i(TAG, "encrypt :" + ((String) null));
                Log.i(TAG, "apihost :" + ((String) null));
                try {
                    JSONObject tigase = data.getJSONObject("tigase");
                    String domain = null;
                    String port = null;
                    try {
                        domain = tigase.getString(ClientCookie.DOMAIN_ATTR);
                    } catch (Exception e2) {
                        e2.printStackTrace();
                    }
                    try {
                        port = tigase.getString(ClientCookie.PORT_ATTR);
                    } catch (Exception e3) {
                        e3.printStackTrace();
                    }
                    Log.i(TAG, "domain :" + domain);
                    Log.i(TAG, "port :" + port);
                } catch (Exception e4) {
                    e4.printStackTrace();
                }
                try {
                    JSONObject mongo = data.getJSONObject("mongo");
                    String mongo_domain = null;
                    String mongo_port = null;
                    String mongo_user = null;
                    String mongo_pwd = null;
                    try {
                        mongo_domain = mongo.getString(ClientCookie.DOMAIN_ATTR);
                    } catch (Exception e5) {
                        e5.printStackTrace();
                    }
                    try {
                        mongo_port = mongo.getString(ClientCookie.PORT_ATTR);
                    } catch (Exception e6) {
                        e6.printStackTrace();
                    }
                    try {
                        mongo_user = mongo.getString(UserID.ELEMENT_NAME);
                    } catch (Exception e7) {
                        e7.printStackTrace();
                    }
                    try {
                        mongo_pwd = mongo.getString("pwd");
                    } catch (Exception e8) {
                        e8.printStackTrace();
                    }
                    Log.i(TAG, "mongo_domain :" + mongo_domain);
                    Log.i(TAG, "mongo_port :" + mongo_port);
                    Log.i(TAG, "mongo_user :" + mongo_user);
                    Log.i(TAG, "mongo_pwd :" + mongo_pwd);
                } catch (Exception e9) {
                    e9.printStackTrace();
                }
                return true;
            }
            Log.i(TAG, "配置信息 json数据  返回错误数据。。。");
            return false;
        } catch (JSONException e10) {
            e10.printStackTrace();
            return false;
        }
    }
}
