package com.edutech.mobilestudyclient.activity;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlertDialog;
import android.app.admin.DevicePolicyManager;
// import android.app.enterprise.DateTimePolicy;
// import android.app.enterprise.EnterpriseDeviceManager;
// import android.app.enterprise.RestrictionPolicy;
// import android.app.enterprise.kioskmode.KioskMode;
// import android.app.enterprise.license.EnterpriseLicenseManager;
// import android.app.enterprise.multiuser.MultiUserManager;
import android.app.mia.MiaMdmPolicyManager;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import com.edutech.cloudclientsetting.activity.CloudClientSetActivity;
import com.edutech.idauthentication.MainActivity;
import com.edutech.json.KeyEnvironment;
import com.edutech.mobilestudyclient.ApkUpdateBean;
import com.edutech.mobilestudyclient.LanguageUtils;
import com.edutech.mobilestudyclient.SysConfig.AppEnvironment;
import com.edutech.mobilestudyclient.activity.service.sysProtectService;
import com.edutech.mobilestudyclient.download.Async;
import com.edutech.mobilestudyclient.download.HttpUtils;
import com.edutech.mobilestudyclient.download.XmlUtils;
import com.edutech.mobilestudyclient.util.DensityUtil;
import com.edutech.mobilestudyclient.util.My_md5;
import com.edutech.mobilestudyclient.util.Noticebean;
import com.edutech.mobilestudyclient.util.Utils;
import com.edutech.mobilestudyclient.util.XmlLoadHelper;
import com.edutech.publicedu.log.LogHelp;
import com.edutech.utils.InstallApkUtil;
import com.edutech.utils.SystemInfoHelper;
import com.huawei.android.app.admin.HwDevicePolicyManager;
import com.launcher.activity.R;
import com.mobilestudyclient.application.My_Application;
import com.pgyersdk.crash.PgyCrashManager;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.zip.GZIPInputStream;
import org.apache.commons.io.FileUtils;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.SQLExec;
import org.bson.BSON;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public class CloudClientActivity extends ActivityBase implements View.OnClickListener {
    public static final String BROADCASTER_LOCKSCREEN = "com.edu.action.LAUNCHER_STRAT";
    public static final String Intent_STATUSBAR_INVISIBILITY = "android.intent.action.STATUSBAR_INVISIBILITY";
    public static final String Intent_STATUSBAR_VISIBILITY = "android.intent.action.STATUSBAR_VISIBILITY";
    private static final String SKEY = "064F7FE4BE6AEC1360CF63E2E5A0B6B37E233ED563C6C1FB92E27920821DB97B2A7228F88CC76E0C53B4308201453B96888B37289AAAB829777702FEEE1E0028";
    private static final int START_PROGRESS = 4115;
    public static final String Samsung_MDM = "android.intent.action.mdm";
    private static final String TAG = "CloudClientActivity";
    private static final int UPDATE_INSTALLSINGLE = 4116;
    private static final int UPDATE_INSTALLSTATE = 4114;
    private static final int UPDATE_PROGRESS = 4113;
    public static ArrayList<HashMap<String, String>> jsonAppInfoListMobileStudy;
    public static int mHight;
    public static int mWidth;
    private BroadcastReceiver InteractionReceiver;
    private String LANGUAGEPATH;
    private boolean LicenseOK;
    String UPDATEAPK;
    private ArrayList<String> addApksList;
    private SharedPreferences agreement_sp;
    Handler apkHandler;
    BroadcastReceiver apkInstallReceiver;
    private List<String> apkList;
    private List<ApkUpdateBean> apkUpdateList;
    private List<String> apkUpdatePkgList;
    private Handler batteryChangedHandler;
    private BatteryReceiver batteryReceiver;
    private Button btnYes;
    Handler callHandler;
    private boolean canRefresh;
    private CheckBox cb;
    Runnable checkIdThread;
    private ComponentName cn;
    private long currentCacheLength;
    private long currentCachePosition;
    private boolean deletingFiles;
    private ListView dialog_noticemessage_listview;
    private TextView dialog_noticemessage_tvnotice;
    private TextView dialog_noticemessage_tvok;
    private boolean hasGeted;
    private boolean hasUpdated;
    private HashMap<String, String> hashmap;
    private final MainActivity idauth;
    private TextView imageViewSetting;
    private ImageView[] imageViews;
    Handler installHandler;
    private Boolean is3G;
    private boolean isGetApks;
    private boolean isGetLauncher;
    private boolean isInteraction;
    private Boolean isLenovo;
    private boolean isnotice;
    DialogInterface.OnKeyListener keylistener;
    private String language;
    private String launcherPath;
    private LinearLayout ll_eight;
    private LinearLayout ll_eleven;
    private LinearLayout ll_five;
    private LinearLayout ll_four;
    private LinearLayout ll_nine;
    private LinearLayout ll_one;
    private LinearLayout ll_seven;
    private LinearLayout ll_six;
    private LinearLayout ll_sms;
    private LinearLayout ll_ten;
    private LinearLayout ll_three;
    private LinearLayout ll_twelve;
    private LinearLayout ll_two;
    public ActivityManager mActivityManager;
    private List<ResolveInfo> mAllApps;
    private DevicePolicyManager mDPM;
    private ComponentName mDeviceAdmin;
    private HwDevicePolicyManager mHwPDM;
    MiaMdmPolicyManager mMiaMdmPolicyManager;
    private PackageManager mPackageManager;
    private LinearLayout mainbackground;
    public Thread mobileStudyClientUpdateThread;
    private List<String> myappList;
    private NoticeAdapter noticeAdapter;
    private AlertDialog noticeDialog;
    Handler noticeHandler;
    private List<Noticebean> noticeMessages;
    private int noticeNum;
    Runnable noticeRunnable;
    private Thread noticeThread;
    private String officesuitPackage;
    private boolean onconfigureChange;
    private ScrollView scrollView;
    private ImageButton sdyb_btn1;
    private ImageButton sdyb_btn2;
    private ImageButton sdyb_btn3;
    private ImageButton sdyb_btn4;
    private ImageButton sdyb_btn5;
    private TextView sdyb_myapp;
    private TextView sdyb_time;
    private String send_demo;
    private String send_ip;
    private String send_name;
    private String send_privatekey;
    private String send_pwd;
    private String send_schoolid;
    private String send_usercode;
    private boolean showTime;
    private TextView[] textViews;
    private TextView three_noticetv;
    Handler timeHandler;
    Runnable timeRunnable;
    private Thread timeThread;
    private TextView tv_battery;
    private TextView tv_line;
    private Switch tv_main_eryproc;
    public TextView tv_msg;
    private TextView tv_stuname;
    public TextView tv_tel;
    private TextView tv_updatemsg;
    private TextView tv_wifi;
    private UpdateThread updateThread;
    private int updateTime;
    private String username;
    private WifiReceiver wifiReceiver;
    private TextView wifi_btn;
    private String wpsPackage;
    public static boolean isDown = false;
    public static ArrayList<HashMap<String, String>> apkdownloadlist = new ArrayList<>();
    public static ArrayList<HashMap<String, String>> apkdownloadlistTemp = new ArrayList<>();
    public static ArrayList<Map<String, Async>> apkTaskList = new ArrayList<>();
    public static ArrayList<String> apkfinList = null;
    public static int installApkFlag = -1;
    public static final String TEMP = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "MobileStudyClient" + File.separatorChar + ".System" + File.separatorChar + "DaoXueBen" + File.separatorChar + "temp" + File.separatorChar;

    public CloudClientActivity(Context pContext) {
        this.imageViews = new ImageView[12];
        this.textViews = new TextView[12];
        this.mPackageManager = null;
        this.mAllApps = null;
        this.idauth = new MainActivity(this);
        this.mobileStudyClientUpdateThread = null;
        this.is3G = false;
        this.isLenovo = false;
        this.hashmap = null;
        this.username = "";
        this.UPDATEAPK = "android.edutech.updateapk";
        this.isInteraction = true;
        this.send_ip = "";
        this.send_name = "";
        this.send_privatekey = "";
        this.send_demo = "";
        this.send_pwd = "";
        this.send_usercode = "";
        this.send_schoolid = "";
        this.wpsPackage = "cn.wps.moffice_eng";
        this.officesuitPackage = "com.mobisystems.office";
        this.LANGUAGEPATH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "MobileStudyClient" + File.separatorChar + ".System" + File.separatorChar + "language.xml";
        this.onconfigureChange = false;
        this.launcherPath = "";
        this.updateTime = 0;
        this.isGetLauncher = false;
        this.hasGeted = false;
        this.isGetApks = false;
        this.hasUpdated = false;
        this.addApksList = new ArrayList<>();
        this.myappList = new ArrayList();
        this.showTime = true;
        this.isnotice = true;
        this.deletingFiles = false;
        this.LicenseOK = false;
        this.apkUpdateList = new ArrayList();
        this.apkUpdatePkgList = new ArrayList();
        this.currentCachePosition = 0L;
        this.currentCacheLength = 0L;
        this.canRefresh = false;
        this.language = "";
        this.installHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.1
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                PackageInfo packageInfo2;
                switch (msg.what) {
                    case 1:
                        CloudClientActivity.this.installNewApk();
                        return;
                    case 3:
                        CloudClientActivity.this.updateThread = null;
                        CloudClientActivity.this.updateTime = HttpStatus.SC_MULTIPLE_CHOICES;
                        CloudClientActivity.this.showFailedApkInfo();
                        return;
                    case 4:
                        Intent intent2 = new Intent("android.intent.action.MAIN");
                        intent2.addFlags(268435456);
                        ComponentName cn = new ComponentName("com.edutech.assistantdemo", "com.edutech.assistantdemo.MainActivity");
                        intent2.setComponent(cn);
                        try {
                            packageInfo2 = CloudClientActivity.this.getPackageManager().getPackageInfo("com.edutech.assistantdemo", 0);
                        } catch (PackageManager.NameNotFoundException e) {
                            packageInfo2 = null;
                        }
                        if (packageInfo2 != null) {
                            CloudClientActivity.this.startActivity(intent2);
                            return;
                        }
                        return;
                    case CloudClientActivity.UPDATE_PROGRESS /* 4113 */:
                        try {
                            CloudClientActivity.this.refreshDownloadPB();
                            return;
                        } catch (Exception e2) {
                            e2.printStackTrace();
                            return;
                        }
                    case CloudClientActivity.UPDATE_INSTALLSTATE /* 4114 */:
                    default:
                        return;
                    case CloudClientActivity.START_PROGRESS /* 4115 */:
                        try {
                            if (CloudClientActivity.this.tv_updatemsg != null) {
                                CloudClientActivity.this.tv_updatemsg.setVisibility(0);
                            }
                            CloudClientActivity.this.refreshDownloadPB();
                            return;
                        } catch (Exception e3) {
                            e3.printStackTrace();
                            return;
                        }
                    case CloudClientActivity.UPDATE_INSTALLSINGLE /* 4116 */:
                        String path = (String) msg.obj;
                        CloudClientActivity.this.installSingleApk(path);
                        return;
                }
            }
        };
        this.InteractionReceiver = new BroadcastReceiver() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.2
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                String action = intent.getAction();
                if (action.equals("android.intent.action.STATUSBAR_INVISIBILITY")) {
                    CloudClientActivity.this.isInteraction = true;
                } else if (action.equals("android.intent.action.STATUSBAR_VISIBILITY")) {
                    CloudClientActivity.this.isInteraction = false;
                }
            }
        };
        this.callHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.3
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                int what = msg.what;
                switch (what) {
                    case 0:
                        if (CloudClientActivity.this.is3G.booleanValue()) {
                            Intent intent_tel = new Intent();
                            if (CloudClientActivity.this.isLenovo.booleanValue()) {
                                intent_tel.setPackage("com.lenovo.ideafriend");
                                intent_tel.setType("vnd.android-dir/mms-sms");
                            } else {
                                intent_tel.setPackage("com.android.mms");
                                intent_tel.setType("vnd.android-dir/mms-sms");
                                intent_tel.setAction("android.intent.action.MAIN");
                            }
                            CloudClientActivity.this.startActivity(intent_tel);
                            return;
                        }
                        return;
                    case 1:
                        if (!CloudClientActivity.this.is3G.booleanValue() || !Build.DISPLAY.contains("TB-8703N")) {
                            if (CloudClientActivity.this.is3G.booleanValue()) {
                                Intent intent = new Intent();
                                intent.setAction("android.intent.action.CALL_BUTTON");
                                CloudClientActivity.this.startActivity(intent);
                                return;
                            }
                            return;
                        }
                        Intent intent2 = new Intent();
                        intent2.setClassName("com.android.dialer", "com.android.dialer.DialtactsActivity");
                        intent2.setFlags(268435456);
                        intent2.setFlags(536870912);
                        CloudClientActivity.this.startActivity(intent2);
                        return;
                    case 2:
                        Toast.makeText(CloudClientActivity.this, (int) R.string.notthetime, 0).show();
                        return;
                    default:
                        return;
                }
            }
        };
        this.checkIdThread = new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.4
            @Override // java.lang.Runnable
            public void run() {
                My_Application.Allow_Flag = true;
                Looper.loop();
            }
        };
        this.batteryChangedHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.5
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                int battery = msg.arg1;
                int status = msg.arg2;
                if (status == 2) {
                    if (AppEnvironment.isSNZT) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_batterying), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (AppEnvironment.isSDYB) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_batterying), (Drawable) null, (Drawable) null);
                    } else if (AppEnvironment.isMAINNEW || AppEnvironment.isDEMO) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_newcharge), (Drawable) null);
                    } else {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_charging), (Drawable) null, (Drawable) null, (Drawable) null);
                    }
                } else if (AppEnvironment.isSNZT) {
                    if (battery > 0 && battery <= 10) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery1), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 10 && battery <= 20) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery2), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 20 && battery <= 30) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery3), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 30 && battery <= 40) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery4), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 40 && battery <= 50) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery5), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 50 && battery <= 60) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery6), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 60 && battery <= 70) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery7), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 70 && battery <= 80) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery8), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 80 && battery <= 90) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery9), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 90 && battery <= 100) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery10), (Drawable) null, (Drawable) null, (Drawable) null);
                    }
                } else if (AppEnvironment.isSDYB) {
                    if (battery > 0 && battery <= 10) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery1), (Drawable) null, (Drawable) null);
                    } else if (battery > 10 && battery <= 20) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery2), (Drawable) null, (Drawable) null);
                    } else if (battery > 20 && battery <= 30) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery3), (Drawable) null, (Drawable) null);
                    } else if (battery > 30 && battery <= 40) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery4), (Drawable) null, (Drawable) null);
                    } else if (battery > 40 && battery <= 50) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery5), (Drawable) null, (Drawable) null);
                    } else if (battery > 50 && battery <= 60) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery6), (Drawable) null, (Drawable) null);
                    } else if (battery > 60 && battery <= 70) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery7), (Drawable) null, (Drawable) null);
                    } else if (battery > 70 && battery <= 80) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery8), (Drawable) null, (Drawable) null);
                    } else if (battery > 80 && battery <= 90) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery9), (Drawable) null, (Drawable) null);
                    } else if (battery > 90 && battery <= 100) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery10), (Drawable) null, (Drawable) null);
                    }
                } else if (AppEnvironment.isMAINNEW || AppEnvironment.isDEMO) {
                    if (battery > 0 && battery <= 10) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new1), (Drawable) null);
                    } else if (battery > 10 && battery <= 20) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new2), (Drawable) null);
                    } else if (battery > 20 && battery <= 30) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new3), (Drawable) null);
                    } else if (battery > 30 && battery <= 40) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new4), (Drawable) null);
                    } else if (battery > 40 && battery <= 50) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new5), (Drawable) null);
                    } else if (battery > 50 && battery <= 60) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new6), (Drawable) null);
                    } else if (battery > 60 && battery <= 70) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new7), (Drawable) null);
                    } else if (battery > 70 && battery <= 80) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new8), (Drawable) null);
                    } else if (battery > 80 && battery <= 90) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new9), (Drawable) null);
                    } else if (battery > 90 && battery <= 100) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new10), (Drawable) null);
                    }
                } else if (battery > 0 && battery <= 10) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_01), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 10 && battery <= 20) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_02), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 20 && battery <= 30) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_03), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 30 && battery <= 40) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_04), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 40 && battery <= 50) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_05), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 50 && battery <= 60) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_06), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 60 && battery <= 70) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_07), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 70 && battery <= 80) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_08), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 80 && battery <= 90) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_09), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 90 && battery <= 100) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_0full), (Drawable) null, (Drawable) null, (Drawable) null);
                }
                CloudClientActivity.this.tv_battery.setText(String.valueOf(battery) + "%");
            }
        };
        this.keylistener = new DialogInterface.OnKeyListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.6
            @Override // android.content.DialogInterface.OnKeyListener
            public boolean onKey(DialogInterface dialog, int keyCode, KeyEvent event) {
                return keyCode == 4 && event.getRepeatCount() == 0;
            }
        };
        this.apkInstallReceiver = new BroadcastReceiver() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.7
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                String action = intent.getAction();
                if (action.equals("android.intent.action.PACKAGE_ADDED")) {
                    Message msg = CloudClientActivity.this.apkHandler.obtainMessage();
                    msg.sendToTarget();
                    String packageName = intent.getDataString().replace("package:", "");
                    try {
                        if (CloudClientActivity.this.apkUpdatePkgList != null && CloudClientActivity.this.apkUpdatePkgList.contains(packageName)) {
                            CloudClientActivity.this.apkUpdatePkgList.remove(packageName);
                        }
                    } catch (Exception e) {
                    }
                }
            }
        };
        this.apkHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.8
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                CloudClientActivity.this.showFailedApkInfo();
            }
        };
        this.timeRunnable = new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.9
            /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x00f8: INVOKE  (r13v2 int A[REMOVE]) = (r0v0 'cal' java.util.Calendar A[D('cal' java.util.Calendar)]), (11 int) type: VIRTUAL call: java.util.Calendar.get(int):int)] */
            /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x010d: INVOKE  (r13v5 int A[REMOVE]) = (r0v0 'cal' java.util.Calendar A[D('cal' java.util.Calendar)]), (12 int) type: VIRTUAL call: java.util.Calendar.get(int):int)] */
            /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x0122: INVOKE  (r13v8 int A[REMOVE]) = (r0v0 'cal' java.util.Calendar A[D('cal' java.util.Calendar)]), (13 int) type: VIRTUAL call: java.util.Calendar.get(int):int)] */
            /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x01a7: INVOKE  (r13v12 int A[REMOVE]) = (r0v0 'cal' java.util.Calendar A[D('cal' java.util.Calendar)]), (11 int) type: VIRTUAL call: java.util.Calendar.get(int):int)] */
            @Override // java.lang.Runnable
            public void run() {
                String time;
                while (CloudClientActivity.this.showTime) {
                    Calendar cal = Calendar.getInstance();
                    int month = cal.get(2);
                    int year = cal.get(1);
                    int day = cal.get(5);
                    String hour = cal.get(11) < 10 ? "0" + cal.get(11) : new StringBuilder().append(cal.get(11)).toString();
                    String minute = cal.get(12) < 10 ? "0" + cal.get(12) : new StringBuilder().append(cal.get(12)).toString();
                    if (cal.get(13) < 10) {
                        String str = "0" + cal.get(13);
                    } else {
                        new StringBuilder().append(cal.get(13)).toString();
                    }
                    int weekday = cal.get(7);
                    if (!AppEnvironment.isSDYB) {
                        if (!AppEnvironment.isMAINNEW && !AppEnvironment.isDEMO) {
                            if (!CloudClientActivity.this.language.equals("en")) {
                                time = String.valueOf(hour) + ":" + minute + " " + CloudClientActivity.this.getWeekDay(weekday) + "\n" + year + "年" + (month + 1) + "月" + day + "日 ";
                            } else {
                                time = String.valueOf(hour) + ":" + minute + " " + CloudClientActivity.this.getWeekDay(weekday) + "\n" + CloudClientActivity.this.getMonth(month) + "," + day + "," + year;
                            }
                        } else if (cal.get(11) <= 12) {
                            time = "上午 " + hour + ":" + minute;
                        } else {
                            String hour2 = cal.get(11) + (-12) < 10 ? "0" + (cal.get(11) - 12) : new StringBuilder().append(cal.get(11)).toString();
                            time = "下午 " + hour2 + ":" + minute;
                        }
                    } else {
                        time = String.valueOf(hour) + ":" + minute + "\n" + year + "年" + (month + 1) + "月" + day + "日\n" + CloudClientActivity.this.getWeekDay(weekday);
                    }
                    Message msg = CloudClientActivity.this.timeHandler.obtainMessage();
                    msg.what = 1;
                    msg.obj = time;
                    msg.sendToTarget();
                    try {
                        Thread.sleep(1000L);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        };
        this.timeHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.10
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                switch (msg.what) {
                    case 1:
                        String time = (String) msg.obj;
                        if (CloudClientActivity.this.sdyb_time != null && time != null) {
                            CloudClientActivity.this.sdyb_time.setText(time);
                            return;
                        }
                        return;
                    default:
                        return;
                }
            }
        };
        this.noticeHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.11
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                switch (msg.what) {
                    case 1:
                        int obj = msg.arg1;
                        if (CloudClientActivity.this.three_noticetv != null) {
                            CloudClientActivity.this.three_noticetv.setVisibility(0);
                            if (obj <= 0) {
                                CloudClientActivity.this.three_noticetv.setVisibility(8);
                            } else {
                                String obj_str = obj < 100 ? new StringBuilder(String.valueOf(obj)).toString() : "99+";
                                CloudClientActivity.this.three_noticetv.setText(obj_str);
                            }
                        }
                        try {
                            CloudClientActivity.this.showNoticeDetails();
                            return;
                        } catch (Exception e) {
                            return;
                        }
                    default:
                        return;
                }
            }
        };
        this.noticeRunnable = new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.12
            @Override // java.lang.Runnable
            public void run() {
                while (CloudClientActivity.this.isnotice) {
                    SharedPreferences sp = CloudClientActivity.this.getSharedPreferences("notice", 0);
                    long start = sp.getLong("lasttime", 0L);
                    long now = System.currentTimeMillis();
                    if (start == 0 || Math.abs(now - start) >= 600000) {
                        sp.edit().putLong("lasttime", now).commit();
                        CloudClientActivity.this.getMyWorkNotification();
                    }
                    try {
                        Thread.sleep(300000L);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        };
    }

    public CloudClientActivity() {
        this.imageViews = new ImageView[12];
        this.textViews = new TextView[12];
        this.mPackageManager = null;
        this.mAllApps = null;
        this.idauth = new MainActivity(this);
        this.mobileStudyClientUpdateThread = null;
        this.is3G = false;
        this.isLenovo = false;
        this.hashmap = null;
        this.username = "";
        this.UPDATEAPK = "android.edutech.updateapk";
        this.isInteraction = true;
        this.send_ip = "";
        this.send_name = "";
        this.send_privatekey = "";
        this.send_demo = "";
        this.send_pwd = "";
        this.send_usercode = "";
        this.send_schoolid = "";
        this.wpsPackage = "cn.wps.moffice_eng";
        this.officesuitPackage = "com.mobisystems.office";
        this.LANGUAGEPATH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "MobileStudyClient" + File.separatorChar + ".System" + File.separatorChar + "language.xml";
        this.onconfigureChange = false;
        this.launcherPath = "";
        this.updateTime = 0;
        this.isGetLauncher = false;
        this.hasGeted = false;
        this.isGetApks = false;
        this.hasUpdated = false;
        this.addApksList = new ArrayList<>();
        this.myappList = new ArrayList();
        this.showTime = true;
        this.isnotice = true;
        this.deletingFiles = false;
        this.LicenseOK = false;
        this.apkUpdateList = new ArrayList();
        this.apkUpdatePkgList = new ArrayList();
        this.currentCachePosition = 0L;
        this.currentCacheLength = 0L;
        this.canRefresh = false;
        this.language = "";
        this.installHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.1
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                PackageInfo packageInfo2;
                switch (msg.what) {
                    case 1:
                        CloudClientActivity.this.installNewApk();
                        return;
                    case 3:
                        CloudClientActivity.this.updateThread = null;
                        CloudClientActivity.this.updateTime = HttpStatus.SC_MULTIPLE_CHOICES;
                        CloudClientActivity.this.showFailedApkInfo();
                        return;
                    case 4:
                        Intent intent2 = new Intent("android.intent.action.MAIN");
                        intent2.addFlags(268435456);
                        ComponentName cn = new ComponentName("com.edutech.assistantdemo", "com.edutech.assistantdemo.MainActivity");
                        intent2.setComponent(cn);
                        try {
                            packageInfo2 = CloudClientActivity.this.getPackageManager().getPackageInfo("com.edutech.assistantdemo", 0);
                        } catch (PackageManager.NameNotFoundException e) {
                            packageInfo2 = null;
                            e.printStackTrace();
                        }
                        if (packageInfo2 != null) {
                            CloudClientActivity.this.startActivity(intent2);
                            return;
                        }
                        return;
                    case CloudClientActivity.UPDATE_PROGRESS /* 4113 */:
                        try {
                            CloudClientActivity.this.refreshDownloadPB();
                            return;
                        } catch (Exception e2) {
                            e2.printStackTrace();
                            return;
                        }
                    case CloudClientActivity.UPDATE_INSTALLSTATE /* 4114 */:
                    default:
                        return;
                    case CloudClientActivity.START_PROGRESS /* 4115 */:
                        try {
                            if (CloudClientActivity.this.tv_updatemsg != null) {
                                CloudClientActivity.this.tv_updatemsg.setVisibility(0);
                            }
                            CloudClientActivity.this.refreshDownloadPB();
                            return;
                        } catch (Exception e3) {
                            e3.printStackTrace();
                            return;
                        }
                    case CloudClientActivity.UPDATE_INSTALLSINGLE /* 4116 */:
                        String path = (String) msg.obj;
                        CloudClientActivity.this.installSingleApk(path);
                        return;
                }
            }
        };
        this.InteractionReceiver = new BroadcastReceiver() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.2
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                String action = intent.getAction();
                if (action.equals("android.intent.action.STATUSBAR_INVISIBILITY")) {
                    CloudClientActivity.this.isInteraction = true;
                } else if (action.equals("android.intent.action.STATUSBAR_VISIBILITY")) {
                    CloudClientActivity.this.isInteraction = false;
                }
            }
        };
        this.callHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.3
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                int what = msg.what;
                switch (what) {
                    case 0:
                        if (CloudClientActivity.this.is3G.booleanValue()) {
                            Intent intent_tel = new Intent();
                            if (CloudClientActivity.this.isLenovo.booleanValue()) {
                                intent_tel.setPackage("com.lenovo.ideafriend");
                                intent_tel.setType("vnd.android-dir/mms-sms");
                            } else {
                                intent_tel.setPackage("com.android.mms");
                                intent_tel.setType("vnd.android-dir/mms-sms");
                                intent_tel.setAction("android.intent.action.MAIN");
                            }
                            CloudClientActivity.this.startActivity(intent_tel);
                            return;
                        }
                        return;
                    case 1:
                        if (!CloudClientActivity.this.is3G.booleanValue() || !Build.DISPLAY.contains("TB-8703N")) {
                            if (CloudClientActivity.this.is3G.booleanValue()) {
                                Intent intent = new Intent();
                                intent.setAction("android.intent.action.CALL_BUTTON");
                                CloudClientActivity.this.startActivity(intent);
                                return;
                            }
                            return;
                        }
                        Intent intent2 = new Intent();
                        intent2.setClassName("com.android.dialer", "com.android.dialer.DialtactsActivity");
                        intent2.setFlags(268435456);
                        intent2.setFlags(536870912);
                        CloudClientActivity.this.startActivity(intent2);
                        return;
                    case 2:
                        Toast.makeText(CloudClientActivity.this, (int) R.string.notthetime, 0).show();
                        return;
                    default:
                        return;
                }
            }
        };
        this.checkIdThread = new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.4
            @Override // java.lang.Runnable
            public void run() {
                My_Application.Allow_Flag = true;
                Looper.loop();
            }
        };
        this.batteryChangedHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.5
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                int battery = msg.arg1;
                int status = msg.arg2;
                if (status == 2) {
                    if (AppEnvironment.isSNZT) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_batterying), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (AppEnvironment.isSDYB) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_batterying), (Drawable) null, (Drawable) null);
                    } else if (AppEnvironment.isMAINNEW || AppEnvironment.isDEMO) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_newcharge), (Drawable) null);
                    } else {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_charging), (Drawable) null, (Drawable) null, (Drawable) null);
                    }
                } else if (AppEnvironment.isSNZT) {
                    if (battery > 0 && battery <= 10) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery1), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 10 && battery <= 20) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery2), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 20 && battery <= 30) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery3), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 30 && battery <= 40) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery4), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 40 && battery <= 50) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery5), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 50 && battery <= 60) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery6), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 60 && battery <= 70) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery7), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 70 && battery <= 80) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery8), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 80 && battery <= 90) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery9), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (battery > 90 && battery <= 100) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery10), (Drawable) null, (Drawable) null, (Drawable) null);
                    }
                } else if (AppEnvironment.isSDYB) {
                    if (battery > 0 && battery <= 10) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery1), (Drawable) null, (Drawable) null);
                    } else if (battery > 10 && battery <= 20) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery2), (Drawable) null, (Drawable) null);
                    } else if (battery > 20 && battery <= 30) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery3), (Drawable) null, (Drawable) null);
                    } else if (battery > 30 && battery <= 40) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery4), (Drawable) null, (Drawable) null);
                    } else if (battery > 40 && battery <= 50) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery5), (Drawable) null, (Drawable) null);
                    } else if (battery > 50 && battery <= 60) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery6), (Drawable) null, (Drawable) null);
                    } else if (battery > 60 && battery <= 70) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery7), (Drawable) null, (Drawable) null);
                    } else if (battery > 70 && battery <= 80) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery8), (Drawable) null, (Drawable) null);
                    } else if (battery > 80 && battery <= 90) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery9), (Drawable) null, (Drawable) null);
                    } else if (battery > 90 && battery <= 100) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery10), (Drawable) null, (Drawable) null);
                    }
                } else if (AppEnvironment.isMAINNEW || AppEnvironment.isDEMO) {
                    if (battery > 0 && battery <= 10) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new1), (Drawable) null);
                    } else if (battery > 10 && battery <= 20) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new2), (Drawable) null);
                    } else if (battery > 20 && battery <= 30) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new3), (Drawable) null);
                    } else if (battery > 30 && battery <= 40) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new4), (Drawable) null);
                    } else if (battery > 40 && battery <= 50) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new5), (Drawable) null);
                    } else if (battery > 50 && battery <= 60) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new6), (Drawable) null);
                    } else if (battery > 60 && battery <= 70) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new7), (Drawable) null);
                    } else if (battery > 70 && battery <= 80) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new8), (Drawable) null);
                    } else if (battery > 80 && battery <= 90) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new9), (Drawable) null);
                    } else if (battery > 90 && battery <= 100) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new10), (Drawable) null);
                    }
                } else if (battery > 0 && battery <= 10) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_01), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 10 && battery <= 20) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_02), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 20 && battery <= 30) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_03), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 30 && battery <= 40) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_04), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 40 && battery <= 50) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_05), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 50 && battery <= 60) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_06), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 60 && battery <= 70) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_07), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 70 && battery <= 80) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_08), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 80 && battery <= 90) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_09), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (battery > 90 && battery <= 100) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_0full), (Drawable) null, (Drawable) null, (Drawable) null);
                }
                CloudClientActivity.this.tv_battery.setText(String.valueOf(battery) + "%");
            }
        };
        this.keylistener = new DialogInterface.OnKeyListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.6
            @Override // android.content.DialogInterface.OnKeyListener
            public boolean onKey(DialogInterface dialog, int keyCode, KeyEvent event) {
                return keyCode == 4 && event.getRepeatCount() == 0;
            }
        };
        this.apkInstallReceiver = new BroadcastReceiver() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.7
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                String action = intent.getAction();
                if (action.equals("android.intent.action.PACKAGE_ADDED")) {
                    Message msg = CloudClientActivity.this.apkHandler.obtainMessage();
                    msg.sendToTarget();
                    String packageName = intent.getDataString().replace("package:", "");
                    try {
                        if (CloudClientActivity.this.apkUpdatePkgList != null && CloudClientActivity.this.apkUpdatePkgList.contains(packageName)) {
                            CloudClientActivity.this.apkUpdatePkgList.remove(packageName);
                        }
                    } catch (Exception e) {
                    }
                }
            }
        };
        this.apkHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.8
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                CloudClientActivity.this.showFailedApkInfo();
            }
        };
        this.timeRunnable = new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.9
            /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x00f8: INVOKE  (r13v2 int A[REMOVE]) = (r0v0 'cal' java.util.Calendar A[D('cal' java.util.Calendar)]), (11 int) type: VIRTUAL call: java.util.Calendar.get(int):int)] */
            /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x010d: INVOKE  (r13v5 int A[REMOVE]) = (r0v0 'cal' java.util.Calendar A[D('cal' java.util.Calendar)]), (12 int) type: VIRTUAL call: java.util.Calendar.get(int):int)] */
            /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x0122: INVOKE  (r13v8 int A[REMOVE]) = (r0v0 'cal' java.util.Calendar A[D('cal' java.util.Calendar)]), (13 int) type: VIRTUAL call: java.util.Calendar.get(int):int)] */
            /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x01a7: INVOKE  (r13v12 int A[REMOVE]) = (r0v0 'cal' java.util.Calendar A[D('cal' java.util.Calendar)]), (11 int) type: VIRTUAL call: java.util.Calendar.get(int):int)] */
            @Override // java.lang.Runnable
            public void run() {
                String time;
                while (CloudClientActivity.this.showTime) {
                    Calendar cal = Calendar.getInstance();
                    int month = cal.get(2);
                    int year = cal.get(1);
                    int day = cal.get(5);
                    String hour = cal.get(11) < 10 ? "0" + cal.get(11) : new StringBuilder().append(cal.get(11)).toString();
                    String minute = cal.get(12) < 10 ? "0" + cal.get(12) : new StringBuilder().append(cal.get(12)).toString();
                    if (cal.get(13) < 10) {
                        String str = "0" + cal.get(13);
                    } else {
                        new StringBuilder().append(cal.get(13)).toString();
                    }
                    int weekday = cal.get(7);
                    if (!AppEnvironment.isSDYB) {
                        if (!AppEnvironment.isMAINNEW && !AppEnvironment.isDEMO) {
                            if (!CloudClientActivity.this.language.equals("en")) {
                                time = String.valueOf(hour) + ":" + minute + " " + CloudClientActivity.this.getWeekDay(weekday) + "\n" + year + "年" + (month + 1) + "月" + day + "日 ";
                            } else {
                                time = String.valueOf(hour) + ":" + minute + " " + CloudClientActivity.this.getWeekDay(weekday) + "\n" + CloudClientActivity.this.getMonth(month) + "," + day + "," + year;
                            }
                        } else if (cal.get(11) <= 12) {
                            time = "上午 " + hour + ":" + minute;
                        } else {
                            String hour2 = cal.get(11) + (-12) < 10 ? "0" + (cal.get(11) - 12) : new StringBuilder().append(cal.get(11)).toString();
                            time = "下午 " + hour2 + ":" + minute;
                        }
                    } else {
                        time = String.valueOf(hour) + ":" + minute + "\n" + year + "年" + (month + 1) + "月" + day + "日\n" + CloudClientActivity.this.getWeekDay(weekday);
                    }
                    Message msg = CloudClientActivity.this.timeHandler.obtainMessage();
                    msg.what = 1;
                    msg.obj = time;
                    msg.sendToTarget();
                    try {
                        Thread.sleep(1000L);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        };
        this.timeHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.10
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                switch (msg.what) {
                    case 1:
                        String time = (String) msg.obj;
                        if (CloudClientActivity.this.sdyb_time != null && time != null) {
                            CloudClientActivity.this.sdyb_time.setText(time);
                            return;
                        }
                        return;
                    default:
                        return;
                }
            }
        };
        this.noticeHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.11
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                switch (msg.what) {
                    case 1:
                        int obj = msg.arg1;
                        if (CloudClientActivity.this.three_noticetv != null) {
                            CloudClientActivity.this.three_noticetv.setVisibility(0);
                            if (obj <= 0) {
                                CloudClientActivity.this.three_noticetv.setVisibility(8);
                            } else {
                                String obj_str = obj < 100 ? new StringBuilder(String.valueOf(obj)).toString() : "99+";
                                CloudClientActivity.this.three_noticetv.setText(obj_str);
                            }
                        }
                        try {
                            CloudClientActivity.this.showNoticeDetails();
                            return;
                        } catch (Exception e) {
                            return;
                        }
                    default:
                        return;
                }
            }
        };
        this.noticeRunnable = new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.12
            @Override // java.lang.Runnable
            public void run() {
                while (CloudClientActivity.this.isnotice) {
                    SharedPreferences sp = CloudClientActivity.this.getSharedPreferences("notice", 0);
                    long start = sp.getLong("lasttime", 0L);
                    long now = System.currentTimeMillis();
                    if (start == 0 || Math.abs(now - start) >= 600000) {
                        sp.edit().putLong("lasttime", now).commit();
                        CloudClientActivity.this.getMyWorkNotification();
                    }
                    try {
                        Thread.sleep(300000L);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        };
    }

    @Override // android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.agreement_sp = getSharedPreferences("myAgreement", 0);
        boolean hasLicensed = this.agreement_sp.getBoolean("agreement_key", true);
        // if (!hasLicensed) {
        // }
        try {
            cleanApplicationData(this);
            getLanguage();
            setMainView();
            openScreenShot();
            //openLockScreen();
            Log.e(TAG, BROADCASTER_LOCKSCREEN);
            try {
                setDefaultSetting();
            } catch (Exception e) {
            }
            initWidget();
            startService(new Intent(this, sysProtectService.class));
            //lockPad();
            loadUserInfo();
            new HostPwd().start();
            showPackageMain();
            resetAutoSp();
            initBroadReceiver();
            //removeIllegalApks();
            setDesignView();
        } catch (NullPointerException e2) {
        } catch (Exception e3) {
        }
    }

    private void openScreenShot() {
        PackageInfo packageInfo2;
        try {
            SharedPreferences sp = getSharedPreferences("screenshot", 0);
            boolean boo = sp.getBoolean("opened", false);
            Log.e(TAG, "open screenshot:" + boo);
            Intent intent2 = new Intent("android.intent.action.MAIN");
            intent2.addFlags(268435456);
            ComponentName cn = new ComponentName("com.edutech.screenshot", "com.edutech.screenshot.ScreenShotActivity");
            intent2.setComponent(cn);
            try {
                packageInfo2 = getPackageManager().getPackageInfo("com.edutech.screenshot", 0);
            } catch (PackageManager.NameNotFoundException e) {
                packageInfo2 = null;
                e.printStackTrace();
            }
            if (packageInfo2 != null) {
                startActivity(intent2);
            }
            Log.e(TAG, "open screenshot.....");
            sp.edit().putBoolean("opened", true).commit();
        } catch (Exception e2) {
        }
    }

    private void openLockScreen() {
        PackageInfo packageInfo2;
        try {
            SharedPreferences sp = getSharedPreferences("screenshot", 0);
            sp.getBoolean("locked", false);
            Intent intent2 = new Intent("android.intent.action.MAIN");
            intent2.addFlags(268435456);
            ComponentName cn = new ComponentName("com.edutech.lockscreen", "com.edutech.lockscreen.MainActivity");
            intent2.setComponent(cn);
            try {
                packageInfo2 = getPackageManager().getPackageInfo("com.edutech.lockscreen", 0);
            } catch (PackageManager.NameNotFoundException e) {
                packageInfo2 = null;
                e.printStackTrace();
            }
            if (packageInfo2 != null) {
                startActivity(intent2);
            }
            sp.edit().putBoolean("locked", true).commit();
        } catch (Exception e2) {
        }
    }

    private void initWidget() {
        this.tv_line = (TextView) findViewById(R.id.tv_line);
        this.tv_main_eryproc = (Switch) findViewById(R.id.tv_main_eryproc);
        this.tv_stuname = (TextView) findViewById(R.id.tv_main_stuname);
        this.sdyb_time = (TextView) findViewById(R.id.sdyb_timedetails);
        this.sdyb_time = (TextView) findViewById(R.id.sdyb_timedetails);
        this.tv_updatemsg = (TextView) findViewById(R.id.tv_updatemsg);
        this.showTime = true;
        if (this.tv_stuname != null) {
            if (AppEnvironment.isMAINNEW || AppEnvironment.isDEMO) {
                this.tv_stuname.setText("");
            } else {
                this.tv_stuname.setText("学生: ");
            }
        }
        if (AppEnvironment.isSNZT) {
            initSuiningView();
        } else {
            initView();
        }
        if (AppEnvironment.isSDYB) {
            this.sdyb_btn1 = (ImageButton) findViewById(R.id.sdyb_btn1);
            this.sdyb_btn2 = (ImageButton) findViewById(R.id.sdyb_btn2);
            this.sdyb_btn3 = (ImageButton) findViewById(R.id.sdyb_btn3);
            this.sdyb_btn4 = (ImageButton) findViewById(R.id.sdyb_btn4);
            this.sdyb_btn5 = (ImageButton) findViewById(R.id.sdyb_btn5);
            this.sdyb_myapp = (TextView) findViewById(R.id.sdyb_myapp);
            this.sdyb_btn1.setOnClickListener(this);
            this.sdyb_btn2.setOnClickListener(this);
            this.sdyb_btn3.setOnClickListener(this);
            this.sdyb_btn4.setOnClickListener(this);
            this.sdyb_btn5.setOnClickListener(this);
            this.sdyb_myapp.setOnClickListener(this);
        }
        initVariable();
        if (AppEnvironment.isSNZT) {
            initSuiningListener();
        } else {
            initListener();
        }
        if (AppEnvironment.isMAINNEW || AppEnvironment.isDEMO) {
            initNewLayout();
        }
        this.three_noticetv = (TextView) findViewById(R.id.three_noticetv);
        this.three_noticetv.setVisibility(8);
        if (AppEnvironment.isSNZT) {
            assignmentSuining();
        } else {
            assignment();
        }
        SharedPreferences sp = getSharedPreferences("eyeproc", 0);
        boolean boo = sp.getBoolean("state", false);
        if (this.tv_main_eryproc != null) {
            this.tv_main_eryproc.setChecked(boo);
            broadEyeProc(this, boo);
        }
        this.tv_main_eryproc.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.13
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                SharedPreferences sp2 = CloudClientActivity.this.getSharedPreferences("eyeproc", 0);
                CloudClientActivity.this.broadEyeProc(CloudClientActivity.this, isChecked);
                sp2.edit().putBoolean("state", isChecked).commit();
            }
        });
        try {
            if (Build.DISPLAY.contains("M1016Pro") || Build.DISPLAY.contains("P990S.V") || Build.DISPLAY.contains("S1016") || Build.DISPLAY.contains("M856.V")) {
                this.tv_line.setVisibility(0);
                this.tv_main_eryproc.setVisibility(0);
            } /*else {
                this.tv_line.setVisibility(4);
                this.tv_main_eryproc.setVisibility(4);
                this.tv_main_eryproc.setWidth(1);
                this.tv_main_eryproc.setHeight(1);
            }
            */
        } catch (Exception e) {
        }
    }

    private void initBroadReceiver() {
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.net.wifi.STATE_CHANGE");
        filter.addAction(sysProtectService.SERVICE_START);
        filter.addAction("edm.intent.action.license.status");
        filter.addAction("com.edutech.getadmin");
        this.wifiReceiver = new WifiReceiver();
        registerReceiver(this.wifiReceiver, filter);
        IntentFilter intentApkFilter = new IntentFilter();
        intentApkFilter.addAction("android.intent.action.PACKAGE_ADDED");
        intentApkFilter.addAction("android.intent.action.PACKAGE_REMOVED");
        intentApkFilter.addDataScheme("package");
        registerReceiver(this.apkInstallReceiver, intentApkFilter);
        if (AppEnvironment.openBMD) {
            Intent in = new Intent();
            in.setAction("com.edutech.intent.TrafficStatsService");
            in.setClassName("com.edutech.firewall", "eu.faircode.netguard.TrafficStatsService");
            in.putExtra("ip", this.send_ip);
            in.putExtra("privatekey", this.send_privatekey);
            in.putExtra("name", this.send_name);
            in.putExtra("schoolid", this.send_schoolid);
            startService(in);
        }
    }

    private void setDefaultSetting() {
        this.cn = new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity");
        this.mHwPDM = new HwDevicePolicyManager(this);
        this.mHwPDM.setCustomLauncher(this.cn, "com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity");
        if (Build.DISPLAY.contains("TB-8703N") || Build.DISPLAY.contains("TB-8604F") || Build.DISPLAY.contains("A10-70F") || Build.DISPLAY.contains("YiJiao") || Build.DISPLAY.contains("YOGATablet2-1050LC")) {
            MiaMdmPolicyManager miaMdmPolicyManager = new MiaMdmPolicyManager(getApplicationContext());
            miaMdmPolicyManager.setCustomLauncher("com.launcher.activity");
            miaMdmPolicyManager.controlBluetooth(true);
        }
        this.mDPM = (DevicePolicyManager) getSystemService("device_policy");
        this.mDeviceAdmin = new ComponentName(this, SampleAdmin.class);
        PgyCrashManager.register(this, AppEnvironment.My_APPID);
        if (AppEnvironment.isNL || AppEnvironment.isNLEZ) {
            try {
                if (!this.deletingFiles) {
                    new Thread(new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.14
                        @Override // java.lang.Runnable
                        public void run() {
                            CloudClientActivity.this.deletingFiles = true;
                            CloudClientActivity.this.deleteCameraFiles();
                        }
                    }).start();
                }
            } catch (NullPointerException e) {
            } catch (Exception e2) {
            }
        }
    }

    private void setMainView() {
        if (AppEnvironment.isSNZT) {
            setContentView(R.layout.main_suining);
        } else if (AppEnvironment.isSDYB) {
            setContentView(R.layout.main_sdyb);
        } else if (AppEnvironment.isQZEZ) {
            setContentView(R.layout.main_qzez);
        } else if (AppEnvironment.isPDSSZ) {
            setContentView(R.layout.main_pds);
        } else if (AppEnvironment.isNL) {
            setContentView(R.layout.main_nnxm);
        } else if (AppEnvironment.isNLEZ) {
            setContentView(R.layout.main_nnez);
        } else if (AppEnvironment.isDEMO) {
            setContentView(R.layout.main_demo);
        } else if (AppEnvironment.isMAINNEW) {
            setContentView(R.layout.main_news);
        } else if (AppEnvironment.isYWYT) {
            setContentView(R.layout.main_ywyt);
        } else if (AppEnvironment.isYWJD) {
            setContentView(R.layout.main_ywjd);
        } else if (AppEnvironment.isXF) {
            setContentView(R.layout.main_xf);
        } else if (AppEnvironment.isCH) {
            setContentView(R.layout.main_ch);
        } else if (AppEnvironment.isXH) {
            setContentView(R.layout.main_xh);
        } else if (AppEnvironment.isYWHZ) {
            setContentView(R.layout.main_ywhz);
        } else if (AppEnvironment.isPHNS) {
            setContentView(R.layout.main_phns);
        } else if (AppEnvironment.isCJLY) {
            setContentView(R.layout.main_cjly);
        } else {
            setContentView(R.layout.main);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getDesignView() {
        if (!this.hasGeted && !this.isGetLauncher) {
            Log.e("design", "design");
            new Thread(new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.15
                @Override // java.lang.Runnable
                public void run() {
                    CloudClientActivity.this.isGetLauncher = true;
                    try {
                        Thread.sleep(3000L);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    CloudClientActivity.this.getSpecialLauncher();
                }
            }).start();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void deleteCameraFiles() {
        String OPEN_DCIM = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM).toString();
        if (OPEN_DCIM != null && !OPEN_DCIM.equals("")) {
            File file = new File(String.valueOf(OPEN_DCIM) + "/Camera/");
            File file2 = new File(String.valueOf(OPEN_DCIM) + "/Screenshots/");
            if (file.exists() && file.isDirectory()) {
                File[] files = file.listFiles();
                for (File tempFile : files) {
                    if (tempFile.exists()) {
                        tempFile.delete();
                    }
                }
            }
            if (file2.exists() && file2.isDirectory()) {
                File[] files2 = file2.listFiles();
                for (File tempFile2 : files2) {
                    if (tempFile2.exists()) {
                        tempFile2.delete();
                    }
                }
            }
            this.deletingFiles = false;
        }
    }

    private void initNewLayout() {
        this.ll_one = (LinearLayout) findViewById(R.id.ll_one);
        this.ll_two = (LinearLayout) findViewById(R.id.ll_two);
        this.ll_three = (LinearLayout) findViewById(R.id.ll_three);
        this.ll_four = (LinearLayout) findViewById(R.id.ll_four);
        this.ll_five = (LinearLayout) findViewById(R.id.ll_five);
        this.ll_six = (LinearLayout) findViewById(R.id.ll_six);
        this.ll_seven = (LinearLayout) findViewById(R.id.ll_seven);
        this.ll_eight = (LinearLayout) findViewById(R.id.ll_eight);
        this.ll_nine = (LinearLayout) findViewById(R.id.ll_nine);
        this.ll_ten = (LinearLayout) findViewById(R.id.ll_ten);
        this.ll_eleven = (LinearLayout) findViewById(R.id.ll_eleven);
        this.ll_twelve = (LinearLayout) findViewById(R.id.ll_twelve);
        if (AppEnvironment.isDEMO) {
            this.ll_sms = (LinearLayout) findViewById(R.id.ll_sms);
            this.ll_sms.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.16
                @Override // android.view.View.OnClickListener
                public void onClick(View arg0) {
		    PackageManager pm = CloudClientActivity.this.getPackageManager();
                    Intent intent = pm.getLaunchIntentForPackage("com.hjwordgames");
                    intent.addFlags(335544320);
                    if (intent != null) {
                        CloudClientActivity.this.startActivity(intent);
                    }
                }
            });
        }
        this.ll_one.setOnClickListener(this);
        this.ll_two.setOnClickListener(this);
        this.ll_three.setOnClickListener(this);
        this.ll_four.setOnClickListener(this);
        this.ll_five.setOnClickListener(this);
        this.ll_six.setOnClickListener(this);
        this.ll_seven.setOnClickListener(this);
        this.ll_eight.setOnClickListener(this);
        this.ll_nine.setOnClickListener(this);
        this.ll_ten.setOnClickListener(this);
        this.ll_eleven.setOnClickListener(this);
        this.ll_twelve.setOnClickListener(this);
    }

    private void loadUserInfo() {
        SharedPreferences sharePre = getSharedPreferences("privatekey", 0);
        HashMap<String, String> hashmap = XmlLoadHelper.loadXml();
        if (hashmap != null) {
            this.send_ip = hashmap.get("ip");
            this.send_name = hashmap.get("username");
            this.send_usercode = hashmap.get("usercode");
            this.send_privatekey = hashmap.get("privatekey");
            this.send_pwd = hashmap.get("pwd");
            this.send_schoolid = hashmap.get("schoolid");
            String userid = hashmap.get("stuid");
            sharePre.edit().putString("key", this.send_privatekey).commit();
            sharePre.edit().putString("apihost", this.send_ip).commit();
            sharePre.edit().putString("name", this.send_usercode).commit();
            sharePre.edit().putString("pwd", this.send_pwd).commit();
            sharePre.edit().putString("userid", userid).commit();
            sharePre.edit().putString("schoolid", this.send_schoolid).commit();
        }
    }

    public void apkUpdate() {
        if (!this.hasUpdated && !this.isGetApks) {
            if (this.updateThread == null) {
                if (this.tv_updatemsg != null) {
                    this.tv_updatemsg.setVisibility(0);
                }
                this.updateThread = new UpdateThread();
                this.updateThread.start();
                return;
            }
            this.updateThread = null;
        }
    }

    /* loaded from: classes.dex */
    class UpdateThread extends Thread {
        UpdateThread() {
        }

        /* JADX WARN: Code restructure failed: missing block: B:67:0x049b, code lost:
            r40 = 1;
         */
        /* JADX WARN: Code restructure failed: missing block: B:68:0x049f, code lost:
            r40 = java.lang.Long.parseLong(r22.get("versioncode"));
         */
        /* JADX WARN: Code restructure failed: missing block: B:76:0x04d2, code lost:
            r8 = move-exception;
         */
        /* JADX WARN: Code restructure failed: missing block: B:77:0x04d3, code lost:
            r8.printStackTrace();
         */
        /* JADX WARN: Removed duplicated region for block: B:58:0x03e2 A[Catch: Exception -> 0x04d7, TryCatch #2 {Exception -> 0x04d7, blocks: (B:25:0x0168, B:28:0x01d6, B:30:0x01ee, B:32:0x01f4, B:33:0x0208, B:35:0x0210, B:37:0x026f, B:39:0x0282, B:50:0x0388, B:54:0x03d6, B:55:0x03da, B:58:0x03e2, B:61:0x03f1, B:62:0x046f, B:63:0x0473, B:65:0x0486, B:69:0x04b0, B:71:0x04bd, B:77:0x04d3, B:68:0x049f), top: B:85:0x0168, inners: #4, #5 }] */
        /* JADX WARN: Removed duplicated region for block: B:95:0x046f A[SYNTHETIC] */
        @Override // java.lang.Thread, java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public void run() {
            int i;
            long vercodeLong;
            boolean isInstall;
            HashMap<String, String> localTempApp;
            long tempcode;
            CloudClientActivity.this.isGetApks = true;
            try {
                Thread.sleep(4000L);
            } catch (InterruptedException e1) {
                e1.printStackTrace();
            }
            if (CloudClientActivity.this.addApksList != null) {
                CloudClientActivity.this.addApksList.clear();
            } else {
                CloudClientActivity.this.addApksList = new ArrayList();
            }
            CloudClientActivity.this.launcherPath = "";
            SharedPreferences sharePre = CloudClientActivity.this.getSharedPreferences("privatekey", 0);
            String privatekey = sharePre.getString("key", "");
            String ip = sharePre.getString("apihost", "");
            String username = sharePre.getString("name", "");
            if (ip == null || ip.equals("") || username == null || username.equals("") || privatekey == null || privatekey.equals("")) {
                HashMap<String, String> hashmap = XmlLoadHelper.loadXml();
                if (hashmap != null) {
                    ip = hashmap.get("ip");
                    username = hashmap.get("usercode");
                    privatekey = hashmap.get("privatekey");
                } else {
                    return;
                }
            }
            String url = "http://" + ip + "/api/app/projectcode/ebag/os/android/";
            HttpPost post = new HttpPost(url);
            post.addHeader("X-Edutech-Entity", username);
            long imestamp = System.currentTimeMillis();
            String sign = My_md5.Md5(String.valueOf(imestamp) + username + privatekey);
            post.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
            DefaultHttpClient client = new DefaultHttpClient();
            List<String> resultList = new ArrayList<>();
            boolean launchereNeedUpdate = false;
            try {
                HttpResponse response = client.execute(post);
                String result = CloudClientActivity.this.getJsonStringFromGZIP(response);
                JSONObject jobj = new JSONObject(result);
                boolean status = jobj.getBoolean("status");
                int errorNum = jobj.getInt("errorNum");
                CloudClientActivity.this.apkUpdateList = new ArrayList();
                CloudClientActivity.this.apkUpdatePkgList = new ArrayList();
                CloudClientActivity.this.currentCacheLength = 0L;
                CloudClientActivity.this.currentCachePosition = 0L;
                new ApkUpdateBean();
                if (status || errorNum == 0) {
                    CloudClientActivity.this.hasGeted = true;
                    JSONArray data = jobj.getJSONArray("data");
                    if (data != null && data.length() > 0) {
                        ArrayList<HashMap<String, String>> localAppInfoList = new ArrayList<>();
                        ArrayList<HashMap<String, String>> localAppInfoList2 = SystemInfoHelper.getSystemInfo(localAppInfoList, CloudClientActivity.this);
                        for (i = 0; i < data.length(); i++) {
                            JSONObject json = data.getJSONObject(i);
                            json.getString("appwebpath");
                            long size = json.getLong("appsize");
                            json.getString("apkname");
                            String version = json.getString("versionname");
                            String packagename = json.getString("packagename");
                            String versionCode = json.getString("versioncode");
                            vercodeLong = 1;
                            try {
                                vercodeLong = Long.parseLong(versionCode);
                            } catch (NumberFormatException e) {
                            } catch (Exception e2) {
                            }
                            isInstall = false;
                            Iterator<HashMap<String, String>> it = localAppInfoList2.iterator();
                            while (true) {
                                if (!it.hasNext()) {
                                    break;
                                }
                                localTempApp = it.next();
                                if (localTempApp.get("packagename") != null && packagename.equals(localTempApp.get("packagename"))) {
                                    break;
                                }
                                isInstall = false;
                            }
                            if (!isInstall) {
                                if (packagename.equals("com.launcher.activity")) {
                                    launchereNeedUpdate = true;
                                }
                                CloudClientActivity.this.currentCacheLength += size;
                                ApkUpdateBean apkUpdateBean = new ApkUpdateBean();
                                apkUpdateBean.setPackagename(packagename);
                                apkUpdateBean.setApkDownloadSize(0L);
                                apkUpdateBean.setApkSize(size);
                                apkUpdateBean.setInstallState(-1);
                                apkUpdateBean.setApkLocalPath("");
                                apkUpdateBean.setApkUrl(json.getString("appwebpath"));
                                apkUpdateBean.setAppName(json.getString("apkname"));
                                apkUpdateBean.setVersioncode(versionCode);
                                apkUpdateBean.setVersionname(version);
                                CloudClientActivity.this.apkUpdateList.add(apkUpdateBean);
                                CloudClientActivity.this.apkUpdatePkgList.add(packagename);
                            }
                        }
                        Message msg = new Message();
                        msg.what = CloudClientActivity.START_PROGRESS;
                        CloudClientActivity.this.installHandler.sendMessage(msg);
                        Utils.saveUpdateApks(CloudClientActivity.this.apkUpdateList, CloudClientActivity.this, ip);
                        List<String> resultList2 = CloudClientActivity.this.parseDownload(resultList, CloudClientActivity.this.apkUpdateList);
                        if (CloudClientActivity.this.launcherPath != null && !CloudClientActivity.this.launcherPath.equals("")) {
                            resultList2.add(CloudClientActivity.this.launcherPath);
                            CloudClientActivity.this.addApksList.add("com.launcher.activity");
                        }
                    }
                }
            } catch (Exception e3) {
                e3.printStackTrace();
            }
            if (CloudClientActivity.this.addApksList != null && CloudClientActivity.this.addApksList.size() > 0) {
                Intent intent = new Intent();
                intent.setAction(sysProtectService.ADDINSTALL);
                intent.putStringArrayListExtra("packages", CloudClientActivity.this.addApksList);
                CloudClientActivity.this.sendBroadcast(intent);
            }
            if (launchereNeedUpdate && !TextUtils.isEmpty(CloudClientActivity.this.launcherPath)) {
                Message msg1 = new Message();
                msg1.what = 4;
                CloudClientActivity.this.installHandler.sendMessage(msg1);
                CloudClientActivity.this.sendInstallMessage(-1, CloudClientActivity.this.launcherPath, CloudClientActivity.UPDATE_INSTALLSINGLE);
            }
            Message msg3 = new Message();
            msg3.what = 3;
            CloudClientActivity.this.installHandler.sendMessage(msg3);
            SharedPreferences sp = CloudClientActivity.this.getSharedPreferences("resumeconfig", 0);
            sp.edit().putLong("updateapks", System.currentTimeMillis()).commit();
            CloudClientActivity.this.isGetApks = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void installSingleApk(String path) {
        
    }

    /* JADX INFO: Access modifiers changed from: private */
    public List<String> parseDownload(List<String> resultList, List<ApkUpdateBean> apks) {
        int length;
        for (int i = 0; i < apks.size(); i++) {
            ApkUpdateBean bean = apks.get(i);
            String packagename = bean.getPackagename();
            String apkUrl = bean.getApkUrl();
            String name = bean.getAppName();
            long size = bean.getApkSize();
            File dir = new File(AppEnvironment.ASSETS_APKS);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            if (dir.isDirectory()) {
                File file = new File(String.valueOf(AppEnvironment.ASSETS_DIR) + name);
                if (file.exists()) {
                    file.delete();
                }
                byte[] bys = new byte[10240];
                long getsize = 0;
                HttpURLConnection urlConnection = null;
                try {
                    URL url2 = new URL(apkUrl);
                    urlConnection = (HttpURLConnection) url2.openConnection();
                    urlConnection.connect();
                    InputStream in = urlConnection.getInputStream();
                    FileOutputStream out = new FileOutputStream(file);
                    int num = 0;
                    while (getsize < size && (length = in.read(bys)) != -1) {
                        getsize += length;
                        this.currentCachePosition += length;
                        out.write(bys, 0, length);
                        num++;
                        if (num % 10 == 0) {
                            sendInstallMessage(i, Long.valueOf(getsize), UPDATE_PROGRESS);
                        }
                    }
                    sendInstallMessage(i, Long.valueOf(getsize), UPDATE_PROGRESS);
                    out.close();
                    in.close();
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                } catch (IOException e2) {
                    e2.printStackTrace();
                } catch (Exception e3) {
                }
                if (urlConnection != null) {
                    urlConnection.disconnect();
                }
                if (getsize == size) {
                    if (!packagename.equals("com.launcher.activity")) {
                        resultList.add(String.valueOf(AppEnvironment.ASSETS_DIR) + name);
                        sendInstallMessage(-1, String.valueOf(AppEnvironment.ASSETS_DIR) + name, UPDATE_INSTALLSINGLE);
                        sendInstallMessage(i, 0, UPDATE_INSTALLSTATE);
                        this.addApksList.add(packagename);
                    } else {
                        try {
                            ApkUpdateBean apkBean = this.apkUpdateList.get(i);
                            apkBean.setApkLocalPath(String.valueOf(AppEnvironment.ASSETS_DIR) + name);
                            this.apkUpdateList.set(i, apkBean);
                        } catch (Exception e4) {
                        }
                        if (apks.size() == 1) {
                            sendInstallMessage(-1, String.valueOf(AppEnvironment.ASSETS_DIR) + name, UPDATE_INSTALLSINGLE);
                            sendInstallMessage(i, 0, UPDATE_INSTALLSTATE);
                        }
                        this.launcherPath = String.valueOf(AppEnvironment.ASSETS_DIR) + name;
                    }
                } else {
                    sendInstallMessage(i, -2, UPDATE_INSTALLSTATE);
                }
            }
        }
        return resultList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendInstallMessage(int arg1, Object obj, int what) {

    }

    /* JADX INFO: Access modifiers changed from: private */
    public void refreshDownloadPB() {
        if (this.canRefresh && this.tv_updatemsg != null) {
            DecimalFormat df = new DecimalFormat("##0.00");
            String alllength = df.format(((this.currentCacheLength * 1.0d) / 1024.0d) / 1024.0d);
            String currentPosition = df.format(((this.currentCachePosition * 1.0d) / 1024.0d) / 1024.0d);
            String allStateString = String.valueOf(currentPosition) + "MB/" + alllength + "MB";
            this.tv_updatemsg.setText(String.valueOf(getResources().getString(R.string.updateapks)) + allStateString);
        }
    }

    private void showPackageMain() {
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.addCategory("android.intent.category.HOME");
        PackageManager manager = getPackageManager();
        manager.resolveActivity(intent, 0);
    }

    private void getLanguage() {
        int length = -1;
        File file = new File(this.LANGUAGEPATH);
        if (file.exists()) {
            byte[] by = new byte[512];
            FileInputStream in = null;
            try {
                FileInputStream in2 = new FileInputStream(file);
                in = in2;
            } catch (FileNotFoundException e1) {
                e1.printStackTrace();
            }
            if (in != null) {
                String strs = "";
                while (true) {
                    try {
                        length = in.read(by);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    if (length <= 0) {
                        break;
                    }
                    strs = String.valueOf(strs) + new String(by, 0, length);
                }
                if (strs.contains("english")) {
                    SharedPreferences sp = getSharedPreferences("language", 0);
                    LanguageUtils.SetLanguage(this, "en");
                    sp.edit().putString("language", "en").commit();
                    this.language = "en";
                    return;
                }
                SharedPreferences sp2 = getSharedPreferences("language", 0);
                LanguageUtils.SetLanguage(this, "chinese");
                sp2.edit().putString("language", "chinese").commit();
                this.language = "chinese";
            }
        }
    }

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    protected void attachBaseContext(Context newBase) {
        try {
            SharedPreferences sp = newBase.getSharedPreferences("language", 0);
            String type = sp.getString("language", "chinese");
            super.attachBaseContext(LanguageUtils.attachBaseContext(newBase, type));
        } catch (Exception e) {
        }
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        try {
            unregisterReceiver(this.batteryReceiver);
            unregisterReceiver(this.InteractionReceiver);
        } catch (Exception e) {
        }
        this.showTime = false;
        this.timeThread = null;
        this.isnotice = false;
        this.noticeThread = null;
        this.canRefresh = false;
        Log.e(TAG, "on pause:norefresh");
    }

    @Override // android.app.Activity
    protected void onStop() {
        super.onStop();
        this.showTime = false;
        this.timeThread = null;
        this.isnotice = false;
        this.noticeThread = null;
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        unregisterReceiver(this.wifiReceiver);
        unregisterReceiver(this.apkInstallReceiver);
        this.showTime = false;
        this.timeThread = null;
        this.isnotice = false;
        this.noticeThread = null;
    }

    /* loaded from: classes.dex */
    class HostPwd extends Thread {
        HostPwd() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            SharedPreferences sharePre = CloudClientActivity.this.getSharedPreferences("privatekey", 0);
            String privatekey = sharePre.getString("key", "");
            String ip = sharePre.getString("apihost", "");
            String username = sharePre.getString("name", "");
            if (ip == null || ip.equals("") || username == null || username.equals("") || privatekey == null || privatekey.equals("")) {
                HashMap<String, String> hashmap = XmlLoadHelper.loadXml();
                if (hashmap != null) {
                    ip = hashmap.get("ip");
                    username = hashmap.get("usercode");
                    privatekey = hashmap.get("privatekey");
                    if (ip != null && username != null && privatekey != null) {
                        sharePre.edit().putString("key", privatekey).commit();
                        sharePre.edit().putString("apihost", ip).commit();
                        sharePre.edit().putString("name", username).commit();
                    }
                } else {
                    return;
                }
            }
            String url = "http://" + ip + "/api/padpwd";
            HttpPost post = new HttpPost(url);
            post.addHeader("X-Edutech-Entity", username);
            long imestamp = System.currentTimeMillis();
            String sign = My_md5.Md5(String.valueOf(imestamp) + username + privatekey);
            post.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
            DefaultHttpClient client = new DefaultHttpClient();
            Log.e("hhh", url);
            try {
                HttpResponse response = client.execute(post);
                Log.e("hhh", "code:" + response.getStatusLine().getStatusCode());
                String result = CloudClientActivity.this.getJsonStringFromGZIP(response);
                JSONObject jobj = new JSONObject(result);
                String data = jobj.getString("data");
                Log.e("hhh", data);
                File file = new File(String.valueOf(AppEnvironment.PWDFILEPATH) + ip + "pwd.xml");
                if (file.exists() && data != null && !data.equals("")) {
                    file.delete();
                }
                file.createNewFile();
                FileOutputStream out = new FileOutputStream(file);
                out.write(data.getBytes());
                if (out != null) {
                    out.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getJsonStringFromGZIP(HttpResponse response) {
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
                    is = new GZIPInputStream(bis);
                } else {
                    is = bis;
                }
                InputStreamReader reader = new InputStreamReader(is, "utf-8");
                char[] data = new char[100];
                StringBuffer sb = new StringBuffer();
                while (true) {
                    int readSize = reader.read(data);
                    if (readSize > 0) {
                        sb.append(data, 0, readSize);
                    } else {
                        String jsonString = sb.toString();
                        bis.close();
                        reader.close();
                        return jsonString;
                    }
                }
            } else {
                Log.e(TAG, "与服务端连接失败。。。");
                return "";
            }
        } catch (Exception e) {
            Log.e(TAG, e.toString(), e);
            return "";
        }
    }

    private int getShort(byte[] data) {
        return (data[0] << 8) | (data[1] & BSON.MINKEY);
    }

    public static void cleanInternalCache(Context context) {
        Log.e(TAG, context.getCacheDir().getAbsolutePath());
        deleteFilesByDirectory(context.getCacheDir());
    }

    public static void cleanSharedPreference(Context context) {
        deleteFilesByDirectory(new File("/data/data/" + context.getPackageName() + "/shared_prefs"));
    }

    public static void cleanFiles(Context context) {
        deleteFilesByDirectory(context.getFilesDir());
    }

    public static void cleanExternalCache(Context context) {
        if (Environment.getExternalStorageState().equals("mounted")) {
            deleteFilesByDirectory(context.getExternalCacheDir());
        }
    }

    public static void cleanApplicationData(Context context) {
        cleanCacheFile(TEMP);
    }

    private static void deleteFilesByDirectory(File directory) {
        File[] listFiles;
        if (directory != null && directory.exists() && directory.isDirectory()) {
            File[] items = directory.listFiles();
            if (items != null) {
                for (File item : directory.listFiles()) {
                    item.delete();
                }
            }
        }
    }

    private static void cleanCacheFile(String path) {
        File[] files;
        File file = new File(path);
        if (file.isDirectory() && (files = file.listFiles()) != null) {
            for (File tep : files) {
                tep.delete();
            }
        }
    }

    private void judgePadType() {
        PackageInfo packageInfo;
        try {
            packageInfo = getPackageManager().getPackageInfo("com.android.mms", 0);
        } catch (PackageManager.NameNotFoundException e) {
            packageInfo = null;
            e.printStackTrace();
        }
        if (packageInfo == null) {
            System.out.println("非3G");
            this.is3G = false;
        } else {
            System.out.println("3G");
            this.is3G = true;
        }
        if (Build.MODEL.equals("Lenovo B8000-H")) {
            this.isLenovo = true;
            this.is3G = true;
        } else {
            this.isLenovo = false;
        }
        try {
            getPackageManager().getPackageInfo(AppEnvironment.MHZX_PACKNAME, 0);
        } catch (PackageManager.NameNotFoundException e2) {
            e2.printStackTrace();
        }
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        this.onconfigureChange = true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void lockPad() {
        SharedPreferences spf = getSharedPreferences("lockscreen", 4);
        boolean locked = spf.getBoolean("locked", false);
        long startTime = spf.getLong("lockstartTime", 0L);
        long tempStartTime = spf.getLong("tmplockedtime", 0L);
        int tempLock = spf.getInt("tmplocked", 0);
        if (locked && startTime != 0) {
            Intent intent2 = new Intent(AppEnvironment.Intent_LOCKWINDOW);
            intent2.putExtra("state", LogHelp.TYPE_MYWORK);
            sendBroadcast(intent2);
        } else if (tempLock == 1 && tempStartTime != 0) {
            Intent intent22 = new Intent(AppEnvironment.Intent_LOCKWINDOW);
            intent22.putExtra("state", LogHelp.TYPE_GUIDANCE);
            sendBroadcast(intent22);
        } else {
            Intent intent3 = new Intent(AppEnvironment.Intent_UNLOCKWINDOW);
            sendBroadcast(intent3);
        }
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        try {
            this.canRefresh = true;
            Log.e(TAG, "on resume:canrefresh");
            init_public_infor();
            Intent intent = new Intent("ENTERPASS");
            sendBroadcast(intent);
            SharedPreferences callSp = getSharedPreferences("allowcall", 4);
            callSp.edit().putBoolean("cancall", false).commit();
            lockPad();
            IntentFilter batteryFilter = new IntentFilter();
            batteryFilter.addAction("android.intent.action.BATTERY_CHANGED");
            this.batteryReceiver = new BatteryReceiver();
            registerReceiver(this.batteryReceiver, batteryFilter);
            this.mActivityManager = (ActivityManager) getSystemService("activity");
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction("PASSWDPASS");
            intentFilter.addAction("android.intent.action.mdm");
            intentFilter.addAction(this.UPDATEAPK);
            IntentFilter intentFilter2 = new IntentFilter();
            intentFilter2.addAction("android.intent.action.STATUSBAR_INVISIBILITY");
            intentFilter2.addAction("android.intent.action.STATUSBAR_VISIBILITY");
            registerReceiver(this.InteractionReceiver, intentFilter2);
            if (Build.DISPLAY.contains("T355") || Build.DISPLAY.contains("P550") || Build.DISPLAY.contains("P350") || Build.DISPLAY.contains("P583")) {
                try {
                    SharedPreferences sp = getSharedPreferences("license", 0);
                    this.LicenseOK = sp.getBoolean("licenseok", false);
                    if (!this.mDPM.isAdminActive(this.mDeviceAdmin)) {
                        Intent intent_dpm = new Intent(this, AddAdminActivity.class);
                        startActivity(intent_dpm);
                    }
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
                SamSungInCharge();
            }
            this.showTime = true;
            this.timeThread = null;
            this.timeThread = new Thread(this.timeRunnable);
            this.timeThread.start();
            showFailedApkInfo();
        } catch (NullPointerException e3) {
        } catch (Exception e4) {
        }
        try {
            uploadLogs();
        } catch (Exception e5) {
        }
        try {
            if (!AppEnvironment.isSDYB) {
                this.noticeThread = null;
                this.isnotice = true;
                this.noticeThread = new Thread(this.noticeRunnable);
                this.noticeThread.start();
            }
        } catch (NullPointerException e6) {
        } catch (Exception e7) {
        }
        try {
            autoUpdateApks();
            autoUpdateDesigns();
        } catch (Exception e8) {
        }
        try {
            DensityUtil.isMyLauncherDefault(this);
        } catch (Exception e9) {
        }
    }

    private void resetAutoSp() {
        SharedPreferences sp = getSharedPreferences("resumeconfig", 0);
        sp.edit().putLong("updateapks", 0L).commit();
        sp.edit().putLong("updatedesign", 0L).commit();
        SharedPreferences callSp = getSharedPreferences("noticemessage", 0);
        callSp.edit().putLong("noticetime", 0L).commit();
    }

    private void autoUpdateApks() {
        long time = System.currentTimeMillis();
        SharedPreferences sp = getSharedPreferences("resumeconfig", 0);
        long pretime = sp.getLong("updateapks", 0L);
        if (time - pretime > 86400000 || pretime == 0) {
            this.hasUpdated = false;
            apkUpdate();
        } else if (time - pretime > 3600000) {
            SharedPreferences sharePre = getSharedPreferences("privatekey", 0);
            String ip = sharePre.getString("apihost", "");
            List<String> failedApks = Utils.getFailedEbagUpdated(this, ip);
            if (failedApks != null && failedApks.size() > 0) {
                this.hasUpdated = false;
                apkUpdate();
            }
        }
    }

    private void autoUpdateDesigns() {
        long time = System.currentTimeMillis();
        SharedPreferences sp = getSharedPreferences("resumeconfig", 0);
        long pretime = sp.getLong("updatedesign", 0L);
        if (time - pretime > 86400000 || pretime == 0) {
            this.hasGeted = false;
            getDesignView();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setDesignView() {
        try {
            if (!this.isGetLauncher) {
                new ArrayList();
                ArrayList<AppBean> apps = XmlLoadHelper.loadXml2();
                enableButtons(apps);
                changeIcons(apps);
            }
        } catch (Exception e) {
        }
    }

    private void uploadLogs() {
        final File file = new File(AppEnvironment.LOG_PATH);
        if (file.exists()) {
            long lastModified = file.lastModified();
            long currentMill = System.currentTimeMillis();
            if (Math.abs(currentMill - lastModified) > 3600000 && this.send_ip != null && !this.send_ip.equals("")) {
                new Thread(new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.17
                    @Override // java.lang.Runnable
                    public void run() {
                        String url = "http://" + CloudClientActivity.this.send_ip + "/api/padlog/";
                        String json = "";
                        try {
                            json = FileUtils.readFileToString(file, "UTF-8");
                        } catch (IOException e1) {
                            e1.printStackTrace();
                        }
                        if (url != null && json != null && !"".equals(url) && !"".equals(json)) {
                            HttpPost httpRequest = CloudClientActivity.httpPostInit(url, CloudClientActivity.this.send_privatekey, CloudClientActivity.this.send_name);
                            List<NameValuePair> params = new ArrayList<>();
                            params.add(new BasicNameValuePair("data", json));
                            try {
                                try {
                                    httpRequest.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
                                    HttpResponse httpResponse = new DefaultHttpClient().execute(httpRequest);
                                    if (httpResponse.getStatusLine().getStatusCode() == 200) {
                                        try {
                                            String strResult = EntityUtils.toString(httpResponse.getEntity());
                                            JSONObject jsonObject = new JSONObject(strResult);
                                            if (jsonObject.getBoolean("status")) {
                                                file.delete();
                                            }
                                        } catch (NullPointerException e) {
                                        } catch (JSONException e2) {
                                            e2.printStackTrace();
                                        } catch (Exception e3) {
                                        }
                                    } else {
                                        System.out.println("Error Response: " + httpResponse.getStatusLine().toString());
                                    }
                                } catch (ClientProtocolException e4) {
                                    e4.printStackTrace();
                                }
                            } catch (Exception e5) {
                                e5.printStackTrace();
                            }
                        }
                    }
                }).start();
            }
        }
    }

    public static HttpPost httpPostInit(String url, String privatekey, String username) {
        HttpPost post = new HttpPost(url);
        post.addHeader("X-Edutech-Entity", String.valueOf(username) + "+" + privatekey);
        long imestamp = System.currentTimeMillis();
        String sign = My_md5.Md5(String.valueOf(imestamp) + username + privatekey);
        post.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
        return post;
    }

    private void enableButtons(ArrayList<AppBean> apps) {
        if (apps != null && apps.size() > 0) {
            AppEnvironment.ONE_IMG = false;
            AppEnvironment.TWO_IMG = false;
            AppEnvironment.THREE_IMG = false;
            AppEnvironment.FOUR_IMG = false;
            AppEnvironment.FIVE_IMG = false;
            AppEnvironment.SIX_IMG = false;
            AppEnvironment.SEVEN_IMG = false;
            AppEnvironment.EIGHT_IMG = false;
            AppEnvironment.NINE_IMG = false;
            AppEnvironment.TEN_IMG = false;
            AppEnvironment.ELEVEN_IMG = false;
            AppEnvironment.TWELVE_IMG = false;
            for (int i = 0; i < apps.size(); i++) {
                AppBean app = apps.get(i);
                String code = app.getCode();
                int enable = app.getEnable();
                judgeApp(code, enable);
            }
        }
    }

    private void judgeIcon(AppBean app) {
        String code = app.getCode();
        if (code.equals("daoxueben")) {
            if (!TextUtils.isEmpty(app.getName())) {
                this.textViews[0].setText(app.getName());
            }
            this.textViews[0].setTextColor(Color.parseColor(app.getColor()));
            Bitmap b = BitmapFactory.decodeFile(app.getIconLocal());
            if (b != null) {
                this.imageViews[0].setImageBitmap(b);
            }
        } else if (code.equals("zuoyefudao")) {
            if (!TextUtils.isEmpty(app.getName())) {
                this.textViews[1].setText(app.getName());
            }
            this.textViews[1].setTextColor(Color.parseColor(app.getColor()));
            Bitmap b2 = BitmapFactory.decodeFile(app.getIconLocal());
            if (b2 != null) {
                this.imageViews[1].setImageBitmap(b2);
            }
        } else if (code.equals("myhomework")) {
            if (!TextUtils.isEmpty(app.getName())) {
                this.textViews[2].setText(app.getName());
            }
            this.textViews[2].setTextColor(Color.parseColor(app.getColor()));
            Bitmap b3 = BitmapFactory.decodeFile(app.getIconLocal());
            if (b3 != null) {
                this.imageViews[2].setImageBitmap(b3);
            }
        } else if (code.equals("cuotiji")) {
            if (!TextUtils.isEmpty(app.getName())) {
                this.textViews[3].setText(app.getName());
            }
            this.textViews[3].setTextColor(Color.parseColor(app.getColor()));
            Bitmap b4 = BitmapFactory.decodeFile(app.getIconLocal());
            if (b4 != null) {
                this.imageViews[3].setImageBitmap(b4);
            }
        } else if (code.equals("afd_mybook")) {
            if (!TextUtils.isEmpty(app.getName())) {
                this.textViews[4].setText(app.getName());
            }
            this.textViews[4].setTextColor(Color.parseColor(app.getColor()));
            Bitmap b5 = BitmapFactory.decodeFile(app.getIconLocal());
            if (b5 != null) {
                this.imageViews[4].setImageBitmap(b5);
            }
        } else if (code.equals("my_app")) {
            if (!TextUtils.isEmpty(app.getName())) {
                this.textViews[5].setText(app.getName());
            }
            this.textViews[5].setTextColor(Color.parseColor(app.getColor()));
            Bitmap b6 = BitmapFactory.decodeFile(app.getIconLocal());
            if (b6 != null) {
                this.imageViews[5].setImageBitmap(b6);
            }
        } else if (code.equals("my_camera")) {
            if (!TextUtils.isEmpty(app.getName())) {
                this.textViews[6].setText(app.getName());
            }
            this.textViews[6].setTextColor(Color.parseColor(app.getColor()));
            Bitmap b7 = BitmapFactory.decodeFile(app.getIconLocal());
            if (b7 != null) {
                this.imageViews[6].setImageBitmap(b7);
            }
        } else if (code.equals("myfiles")) {
            if (!TextUtils.isEmpty(app.getName())) {
                this.textViews[7].setText(app.getName());
            }
            this.textViews[7].setTextColor(Color.parseColor(app.getColor()));
            Bitmap b8 = BitmapFactory.decodeFile(app.getIconLocal());
            if (b8 != null) {
                this.imageViews[7].setImageBitmap(b8);
            }
        } else if (code.equals("home_school")) {
            if (!TextUtils.isEmpty(app.getName())) {
                this.textViews[8].setText(app.getName());
            }
            this.textViews[8].setTextColor(Color.parseColor(app.getColor()));
            Bitmap b9 = BitmapFactory.decodeFile(app.getIconLocal());
            if (b9 != null) {
                this.imageViews[8].setImageBitmap(b9);
            }
        } else if (code.equals("hudongtaolun")) {
            if (!TextUtils.isEmpty(app.getName())) {
                this.textViews[9].setText(app.getName());
            }
            this.textViews[9].setTextColor(Color.parseColor(app.getColor()));
            Bitmap b10 = BitmapFactory.decodeFile(app.getIconLocal());
            if (b10 != null) {
                this.imageViews[9].setImageBitmap(b10);
            }
        } else if (code.equals("study_store")) {
            if (!TextUtils.isEmpty(app.getName())) {
                this.textViews[10].setText(app.getName());
            }
            this.textViews[10].setTextColor(Color.parseColor(app.getColor()));
            Bitmap b11 = BitmapFactory.decodeFile(app.getIconLocal());
            if (b11 != null) {
                this.imageViews[10].setImageBitmap(b11);
            }
        } else if (code.equals("happ_class")) {
            if (!TextUtils.isEmpty(app.getName())) {
                this.textViews[11].setText(app.getName());
            }
            this.textViews[11].setTextColor(Color.parseColor(app.getColor()));
            Bitmap b12 = BitmapFactory.decodeFile(app.getIconLocal());
            if (b12 != null) {
                this.imageViews[11].setImageBitmap(b12);
            }
        }
    }

    private void judgeApp(String code, int enable) {
        if (code.equals("daoxueben")) {
            if (enable == 1) {
                AppEnvironment.ONE_IMG = true;
            } else {
                AppEnvironment.ONE_IMG = false;
            }
        } else if (code.equals("zuoyefudao")) {
            if (enable == 1) {
                AppEnvironment.TWO_IMG = true;
            } else {
                AppEnvironment.TWO_IMG = false;
            }
        } else if (code.equals("myhomework")) {
            if (enable == 1) {
                AppEnvironment.THREE_IMG = true;
            } else {
                AppEnvironment.THREE_IMG = false;
            }
        } else if (code.equals("cuotiji")) {
            if (enable == 1) {
                AppEnvironment.FOUR_IMG = true;
            } else {
                AppEnvironment.FOUR_IMG = false;
            }
        } else if (code.equals("afd_mybook")) {
            if (enable == 1) {
                AppEnvironment.FIVE_IMG = true;
            } else {
                AppEnvironment.FIVE_IMG = false;
            }
        } else if (code.equals("my_app")) {
            if (enable == 1) {
                AppEnvironment.SIX_IMG = true;
            } else {
                AppEnvironment.SIX_IMG = false;
            }
        } else if (code.equals("my_camera")) {
            if (enable == 1) {
                AppEnvironment.SEVEN_IMG = true;
            } else {
                AppEnvironment.SEVEN_IMG = false;
            }
        } else if (code.equals("myfiles")) {
            if (enable == 1) {
                AppEnvironment.EIGHT_IMG = true;
            } else {
                AppEnvironment.EIGHT_IMG = false;
            }
        } else if (code.equals("home_school")) {
            if (enable == 1) {
                AppEnvironment.NINE_IMG = true;
            } else {
                AppEnvironment.NINE_IMG = false;
            }
        } else if (code.equals("hudongtaolun")) {
            if (enable == 1) {
                AppEnvironment.TEN_IMG = true;
            } else {
                AppEnvironment.TEN_IMG = false;
            }
        } else if (code.equals("study_store")) {
            if (enable == 1) {
                AppEnvironment.ELEVEN_IMG = true;
            } else {
                AppEnvironment.ELEVEN_IMG = false;
            }
        } else if (code.equals("happ_class")) {
            if (enable == 1) {
                AppEnvironment.TWELVE_IMG = true;
            } else {
                AppEnvironment.TWELVE_IMG = false;
            }
        }
    }

    private void changeIcons(ArrayList<AppBean> apps) {
        if (apps != null) {
            try {
                if (apps.size() > 0) {
                    getDataFromLocal(AppEnvironment.icon, apps);
                }
            } catch (Exception e) {
                SharedPreferences sharePre = getSharedPreferences("privatekey", 0);
                sharePre.edit().putString("updatetime", "0").commit();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getSpecialLauncher() {
        this.isGetLauncher = true;
        SharedPreferences sharePre = getSharedPreferences("privatekey", 0);
        String ip = sharePre.getString("apihost", "");
        String username = sharePre.getString("name", "");
        if (ip == null || ip.equals("") || username == null || username.equals("")) {
            HashMap<String, String> hashmap = XmlLoadHelper.loadXml();
            if (hashmap != null) {
                ip = hashmap.get("ip");
                username = hashmap.get("usercode");
            } else {
                return;
            }
        }
        String url = "http://" + ip + "/api/config/";
        if (username == null || username.equals("")) {
            this.isGetLauncher = false;
            return;
        }
        String json = HttpUtils.getConfigData(url, username);
        this.isGetLauncher = false;
        SharedPreferences sp = getSharedPreferences("resumeconfig", 0);
        sp.edit().putLong("updatedesign", System.currentTimeMillis()).commit();
        if (json == null || !json.equals("")) {
            int result = XmlUtils.saveLauncher(json, this);
            if (result == 1) {
                this.hasGeted = true;
            }
            SharedPreferences spLauncher = getSharedPreferences("splauncher", 0);
            spLauncher.edit().putLong("refreshtime", System.currentTimeMillis()).commit();
            runOnUiThread(new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.18
                @Override // java.lang.Runnable
                public void run() {
                    CloudClientActivity.this.setDesignView();
                }
            });
        }
    }

    @SuppressLint({"NewApi"})
    private void getDataFromLocal(String path, ArrayList<AppBean> apps) {
        for (int i = 0; i < apps.size(); i++) {
            try {
                String code = apps.get(i).getCode();
                if ("wifi".equals(code) || "large".equals(code) || SQLExec.DelimiterType.NORMAL.equals(code) || "small".equals(code)) {
                    String iconpath = String.valueOf(AppEnvironment.icon) + apps.get(i).getIcon().substring(apps.get(i).getIcon().lastIndexOf("/") + 1);
                    if (iconpath != null && "large".equals(code)) {
                        File file = new File(iconpath);
                        if (file.exists()) {
                            Drawable background = new BitmapDrawable(BitmapFactory.decodeFile(String.valueOf(AppEnvironment.icon) + apps.get(i).getIcon().substring(apps.get(i).getIcon().lastIndexOf("/") + 1)));
                            this.mainbackground.setBackground(background);
                        } else {
                            SharedPreferences sharePre = getSharedPreferences("privatekey", 0);
                            sharePre.edit().putString("updatetime", "0").commit();
                        }
                    }
                } else {
                    judgeIcon(apps.get(i));
                }
            } catch (Exception e) {
                e.printStackTrace();
                Log.i("liu", "Exception:" + e);
                SharedPreferences sharePre2 = getSharedPreferences("privatekey", 0);
                sharePre2.edit().putString("updatetime", "0").commit();
                return;
            }
        }
    }

    public void SamSungInCharge() {
        
    }

    public boolean isWifiConn() {
        WifiManager wifiManager = (WifiManager) getSystemService("wifi");
        if (wifiManager == null) {
            return false;
        }
        int wifiState = wifiManager.getWifiState();
        return wifiState != 1;
    }

    private void startWifiActivity() {
        PackageInfo packageInfo;
        PackageInfo packageInfo2;
        if (Build.DISPLAY.contains("YOGATablet2-1050LC") && Build.DISPLAY.contains("YiJiao")) {
            String pkgWifi = AppEnvironment.WIFI_PACKNAME;
            String clsWifi = "zte.com.wilink.wifi.WifiSettingActivity";
            try {
                packageInfo2 = getPackageManager().getPackageInfo(pkgWifi, 0);
            } catch (PackageManager.NameNotFoundException e) {
                packageInfo2 = null;
                pkgWifi = "com.edutech.wificonn";
                clsWifi = "com.edutech.wificonn.WifiConnActivity";
                e.printStackTrace();
            }
            try {
                packageInfo2 = getPackageManager().getPackageInfo(pkgWifi, 0);
            } catch (PackageManager.NameNotFoundException e2) {
                packageInfo2 = null;
                e2.printStackTrace();
            } catch (Exception e3) {
            }
            if (packageInfo2 != null) {
                Log.i("qwe", "packageInfo != null");
                ComponentName componet = new ComponentName(pkgWifi, clsWifi);
                Intent intent = new Intent();
                intent.setComponent(componet);
                intent.addFlags(268435456);
                intent.setAction("android.intent.action.MAIN");
                intent.addCategory("android.intent.category.LAUNCHER");
                startActivity(intent, pkgWifi);
                return;
            }
            return;
        }
        String pkgWifi2 = "com.edutech.wificonn";
        String clsWifi2 = "com.edutech.wificonn.WifiConnActivity";
        try {
            packageInfo = getPackageManager().getPackageInfo(pkgWifi2, 0);
        } catch (PackageManager.NameNotFoundException e4) {
            packageInfo = null;
            pkgWifi2 = AppEnvironment.WIFI_PACKNAME;
            clsWifi2 = "zte.com.wilink.wifi.WifiSettingActivity";
            e4.printStackTrace();
        }
        try {
            packageInfo = getPackageManager().getPackageInfo(pkgWifi2, 0);
        } catch (PackageManager.NameNotFoundException e5) {
            packageInfo = null;
            e5.printStackTrace();
        } catch (Exception e6) {
        }
        if (packageInfo != null) {
            ComponentName componet2 = new ComponentName(pkgWifi2, clsWifi2);
            Intent intent2 = new Intent();
            intent2.setComponent(componet2);
            intent2.addFlags(268435456);
            intent2.setAction("android.intent.action.MAIN");
            intent2.addCategory("android.intent.category.LAUNCHER");
            startActivity(intent2, pkgWifi2);
        }
    }

    private void init_public_infor() {
        this.hashmap = XmlLoadHelper.loadXml();
        if (this.hashmap != null) {
            this.username = this.hashmap.get("username");
            if (this.hashmap.containsKey("stuname")) {
            }
            String name = this.hashmap.get("stuname");
            if (name != null && this.tv_stuname != null) {
                if (AppEnvironment.isMAINNEW || AppEnvironment.isDEMO) {
                    this.tv_stuname.setText(name);
                } else {
                    this.tv_stuname.setText(String.valueOf(getResources().getString(R.string.student)) + " " + name);
                }
            }
            My_Application.LoginName = this.username;
        }
    }

    private void initSuiningView() {
        this.imageViews[0] = (ImageView) findViewById(R.id.five_img);
        this.imageViews[1] = (ImageView) findViewById(R.id.one_img);
        this.imageViews[2] = (ImageView) findViewById(R.id.two_img);
        this.imageViews[3] = (ImageView) findViewById(R.id.four_img);
        this.imageViews[4] = (ImageView) findViewById(R.id.twelve_img);
        this.imageViews[5] = (ImageView) findViewById(R.id.three_img);
        this.imageViews[6] = (ImageView) findViewById(R.id.six_img);
        this.imageViews[7] = (ImageView) findViewById(R.id.thirteen_img);
        this.imageViews[8] = (ImageView) findViewById(R.id.seven_img);
        this.imageViews[9] = (ImageView) findViewById(R.id.eight_img);
        this.textViews[0] = (TextView) findViewById(R.id.five_txt);
        this.textViews[1] = (TextView) findViewById(R.id.one_txt);
        this.textViews[2] = (TextView) findViewById(R.id.two_txt);
        this.textViews[3] = (TextView) findViewById(R.id.four_txt);
        this.textViews[4] = (TextView) findViewById(R.id.twelve_txt);
        this.textViews[5] = (TextView) findViewById(R.id.three_txt);
        this.textViews[6] = (TextView) findViewById(R.id.six_txt);
        this.textViews[7] = (TextView) findViewById(R.id.thirteen_txt);
        this.textViews[8] = (TextView) findViewById(R.id.seven_txt);
        this.textViews[9] = (TextView) findViewById(R.id.eight_txt);
        this.imageViewSetting = (TextView) findViewById(R.id.setting_img);
        this.wifi_btn = (TextView) findViewById(R.id.wifi_btn);
        this.tv_wifi = (TextView) findViewById(R.id.tv_wifi);
        this.tv_battery = (TextView) findViewById(R.id.tv_battery);
        this.tv_msg = (TextView) findViewById(R.id.tv_sms);
        this.tv_tel = (TextView) findViewById(R.id.tv_tel);
        this.tv_msg.setVisibility(8);
        this.tv_tel.setVisibility(8);
        this.tv_msg.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.19
            @Override // android.view.View.OnClickListener
            public void onClick(View arg0) {
                CloudClientActivity.this.getNetworkTime(0);
            }
        });
        this.tv_tel.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.20
            @Override // android.view.View.OnClickListener
            public void onClick(View arg0) {
                CloudClientActivity.this.getNetworkTime(1);
            }
        });
        for (int i = 0; i < 10 && i < 10; i++) {
            isShowView(this.imageViews[i], true);
            isShowView(this.textViews[i], true);
        }
    }

    private void initView() {
        this.imageViews[0] = (ImageView) findViewById(R.id.one_img);
        this.imageViews[1] = (ImageView) findViewById(R.id.two_img);
        this.imageViews[2] = (ImageView) findViewById(R.id.three_img);
        this.imageViews[3] = (ImageView) findViewById(R.id.four_img);
        this.imageViews[4] = (ImageView) findViewById(R.id.five_img);
        this.imageViews[5] = (ImageView) findViewById(R.id.six_img);
        this.imageViews[6] = (ImageView) findViewById(R.id.seven_img);
        this.imageViews[7] = (ImageView) findViewById(R.id.eight_img);
        this.imageViews[8] = (ImageView) findViewById(R.id.nine_img);
        this.imageViews[9] = (ImageView) findViewById(R.id.ten_img);
        this.imageViews[10] = (ImageView) findViewById(R.id.eleven_img);
        this.imageViews[11] = (ImageView) findViewById(R.id.twelve_img);
        this.textViews[0] = (TextView) findViewById(R.id.one_txt);
        this.textViews[1] = (TextView) findViewById(R.id.two_txt);
        this.textViews[2] = (TextView) findViewById(R.id.three_txt);
        this.textViews[3] = (TextView) findViewById(R.id.four_txt);
        this.textViews[4] = (TextView) findViewById(R.id.five_txt);
        this.textViews[5] = (TextView) findViewById(R.id.six_txt);
        this.textViews[6] = (TextView) findViewById(R.id.seven_txt);
        this.textViews[7] = (TextView) findViewById(R.id.eight_txt);
        this.textViews[8] = (TextView) findViewById(R.id.nine_txt);
        this.textViews[9] = (TextView) findViewById(R.id.ten_txt);
        this.textViews[10] = (TextView) findViewById(R.id.eleven_txt);
        this.textViews[11] = (TextView) findViewById(R.id.twelve_txt);
        this.mainbackground = (LinearLayout) findViewById(R.id.mainbackground);
        this.imageViewSetting = (TextView) findViewById(R.id.setting_img);
        this.wifi_btn = (TextView) findViewById(R.id.wifi_btn);
        this.tv_wifi = (TextView) findViewById(R.id.tv_wifi);
        this.tv_battery = (TextView) findViewById(R.id.tv_battery);
        this.tv_msg = (TextView) findViewById(R.id.tv_sms);
        this.tv_tel = (TextView) findViewById(R.id.tv_tel);
        this.tv_msg.setVisibility(8);
        this.tv_tel.setVisibility(8);
        this.tv_msg.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.21
            @Override // android.view.View.OnClickListener
            public void onClick(View arg0) {
                CloudClientActivity.this.getNetworkTime(0);
            }
        });
        this.tv_tel.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.22
            @Override // android.view.View.OnClickListener
            public void onClick(View arg0) {
                CloudClientActivity.this.getNetworkTime(1);
            }
        });
        for (int i = 0; i < this.imageViews.length && i < this.textViews.length; i++) {
            isShowView(this.imageViews[i], true);
            isShowView(this.textViews[i], true);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getNetworkTime(final int type) {
        new Thread(new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.23
            @Override // java.lang.Runnable
            public void run() {
                try {
                    URL url = new URL("http://www.ntsc.ac.cn");
                    URLConnection uc = url.openConnection();
                    uc.connect();
                    long ld = uc.getDate();
                    Date date = new Date(ld);
                    date.getHours();
                    date.getMinutes();
                    Message msg = CloudClientActivity.this.callHandler.obtainMessage();
                    msg.what = type;
                    msg.sendToTarget();
                    SharedPreferences callSp = CloudClientActivity.this.getSharedPreferences("allowcall", 4);
                    callSp.edit().putBoolean("cancall", true).commit();
                } catch (Exception e) {
                    e.printStackTrace();
                    Message msg2 = CloudClientActivity.this.callHandler.obtainMessage();
                    msg2.what = 2;
                    msg2.sendToTarget();
                    SharedPreferences callSp2 = CloudClientActivity.this.getSharedPreferences("allowcall", 4);
                    callSp2.edit().putBoolean("cancall", false).commit();
                }
            }
        }).start();
    }

    private void removeIllegalApks() {
        new Thread(new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.24
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Thread.sleep(3000L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (!Build.DISPLAY.contains("A10-70LC") && !Build.DISPLAY.contains("TB-8703N") && !Build.DISPLAY.contains("TB-8604F") && !Build.DISPLAY.contains("A10-70F") && !Build.DISPLAY.contains("YiJiao") && !Build.DISPLAY.contains("YOGATablet2-1050LC") && Build.DISPLAY.indexOf("S1016PRO") < 0 && Build.DISPLAY.indexOf("M1016Pro") < 0 && Build.DISPLAY.indexOf("P990S.V") < 0 && Build.DISPLAY.indexOf("D13B") < 0 && Build.DISPLAY.indexOf("QC80A") < 0 && Build.DISPLAY.indexOf("N5110ZB") < 0 && Build.DISPLAY.indexOf(".T360Z") < 0 && Build.DISPLAY.indexOf("P583") < 0 && Build.DISPLAY.indexOf("P350") < 0 && Build.DISPLAY.indexOf("P550") < 0 && Build.DISPLAY.indexOf("M856.V") < 0 && Build.DISPLAY.indexOf("S1016.V1") < 0 && Build.DISPLAY.indexOf("S106.V1") < 0 && Build.DISPLAY.indexOf("S1016E") < 0) {
                    return;
                }
                try {
                    CloudClientActivity.this.getMyApps(CloudClientActivity.this.send_ip, CloudClientActivity.this.send_privatekey);
                } catch (Exception e2) {
                }
            }
        }).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getMyApps(String ip, String privatekey) {
        String sppref;
        SharedPreferences sp;
        if (this.myappList == null) {
            this.myappList = new ArrayList();
        }
        if (ip != null && !ip.equals("") && (sppref = ip.trim()) != null && !sppref.equals("")) {
            try {
                sp = getSharedPreferences(sppref, 0);
            } catch (NullPointerException e) {
                sp = null;
            } catch (Exception e2) {
                sp = null;
            }
            if (sp != null) {
                long lasttime = sp.getLong("updatetime", 0L);
                long time = System.currentTimeMillis();
                String myapps = sp.getString("data", "");
                if (Math.abs((time - lasttime) / 1000) >= 10800) {
                    String url = "http://" + ip + "/api/app/projectcode/myapp/os/android";
                    HttpGet httpRequest = httpGetInit(url, privatekey, this.username);
                    try {
                        HttpResponse httpResponse = new DefaultHttpClient().execute(httpRequest);
                        if (httpResponse.getStatusLine().getStatusCode() == 200) {
                            String strResult = EntityUtils.toString(httpResponse.getEntity());
                            System.out.println("strResult:" + strResult);
                            if (strResult != null && !strResult.equals("")) {
                                JSONObject jobj = new JSONObject(strResult);
                                boolean status = jobj.getBoolean("status");
                                jobj.getString("errorInfo");
                                if (status) {
                                    sp.edit().putLong("updatetime", System.currentTimeMillis()).commit();
                                    sp.edit().putString("data", strResult).commit();
                                    myapps = strResult;
                                }
                            }
                        }
                    } catch (ClientProtocolException e3) {
                        e3.printStackTrace();
                    } catch (IOException e4) {
                        e4.printStackTrace();
                    } catch (Exception e5) {
                        e5.printStackTrace();
                    }
                }
                if (myapps != null) {
                    try {
                        if (!myapps.equals("")) {
                            JSONObject jobj2 = new JSONObject(myapps);
                            boolean status2 = jobj2.getBoolean("status");
                            jobj2.getString("errorInfo");
                            if (status2) {
                                JSONObject jdata = jobj2.getJSONObject("data");
                                JSONArray jsonArray = jdata.getJSONArray("app");
                                if (jsonArray != null && jsonArray.length() > 0) {
                                    this.myappList.clear();
                                    for (int i = 0; i < jsonArray.length(); i++) {
                                        String pkg = jsonArray.getJSONObject(i).getString("packagename");
                                        String apptype = jsonArray.getJSONObject(i).getString("apptype");
                                        if (LogHelp.TYPE_GUIDANCE.equals(apptype)) {
                                            this.myappList.add(pkg);
                                        }
                                    }
                                }
                            }
                        }
                    } catch (NullPointerException e6) {
                        e6.printStackTrace();
                    } catch (JSONException e7) {
                        e7.printStackTrace();
                    } catch (Exception e8) {
                        e8.printStackTrace();
                    }
                }
                getOtherApps();
            }
        }
    }

    public static HttpGet httpGetInit(String url, String privatekey, String username) {
        HttpGet get = new HttpGet(url);
        get.addHeader("X-Edutech-Entity", String.valueOf(username) + "+" + privatekey);
        long imestamp = System.currentTimeMillis();
        String sign = My_md5.Md5(String.valueOf(imestamp) + username + privatekey);
        get.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
        return get;
    }

    private void getOtherApps() {

    }

    private void isShowView(View view, boolean flag) {
        view.setVisibility(flag ? 0 : 8);
    }

    private void initListener() {
        if (!AppEnvironment.isMAINNEW && !AppEnvironment.isDEMO) {
            for (int i = 0; i < 12; i++) {
                this.imageViews[i].setOnClickListener(this);
            }
        }
        this.imageViewSetting.setOnClickListener(this);
        this.wifi_btn.setOnClickListener(this);
    }

    private void initSuiningListener() {
        for (int i = 0; i < 10; i++) {
            this.imageViews[i].setOnClickListener(this);
        }
        this.imageViewSetting.setOnClickListener(this);
        this.wifi_btn.setOnClickListener(this);
    }

    private void initVariable() {
        this.mPackageManager = getPackageManager();
        DisplayMetrics mDisplayMetrics = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(mDisplayMetrics);
        mWidth = mDisplayMetrics.widthPixels;
        mHight = mDisplayMetrics.heightPixels;
    }

    private void assignmentSuining() {
        this.imageViews[0].setImageResource(R.drawable.afd_mybook);
        this.imageViews[0].setImageResource(R.drawable.mybook);
        this.imageViews[0].setVisibility(0);
        this.textViews[0].setTextColor(-1);
        this.textViews[0].setText(getResources().getString(R.string.app_name_mybook));
        this.textViews[0].setVisibility(0);
        this.imageViews[1].setImageResource(R.drawable.dxb);
        this.imageViews[1].setImageResource(R.drawable.dxb_suining);
        this.textViews[1].setTextColor(-1);
        this.imageViews[1].setVisibility(0);
        this.textViews[1].setText(getResources().getString(R.string.dxb_name));
        this.textViews[1].setVisibility(0);
        this.imageViews[2].setImageResource(R.drawable.zyfd);
        this.imageViews[2].setImageResource(R.drawable.zyfd_suining);
        this.textViews[2].setTextColor(-1);
        this.imageViews[2].setVisibility(0);
        this.textViews[2].setText(getResources().getString(R.string.zyfd_name));
        this.textViews[2].setVisibility(0);
        this.imageViews[3].setImageResource(R.drawable.ctj);
        this.imageViews[3].setImageResource(R.drawable.ctj_suining);
        this.textViews[3].setTextColor(-1);
        this.imageViews[3].setVisibility(0);
        this.textViews[3].setText(getResources().getString(R.string.cuotiji_name));
        this.textViews[3].setVisibility(0);
        this.imageViews[4].setImageResource(R.drawable.happ_class);
        this.imageViews[4].setImageResource(R.drawable.zhkt);
        this.textViews[4].setTextColor(-1);
        this.imageViews[4].setVisibility(0);
        this.textViews[4].setText(getResources().getString(R.string.app_name_happ_class));
        this.textViews[4].setVisibility(0);
        this.imageViews[5].setImageResource(R.drawable.my_homework);
        this.imageViews[5].setImageResource(R.drawable.zysf);
        this.textViews[5].setTextColor(-1);
        this.imageViews[5].setVisibility(0);
        this.textViews[5].setText(getResources().getString(R.string.homework_name));
        this.textViews[5].setVisibility(0);
        this.imageViews[6].setImageResource(R.drawable.my_app);
        this.imageViews[6].setImageResource(R.drawable.mhzx);
        this.textViews[6].setTextColor(-1);
        this.imageViews[6].setVisibility(0);
        this.textViews[6].setText(getResources().getString(R.string.app_name_appmanage));
        this.textViews[6].setVisibility(0);
        this.imageViews[7].setImageResource(R.drawable.myfiles);
        this.imageViews[7].setImageResource(R.drawable.bdc_suining);
        this.textViews[7].setTextColor(-1);
        this.imageViews[7].setVisibility(0);
        this.textViews[7].setText(getResources().getString(R.string.eword));
        this.textViews[7].setVisibility(0);
        this.imageViews[8].setImageResource(R.drawable.my_camera);
        this.imageViews[8].setImageResource(R.drawable.suining_xj);
        this.textViews[8].setTextColor(-1);
        this.imageViews[8].setVisibility(0);
        this.textViews[8].setText(getResources().getString(R.string.app_name_mycamera));
        this.textViews[8].setVisibility(0);
        this.imageViews[9].setImageResource(R.drawable.myfiles);
        this.imageViews[9].setImageResource(R.drawable.myfile);
        this.textViews[9].setTextColor(-1);
        this.imageViews[9].setVisibility(0);
        this.textViews[9].setText(getResources().getString(R.string.app_name_myfile));
        this.textViews[9].setVisibility(0);
        if (this.mAllApps != null && this.mAllApps.size() > 0) {
            for (int i = 10; i < 10; i++) {
                if (this.mAllApps.size() + 10 > i && this.mAllApps.get(i - 10) != null) {
                    this.imageViews[i].setImageDrawable(this.mAllApps.get(i - 10).loadIcon(this.mPackageManager));
                    this.imageViews[i].setVisibility(0);
                    this.textViews[i].setText(this.mAllApps.get(i - 10).loadLabel(this.mPackageManager).toString());
                    this.textViews[i].setTextColor(getResources().getColor(R.color.showcolor));
                    this.textViews[i].setVisibility(0);
                } else {
                    this.imageViews[i].setImageDrawable(getResources().getDrawable(R.drawable.app_add));
                    this.imageViews[i].setVisibility(0);
                    this.textViews[i].setText(getResources().getString(R.string.add_app));
                    this.textViews[i].setTextColor(getResources().getColor(R.color.addcolor));
                    this.textViews[i].setVisibility(0);
                }
            }
            return;
        }
        for (int i2 = 10; i2 < 10; i2++) {
            this.imageViews[i2].setImageDrawable(getResources().getDrawable(R.drawable.app_add));
            this.imageViews[i2].setVisibility(0);
            this.textViews[i2].setText(getResources().getString(R.string.add_app));
            this.textViews[i2].setTextColor(getResources().getColor(R.color.addcolor));
            this.textViews[i2].setVisibility(0);
        }
    }

    private void assignment() {
        if (AppEnvironment.isSDYB) {
            this.imageViews[0].setImageResource(R.drawable.sdeb);
            this.imageViews[0].setVisibility(0);
            this.textViews[0].setText("时代e学");
            this.textViews[0].setVisibility(0);
            this.textViews[0].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            this.imageViews[1].setImageResource(R.drawable.sdeb);
            this.imageViews[1].setVisibility(0);
            this.textViews[1].setText("时代e教");
            this.textViews[1].setVisibility(0);
            this.textViews[1].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            this.imageViews[2].setImageResource(R.drawable.my_homework);
            this.imageViews[2].setVisibility(8);
            this.textViews[2].setText(getResources().getString(R.string.homework_name));
            this.textViews[2].setVisibility(8);
            this.textViews[2].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            this.imageViews[3].setImageResource(R.drawable.ctj);
            this.imageViews[3].setVisibility(8);
            this.textViews[3].setText(getResources().getString(R.string.cuotiji_name));
            this.textViews[3].setVisibility(8);
            this.textViews[3].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            this.imageViews[4].setImageResource(R.drawable.afd_mybook);
            this.imageViews[4].setVisibility(8);
            this.textViews[4].setText(getResources().getString(R.string.app_name_mybook));
            this.textViews[4].setVisibility(8);
            this.textViews[4].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            this.imageViews[5].setImageResource(R.drawable.my_app);
            this.imageViews[5].setVisibility(8);
            this.textViews[5].setText(getResources().getString(R.string.app_name_appmanage));
            this.textViews[5].setVisibility(8);
            this.textViews[5].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            this.imageViews[6].setImageResource(R.drawable.my_camera);
            this.imageViews[6].setVisibility(8);
            this.textViews[6].setText(getResources().getString(R.string.app_name_mycamera));
            this.textViews[6].setVisibility(8);
            this.textViews[6].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            this.imageViews[7].setImageResource(R.drawable.myfiles);
            this.imageViews[7].setVisibility(8);
            this.textViews[7].setText(getResources().getString(R.string.app_name_myfile));
            this.textViews[7].setVisibility(8);
            this.textViews[7].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            this.imageViews[8].setImageResource(R.drawable.home_school);
            this.textViews[8].setText(getResources().getString(R.string.app_name_home_school));
            this.imageViews[8].setVisibility(8);
            this.textViews[8].setVisibility(8);
            this.textViews[8].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            this.imageViews[9].setImageResource(R.drawable.hudongtaolun);
            this.imageViews[9].setVisibility(8);
            this.textViews[9].setText(getResources().getString(R.string.app_name_myDiscussion));
            this.textViews[9].setVisibility(8);
            this.textViews[9].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            this.imageViews[10].setImageResource(R.drawable.study_store);
            this.textViews[10].setText(getResources().getString(R.string.app_name_studystore));
            this.imageViews[10].setVisibility(8);
            this.textViews[10].setVisibility(8);
            this.textViews[10].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            this.imageViews[11].setImageResource(R.drawable.happ_class);
            this.imageViews[11].setVisibility(8);
            this.textViews[11].setText(getResources().getString(R.string.app_name_happ_class));
            this.textViews[11].setVisibility(8);
            this.textViews[11].setTextColor(ViewCompat.MEASURED_STATE_MASK);
        } else {
            if (AppEnvironment.isMAINNEW) {
                this.imageViews[0].setImageResource(R.drawable.new_dxb);
            } else if (AppEnvironment.isDEMO) {
                this.imageViews[0].setImageResource(R.drawable.new_wdyy);
            } else {
                this.imageViews[0].setImageResource(R.drawable.dxb);
            }
            this.imageViews[0].setVisibility(0);
            if (AppEnvironment.isDEMO) {
                this.textViews[0].setText("阿凡题");
            } else {
                this.textViews[0].setText(getResources().getString(R.string.dxb_name));
            }
            this.textViews[0].setVisibility(0);
            this.textViews[0].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            if (AppEnvironment.isMAINNEW) {
                this.imageViews[1].setImageResource(R.drawable.new_zyfd);
            } else if (AppEnvironment.isDEMO) {
                this.imageViews[1].setImageResource(R.drawable.new_wdyy);
            } else {
                this.imageViews[1].setImageResource(R.drawable.zyfd);
            }
            this.imageViews[1].setVisibility(0);
            if (AppEnvironment.isDEMO) {
                this.textViews[1].setText("一起作业");
            } else {
                this.textViews[1].setText(getResources().getString(R.string.zyfd_name));
            }
            if (AppEnvironment.isDEMO) {
                this.textViews[1].setText("辅导资源");
            }
            this.textViews[1].setVisibility(0);
            this.textViews[1].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            if (AppEnvironment.isMAINNEW) {
                this.imageViews[2].setImageResource(R.drawable.new_wdzy);
            } else if (AppEnvironment.isDEMO) {
                this.imageViews[2].setImageResource(R.drawable.new_wdyy);
            } else {
                this.imageViews[2].setImageResource(R.drawable.my_homework);
            }
            this.imageViews[2].setVisibility(0);
            if (AppEnvironment.isDEMO) {
                this.textViews[2].setText("纳米盒");
            } else {
                this.textViews[2].setText(getResources().getString(R.string.homework_name));
            }
            this.textViews[2].setVisibility(0);
            this.textViews[2].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            if (AppEnvironment.isMAINNEW) {
                this.imageViews[3].setImageResource(R.drawable.new_ctj);
            } else if (AppEnvironment.isDEMO) {
                this.imageViews[3].setImageResource(R.drawable.new_wdyy);
            } else {
                this.imageViews[3].setImageResource(R.drawable.ctj);
            }
            this.imageViews[3].setVisibility(0);
            if (AppEnvironment.isDEMO) {
                this.textViews[3].setText("纳米盒");
            } else {
                this.textViews[3].setText(getResources().getString(R.string.cuotiji_name));
            }
            this.textViews[3].setVisibility(0);
            this.textViews[3].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            if (AppEnvironment.isMAINNEW) {
                this.imageViews[4].setImageResource(R.drawable.new_wdxk);
            } else if (AppEnvironment.isDEMO) {
                this.imageViews[4].setImageResource(R.drawable.new_wdyy);
            } else {
                this.imageViews[4].setImageResource(R.drawable.afd_mybook);
            }
            this.imageViews[4].setVisibility(0);
            if (AppEnvironment.isDEMO) {
                this.textViews[4].setText("小学宝");
            } else {
                this.textViews[4].setText(getResources().getString(R.string.app_name_mybook));
            }
            this.textViews[4].setVisibility(0);
            this.textViews[4].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            if (AppEnvironment.isMAINNEW) {
                this.imageViews[5].setImageResource(R.drawable.new_wdyy);
            } else if (AppEnvironment.isDEMO) {
                this.imageViews[5].setImageResource(R.drawable.new_wdyy);
            } else {
                this.imageViews[5].setImageResource(R.drawable.my_app);
            }
            this.imageViews[5].setVisibility(0);
            this.textViews[5].setText(getResources().getString(R.string.app_name_appmanage));
            this.textViews[5].setVisibility(0);
            this.textViews[5].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            if (AppEnvironment.isMAINNEW) {
                this.imageViews[6].setImageResource(R.drawable.new_wdxj);
            } else if (AppEnvironment.isDEMO) {
                this.imageViews[6].setImageResource(R.drawable.new_wdxj);
            } else {
                this.imageViews[6].setImageResource(R.drawable.my_camera);
            }
            this.imageViews[6].setVisibility(0);
            this.textViews[6].setText(getResources().getString(R.string.app_name_mycamera));
            this.textViews[6].setVisibility(0);
            this.textViews[6].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            if (AppEnvironment.isMAINNEW) {
                this.imageViews[7].setImageResource(R.drawable.new_wdwj);
            } else if (AppEnvironment.isDEMO) {
                this.imageViews[7].setImageResource(R.drawable.new_wdwj);
            } else {
                this.imageViews[7].setImageResource(R.drawable.myfiles);
            }
            this.imageViews[7].setVisibility(0);
            this.textViews[7].setText(getResources().getString(R.string.app_name_myfile));
            this.textViews[7].setVisibility(0);
            this.textViews[7].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            if (AppEnvironment.isMAINNEW) {
                this.imageViews[8].setImageResource(R.drawable.new_jxhd);
            } else if (AppEnvironment.isDEMO) {
                this.imageViews[8].setImageResource(R.drawable.new_wdyy);
            } else {
                this.imageViews[8].setImageResource(R.drawable.home_school);
            }
            if (AppEnvironment.isDEMO) {
                this.textViews[8].setText("网易有道词典");
            } else {
                this.textViews[8].setText(getResources().getString(R.string.app_name_home_school));
            }
            this.imageViews[8].setVisibility(0);
            this.textViews[8].setVisibility(0);
            this.textViews[8].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            if (AppEnvironment.isMAINNEW) {
                this.imageViews[9].setImageResource(R.drawable.new_hdtl);
            } else if (AppEnvironment.isDEMO) {
                this.imageViews[9].setImageResource(R.drawable.new_wdyy);
            } else {
                this.imageViews[9].setImageResource(R.drawable.hudongtaolun);
            }
            this.imageViews[9].setVisibility(0);
            if (AppEnvironment.isDEMO) {
                this.textViews[9].setText("汉语字典");
            } else {
                this.textViews[9].setText(getResources().getString(R.string.app_name_myDiscussion));
            }
            this.textViews[9].setVisibility(0);
            this.textViews[9].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            if (AppEnvironment.isMAINNEW) {
                this.imageViews[10].setImageResource(R.drawable.new_xxsd);
            } else if (AppEnvironment.isDEMO) {
                this.imageViews[10].setImageResource(R.drawable.new_wdyy);
            } else {
                this.imageViews[10].setImageResource(R.drawable.study_store);
            }
            if (AppEnvironment.isDEMO) {
                this.textViews[10].setText("录音机");
            } else {
                this.textViews[10].setText(getResources().getString(R.string.app_name_studystore));
            }
            this.imageViews[10].setVisibility(0);
            this.textViews[10].setVisibility(0);
            this.textViews[10].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            if (AppEnvironment.isSDYB) {
                this.imageViews[11].setImageResource(R.drawable.sdeb);
                this.imageViews[11].setVisibility(0);
                this.textViews[11].setText("时代e学");
                this.textViews[11].setVisibility(0);
                this.textViews[11].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            } else {
                if (AppEnvironment.isMAINNEW) {
                    this.imageViews[11].setImageResource(R.drawable.new_zhkt);
                } else if (AppEnvironment.isDEMO) {
                    this.imageViews[11].setImageResource(R.drawable.new_wdyy);
                } else {
                    this.imageViews[11].setImageResource(R.drawable.happ_class);
                }
                this.imageViews[11].setVisibility(0);
                if (AppEnvironment.isDEMO) {
                    this.textViews[11].setText("学而思");
                } else {
                    this.textViews[11].setText(getResources().getString(R.string.app_name_happ_class));
                }
                this.textViews[11].setVisibility(0);
                this.textViews[11].setTextColor(ViewCompat.MEASURED_STATE_MASK);
            }
        }
        if (this.mAllApps != null && this.mAllApps.size() > 0) {
            for (int i = 12; i < 10; i++) {
                if (this.mAllApps.size() + 12 > i && this.mAllApps.get(i - 12) != null) {
                    this.imageViews[i].setImageDrawable(this.mAllApps.get(i - 12).loadIcon(this.mPackageManager));
                    this.imageViews[i].setVisibility(0);
                    this.textViews[i].setText(this.mAllApps.get(i - 12).loadLabel(this.mPackageManager).toString());
                    this.textViews[i].setTextColor(getResources().getColor(R.color.showcolor));
                    this.textViews[i].setVisibility(0);
                } else {
                    this.imageViews[i].setImageDrawable(getResources().getDrawable(R.drawable.app_add));
                    this.imageViews[i].setVisibility(0);
                    this.textViews[i].setText(getResources().getString(R.string.add_app));
                    this.textViews[i].setTextColor(getResources().getColor(R.color.addcolor));
                    this.textViews[i].setVisibility(0);
                }
            }
            return;
        }
        for (int i2 = 12; i2 < 12; i2++) {
            this.imageViews[i2].setImageDrawable(getResources().getDrawable(R.drawable.app_add));
            this.imageViews[i2].setVisibility(0);
            this.textViews[i2].setText(getResources().getString(R.string.add_app));
            this.textViews[i2].setTextColor(getResources().getColor(R.color.addcolor));
            this.textViews[i2].setVisibility(0);
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        PackageInfo packageInfo2;
        PackageInfo packageInfo_taolun;
        PackageInfo packageInfo_wodewenjian;
        Log.i("RIO", new StringBuilder(String.valueOf(v.getId())).toString());
        SharedPreferences sp = getSharedPreferences("language", 0);
        String type = sp.getString("language", "chinese");
        int id = v.getId();
        switch (id) {
            case R.id.wifi_btn /* 2131362141 */:
            case R.id.newwifi_img /* 2131362197 */:
                startWifiActivity();
                break;
            case R.id.setting_img /* 2131362142 */:
            case R.id.newsetting_img /* 2131362199 */:
                openSetting();
                break;
            case R.id.one_img /* 2131362146 */:
            case R.id.ll_one /* 2131362175 */:
            case R.id.sdyb_btn5 /* 2131362207 */:
                if (AppEnvironment.isDEMO) {
                    PackageManager pm = getPackageManager();
                    Intent intent = pm.getLaunchIntentForPackage("com.lejent.zuoyeshenqi.afanti");
                    intent.addFlags(335544320);
                    if (intent != null) {
                        startActivity(intent, "com.lejent.zuoyeshenqi.afanti");
                        break;
                    }
                } else if (AppEnvironment.isSDYB) {
                    try {
                        PackageInfo pinfo = getPackageManager().getPackageInfo("com.akson.launch.eplauncher", 0);
                        if (pinfo != null) {
                            ComponentName component = new ComponentName("com.akson.launch.eplauncher", "com.akson.launch.eplauncher.SplashActivity");
                            Intent intent_book = new Intent();
                            intent_book.addCategory("android.intent.category.LAUNCHER");
                            intent_book.setComponent(component);
                            intent_book.setAction("android.intent.action.MAIN");
                            intent_book.setFlags(335544320);
                            startActivity(intent_book, "com.akson.launch.eplauncher");
                            break;
                        }
                    } catch (PackageManager.NameNotFoundException e1) {
                        e1.printStackTrace();
                        break;
                    } catch (Exception e) {
                        break;
                    }
                } else if (AppEnvironment.ONE_IMG) {
                    try {
                        PackageInfo pinfo2 = getPackageManager().getPackageInfo("com.edutech.guidance", 0);
                        if (pinfo2 != null) {
                            ComponentName component2 = new ComponentName("com.edutech.guidance", "com.edutech.guidance.MainActivity");
                            Intent intent_book2 = new Intent();
                            intent_book2.addCategory("android.intent.category.LAUNCHER");
                            intent_book2.setComponent(component2);
                            intent_book2.setAction("android.intent.action.MAIN");
                            intent_book2.setFlags(268435456);
                            startActivity(intent_book2, "com.edutech.guidance");
                            break;
                        }
                    } catch (PackageManager.NameNotFoundException e12) {
                        e12.printStackTrace();
                        Toast.makeText(this, "该应用未安装！", 0).show();
                        break;
                    }
                } else {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                }
                break;
            case R.id.two_img /* 2131362148 */:
            case R.id.ll_two /* 2131362176 */:
                if (AppEnvironment.isDEMO) {
                    PackageManager pm2 = getPackageManager();
                    Intent intent2 = pm2.getLaunchIntentForPackage("com.A17zuoye.mobile.homework");
                    intent2.addFlags(335544320);
                    if (intent2 != null) {
                        startActivity(intent2, "com.A17zuoye.mobile.homework");
                        break;
                    }
                } else if (AppEnvironment.isSDYB) {
                    try {
                        PackageInfo pinfo3 = getPackageManager().getPackageInfo("com.akson.timeep", 0);
                        if (pinfo3 != null) {
                            ComponentName component3 = new ComponentName("com.akson.timeep", "com.akson.timeep.SplashActivity");
                            Intent intent_book3 = new Intent();
                            intent_book3.addCategory("android.intent.category.LAUNCHER");
                            intent_book3.setComponent(component3);
                            intent_book3.setAction("android.intent.action.MAIN");
                            intent_book3.setFlags(268435456);
                            startActivity(intent_book3, "com.akson.timeep");
                            break;
                        }
                    } catch (PackageManager.NameNotFoundException e13) {
                        e13.printStackTrace();
                        break;
                    } catch (Exception e2) {
                        break;
                    }
                } else if (AppEnvironment.TWO_IMG) {
                    try {
                        PackageInfo pinfo4 = getPackageManager().getPackageInfo("com.edutech.zuoyefudao3", 0);
                        if (pinfo4 != null) {
                            ComponentName component4 = new ComponentName("com.edutech.zuoyefudao3", AppEnvironment.ZUOYEFUDAO_APPNAME);
                            Intent intent_book4 = new Intent();
                            intent_book4.addCategory("android.intent.category.LAUNCHER");
                            intent_book4.setComponent(component4);
                            intent_book4.setAction("android.intent.action.MAIN");
                            intent_book4.setFlags(268435456);
                            startActivity(intent_book4, "com.edutech.zuoyefudao3");
                            break;
                        }
                    } catch (PackageManager.NameNotFoundException e14) {
                        e14.printStackTrace();
                        Toast.makeText(this, "该应用未安装！", 0).show();
                        break;
                    } catch (Exception e3) {
                        e3.printStackTrace();
                        break;
                    }
                } else {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                }
                break;
            case R.id.three_img /* 2131362150 */:
            case R.id.ll_three /* 2131362189 */:
                if (AppEnvironment.THREE_IMG) {
                    SharedPreferences sp2 = getSharedPreferences("notice", 0);
                    sp2.edit().putLong("lasttime", 0L).commit();
                    try {
                        PackageInfo pinfo5 = getPackageManager().getPackageInfo("com.edutech.mywork", 0);
                        if (pinfo5 != null) {
                            ComponentName component5 = new ComponentName("com.edutech.mywork", "com.edutech.mywork.MainActivity");
                            Intent intent_book5 = new Intent();
                            intent_book5.addCategory("android.intent.category.LAUNCHER");
                            intent_book5.setComponent(component5);
                            intent_book5.setAction("android.intent.action.MAIN");
                            intent_book5.setFlags(268435456);
                            startActivity(intent_book5, "com.edutech.mywork");
                            break;
                        }
                    } catch (PackageManager.NameNotFoundException e15) {
                        e15.printStackTrace();
                        Toast.makeText(this, "该应用未安装！", 0).show();
                        break;
                    }
                } else {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                }
                break;
            case R.id.four_img /* 2131362153 */:
            case R.id.ll_four /* 2131362177 */:
                if (AppEnvironment.isDEMO) {
                    PackageManager pm3 = getPackageManager();
                    Intent intent3 = pm3.getLaunchIntentForPackage("com.jinxin.namibox");
                    intent3.addFlags(335544320);
                    if (intent3 != null) {
                        startActivity(intent3, "com.jinxin.namibox");
                        break;
                    }
                } else if (AppEnvironment.FOUR_IMG) {
                    try {
                        PackageInfo pinfo6 = getPackageManager().getPackageInfo("com.edutech.wrongcollection", 0);
                        if (pinfo6 != null) {
                            ComponentName component6 = new ComponentName("com.edutech.wrongcollection", "com.edutech.wrongcollection.MainActivity");
                            Intent intent_book6 = new Intent();
                            intent_book6.addCategory("android.intent.category.LAUNCHER");
                            intent_book6.setComponent(component6);
                            intent_book6.setAction("android.intent.action.MAIN");
                            intent_book6.setFlags(268435456);
                            startActivity(intent_book6, "com.edutech.wrongcollection");
                            break;
                        }
                    } catch (PackageManager.NameNotFoundException e16) {
                        e16.printStackTrace();
                        Toast.makeText(this, "该应用未安装！", 0).show();
                        break;
                    }
                } else {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                }
                break;
            case R.id.five_img /* 2131362155 */:
            case R.id.ll_five /* 2131362178 */:
                if (AppEnvironment.isDEMO) {
                    PackageManager pm4 = getPackageManager();
                    Intent intent4 = pm4.getLaunchIntentForPackage("com.haojiazhang.activity");
                    intent4.addFlags(335544320);
                    if (intent4 != null) {
                        startActivity(intent4, "com.haojiazhang.activity");
                        break;
                    }
                } else if (AppEnvironment.isSNZT) {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                } else if (AppEnvironment.FIVE_IMG) {
                    try {
                        PackageInfo pinfo7 = getPackageManager().getPackageInfo("com.edutech.textbook", 0);
                        if (pinfo7 != null) {
                            ComponentName component7 = new ComponentName("com.edutech.textbook", AppEnvironment.MULTIMEDIAMATERIAL_APPNAME);
                            Intent intent_book7 = new Intent();
                            intent_book7.addCategory("android.intent.category.LAUNCHER");
                            intent_book7.setComponent(component7);
                            intent_book7.setAction("android.intent.action.MAIN");
                            intent_book7.setFlags(268435456);
                            intent_book7.putExtra("type", type);
                            intent_book7.putExtra("ip", this.send_ip);
                            intent_book7.putExtra("name", this.send_name);
                            intent_book7.putExtra("privatekey", this.send_privatekey);
                            intent_book7.putExtra("demo", this.send_demo);
                            intent_book7.putExtra("pwd", this.send_pwd);
                            intent_book7.putExtra("usercode", this.send_usercode);
                            startActivity(intent_book7, "com.edutech.textbook");
                            break;
                        }
                    } catch (PackageManager.NameNotFoundException e17) {
                        e17.printStackTrace();
                        Toast.makeText(this, "该应用未安装！", 0).show();
                        break;
                    }
                } else {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                }
                break;
            case R.id.six_img /* 2131362157 */:
            case R.id.ll_six /* 2131362185 */:
            case R.id.sdyb_myapp /* 2131362202 */:
                if (AppEnvironment.SIX_IMG) {
                    try {
                        PackageInfo pinfo8 = getPackageManager().getPackageInfo("com.edutech.myapps", 0);
                        if (pinfo8 != null) {
                            ComponentName component8 = new ComponentName("com.edutech.myapps", "com.edutech.myapps.activity.MainActivity");
                            Intent intent_book8 = new Intent();
                            intent_book8.addCategory("android.intent.category.LAUNCHER");
                            intent_book8.setComponent(component8);
                            intent_book8.setAction("android.intent.action.MAIN");
                            intent_book8.setFlags(268435456);
                            startActivity(intent_book8, "com.edutech.myapps");
                            break;
                        }
                    } catch (PackageManager.NameNotFoundException e18) {
                        e18.printStackTrace();
                        Toast.makeText(this, "该应用未安装！", 0).show();
                        break;
                    }
                } else {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                }
                break;
            case R.id.seven_img /* 2131362159 */:
            case R.id.ll_seven /* 2131362183 */:
                if (AppEnvironment.isCJLY || AppEnvironment.isHT || AppEnvironment.isSPYZ || AppEnvironment.isYWHZ || AppEnvironment.isPDSSZ || AppEnvironment.isCH || AppEnvironment.isXF || AppEnvironment.isYWJD || AppEnvironment.isYWYT || AppEnvironment.isDISABLE4 || AppEnvironment.isLJLD || AppEnvironment.isTHZX || AppEnvironment.isPDS || AppEnvironment.isXFJD || AppEnvironment.isBS || AppEnvironment.isSMX || AppEnvironment.isXXJ || AppEnvironment.isNLEZ || AppEnvironment.isNL || !AppEnvironment.SEVEN_IMG || AppEnvironment.isSNZT) {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                } else if (AppEnvironment.isNJLZ || AppEnvironment.isSDYB) {
                    try {
                        Intent infoIntent = new Intent("android.media.action.IMAGE_CAPTURE");
                        ResolveInfo res = getPackageManager().resolveActivity(infoIntent, 0);
                        if (res != null) {
                            Log.e(TAG, "ACTION_IMAGE_CAPTURE--->" + res.activityInfo.packageName);
                            Log.e(TAG, "activityInfo.name--->" + res.activityInfo.name);
                        }
                        String packageName = res.activityInfo.packageName;
                        String classname = res.activityInfo.name;
                        Log.e(TAG, "ACTION_IMAGE_CAPTURE--->" + res.activityInfo.packageName);
                        Log.e(TAG, "activityInfo.name--->" + res.activityInfo.name);
                        Intent mIntent = new Intent();
                        ComponentName comp = new ComponentName(packageName, classname);
                        mIntent.setComponent(comp);
                        mIntent.setAction("android.intent.action.MAIN");
                        startActivity(mIntent);
                        break;
                    } catch (Exception e4) {
                        e4.printStackTrace();
                        Intent intentP = new Intent("android.media.action.IMAGE_CAPTURE");
                        startActivity(intentP);
                        break;
                    }
                } else {
                    openCamera();
                    break;
                }
            case R.id.eight_img /* 2131362161 */:
            case R.id.ll_eight /* 2131362184 */:
                if (AppEnvironment.isXF || AppEnvironment.isCJLY || AppEnvironment.isHT || AppEnvironment.isPDSSZ || AppEnvironment.isSPYZ || AppEnvironment.isDISABLE4 || AppEnvironment.isBS || AppEnvironment.isTHZX || AppEnvironment.isSMX || AppEnvironment.isXXJ || AppEnvironment.isNL || AppEnvironment.isNLEZ || AppEnvironment.isYYYB || !AppEnvironment.EIGHT_IMG || AppEnvironment.isSNZT) {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                } else {
                    try {
                        packageInfo_wodewenjian = getPackageManager().getPackageInfo("com.edutech.myfiles", 0);
                    } catch (PackageManager.NameNotFoundException e5) {
                        packageInfo_wodewenjian = null;
                        e5.printStackTrace();
                        Toast.makeText(this, "该应用未安装！", 0).show();
                    }
                    if (packageInfo_wodewenjian != null) {
                        ComponentName componet = new ComponentName("com.edutech.myfiles", "src.com.edutech.wodewenjian.activitie.GugleFileActivity");
                        Intent intent5 = new Intent();
                        intent5.setComponent(componet);
                        intent5.addFlags(268435456);
                        intent5.setAction("android.intent.action.MAIN");
                        intent5.addCategory("android.intent.category.LAUNCHER");
                        intent5.putExtra("language", type);
                        intent5.putExtra("OPEN_FILE", AppEnvironment.HOMEPATH);
                        try {
                            String OPEN_DCIM = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM).toString();
                            Log.i(TAG, "OPEN_DCIM==" + OPEN_DCIM);
                            intent5.putExtra("OPEN_DCIM", OPEN_DCIM);
                        } catch (Exception e6) {
                            e6.printStackTrace();
                        }
                        startActivity(intent5, "com.edutech.myfiles");
                    }
                    break;
                }
            case R.id.nine_img /* 2131362163 */:
            case R.id.ll_nine /* 2131362180 */:
                if (AppEnvironment.isDEMO) {
                    PackageManager pm5 = getPackageManager();
                    Intent intent6 = pm5.getLaunchIntentForPackage(AppEnvironment.YOUDAO_PACKNAME);
                    intent6.addFlags(335544320);
                    if (intent6 != null) {
                        startActivity(intent6, AppEnvironment.YOUDAO_PACKNAME);
                        break;
                    }
                } else if (AppEnvironment.isCJLY || AppEnvironment.isHT || AppEnvironment.isYWYT || AppEnvironment.isYWJD || AppEnvironment.isCH || AppEnvironment.isXH || AppEnvironment.isXF || AppEnvironment.isYWHZ || AppEnvironment.isSPYZ || AppEnvironment.isLJNLDN || AppEnvironment.isPDSSZ || AppEnvironment.isPDS || AppEnvironment.isDISABLE4 || AppEnvironment.isLJLD || AppEnvironment.isSMX || AppEnvironment.isXXJ || AppEnvironment.isZBYZ || AppEnvironment.isNJLZ || AppEnvironment.isNLEZ || AppEnvironment.isNL || !AppEnvironment.NINE_IMG || AppEnvironment.isSNZT) {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                } else {
                    try {
                        PackageInfo pinfo9 = getPackageManager().getPackageInfo("com.edutech.jxhd", 0);
                        if (pinfo9 != null) {
                            ComponentName component9 = new ComponentName("com.edutech.jxhd", "com.edutech.jxhd.MainActivity");
                            Intent intent_book9 = new Intent();
                            intent_book9.addCategory("android.intent.category.LAUNCHER");
                            intent_book9.setComponent(component9);
                            intent_book9.setAction("android.intent.action.MAIN");
                            intent_book9.setFlags(268435456);
                            startActivity(intent_book9, "com.edutech.jxhd");
                            break;
                        }
                    } catch (PackageManager.NameNotFoundException e19) {
                        e19.printStackTrace();
                        Toast.makeText(this, "请安装指定应用！", 0).show();
                        break;
                    } catch (Exception e7) {
                        Toast.makeText(this, "请安装指定应用！", 0).show();
                        break;
                    }
                }
                break;
            case R.id.ten_img /* 2131362165 */:
            case R.id.ll_ten /* 2131362181 */:
                if (AppEnvironment.isDEMO) {
                    PackageManager pm6 = getPackageManager();
                    Intent intent7 = pm6.getLaunchIntentForPackage("org.hisand.zidian.zhs");
                    intent7.addFlags(335544320);
                    if (intent7 != null) {
                        startActivity(intent7, "org.hisand.zidian.zhs");
                        break;
                    }
                } else if (AppEnvironment.isCJLY || AppEnvironment.isHT || AppEnvironment.isPDSSZ || AppEnvironment.isYWYT || AppEnvironment.isYWJD || AppEnvironment.isCH || AppEnvironment.isXH || AppEnvironment.isXF || AppEnvironment.isSPYZ || AppEnvironment.isDISABLE4 || AppEnvironment.isSMX || AppEnvironment.isXXJ || AppEnvironment.isZBYZ || AppEnvironment.isNJLZ || !AppEnvironment.TEN_IMG || AppEnvironment.isSNZT || AppEnvironment.isSNZT) {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                } else {
                    try {
                        packageInfo_taolun = getPackageManager().getPackageInfo("com.edutech.hudongtaolun", 0);
                    } catch (PackageManager.NameNotFoundException e8) {
                        packageInfo_taolun = null;
                        e8.printStackTrace();
                        Toast.makeText(this, "该应用未安装！", 0).show();
                    }
                    if (packageInfo_taolun != null) {
                        ComponentName componet2 = new ComponentName("com.edutech.hudongtaolun", "com.edutech.hudongtaolun.MainActivity");
                        Intent intent22 = new Intent();
                        intent22.setComponent(componet2);
                        intent22.addFlags(268435456);
                        intent22.setAction("android.intent.action.MAIN");
                        intent22.addCategory("android.intent.category.LAUNCHER");
                        SharedPreferences sharePre = getSharedPreferences("privatekey", 0);
                        String privatekey = sharePre.getString("key", "");
                        String ip = sharePre.getString("apihost", "");
                        String username = sharePre.getString("name", "");
                        if (ip == null || ip.equals("") || username == null || username.equals("") || privatekey == null || privatekey.equals("")) {
                            HashMap<String, String> hashmap = XmlLoadHelper.loadXml();
                            if (hashmap != null) {
                                ip = hashmap.get("ip");
                                username = hashmap.get("usercode");
                                privatekey = hashmap.get("privatekey");
                            } else {
                                return;
                            }
                        }
                        intent22.putExtra("ip", ip);
                        intent22.putExtra("privatekey", privatekey);
                        intent22.putExtra("name", username);
                        intent22.putExtra("language", type);
                        startActivity(intent22, "com.edutech.hudongtaolun");
                        break;
                    }
                }
                break;
            case R.id.eleven_img /* 2131362167 */:
            case R.id.ll_eleven /* 2131362182 */:
                Intent intent8 = new Intent( CloudClientActivity.this, PasswdDialogActivity.class);
                intent8.addFlags(335544320);
                startActivity(intent8);
                break;
            case R.id.twelve_img /* 2131362169 */:
            case R.id.ll_twelve /* 2131362179 */:
                if (AppEnvironment.isDEMO) {
                    PackageManager pm8 = getPackageManager();
                    Intent intent9 = pm8.getLaunchIntentForPackage("com.xueersi.parentsmeeting");
                    intent9.addFlags(335544320);
                    if (intent9 != null) {
                        startActivity(intent9, "com.xueersi.parentsmeeting");
                        break;
                    }
                } else if (AppEnvironment.TWELVE_IMG) {
                    Intent intent23 = new Intent("android.intent.action.MAIN");
                    intent23.addCategory("android.intent.category.LAUNCHER");
                    intent23.addFlags(268435456);
                    ComponentName cn = new ComponentName(AppEnvironment.INTERACTION_PACKNAME, AppEnvironment.INTERACTION_APPNAME);
                    intent23.setComponent(cn);
                    intent23.putExtra("language", type);
                    try {
                        packageInfo2 = getPackageManager().getPackageInfo(AppEnvironment.INTERACTION_PACKNAME, 0);
                    } catch (PackageManager.NameNotFoundException e9) {
                        packageInfo2 = null;
                        e9.printStackTrace();
                        Toast.makeText(this, "该应用未安装！", 0).show();
                    }
                    if (packageInfo2 != null) {
                        startActivity(intent23, AppEnvironment.INTERACTION_PACKNAME);
                        break;
                    }
                } else {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                }
                break;
            case R.id.thirteen_img /* 2131362208 */:
                try {
                    PackageInfo pinfo10 = getPackageManager().getPackageInfo("com.edutech.eword", 0);
                    if (pinfo10 != null) {
                        ComponentName component10 = new ComponentName("com.edutech.eword", "com.edutech.eword.HomePageActivity");
                        Intent intent_book10 = new Intent();
                        intent_book10.addCategory("android.intent.category.LAUNCHER");
                        intent_book10.setComponent(component10);
                        intent_book10.setAction("android.intent.action.MAIN");
                        intent_book10.setFlags(268435456);
                        startActivity(intent_book10, "com.edutech.eword");
                        break;
                    }
                } catch (PackageManager.NameNotFoundException e110) {
                    e110.printStackTrace();
                    break;
                }
                break;
        }
        if ("".length() > 0 && "".length() > 0) {
            ComponentName componet3 = new ComponentName("", "");
            Intent intent10 = new Intent();
            intent10.setComponent(componet3);
            intent10.addFlags(268435456);
            intent10.setAction("android.intent.action.MAIN");
            intent10.addCategory("android.intent.category.LAUNCHER");
            startActivity(intent10, "");
        }
    }

    private void startActivity(Intent intent, String pkg) {
        startActivity(intent);
    }

    private boolean isApkUpdating(String pkg) {
        return true;
    }

    private void showNoticeDialog(String title, String message) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        if (!TextUtils.isEmpty(title)) {
            builder.setTitle(title);
        }
        if (!TextUtils.isEmpty(message)) {
            builder.setMessage(message);
        }
        builder.setPositiveButton(getResources().getString(R.string.dialog_noticebutton), new DialogInterface.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.25
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });
        AlertDialog dialog = builder.create();
        dialog.show();
    }

    private void openSetting() {
        try {
            PackageInfo pinfo = getPackageManager().getPackageInfo("com.edutech.settingapp", 0);
            if (pinfo != null) {
                ComponentName component = new ComponentName("com.edutech.settingapp", "com.edutech.settingapp.CloudClientSetActivity");
                Intent intent_book = new Intent();
                intent_book.addCategory("android.intent.category.LAUNCHER");
                intent_book.setComponent(component);
                intent_book.setAction("android.intent.action.MAIN");
                intent_book.setFlags(268435456);
                startActivity(intent_book);
                return;
            }
        } catch (PackageManager.NameNotFoundException e1) {
            e1.printStackTrace();
        }
        openActivity(CloudClientSetActivity.class);
    }

    private void openCamera() {
        try {
            PackageInfo pinfo = getPackageManager().getPackageInfo("com.edutech.mycamera", 0);
            if (pinfo != null) {
                ComponentName component = new ComponentName("com.edutech.mycamera", "com.edutech.mycamera.gallery.PhotoPickerActivity");
                Intent intent_book = new Intent();
                intent_book.addCategory("android.intent.category.LAUNCHER");
                intent_book.setComponent(component);
                intent_book.setAction("android.intent.action.MAIN");
                intent_book.setFlags(268435456);
                startActivity(intent_book);
                return;
            }
        } catch (PackageManager.NameNotFoundException e1) {
            e1.printStackTrace();
        } catch (Exception e) {
        }
        if (AppEnvironment.isZBYZ) {
            Toast.makeText(this, "该功能暂不开放！", 0).show();
            return;
        }
        try {
            Intent infoIntent = new Intent("android.media.action.IMAGE_CAPTURE");
            ResolveInfo res = getPackageManager().resolveActivity(infoIntent, 0);
            String packageName = res.activityInfo.packageName;
            String classname = res.activityInfo.name;
            Intent mIntent = new Intent();
            ComponentName comp = new ComponentName(packageName, classname);
            mIntent.setComponent(comp);
            mIntent.setAction("android.intent.action.MAIN");
            startActivity(mIntent);
        } catch (Exception e2) {
            e2.printStackTrace();
            Intent intentP = new Intent("android.media.action.IMAGE_CAPTURE");
            startActivity(intentP);
        }
    }

    public static boolean isServiceExisted(Context context, String className) {
        ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
        List<ActivityManager.RunningServiceInfo> serviceList = activityManager.getRunningServices(Execute.INVALID);
        if (serviceList.size() <= 0) {
            return false;
        }
        for (int i = 0; i < serviceList.size(); i++) {
            ActivityManager.RunningServiceInfo serviceInfo = serviceList.get(i);
            ComponentName serviceName = serviceInfo.service;
            if (serviceName.getClassName().equals(className)) {
                return true;
            }
        }
        return false;
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == 4) {
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void installNewApk() {
        
    }

    private void apkinstall_samsung(String apkpath) {
        
    }

    private void apkinstall(String apkpath) {
        
    }

    private void apkIntentInstall(String apkpath) {
        
    }

    public static boolean SlientInstall(String apkPath) throws IOException {
        return true;
    }

    /* loaded from: classes.dex */
    class BatteryReceiver extends BroadcastReceiver {
        BatteryReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if ("android.intent.action.BATTERY_CHANGED".equals(intent.getAction())) {
                int level = intent.getIntExtra("level", 0);
                int scale = intent.getIntExtra("scale", 100);
                int status = intent.getIntExtra("status", -1);
                Message msg = CloudClientActivity.this.batteryChangedHandler.obtainMessage();
                msg.arg1 = (level * 100) / scale;
                msg.arg2 = status;
                msg.sendToTarget();
            }
        }
    }

    public void userLicenseAgreementDialog() {
        View view = View.inflate(this, R.layout.layout_userlicense_new, null);
        this.btnYes = (Button) view.findViewById(R.id.btnYes);
        TextView tvUserLiceseContent = (TextView) view.findViewById(R.id.tvUserLiceseContent);
        this.scrollView = (ScrollView) view.findViewById(R.id.ScrollView);
        tvUserLiceseContent.setText(getDataFromAssets("UserLicenseAgreement.txt"));
        final AlertDialog dialog = new AlertDialog.Builder(this).setView(view).setOnKeyListener(this.keylistener).setCancelable(false).show();
        this.scrollView.setOnTouchListener(new TouchListenerImpl(this, null));
        this.btnYes.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.26
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                CloudClientActivity.this.agreement_sp = CloudClientActivity.this.getSharedPreferences("myAgreement", 0);
                CloudClientActivity.this.agreement_sp.edit().putBoolean("agreement_key", true).commit();
                dialog.dismiss();
            }
        });
    }

    public void userBeiAnDialog() {
        View view = View.inflate(this, R.layout.layout_userlicense_new, null);
        this.btnYes = (Button) view.findViewById(R.id.btnYes);
        TextView tvUserLiceseContent = (TextView) view.findViewById(R.id.tvUserLiceseContent);
        this.scrollView = (ScrollView) view.findViewById(R.id.ScrollView);
        tvUserLiceseContent.setText(getDataFromAssets("beianlicense.txt"));
        this.cb = (CheckBox) view.findViewById(R.id.cbnoshow);
        final AlertDialog dialog = new AlertDialog.Builder(this).setView(view).setOnKeyListener(this.keylistener).setCancelable(false).show();
        this.btnYes.setEnabled(true);
        this.btnYes.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.27
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (CloudClientActivity.this.cb != null && CloudClientActivity.this.cb.isChecked()) {
                    CloudClientActivity.this.agreement_sp = CloudClientActivity.this.getSharedPreferences("myAgreement", 0);
                    CloudClientActivity.this.agreement_sp.edit().putBoolean("agreement_key", true).commit();
                }
                dialog.dismiss();
            }
        });
    }

    public String getDataFromAssets(String filePath) {
        Throwable th;
        BufferedReader br = null;
        StringBuffer sb = new StringBuffer();
        try {
            try {
                BufferedReader br2 = new BufferedReader(new InputStreamReader(getAssets().open(filePath)));
                while (true) {
                    try {
                        String line = br2.readLine();
                        if (line != null) {
                            sb.append(String.valueOf(line) + "\n");
                        } else {
                            break;
                        }
                    } catch (IOException e2) {
                        br = br2;
                        try {
                            br.close();
                        } catch (IOException e3) {
                            e3.printStackTrace();
                        }
                        return sb.toString();
                    } catch (Throwable th2) {
                        th = th2;
                        br = br2;
                        try {
                            br.close();
                        } catch (IOException e4) {
                            e4.printStackTrace();
                        }
                        throw th;
                    }
                }
                br2.close();
            } catch (IOException e5) {
            }
            return sb.toString();
        } catch (Throwable th3) {
            return "";
        }
    }

    /* loaded from: classes.dex */
    private class TouchListenerImpl implements View.OnTouchListener {
        private TouchListenerImpl() {
        }

        /* synthetic */ TouchListenerImpl(CloudClientActivity cloudClientActivity, TouchListenerImpl touchListenerImpl) {
            this();
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View view, MotionEvent motionEvent) {
            switch (motionEvent.getAction()) {
                case 2:
                    int scrollY = view.getScrollY();
                    int height = view.getHeight();
                    int scrollViewMeasuredHeight = CloudClientActivity.this.scrollView.getChildAt(0).getMeasuredHeight();
                    if (scrollViewMeasuredHeight > 20) {
                        scrollViewMeasuredHeight -= 20;
                    }
                    if (scrollY + height > scrollViewMeasuredHeight) {
                        CloudClientActivity.this.btnYes.setEnabled(true);
                        break;
                    }
                    break;
            }
            return false;
        }
    }

    public String getWIFISSID(Activity activity) {
        if (Build.VERSION.SDK_INT >= 26) {
            ConnectivityManager ctm = (ConnectivityManager) getSystemService("connectivity");
            NetworkInfo networkInfo = ctm.getActiveNetworkInfo();
            String ssid = networkInfo.getExtraInfo();
            if (ssid == null) {
                WifiManager wifiManager = (WifiManager) getSystemService("wifi");
                WifiInfo wifiInfo = wifiManager.getConnectionInfo();
                String ssid2 = wifiInfo.getSSID();
                if (ssid2 == null) {
                    return "unknown ssid";
                }
                return ssid2;
            }
            return ssid;
        }
        WifiManager wifiManager2 = (WifiManager) getSystemService("wifi");
        WifiInfo wifiInfo2 = wifiManager2.getConnectionInfo();
        return wifiInfo2.getSSID();
    }

    /* loaded from: classes.dex */
    class WifiReceiver extends BroadcastReceiver {
        WifiReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (action.equals("android.net.wifi.STATE_CHANGE")) {
                NetworkInfo info = (NetworkInfo) intent.getParcelableExtra("networkInfo");
                if (info.getState().equals(NetworkInfo.State.DISCONNECTED)) {
                    CloudClientActivity.this.tv_wifi.setText(String.valueOf(CloudClientActivity.this.getString(R.string.wifi_name)) + CloudClientActivity.this.getString(R.string.disconnected));
                } else if (info.getState().equals(NetworkInfo.State.CONNECTED)) {
                    try {
                        CloudClientActivity.this.tv_wifi.setText(String.valueOf(CloudClientActivity.this.getString(R.string.wifi_name)) + CloudClientActivity.this.getWIFISSID(CloudClientActivity.this));
                    } catch (Exception e) {
                        WifiManager wifiManager = (WifiManager) context.getSystemService("wifi");
                        WifiInfo wifiInfo = wifiManager.getConnectionInfo();
                        CloudClientActivity.this.tv_wifi.setText(String.valueOf(CloudClientActivity.this.getString(R.string.wifi_name)) + wifiInfo.getSSID());
                    }
                    CloudClientActivity.this.getDesignView();
                    CloudClientActivity.this.apkUpdate();
                }
            } else if (action.equals(sysProtectService.SERVICE_START)) {
                CloudClientActivity.this.lockPad();
            } else if (action.equals("edm.intent.action.license.status")) {
                int errorcode = intent.getIntExtra("edm.intent.extra.license.errorcode", -1);
                if (errorcode == 601 || intent.getIntExtra("edm.intent.extra.license.result_type", -1) != 800) {
                    CloudClientActivity.this.LicenseOK = false;
                    Log.e("license", "license fail");
                    SharedPreferences sp = CloudClientActivity.this.getSharedPreferences("license", 0);
                    sp.edit().putBoolean("licenseok", false).commit();
                    return;
                }
                CloudClientActivity.this.LicenseOK = true;
                SharedPreferences sp2 = CloudClientActivity.this.getSharedPreferences("license", 0);
                sp2.edit().putBoolean("licenseok", true).commit();
                Log.e("license", "license ok");
            } else {
                action.equals("com.edutech.getadmin");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showFailedApkInfo() {
        if (this.canRefresh) {
            if (!AppEnvironment.isNewUpdate) {
                if (this.tv_updatemsg != null) {
                    this.tv_updatemsg.setVisibility(4);
                    return;
                }
                return;
            }
            try {
                if (this.tv_updatemsg != null) {
                    SharedPreferences sharePre = getSharedPreferences("privatekey", 0);
                    String ip = sharePre.getString("apihost", "");
                    List<String> failedApks = Utils.getFailedEbagUpdated(this, ip);
                    if (failedApks == null || failedApks.size() <= 0) {
                        this.tv_updatemsg.setVisibility(8);
                        return;
                    }
                    String failedStr = getResources().getString(R.string.uninstallapks);
                    for (int i = 0; i < failedApks.size(); i++) {
                        failedStr = String.valueOf(failedStr) + failedApks.get(i) + "  ";
                    }
                    this.tv_updatemsg.setVisibility(0);
                    this.tv_updatemsg.setText(failedStr);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getWeekDay(int index) {
        switch (index) {
            case 1:
                String weekday = getResources().getString(R.string.sunday);
                return weekday;
            case 2:
                String weekday2 = getResources().getString(R.string.monday);
                return weekday2;
            case 3:
                String weekday3 = getResources().getString(R.string.tuesday);
                return weekday3;
            case 4:
                String weekday4 = getResources().getString(R.string.wednesday);
                return weekday4;
            case 5:
                String weekday5 = getResources().getString(R.string.thursday);
                return weekday5;
            case 6:
                String weekday6 = getResources().getString(R.string.friday);
                return weekday6;
            case 7:
                String weekday7 = getResources().getString(R.string.saturday);
                return weekday7;
            default:
                return "";
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getMonth(int index) {
        switch (index) {
            case 0:
                return "Jan";
            case 1:
                return "Feb";
            case 2:
                return "Mar";
            case 3:
                return "Apr";
            case 4:
                return "May";
            case 5:
                return "Jun";
            case 6:
                return "Jul";
            case 7:
                return "Aug";
            case 8:
                return "Sept";
            case 9:
                return "Oct";
            case 10:
                return "Nov";
            case 11:
                return "Dec";
            default:
                return "";
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getMyWorkNotification() {
        JSONArray jarray;
        SharedPreferences sharePre = getSharedPreferences("privatekey", 0);
        String ip = sharePre.getString("apihost", "");
        String username = sharePre.getString("name", "");
        String privatekey = sharePre.getString("key", "");
        if (ip == null || ip.equals("") || username == null || username.equals("")) {
            HashMap<String, String> hashmap = XmlLoadHelper.loadXml();
            if (hashmap != null) {
                ip = hashmap.get("ip");
                username = hashmap.get("usercode");
                String privatekey2 = hashmap.get("privatekey");
                privatekey = privatekey2;
            } else {
                return;
            }
        }
        String url = "http://" + ip + "/api/notification/";
        if (username != null && !username.equals("")) {
            this.noticeNum = 0;
            this.noticeMessages = new ArrayList();
            Log.e("notification", "url:" + url);
            String json = HttpUtils.getNotification(url, username, privatekey);
            Log.e("notification", "json:" + json);
            if (json != null && !"".equals(json)) {
                try {
                    JSONObject jobj = new JSONObject(json);
                    boolean status = jobj.getBoolean("status");
                    JSONObject jdata = jobj.getJSONObject("data");
                    if (status && jdata != null) {
                        int count = jdata.getInt(KeyEnvironment.COUNT);
                        this.noticeNum = count;
                        if (jdata.has("Message") && (jarray = jdata.getJSONArray("Message")) != null && jarray.length() > 0) {
                            for (int i = 0; i < jarray.length(); i++) {
                                Noticebean bean = new Noticebean();
                                JSONObject ob = jarray.getJSONObject(i);
                                bean.setActionid(ob.getString("ActionID"));
                                bean.setCreattime(ob.getString("create"));
                                bean.setMessage(ob.getString("message"));
                                bean.setMessageid(ob.getString("messageid"));
                                this.noticeMessages.add(bean);
                            }
                        }
                        Message msg = this.noticeHandler.obtainMessage();
                        msg.arg1 = count;
                        msg.what = 1;
                        msg.sendToTarget();
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                } catch (Exception e2) {
                }
            }
            if (json == null || json.equals("")) {
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showNoticeDetails() {
        if (this.canRefresh) {
            if (this.noticeDialog == null) {
                AlertDialog.Builder builder = new AlertDialog.Builder(this);
                View view = LayoutInflater.from(this).inflate(R.layout.dialog_noticemessage, (ViewGroup) null);
                this.dialog_noticemessage_listview = (ListView) view.findViewById(R.id.dialog_noticemessage_listview);
                this.dialog_noticemessage_tvnotice = (TextView) view.findViewById(R.id.dialog_noticemessage_tvnotice);
                this.dialog_noticemessage_tvok = (TextView) view.findViewById(R.id.dialog_noticemessage_tvok);
                this.noticeAdapter = new NoticeAdapter();
                this.dialog_noticemessage_listview.setAdapter((ListAdapter) this.noticeAdapter);
                this.dialog_noticemessage_tvok.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.28
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        if (CloudClientActivity.this.noticeDialog != null) {
                            CloudClientActivity.this.noticeDialog.dismiss();
                        }
                    }
                });
                builder.setView(view);
                this.noticeDialog = builder.create();
            }
            if (this.noticeNum > 0) {
                SharedPreferences callSp = getSharedPreferences("noticemessage", 0);
                long time = callSp.getLong("noticetime", 0L);
                long current = System.currentTimeMillis();
                if (current - time >= 3600000) {
                    callSp.edit().putLong("noticetime", current).commit();
                    if (this.dialog_noticemessage_listview != null && this.noticeMessages != null && this.noticeAdapter != null) {
                        this.noticeAdapter.setDatas(this.noticeMessages);
                    }
                    if (this.dialog_noticemessage_tvnotice != null) {
                        this.dialog_noticemessage_tvnotice.setText("未查看作业：" + this.noticeNum + "份");
                    }
                    this.noticeDialog.show();
                }
            }
        }
    }

    /* loaded from: classes.dex */
    class NoticeAdapter extends BaseAdapter {
        private List<Noticebean> noticeMsgs = new ArrayList();

        NoticeAdapter() {
        }

        public void setDatas(List<Noticebean> datas) {
            this.noticeMsgs = datas;
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return this.noticeMsgs.size();
        }

        @Override // android.widget.Adapter
        public Object getItem(int arg0) {
            return this.noticeMsgs.get(arg0);
        }

        @Override // android.widget.Adapter
        public long getItemId(int position) {
            return position;
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            Holder holder;
            if (convertView == null) {
                convertView = LayoutInflater.from(CloudClientActivity.this).inflate(R.layout.discuss_adapter, (ViewGroup) null);
                holder = new Holder();
                holder.discuss_adapter_web = (TextView) convertView.findViewById(R.id.discuss_adapter_web);
                convertView.setTag(holder);
            } else {
                holder = (Holder) convertView.getTag();
            }
            holder.discuss_adapter_web.setText("作业: " + this.noticeMsgs.get(position).getMessage());
            holder.discuss_adapter_web.setTextColor(CloudClientActivity.this.getResources().getColor(R.color.gray_color));
            return convertView;
        }

        /* loaded from: classes.dex */
        class Holder {
            TextView discuss_adapter_web;

            Holder() {
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void broadEyeProc(Context mContext, boolean boo) {
        Intent intent1 = new Intent();
        intent1.setAction("com.android.eyeprotection");
        intent1.putExtra("ep_mode", boo);
        mContext.sendBroadcast(intent1);
    }
}
