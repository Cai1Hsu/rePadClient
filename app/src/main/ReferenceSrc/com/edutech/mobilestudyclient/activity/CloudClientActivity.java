package com.edutech.mobilestudyclient.activity;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlertDialog;
import android.app.admin.DevicePolicyManager;
import android.app.enterprise.EnterpriseDeviceManager;
import android.app.enterprise.RestrictionPolicy;
import android.app.enterprise.kioskmode.KioskMode;
import android.app.enterprise.license.EnterpriseLicenseManager;
import android.app.enterprise.multiuser.MultiUserManager;
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
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.SQLExec;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/CloudClientActivity.class */
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

    /* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/CloudClientActivity$BatteryReceiver.class */
    class BatteryReceiver extends BroadcastReceiver {
        BatteryReceiver() {
            CloudClientActivity.this = r4;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if ("android.intent.action.BATTERY_CHANGED".equals(intent.getAction())) {
                int intExtra = intent.getIntExtra("level", 0);
                int intExtra2 = intent.getIntExtra("scale", 100);
                int intExtra3 = intent.getIntExtra("status", -1);
                Message obtainMessage = CloudClientActivity.this.batteryChangedHandler.obtainMessage();
                obtainMessage.arg1 = (intExtra * 100) / intExtra2;
                obtainMessage.arg2 = intExtra3;
                obtainMessage.sendToTarget();
            }
        }
    }

    /* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/CloudClientActivity$HostPwd.class */
    class HostPwd extends Thread {
        HostPwd() {
            CloudClientActivity.this = r4;
        }

        /* JADX WARN: Code restructure failed: missing block: B:13:0x0056, code lost:
            if (r0.equals("") != false) goto L14;
         */
        @Override // java.lang.Thread, java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public void run() {
            String str;
            SharedPreferences sharedPreferences = CloudClientActivity.this.getSharedPreferences("privatekey", 0);
            String string = sharedPreferences.getString("key", "");
            String string2 = sharedPreferences.getString("apihost", "");
            String string3 = sharedPreferences.getString("name", "");
            if (string2 != null && !string2.equals("") && string3 != null && !string3.equals("") && string != null) {
                str = string;
            }
            HashMap<String, String> loadXml = XmlLoadHelper.loadXml();
            if (loadXml == null) {
                return;
            }
            String str2 = loadXml.get("ip");
            String str3 = loadXml.get("usercode");
            String str4 = loadXml.get("privatekey");
            string2 = str2;
            str = str4;
            string3 = str3;
            if (str2 != null) {
                string2 = str2;
                str = str4;
                string3 = str3;
                if (str3 != null) {
                    string2 = str2;
                    str = str4;
                    string3 = str3;
                    if (str4 != null) {
                        sharedPreferences.edit().putString("key", str4).commit();
                        sharedPreferences.edit().putString("apihost", str2).commit();
                        sharedPreferences.edit().putString("name", str3).commit();
                        string3 = str3;
                        str = str4;
                        string2 = str2;
                    }
                }
            }
            String str5 = "http://" + string2 + "/api/padpwd";
            HttpPost httpPost = new HttpPost(str5);
            httpPost.addHeader("X-Edutech-Entity", string3);
            long currentTimeMillis = System.currentTimeMillis();
            httpPost.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + My_md5.Md5(String.valueOf(currentTimeMillis) + string3 + str));
            DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
            Log.e("hhh", str5);
            try {
                HttpResponse execute = defaultHttpClient.execute(httpPost);
                Log.e("hhh", "code:" + execute.getStatusLine().getStatusCode());
                String string4 = new JSONObject(CloudClientActivity.this.getJsonStringFromGZIP(execute)).getString("data");
                Log.e("hhh", string4);
                File file = new File(String.valueOf(AppEnvironment.PWDFILEPATH) + string2 + "pwd.xml");
                if (file.exists() && string4 != null && !string4.equals("")) {
                    file.delete();
                }
                file.createNewFile();
                FileOutputStream fileOutputStream = new FileOutputStream(file);
                fileOutputStream.write(string4.getBytes());
                if (fileOutputStream == null) {
                    return;
                }
                fileOutputStream.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter.class */
    class NoticeAdapter extends BaseAdapter {
        private List<Noticebean> noticeMsgs = new ArrayList();

        /* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter$Holder.class */
        class Holder {
            TextView discuss_adapter_web;

            Holder() {
                NoticeAdapter.this = r4;
            }
        }

        NoticeAdapter() {
            CloudClientActivity.this = r5;
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return this.noticeMsgs.size();
        }

        @Override // android.widget.Adapter
        public Object getItem(int i) {
            return this.noticeMsgs.get(i);
        }

        @Override // android.widget.Adapter
        public long getItemId(int i) {
            return i;
        }

        @Override // android.widget.Adapter
        public View getView(int i, View view, ViewGroup viewGroup) {
            Holder holder;
            if (view == null) {
                view = LayoutInflater.from(CloudClientActivity.this).inflate(R.layout.discuss_adapter, (ViewGroup) null);
                holder = new Holder();
                holder.discuss_adapter_web = (TextView) view.findViewById(R.id.discuss_adapter_web);
                view.setTag(holder);
            } else {
                holder = (Holder) view.getTag();
            }
            holder.discuss_adapter_web.setText("作业: " + this.noticeMsgs.get(i).getMessage());
            holder.discuss_adapter_web.setTextColor(CloudClientActivity.this.getResources().getColor(R.color.gray_color));
            return view;
        }

        public void setDatas(List<Noticebean> list) {
            this.noticeMsgs = list;
        }
    }

    /* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/CloudClientActivity$TouchListenerImpl.class */
    private class TouchListenerImpl implements View.OnTouchListener {
        private TouchListenerImpl() {
            CloudClientActivity.this = r4;
        }

        /* synthetic */ TouchListenerImpl(CloudClientActivity cloudClientActivity, TouchListenerImpl touchListenerImpl) {
            this();
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View view, MotionEvent motionEvent) {
            switch (motionEvent.getAction()) {
                case 0:
                case 1:
                default:
                    return false;
                case 2:
                    int scrollY = view.getScrollY();
                    int height = view.getHeight();
                    int measuredHeight = CloudClientActivity.this.scrollView.getChildAt(0).getMeasuredHeight();
                    int i = measuredHeight;
                    if (measuredHeight > 20) {
                        i = measuredHeight - 20;
                    }
                    if (scrollY + height <= i) {
                        return false;
                    }
                    CloudClientActivity.this.btnYes.setEnabled(true);
                    return false;
            }
        }
    }

    /* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread.class */
    class UpdateThread extends Thread {
        UpdateThread() {
            CloudClientActivity.this = r4;
        }

        /* JADX WARN: Code restructure failed: missing block: B:195:0x0578, code lost:
            r27 = java.lang.Long.parseLong(r0.get("versioncode"));
         */
        /* JADX WARN: Code restructure failed: missing block: B:19:0x007e, code lost:
            if (r0.equals("") != false) goto L20;
         */
        /* JADX WARN: Code restructure failed: missing block: B:208:0x05b4, code lost:
            r29 = move-exception;
         */
        /* JADX WARN: Code restructure failed: missing block: B:210:0x05ba, code lost:
            r29.printStackTrace();
         */
        /* JADX WARN: Code restructure failed: missing block: B:211:0x05c1, code lost:
            r27 = 1;
         */
        /* JADX WARN: Code restructure failed: missing block: B:218:0x05e7, code lost:
            r27 = 1;
         */
        /* JADX WARN: Code restructure failed: missing block: B:63:0x0201, code lost:
            if (r0 == 0) goto L64;
         */
        /* JADX WARN: Removed duplicated region for block: B:148:0x045f  */
        @Override // java.lang.Thread, java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public void run() {
            String str;
            boolean z;
            boolean z2;
            int i;
            long j;
            boolean z3;
            HashMap<String, String> next;
            long j2;
            CloudClientActivity.this.isGetApks = true;
            try {
                Thread.sleep(4000L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            if (CloudClientActivity.this.addApksList != null) {
                CloudClientActivity.this.addApksList.clear();
            } else {
                CloudClientActivity.this.addApksList = new ArrayList();
            }
            CloudClientActivity.this.launcherPath = "";
            SharedPreferences sharedPreferences = CloudClientActivity.this.getSharedPreferences("privatekey", 0);
            String string = sharedPreferences.getString("key", "");
            String string2 = sharedPreferences.getString("apihost", "");
            String string3 = sharedPreferences.getString("name", "");
            if (string2 != null && !string2.equals("") && string3 != null && !string3.equals("") && string != null) {
                str = string;
            }
            HashMap<String, String> loadXml = XmlLoadHelper.loadXml();
            if (loadXml == null) {
                return;
            }
            string2 = loadXml.get("ip");
            string3 = loadXml.get("usercode");
            str = loadXml.get("privatekey");
            HttpPost httpPost = new HttpPost("http://" + string2 + "/api/app/projectcode/ebag/os/android/");
            httpPost.addHeader("X-Edutech-Entity", string3);
            long currentTimeMillis = System.currentTimeMillis();
            httpPost.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + My_md5.Md5(String.valueOf(currentTimeMillis) + string3 + str));
            DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
            ArrayList arrayList = new ArrayList();
            z = false;
            boolean z4 = false;
            try {
                JSONObject jSONObject = new JSONObject(CloudClientActivity.this.getJsonStringFromGZIP(defaultHttpClient.execute(httpPost)));
                boolean z5 = jSONObject.getBoolean("status");
                int i2 = jSONObject.getInt("errorNum");
                CloudClientActivity.this.apkUpdateList = new ArrayList();
                CloudClientActivity.this.apkUpdatePkgList = new ArrayList();
                CloudClientActivity.this.currentCacheLength = 0L;
                CloudClientActivity.this.currentCachePosition = 0L;
                new ApkUpdateBean();
                if (!z5) {
                    z2 = false;
                }
                CloudClientActivity.this.hasGeted = true;
                JSONArray jSONArray = jSONObject.getJSONArray("data");
                z2 = false;
                if (jSONArray != null) {
                    z2 = false;
                    if (jSONArray.length() > 0) {
                        ArrayList<HashMap<String, String>> systemInfo = SystemInfoHelper.getSystemInfo(new ArrayList(), CloudClientActivity.this);
                        i = 0;
                        while (i < jSONArray.length()) {
                            JSONObject jSONObject2 = jSONArray.getJSONObject(i);
                            boolean z6 = z;
                            jSONObject2.getString("appwebpath");
                            boolean z7 = z;
                            long j3 = jSONObject2.getLong("appsize");
                            boolean z8 = z;
                            jSONObject2.getString("apkname");
                            boolean z9 = z;
                            String string4 = jSONObject2.getString("versionname");
                            boolean z10 = z;
                            String string5 = jSONObject2.getString("packagename");
                            boolean z11 = z;
                            String string6 = jSONObject2.getString("versioncode");
                            j = 1;
                            try {
                                j = Long.parseLong(string6);
                            } catch (NumberFormatException e2) {
                            } catch (Exception e3) {
                            }
                            Iterator<HashMap<String, String>> it = systemInfo.iterator();
                            while (true) {
                                if (!it.hasNext()) {
                                    z3 = false;
                                    break;
                                }
                                next = it.next();
                                boolean z12 = z;
                                if (next.get("packagename") != null) {
                                    z4 = z;
                                    if (string5.equals(next.get("packagename"))) {
                                        break;
                                    }
                                }
                            }
                            boolean z13 = z;
                            if (!z3) {
                                z13 = z;
                                if (string5.equals("com.launcher.activity")) {
                                    z13 = true;
                                }
                                boolean z14 = z13;
                                CloudClientActivity.this.currentCacheLength += j3;
                                boolean z15 = z13;
                                boolean z16 = z13;
                                ApkUpdateBean apkUpdateBean = new ApkUpdateBean();
                                boolean z17 = z13;
                                apkUpdateBean.setPackagename(string5);
                                boolean z18 = z13;
                                apkUpdateBean.setApkDownloadSize(0L);
                                boolean z19 = z13;
                                apkUpdateBean.setApkSize(j3);
                                boolean z20 = z13;
                                apkUpdateBean.setInstallState(-1);
                                boolean z21 = z13;
                                apkUpdateBean.setApkLocalPath("");
                                boolean z22 = z13;
                                apkUpdateBean.setApkUrl(jSONObject2.getString("appwebpath"));
                                boolean z23 = z13;
                                apkUpdateBean.setAppName(jSONObject2.getString("apkname"));
                                boolean z24 = z13;
                                apkUpdateBean.setVersioncode(string6);
                                boolean z25 = z13;
                                apkUpdateBean.setVersionname(string4);
                                boolean z26 = z13;
                                CloudClientActivity.this.apkUpdateList.add(apkUpdateBean);
                                boolean z27 = z13;
                                CloudClientActivity.this.apkUpdatePkgList.add(string5);
                            }
                            i++;
                            z = z13;
                        }
                        boolean z28 = z;
                        boolean z29 = z;
                        Message message = new Message();
                        boolean z30 = z;
                        message.what = CloudClientActivity.START_PROGRESS;
                        boolean z31 = z;
                        CloudClientActivity.this.installHandler.sendMessage(message);
                        boolean z32 = z;
                        Utils.saveUpdateApks(CloudClientActivity.this.apkUpdateList, CloudClientActivity.this, string2);
                        boolean z33 = z;
                        List parseDownload = CloudClientActivity.this.parseDownload(arrayList, CloudClientActivity.this.apkUpdateList);
                        z2 = z;
                        if (CloudClientActivity.this.launcherPath != null) {
                            z2 = z;
                            if (!CloudClientActivity.this.launcherPath.equals("")) {
                                boolean z34 = z;
                                parseDownload.add(CloudClientActivity.this.launcherPath);
                                z4 = z;
                                CloudClientActivity.this.addApksList.add("com.launcher.activity");
                                z2 = z;
                            }
                        }
                    }
                }
            } catch (Exception e4) {
                e4.printStackTrace();
                z2 = z4;
            }
            if (CloudClientActivity.this.addApksList != null && CloudClientActivity.this.addApksList.size() > 0) {
                Intent intent = new Intent();
                intent.setAction(sysProtectService.ADDINSTALL);
                intent.putStringArrayListExtra("packages", CloudClientActivity.this.addApksList);
                CloudClientActivity.this.sendBroadcast(intent);
            }
            if (z2 && !TextUtils.isEmpty(CloudClientActivity.this.launcherPath)) {
                Message message2 = new Message();
                message2.what = 4;
                CloudClientActivity.this.installHandler.sendMessage(message2);
                CloudClientActivity.this.sendInstallMessage(-1, CloudClientActivity.this.launcherPath, CloudClientActivity.UPDATE_INSTALLSINGLE);
            }
            Message message3 = new Message();
            message3.what = 3;
            CloudClientActivity.this.installHandler.sendMessage(message3);
            CloudClientActivity.this.getSharedPreferences("resumeconfig", 0).edit().putLong("updateapks", System.currentTimeMillis()).commit();
            CloudClientActivity.this.isGetApks = false;
            return;
            boolean z35 = z;
            if (next.get("versioncode") != null) {
                boolean z36 = z;
                if (next.get("versionname") != null && j > j2) {
                    z3 = false;
                    boolean z132 = z;
                    if (!z3) {
                    }
                    i++;
                    z = z132;
                }
            }
            z3 = true;
            boolean z1322 = z;
            if (!z3) {
            }
            i++;
            z = z1322;
        }
    }

    /* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver.class */
    class WifiReceiver extends BroadcastReceiver {
        WifiReceiver() {
            CloudClientActivity.this = r4;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (action.equals("android.net.wifi.STATE_CHANGE")) {
                NetworkInfo networkInfo = (NetworkInfo) intent.getParcelableExtra("networkInfo");
                if (networkInfo.getState().equals(NetworkInfo.State.DISCONNECTED)) {
                    CloudClientActivity.this.tv_wifi.setText(String.valueOf(CloudClientActivity.this.getString(R.string.wifi_name)) + CloudClientActivity.this.getString(R.string.disconnected));
                } else if (!networkInfo.getState().equals(NetworkInfo.State.CONNECTED)) {
                } else {
                    try {
                        CloudClientActivity.this.tv_wifi.setText(String.valueOf(CloudClientActivity.this.getString(R.string.wifi_name)) + CloudClientActivity.this.getWIFISSID(CloudClientActivity.this));
                    } catch (Exception e) {
                        CloudClientActivity.this.tv_wifi.setText(String.valueOf(CloudClientActivity.this.getString(R.string.wifi_name)) + ((WifiManager) context.getSystemService("wifi")).getConnectionInfo().getSSID());
                    }
                    CloudClientActivity.this.getDesignView();
                    CloudClientActivity.this.apkUpdate();
                }
            } else if (action.equals(sysProtectService.SERVICE_START)) {
                CloudClientActivity.this.lockPad();
            } else if (!action.equals("edm.intent.action.license.status")) {
                action.equals("com.edutech.getadmin");
            } else if (intent.getIntExtra("edm.intent.extra.license.errorcode", -1) == 601 || intent.getIntExtra("edm.intent.extra.license.result_type", -1) != 800) {
                CloudClientActivity.this.LicenseOK = false;
                Log.e("license", "license fail");
                CloudClientActivity.this.getSharedPreferences("license", 0).edit().putBoolean("licenseok", false).commit();
            } else {
                CloudClientActivity.this.LicenseOK = true;
                CloudClientActivity.this.getSharedPreferences("license", 0).edit().putBoolean("licenseok", true).commit();
                Log.e("license", "license ok");
            }
        }
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
            public void handleMessage(Message message) {
                PackageInfo packageInfo;
                switch (message.what) {
                    case 1:
                        CloudClientActivity.this.installNewApk();
                        return;
                    case 3:
                        CloudClientActivity.this.updateThread = null;
                        CloudClientActivity.this.updateTime = HttpStatus.SC_MULTIPLE_CHOICES;
                        CloudClientActivity.this.showFailedApkInfo();
                        return;
                    case 4:
                        Intent intent = new Intent("android.intent.action.MAIN");
                        intent.addFlags(268435456);
                        intent.setComponent(new ComponentName("com.edutech.assistantdemo", "com.edutech.assistantdemo.MainActivity"));
                        try {
                            packageInfo = CloudClientActivity.this.getPackageManager().getPackageInfo("com.edutech.assistantdemo", 0);
                        } catch (PackageManager.NameNotFoundException e) {
                            packageInfo = null;
                            e.printStackTrace();
                        }
                        if (packageInfo == null) {
                            return;
                        }
                        CloudClientActivity.this.startActivity(intent);
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
                        CloudClientActivity.this.installSingleApk((String) message.obj);
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
                } else if (!action.equals("android.intent.action.STATUSBAR_VISIBILITY")) {
                } else {
                    CloudClientActivity.this.isInteraction = false;
                }
            }
        };
        this.callHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.3
            @Override // android.os.Handler
            public void handleMessage(Message message) {
                switch (message.what) {
                    case 0:
                        if (!CloudClientActivity.this.is3G.booleanValue()) {
                            return;
                        }
                        Intent intent = new Intent();
                        if (CloudClientActivity.this.isLenovo.booleanValue()) {
                            intent.setPackage("com.lenovo.ideafriend");
                            intent.setType("vnd.android-dir/mms-sms");
                        } else {
                            intent.setPackage("com.android.mms");
                            intent.setType("vnd.android-dir/mms-sms");
                            intent.setAction("android.intent.action.MAIN");
                        }
                        CloudClientActivity.this.startActivity(intent);
                        return;
                    case 1:
                        if (!CloudClientActivity.this.is3G.booleanValue() || !Build.DISPLAY.contains("TB-8703N")) {
                            if (!CloudClientActivity.this.is3G.booleanValue()) {
                                return;
                            }
                            Intent intent2 = new Intent();
                            intent2.setAction("android.intent.action.CALL_BUTTON");
                            CloudClientActivity.this.startActivity(intent2);
                            return;
                        }
                        Intent intent3 = new Intent();
                        intent3.setClassName("com.android.dialer", "com.android.dialer.DialtactsActivity");
                        intent3.setFlags(268435456);
                        intent3.setFlags(536870912);
                        CloudClientActivity.this.startActivity(intent3);
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
                Looper.prepare();
                int checkIDAuth = CloudClientActivity.this.idauth.checkIDAuth();
                int i = Build.VERSION.SDK_INT;
                Log.e("iaduth", "result1:" + checkIDAuth);
                if (checkIDAuth == 0) {
                    My_Application.Allow_Flag = true;
                } else {
                    My_Application.Allow_Flag = false;
                }
                Looper.loop();
            }
        };
        this.batteryChangedHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.5
            @Override // android.os.Handler
            public void handleMessage(Message message) {
                int i = message.arg1;
                if (message.arg2 == 2) {
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
                    if (i > 0 && i <= 10) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery1), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 10 && i <= 20) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery2), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 20 && i <= 30) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery3), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 30 && i <= 40) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery4), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 40 && i <= 50) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery5), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 50 && i <= 60) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery6), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 60 && i <= 70) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery7), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 70 && i <= 80) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery8), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 80 && i <= 90) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery9), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 90 && i <= 100) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery10), (Drawable) null, (Drawable) null, (Drawable) null);
                    }
                } else if (AppEnvironment.isSDYB) {
                    if (i > 0 && i <= 10) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery1), (Drawable) null, (Drawable) null);
                    } else if (i > 10 && i <= 20) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery2), (Drawable) null, (Drawable) null);
                    } else if (i > 20 && i <= 30) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery3), (Drawable) null, (Drawable) null);
                    } else if (i > 30 && i <= 40) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery4), (Drawable) null, (Drawable) null);
                    } else if (i > 40 && i <= 50) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery5), (Drawable) null, (Drawable) null);
                    } else if (i > 50 && i <= 60) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery6), (Drawable) null, (Drawable) null);
                    } else if (i > 60 && i <= 70) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery7), (Drawable) null, (Drawable) null);
                    } else if (i > 70 && i <= 80) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery8), (Drawable) null, (Drawable) null);
                    } else if (i > 80 && i <= 90) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery9), (Drawable) null, (Drawable) null);
                    } else if (i > 90 && i <= 100) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery10), (Drawable) null, (Drawable) null);
                    }
                } else if (AppEnvironment.isMAINNEW || AppEnvironment.isDEMO) {
                    if (i > 0 && i <= 10) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new1), (Drawable) null);
                    } else if (i > 10 && i <= 20) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new2), (Drawable) null);
                    } else if (i > 20 && i <= 30) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new3), (Drawable) null);
                    } else if (i > 30 && i <= 40) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new4), (Drawable) null);
                    } else if (i > 40 && i <= 50) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new5), (Drawable) null);
                    } else if (i > 50 && i <= 60) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new6), (Drawable) null);
                    } else if (i > 60 && i <= 70) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new7), (Drawable) null);
                    } else if (i > 70 && i <= 80) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new8), (Drawable) null);
                    } else if (i > 80 && i <= 90) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new9), (Drawable) null);
                    } else if (i > 90 && i <= 100) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new10), (Drawable) null);
                    }
                } else if (i > 0 && i <= 10) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_01), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 10 && i <= 20) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_02), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 20 && i <= 30) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_03), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 30 && i <= 40) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_04), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 40 && i <= 50) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_05), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 50 && i <= 60) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_06), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 60 && i <= 70) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_07), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 70 && i <= 80) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_08), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 80 && i <= 90) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_09), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 90 && i <= 100) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_0full), (Drawable) null, (Drawable) null, (Drawable) null);
                }
                CloudClientActivity.this.tv_battery.setText(String.valueOf(i) + "%");
            }
        };
        this.keylistener = new DialogInterface.OnKeyListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.6
            @Override // android.content.DialogInterface.OnKeyListener
            public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
                return i == 4 && keyEvent.getRepeatCount() == 0;
            }
        };
        this.apkInstallReceiver = new BroadcastReceiver() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.7
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (intent.getAction().equals("android.intent.action.PACKAGE_ADDED")) {
                    CloudClientActivity.this.apkHandler.obtainMessage().sendToTarget();
                    String replace = intent.getDataString().replace("package:", "");
                    try {
                        if (CloudClientActivity.this.apkUpdatePkgList == null || !CloudClientActivity.this.apkUpdatePkgList.contains(replace)) {
                            return;
                        }
                        CloudClientActivity.this.apkUpdatePkgList.remove(replace);
                    } catch (Exception e) {
                    }
                }
            }
        };
        this.apkHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.8
            @Override // android.os.Handler
            public void handleMessage(Message message) {
                CloudClientActivity.this.showFailedApkInfo();
            }
        };
        this.timeRunnable = new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.9
            /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x011a: INVOKE  (r1v7 int A[REMOVE]) = (r0v3 java.util.Calendar), (11 int) type: VIRTUAL call: java.util.Calendar.get(int):int)] */
            /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x0132: INVOKE  (r1v12 int A[REMOVE]) = (r0v3 java.util.Calendar), (12 int) type: VIRTUAL call: java.util.Calendar.get(int):int)] */
            /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x014a: INVOKE  (r1v17 int A[REMOVE]) = (r0v3 java.util.Calendar), (13 int) type: VIRTUAL call: java.util.Calendar.get(int):int)] */
            /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x01e0: INVOKE  (r1v26 int A[REMOVE]) = (r0v3 java.util.Calendar), (11 int) type: VIRTUAL call: java.util.Calendar.get(int):int)] */
            @Override // java.lang.Runnable
            public void run() {
                String str;
                while (CloudClientActivity.this.showTime) {
                    Calendar calendar = Calendar.getInstance();
                    int i = calendar.get(2);
                    int i2 = calendar.get(1);
                    int i3 = calendar.get(5);
                    String sb = calendar.get(11) < 10 ? "0" + calendar.get(11) : new StringBuilder().append(calendar.get(11)).toString();
                    String sb2 = calendar.get(12) < 10 ? "0" + calendar.get(12) : new StringBuilder().append(calendar.get(12)).toString();
                    if (calendar.get(13) < 10) {
                        String str2 = "0" + calendar.get(13);
                    } else {
                        new StringBuilder().append(calendar.get(13)).toString();
                    }
                    int i4 = calendar.get(7);
                    if (AppEnvironment.isSDYB) {
                        str = String.valueOf(sb) + ":" + sb2 + "\n" + i2 + "年" + (i + 1) + "月" + i3 + "日\n" + CloudClientActivity.this.getWeekDay(i4);
                    } else if (!AppEnvironment.isMAINNEW && !AppEnvironment.isDEMO) {
                        str = !CloudClientActivity.this.language.equals("en") ? String.valueOf(sb) + ":" + sb2 + " " + CloudClientActivity.this.getWeekDay(i4) + "\n" + i2 + "年" + (i + 1) + "月" + i3 + "日 " : String.valueOf(sb) + ":" + sb2 + " " + CloudClientActivity.this.getWeekDay(i4) + "\n" + CloudClientActivity.this.getMonth(i) + "," + i3 + "," + i2;
                    } else if (calendar.get(11) <= 12) {
                        str = "上午 " + sb + ":" + sb2;
                    } else {
                        str = "下午 " + (calendar.get(11) - 12 < 10 ? "0" + (calendar.get(11) - 12) : new StringBuilder().append(calendar.get(11)).toString()) + ":" + sb2;
                    }
                    Message obtainMessage = CloudClientActivity.this.timeHandler.obtainMessage();
                    obtainMessage.what = 1;
                    obtainMessage.obj = str;
                    obtainMessage.sendToTarget();
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
            public void handleMessage(Message message) {
                switch (message.what) {
                    case 1:
                        String str = (String) message.obj;
                        if (CloudClientActivity.this.sdyb_time == null || str == null) {
                            return;
                        }
                        CloudClientActivity.this.sdyb_time.setText(str);
                        return;
                    default:
                        return;
                }
            }
        };
        this.noticeHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.11
            @Override // android.os.Handler
            public void handleMessage(Message message) {
                switch (message.what) {
                    case 1:
                        int i = message.arg1;
                        if (CloudClientActivity.this.three_noticetv != null) {
                            CloudClientActivity.this.three_noticetv.setVisibility(0);
                            if (i > 0) {
                                CloudClientActivity.this.three_noticetv.setText((i < 100 ? new StringBuilder(String.valueOf(i)).toString() : "99+"));
                            } else {
                                CloudClientActivity.this.three_noticetv.setVisibility(8);
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
                    SharedPreferences sharedPreferences = CloudClientActivity.this.getSharedPreferences("notice", 0);
                    long j = sharedPreferences.getLong("lasttime", 0L);
                    long currentTimeMillis = System.currentTimeMillis();
                    if (j == 0 || Math.abs(currentTimeMillis - j) >= 600000) {
                        sharedPreferences.edit().putLong("lasttime", currentTimeMillis).commit();
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

    public CloudClientActivity(Context context) {
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
            public void handleMessage(Message message) {
                PackageInfo packageInfo;
                switch (message.what) {
                    case 1:
                        CloudClientActivity.this.installNewApk();
                        return;
                    case 3:
                        CloudClientActivity.this.updateThread = null;
                        CloudClientActivity.this.updateTime = HttpStatus.SC_MULTIPLE_CHOICES;
                        CloudClientActivity.this.showFailedApkInfo();
                        return;
                    case 4:
                        Intent intent = new Intent("android.intent.action.MAIN");
                        intent.addFlags(268435456);
                        intent.setComponent(new ComponentName("com.edutech.assistantdemo", "com.edutech.assistantdemo.MainActivity"));
                        try {
                            packageInfo = CloudClientActivity.this.getPackageManager().getPackageInfo("com.edutech.assistantdemo", 0);
                        } catch (PackageManager.NameNotFoundException e) {
                            packageInfo = null;
                            e.printStackTrace();
                        }
                        if (packageInfo == null) {
                            return;
                        }
                        CloudClientActivity.this.startActivity(intent);
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
                        CloudClientActivity.this.installSingleApk((String) message.obj);
                        return;
                }
            }
        };
        this.InteractionReceiver = new BroadcastReceiver() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.2
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                String action = intent.getAction();
                if (action.equals("android.intent.action.STATUSBAR_INVISIBILITY")) {
                    CloudClientActivity.this.isInteraction = true;
                } else if (!action.equals("android.intent.action.STATUSBAR_VISIBILITY")) {
                } else {
                    CloudClientActivity.this.isInteraction = false;
                }
            }
        };
        this.callHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.3
            @Override // android.os.Handler
            public void handleMessage(Message message) {
                switch (message.what) {
                    case 0:
                        if (!CloudClientActivity.this.is3G.booleanValue()) {
                            return;
                        }
                        Intent intent = new Intent();
                        if (CloudClientActivity.this.isLenovo.booleanValue()) {
                            intent.setPackage("com.lenovo.ideafriend");
                            intent.setType("vnd.android-dir/mms-sms");
                        } else {
                            intent.setPackage("com.android.mms");
                            intent.setType("vnd.android-dir/mms-sms");
                            intent.setAction("android.intent.action.MAIN");
                        }
                        CloudClientActivity.this.startActivity(intent);
                        return;
                    case 1:
                        if (!CloudClientActivity.this.is3G.booleanValue() || !Build.DISPLAY.contains("TB-8703N")) {
                            if (!CloudClientActivity.this.is3G.booleanValue()) {
                                return;
                            }
                            Intent intent2 = new Intent();
                            intent2.setAction("android.intent.action.CALL_BUTTON");
                            CloudClientActivity.this.startActivity(intent2);
                            return;
                        }
                        Intent intent3 = new Intent();
                        intent3.setClassName("com.android.dialer", "com.android.dialer.DialtactsActivity");
                        intent3.setFlags(268435456);
                        intent3.setFlags(536870912);
                        CloudClientActivity.this.startActivity(intent3);
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
                Looper.prepare();
                int checkIDAuth = CloudClientActivity.this.idauth.checkIDAuth();
                int i = Build.VERSION.SDK_INT;
                Log.e("iaduth", "result1:" + checkIDAuth);
                if (checkIDAuth == 0) {
                    My_Application.Allow_Flag = true;
                } else {
                    My_Application.Allow_Flag = false;
                }
                Looper.loop();
            }
        };
        this.batteryChangedHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.5
            @Override // android.os.Handler
            public void handleMessage(Message message) {
                int i = message.arg1;
                if (message.arg2 == 2) {
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
                    if (i > 0 && i <= 10) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery1), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 10 && i <= 20) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery2), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 20 && i <= 30) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery3), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 30 && i <= 40) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery4), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 40 && i <= 50) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery5), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 50 && i <= 60) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery6), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 60 && i <= 70) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery7), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 70 && i <= 80) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery8), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 80 && i <= 90) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery9), (Drawable) null, (Drawable) null, (Drawable) null);
                    } else if (i > 90 && i <= 100) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.suining_battery10), (Drawable) null, (Drawable) null, (Drawable) null);
                    }
                } else if (AppEnvironment.isSDYB) {
                    if (i > 0 && i <= 10) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery1), (Drawable) null, (Drawable) null);
                    } else if (i > 10 && i <= 20) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery2), (Drawable) null, (Drawable) null);
                    } else if (i > 20 && i <= 30) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery3), (Drawable) null, (Drawable) null);
                    } else if (i > 30 && i <= 40) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery4), (Drawable) null, (Drawable) null);
                    } else if (i > 40 && i <= 50) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery5), (Drawable) null, (Drawable) null);
                    } else if (i > 50 && i <= 60) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery6), (Drawable) null, (Drawable) null);
                    } else if (i > 60 && i <= 70) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery7), (Drawable) null, (Drawable) null);
                    } else if (i > 70 && i <= 80) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery8), (Drawable) null, (Drawable) null);
                    } else if (i > 80 && i <= 90) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery9), (Drawable) null, (Drawable) null);
                    } else if (i > 90 && i <= 100) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.sdyb_battery10), (Drawable) null, (Drawable) null);
                    }
                } else if (AppEnvironment.isMAINNEW || AppEnvironment.isDEMO) {
                    if (i > 0 && i <= 10) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new1), (Drawable) null);
                    } else if (i > 10 && i <= 20) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new2), (Drawable) null);
                    } else if (i > 20 && i <= 30) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new3), (Drawable) null);
                    } else if (i > 30 && i <= 40) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new4), (Drawable) null);
                    } else if (i > 40 && i <= 50) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new5), (Drawable) null);
                    } else if (i > 50 && i <= 60) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new6), (Drawable) null);
                    } else if (i > 60 && i <= 70) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new7), (Drawable) null);
                    } else if (i > 70 && i <= 80) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new8), (Drawable) null);
                    } else if (i > 80 && i <= 90) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new9), (Drawable) null);
                    } else if (i > 90 && i <= 100) {
                        CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_new10), (Drawable) null);
                    }
                } else if (i > 0 && i <= 10) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_01), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 10 && i <= 20) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_02), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 20 && i <= 30) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_03), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 30 && i <= 40) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_04), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 40 && i <= 50) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_05), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 50 && i <= 60) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_06), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 60 && i <= 70) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_07), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 70 && i <= 80) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_08), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 80 && i <= 90) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_09), (Drawable) null, (Drawable) null, (Drawable) null);
                } else if (i > 90 && i <= 100) {
                    CloudClientActivity.this.tv_battery.setCompoundDrawablesWithIntrinsicBounds(CloudClientActivity.this.getResources().getDrawable(R.drawable.battery_0full), (Drawable) null, (Drawable) null, (Drawable) null);
                }
                CloudClientActivity.this.tv_battery.setText(String.valueOf(i) + "%");
            }
        };
        this.keylistener = new DialogInterface.OnKeyListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.6
            @Override // android.content.DialogInterface.OnKeyListener
            public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
                return i == 4 && keyEvent.getRepeatCount() == 0;
            }
        };
        this.apkInstallReceiver = new BroadcastReceiver() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.7
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context2, Intent intent) {
                if (intent.getAction().equals("android.intent.action.PACKAGE_ADDED")) {
                    CloudClientActivity.this.apkHandler.obtainMessage().sendToTarget();
                    String replace = intent.getDataString().replace("package:", "");
                    try {
                        if (CloudClientActivity.this.apkUpdatePkgList == null || !CloudClientActivity.this.apkUpdatePkgList.contains(replace)) {
                            return;
                        }
                        CloudClientActivity.this.apkUpdatePkgList.remove(replace);
                    } catch (Exception e) {
                    }
                }
            }
        };
        this.apkHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.8
            @Override // android.os.Handler
            public void handleMessage(Message message) {
                CloudClientActivity.this.showFailedApkInfo();
            }
        };
        this.timeRunnable = new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.9
            /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x011a: INVOKE  (r1v7 int A[REMOVE]) = (r0v3 java.util.Calendar), (11 int) type: VIRTUAL call: java.util.Calendar.get(int):int)] */
            /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x0132: INVOKE  (r1v12 int A[REMOVE]) = (r0v3 java.util.Calendar), (12 int) type: VIRTUAL call: java.util.Calendar.get(int):int)] */
            /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x014a: INVOKE  (r1v17 int A[REMOVE]) = (r0v3 java.util.Calendar), (13 int) type: VIRTUAL call: java.util.Calendar.get(int):int)] */
            /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x01e0: INVOKE  (r1v26 int A[REMOVE]) = (r0v3 java.util.Calendar), (11 int) type: VIRTUAL call: java.util.Calendar.get(int):int)] */
            @Override // java.lang.Runnable
            public void run() {
                String str;
                while (CloudClientActivity.this.showTime) {
                    Calendar calendar = Calendar.getInstance();
                    int i = calendar.get(2);
                    int i2 = calendar.get(1);
                    int i3 = calendar.get(5);
                    String sb = calendar.get(11) < 10 ? "0" + calendar.get(11) : new StringBuilder().append(calendar.get(11)).toString();
                    String sb2 = calendar.get(12) < 10 ? "0" + calendar.get(12) : new StringBuilder().append(calendar.get(12)).toString();
                    if (calendar.get(13) < 10) {
                        String str2 = "0" + calendar.get(13);
                    } else {
                        new StringBuilder().append(calendar.get(13)).toString();
                    }
                    int i4 = calendar.get(7);
                    if (AppEnvironment.isSDYB) {
                        str = String.valueOf(sb) + ":" + sb2 + "\n" + i2 + "年" + (i + 1) + "月" + i3 + "日\n" + CloudClientActivity.this.getWeekDay(i4);
                    } else if (!AppEnvironment.isMAINNEW && !AppEnvironment.isDEMO) {
                        str = !CloudClientActivity.this.language.equals("en") ? String.valueOf(sb) + ":" + sb2 + " " + CloudClientActivity.this.getWeekDay(i4) + "\n" + i2 + "年" + (i + 1) + "月" + i3 + "日 " : String.valueOf(sb) + ":" + sb2 + " " + CloudClientActivity.this.getWeekDay(i4) + "\n" + CloudClientActivity.this.getMonth(i) + "," + i3 + "," + i2;
                    } else if (calendar.get(11) <= 12) {
                        str = "上午 " + sb + ":" + sb2;
                    } else {
                        str = "下午 " + (calendar.get(11) - 12 < 10 ? "0" + (calendar.get(11) - 12) : new StringBuilder().append(calendar.get(11)).toString()) + ":" + sb2;
                    }
                    Message obtainMessage = CloudClientActivity.this.timeHandler.obtainMessage();
                    obtainMessage.what = 1;
                    obtainMessage.obj = str;
                    obtainMessage.sendToTarget();
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
            public void handleMessage(Message message) {
                switch (message.what) {
                    case 1:
                        String str = (String) message.obj;
                        if (CloudClientActivity.this.sdyb_time == null || str == null) {
                            return;
                        }
                        CloudClientActivity.this.sdyb_time.setText(str);
                        return;
                    default:
                        return;
                }
            }
        };
        this.noticeHandler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.11
            @Override // android.os.Handler
            public void handleMessage(Message message) {
                switch (message.what) {
                    case 1:
                        int i = message.arg1;
                        if (CloudClientActivity.this.three_noticetv != null) {
                            CloudClientActivity.this.three_noticetv.setVisibility(0);
                            if (i > 0) {
                                CloudClientActivity.this.three_noticetv.setText((i < 100 ? new StringBuilder(String.valueOf(i)).toString() : "99+"));
                            } else {
                                CloudClientActivity.this.three_noticetv.setVisibility(8);
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
                    SharedPreferences sharedPreferences = CloudClientActivity.this.getSharedPreferences("notice", 0);
                    long j = sharedPreferences.getLong("lasttime", 0L);
                    long currentTimeMillis = System.currentTimeMillis();
                    if (j == 0 || Math.abs(currentTimeMillis - j) >= 600000) {
                        sharedPreferences.edit().putLong("lasttime", currentTimeMillis).commit();
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

    public static boolean SlientInstall(String str) throws IOException {
        boolean z;
        Process exec = Runtime.getRuntime().exec("pm install -r " + str);
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(exec.getInputStream()));
        StringBuilder sb = new StringBuilder("");
        while (true) {
            String readLine = bufferedReader.readLine();
            if (readLine == null) {
                try {
                    break;
                } catch (InterruptedException e) {
                    System.err.println(e);
                }
            } else {
                sb.append(readLine);
            }
        }
        if (exec.waitFor() != 0) {
            System.err.println("exit value = " + exec.exitValue());
        }
        if (sb.toString().equals("Success")) {
            Log.d("InstallApkUtil", "SlientInstall success");
            z = true;
        } else {
            Log.d("InstallApkUtil", "SlientInstall failed");
            z = false;
        }
        return z;
    }

    private void apkIntentInstall(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setDataAndType(Uri.fromFile(new File(str)), "application/vnd.android.package-archive");
        intent.setFlags(268435456);
        startActivity(intent);
    }

    private void apkinstall(String str) {
        try {
            if (InstallApkUtil.SlientInstall(str)) {
                Log.d("sysService", String.valueOf(str) + ":SlientInstall安装成功！");
            } else if (!InstallApkUtil.SuSlientInstall(str)) {
                apkIntentInstall(str);
            } else {
                Log.d("sysService", String.valueOf(str) + ":SuSlientInstall安装成功！");
            }
        } catch (Exception e) {
            try {
                if (!InstallApkUtil.SuSlientInstall(str)) {
                    apkIntentInstall(str);
                } else {
                    Log.d("sysService", String.valueOf(str) + ":SuSlientInstall安装成功！");
                }
            } catch (Exception e2) {
                apkIntentInstall(str);
                Log.d("sysService", String.valueOf(str) + ":InstallApk安装成功！");
            }
        }
    }

    private void apkinstall_samsung(String str) {
        Intent intent = new Intent();
        intent.setAction("android.intent.action.SILENCE_INSTALL");
        if (Build.DISPLAY.contains("M1016Pro")) {
            intent.putExtra("uri", str);
        } else {
            intent.setDataAndType(Uri.fromFile(new File(str)), "application/vnd.android.package-archive");
        }
        sendBroadcast(intent);
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
        if (this.mAllApps == null || this.mAllApps.size() <= 0) {
            for (int i = 12; i < 12; i++) {
                this.imageViews[i].setImageDrawable(getResources().getDrawable(R.drawable.app_add));
                this.imageViews[i].setVisibility(0);
                this.textViews[i].setText(getResources().getString(R.string.add_app));
                this.textViews[i].setTextColor(getResources().getColor(R.color.addcolor));
                this.textViews[i].setVisibility(0);
            }
            return;
        }
        for (int i2 = 12; i2 < 10; i2++) {
            if (this.mAllApps.size() + 12 <= i2 || this.mAllApps.get(i2 - 12) == null) {
                this.imageViews[i2].setImageDrawable(getResources().getDrawable(R.drawable.app_add));
                this.imageViews[i2].setVisibility(0);
                this.textViews[i2].setText(getResources().getString(R.string.add_app));
                this.textViews[i2].setTextColor(getResources().getColor(R.color.addcolor));
                this.textViews[i2].setVisibility(0);
            } else {
                this.imageViews[i2].setImageDrawable(this.mAllApps.get(i2 - 12).loadIcon(this.mPackageManager));
                this.imageViews[i2].setVisibility(0);
                this.textViews[i2].setText(this.mAllApps.get(i2 - 12).loadLabel(this.mPackageManager).toString());
                this.textViews[i2].setTextColor(getResources().getColor(R.color.showcolor));
                this.textViews[i2].setVisibility(0);
            }
        }
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
        if (this.mAllApps == null || this.mAllApps.size() <= 0) {
            for (int i = 10; i < 10; i++) {
                this.imageViews[i].setImageDrawable(getResources().getDrawable(R.drawable.app_add));
                this.imageViews[i].setVisibility(0);
                this.textViews[i].setText(getResources().getString(R.string.add_app));
                this.textViews[i].setTextColor(getResources().getColor(R.color.addcolor));
                this.textViews[i].setVisibility(0);
            }
            return;
        }
        for (int i2 = 10; i2 < 10; i2++) {
            if (this.mAllApps.size() + 10 <= i2 || this.mAllApps.get(i2 - 10) == null) {
                this.imageViews[i2].setImageDrawable(getResources().getDrawable(R.drawable.app_add));
                this.imageViews[i2].setVisibility(0);
                this.textViews[i2].setText(getResources().getString(R.string.add_app));
                this.textViews[i2].setTextColor(getResources().getColor(R.color.addcolor));
                this.textViews[i2].setVisibility(0);
            } else {
                this.imageViews[i2].setImageDrawable(this.mAllApps.get(i2 - 10).loadIcon(this.mPackageManager));
                this.imageViews[i2].setVisibility(0);
                this.textViews[i2].setText(this.mAllApps.get(i2 - 10).loadLabel(this.mPackageManager).toString());
                this.textViews[i2].setTextColor(getResources().getColor(R.color.showcolor));
                this.textViews[i2].setVisibility(0);
            }
        }
    }

    private void autoUpdateApks() {
        List<String> failedEbagUpdated;
        long currentTimeMillis = System.currentTimeMillis();
        long j = getSharedPreferences("resumeconfig", 0).getLong("updateapks", 0L);
        if (currentTimeMillis - j > 86400000 || j == 0) {
            this.hasUpdated = false;
            apkUpdate();
        } else if (currentTimeMillis - j <= 3600000 || (failedEbagUpdated = Utils.getFailedEbagUpdated(this, getSharedPreferences("privatekey", 0).getString("apihost", ""))) == null || failedEbagUpdated.size() <= 0) {
        } else {
            this.hasUpdated = false;
            apkUpdate();
        }
    }

    private void autoUpdateDesigns() {
        long currentTimeMillis = System.currentTimeMillis();
        long j = getSharedPreferences("resumeconfig", 0).getLong("updatedesign", 0L);
        if (currentTimeMillis - j > 86400000 || j == 0) {
            this.hasGeted = false;
            getDesignView();
        }
    }

    public void broadEyeProc(Context context, boolean z) {
        Intent intent = new Intent();
        intent.setAction("com.android.eyeprotection");
        intent.putExtra("ep_mode", z);
        context.sendBroadcast(intent);
    }

    private void changeIcons(ArrayList<AppBean> arrayList) {
        if (arrayList != null) {
            try {
                if (arrayList.size() <= 0) {
                    return;
                }
                getDataFromLocal(AppEnvironment.icon, arrayList);
            } catch (Exception e) {
                getSharedPreferences("privatekey", 0).edit().putString("updatetime", "0").commit();
            }
        }
    }

    public static void cleanApplicationData(Context context) {
        cleanCacheFile(TEMP);
    }

    private static void cleanCacheFile(String str) {
        File[] listFiles;
        File file = new File(str);
        if (!file.isDirectory() || (listFiles = file.listFiles()) == null) {
            return;
        }
        for (File file2 : listFiles) {
            file2.delete();
        }
    }

    public static void cleanExternalCache(Context context) {
        if (Environment.getExternalStorageState().equals("mounted")) {
            deleteFilesByDirectory(context.getExternalCacheDir());
        }
    }

    public static void cleanFiles(Context context) {
        deleteFilesByDirectory(context.getFilesDir());
    }

    public static void cleanInternalCache(Context context) {
        Log.e(TAG, context.getCacheDir().getAbsolutePath());
        deleteFilesByDirectory(context.getCacheDir());
    }

    public static void cleanSharedPreference(Context context) {
        deleteFilesByDirectory(new File("/data/data/" + context.getPackageName() + "/shared_prefs"));
    }

    public void deleteCameraFiles() {
        File[] listFiles;
        File[] listFiles2;
        String file = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM).toString();
        if (file == null || file.equals("")) {
            return;
        }
        File file2 = new File(String.valueOf(file) + "/Camera/");
        File file3 = new File(String.valueOf(file) + "/Screenshots/");
        if (file2.exists() && file2.isDirectory()) {
            for (File file4 : file2.listFiles()) {
                if (file4.exists()) {
                    file4.delete();
                }
            }
        }
        if (file3.exists() && file3.isDirectory()) {
            for (File file5 : file3.listFiles()) {
                if (file5.exists()) {
                    file5.delete();
                }
            }
        }
        this.deletingFiles = false;
    }

    private static void deleteFilesByDirectory(File file) {
        if (file == null || !file.exists() || !file.isDirectory() || file.listFiles() == null) {
            return;
        }
        for (File file2 : file.listFiles()) {
            file2.delete();
        }
    }

    private void enableButtons(ArrayList<AppBean> arrayList) {
        if (arrayList == null || arrayList.size() <= 0) {
            return;
        }
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
        for (int i = 0; i < arrayList.size(); i++) {
            AppBean appBean = arrayList.get(i);
            judgeApp(appBean.getCode(), appBean.getEnable());
        }
    }

    @SuppressLint({"NewApi"})
    private void getDataFromLocal(String str, ArrayList<AppBean> arrayList) {
        for (int i = 0; i < arrayList.size(); i++) {
            try {
                String code = arrayList.get(i).getCode();
                if ("wifi".equals(code) || "large".equals(code) || SQLExec.DelimiterType.NORMAL.equals(code) || "small".equals(code)) {
                    String str2 = String.valueOf(AppEnvironment.icon) + arrayList.get(i).getIcon().substring(arrayList.get(i).getIcon().lastIndexOf("/") + 1);
                    if (str2 != null && "large".equals(code)) {
                        if (new File(str2).exists()) {
                            this.mainbackground.setBackground(new BitmapDrawable(BitmapFactory.decodeFile(String.valueOf(AppEnvironment.icon) + arrayList.get(i).getIcon().substring(arrayList.get(i).getIcon().lastIndexOf("/") + 1))));
                        } else {
                            getSharedPreferences("privatekey", 0).edit().putString("updatetime", "0").commit();
                        }
                    }
                } else {
                    judgeIcon(arrayList.get(i));
                }
            } catch (Exception e) {
                e.printStackTrace();
                Log.i("liu", "Exception:" + e);
                getSharedPreferences("privatekey", 0).edit().putString("updatetime", "0").commit();
                return;
            }
        }
    }

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

    public String getJsonStringFromGZIP(HttpResponse httpResponse) {
        String str;
        try {
            if (httpResponse.getStatusLine().getStatusCode() == 200) {
                BufferedInputStream bufferedInputStream = new BufferedInputStream(httpResponse.getEntity().getContent());
                bufferedInputStream.mark(2);
                byte[] bArr = new byte[2];
                int read = bufferedInputStream.read(bArr);
                bufferedInputStream.reset();
                InputStreamReader inputStreamReader = new InputStreamReader((read == -1 || getShort(bArr) != 8075) ? bufferedInputStream : new GZIPInputStream(bufferedInputStream), "utf-8");
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
                Log.e(TAG, "与服务端连接失败。。。");
                str = "";
            }
        } catch (Exception e) {
            Log.e(TAG, e.toString(), e);
            str = "";
        }
        return str;
    }

    private void getLanguage() {
        int read;
        File file = new File(this.LANGUAGEPATH);
        if (!file.exists()) {
            return;
        }
        byte[] bArr = new byte[512];
        FileInputStream fileInputStream = null;
        try {
            fileInputStream = new FileInputStream(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        if (fileInputStream == null) {
            return;
        }
        String str = "";
        while (true) {
            try {
            } catch (IOException e2) {
                e2.printStackTrace();
            }
            if (fileInputStream.read(bArr) <= 0) {
                break;
            }
            str = String.valueOf(str) + new String(bArr, 0, read);
        }
        if (str.contains("english")) {
            SharedPreferences sharedPreferences = getSharedPreferences("language", 0);
            LanguageUtils.SetLanguage(this, "en");
            sharedPreferences.edit().putString("language", "en").commit();
            this.language = "en";
            return;
        }
        SharedPreferences sharedPreferences2 = getSharedPreferences("language", 0);
        LanguageUtils.SetLanguage(this, "chinese");
        sharedPreferences2.edit().putString("language", "chinese").commit();
        this.language = "chinese";
    }

    public String getMonth(int i) {
        String str = "";
        switch (i) {
            case 0:
                str = "Jan";
                break;
            case 1:
                str = "Feb";
                break;
            case 2:
                str = "Mar";
                break;
            case 3:
                str = "Apr";
                break;
            case 4:
                str = "May";
                break;
            case 5:
                str = "Jun";
                break;
            case 6:
                str = "Jul";
                break;
            case 7:
                str = "Aug";
                break;
            case 8:
                str = "Sept";
                break;
            case 9:
                str = "Oct";
                break;
            case 10:
                str = "Nov";
                break;
            case 11:
                str = "Dec";
                break;
        }
        return str;
    }

    public void getMyApps(String str, String str2) {
        String trim;
        SharedPreferences sharedPreferences;
        JSONArray jSONArray;
        if (this.myappList == null) {
            this.myappList = new ArrayList();
        }
        if (str == null || str.equals("") || (trim = str.trim()) == null || trim.equals("")) {
            return;
        }
        try {
            sharedPreferences = getSharedPreferences(trim, 0);
        } catch (NullPointerException e) {
            sharedPreferences = null;
        } catch (Exception e2) {
            sharedPreferences = null;
        }
        if (sharedPreferences == null) {
            return;
        }
        long j = sharedPreferences.getLong("updatetime", 0L);
        long currentTimeMillis = System.currentTimeMillis();
        String string = sharedPreferences.getString("data", "");
        String str3 = string;
        if (Math.abs((currentTimeMillis - j) / 1000) >= 10800) {
            try {
                HttpResponse execute = new DefaultHttpClient().execute(httpGetInit("http://" + str + "/api/app/projectcode/myapp/os/android", str2, this.username));
                str3 = string;
                if (execute.getStatusLine().getStatusCode() == 200) {
                    String entityUtils = EntityUtils.toString(execute.getEntity());
                    System.out.println("strResult:" + entityUtils);
                    str3 = string;
                    if (entityUtils != null) {
                        str3 = string;
                        if (!entityUtils.equals("")) {
                            JSONObject jSONObject = new JSONObject(entityUtils);
                            boolean z = jSONObject.getBoolean("status");
                            jSONObject.getString("errorInfo");
                            str3 = string;
                            if (z) {
                                sharedPreferences.edit().putLong("updatetime", System.currentTimeMillis()).commit();
                                sharedPreferences.edit().putString("data", entityUtils).commit();
                                str3 = entityUtils;
                            }
                        }
                    }
                }
            } catch (ClientProtocolException e3) {
                e3.printStackTrace();
                str3 = string;
            } catch (IOException e4) {
                e4.printStackTrace();
                str3 = string;
            } catch (Exception e5) {
                e5.printStackTrace();
                str3 = string;
            }
        }
        if (str3 != null) {
            try {
                if (!str3.equals("")) {
                    JSONObject jSONObject2 = new JSONObject(str3);
                    boolean z2 = jSONObject2.getBoolean("status");
                    jSONObject2.getString("errorInfo");
                    if (z2 && (jSONArray = jSONObject2.getJSONObject("data").getJSONArray("app")) != null && jSONArray.length() > 0) {
                        this.myappList.clear();
                        int i = 0;
                        while (true) {
                            if (i >= jSONArray.length()) {
                                break;
                            }
                            String string2 = jSONArray.getJSONObject(i).getString("packagename");
                            if (LogHelp.TYPE_GUIDANCE.equals(jSONArray.getJSONObject(i).getString("apptype"))) {
                                this.myappList.add(string2);
                            }
                            i++;
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

    /* JADX WARN: Code restructure failed: missing block: B:9:0x004c, code lost:
        if (r0.equals("") != false) goto L10;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void getMyWorkNotification() {
        String str;
        JSONArray jSONArray;
        SharedPreferences sharedPreferences = getSharedPreferences("privatekey", 0);
        String string = sharedPreferences.getString("apihost", "");
        String string2 = sharedPreferences.getString("name", "");
        String string3 = sharedPreferences.getString("key", "");
        if (string != null && !string.equals("") && string2 != null) {
            str = string2;
        }
        HashMap<String, String> loadXml = XmlLoadHelper.loadXml();
        if (loadXml == null) {
            return;
        }
        string = loadXml.get("ip");
        str = loadXml.get("usercode");
        string3 = loadXml.get("privatekey");
        String str2 = "http://" + string + "/api/notification/";
        if (str == null || str.equals("")) {
            return;
        }
        this.noticeNum = 0;
        this.noticeMessages = new ArrayList();
        Log.e("notification", "url:" + str2);
        String notification = HttpUtils.getNotification(str2, str, string3);
        Log.e("notification", "json:" + notification);
        if (notification != null && !"".equals(notification)) {
            try {
                JSONObject jSONObject = new JSONObject(notification);
                boolean z = jSONObject.getBoolean("status");
                JSONObject jSONObject2 = jSONObject.getJSONObject("data");
                if (z && jSONObject2 != null) {
                    int i = jSONObject2.getInt(KeyEnvironment.COUNT);
                    this.noticeNum = i;
                    if (jSONObject2.has("Message") && (jSONArray = jSONObject2.getJSONArray("Message")) != null && jSONArray.length() > 0) {
                        for (int i2 = 0; i2 < jSONArray.length(); i2++) {
                            Noticebean noticebean = new Noticebean();
                            JSONObject jSONObject3 = jSONArray.getJSONObject(i2);
                            noticebean.setActionid(jSONObject3.getString("ActionID"));
                            noticebean.setCreattime(jSONObject3.getString("create"));
                            noticebean.setMessage(jSONObject3.getString("message"));
                            noticebean.setMessageid(jSONObject3.getString("messageid"));
                            this.noticeMessages.add(noticebean);
                        }
                    }
                    Message obtainMessage = this.noticeHandler.obtainMessage();
                    obtainMessage.arg1 = i;
                    obtainMessage.what = 1;
                    obtainMessage.sendToTarget();
                }
            } catch (JSONException e) {
                e.printStackTrace();
            } catch (Exception e2) {
            }
        }
        if (notification == null || notification.equals("")) {
        }
    }

    public void getNetworkTime(final int i) {
        new Thread(new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.23
            @Override // java.lang.Runnable
            public void run() {
                try {
                    URLConnection openConnection = new URL("http://www.ntsc.ac.cn").openConnection();
                    openConnection.connect();
                    Date date = new Date(openConnection.getDate());
                    date.getHours();
                    date.getMinutes();
                    Message obtainMessage = CloudClientActivity.this.callHandler.obtainMessage();
                    obtainMessage.what = i;
                    obtainMessage.sendToTarget();
                    CloudClientActivity.this.getSharedPreferences("allowcall", 4).edit().putBoolean("cancall", true).commit();
                } catch (Exception e) {
                    e.printStackTrace();
                    Message obtainMessage2 = CloudClientActivity.this.callHandler.obtainMessage();
                    obtainMessage2.what = 2;
                    obtainMessage2.sendToTarget();
                    CloudClientActivity.this.getSharedPreferences("allowcall", 4).edit().putBoolean("cancall", false).commit();
                }
            }
        }).start();
    }

    private void getOtherApps() {
        new ArrayList();
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        arrayList2.add("com.launcher.activity");
        arrayList2.add("dolphin.video.players");
        arrayList2.add("com.onlinesys.student");
        arrayList2.add("com.google.android.inputmethod.pinyin");
        arrayList2.add("com.akson.timeep");
        arrayList2.add("com.akson.timeepstudent");
        arrayList2.add("com.webgenie.swf.play");
        arrayList2.add("com.ashleytech.falswf");
        if (AppEnvironment.isDEMO) {
            arrayList2.add("com.lejent.zuoyeshenqi.afanti");
            arrayList2.add("com.A17zuoye.mobile.homework");
            arrayList2.add("com.jinxin.namibox");
            arrayList2.add("com.haojiazhang.activity");
            arrayList2.add(AppEnvironment.YOUDAO_PACKNAME);
            arrayList2.add("org.hisand.zidian.zhs");
            arrayList2.add("com.record.ing");
            arrayList2.add("com.xueersi.parentsmeeting");
            arrayList2.add("com.hjwordgames");
        }
        try {
            List<PackageInfo> installedPackages = getPackageManager().getInstalledPackages(0);
            if (installedPackages != null && installedPackages.size() > 0) {
                for (int i = 0; i < installedPackages.size(); i++) {
                    PackageInfo packageInfo = installedPackages.get(i);
                    String str = packageInfo.packageName;
                    if ((packageInfo.applicationInfo.flags & 1) <= 0 && !arrayList2.contains(str) && !str.contains("com.edutech") && !str.contains("cn.wps.moffice_eng") && (packageInfo.applicationInfo.flags & 1) <= 0 && (this.myappList == null || !this.myappList.contains(str))) {
                        arrayList.add(str);
                    }
                }
            }
            if (arrayList == null) {
                return;
            }
            if (arrayList.size() <= 0) {
                return;
            }
            int i2 = 0;
            while (true) {
                try {
                    if (i2 >= arrayList.size()) {
                        return;
                    }
                    String str2 = (String) arrayList.get(i2);
                    Intent intent = new Intent(sysProtectService.UNSTALLAPK);
                    intent.putExtra("packagename", str2);
                    sendBroadcast(intent);
                    Thread.sleep(100L);
                    i2++;
                } catch (Exception e) {
                    return;
                }
            }
        } catch (NullPointerException e2) {
        } catch (Exception e3) {
        }
    }

    private int getShort(byte[] bArr) {
        return (bArr[0] << 8) | (bArr[1] & 255);
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x0043, code lost:
        if (r0.equals("") != false) goto L10;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void getSpecialLauncher() {
        String str;
        this.isGetLauncher = true;
        SharedPreferences sharedPreferences = getSharedPreferences("privatekey", 0);
        String string = sharedPreferences.getString("apihost", "");
        String string2 = sharedPreferences.getString("name", "");
        if (string != null && !string.equals("") && string2 != null) {
            str = string2;
        }
        HashMap<String, String> loadXml = XmlLoadHelper.loadXml();
        if (loadXml == null) {
            return;
        }
        string = loadXml.get("ip");
        str = loadXml.get("usercode");
        String str2 = "http://" + string + "/api/config/";
        if (str == null || str.equals("")) {
            this.isGetLauncher = false;
            return;
        }
        String configData = HttpUtils.getConfigData(str2, str);
        this.isGetLauncher = false;
        getSharedPreferences("resumeconfig", 0).edit().putLong("updatedesign", System.currentTimeMillis()).commit();
        if (configData != null && configData.equals("")) {
            return;
        }
        if (XmlUtils.saveLauncher(configData, this) == 1) {
            this.hasGeted = true;
        }
        getSharedPreferences("splauncher", 0).edit().putLong("refreshtime", System.currentTimeMillis()).commit();
        runOnUiThread(new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.18
            @Override // java.lang.Runnable
            public void run() {
                CloudClientActivity.this.setDesignView();
            }
        });
    }

    public String getWeekDay(int i) {
        String str = "";
        switch (i) {
            case 1:
                str = getResources().getString(R.string.sunday);
                break;
            case 2:
                str = getResources().getString(R.string.monday);
                break;
            case 3:
                str = getResources().getString(R.string.tuesday);
                break;
            case 4:
                str = getResources().getString(R.string.wednesday);
                break;
            case 5:
                str = getResources().getString(R.string.thursday);
                break;
            case 6:
                str = getResources().getString(R.string.friday);
                break;
            case 7:
                str = getResources().getString(R.string.saturday);
                break;
        }
        return str;
    }

    public static HttpGet httpGetInit(String str, String str2, String str3) {
        HttpGet httpGet = new HttpGet(str);
        httpGet.addHeader("X-Edutech-Entity", String.valueOf(str3) + "+" + str2);
        long currentTimeMillis = System.currentTimeMillis();
        httpGet.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + My_md5.Md5(String.valueOf(currentTimeMillis) + str3 + str2));
        return httpGet;
    }

    public static HttpPost httpPostInit(String str, String str2, String str3) {
        HttpPost httpPost = new HttpPost(str);
        httpPost.addHeader("X-Edutech-Entity", String.valueOf(str3) + "+" + str2);
        long currentTimeMillis = System.currentTimeMillis();
        httpPost.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + My_md5.Md5(String.valueOf(currentTimeMillis) + str3 + str2));
        return httpPost;
    }

    private void initBroadReceiver() {
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.net.wifi.STATE_CHANGE");
        intentFilter.addAction(sysProtectService.SERVICE_START);
        intentFilter.addAction("edm.intent.action.license.status");
        intentFilter.addAction("com.edutech.getadmin");
        this.wifiReceiver = new WifiReceiver();
        registerReceiver(this.wifiReceiver, intentFilter);
        IntentFilter intentFilter2 = new IntentFilter();
        intentFilter2.addAction("android.intent.action.PACKAGE_ADDED");
        intentFilter2.addAction("android.intent.action.PACKAGE_REMOVED");
        intentFilter2.addDataScheme("package");
        registerReceiver(this.apkInstallReceiver, intentFilter2);
        if (AppEnvironment.openBMD) {
            Intent intent = new Intent();
            intent.setAction("com.edutech.intent.TrafficStatsService");
            intent.setClassName("com.edutech.firewall", "eu.faircode.netguard.TrafficStatsService");
            intent.putExtra("ip", this.send_ip);
            intent.putExtra("privatekey", this.send_privatekey);
            intent.putExtra("name", this.send_name);
            intent.putExtra("schoolid", this.send_schoolid);
            startService(intent);
        }
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
                public void onClick(View view) {
                    Intent launchIntentForPackage = CloudClientActivity.this.getPackageManager().getLaunchIntentForPackage("com.hjwordgames");
                    launchIntentForPackage.addFlags(335544320);
                    if (launchIntentForPackage != null) {
                        CloudClientActivity.this.startActivity(launchIntentForPackage);
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

    private void initSuiningListener() {
        for (int i = 0; i < 10; i++) {
            this.imageViews[i].setOnClickListener(this);
        }
        this.imageViewSetting.setOnClickListener(this);
        this.wifi_btn.setOnClickListener(this);
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
            public void onClick(View view) {
                CloudClientActivity.this.getNetworkTime(0);
            }
        });
        this.tv_tel.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.20
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                CloudClientActivity.this.getNetworkTime(1);
            }
        });
        for (int i = 0; i < 10 && i < 10; i++) {
            isShowView(this.imageViews[i], true);
            isShowView(this.textViews[i], true);
        }
    }

    private void initVariable() {
        this.mPackageManager = getPackageManager();
        DisplayMetrics displayMetrics = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        mWidth = displayMetrics.widthPixels;
        mHight = displayMetrics.heightPixels;
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
            public void onClick(View view) {
                CloudClientActivity.this.getNetworkTime(0);
            }
        });
        this.tv_tel.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.22
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                CloudClientActivity.this.getNetworkTime(1);
            }
        });
        for (int i = 0; i < this.imageViews.length && i < this.textViews.length; i++) {
            isShowView(this.imageViews[i], true);
            isShowView(this.textViews[i], true);
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
        boolean z = getSharedPreferences("eyeproc", 0).getBoolean("state", false);
        if (this.tv_main_eryproc != null) {
            this.tv_main_eryproc.setChecked(z);
            broadEyeProc(this, z);
        }
        this.tv_main_eryproc.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.13
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton compoundButton, boolean z2) {
                SharedPreferences sharedPreferences = CloudClientActivity.this.getSharedPreferences("eyeproc", 0);
                CloudClientActivity.this.broadEyeProc(CloudClientActivity.this, z2);
                sharedPreferences.edit().putBoolean("state", z2).commit();
            }
        });
        try {
            if (Build.DISPLAY.contains("M1016Pro") || Build.DISPLAY.contains("P990S.V") || Build.DISPLAY.contains("S1016") || Build.DISPLAY.contains("M856.V")) {
                this.tv_line.setVisibility(0);
                this.tv_main_eryproc.setVisibility(0);
            } else {
                this.tv_line.setVisibility(4);
                this.tv_main_eryproc.setVisibility(4);
                this.tv_main_eryproc.setWidth(1);
                this.tv_main_eryproc.setHeight(1);
            }
        } catch (Exception e) {
        }
    }

    private void init_public_infor() {
        this.hashmap = XmlLoadHelper.loadXml();
        if (this.hashmap == null) {
            return;
        }
        this.username = this.hashmap.get("username");
        if (this.hashmap.containsKey("stuname")) {
        }
        String str = this.hashmap.get("stuname");
        if (str != null && this.tv_stuname != null) {
            if (AppEnvironment.isMAINNEW || AppEnvironment.isDEMO) {
                this.tv_stuname.setText(str);
            } else {
                this.tv_stuname.setText(String.valueOf(getResources().getString(R.string.student)) + " " + str);
            }
        }
        My_Application.LoginName = this.username;
    }

    public void installNewApk() {
        if (this.apkList == null || this.apkList.size() <= 0) {
            return;
        }
        this.mMiaMdmPolicyManager = new MiaMdmPolicyManager(this);
        boolean z = false;
        try {
            z = this.mHwPDM.isRecentTaskButtonDisabled(this.cn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (int i = 0; i < this.apkList.size(); i++) {
            if (this.apkList.get(i).lastIndexOf(".apk") != -1) {
                if (z) {
                    try {
                        this.mHwPDM.installPackage(this.cn, this.apkList.get(i));
                    } catch (Exception e2) {
                    }
                } else if (Build.DISPLAY.contains("A10-70LC") || Build.DISPLAY.contains("TB-8703N") || Build.DISPLAY.contains("TB-8604F") || Build.DISPLAY.contains("A10-70F") || Build.DISPLAY.contains("YiJiao") || Build.DISPLAY.contains("YOGATablet2-1050LC")) {
                    this.mMiaMdmPolicyManager.silentInstall(this.apkList.get(i));
                } else if (this != null) {
                    try {
                        if (Build.DISPLAY.indexOf("P990S.V") >= 0 || Build.DISPLAY.indexOf("M1016Pro") >= 0 || Build.DISPLAY.indexOf("S1016PRO") >= 0 || Build.DISPLAY.indexOf("D13B") >= 0 || Build.DISPLAY.indexOf("QC80A") >= 0 || Build.DISPLAY.indexOf("N5110ZB") >= 0 || Build.DISPLAY.indexOf(".T360Z") >= 0 || Build.DISPLAY.indexOf("P583") >= 0 || Build.DISPLAY.indexOf("P350") >= 0 || Build.DISPLAY.indexOf("P550") >= 0 || Build.DISPLAY.indexOf("M856.V") >= 0 || Build.DISPLAY.indexOf("S1016.V1") >= 0 || Build.DISPLAY.indexOf("S106.V1") >= 0 || Build.DISPLAY.indexOf("S1016E") >= 0) {
                            apkinstall_samsung(this.apkList.get(i));
                        } else {
                            Intent intent = new Intent();
                            intent.setAction(sysProtectService.INSTALL);
                            sendBroadcast(intent);
                            apkinstall(this.apkList.get(i));
                        }
                    } catch (Exception e3) {
                    }
                }
            }
        }
        finish();
    }

    public void installSingleApk(String str) {
        if (TextUtils.isEmpty(str) || str.lastIndexOf(".apk") == -1) {
            return;
        }
        boolean z = false;
        this.mMiaMdmPolicyManager = new MiaMdmPolicyManager(this);
        try {
            z = this.mHwPDM.isRecentTaskButtonDisabled(this.cn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (z) {
            try {
                this.mHwPDM.installPackage(this.cn, str);
            } catch (Exception e2) {
            }
        } else if (Build.DISPLAY.contains("A10-70LC") || Build.DISPLAY.contains("TB-8703N") || Build.DISPLAY.contains("TB-8604F") || Build.DISPLAY.contains("A10-70F") || Build.DISPLAY.contains("YiJiao") || Build.DISPLAY.contains("YOGATablet2-1050LC")) {
            this.mMiaMdmPolicyManager.silentInstall(str);
        } else {
            try {
                if (Build.DISPLAY.indexOf("M1016Pro") >= 0 || Build.DISPLAY.indexOf("P990S.V") >= 0 || Build.DISPLAY.indexOf("S1016PRO") >= 0 || Build.DISPLAY.indexOf("D13B") >= 0 || Build.DISPLAY.indexOf("QC80A") >= 0 || Build.DISPLAY.indexOf("N5110ZB") >= 0 || Build.DISPLAY.indexOf(".T360Z") >= 0 || Build.DISPLAY.indexOf("P350") >= 0 || Build.DISPLAY.indexOf("P550") >= 0 || Build.DISPLAY.indexOf("M856.V") >= 0 || Build.DISPLAY.indexOf("S1016.V1") >= 0 || Build.DISPLAY.indexOf("S106.V1") >= 0 || Build.DISPLAY.indexOf("S1016E") >= 0 || Build.DISPLAY.indexOf("P583") >= 0) {
                    apkinstall_samsung(str);
                } else {
                    Intent intent = new Intent();
                    intent.setAction(sysProtectService.INSTALL);
                    sendBroadcast(intent);
                    apkinstall(str);
                }
            } catch (Exception e3) {
            }
        }
    }

    private boolean isApkUpdating(String str) {
        boolean z = true;
        long currentTimeMillis = System.currentTimeMillis();
        long j = getSharedPreferences("resumeconfig", 0).getLong("updateapks", 0L);
        if (currentTimeMillis - j > 480000 && j != 0) {
            this.apkUpdatePkgList = null;
        }
        if (this.apkUpdatePkgList != null && this.apkUpdatePkgList.size() > 0 && !TextUtils.isEmpty(str)) {
            int i = 0;
            while (true) {
                if (i >= this.apkUpdatePkgList.size()) {
                    break;
                } else if (str.equals(this.apkUpdatePkgList.get(i))) {
                    z = false;
                    break;
                } else {
                    i++;
                }
            }
        } else {
            z = true;
        }
        return z;
    }

    public static boolean isServiceExisted(Context context, String str) {
        boolean z;
        List<ActivityManager.RunningServiceInfo> runningServices = ((ActivityManager) context.getSystemService("activity")).getRunningServices(Execute.INVALID);
        if (runningServices.size() <= 0) {
            z = false;
        } else {
            int i = 0;
            while (true) {
                z = false;
                if (i >= runningServices.size()) {
                    break;
                } else if (runningServices.get(i).service.getClassName().equals(str)) {
                    z = true;
                    break;
                } else {
                    i++;
                }
            }
        }
        return z;
    }

    private void isShowView(View view, boolean z) {
        view.setVisibility(z ? 0 : 8);
    }

    private void judgeApp(String str, int i) {
        if (str.equals("daoxueben")) {
            if (i == 1) {
                AppEnvironment.ONE_IMG = true;
            } else {
                AppEnvironment.ONE_IMG = false;
            }
        } else if (str.equals("zuoyefudao")) {
            if (i == 1) {
                AppEnvironment.TWO_IMG = true;
            } else {
                AppEnvironment.TWO_IMG = false;
            }
        } else if (str.equals("myhomework")) {
            if (i == 1) {
                AppEnvironment.THREE_IMG = true;
            } else {
                AppEnvironment.THREE_IMG = false;
            }
        } else if (str.equals("cuotiji")) {
            if (i == 1) {
                AppEnvironment.FOUR_IMG = true;
            } else {
                AppEnvironment.FOUR_IMG = false;
            }
        } else if (str.equals("afd_mybook")) {
            if (i == 1) {
                AppEnvironment.FIVE_IMG = true;
            } else {
                AppEnvironment.FIVE_IMG = false;
            }
        } else if (str.equals("my_app")) {
            if (i == 1) {
                AppEnvironment.SIX_IMG = true;
            } else {
                AppEnvironment.SIX_IMG = false;
            }
        } else if (str.equals("my_camera")) {
            if (i == 1) {
                AppEnvironment.SEVEN_IMG = true;
            } else {
                AppEnvironment.SEVEN_IMG = false;
            }
        } else if (str.equals("myfiles")) {
            if (i == 1) {
                AppEnvironment.EIGHT_IMG = true;
            } else {
                AppEnvironment.EIGHT_IMG = false;
            }
        } else if (str.equals("home_school")) {
            if (i == 1) {
                AppEnvironment.NINE_IMG = true;
            } else {
                AppEnvironment.NINE_IMG = false;
            }
        } else if (str.equals("hudongtaolun")) {
            if (i == 1) {
                AppEnvironment.TEN_IMG = true;
            } else {
                AppEnvironment.TEN_IMG = false;
            }
        } else if (str.equals("study_store")) {
            if (i == 1) {
                AppEnvironment.ELEVEN_IMG = true;
            } else {
                AppEnvironment.ELEVEN_IMG = false;
            }
        } else if (!str.equals("happ_class")) {
        } else {
            if (i == 1) {
                AppEnvironment.TWELVE_IMG = true;
            } else {
                AppEnvironment.TWELVE_IMG = false;
            }
        }
    }

    private void judgeIcon(AppBean appBean) {
        String code = appBean.getCode();
        if (code.equals("daoxueben")) {
            if (!TextUtils.isEmpty(appBean.getName())) {
                this.textViews[0].setText(appBean.getName());
            }
            this.textViews[0].setTextColor(Color.parseColor(appBean.getColor()));
            Bitmap decodeFile = BitmapFactory.decodeFile(appBean.getIconLocal());
            if (decodeFile == null) {
                return;
            }
            this.imageViews[0].setImageBitmap(decodeFile);
        } else if (code.equals("zuoyefudao")) {
            if (!TextUtils.isEmpty(appBean.getName())) {
                this.textViews[1].setText(appBean.getName());
            }
            this.textViews[1].setTextColor(Color.parseColor(appBean.getColor()));
            Bitmap decodeFile2 = BitmapFactory.decodeFile(appBean.getIconLocal());
            if (decodeFile2 == null) {
                return;
            }
            this.imageViews[1].setImageBitmap(decodeFile2);
        } else if (code.equals("myhomework")) {
            if (!TextUtils.isEmpty(appBean.getName())) {
                this.textViews[2].setText(appBean.getName());
            }
            this.textViews[2].setTextColor(Color.parseColor(appBean.getColor()));
            Bitmap decodeFile3 = BitmapFactory.decodeFile(appBean.getIconLocal());
            if (decodeFile3 == null) {
                return;
            }
            this.imageViews[2].setImageBitmap(decodeFile3);
        } else if (code.equals("cuotiji")) {
            if (!TextUtils.isEmpty(appBean.getName())) {
                this.textViews[3].setText(appBean.getName());
            }
            this.textViews[3].setTextColor(Color.parseColor(appBean.getColor()));
            Bitmap decodeFile4 = BitmapFactory.decodeFile(appBean.getIconLocal());
            if (decodeFile4 == null) {
                return;
            }
            this.imageViews[3].setImageBitmap(decodeFile4);
        } else if (code.equals("afd_mybook")) {
            if (!TextUtils.isEmpty(appBean.getName())) {
                this.textViews[4].setText(appBean.getName());
            }
            this.textViews[4].setTextColor(Color.parseColor(appBean.getColor()));
            Bitmap decodeFile5 = BitmapFactory.decodeFile(appBean.getIconLocal());
            if (decodeFile5 == null) {
                return;
            }
            this.imageViews[4].setImageBitmap(decodeFile5);
        } else if (code.equals("my_app")) {
            if (!TextUtils.isEmpty(appBean.getName())) {
                this.textViews[5].setText(appBean.getName());
            }
            this.textViews[5].setTextColor(Color.parseColor(appBean.getColor()));
            Bitmap decodeFile6 = BitmapFactory.decodeFile(appBean.getIconLocal());
            if (decodeFile6 == null) {
                return;
            }
            this.imageViews[5].setImageBitmap(decodeFile6);
        } else if (code.equals("my_camera")) {
            if (!TextUtils.isEmpty(appBean.getName())) {
                this.textViews[6].setText(appBean.getName());
            }
            this.textViews[6].setTextColor(Color.parseColor(appBean.getColor()));
            Bitmap decodeFile7 = BitmapFactory.decodeFile(appBean.getIconLocal());
            if (decodeFile7 == null) {
                return;
            }
            this.imageViews[6].setImageBitmap(decodeFile7);
        } else if (code.equals("myfiles")) {
            if (!TextUtils.isEmpty(appBean.getName())) {
                this.textViews[7].setText(appBean.getName());
            }
            this.textViews[7].setTextColor(Color.parseColor(appBean.getColor()));
            Bitmap decodeFile8 = BitmapFactory.decodeFile(appBean.getIconLocal());
            if (decodeFile8 == null) {
                return;
            }
            this.imageViews[7].setImageBitmap(decodeFile8);
        } else if (code.equals("home_school")) {
            if (!TextUtils.isEmpty(appBean.getName())) {
                this.textViews[8].setText(appBean.getName());
            }
            this.textViews[8].setTextColor(Color.parseColor(appBean.getColor()));
            Bitmap decodeFile9 = BitmapFactory.decodeFile(appBean.getIconLocal());
            if (decodeFile9 == null) {
                return;
            }
            this.imageViews[8].setImageBitmap(decodeFile9);
        } else if (code.equals("hudongtaolun")) {
            if (!TextUtils.isEmpty(appBean.getName())) {
                this.textViews[9].setText(appBean.getName());
            }
            this.textViews[9].setTextColor(Color.parseColor(appBean.getColor()));
            Bitmap decodeFile10 = BitmapFactory.decodeFile(appBean.getIconLocal());
            if (decodeFile10 == null) {
                return;
            }
            this.imageViews[9].setImageBitmap(decodeFile10);
        } else if (code.equals("study_store")) {
            if (!TextUtils.isEmpty(appBean.getName())) {
                this.textViews[10].setText(appBean.getName());
            }
            this.textViews[10].setTextColor(Color.parseColor(appBean.getColor()));
            Bitmap decodeFile11 = BitmapFactory.decodeFile(appBean.getIconLocal());
            if (decodeFile11 == null) {
                return;
            }
            this.imageViews[10].setImageBitmap(decodeFile11);
        } else if (!code.equals("happ_class")) {
        } else {
            if (!TextUtils.isEmpty(appBean.getName())) {
                this.textViews[11].setText(appBean.getName());
            }
            this.textViews[11].setTextColor(Color.parseColor(appBean.getColor()));
            Bitmap decodeFile12 = BitmapFactory.decodeFile(appBean.getIconLocal());
            if (decodeFile12 == null) {
                return;
            }
            this.imageViews[11].setImageBitmap(decodeFile12);
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

    private void loadUserInfo() {
        SharedPreferences sharedPreferences = getSharedPreferences("privatekey", 0);
        HashMap<String, String> loadXml = XmlLoadHelper.loadXml();
        if (loadXml != null) {
            this.send_ip = loadXml.get("ip");
            this.send_name = loadXml.get("username");
            this.send_usercode = loadXml.get("usercode");
            this.send_privatekey = loadXml.get("privatekey");
            this.send_pwd = loadXml.get("pwd");
            this.send_schoolid = loadXml.get("schoolid");
            String str = loadXml.get("stuid");
            sharedPreferences.edit().putString("key", this.send_privatekey).commit();
            sharedPreferences.edit().putString("apihost", this.send_ip).commit();
            sharedPreferences.edit().putString("name", this.send_usercode).commit();
            sharedPreferences.edit().putString("pwd", this.send_pwd).commit();
            sharedPreferences.edit().putString("userid", str).commit();
            sharedPreferences.edit().putString("schoolid", this.send_schoolid).commit();
        }
    }

    public void lockPad() {
        SharedPreferences sharedPreferences = getSharedPreferences("lockscreen", 4);
        boolean z = sharedPreferences.getBoolean("locked", false);
        long j = sharedPreferences.getLong("lockstartTime", 0L);
        long j2 = sharedPreferences.getLong("tmplockedtime", 0L);
        int i = sharedPreferences.getInt("tmplocked", 0);
        if (z && j != 0) {
            Intent intent = new Intent(AppEnvironment.Intent_LOCKWINDOW);
            intent.putExtra("state", LogHelp.TYPE_MYWORK);
            sendBroadcast(intent);
        } else if (i != 1 || j2 == 0) {
            sendBroadcast(new Intent(AppEnvironment.Intent_UNLOCKWINDOW));
        } else {
            Intent intent2 = new Intent(AppEnvironment.Intent_LOCKWINDOW);
            intent2.putExtra("state", LogHelp.TYPE_GUIDANCE);
            sendBroadcast(intent2);
        }
    }

    private void openCamera() {
        try {
            if (getPackageManager().getPackageInfo("com.edutech.mycamera", 0) != null) {
                ComponentName componentName = new ComponentName("com.edutech.mycamera", "com.edutech.mycamera.gallery.PhotoPickerActivity");
                Intent intent = new Intent();
                intent.addCategory("android.intent.category.LAUNCHER");
                intent.setComponent(componentName);
                intent.setAction("android.intent.action.MAIN");
                intent.setFlags(268435456);
                startActivity(intent);
                return;
            }
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e2) {
        }
        if (AppEnvironment.isZBYZ) {
            Toast.makeText(this, "该功能暂不开放！", 0).show();
            return;
        }
        try {
            ResolveInfo resolveActivity = getPackageManager().resolveActivity(new Intent("android.media.action.IMAGE_CAPTURE"), 0);
            String str = resolveActivity.activityInfo.packageName;
            String str2 = resolveActivity.activityInfo.name;
            Intent intent2 = new Intent();
            intent2.setComponent(new ComponentName(str, str2));
            intent2.setAction("android.intent.action.MAIN");
            startActivity(intent2);
        } catch (Exception e3) {
            e3.printStackTrace();
            startActivity(new Intent("android.media.action.IMAGE_CAPTURE"));
        }
    }

    private void openLockScreen() {
        PackageInfo packageInfo;
        try {
            SharedPreferences sharedPreferences = getSharedPreferences("screenshot", 0);
            sharedPreferences.getBoolean("locked", false);
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.addFlags(268435456);
            intent.setComponent(new ComponentName("com.edutech.lockscreen", "com.edutech.lockscreen.MainActivity"));
            try {
                packageInfo = getPackageManager().getPackageInfo("com.edutech.lockscreen", 0);
            } catch (PackageManager.NameNotFoundException e) {
                packageInfo = null;
                e.printStackTrace();
            }
            if (packageInfo != null) {
                startActivity(intent);
            }
            sharedPreferences.edit().putBoolean("locked", true).commit();
        } catch (Exception e2) {
        }
    }

    private void openScreenShot() {
        PackageInfo packageInfo;
        try {
            SharedPreferences sharedPreferences = getSharedPreferences("screenshot", 0);
            Log.e(TAG, "open screenshot:" + sharedPreferences.getBoolean("opened", false));
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.addFlags(268435456);
            intent.setComponent(new ComponentName("com.edutech.screenshot", "com.edutech.screenshot.ScreenShotActivity"));
            try {
                packageInfo = getPackageManager().getPackageInfo("com.edutech.screenshot", 0);
            } catch (PackageManager.NameNotFoundException e) {
                packageInfo = null;
                e.printStackTrace();
            }
            if (packageInfo != null) {
                startActivity(intent);
            }
            Log.e(TAG, "open screenshot.....");
            sharedPreferences.edit().putBoolean("opened", true).commit();
        } catch (Exception e2) {
        }
    }

    private void openSetting() {
        try {
            if (getPackageManager().getPackageInfo("com.edutech.settingapp", 0) != null) {
                ComponentName componentName = new ComponentName("com.edutech.settingapp", "com.edutech.settingapp.CloudClientSetActivity");
                Intent intent = new Intent();
                intent.addCategory("android.intent.category.LAUNCHER");
                intent.setComponent(componentName);
                intent.setAction("android.intent.action.MAIN");
                intent.setFlags(268435456);
                startActivity(intent);
                return;
            }
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        openActivity(CloudClientSetActivity.class);
    }

    public List<String> parseDownload(List<String> list, List<ApkUpdateBean> list2) {
        HttpURLConnection httpURLConnection;
        for (int i = 0; i < list2.size(); i++) {
            ApkUpdateBean apkUpdateBean = list2.get(i);
            String packagename = apkUpdateBean.getPackagename();
            String apkUrl = apkUpdateBean.getApkUrl();
            String appName = apkUpdateBean.getAppName();
            long apkSize = apkUpdateBean.getApkSize();
            File file = new File(AppEnvironment.ASSETS_APKS);
            if (!file.exists()) {
                file.mkdirs();
            }
            if (file.isDirectory()) {
                File file2 = new File(String.valueOf(AppEnvironment.ASSETS_DIR) + appName);
                if (file2.exists()) {
                    file2.delete();
                }
                byte[] bArr = new byte[10240];
                long j = 0;
                try {
                    httpURLConnection = (HttpURLConnection) new URL(apkUrl).openConnection();
                    httpURLConnection.connect();
                    InputStream inputStream = httpURLConnection.getInputStream();
                    FileOutputStream fileOutputStream = new FileOutputStream(file2);
                    int i2 = 0;
                    while (j < apkSize) {
                        int read = inputStream.read(bArr);
                        if (read == -1) {
                            break;
                        }
                        long j2 = j + read;
                        this.currentCachePosition += read;
                        fileOutputStream.write(bArr, 0, read);
                        int i3 = i2 + 1;
                        j = j2;
                        i2 = i3;
                        if (i3 % 10 == 0) {
                            sendInstallMessage(i, Long.valueOf(j2), UPDATE_PROGRESS);
                            j = j2;
                            i2 = i3;
                        }
                    }
                    sendInstallMessage(i, Long.valueOf(j), UPDATE_PROGRESS);
                    long j3 = j;
                    fileOutputStream.close();
                    long j4 = j;
                    inputStream.close();
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                    j = 0;
                    httpURLConnection = null;
                } catch (IOException e2) {
                    e2.printStackTrace();
                    j = 0;
                    httpURLConnection = null;
                } catch (Exception e3) {
                    j = 0;
                    httpURLConnection = null;
                }
                if (httpURLConnection != null) {
                    httpURLConnection.disconnect();
                }
                if (j != apkSize) {
                    sendInstallMessage(i, -2, UPDATE_INSTALLSTATE);
                } else if (!packagename.equals("com.launcher.activity")) {
                    list.add(String.valueOf(AppEnvironment.ASSETS_DIR) + appName);
                    sendInstallMessage(-1, String.valueOf(AppEnvironment.ASSETS_DIR) + appName, UPDATE_INSTALLSINGLE);
                    sendInstallMessage(i, 0, UPDATE_INSTALLSTATE);
                    this.addApksList.add(packagename);
                } else {
                    try {
                        ApkUpdateBean apkUpdateBean2 = this.apkUpdateList.get(i);
                        apkUpdateBean2.setApkLocalPath(String.valueOf(AppEnvironment.ASSETS_DIR) + appName);
                        this.apkUpdateList.set(i, apkUpdateBean2);
                    } catch (Exception e4) {
                    }
                    if (list2.size() == 1) {
                        sendInstallMessage(-1, String.valueOf(AppEnvironment.ASSETS_DIR) + appName, UPDATE_INSTALLSINGLE);
                        sendInstallMessage(i, 0, UPDATE_INSTALLSTATE);
                    }
                    this.launcherPath = String.valueOf(AppEnvironment.ASSETS_DIR) + appName;
                }
            }
        }
        return list;
    }

    public void refreshDownloadPB() {
        if (this.canRefresh && this.tv_updatemsg != null) {
            DecimalFormat decimalFormat = new DecimalFormat("##0.00");
            this.tv_updatemsg.setText(String.valueOf(getResources().getString(R.string.updateapks)) + (String.valueOf(decimalFormat.format(((this.currentCachePosition * 1.0d) / 1024.0d) / 1024.0d)) + "MB/" + decimalFormat.format(((this.currentCacheLength * 1.0d) / 1024.0d) / 1024.0d) + "MB"));
        }
    }

    private void removeIllegalApks() {
        new Thread(new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.24
            /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:47:0x00f9 -> B:3:0x0006). Please submit an issue!!! */
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Thread.sleep(3000L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (Build.DISPLAY.contains("A10-70LC") || Build.DISPLAY.contains("TB-8703N") || Build.DISPLAY.contains("TB-8604F") || Build.DISPLAY.contains("A10-70F") || Build.DISPLAY.contains("YiJiao") || Build.DISPLAY.contains("YOGATablet2-1050LC") || Build.DISPLAY.indexOf("S1016PRO") >= 0 || Build.DISPLAY.indexOf("M1016Pro") >= 0 || Build.DISPLAY.indexOf("P990S.V") >= 0 || Build.DISPLAY.indexOf("D13B") >= 0 || Build.DISPLAY.indexOf("QC80A") >= 0 || Build.DISPLAY.indexOf("N5110ZB") >= 0 || Build.DISPLAY.indexOf(".T360Z") >= 0 || Build.DISPLAY.indexOf("P583") >= 0 || Build.DISPLAY.indexOf("P350") >= 0 || Build.DISPLAY.indexOf("P550") >= 0 || Build.DISPLAY.indexOf("M856.V") >= 0 || Build.DISPLAY.indexOf("S1016.V1") >= 0 || Build.DISPLAY.indexOf("S106.V1") >= 0 || Build.DISPLAY.indexOf("S1016E") >= 0) {
                    try {
                        CloudClientActivity.this.getMyApps(CloudClientActivity.this.send_ip, CloudClientActivity.this.send_privatekey);
                    } catch (Exception e2) {
                    }
                }
            }
        }).start();
    }

    private void resetAutoSp() {
        SharedPreferences sharedPreferences = getSharedPreferences("resumeconfig", 0);
        sharedPreferences.edit().putLong("updateapks", 0L).commit();
        sharedPreferences.edit().putLong("updatedesign", 0L).commit();
        getSharedPreferences("noticemessage", 0).edit().putLong("noticetime", 0L).commit();
    }

    public void sendInstallMessage(int i, Object obj, int i2) {
        Message message = new Message();
        message.arg1 = i;
        message.what = i2;
        message.obj = obj;
        this.installHandler.sendMessage(message);
    }

    private void setDefaultSetting() {
        this.cn = new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity");
        this.mHwPDM = new HwDevicePolicyManager(this);
        this.mHwPDM.setCustomLauncher(this.cn, "com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity");
        if (Build.DISPLAY.contains("TB-8703N") || Build.DISPLAY.contains("TB-8604F") || Build.DISPLAY.contains("A10-70F") || Build.DISPLAY.contains("YiJiao") || Build.DISPLAY.contains("YOGATablet2-1050LC")) {
            MiaMdmPolicyManager miaMdmPolicyManager = new MiaMdmPolicyManager(getApplicationContext());
            miaMdmPolicyManager.setCustomLauncher("com.launcher.activity");
            miaMdmPolicyManager.controlBluetooth(false);
        }
        this.mDPM = (DevicePolicyManager) getSystemService("device_policy");
        this.mDeviceAdmin = new ComponentName(this, SampleAdmin.class);
        PgyCrashManager.register(this, AppEnvironment.My_APPID);
        if (AppEnvironment.isNL || AppEnvironment.isNLEZ) {
            try {
                if (this.deletingFiles) {
                    return;
                }
                new Thread(new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.14
                    @Override // java.lang.Runnable
                    public void run() {
                        CloudClientActivity.this.deletingFiles = true;
                        CloudClientActivity.this.deleteCameraFiles();
                    }
                }).start();
            } catch (NullPointerException e) {
            } catch (Exception e2) {
            }
        }
    }

    public void setDesignView() {
        try {
            if (this.isGetLauncher) {
                return;
            }
            new ArrayList();
            ArrayList<AppBean> loadXml2 = XmlLoadHelper.loadXml2();
            enableButtons(loadXml2);
            changeIcons(loadXml2);
        } catch (Exception e) {
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

    public void showFailedApkInfo() {
        if (!this.canRefresh) {
            return;
        }
        if (!AppEnvironment.isNewUpdate) {
            if (this.tv_updatemsg == null) {
                return;
            }
            this.tv_updatemsg.setVisibility(4);
            return;
        }
        try {
            if (this.tv_updatemsg == null) {
                return;
            }
            List<String> failedEbagUpdated = Utils.getFailedEbagUpdated(this, getSharedPreferences("privatekey", 0).getString("apihost", ""));
            if (failedEbagUpdated == null || failedEbagUpdated.size() <= 0) {
                this.tv_updatemsg.setVisibility(8);
                return;
            }
            String string = getResources().getString(R.string.uninstallapks);
            for (int i = 0; i < failedEbagUpdated.size(); i++) {
                string = String.valueOf(string) + failedEbagUpdated.get(i) + "  ";
            }
            this.tv_updatemsg.setVisibility(0);
            this.tv_updatemsg.setText(string);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void showNoticeDetails() {
        if (!this.canRefresh) {
            return;
        }
        if (this.noticeDialog == null) {
            AlertDialog.Builder builder = new AlertDialog.Builder(this);
            View inflate = LayoutInflater.from(this).inflate(R.layout.dialog_noticemessage, (ViewGroup) null);
            this.dialog_noticemessage_listview = (ListView) inflate.findViewById(R.id.dialog_noticemessage_listview);
            this.dialog_noticemessage_tvnotice = (TextView) inflate.findViewById(R.id.dialog_noticemessage_tvnotice);
            this.dialog_noticemessage_tvok = (TextView) inflate.findViewById(R.id.dialog_noticemessage_tvok);
            this.noticeAdapter = new NoticeAdapter();
            this.dialog_noticemessage_listview.setAdapter((ListAdapter) this.noticeAdapter);
            this.dialog_noticemessage_tvok.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.28
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    if (CloudClientActivity.this.noticeDialog != null) {
                        CloudClientActivity.this.noticeDialog.dismiss();
                    }
                }
            });
            builder.setView(inflate);
            this.noticeDialog = builder.create();
        }
        if (this.noticeNum <= 0) {
            return;
        }
        SharedPreferences sharedPreferences = getSharedPreferences("noticemessage", 0);
        long j = sharedPreferences.getLong("noticetime", 0L);
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis - j < 3600000) {
            return;
        }
        sharedPreferences.edit().putLong("noticetime", currentTimeMillis).commit();
        if (this.dialog_noticemessage_listview != null && this.noticeMessages != null && this.noticeAdapter != null) {
            this.noticeAdapter.setDatas(this.noticeMessages);
        }
        if (this.dialog_noticemessage_tvnotice != null) {
            this.dialog_noticemessage_tvnotice.setText("未查看作业：" + this.noticeNum + "份");
        }
        this.noticeDialog.show();
    }

    private void showNoticeDialog(String str, String str2) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        if (!TextUtils.isEmpty(str)) {
            builder.setTitle(str);
        }
        if (!TextUtils.isEmpty(str2)) {
            builder.setMessage(str2);
        }
        builder.setPositiveButton(getResources().getString(R.string.dialog_noticebutton), new DialogInterface.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.25
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.dismiss();
            }
        });
        builder.create().show();
    }

    private void showPackageMain() {
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.addCategory("android.intent.category.HOME");
        getPackageManager().resolveActivity(intent, 0);
    }

    private void startActivity(Intent intent, String str) {
        if (isApkUpdating(str)) {
            startActivity(intent);
        } else {
            showNoticeDialog(getResources().getString(R.string.dialog_noticetitle), getResources().getString(R.string.dialog_noticemessage));
        }
    }

    private void startWifiActivity() {
        PackageInfo packageInfo;
        PackageInfo packageInfo2;
        if (!Build.DISPLAY.contains("YOGATablet2-1050LC") || !Build.DISPLAY.contains("YiJiao")) {
            String str = "com.edutech.wificonn";
            String str2 = "com.edutech.wificonn.WifiConnActivity";
            try {
                packageInfo = getPackageManager().getPackageInfo("com.edutech.wificonn", 0);
            } catch (PackageManager.NameNotFoundException e) {
                packageInfo = null;
                str = AppEnvironment.WIFI_PACKNAME;
                str2 = "zte.com.wilink.wifi.WifiSettingActivity";
                e.printStackTrace();
            }
            try {
                packageInfo = getPackageManager().getPackageInfo(str, 0);
            } catch (PackageManager.NameNotFoundException e2) {
                packageInfo = null;
                e2.printStackTrace();
            } catch (Exception e3) {
            }
            if (packageInfo == null) {
                return;
            }
            ComponentName componentName = new ComponentName(str, str2);
            Intent intent = new Intent();
            intent.setComponent(componentName);
            intent.addFlags(268435456);
            intent.setAction("android.intent.action.MAIN");
            intent.addCategory("android.intent.category.LAUNCHER");
            startActivity(intent, str);
            return;
        }
        String str3 = AppEnvironment.WIFI_PACKNAME;
        String str4 = "zte.com.wilink.wifi.WifiSettingActivity";
        try {
            packageInfo2 = getPackageManager().getPackageInfo(AppEnvironment.WIFI_PACKNAME, 0);
        } catch (PackageManager.NameNotFoundException e4) {
            packageInfo2 = null;
            str3 = "com.edutech.wificonn";
            str4 = "com.edutech.wificonn.WifiConnActivity";
            e4.printStackTrace();
        }
        try {
            packageInfo2 = getPackageManager().getPackageInfo(str3, 0);
        } catch (PackageManager.NameNotFoundException e5) {
            packageInfo2 = null;
            e5.printStackTrace();
        } catch (Exception e6) {
        }
        if (packageInfo2 == null) {
            return;
        }
        Log.i("qwe", "packageInfo != null");
        ComponentName componentName2 = new ComponentName(str3, str4);
        Intent intent2 = new Intent();
        intent2.setComponent(componentName2);
        intent2.addFlags(268435456);
        intent2.setAction("android.intent.action.MAIN");
        intent2.addCategory("android.intent.category.LAUNCHER");
        startActivity(intent2, str3);
    }

    private void uploadLogs() {
        final File file = new File(AppEnvironment.LOG_PATH);
        if (!file.exists()) {
            return;
        }
        if (Math.abs(System.currentTimeMillis() - file.lastModified()) <= 3600000 || this.send_ip == null || this.send_ip.equals("")) {
            return;
        }
        new Thread(new Runnable() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.17
            @Override // java.lang.Runnable
            public void run() {
                String str = "http://" + CloudClientActivity.this.send_ip + "/api/padlog/";
                String str2 = "";
                try {
                    str2 = FileUtils.readFileToString(file, "UTF-8");
                } catch (IOException e) {
                    e.printStackTrace();
                }
                if (str == null || str2 == null || "".equals(str) || "".equals(str2)) {
                    return;
                }
                HttpPost httpPostInit = CloudClientActivity.httpPostInit(str, CloudClientActivity.this.send_privatekey, CloudClientActivity.this.send_name);
                ArrayList arrayList = new ArrayList();
                arrayList.add(new BasicNameValuePair("data", str2));
                try {
                    try {
                        httpPostInit.setEntity(new UrlEncodedFormEntity(arrayList, "UTF-8"));
                        HttpResponse execute = new DefaultHttpClient().execute(httpPostInit);
                        if (execute.getStatusLine().getStatusCode() == 200) {
                            try {
                                if (new JSONObject(EntityUtils.toString(execute.getEntity())).getBoolean("status")) {
                                    file.delete();
                                }
                            } catch (NullPointerException e2) {
                            } catch (JSONException e3) {
                                e3.printStackTrace();
                            } catch (Exception e4) {
                            }
                        } else {
                            System.out.println("Error Response: " + execute.getStatusLine().toString());
                        }
                    } catch (Exception e5) {
                        e5.printStackTrace();
                    }
                } catch (ClientProtocolException e6) {
                    e6.printStackTrace();
                }
            }
        }).start();
    }

    public void SamSungInCharge() {
        try {
            try {
                if (!this.LicenseOK) {
                    try {
                        EnterpriseLicenseManager enterpriseLicenseManager = EnterpriseLicenseManager.getInstance(this);
                        if (isWifiConn()) {
                            enterpriseLicenseManager.activateLicense(SKEY);
                        } else {
                            startWifiActivity();
                        }
                    } catch (NoClassDefFoundError e) {
                    }
                } else if (!this.mDPM.isAdminActive(this.mDeviceAdmin)) {
                } else {
                    try {
                        if (MultiUserManager.getInstance(this).isUserCreationAllowed()) {
                            MultiUserManager.getInstance(this).allowUserCreation(false);
                        }
                    } catch (Exception e2) {
                    }
                    try {
                        if (MultiUserManager.getInstance(this).multipleUsersAllowed()) {
                            MultiUserManager.getInstance(this).allowMultipleUsers(false);
                        }
                    } catch (Exception e3) {
                    }
                    try {
                        KioskMode kioskMode = KioskMode.getInstance(this);
                        kioskMode.allowMultiWindowMode(true);
                        kioskMode.allowMultiWindowMode(false);
                    } catch (Exception e4) {
                    }
                    RestrictionPolicy restrictionPolicy = ((EnterpriseDeviceManager) getSystemService("enterprise_policy")).getRestrictionPolicy();
                    try {
                        restrictionPolicy.allowStatusBarExpansion(false);
                    } catch (SecurityException e5) {
                        Log.w(TAG, "SecurityException: " + e5);
                    }
                    try {
                        if (restrictionPolicy.allowBluetooth(false)) {
                            Log.w(TAG, "Bluetooth is disabled and cannot be enabled by user ");
                        }
                    } catch (SecurityException e6) {
                        Log.w(TAG, "SecurityException: " + e6);
                    }
                    try {
                        if (restrictionPolicy.setUsbMediaPlayerAvailability(false)) {
                            Log.e("mainactivity", "set MTP disallow true");
                        } else {
                            Log.e("mainactivity", "set MTP disallow false");
                        }
                    } catch (SecurityException e7) {
                        Log.e("mainactivity", "SecurityException: " + e7);
                        try {
                            EnterpriseLicenseManager enterpriseLicenseManager2 = EnterpriseLicenseManager.getInstance(this);
                            if (isWifiConn()) {
                                enterpriseLicenseManager2.activateLicense(SKEY);
                            } else {
                                startWifiActivity();
                            }
                        } catch (NoClassDefFoundError e8) {
                        }
                    }
                    try {
                        ((EnterpriseDeviceManager) getSystemService("enterprise_policy")).getDateTimePolicy().setAutomaticTime(true);
                    } catch (SecurityException e9) {
                        Log.w(TAG, "SecurityException: " + e9);
                    }
                }
            } catch (Exception e10) {
                e10.printStackTrace();
                try {
                    EnterpriseLicenseManager enterpriseLicenseManager3 = EnterpriseLicenseManager.getInstance(this);
                    if (isWifiConn()) {
                        enterpriseLicenseManager3.activateLicense(SKEY);
                    } else {
                        startWifiActivity();
                    }
                } catch (NoClassDefFoundError e11) {
                }
            }
        } catch (NoClassDefFoundError e12) {
            e12.printStackTrace();
        }
    }

    public void apkUpdate() {
        if (this.hasUpdated || this.isGetApks) {
            return;
        }
        if (this.updateThread != null) {
            this.updateThread = null;
            return;
        }
        if (this.tv_updatemsg != null) {
            this.tv_updatemsg.setVisibility(0);
        }
        this.updateThread = new UpdateThread();
        this.updateThread.start();
    }

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    protected void attachBaseContext(Context context) {
        try {
            super.attachBaseContext(LanguageUtils.attachBaseContext(context, context.getSharedPreferences("language", 0).getString("language", "chinese")));
        } catch (Exception e) {
        }
    }

    public String getDataFromAssets(String str) {
        Throwable th;
        BufferedReader bufferedReader;
        String readLine;
        StringBuffer stringBuffer = new StringBuffer();
        BufferedReader bufferedReader2 = null;
        try {
            try {
                BufferedReader bufferedReader3 = new BufferedReader(new InputStreamReader(getAssets().open(str)));
                while (true) {
                    try {
                        if (bufferedReader3.readLine() == null) {
                            try {
                                break;
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        } else {
                            stringBuffer.append(String.valueOf(readLine) + "\n");
                        }
                    } catch (IOException e2) {
                        bufferedReader = bufferedReader3;
                        e = e2;
                        bufferedReader2 = bufferedReader;
                        e.printStackTrace();
                        try {
                            bufferedReader.close();
                        } catch (IOException e3) {
                            e3.printStackTrace();
                        }
                        return stringBuffer.toString();
                    } catch (Throwable th2) {
                        th = th2;
                        bufferedReader2 = bufferedReader3;
                        try {
                            bufferedReader2.close();
                        } catch (IOException e4) {
                            e4.printStackTrace();
                        }
                        throw th;
                    }
                }
                bufferedReader3.close();
            } catch (IOException e5) {
                e = e5;
                bufferedReader = null;
            }
            return stringBuffer.toString();
        } catch (Throwable th3) {
            th = th3;
        }
    }

    public String getWIFISSID(Activity activity) {
        String ssid;
        if (Build.VERSION.SDK_INT >= 26) {
            String extraInfo = ((ConnectivityManager) getSystemService("connectivity")).getActiveNetworkInfo().getExtraInfo();
            ssid = extraInfo;
            if (extraInfo == null) {
                String ssid2 = ((WifiManager) getSystemService("wifi")).getConnectionInfo().getSSID();
                ssid = ssid2;
                if (ssid2 == null) {
                    ssid = "unknown ssid";
                }
            }
        } else {
            ssid = ((WifiManager) getSystemService("wifi")).getConnectionInfo().getSSID();
        }
        return ssid;
    }

    public boolean isWifiConn() {
        boolean z = false;
        WifiManager wifiManager = (WifiManager) getSystemService("wifi");
        if (wifiManager != null && wifiManager.getWifiState() != 1) {
            z = true;
        }
        return z;
    }

    /* JADX WARN: Code restructure failed: missing block: B:347:0x0c18, code lost:
        if (r0.equals("") != false) goto L348;
     */
    @Override // android.view.View.OnClickListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void onClick(View view) {
        PackageInfo packageInfo;
        PackageInfo packageInfo2;
        String str;
        PackageInfo packageInfo3;
        if ((view.getId() == 2131362146 || view.getId() == 2131362148 || view.getId() == 2131362150 || view.getId() == 2131362153 || view.getId() == 2131362155 || view.getId() == 2131362157 || view.getId() == 2131362159 || view.getId() == 2131362161 || view.getId() == 2131362163 || view.getId() == 2131362165 || view.getId() == 2131362167 || view.getId() == 2131362169 || view.getId() == 2131362208 || view.getId() == 2131362175 || view.getId() == 2131362176 || view.getId() == 2131362189 || view.getId() == 2131362177 || view.getId() == 2131362178 || view.getId() == 2131362179) && !My_Application.Allow_Flag) {
            this.imageViewSetting.performClick();
            return;
        }
        Log.i("RIO", new StringBuilder(String.valueOf(view.getId())).toString());
        String string = getSharedPreferences("language", 0).getString("language", "chinese");
        switch (view.getId()) {
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
                if (!AppEnvironment.isDEMO) {
                    if (!AppEnvironment.isSDYB) {
                        if (!AppEnvironment.ONE_IMG) {
                            Toast.makeText(this, "该功能暂不开放！", 0).show();
                            break;
                        } else {
                            try {
                                if (getPackageManager().getPackageInfo("com.edutech.guidance", 0) != null) {
                                    ComponentName componentName = new ComponentName("com.edutech.guidance", "com.edutech.guidance.MainActivity");
                                    Intent intent = new Intent();
                                    intent.addCategory("android.intent.category.LAUNCHER");
                                    intent.setComponent(componentName);
                                    intent.setAction("android.intent.action.MAIN");
                                    intent.setFlags(268435456);
                                    startActivity(intent, "com.edutech.guidance");
                                    break;
                                }
                            } catch (PackageManager.NameNotFoundException e) {
                                e.printStackTrace();
                                Toast.makeText(this, "该应用未安装！", 0).show();
                                break;
                            }
                        }
                    } else {
                        try {
                            if (getPackageManager().getPackageInfo("com.akson.launch.eplauncher", 0) != null) {
                                ComponentName componentName2 = new ComponentName("com.akson.launch.eplauncher", "com.akson.launch.eplauncher.SplashActivity");
                                Intent intent2 = new Intent();
                                intent2.addCategory("android.intent.category.LAUNCHER");
                                intent2.setComponent(componentName2);
                                intent2.setAction("android.intent.action.MAIN");
                                intent2.setFlags(335544320);
                                startActivity(intent2, "com.akson.launch.eplauncher");
                                break;
                            }
                        } catch (PackageManager.NameNotFoundException e2) {
                            e2.printStackTrace();
                            break;
                        } catch (Exception e3) {
                            break;
                        }
                    }
                } else {
                    Intent launchIntentForPackage = getPackageManager().getLaunchIntentForPackage("com.lejent.zuoyeshenqi.afanti");
                    launchIntentForPackage.addFlags(335544320);
                    if (launchIntentForPackage != null) {
                        startActivity(launchIntentForPackage, "com.lejent.zuoyeshenqi.afanti");
                        break;
                    }
                }
                break;
            case R.id.two_img /* 2131362148 */:
            case R.id.ll_two /* 2131362176 */:
                if (!AppEnvironment.isDEMO) {
                    if (!AppEnvironment.isSDYB) {
                        if (!AppEnvironment.TWO_IMG) {
                            Toast.makeText(this, "该功能暂不开放！", 0).show();
                            break;
                        } else {
                            try {
                                if (getPackageManager().getPackageInfo("com.edutech.zuoyefudao3", 0) != null) {
                                    ComponentName componentName3 = new ComponentName("com.edutech.zuoyefudao3", AppEnvironment.ZUOYEFUDAO_APPNAME);
                                    Intent intent3 = new Intent();
                                    intent3.addCategory("android.intent.category.LAUNCHER");
                                    intent3.setComponent(componentName3);
                                    intent3.setAction("android.intent.action.MAIN");
                                    intent3.setFlags(268435456);
                                    startActivity(intent3, "com.edutech.zuoyefudao3");
                                    break;
                                }
                            } catch (PackageManager.NameNotFoundException e4) {
                                e4.printStackTrace();
                                Toast.makeText(this, "该应用未安装！", 0).show();
                                break;
                            } catch (Exception e5) {
                                e5.printStackTrace();
                                break;
                            }
                        }
                    } else {
                        try {
                            if (getPackageManager().getPackageInfo("com.akson.timeep", 0) != null) {
                                ComponentName componentName4 = new ComponentName("com.akson.timeep", "com.akson.timeep.SplashActivity");
                                Intent intent4 = new Intent();
                                intent4.addCategory("android.intent.category.LAUNCHER");
                                intent4.setComponent(componentName4);
                                intent4.setAction("android.intent.action.MAIN");
                                intent4.setFlags(268435456);
                                startActivity(intent4, "com.akson.timeep");
                                break;
                            }
                        } catch (PackageManager.NameNotFoundException e6) {
                            e6.printStackTrace();
                            break;
                        } catch (Exception e7) {
                            break;
                        }
                    }
                } else {
                    Intent launchIntentForPackage2 = getPackageManager().getLaunchIntentForPackage("com.A17zuoye.mobile.homework");
                    launchIntentForPackage2.addFlags(335544320);
                    if (launchIntentForPackage2 != null) {
                        startActivity(launchIntentForPackage2, "com.A17zuoye.mobile.homework");
                        break;
                    }
                }
                break;
            case R.id.three_img /* 2131362150 */:
            case R.id.ll_three /* 2131362189 */:
                if (!AppEnvironment.THREE_IMG) {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                } else {
                    getSharedPreferences("notice", 0).edit().putLong("lasttime", 0L).commit();
                    try {
                        if (getPackageManager().getPackageInfo("com.edutech.mywork", 0) != null) {
                            ComponentName componentName5 = new ComponentName("com.edutech.mywork", "com.edutech.mywork.MainActivity");
                            Intent intent5 = new Intent();
                            intent5.addCategory("android.intent.category.LAUNCHER");
                            intent5.setComponent(componentName5);
                            intent5.setAction("android.intent.action.MAIN");
                            intent5.setFlags(268435456);
                            startActivity(intent5, "com.edutech.mywork");
                            break;
                        }
                    } catch (PackageManager.NameNotFoundException e8) {
                        e8.printStackTrace();
                        Toast.makeText(this, "该应用未安装！", 0).show();
                        break;
                    }
                }
                break;
            case R.id.four_img /* 2131362153 */:
            case R.id.ll_four /* 2131362177 */:
                if (!AppEnvironment.isDEMO) {
                    if (!AppEnvironment.FOUR_IMG) {
                        Toast.makeText(this, "该功能暂不开放！", 0).show();
                        break;
                    } else {
                        try {
                            if (getPackageManager().getPackageInfo("com.edutech.wrongcollection", 0) != null) {
                                ComponentName componentName6 = new ComponentName("com.edutech.wrongcollection", "com.edutech.wrongcollection.MainActivity");
                                Intent intent6 = new Intent();
                                intent6.addCategory("android.intent.category.LAUNCHER");
                                intent6.setComponent(componentName6);
                                intent6.setAction("android.intent.action.MAIN");
                                intent6.setFlags(268435456);
                                startActivity(intent6, "com.edutech.wrongcollection");
                                break;
                            }
                        } catch (PackageManager.NameNotFoundException e9) {
                            e9.printStackTrace();
                            Toast.makeText(this, "该应用未安装！", 0).show();
                            break;
                        }
                    }
                } else {
                    Intent launchIntentForPackage3 = getPackageManager().getLaunchIntentForPackage("com.jinxin.namibox");
                    launchIntentForPackage3.addFlags(335544320);
                    if (launchIntentForPackage3 != null) {
                        startActivity(launchIntentForPackage3, "com.jinxin.namibox");
                        break;
                    }
                }
                break;
            case R.id.five_img /* 2131362155 */:
            case R.id.ll_five /* 2131362178 */:
                if (!AppEnvironment.isDEMO) {
                    if (!AppEnvironment.isSNZT) {
                        if (!AppEnvironment.FIVE_IMG) {
                            Toast.makeText(this, "该功能暂不开放！", 0).show();
                            break;
                        } else {
                            try {
                                if (getPackageManager().getPackageInfo("com.edutech.textbook", 0) != null) {
                                    ComponentName componentName7 = new ComponentName("com.edutech.textbook", AppEnvironment.MULTIMEDIAMATERIAL_APPNAME);
                                    Intent intent7 = new Intent();
                                    intent7.addCategory("android.intent.category.LAUNCHER");
                                    intent7.setComponent(componentName7);
                                    intent7.setAction("android.intent.action.MAIN");
                                    intent7.setFlags(268435456);
                                    intent7.putExtra("type", string);
                                    intent7.putExtra("ip", this.send_ip);
                                    intent7.putExtra("name", this.send_name);
                                    intent7.putExtra("privatekey", this.send_privatekey);
                                    intent7.putExtra("demo", this.send_demo);
                                    intent7.putExtra("pwd", this.send_pwd);
                                    intent7.putExtra("usercode", this.send_usercode);
                                    startActivity(intent7, "com.edutech.textbook");
                                    break;
                                }
                            } catch (PackageManager.NameNotFoundException e10) {
                                e10.printStackTrace();
                                Toast.makeText(this, "该应用未安装！", 0).show();
                                break;
                            }
                        }
                    } else {
                        Toast.makeText(this, "该功能暂不开放！", 0).show();
                        break;
                    }
                } else {
                    Intent launchIntentForPackage4 = getPackageManager().getLaunchIntentForPackage("com.haojiazhang.activity");
                    launchIntentForPackage4.addFlags(335544320);
                    if (launchIntentForPackage4 != null) {
                        startActivity(launchIntentForPackage4, "com.haojiazhang.activity");
                        break;
                    }
                }
                break;
            case R.id.six_img /* 2131362157 */:
            case R.id.ll_six /* 2131362185 */:
            case R.id.sdyb_myapp /* 2131362202 */:
                if (!AppEnvironment.SIX_IMG) {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                } else {
                    try {
                        if (getPackageManager().getPackageInfo("com.edutech.myapps", 0) != null) {
                            ComponentName componentName8 = new ComponentName("com.edutech.myapps", "com.edutech.myapps.activity.MainActivity");
                            Intent intent8 = new Intent();
                            intent8.addCategory("android.intent.category.LAUNCHER");
                            intent8.setComponent(componentName8);
                            intent8.setAction("android.intent.action.MAIN");
                            intent8.setFlags(268435456);
                            startActivity(intent8, "com.edutech.myapps");
                            break;
                        }
                    } catch (PackageManager.NameNotFoundException e11) {
                        e11.printStackTrace();
                        Toast.makeText(this, "该应用未安装！", 0).show();
                        break;
                    }
                }
                break;
            case R.id.seven_img /* 2131362159 */:
            case R.id.ll_seven /* 2131362183 */:
                if (!AppEnvironment.isCJLY && !AppEnvironment.isHT && !AppEnvironment.isSPYZ && !AppEnvironment.isYWHZ && !AppEnvironment.isPDSSZ && !AppEnvironment.isCH && !AppEnvironment.isXF && !AppEnvironment.isYWJD && !AppEnvironment.isYWYT && !AppEnvironment.isDISABLE4 && !AppEnvironment.isLJLD && !AppEnvironment.isTHZX && !AppEnvironment.isPDS && !AppEnvironment.isXFJD && !AppEnvironment.isBS && !AppEnvironment.isSMX && !AppEnvironment.isXXJ && !AppEnvironment.isNLEZ && !AppEnvironment.isNL && AppEnvironment.SEVEN_IMG && !AppEnvironment.isSNZT) {
                    if (!AppEnvironment.isNJLZ && !AppEnvironment.isSDYB) {
                        openCamera();
                        break;
                    } else {
                        try {
                            ResolveInfo resolveActivity = getPackageManager().resolveActivity(new Intent("android.media.action.IMAGE_CAPTURE"), 0);
                            if (resolveActivity != null) {
                                Log.e(TAG, "ACTION_IMAGE_CAPTURE--->" + resolveActivity.activityInfo.packageName);
                                Log.e(TAG, "activityInfo.name--->" + resolveActivity.activityInfo.name);
                            }
                            String str2 = resolveActivity.activityInfo.packageName;
                            String str3 = resolveActivity.activityInfo.name;
                            Log.e(TAG, "ACTION_IMAGE_CAPTURE--->" + resolveActivity.activityInfo.packageName);
                            Log.e(TAG, "activityInfo.name--->" + resolveActivity.activityInfo.name);
                            Intent intent9 = new Intent();
                            intent9.setComponent(new ComponentName(str2, str3));
                            intent9.setAction("android.intent.action.MAIN");
                            startActivity(intent9);
                            break;
                        } catch (Exception e12) {
                            e12.printStackTrace();
                            startActivity(new Intent("android.media.action.IMAGE_CAPTURE"));
                            break;
                        }
                    }
                } else {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                }
                break;
            case R.id.eight_img /* 2131362161 */:
            case R.id.ll_eight /* 2131362184 */:
                if (!AppEnvironment.isXF && !AppEnvironment.isCJLY && !AppEnvironment.isHT && !AppEnvironment.isPDSSZ && !AppEnvironment.isSPYZ && !AppEnvironment.isDISABLE4 && !AppEnvironment.isBS && !AppEnvironment.isTHZX && !AppEnvironment.isSMX && !AppEnvironment.isXXJ && !AppEnvironment.isNL && !AppEnvironment.isNLEZ && !AppEnvironment.isYYYB && AppEnvironment.EIGHT_IMG && !AppEnvironment.isSNZT) {
                    try {
                        packageInfo3 = getPackageManager().getPackageInfo("com.edutech.myfiles", 0);
                    } catch (PackageManager.NameNotFoundException e13) {
                        packageInfo3 = null;
                        e13.printStackTrace();
                        Toast.makeText(this, "该应用未安装！", 0).show();
                    }
                    if (packageInfo3 != null) {
                        ComponentName componentName9 = new ComponentName("com.edutech.myfiles", "src.com.edutech.wodewenjian.activitie.GugleFileActivity");
                        Intent intent10 = new Intent();
                        intent10.setComponent(componentName9);
                        intent10.addFlags(268435456);
                        intent10.setAction("android.intent.action.MAIN");
                        intent10.addCategory("android.intent.category.LAUNCHER");
                        intent10.putExtra("language", string);
                        intent10.putExtra("OPEN_FILE", AppEnvironment.HOMEPATH);
                        try {
                            String file = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM).toString();
                            Log.i(TAG, "OPEN_DCIM==" + file);
                            intent10.putExtra("OPEN_DCIM", file);
                        } catch (Exception e14) {
                            e14.printStackTrace();
                        }
                        startActivity(intent10, "com.edutech.myfiles");
                        break;
                    }
                } else {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                }
                break;
            case R.id.nine_img /* 2131362163 */:
            case R.id.ll_nine /* 2131362180 */:
                if (!AppEnvironment.isDEMO) {
                    if (!AppEnvironment.isCJLY && !AppEnvironment.isHT && !AppEnvironment.isYWYT && !AppEnvironment.isYWJD && !AppEnvironment.isCH && !AppEnvironment.isXH && !AppEnvironment.isXF && !AppEnvironment.isYWHZ && !AppEnvironment.isSPYZ && !AppEnvironment.isLJNLDN && !AppEnvironment.isPDSSZ && !AppEnvironment.isPDS && !AppEnvironment.isDISABLE4 && !AppEnvironment.isLJLD && !AppEnvironment.isSMX && !AppEnvironment.isXXJ && !AppEnvironment.isZBYZ && !AppEnvironment.isNJLZ && !AppEnvironment.isNLEZ && !AppEnvironment.isNL && AppEnvironment.NINE_IMG && !AppEnvironment.isSNZT) {
                        try {
                            if (getPackageManager().getPackageInfo("com.edutech.jxhd", 0) != null) {
                                ComponentName componentName10 = new ComponentName("com.edutech.jxhd", "com.edutech.jxhd.MainActivity");
                                Intent intent11 = new Intent();
                                intent11.addCategory("android.intent.category.LAUNCHER");
                                intent11.setComponent(componentName10);
                                intent11.setAction("android.intent.action.MAIN");
                                intent11.setFlags(268435456);
                                startActivity(intent11, "com.edutech.jxhd");
                                break;
                            }
                        } catch (PackageManager.NameNotFoundException e15) {
                            e15.printStackTrace();
                            Toast.makeText(this, "请安装指定应用！", 0).show();
                            break;
                        } catch (Exception e16) {
                            Toast.makeText(this, "请安装指定应用！", 0).show();
                            break;
                        }
                    } else {
                        Toast.makeText(this, "该功能暂不开放！", 0).show();
                        break;
                    }
                } else {
                    Intent launchIntentForPackage5 = getPackageManager().getLaunchIntentForPackage(AppEnvironment.YOUDAO_PACKNAME);
                    launchIntentForPackage5.addFlags(335544320);
                    if (launchIntentForPackage5 != null) {
                        startActivity(launchIntentForPackage5, AppEnvironment.YOUDAO_PACKNAME);
                        break;
                    }
                }
                break;
            case R.id.ten_img /* 2131362165 */:
            case R.id.ll_ten /* 2131362181 */:
                if (AppEnvironment.isDEMO) {
                    Intent launchIntentForPackage6 = getPackageManager().getLaunchIntentForPackage("org.hisand.zidian.zhs");
                    launchIntentForPackage6.addFlags(335544320);
                    if (launchIntentForPackage6 != null) {
                        startActivity(launchIntentForPackage6, "org.hisand.zidian.zhs");
                        break;
                    }
                } else if (AppEnvironment.isCJLY || AppEnvironment.isHT || AppEnvironment.isPDSSZ || AppEnvironment.isYWYT || AppEnvironment.isYWJD || AppEnvironment.isCH || AppEnvironment.isXH || AppEnvironment.isXF || AppEnvironment.isSPYZ || AppEnvironment.isDISABLE4 || AppEnvironment.isSMX || AppEnvironment.isXXJ || AppEnvironment.isZBYZ || AppEnvironment.isNJLZ || !AppEnvironment.TEN_IMG || AppEnvironment.isSNZT || AppEnvironment.isSNZT) {
                    Toast.makeText(this, "该功能暂不开放！", 0).show();
                    break;
                } else {
                    try {
                        packageInfo2 = getPackageManager().getPackageInfo("com.edutech.hudongtaolun", 0);
                    } catch (PackageManager.NameNotFoundException e17) {
                        packageInfo2 = null;
                        e17.printStackTrace();
                        Toast.makeText(this, "该应用未安装！", 0).show();
                    }
                    if (packageInfo2 != null) {
                        ComponentName componentName11 = new ComponentName("com.edutech.hudongtaolun", "com.edutech.hudongtaolun.MainActivity");
                        Intent intent12 = new Intent();
                        intent12.setComponent(componentName11);
                        intent12.addFlags(268435456);
                        intent12.setAction("android.intent.action.MAIN");
                        intent12.addCategory("android.intent.category.LAUNCHER");
                        SharedPreferences sharedPreferences = getSharedPreferences("privatekey", 0);
                        String string2 = sharedPreferences.getString("key", "");
                        String string3 = sharedPreferences.getString("apihost", "");
                        String string4 = sharedPreferences.getString("name", "");
                        if (string3 != null && !string3.equals("") && string4 != null && !string4.equals("") && string2 != null) {
                            str = string2;
                            break;
                        }
                        HashMap<String, String> loadXml = XmlLoadHelper.loadXml();
                        if (loadXml == null) {
                            return;
                        }
                        string3 = loadXml.get("ip");
                        string4 = loadXml.get("usercode");
                        str = loadXml.get("privatekey");
                        intent12.putExtra("ip", string3);
                        intent12.putExtra("privatekey", str);
                        intent12.putExtra("name", string4);
                        intent12.putExtra("language", string);
                        startActivity(intent12, "com.edutech.hudongtaolun");
                        break;
                    }
                }
                break;
            case R.id.eleven_img /* 2131362167 */:
            case R.id.ll_eleven /* 2131362182 */:
                if (!AppEnvironment.isDEMO) {
                    Toast.makeText(this, (int) R.string.app_name_building, 0).show();
                    break;
                } else {
                    Intent launchIntentForPackage7 = getPackageManager().getLaunchIntentForPackage("com.record.ing");
                    launchIntentForPackage7.addFlags(335544320);
                    if (launchIntentForPackage7 != null) {
                        startActivity(launchIntentForPackage7, "com.record.ing");
                        break;
                    }
                }
                break;
            case R.id.twelve_img /* 2131362169 */:
            case R.id.ll_twelve /* 2131362179 */:
                if (!AppEnvironment.isDEMO) {
                    if (!AppEnvironment.TWELVE_IMG) {
                        Toast.makeText(this, "该功能暂不开放！", 0).show();
                        break;
                    } else {
                        Intent intent13 = new Intent("android.intent.action.MAIN");
                        intent13.addCategory("android.intent.category.LAUNCHER");
                        intent13.addFlags(268435456);
                        intent13.setComponent(new ComponentName(AppEnvironment.INTERACTION_PACKNAME, AppEnvironment.INTERACTION_APPNAME));
                        intent13.putExtra("language", string);
                        try {
                            packageInfo = getPackageManager().getPackageInfo(AppEnvironment.INTERACTION_PACKNAME, 0);
                        } catch (PackageManager.NameNotFoundException e18) {
                            packageInfo = null;
                            e18.printStackTrace();
                            Toast.makeText(this, "该应用未安装！", 0).show();
                        }
                        if (packageInfo != null) {
                            startActivity(intent13, AppEnvironment.INTERACTION_PACKNAME);
                            break;
                        }
                    }
                } else {
                    Intent launchIntentForPackage8 = getPackageManager().getLaunchIntentForPackage("com.xueersi.parentsmeeting");
                    launchIntentForPackage8.addFlags(335544320);
                    if (launchIntentForPackage8 != null) {
                        startActivity(launchIntentForPackage8, "com.xueersi.parentsmeeting");
                        break;
                    }
                }
                break;
            case R.id.thirteen_img /* 2131362208 */:
                try {
                    if (getPackageManager().getPackageInfo("com.edutech.eword", 0) != null) {
                        ComponentName componentName12 = new ComponentName("com.edutech.eword", "com.edutech.eword.HomePageActivity");
                        Intent intent14 = new Intent();
                        intent14.addCategory("android.intent.category.LAUNCHER");
                        intent14.setComponent(componentName12);
                        intent14.setAction("android.intent.action.MAIN");
                        intent14.setFlags(268435456);
                        startActivity(intent14, "com.edutech.eword");
                        break;
                    }
                } catch (PackageManager.NameNotFoundException e19) {
                    e19.printStackTrace();
                    break;
                }
                break;
        }
        if ("".length() <= 0 || "".length() <= 0) {
            return;
        }
        ComponentName componentName13 = new ComponentName("", "");
        Intent intent15 = new Intent();
        intent15.setComponent(componentName13);
        intent15.addFlags(268435456);
        intent15.setAction("android.intent.action.MAIN");
        intent15.addCategory("android.intent.category.LAUNCHER");
        startActivity(intent15, "");
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.onconfigureChange = true;
    }

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.agreement_sp = getSharedPreferences("myAgreement", 0);
        if (!this.agreement_sp.getBoolean("agreement_key", false)) {
        }
        try {
            cleanApplicationData(this);
            getLanguage();
            setMainView();
            openScreenShot();
            openLockScreen();
            Log.e(TAG, BROADCASTER_LOCKSCREEN);
            try {
                setDefaultSetting();
            } catch (Exception e) {
            }
            initWidget();
            startService(new Intent(this, sysProtectService.class));
            lockPad();
            loadUserInfo();
            new HostPwd().start();
            showPackageMain();
            resetAutoSp();
            initBroadReceiver();
            removeIllegalApks();
            setDesignView();
        } catch (NullPointerException e2) {
        } catch (Exception e3) {
        }
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

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        return i == 4 ? true : super.onKeyDown(i, keyEvent);
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

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:34:0x0197 -> B:7:0x00cc). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:39:0x01ae -> B:54:0x0160). Please submit an issue!!! */
    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        try {
            this.canRefresh = true;
            Log.e(TAG, "on resume:canrefresh");
            init_public_infor();
            sendBroadcast(new Intent("ENTERPASS"));
            getSharedPreferences("allowcall", 4).edit().putBoolean("cancall", false).commit();
            lockPad();
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction("android.intent.action.BATTERY_CHANGED");
            this.batteryReceiver = new BatteryReceiver();
            registerReceiver(this.batteryReceiver, intentFilter);
            this.mActivityManager = (ActivityManager) getSystemService("activity");
            IntentFilter intentFilter2 = new IntentFilter();
            intentFilter2.addAction("PASSWDPASS");
            intentFilter2.addAction("android.intent.action.mdm");
            intentFilter2.addAction(this.UPDATEAPK);
            IntentFilter intentFilter3 = new IntentFilter();
            intentFilter3.addAction("android.intent.action.STATUSBAR_INVISIBILITY");
            intentFilter3.addAction("android.intent.action.STATUSBAR_VISIBILITY");
            registerReceiver(this.InteractionReceiver, intentFilter3);
            try {
                if (!My_Application.Allow_Flag) {
                    new Thread(this.checkIdThread).start();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (Build.DISPLAY.contains("T355") || Build.DISPLAY.contains("P550") || Build.DISPLAY.contains("P350") || Build.DISPLAY.contains("P583")) {
                try {
                    this.LicenseOK = getSharedPreferences("license", 0).getBoolean("licenseok", false);
                    if (!this.mDPM.isAdminActive(this.mDeviceAdmin)) {
                        startActivity(new Intent(this, AddAdminActivity.class));
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

    @Override // android.app.Activity
    protected void onStop() {
        super.onStop();
        this.showTime = false;
        this.timeThread = null;
        this.isnotice = false;
        this.noticeThread = null;
    }

    public void userBeiAnDialog() {
        View inflate = View.inflate(this, R.layout.layout_userlicense_new, null);
        this.btnYes = (Button) inflate.findViewById(2131362133);
        this.scrollView = (ScrollView) inflate.findViewById(2131362130);
        ((TextView) inflate.findViewById(2131362131)).setText(getDataFromAssets("beianlicense.txt"));
        this.cb = (CheckBox) inflate.findViewById(R.id.cbnoshow);
        final AlertDialog show = new AlertDialog.Builder(this).setView(inflate).setOnKeyListener(this.keylistener).setCancelable(false).show();
        this.btnYes.setEnabled(true);
        this.btnYes.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.27
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (CloudClientActivity.this.cb != null && CloudClientActivity.this.cb.isChecked()) {
                    CloudClientActivity.this.agreement_sp = CloudClientActivity.this.getSharedPreferences("myAgreement", 0);
                    CloudClientActivity.this.agreement_sp.edit().putBoolean("agreement_key", true).commit();
                }
                show.dismiss();
            }
        });
    }

    public void userLicenseAgreementDialog() {
        View inflate = View.inflate(this, R.layout.layout_userlicense_new, null);
        this.btnYes = (Button) inflate.findViewById(2131362133);
        this.scrollView = (ScrollView) inflate.findViewById(2131362130);
        ((TextView) inflate.findViewById(2131362131)).setText(getDataFromAssets("UserLicenseAgreement.txt"));
        final AlertDialog show = new AlertDialog.Builder(this).setView(inflate).setOnKeyListener(this.keylistener).setCancelable(false).show();
        this.scrollView.setOnTouchListener(new TouchListenerImpl(this, null));
        this.btnYes.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.CloudClientActivity.26
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                CloudClientActivity.this.agreement_sp = CloudClientActivity.this.getSharedPreferences("myAgreement", 0);
                CloudClientActivity.this.agreement_sp.edit().putBoolean("agreement_key", true).commit();
                show.dismiss();
            }
        });
    }
}
