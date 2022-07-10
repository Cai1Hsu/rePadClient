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
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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
    Runnable net_thread = new AnonymousClass1();
    Handler unlink_handler = new AnonymousClass2();
    Handler handler_toast = new AnonymousClass3();
    Handler wrong_handler = new AnonymousClass4();
    Handler progress_handler = new AnonymousClass5();
    Runnable runnableUi = new AnonymousClass6();
    private Handler mHandlerApk = new AnonymousClass7();
    Runnable runnable_GetConfig_Infor = new AnonymousClass8();
    Handler getMarkertHandler = new AnonymousClass9();

    static /* synthetic */ MyAdapter access$12(MainActivity mainActivity) {
        return mainActivity.adapter;
    }

    static /* synthetic */ GridView access$7(MainActivity mainActivity) {
        return mainActivity.gv;
    }

    static /* synthetic */ int access$18(MainActivity mainActivity) {
        return mainActivity.height;
    }

    static /* synthetic */ int access$20(MainActivity mainActivity) {
        return mainActivity.pic_width;
    }

    static /* synthetic */ int access$19(MainActivity mainActivity) {
        return mainActivity.pic_height;
    }

    static /* synthetic */ String access$0(MainActivity mainActivity) {
        return mainActivity.ip;
    }

    static /* synthetic */ String access$1(MainActivity mainActivity) {
        return mainActivity.usercode;
    }

    static /* synthetic */ String access$2(MainActivity mainActivity) {
        return mainActivity.pwd;
    }

    static /* synthetic */ String access$4(MainActivity mainActivity) {
        return mainActivity.privatekey;
    }

    static /* synthetic */ String access$15(MainActivity mainActivity) {
        return mainActivity.username;
    }

    static /* synthetic */ boolean access$22(MainActivity mainActivity) {
        return mainActivity.data_load;
    }

    static /* synthetic */ void access$8(MainActivity mainActivity, boolean z) {
        mainActivity.data_load = z;
    }

    static /* synthetic */ boolean access$23(MainActivity mainActivity) {
        return mainActivity.pic_load;
    }

    static /* synthetic */ void access$9(MainActivity mainActivity, boolean z) {
        mainActivity.pic_load = z;
    }

    static /* synthetic */ int access$26() {
        return count;
    }

    static /* synthetic */ void access$27(int i) {
        count = i;
    }

    static /* synthetic */ void access$24(MainActivity mainActivity, boolean z) {
        mainActivity.toast_unlink = z;
    }

    static /* synthetic */ int access$13() {
        return apk_install;
    }

    static /* synthetic */ int access$14() {
        return apk_uninstall;
    }

    static /* synthetic */ RelativeLayout access$6(MainActivity mainActivity) {
        return mainActivity.layout_appwarning;
    }

    static /* synthetic */ ImageView access$5(MainActivity mainActivity) {
        return mainActivity.img_appwarning;
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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
        findViewById(R.id.btn_refresh).setOnClickListener(new AnonymousClass10());
        findViewById(R.id.tv_exit).setOnClickListener(new AnonymousClass11());
    }

    /* renamed from: com.edutech.appmanage.MainActivity$10 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass10 implements View.OnClickListener {
        AnonymousClass10() {
            MainActivity.this = r1;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (!MainActivity.access$22(MainActivity.this)) {
                Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_unloading), 0).show();
            } else if (!MainActivity.access$23(MainActivity.this)) {
                Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_iconunloading), 0).show();
            } else {
                MainActivity.access$8(MainActivity.this, false);
                MainActivity.access$9(MainActivity.this, false);
                MainActivity.access$24(MainActivity.this, false);
                Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.action_refresh), 0).show();
                MainActivity.access$25(MainActivity.this);
            }
        }
    }

    /* renamed from: com.edutech.appmanage.MainActivity$11 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass11 implements View.OnClickListener {
        AnonymousClass11() {
            MainActivity.this = r1;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            MainActivity.this.finish();
        }
    }

    /* renamed from: com.edutech.appmanage.MainActivity$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 implements Runnable {
        AnonymousClass1() {
            MainActivity.this = r1;
        }

        @Override // java.lang.Runnable
        public synchronized void run() {
            MainActivity.this.progress_handler.sendEmptyMessage(3);
            MainActivity.this.progress_handler.sendEmptyMessage(1);
            MainActivity.this.login_res = MainActivity.access$3(MainActivity.this, MainActivity.access$0(MainActivity.this), MainActivity.access$1(MainActivity.this), MainActivity.access$2(MainActivity.this));
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
                Log.i(MainActivity.TAG, "usercode==" + MainActivity.access$1(MainActivity.this));
                String res_id = HttpHelper.getin("http://" + MainActivity.access$0(MainActivity.this) + "/api/pad-login/code/" + MainActivity.access$1(MainActivity.this) + "/pwd/" + MainActivity.access$2(MainActivity.this), MainActivity.access$1(MainActivity.this), MainActivity.access$4(MainActivity.this));
                Log.i(MainActivity.TAG, "333---RES_ID  :" + res_id);
                if (res_id != null) {
                    String stu_id = MainActivity.this.parse_studentid(res_id);
                    if (stu_id == null) {
                        Log.i(MainActivity.TAG, "338");
                        MainActivity.this.handler_toast.sendEmptyMessage(4);
                    } else {
                        String infor = HttpHelper.getin("http://" + MainActivity.access$0(MainActivity.this) + "/api/app/projectcode/myapp/os/android", MainActivity.access$1(MainActivity.this), MainActivity.access$4(MainActivity.this));
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
    }

    /* renamed from: com.edutech.appmanage.MainActivity$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass2 extends Handler {
        AnonymousClass2() {
            MainActivity.this = r1;
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            switch (msg.what) {
                case 1:
                    if (MainActivity.market_applist.size() == 0) {
                        MainActivity.this.wrong_net.setText(MainActivity.this.getResources().getString(R.string.appmanager_errornetwork));
                        MainActivity.this.wrong_net.setVisibility(0);
                        MainActivity.access$5(MainActivity.this).setBackgroundResource(R.drawable.nointernet);
                        MainActivity.access$6(MainActivity.this).setVisibility(0);
                        MainActivity.access$7(MainActivity.this).setVisibility(8);
                        return;
                    }
                    MainActivity.this.wrong_net.setVisibility(8);
                    MainActivity.access$6(MainActivity.this).setVisibility(8);
                    MainActivity.access$7(MainActivity.this).setVisibility(0);
                    return;
                case 2:
                    Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_errornetwork), 0).show();
                    return;
                case 3:
                    MainActivity.this.wrong_net.setVisibility(8);
                    MainActivity.access$6(MainActivity.this).setVisibility(8);
                    MainActivity.access$7(MainActivity.this).setVisibility(0);
                    return;
                default:
                    return;
            }
        }
    }

    /* renamed from: com.edutech.appmanage.MainActivity$3 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass3 extends Handler {
        AnonymousClass3() {
            MainActivity.this = r1;
        }

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
        Collections.sort(market_applist, new AnonymousClass12());
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

    /* renamed from: com.edutech.appmanage.MainActivity$12 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass12 implements Comparator<AppInfo> {
        AnonymousClass12() {
            MainActivity.this = r1;
        }

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
    }

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
        new AnonymousClass13().start();
        compare();
        this.progress_handler.sendEmptyMessage(2);
        this.handler.post(this.runnableUi);
    }

    /* renamed from: com.edutech.appmanage.MainActivity$13 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass13 extends Thread {
        AnonymousClass13() {
            MainActivity.this = r1;
        }

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
            while (!MainActivity.access$22(MainActivity.this)) {
                try {
                    sleep(500L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            for (int i = 0; i < MainActivity.market_applist.size(); i++) {
                int j = 0;
                while (true) {
                    if (j < MainActivity.market_applist_local.size()) {
                        if (!MainActivity.market_applist.get(i).packagename.equals(MainActivity.market_applist_local.get(j).packagename)) {
                            j++;
                        } else {
                            try {
                                MainActivity.market_applist.get(i).appicon = MainActivity.this.getImageDrawable(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + File.separatorChar + "icon" + File.separatorChar + MainActivity.market_applist.get(i).packagename + ".png");
                                break;
                            } catch (IOException e2) {
                                e2.printStackTrace();
                            }
                        }
                    }
                }
            }
            MainActivity.this.handler.post(MainActivity.this.runnableUi);
        }
    }

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
        Collections.sort(market_applist, new AnonymousClass14());
        if (this.silent_uninstall.size() != 0) {
            Intent uninstall_intent = new Intent(this, SilentUninstall_Service.class);
            uninstall_intent.putStringArrayListExtra("uninstall_list", this.silent_uninstall);
            startService(uninstall_intent);
        }
        this.data_load = true;
        new AnonymousClass15().start();
    }

    /* renamed from: com.edutech.appmanage.MainActivity$14 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass14 implements Comparator<AppInfo> {
        AnonymousClass14() {
            MainActivity.this = r1;
        }

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
    }

    /* renamed from: com.edutech.appmanage.MainActivity$15 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass15 extends Thread {
        AnonymousClass15() {
            MainActivity.this = r1;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            super.run();
            for (int i = 0; i < MainActivity.market_applist.size(); i++) {
                int j = 0;
                while (true) {
                    if (j < MainActivity.market_applist_local.size()) {
                        if (!MainActivity.market_applist.get(i).packagename.equals(MainActivity.market_applist_local.get(j).packagename)) {
                            j++;
                        } else {
                            try {
                                MainActivity.market_applist.get(i).appicon = MainActivity.this.getImageDrawable(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + File.separatorChar + "icon" + File.separatorChar + MainActivity.market_applist.get(i).packagename + ".png");
                                break;
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                }
            }
            MainActivity.access$9(MainActivity.this, true);
        }
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
            new AnonymousClass16().start();
            return;
        }
        parse_json();
    }

    /* renamed from: com.edutech.appmanage.MainActivity$16 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass16 extends Thread {
        AnonymousClass16() {
            MainActivity.this = r1;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public synchronized void run() {
            MainActivity.this.parse_json();
        }
    }

    static /* synthetic */ void access$25(MainActivity mainActivity) {
        mainActivity.getMarketInfor();
    }

    private void getMarketInfor() {
        ConnectivityManager manager = (ConnectivityManager) getSystemService("connectivity");
        NetworkInfo.State wifi = manager.getNetworkInfo(1).getState();
        if (wifi == NetworkInfo.State.CONNECTED) {
            new Thread(this.net_thread).start();
        } else {
            unlink_parse(SharedPreferencesHelper.load_info());
        }
    }

    /* renamed from: com.edutech.appmanage.MainActivity$4 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass4 extends Handler {
        AnonymousClass4() {
            MainActivity.this = r1;
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            switch (msg.what) {
                case 1:
                    MainActivity.this.wrong_net.setText(MainActivity.this.getResources().getString(R.string.appmanager_errorsetting));
                    MainActivity.access$5(MainActivity.this).setBackgroundResource(R.drawable.errorsetting);
                    MainActivity.access$8(MainActivity.this, true);
                    MainActivity.access$9(MainActivity.this, true);
                    break;
                case 2:
                    MainActivity.this.wrong_net.setText(MainActivity.this.getResources().getString(R.string.appmanager_errornetwork));
                    MainActivity.access$5(MainActivity.this).setBackgroundResource(R.drawable.nointernet);
                    MainActivity.access$8(MainActivity.this, true);
                    MainActivity.access$9(MainActivity.this, true);
                    break;
                case 3:
                    MainActivity.this.wrong_net.setText(MainActivity.this.getResources().getString(R.string.appmanager_noneapp));
                    MainActivity.access$5(MainActivity.this).setBackgroundResource(R.drawable.nodetails);
                    MainActivity.access$8(MainActivity.this, true);
                    MainActivity.access$9(MainActivity.this, true);
                    MainActivity.this.wrong_net.setVisibility(0);
                    MainActivity.access$6(MainActivity.this).setVisibility(0);
                    MainActivity.access$7(MainActivity.this).setVisibility(8);
                    break;
            }
            MainActivity.this.progress_handler.sendEmptyMessage(2);
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class MyAdapter extends BaseAdapter {
        AppInfo appinfo;
        Context context;
        private LayoutInflater mInflater;

        static /* synthetic */ MainActivity access$0(MyAdapter myAdapter) {
            return MainActivity.this;
        }

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
        public View getView(int position, View convertView, ViewGroup parent) {
            ViewHolder holder;
            if (convertView == null) {
                convertView = this.mInflater.inflate(R.layout.pic_item, (ViewGroup) null);
                AbsListView.LayoutParams params = new AbsListView.LayoutParams(-1, MainActivity.access$18(MainActivity.this));
                convertView.setLayoutParams(params);
                holder = new ViewHolder();
                holder.layout = (LinearLayout) convertView.findViewById(R.id.linearlayout_pre);
                holder.name = (TextView) convertView.findViewById(R.id.textView_pre);
                holder.code = (TextView) convertView.findViewById(R.id.textView_versioncode);
                holder.image = (ImageView) convertView.findViewById(R.id.imageView_pre);
                holder.btn_start = (Button) convertView.findViewById(R.id.btn_start);
                holder.btn_uninstall = (Button) convertView.findViewById(R.id.btn_uninstall);
                ViewGroup.LayoutParams para = holder.image.getLayoutParams();
                para.height = MainActivity.access$19(MainActivity.this);
                para.width = MainActivity.access$20(MainActivity.this);
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
                            holder.btn_start.setOnClickListener(new AnonymousClass1(position, holder));
                            convertView.setOnClickListener(new AnonymousClass2(holder, position));
                        } else {
                            holder.code.setText(String.valueOf(MainActivity.this.getResources().getString(R.string.appmanager_version)) + this.appinfo.versionName);
                            convertView.setOnClickListener(new AnonymousClass3(holder, position));
                        }
                    }
                    if (MainActivity.market_applist != null && position < MainActivity.market_applist.size()) {
                        if (this.appinfo.appicon != null) {
                            holder.image.setImageDrawable(this.appinfo.appicon);
                        } else {
                            holder.image.setImageResource(R.drawable.default_icon);
                        }
                    }
                    convertView.findViewById(R.id.btn_start).setOnClickListener(new AnonymousClass4(holder, position));
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
                        convertView.setOnClickListener(new AnonymousClass6());
                        convertView.findViewById(R.id.btn_start).setOnClickListener(new AnonymousClass7(holder, position));
                    }
                }
            }
            return convertView;
        }

        /* renamed from: com.edutech.appmanage.MainActivity$MyAdapter$1 */
        /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
        class AnonymousClass1 implements View.OnClickListener {
            private final /* synthetic */ ViewHolder val$holder;
            private final /* synthetic */ int val$position;

            AnonymousClass1(int i, ViewHolder viewHolder) {
                MyAdapter.this = r1;
                this.val$position = i;
                this.val$holder = viewHolder;
            }

            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Log.i("TAGS", String.valueOf(this.val$position) + "====" + this.val$position + "更新");
                if (MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_updatingapp).equals(this.val$holder.btn_start.getText())) {
                    Toast.makeText(MyAdapter.access$0(MyAdapter.this).getApplication(), MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_updating), 0).show();
                    return;
                }
                Toast.makeText(MyAdapter.access$0(MyAdapter.this).getApplication(), MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_startupdate), 0).show();
                this.val$holder.btn_start.setText(MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_updatingapp));
                File file = new File(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + MyAdapter.this.appinfo.apkname);
                if (file.exists()) {
                    file.delete();
                }
                HttpHelper.download(this.val$position, 0);
            }
        }

        /* renamed from: com.edutech.appmanage.MainActivity$MyAdapter$2 */
        /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
        class AnonymousClass2 implements View.OnClickListener {
            private final /* synthetic */ ViewHolder val$holder;
            private final /* synthetic */ int val$position;

            AnonymousClass2(ViewHolder viewHolder, int i) {
                MyAdapter.this = r1;
                this.val$holder = viewHolder;
                this.val$position = i;
            }

            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Log.i(MainActivity.TAG, "准备打开。。。");
                if (MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_updatingapp).equals(this.val$holder.btn_start.getText())) {
                    Toast.makeText(MyAdapter.access$0(MyAdapter.this).getApplication(), MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_updating), 0).show();
                    return;
                }
                new Intent();
                Intent intent = MyAdapter.access$0(MyAdapter.this).getPackageManager().getLaunchIntentForPackage(MainActivity.market_applist.get(this.val$position).packagename);
                MyAdapter.access$0(MyAdapter.this).startActivity(intent);
            }
        }

        /* renamed from: com.edutech.appmanage.MainActivity$MyAdapter$3 */
        /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
        class AnonymousClass3 implements View.OnClickListener {
            private final /* synthetic */ ViewHolder val$holder;
            private final /* synthetic */ int val$position;

            AnonymousClass3(ViewHolder viewHolder, int i) {
                MyAdapter.this = r1;
                this.val$holder = viewHolder;
                this.val$position = i;
            }

            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Log.i(MainActivity.TAG, "准备打开。。。");
                if (MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_updatingapp).equals(this.val$holder.btn_start.getText())) {
                    Toast.makeText(MyAdapter.access$0(MyAdapter.this).getApplication(), MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_updating), 0).show();
                    return;
                }
                new Intent();
                Intent intent = MyAdapter.access$0(MyAdapter.this).getPackageManager().getLaunchIntentForPackage(MainActivity.market_applist.get(this.val$position).packagename);
                MyAdapter.access$0(MyAdapter.this).startActivity(intent);
            }
        }

        /* renamed from: com.edutech.appmanage.MainActivity$MyAdapter$4 */
        /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
        class AnonymousClass4 implements View.OnClickListener {
            private final /* synthetic */ ViewHolder val$holder;
            private final /* synthetic */ int val$position;

            AnonymousClass4(ViewHolder viewHolder, int i) {
                MyAdapter.this = r1;
                this.val$holder = viewHolder;
                this.val$position = i;
            }

            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_updatingapp).equals(this.val$holder.btn_start.getText())) {
                    Toast.makeText(MyAdapter.access$0(MyAdapter.this).getApplication(), MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_updating), 0).show();
                } else if (MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_updateapp).equals(this.val$holder.btn_start.getText())) {
                    Toast.makeText(MyAdapter.access$0(MyAdapter.this).getApplication(), MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_startupdate), 0).show();
                    this.val$holder.btn_start.setText(MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_updatingapp));
                    File file = new File(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + MyAdapter.this.appinfo.apkname);
                    if (file.exists()) {
                        file.delete();
                    }
                    HttpHelper.download(this.val$position, 0);
                } else {
                    new Intent();
                    Intent intent = MyAdapter.access$0(MyAdapter.this).getPackageManager().getLaunchIntentForPackage(MainActivity.market_applist.get(this.val$position).packagename);
                    MyAdapter.access$0(MyAdapter.this).startActivity(intent);
                }
            }
        }

        /* renamed from: com.edutech.appmanage.MainActivity$MyAdapter$5 */
        /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
        class AnonymousClass5 implements View.OnClickListener {
            private final /* synthetic */ int val$position;

            AnonymousClass5(int i) {
                MyAdapter.this = r1;
                this.val$position = i;
            }

            static /* synthetic */ MyAdapter access$0(AnonymousClass5 anonymousClass5) {
                return MyAdapter.this;
            }

            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                String packagename = MainActivity.market_applist.get(this.val$position).packagename;
                AlertDialog.Builder builder = new AlertDialog.Builder(MyAdapter.access$0(MyAdapter.this));
                builder.setTitle(MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.uninstall)).setMessage(String.valueOf(MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_quituninstall)) + MainActivity.market_applist.get(this.val$position).appname + MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_ma));
                builder.setNegativeButton(MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_ok), new AnonymousClass1(packagename));
                builder.setPositiveButton(MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_cancel), new AnonymousClass2());
                builder.create().show();
            }

            /* renamed from: com.edutech.appmanage.MainActivity$MyAdapter$5$1 */
            /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
            class AnonymousClass1 implements DialogInterface.OnClickListener {
                private final /* synthetic */ String val$packagename;

                AnonymousClass1(String str) {
                    AnonymousClass5.this = r1;
                    this.val$packagename = str;
                }

                static /* synthetic */ AnonymousClass5 access$0(AnonymousClass1 anonymousClass1) {
                    return AnonymousClass5.this;
                }

                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    new C00011(this.val$packagename).start();
                }

                /* renamed from: com.edutech.appmanage.MainActivity$MyAdapter$5$1$1 */
                /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
                class C00011 extends Thread {
                    private final /* synthetic */ String val$packagename;

                    C00011(String str) {
                        AnonymousClass1.this = r1;
                        this.val$packagename = str;
                    }

                    @Override // java.lang.Thread, java.lang.Runnable
                    public void run() {
                        super.run();
                        Message message = MainActivity.access$21(MyAdapter.access$0(AnonymousClass5.access$0(AnonymousClass1.access$0(AnonymousClass1.this)))).obtainMessage();
                        message.what = MainActivity.access$14();
                        message.obj = this.val$packagename;
                        MainActivity.access$21(MyAdapter.access$0(AnonymousClass5.access$0(AnonymousClass1.access$0(AnonymousClass1.this)))).sendMessage(message);
                    }
                }
            }

            /* renamed from: com.edutech.appmanage.MainActivity$MyAdapter$5$2 */
            /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
            class AnonymousClass2 implements DialogInterface.OnClickListener {
                AnonymousClass2() {
                    AnonymousClass5.this = r1;
                }

                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    dialog.dismiss();
                }
            }
        }

        /* renamed from: com.edutech.appmanage.MainActivity$MyAdapter$6 */
        /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
        class AnonymousClass6 implements View.OnClickListener {
            AnonymousClass6() {
                MyAdapter.this = r1;
            }

            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
            }
        }

        /* renamed from: com.edutech.appmanage.MainActivity$MyAdapter$7 */
        /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
        class AnonymousClass7 implements View.OnClickListener {
            private final /* synthetic */ ViewHolder val$holder;
            private final /* synthetic */ int val$position;

            AnonymousClass7(ViewHolder viewHolder, int i) {
                MyAdapter.this = r1;
                this.val$holder = viewHolder;
                this.val$position = i;
            }

            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (!MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_installing).equals(this.val$holder.btn_start.getText())) {
                    Toast.makeText(MyAdapter.access$0(MyAdapter.this).getApplication(), MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_startdown), 0).show();
                    if (MainActivity.market_applist.size() > this.val$position) {
                        String apkname = MainActivity.market_applist.get(this.val$position).apkname;
                        this.val$holder.btn_start.setText(MyAdapter.access$0(MyAdapter.this).getResources().getString(R.string.appmanager_installing));
                        File file = new File(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + apkname);
                        if (file.exists()) {
                            file.delete();
                        }
                        HttpHelper.download(this.val$position, 1);
                    }
                }
            }
        }

        /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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

    /* renamed from: com.edutech.appmanage.MainActivity$5 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass5 extends Handler {
        AnonymousClass5() {
            MainActivity.this = r1;
        }

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
                    MainActivity.access$10(MainActivity.this);
                    return;
                case 2:
                    MainActivity.access$11(MainActivity.this);
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
    }

    static /* synthetic */ void access$10(MainActivity mainActivity) {
        mainActivity.startTimer();
    }

    private void startTimer() {
        if (this.mTimer == null) {
            this.mTimer = new Timer();
        }
        if (this.mTimerTask == null) {
            this.mTimerTask = new AnonymousClass17();
        }
        if (this.mTimer != null && this.mTimerTask != null) {
            this.mTimer.schedule(this.mTimerTask, 0L, 1000L);
        }
    }

    /* renamed from: com.edutech.appmanage.MainActivity$17 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass17 extends TimerTask {
        AnonymousClass17() {
            MainActivity.this = r1;
        }

        @Override // java.util.TimerTask, java.lang.Runnable
        public void run() {
            MainActivity.access$27(MainActivity.access$26() + 1);
            Log.e(MainActivity.TAG, new StringBuilder(String.valueOf(MainActivity.access$26())).toString());
            if (30 == MainActivity.access$26()) {
                MainActivity.this.progress_handler.sendEmptyMessage(2);
                MainActivity.this.wrong_handler.sendEmptyMessage(2);
            }
        }
    }

    static /* synthetic */ void access$11(MainActivity mainActivity) {
        mainActivity.stopTimer();
    }

    private void stopTimer() {
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

    /* renamed from: com.edutech.appmanage.MainActivity$6 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass6 implements Runnable {
        AnonymousClass6() {
            MainActivity.this = r1;
        }

        @Override // java.lang.Runnable
        public void run() {
            MainActivity.access$12(MainActivity.this).notifyDataSetChanged();
        }
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        return true;
    }

    static /* synthetic */ int access$3(MainActivity mainActivity, String str, String str2, String str3) {
        return mainActivity.userLogin(str, str2, str3);
    }

    private int userLogin(String mServerIp, String musercode, String mPassWord) {
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

    public void complete() {
        new AnonymousClass18().start();
    }

    /* renamed from: com.edutech.appmanage.MainActivity$18 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass18 extends Thread {
        AnonymousClass18() {
            MainActivity.this = r1;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public synchronized void run() {
            MainActivity.this.parse_json();
        }
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

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class CompleteReceiver extends BroadcastReceiver {
        long completeDownloadId = 0;
        Handler handler = new AnonymousClass1();
        Context mycontext;

        CompleteReceiver() {
            MainActivity.this = r3;
        }

        static /* synthetic */ MainActivity access$0(CompleteReceiver completeReceiver) {
            return MainActivity.this;
        }

        @Override // android.content.BroadcastReceiver
        public synchronized void onReceive(Context context, Intent intent) {
            Log.i(MainActivity.TAG, "2586---RECEIVICE" + intent.getAction());
            if (intent.getAction().equals("android.intent.action.DOWNLOAD_COMPLETE") && this.completeDownloadId != intent.getLongExtra("extra_download_id", -1L)) {
                this.completeDownloadId = intent.getLongExtra("extra_download_id", -1L);
                if (MainActivity.downloadManagerPro != null) {
                    Log.i(MainActivity.TAG, "2603---RECEIVICE" + MainActivity.downloadManagerPro.getStatusById(this.completeDownloadId));
                    if (MainActivity.downloadManagerPro.getStatusById(this.completeDownloadId) == 8) {
                        new AnonymousClass2(context).start();
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

        /* renamed from: com.edutech.appmanage.MainActivity$CompleteReceiver$2 */
        /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
        class AnonymousClass2 extends Thread {
            private final /* synthetic */ Context val$context;

            AnonymousClass2(Context context) {
                CompleteReceiver.this = r1;
                this.val$context = context;
            }

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
                                    CompleteReceiver.this.mycontext = this.val$context;
                                    CompleteReceiver.this.handler.sendEmptyMessage(1);
                                } else {
                                    Log.i(MainActivity.TAG, "2671");
                                    Message message = MainActivity.access$21(CompleteReceiver.access$0(CompleteReceiver.this)).obtainMessage();
                                    message.what = MainActivity.access$13();
                                    message.obj = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + name;
                                    MainActivity.access$21(CompleteReceiver.access$0(CompleteReceiver.this)).sendMessage(message);
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
                                    CompleteReceiver.this.mycontext = this.val$context;
                                    CompleteReceiver.this.handler.sendEmptyMessage(1);
                                } else {
                                    Log.i(MainActivity.TAG, "2782");
                                    Message message2 = MainActivity.access$21(CompleteReceiver.access$0(CompleteReceiver.this)).obtainMessage();
                                    message2.what = 0;
                                    message2.obj = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + name2;
                                    MainActivity.access$21(CompleteReceiver.access$0(CompleteReceiver.this)).sendMessage(message2);
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
                CompleteReceiver.access$0(CompleteReceiver.this).complete();
            }
        }

        /* renamed from: com.edutech.appmanage.MainActivity$CompleteReceiver$1 */
        /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
        class AnonymousClass1 extends Handler {
            AnonymousClass1() {
                CompleteReceiver.this = r1;
            }

            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                super.handleMessage(msg);
                switch (msg.what) {
                    case 1:
                        Toast.makeText(CompleteReceiver.this.mycontext, CompleteReceiver.access$0(CompleteReceiver.this).getResources().getString(R.string.appmanager_downerror), 0).show();
                        return;
                    case 2:
                        Toast.makeText(CompleteReceiver.this.mycontext, CompleteReceiver.access$0(CompleteReceiver.this).getResources().getString(R.string.appmanager_installerror1), 0).show();
                        return;
                    case 3:
                        Toast.makeText(CompleteReceiver.this.mycontext, CompleteReceiver.access$0(CompleteReceiver.this).getResources().getString(R.string.appmanager_installerror2), 0).show();
                        return;
                    default:
                        return;
                }
            }
        }
    }

    /* renamed from: com.edutech.appmanage.MainActivity$7 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass7 extends Handler {
        AnonymousClass7() {
            MainActivity.this = r1;
        }

        static /* synthetic */ MainActivity access$0(AnonymousClass7 anonymousClass7) {
            return MainActivity.this;
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            if (msg.what == MainActivity.access$13()) {
                String path = (String) msg.obj;
                Log.i(MainActivity.TAG, "path-->" + path);
                new AnonymousClass1(path).start();
            } else if (msg.what == MainActivity.access$14()) {
                String path2 = (String) msg.obj;
                Log.i(MainActivity.TAG, "path-->" + path2);
                new AnonymousClass2(path2).start();
            }
            super.handleMessage(msg);
        }

        /* renamed from: com.edutech.appmanage.MainActivity$7$1 */
        /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
        class AnonymousClass1 extends Thread {
            private final /* synthetic */ String val$path;

            AnonymousClass1(String str) {
                AnonymousClass7.this = r1;
                this.val$path = str;
            }

            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                Log.i(MainActivity.TAG, "path-->" + this.val$path);
                if (!ApkController.install(this.val$path, AnonymousClass7.access$0(AnonymousClass7.this).getApplicationContext())) {
                    AnonymousClass7.access$0(AnonymousClass7.this).toast(AnonymousClass7.access$0(AnonymousClass7.this).getResources().getString(R.string.appmanager_installfailed));
                }
            }
        }

        /* renamed from: com.edutech.appmanage.MainActivity$7$2 */
        /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
        class AnonymousClass2 extends Thread {
            private final /* synthetic */ String val$path;

            AnonymousClass2(String str) {
                AnonymousClass7.this = r1;
                this.val$path = str;
            }

            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                if (!ApkController.uninstall(this.val$path, AnonymousClass7.access$0(AnonymousClass7.this).getApplicationContext())) {
                    AnonymousClass7.access$0(AnonymousClass7.this).toast(AnonymousClass7.access$0(AnonymousClass7.this).getResources().getString(R.string.appmanager_uninstallfailed));
                }
            }
        }
    }

    static /* synthetic */ Handler access$21(MainActivity mainActivity) {
        return mainActivity.mHandlerApk;
    }

    public void toast(String text) {
        runOnUiThread(new AnonymousClass19(text));
    }

    /* renamed from: com.edutech.appmanage.MainActivity$19 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass19 implements Runnable {
        private final /* synthetic */ String val$text;

        AnonymousClass19(String str) {
            MainActivity.this = r1;
            this.val$text = str;
        }

        @Override // java.lang.Runnable
        public void run() {
            Toast.makeText(MainActivity.this.getApplicationContext(), this.val$text, 0).show();
        }
    }

    /* renamed from: com.edutech.appmanage.MainActivity$8 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass8 implements Runnable {
        AnonymousClass8() {
            MainActivity.this = r1;
        }

        @Override // java.lang.Runnable
        public void run() {
            String url = "http://" + MainActivity.access$0(MainActivity.this) + "/api/config/";
            Log.e(MainActivity.TAG, "URL:" + url);
            String result = MainActivity.access$16(MainActivity.this, url, MainActivity.access$15(MainActivity.this));
            if (result != null) {
                MainActivity.access$17(MainActivity.this, result);
            }
            Message msg = MainActivity.this.getMarkertHandler.obtainMessage();
            msg.what = 1;
            msg.sendToTarget();
        }
    }

    /* renamed from: com.edutech.appmanage.MainActivity$9 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass9 extends Handler {
        AnonymousClass9() {
            MainActivity.this = r1;
        }

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
    }

    static /* synthetic */ String access$16(MainActivity mainActivity, String str, String str2) {
        return mainActivity.Get_Config_Json(str, str2);
    }

    private String Get_Config_Json(String url, String username) {
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

    static /* synthetic */ boolean access$17(MainActivity mainActivity, String str) {
        return mainActivity.jsonToConfig(str);
    }

    private boolean jsonToConfig(String json_str) {
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
