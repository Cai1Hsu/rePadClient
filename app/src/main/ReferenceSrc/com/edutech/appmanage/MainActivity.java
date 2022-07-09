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
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Timer;
import java.util.TimerTask;
import org.apache.http.HttpResponse;
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

/* loaded from: classes.jar:com/edutech/appmanage/MainActivity.class */
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
        public void run() {
            synchronized (this) {
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
                    String inVar = HttpHelper.getin("http://" + MainActivity.this.ip + "/api/pad-login/code/" + MainActivity.this.usercode + "/pwd/" + MainActivity.this.pwd, MainActivity.this.usercode, MainActivity.this.privatekey);
                    Log.i(MainActivity.TAG, "333---RES_ID  :" + inVar);
                    if (inVar == null) {
                        Log.i(MainActivity.TAG, "345");
                        MainActivity.this.handler_toast.sendEmptyMessage(4);
                    } else if (MainActivity.this.parse_studentid(inVar) == null) {
                        Log.i(MainActivity.TAG, "338");
                        MainActivity.this.handler_toast.sendEmptyMessage(4);
                    } else {
                        String inVar2 = HttpHelper.getin("http://" + MainActivity.this.ip + "/api/app/projectcode/myapp/os/android", MainActivity.this.usercode, MainActivity.this.privatekey);
                        Log.i(MainActivity.TAG, "346-infor--->" + inVar2);
                        if (inVar2 != null) {
                            MainActivity.this.unlink_handler.sendEmptyMessage(3);
                            SharedPreferencesHelper.save_info(inVar2);
                            MainActivity.this.parse_json();
                        } else {
                            MainActivity.this.handler_toast.sendEmptyMessage(4);
                        }
                    }
                }
            }
        }
    };
    Handler unlink_handler = new Handler() { // from class: com.edutech.appmanage.MainActivity.2
        @Override // android.os.Handler
        public void handleMessage(Message message) {
            super.handleMessage(message);
            switch (message.what) {
                case 1:
                    if (MainActivity.market_applist.size() != 0) {
                        MainActivity.this.wrong_net.setVisibility(8);
                        MainActivity.this.layout_appwarning.setVisibility(8);
                        MainActivity.this.gv.setVisibility(0);
                        return;
                    }
                    MainActivity.this.wrong_net.setText(MainActivity.this.getResources().getString(R.string.appmanager_errornetwork));
                    MainActivity.this.wrong_net.setVisibility(0);
                    MainActivity.this.img_appwarning.setBackgroundResource(R.drawable.nointernet);
                    MainActivity.this.layout_appwarning.setVisibility(0);
                    MainActivity.this.gv.setVisibility(8);
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
        public void handleMessage(Message message) {
            super.handleMessage(message);
            switch (message.what) {
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
        public void handleMessage(Message message) {
            super.handleMessage(message);
            switch (message.what) {
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
        public void handleMessage(Message message) {
            super.handleMessage(message);
            switch (message.what) {
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
                    if (MainActivity.this.isFinishing()) {
                        return;
                    }
                    try {
                        MainActivity.this.changed_progress.dismiss();
                        return;
                    } catch (Exception e2) {
                        return;
                    }
                case 3:
                    if (MainActivity.this.isFinishing()) {
                        return;
                    }
                    try {
                        MainActivity.this.changed_progress.setTitle(MainActivity.this.getResources().getString(R.string.appmanager_jiazaiing));
                        return;
                    } catch (Exception e3) {
                        return;
                    }
                case 4:
                    if (MainActivity.this.isFinishing()) {
                        return;
                    }
                    try {
                        MainActivity.this.changed_progress.setTitle(MainActivity.this.getResources().getString(R.string.appmanager_uninstalling));
                        return;
                    } catch (Exception e4) {
                        return;
                    }
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
        /* JADX WARN: Type inference failed for: r0v16, types: [com.edutech.appmanage.MainActivity$7$1] */
        /* JADX WARN: Type inference failed for: r0v9, types: [com.edutech.appmanage.MainActivity$7$2] */
        @Override // android.os.Handler
        public void handleMessage(Message message) {
            if (message.what == MainActivity.apk_install) {
                final String str = (String) message.obj;
                Log.i(MainActivity.TAG, "path-->" + str);
                new Thread() { // from class: com.edutech.appmanage.MainActivity.7.1
                    @Override // java.lang.Thread, java.lang.Runnable
                    public void run() {
                        Log.i(MainActivity.TAG, "path-->" + str);
                        if (!ApkController.install(str, MainActivity.this.getApplicationContext())) {
                            MainActivity.this.toast(MainActivity.this.getResources().getString(R.string.appmanager_installfailed));
                        }
                    }
                }.start();
            } else if (message.what == MainActivity.apk_uninstall) {
                final String str2 = (String) message.obj;
                Log.i(MainActivity.TAG, "path-->" + str2);
                new Thread() { // from class: com.edutech.appmanage.MainActivity.7.2
                    @Override // java.lang.Thread, java.lang.Runnable
                    public void run() {
                        if (!ApkController.uninstall(str2, MainActivity.this.getApplicationContext())) {
                            MainActivity.this.toast(MainActivity.this.getResources().getString(R.string.appmanager_uninstallfailed));
                        }
                    }
                }.start();
            }
            super.handleMessage(message);
        }
    };
    Runnable runnable_GetConfig_Infor = new Runnable() { // from class: com.edutech.appmanage.MainActivity.8
        @Override // java.lang.Runnable
        public void run() {
            String str = "http://" + MainActivity.this.ip + "/api/config/";
            Log.e(MainActivity.TAG, "URL:" + str);
            String Get_Config_Json = MainActivity.this.Get_Config_Json(str, MainActivity.this.username);
            if (Get_Config_Json != null) {
                MainActivity.this.jsonToConfig(Get_Config_Json);
            }
            Message obtainMessage = MainActivity.this.getMarkertHandler.obtainMessage();
            obtainMessage.what = 1;
            obtainMessage.sendToTarget();
        }
    };
    Handler getMarkertHandler = new Handler() { // from class: com.edutech.appmanage.MainActivity.9
        @Override // android.os.Handler
        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    if (((ConnectivityManager) MainActivity.this.getSystemService("connectivity")).getNetworkInfo(1).getState() == NetworkInfo.State.CONNECTED) {
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

    /* loaded from: classes.jar:com/edutech/appmanage/MainActivity$AppInfo.class */
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
            MainActivity.this = r4;
        }
    }

    /* loaded from: classes.jar:com/edutech/appmanage/MainActivity$CompleteReceiver.class */
    class CompleteReceiver extends BroadcastReceiver {
        long completeDownloadId = 0;
        Handler handler = new Handler() { // from class: com.edutech.appmanage.MainActivity.CompleteReceiver.1
            @Override // android.os.Handler
            public void handleMessage(Message message) {
                super.handleMessage(message);
                switch (message.what) {
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
            MainActivity.this = r6;
        }

        /* JADX WARN: Type inference failed for: r0v64, types: [com.edutech.appmanage.MainActivity$CompleteReceiver$2] */
        @Override // android.content.BroadcastReceiver
        public void onReceive(final Context context, Intent intent) {
            synchronized (this) {
                Log.i(MainActivity.TAG, "2586---RECEIVICE" + intent.getAction());
                if (intent.getAction().equals("android.intent.action.DOWNLOAD_COMPLETE") && this.completeDownloadId != intent.getLongExtra("extra_download_id", -1L)) {
                    this.completeDownloadId = intent.getLongExtra("extra_download_id", -1L);
                    if (MainActivity.downloadManagerPro != null) {
                        Log.i(MainActivity.TAG, "2603---RECEIVICE" + MainActivity.downloadManagerPro.getStatusById(this.completeDownloadId));
                        if (MainActivity.downloadManagerPro.getStatusById(this.completeDownloadId) == 8) {
                            new Thread() { // from class: com.edutech.appmanage.MainActivity.CompleteReceiver.2
                                @Override // java.lang.Thread, java.lang.Runnable
                                public void run() {
                                    synchronized (this) {
                                        super.run();
                                        long j = CompleteReceiver.this.completeDownloadId;
                                        Log.i(MainActivity.TAG, "2618---aaa  :" + HttpHelper.install_num.size());
                                        int i = 0;
                                        while (true) {
                                            if (i >= HttpHelper.install_num.size()) {
                                                break;
                                            } else if (j == ((Long) HttpHelper.install_num.get(i).get("downid")).longValue()) {
                                                MainActivity.downloadManager.remove(j);
                                                if (!((Boolean) HttpHelper.install_num.get(i).get("setuped")).booleanValue()) {
                                                    HttpHelper.install_num.get(i).put("setuped", true);
                                                    int intValue = ((Integer) HttpHelper.install_num.get(i).get("position")).intValue();
                                                    int intValue2 = ((Integer) HttpHelper.install_num.get(i).get("type")).intValue();
                                                    String str = (String) HttpHelper.install_num.get(i).get("apkname");
                                                    Log.i(MainActivity.TAG, "2638---name--->" + str);
                                                    Log.i(MainActivity.TAG, "2639---type--->" + intValue2);
                                                    if (1 == intValue2) {
                                                        File file = new File(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + str);
                                                        if (!file.exists() || 0 == file.length()) {
                                                            CompleteReceiver.this.mycontext = context;
                                                            CompleteReceiver.this.handler.sendEmptyMessage(1);
                                                        } else {
                                                            Log.i(MainActivity.TAG, "2671");
                                                            Message obtainMessage = MainActivity.this.mHandlerApk.obtainMessage();
                                                            obtainMessage.what = MainActivity.apk_install;
                                                            obtainMessage.obj = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + str;
                                                            MainActivity.this.mHandlerApk.sendMessage(obtainMessage);
                                                        }
                                                        int i2 = 0;
                                                        while (true) {
                                                            if (i2 >= HttpHelper.install_num.size()) {
                                                                break;
                                                            } else if (str.equals(HttpHelper.install_num.get(i2).get("apkname").toString())) {
                                                                HttpHelper.install_num.remove(i2);
                                                                break;
                                                            } else {
                                                                i2++;
                                                            }
                                                        }
                                                        if (!MainActivity.delete_apkfile.contains(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + str)) {
                                                            MainActivity.delete_apkfile.add(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + str);
                                                        }
                                                    } else if (intValue2 == 0) {
                                                        String str2 = MainActivity.market_applist.get(intValue).apkname;
                                                        File file2 = new File(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + str2);
                                                        if (!file2.exists() || 0 == file2.length()) {
                                                            CompleteReceiver.this.mycontext = context;
                                                            CompleteReceiver.this.handler.sendEmptyMessage(1);
                                                        } else {
                                                            Log.i(MainActivity.TAG, "2782");
                                                            Message obtainMessage2 = MainActivity.this.mHandlerApk.obtainMessage();
                                                            obtainMessage2.what = 0;
                                                            obtainMessage2.obj = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + str2;
                                                            MainActivity.this.mHandlerApk.sendMessage(obtainMessage2);
                                                        }
                                                        int i3 = 0;
                                                        while (true) {
                                                            if (i3 >= HttpHelper.install_num.size()) {
                                                                break;
                                                            } else if (str2.equals(HttpHelper.install_num.get(i3).get("apkname").toString())) {
                                                                HttpHelper.install_num.remove(i3);
                                                                break;
                                                            } else {
                                                                i3++;
                                                            }
                                                        }
                                                        if (!MainActivity.delete_apkfile.contains(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + str2)) {
                                                            MainActivity.delete_apkfile.add(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + str2);
                                                        }
                                                    }
                                                }
                                            } else {
                                                i++;
                                            }
                                        }
                                        MainActivity.this.complete();
                                    }
                                }
                            }.start();
                        } else if (MainActivity.downloadManagerPro.getStatusById(this.completeDownloadId) != 4) {
                            long j = this.completeDownloadId;
                            for (int i = 0; i < HttpHelper.install_num.size(); i++) {
                                if (j == ((Long) HttpHelper.install_num.get(i).get("downid")).longValue()) {
                                    if (((Boolean) HttpHelper.install_num.get(i).get("setuped")).booleanValue()) {
                                        break;
                                    }
                                    this.mycontext = context;
                                    this.handler.sendEmptyMessage(1);
                                    String str = (String) HttpHelper.install_num.get(i).get("apkname");
                                    int i2 = 0;
                                    while (true) {
                                        if (i2 >= HttpHelper.install_num.size()) {
                                            break;
                                        } else if (str.equals(HttpHelper.install_num.get(i2).get("apkname").toString())) {
                                            HttpHelper.install_num.remove(i2);
                                            break;
                                        } else {
                                            i2++;
                                        }
                                    }
                                    int i3 = 0;
                                    while (true) {
                                        if (i3 < MainActivity.market_applist.size()) {
                                            if (MainActivity.market_applist.get(i3).packagename.equals(str)) {
                                                MainActivity.market_applist.get(i3).doing = false;
                                                break;
                                            }
                                            i3++;
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
    }

    /* loaded from: classes.jar:com/edutech/appmanage/MainActivity$GetBroadcast.class */
    class GetBroadcast extends BroadcastReceiver {
        GetBroadcast() {
            MainActivity.this = r4;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            synchronized (this) {
                String str = intent.getDataString().split(":")[1];
                Log.i(MainActivity.TAG, intent.getAction());
                if ("android.intent.action.PACKAGE_ADDED".equals(intent.getAction())) {
                    if (MainActivity.market_applist != null) {
                        int i = 0;
                        while (true) {
                            if (i >= MainActivity.market_applist.size()) {
                                break;
                            } else if (MainActivity.market_applist.get(i).packagename.equals(str)) {
                                MainActivity.market_applist.get(i).doing = false;
                                MainActivity.market_applist.get(i).islocal = true;
                                break;
                            } else {
                                i++;
                            }
                        }
                    }
                    if (HttpHelper.install_num != null) {
                        int i2 = 0;
                        while (true) {
                            if (i2 >= HttpHelper.install_num.size()) {
                                break;
                            } else if (str.equals(HttpHelper.install_num.get(i2).get("packagename").toString())) {
                                MainActivity.this.deleteFile(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + HttpHelper.install_num.get(i2).get("apkname").toString());
                                HttpHelper.install_num.remove(i2);
                                break;
                            } else {
                                i2++;
                            }
                        }
                    }
                    MainActivity.this.complete();
                } else if ("android.intent.action.PACKAGE_REMOVED".equals(intent.getAction())) {
                    if (MainActivity.market_applist != null) {
                        int i3 = 0;
                        while (true) {
                            if (i3 >= MainActivity.market_applist.size()) {
                                break;
                            } else if (MainActivity.market_applist.get(i3).packagename.equals(str)) {
                                MainActivity.market_applist.get(i3).doing = false;
                                MainActivity.market_applist.get(i3).islocal = false;
                                break;
                            } else {
                                i3++;
                            }
                        }
                    }
                    if (HttpHelper.install_num != null) {
                        int i4 = 0;
                        while (true) {
                            if (i4 >= HttpHelper.install_num.size()) {
                                break;
                            } else if (str.equals(HttpHelper.install_num.get(i4).get("packagename").toString())) {
                                HttpHelper.install_num.remove(i4);
                                break;
                            } else {
                                i4++;
                            }
                        }
                    }
                    MainActivity.this.complete();
                } else if ("android.intent.action.PACKAGE_REPLACED".equals(intent.getAction())) {
                    if (MainActivity.market_applist != null) {
                        int i5 = 0;
                        while (true) {
                            if (i5 >= MainActivity.market_applist.size()) {
                                break;
                            } else if (MainActivity.market_applist.get(i5).packagename.equals(str)) {
                                MainActivity.market_applist.get(i5).doing = false;
                                MainActivity.market_applist.get(i5).update = false;
                                break;
                            } else {
                                i5++;
                            }
                        }
                    }
                    if (HttpHelper.install_num != null) {
                        int i6 = 0;
                        while (true) {
                            if (i6 >= HttpHelper.install_num.size()) {
                                break;
                            } else if (str.equals(HttpHelper.install_num.get(i6).get("packagename").toString())) {
                                MainActivity.this.deleteFile(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + HttpHelper.install_num.get(i6).get("apkname").toString());
                                HttpHelper.install_num.remove(i6);
                                break;
                            } else {
                                i6++;
                            }
                        }
                    }
                    MainActivity.this.complete();
                }
            }
        }
    }

    /* loaded from: classes.jar:com/edutech/appmanage/MainActivity$MyAdapter.class */
    class MyAdapter extends BaseAdapter {
        AppInfo appinfo;
        Context context;
        private LayoutInflater mInflater;

        /* renamed from: com.edutech.appmanage.MainActivity$MyAdapter$5 */
        /* loaded from: classes.jar:com/edutech/appmanage/MainActivity$MyAdapter$5.class */
        class AnonymousClass5 implements View.OnClickListener {
            private final /* synthetic */ int val$position;

            AnonymousClass5(int i) {
                MyAdapter.this = r4;
                this.val$position = i;
            }

            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                final String str = MainActivity.market_applist.get(this.val$position).packagename;
                AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
                builder.setTitle(MainActivity.this.getResources().getString(R.string.uninstall)).setMessage(String.valueOf(MainActivity.this.getResources().getString(R.string.appmanager_quituninstall)) + MainActivity.market_applist.get(this.val$position).appname + MainActivity.this.getResources().getString(R.string.appmanager_ma));
                builder.setNegativeButton(MainActivity.this.getResources().getString(R.string.appmanager_ok), new DialogInterface.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.5.1
                    /* JADX WARN: Type inference failed for: r0v0, types: [com.edutech.appmanage.MainActivity$MyAdapter$5$1$1] */
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialogInterface, int i) {
                        final String str2 = str;
                        new Thread() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.5.1.1
                            @Override // java.lang.Thread, java.lang.Runnable
                            public void run() {
                                super.run();
                                Message obtainMessage = MainActivity.this.mHandlerApk.obtainMessage();
                                obtainMessage.what = MainActivity.apk_uninstall;
                                obtainMessage.obj = str2;
                                MainActivity.this.mHandlerApk.sendMessage(obtainMessage);
                            }
                        }.start();
                    }
                });
                builder.setPositiveButton(MainActivity.this.getResources().getString(R.string.appmanager_cancel), new DialogInterface.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.5.2
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialogInterface, int i) {
                        dialogInterface.dismiss();
                    }
                });
                builder.create().show();
            }
        }

        /* loaded from: classes.jar:com/edutech/appmanage/MainActivity$MyAdapter$ViewHolder.class */
        public final class ViewHolder {
            public Button btn_start;
            public Button btn_uninstall;
            public TextView code;
            public ImageView image;
            public LinearLayout layout;
            public TextView name;

            public ViewHolder() {
                MyAdapter.this = r4;
            }
        }

        MyAdapter(Context context) {
            MainActivity.this = r4;
            this.context = context;
            this.mInflater = LayoutInflater.from(context);
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return MainActivity.market_applist.size();
        }

        @Override // android.widget.Adapter
        public Object getItem(int i) {
            return Integer.valueOf(i);
        }

        @Override // android.widget.Adapter
        public long getItemId(int i) {
            return i;
        }

        @Override // android.widget.Adapter
        public View getView(final int i, View view, ViewGroup viewGroup) {
            ViewHolder viewHolder;
            if (view == null) {
                view = this.mInflater.inflate(R.layout.pic_item, (ViewGroup) null);
                view.setLayoutParams(new AbsListView.LayoutParams(-1, MainActivity.this.height));
                viewHolder = new ViewHolder();
                viewHolder.layout = (LinearLayout) view.findViewById(R.id.linearlayout_pre);
                viewHolder.name = (TextView) view.findViewById(R.id.textView_pre);
                viewHolder.code = (TextView) view.findViewById(R.id.textView_versioncode);
                viewHolder.image = (ImageView) view.findViewById(R.id.imageView_pre);
                viewHolder.btn_start = (Button) view.findViewById(R.id.btn_start);
                viewHolder.btn_uninstall = (Button) view.findViewById(R.id.btn_uninstall);
                ViewGroup.LayoutParams layoutParams = viewHolder.image.getLayoutParams();
                layoutParams.height = MainActivity.this.pic_height;
                layoutParams.width = MainActivity.this.pic_width;
                viewHolder.image.setLayoutParams(layoutParams);
                view.setTag(viewHolder);
            } else {
                viewHolder = (ViewHolder) view.getTag();
            }
            if (MainActivity.market_applist != null && i < MainActivity.market_applist.size()) {
                this.appinfo = new AppInfo();
                this.appinfo = MainActivity.market_applist.get(i);
                Log.i(MainActivity.TAG, this.appinfo.appname);
                if (this.appinfo.islocal) {
                    viewHolder.btn_start.setFocusable(false);
                    viewHolder.btn_uninstall.setFocusable(false);
                    viewHolder.btn_start.setText(MainActivity.this.getResources().getString(R.string.open_app));
                    viewHolder.btn_start.setBackgroundDrawable(MainActivity.this.getApplicationContext().getResources().getDrawable(R.drawable.btn_open));
                    viewHolder.btn_uninstall.setBackgroundDrawable(MainActivity.this.getApplicationContext().getResources().getDrawable(R.drawable.btn_open));
                    viewHolder.btn_uninstall.setTextColor(MainActivity.this.getResources().getColor(R.color.whilte));
                    if (i < MainActivity.market_applist.size() && this.appinfo.doing) {
                        viewHolder.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_updatingapp));
                    }
                    if (i < MainActivity.market_applist.size()) {
                        String str = this.appinfo.apkname;
                        int i2 = 0;
                        while (true) {
                            if (i2 >= HttpHelper.install_num.size()) {
                                break;
                            } else if (HttpHelper.install_num.get(i2).get("apkname").equals(str)) {
                                viewHolder.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_updatingapp));
                                break;
                            } else {
                                i2++;
                            }
                        }
                    }
                    viewHolder.btn_uninstall.setVisibility(0);
                    if (i < MainActivity.market_applist.size()) {
                        viewHolder.name.setText(this.appinfo.appname);
                        if (this.appinfo.update) {
                            viewHolder.code.setText(String.valueOf(MainActivity.this.getResources().getString(R.string.appmanager_version)) + this.appinfo.local_versionName + "\r\n" + MainActivity.this.getResources().getString(R.string.appmanager_newversion) + this.appinfo.versionName);
                            viewHolder.btn_start.setBackgroundDrawable(MainActivity.this.getApplicationContext().getResources().getDrawable(R.drawable.btn_update));
                            viewHolder.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_updateapp));
                            final ViewHolder viewHolder2 = viewHolder;
                            viewHolder.btn_start.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.1
                                @Override // android.view.View.OnClickListener
                                public void onClick(View view2) {
                                    Log.i("TAGS", String.valueOf(i) + "====" + i + "更新");
                                    if (MainActivity.this.getResources().getString(R.string.appmanager_updatingapp).equals(viewHolder2.btn_start.getText())) {
                                        Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_updating), 0).show();
                                        return;
                                    }
                                    Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_startupdate), 0).show();
                                    viewHolder2.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_updatingapp));
                                    File file = new File(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + MyAdapter.this.appinfo.apkname);
                                    if (file.exists()) {
                                        file.delete();
                                    }
                                    HttpHelper.download(i, 0);
                                }
                            });
                            final ViewHolder viewHolder3 = viewHolder;
                            view.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.2
                                @Override // android.view.View.OnClickListener
                                public void onClick(View view2) {
                                    Log.i(MainActivity.TAG, "准备打开。。。");
                                    if (MainActivity.this.getResources().getString(R.string.appmanager_updatingapp).equals(viewHolder3.btn_start.getText())) {
                                        Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_updating), 0).show();
                                        return;
                                    }
                                    new Intent();
                                    MainActivity.this.startActivity(MainActivity.this.getPackageManager().getLaunchIntentForPackage(MainActivity.market_applist.get(i).packagename));
                                }
                            });
                        } else {
                            viewHolder.code.setText(String.valueOf(MainActivity.this.getResources().getString(R.string.appmanager_version)) + this.appinfo.versionName);
                            final ViewHolder viewHolder4 = viewHolder;
                            view.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.3
                                @Override // android.view.View.OnClickListener
                                public void onClick(View view2) {
                                    Log.i(MainActivity.TAG, "准备打开。。。");
                                    if (MainActivity.this.getResources().getString(R.string.appmanager_updatingapp).equals(viewHolder4.btn_start.getText())) {
                                        Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_updating), 0).show();
                                        return;
                                    }
                                    new Intent();
                                    MainActivity.this.startActivity(MainActivity.this.getPackageManager().getLaunchIntentForPackage(MainActivity.market_applist.get(i).packagename));
                                }
                            });
                        }
                    }
                    if (MainActivity.market_applist != null && i < MainActivity.market_applist.size()) {
                        if (this.appinfo.appicon != null) {
                            viewHolder.image.setImageDrawable(this.appinfo.appicon);
                        } else {
                            viewHolder.image.setImageResource(R.drawable.default_icon);
                        }
                    }
                    final ViewHolder viewHolder5 = viewHolder;
                    view.findViewById(R.id.btn_start).setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.4
                        @Override // android.view.View.OnClickListener
                        public void onClick(View view2) {
                            if (MainActivity.this.getResources().getString(R.string.appmanager_updatingapp).equals(viewHolder5.btn_start.getText())) {
                                Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_updating), 0).show();
                            } else if (!MainActivity.this.getResources().getString(R.string.appmanager_updateapp).equals(viewHolder5.btn_start.getText())) {
                                new Intent();
                                MainActivity.this.startActivity(MainActivity.this.getPackageManager().getLaunchIntentForPackage(MainActivity.market_applist.get(i).packagename));
                            } else {
                                Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_startupdate), 0).show();
                                viewHolder5.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_updatingapp));
                                File file = new File(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + MyAdapter.this.appinfo.apkname);
                                if (file.exists()) {
                                    file.delete();
                                }
                                HttpHelper.download(i, 0);
                            }
                        }
                    });
                    view.findViewById(R.id.btn_uninstall).setOnClickListener(new AnonymousClass5(i));
                } else if (MainActivity.market_applist.size() != 0) {
                    synchronized (MainActivity.market_applist) {
                        viewHolder.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_install));
                        if (i < MainActivity.market_applist.size() && this.appinfo.doing) {
                            viewHolder.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_installing));
                        }
                        viewHolder.btn_start.setBackgroundDrawable(MainActivity.this.getApplicationContext().getResources().getDrawable(R.drawable.btn_open));
                        viewHolder.btn_uninstall.setBackgroundDrawable(MainActivity.this.getApplicationContext().getResources().getDrawable(R.drawable.btn_uninstall));
                        viewHolder.btn_uninstall.setTextColor(MainActivity.this.getResources().getColor(R.color.btn_uninstall));
                        if (i < MainActivity.market_applist.size()) {
                            String str2 = this.appinfo.apkname;
                            int i3 = 0;
                            while (true) {
                                if (i3 < HttpHelper.install_num.size()) {
                                    boolean z = this.appinfo.islocal;
                                    if (HttpHelper.install_num.get(i3).get("apkname").equals(str2) && !z) {
                                        viewHolder.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_installing));
                                        break;
                                    }
                                    i3++;
                                } else {
                                    break;
                                }
                            }
                        }
                        viewHolder.name.setText(this.appinfo.appname);
                        viewHolder.code.setText(String.valueOf(MainActivity.this.getResources().getString(R.string.appmanager_version)) + this.appinfo.versionName);
                        if (i < MainActivity.market_applist.size()) {
                            if (this.appinfo.appicon != null) {
                                viewHolder.image.setImageDrawable(this.appinfo.appicon);
                            } else {
                                viewHolder.image.setImageResource(R.drawable.default_icon);
                            }
                        }
                        view.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.6
                            @Override // android.view.View.OnClickListener
                            public void onClick(View view2) {
                            }
                        });
                        final ViewHolder viewHolder6 = viewHolder;
                        view.findViewById(R.id.btn_start).setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.MyAdapter.7
                            @Override // android.view.View.OnClickListener
                            public void onClick(View view2) {
                                if (!MainActivity.this.getResources().getString(R.string.appmanager_installing).equals(viewHolder6.btn_start.getText())) {
                                    Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_startdown), 0).show();
                                    if (MainActivity.market_applist.size() <= i) {
                                        return;
                                    }
                                    String str3 = MainActivity.market_applist.get(i).apkname;
                                    viewHolder6.btn_start.setText(MainActivity.this.getResources().getString(R.string.appmanager_installing));
                                    File file = new File(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + "/" + str3);
                                    if (file.exists()) {
                                        file.delete();
                                    }
                                    HttpHelper.download(i, 1);
                                }
                            }
                        });
                    }
                }
            }
            return view;
        }
    }

    public String Get_Config_Json(String str, String str2) {
        String str3;
        if (str == null || str.equals("") || str2 == null || str2.equals("")) {
            Log.e(TAG, "Get_Config_Json 入参有问题。。。");
            str3 = null;
        } else {
            try {
                HttpResponse Get_http_addheader = Get_http_addheader(str, str2);
                Log.e(TAG, "解析返回的内容...");
                if (Get_http_addheader == null) {
                    str3 = null;
                } else if (Get_http_addheader.getStatusLine().getStatusCode() == 200) {
                    StringBuilder sb = new StringBuilder();
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(Get_http_addheader.getEntity().getContent(), "UTF-8"));
                    for (String readLine = bufferedReader.readLine(); readLine != null; readLine = bufferedReader.readLine()) {
                        sb.append(readLine);
                    }
                    str3 = sb.toString();
                    System.out.println(str3);
                    Log.e(TAG, "学校和用户个人信息获取完成。。。");
                } else {
                    Log.e(TAG, "与服务端连接失败。。。");
                    Log.e(TAG, "连接状态码Status=" + Get_http_addheader.getStatusLine().getStatusCode());
                    Log.e(TAG, "ddddd=" + Get_http_addheader.getEntity());
                    str3 = null;
                }
            } catch (ClientProtocolException e) {
                e.printStackTrace();
                str3 = null;
                return str3;
            } catch (IOException e2) {
                e2.printStackTrace();
                str3 = null;
                return str3;
            }
        }
        return str3;
    }

    private HttpResponse Get_http_addheader(String str, String str2) throws IOException, ClientProtocolException {
        HttpGet httpGet = new HttpGet(str);
        httpGet.addHeader("X-Edutech-Entity", str2);
        long currentTimeMillis = System.currentTimeMillis();
        String Md5 = My_md5.Md5(String.valueOf(currentTimeMillis) + str2);
        Log.e(TAG, "timestamp=" + currentTimeMillis + "   sign=" + Md5);
        httpGet.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + Md5);
        return new DefaultHttpClient().execute(httpGet);
    }

    public static String LOGINURL(String str, String str2, String str3) {
        return "http://" + str + "/default/index/pad-login/code/" + str2 + "/pwd/" + str3;
    }

    private void findview() {
        findViewById(R.id.btn_refresh).setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.10
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (!MainActivity.this.data_load) {
                    Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_unloading), 0).show();
                } else if (!MainActivity.this.pic_load) {
                    Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.appmanager_iconunloading), 0).show();
                } else {
                    MainActivity.this.data_load = false;
                    MainActivity.this.pic_load = false;
                    MainActivity.this.toast_unlink = false;
                    Toast.makeText(MainActivity.this.getApplication(), MainActivity.this.getResources().getString(R.string.action_refresh), 0).show();
                    MainActivity.this.getMarketInfor();
                }
            }
        });
        findViewById(R.id.tv_exit).setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.MainActivity.11
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                MainActivity.this.finish();
            }
        });
    }

    public void getMarketInfor() {
        if (((ConnectivityManager) getSystemService("connectivity")).getNetworkInfo(1).getState() == NetworkInfo.State.CONNECTED) {
            new Thread(this.net_thread).start();
        } else {
            unlink_parse(SharedPreferencesHelper.load_info());
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:39:0x0252 -> B:14:0x00ec). Please submit an issue!!! */
    public boolean jsonToConfig(String str) {
        boolean z;
        if (str == null || str.equals("")) {
            z = false;
        } else {
            try {
                JSONObject jSONObject = new JSONObject(str);
                Log.i(TAG, "info :" + jSONObject);
                String string = jSONObject.getString("status");
                String string2 = jSONObject.getString("errorNum");
                String string3 = jSONObject.getString("errorInfo");
                if (string2.equals("0")) {
                    JSONObject jSONObject2 = jSONObject.getJSONObject("data");
                    Log.i(TAG, "status :" + string);
                    Log.i(TAG, "errorNum :" + string2);
                    Log.i(TAG, "errorInfo :" + string3);
                    Log.i(TAG, "data :" + jSONObject2);
                    String string4 = jSONObject2.getString("privatekey");
                    try {
                        this.usercode = jSONObject2.getJSONObject(UserID.ELEMENT_NAME).getString("usercode");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    Log.i(TAG, "privatekey :" + string4);
                    Log.i(TAG, "encrypt :" + ((String) null));
                    Log.i(TAG, "apihost :" + ((String) null));
                    try {
                        JSONObject jSONObject3 = jSONObject2.getJSONObject("tigase");
                        String str2 = null;
                        String str3 = null;
                        try {
                            str2 = jSONObject3.getString(ClientCookie.DOMAIN_ATTR);
                        } catch (Exception e2) {
                            e2.printStackTrace();
                        }
                        try {
                            str3 = jSONObject3.getString(ClientCookie.PORT_ATTR);
                        } catch (Exception e3) {
                            e3.printStackTrace();
                        }
                        Log.i(TAG, "domain :" + str2);
                        Log.i(TAG, "port :" + str3);
                    } catch (Exception e4) {
                        e4.printStackTrace();
                    }
                    try {
                        JSONObject jSONObject4 = jSONObject2.getJSONObject("mongo");
                        String str4 = null;
                        String str5 = null;
                        String str6 = null;
                        String str7 = null;
                        try {
                            str4 = jSONObject4.getString(ClientCookie.DOMAIN_ATTR);
                        } catch (Exception e5) {
                            e5.printStackTrace();
                        }
                        try {
                            str5 = jSONObject4.getString(ClientCookie.PORT_ATTR);
                        } catch (Exception e6) {
                            e6.printStackTrace();
                        }
                        try {
                            str6 = jSONObject4.getString(UserID.ELEMENT_NAME);
                        } catch (Exception e7) {
                            e7.printStackTrace();
                        }
                        try {
                            str7 = jSONObject4.getString("pwd");
                        } catch (Exception e8) {
                            e8.printStackTrace();
                        }
                        Log.i(TAG, "mongo_domain :" + str4);
                        Log.i(TAG, "mongo_port :" + str5);
                        Log.i(TAG, "mongo_user :" + str6);
                        Log.i(TAG, "mongo_pwd :" + str7);
                    } catch (Exception e9) {
                        e9.printStackTrace();
                    }
                    z = true;
                } else {
                    Log.i(TAG, "配置信息 json数据  返回错误数据。。。");
                    z = false;
                }
            } catch (JSONException e10) {
                e10.printStackTrace();
                z = false;
            }
        }
        return z;
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
        if (this.mTimer == null || this.mTimerTask == null) {
            return;
        }
        this.mTimer.schedule(this.mTimerTask, 0L, 1000L);
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

    public int userLogin(String str, String str2, String str3) {
        int i;
        HttpPost httpPost = new HttpPost(LOGINURL(str, str2, str3));
        int i2 = -1;
        int i3 = -1;
        int i4 = -1;
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(new ArrayList(), "UTF-8"));
            HttpResponse execute = new DefaultHttpClient().execute(httpPost);
            i = -1;
            if (execute.getStatusLine().getStatusCode() == 200) {
                i = JsonHelper.parseHttpPostReturnJson(EntityUtils.toString(execute.getEntity()));
                i2 = i;
                i3 = i;
                i4 = i;
                Log.i(TAG, "RES:" + i);
            }
        } catch (ClientProtocolException e) {
            Log.i(TAG, LogHelp.TYPE_GUIDANCE);
            e.printStackTrace();
            i = i2;
        } catch (IOException e2) {
            Log.i(TAG, LogHelp.TYPE_MYWORK);
            e2.printStackTrace();
            i = i3;
        } catch (Exception e3) {
            Log.i(TAG, LogHelp.TYPE_HWHELP);
            e3.printStackTrace();
            i = i4;
        }
        return i;
    }

    /* JADX WARN: Type inference failed for: r0v18, types: [com.edutech.appmanage.MainActivity$15] */
    public void compare() {
        PackageInfo packageInfo;
        PackageInfo packageInfo2;
        ArrayList arrayList = new ArrayList();
        if (this.silent_uninstall == null) {
            this.silent_uninstall = new ArrayList<>();
        }
        for (int i = 0; i < market_applist.size(); i++) {
            if (2 == market_applist_local.get(i).apptype) {
                try {
                    packageInfo2 = getPackageManager().getPackageInfo(market_applist_local.get(i).packagename, 0);
                } catch (PackageManager.NameNotFoundException e) {
                    packageInfo2 = null;
                    e.printStackTrace();
                }
                if (packageInfo2 != null) {
                    if (!this.silent_uninstall.contains(market_applist_local.get(i).packagename)) {
                        this.silent_uninstall.add(market_applist_local.get(i).packagename);
                    }
                } else if (this.silent_uninstall.contains(market_applist_local.get(i).packagename)) {
                    this.silent_uninstall.remove(market_applist_local.get(i).packagename);
                }
                arrayList.add(market_applist_local.get(i).packagename);
            }
        }
        for (int i2 = 0; i2 < this.silent_uninstall.size(); i2++) {
        }
        for (int i3 = 0; i3 < arrayList.size(); i3++) {
            int i4 = 0;
            while (true) {
                if (i4 < market_applist.size()) {
                    if (((String) arrayList.get(i3)).equals(market_applist.get(i4).packagename)) {
                        market_applist.remove(i4);
                        break;
                    }
                    i4++;
                }
            }
        }
        if (HttpHelper.install_num.size() != 0) {
            for (int i5 = 0; i5 < this.silent_uninstall.size(); i5++) {
                for (int i6 = 0; i6 < HttpHelper.install_num.size(); i6++) {
                    if (this.silent_uninstall.get(i5).equals((String) HttpHelper.install_num.get(i6).get("packagename"))) {
                        downloadManager.remove(((Long) HttpHelper.install_num.get(i6).get("downid")).longValue());
                        HttpHelper.install_num.remove(i6);
                    }
                }
            }
        }
        for (int i7 = 0; i7 < market_applist.size(); i7++) {
            try {
                packageInfo = getPackageManager().getPackageInfo(market_applist.get(i7).packagename, 0);
            } catch (PackageManager.NameNotFoundException e2) {
                packageInfo = null;
                e2.printStackTrace();
            }
            if (packageInfo != null) {
                market_applist.get(i7).islocal = true;
                if (packageInfo.versionCode != market_applist.get(i7).versionCode) {
                    if (packageInfo.versionName.length() > 10) {
                        market_applist.get(i7).local_versionName = String.valueOf(packageInfo.versionName.substring(0, 10)) + "...";
                    } else {
                        market_applist.get(i7).local_versionName = packageInfo.versionName;
                    }
                    market_applist.get(i7).update = true;
                }
            } else {
                market_applist.get(i7).islocal = false;
            }
        }
        Collections.sort(market_applist, new Comparator<AppInfo>() { // from class: com.edutech.appmanage.MainActivity.14
            public int compare(AppInfo appInfo, AppInfo appInfo2) {
                char c = 0;
                char c2 = 0;
                if (appInfo.islocal) {
                    c = 1;
                }
                if (appInfo2.islocal) {
                    c2 = 1;
                }
                return c > c2 ? -1 : c == c2 ? 0 : 1;
            }
        });
        if (this.silent_uninstall.size() != 0) {
            Intent intent = new Intent(this, SilentUninstall_Service.class);
            intent.putStringArrayListExtra("uninstall_list", this.silent_uninstall);
            startService(intent);
        }
        this.data_load = true;
        new Thread() { // from class: com.edutech.appmanage.MainActivity.15
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                for (int i8 = 0; i8 < MainActivity.market_applist.size(); i8++) {
                    int i9 = 0;
                    while (true) {
                        if (i9 < MainActivity.market_applist_local.size()) {
                            if (MainActivity.market_applist.get(i8).packagename.equals(MainActivity.market_applist_local.get(i9).packagename)) {
                                try {
                                    MainActivity.market_applist.get(i8).appicon = MainActivity.this.getImageDrawable(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + File.separatorChar + "icon" + File.separatorChar + MainActivity.market_applist.get(i8).packagename + ".png");
                                    break;
                                } catch (IOException e3) {
                                    e3.printStackTrace();
                                }
                            } else {
                                i9++;
                            }
                        }
                    }
                }
                MainActivity.this.pic_load = true;
            }
        }.start();
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.edutech.appmanage.MainActivity$18] */
    public void complete() {
        new Thread() { // from class: com.edutech.appmanage.MainActivity.18
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                synchronized (this) {
                    MainActivity.this.parse_json();
                }
            }
        }.start();
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public boolean deleteFile(String str) {
        File file = new File(str);
        boolean z = false;
        if (file.isFile()) {
            z = false;
            if (file.exists()) {
                z = file.delete();
            }
        }
        return z;
    }

    public BitmapDrawable getImageDrawable(String str) throws IOException {
        BitmapDrawable bitmapDrawable;
        File file = new File(str);
        if (!file.exists()) {
            bitmapDrawable = null;
        } else {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            byte[] bArr = new byte[1024];
            FileInputStream fileInputStream = new FileInputStream(file);
            int read = fileInputStream.read(bArr);
            while (true) {
                int i = read;
                if (i == -1) {
                    break;
                }
                byteArrayOutputStream.write(bArr, 0, i);
                read = fileInputStream.read(bArr);
            }
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            bitmapDrawable = new BitmapDrawable(BitmapFactory.decodeByteArray(byteArray, 0, byteArray.length));
        }
        return bitmapDrawable;
    }

    public void onClick(View view) {
        switch (view.getId()) {
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

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getWindow().setFlags(1024, 1024);
        setContentView(R.layout.pic_show);
        findview();
        this.wrong_net = (TextView) findViewById(R.id.tv_wrong_net);
        this.layout_appwarning = (RelativeLayout) findViewById(R.id.layout_appwarn);
        this.img_appwarning = (ImageView) findViewById(R.id.img_appwarn);
        WindowManager windowManager = (WindowManager) getApplication().getSystemService("window");
        downloadManager = (DownloadManager) getSystemService("download");
        downloadManagerPro = new DownloadManagerPro(downloadManager);
        SharedPreferencesHelper.preferences = getSharedPreferences("configure", 0);
        DisplayMetrics displayMetrics = new DisplayMetrics();
        windowManager.getDefaultDisplay().getMetrics(displayMetrics);
        int i = displayMetrics.widthPixels;
        this.height = ((i - 60) * displayMetrics.heightPixels) / (i * 4);
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
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.PACKAGE_ADDED");
        intentFilter.addAction("android.intent.action.PACKAGE_REMOVED");
        intentFilter.addAction("android.intent.action.PACKAGE_REPLACED");
        intentFilter.addDataScheme("package");
        registerReceiver(this.getbroadcast, intentFilter);
        this.completereceiver = new CompleteReceiver();
        IntentFilter intentFilter2 = new IntentFilter();
        intentFilter2.addAction("android.intent.action.DOWNLOAD_COMPLETE");
        registerReceiver(this.completereceiver, intentFilter2);
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
            ArrayList arrayList = new ArrayList();
            for (int i = 0; i < HttpHelper.install_num.size(); i++) {
                arrayList.add((String) HttpHelper.install_num.get(i).get("apkname"));
            }
            intent.putExtra("install", arrayList);
        }
        intent.putExtra("deleteapks", String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + FOLDER_MAIN);
        startService(intent);
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        return true;
    }

    /* JADX WARN: Type inference failed for: r0v21, types: [com.edutech.appmanage.MainActivity$16] */
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
            if (this.ip == null || this.ip.equals("") || this.username == null || this.username.equals("")) {
                return;
            }
            new Thread(this.runnable_GetConfig_Infor).start();
        } else if (((ConnectivityManager) getSystemService("connectivity")).getNetworkInfo(1).getState() != NetworkInfo.State.CONNECTED) {
            parse_json();
        } else if (this.login_res == 0) {
            this.gv.setVisibility(0);
            this.wrong_net.setVisibility(8);
            this.layout_appwarning.setVisibility(8);
            new Thread() { // from class: com.edutech.appmanage.MainActivity.16
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    synchronized (this) {
                        MainActivity.this.parse_json();
                    }
                }
            }.start();
        } else {
            if (-1 == this.login_res) {
                this.wrong_handler.sendEmptyMessage(2);
            } else if (2 == this.login_res) {
                this.wrong_handler.sendEmptyMessage(2);
            } else if (this.login_res != 0) {
                this.wrong_handler.sendEmptyMessage(2);
            }
            unlink_parse(SharedPreferencesHelper.load_info());
        }
    }

    /* JADX WARN: Type inference failed for: r0v10, types: [com.edutech.appmanage.MainActivity$13] */
    public void parse(String str) {
        try {
            JSONArray jSONArray = ((JSONObject) new JSONTokener(str).nextValue()).getJSONObject("data").getJSONArray("app");
            market_applist = new LinkedList<>();
            market_applist_local = new LinkedList<>();
            int i = 0;
            while (true) {
                if (i >= jSONArray.length()) {
                    break;
                }
                AppInfo appInfo = new AppInfo();
                JSONObject jSONObject = (JSONObject) jSONArray.get(i);
                appInfo.apptype = Integer.parseInt(jSONObject.getString("apptype"));
                appInfo.apkname = jSONObject.getString("apkname");
                appInfo.appname = jSONObject.getString("appname");
                appInfo.packagename = jSONObject.getString("packagename");
                if (!"".equals(appInfo.packagename)) {
                    appInfo.appsize = jSONObject.getString("appsize");
                    appInfo.versionCode = Integer.parseInt(jSONObject.getString("versioncode"));
                    if (jSONObject.getString("versionname").length() > 10) {
                        appInfo.versionName = String.valueOf(jSONObject.getString("versionname").substring(0, 10)) + "...";
                    } else {
                        appInfo.versionName = jSONObject.getString("versionname");
                    }
                    appInfo.webpath = jSONObject.getString(KeyEnvironment.KEYWEBPATH);
                    appInfo.iconurl = jSONObject.getString("iconurl");
                    market_applist.add(appInfo);
                    market_applist_local.add(appInfo);
                }
                i++;
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
                for (int i2 = 0; i2 < MainActivity.market_applist_local.size(); i2++) {
                    HttpHelper.httpDownload(MainActivity.market_applist_local.get(i2).iconurl, String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + File.separatorChar + "icon" + File.separatorChar + MainActivity.market_applist_local.get(i2).packagename + ".png", MainActivity.this);
                }
                while (!MainActivity.this.data_load) {
                    try {
                        sleep(500L);
                    } catch (InterruptedException e2) {
                        e2.printStackTrace();
                    }
                }
                for (int i3 = 0; i3 < MainActivity.market_applist.size(); i3++) {
                    int i4 = 0;
                    while (true) {
                        if (i4 < MainActivity.market_applist_local.size()) {
                            if (MainActivity.market_applist.get(i3).packagename.equals(MainActivity.market_applist_local.get(i4).packagename)) {
                                try {
                                    MainActivity.market_applist.get(i3).appicon = MainActivity.this.getImageDrawable(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + MainActivity.FOLDER_MAIN + File.separatorChar + "icon" + File.separatorChar + MainActivity.market_applist.get(i3).packagename + ".png");
                                    break;
                                } catch (IOException e3) {
                                    e3.printStackTrace();
                                }
                            } else {
                                i4++;
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

    public void parse_json() {
        synchronized (this) {
            try {
                if (((ConnectivityManager) getSystemService("connectivity")).getNetworkInfo(1).getState() != NetworkInfo.State.CONNECTED) {
                    unlink_parse(SharedPreferencesHelper.load_info());
                } else if (this.login_res != 0) {
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
            } catch (Exception e) {
            }
        }
    }

    public String parse_studentid(String str) {
        String str2;
        JSONObject jSONObject;
        try {
            jSONObject = (JSONObject) new JSONTokener(str).nextValue();
        } catch (JSONException e) {
            e.printStackTrace();
            str2 = null;
        }
        if (!"0".equals(jSONObject.getString("errorNum"))) {
            str2 = null;
            return str2;
        }
        str2 = jSONObject.getJSONObject("data").getString("studentid");
        return str2;
    }

    public void shared_getinfo(String str) {
        StringBuffer stringBuffer = new StringBuffer();
        try {
            BufferedReader bufferedReader = new BufferedReader(new FileReader(str));
            for (String readLine = bufferedReader.readLine(); readLine != null; readLine = bufferedReader.readLine()) {
                stringBuffer.append(readLine);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
        SharedPreferencesHelper.save_info(stringBuffer.toString());
    }

    public void toast(final String str) {
        runOnUiThread(new Runnable() { // from class: com.edutech.appmanage.MainActivity.19
            @Override // java.lang.Runnable
            public void run() {
                Toast.makeText(MainActivity.this.getApplicationContext(), str, 0).show();
            }
        });
    }

    public void unlink_parse(String str) {
        PackageInfo packageInfo;
        try {
            JSONArray jSONArray = ((JSONObject) new JSONTokener(str).nextValue()).getJSONObject("data").getJSONArray("app");
            market_applist = new LinkedList<>();
            market_applist_local = new LinkedList<>();
            int i = 0;
            while (true) {
                if (i >= jSONArray.length()) {
                    break;
                }
                AppInfo appInfo = new AppInfo();
                JSONObject jSONObject = (JSONObject) jSONArray.get(i);
                appInfo.apptype = Integer.parseInt(jSONObject.getString("apptype"));
                appInfo.apkname = jSONObject.getString("apkname");
                appInfo.appname = jSONObject.getString("appname");
                appInfo.packagename = jSONObject.getString("packagename");
                if (!"".equals(appInfo.packagename)) {
                    try {
                        packageInfo = getPackageManager().getPackageInfo(appInfo.packagename, 0);
                    } catch (PackageManager.NameNotFoundException e) {
                        packageInfo = null;
                        e.printStackTrace();
                    }
                    if (packageInfo != null) {
                        appInfo.islocal = true;
                        appInfo.appsize = jSONObject.getString("appsize");
                        appInfo.versionCode = Integer.parseInt(jSONObject.getString("versioncode"));
                        if (jSONObject.getString("versionname").length() > 10) {
                            appInfo.versionName = String.valueOf(jSONObject.getString("versionname").substring(0, 10)) + "...";
                        } else {
                            appInfo.versionName = jSONObject.getString("versionname");
                        }
                        appInfo.webpath = jSONObject.getString(KeyEnvironment.KEYWEBPATH);
                        appInfo.iconurl = jSONObject.getString("iconurl");
                        market_applist.add(appInfo);
                        market_applist_local.add(appInfo);
                    }
                }
                i++;
            }
        } catch (JSONException e2) {
            e2.printStackTrace();
        }
        Collections.sort(market_applist, new Comparator<AppInfo>() { // from class: com.edutech.appmanage.MainActivity.12
            public int compare(AppInfo appInfo2, AppInfo appInfo3) {
                char c = 0;
                char c2 = 0;
                if (appInfo2.islocal) {
                    c = 1;
                }
                if (appInfo3.islocal) {
                    c2 = 1;
                }
                return c > c2 ? -1 : c == c2 ? 0 : 1;
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
}
