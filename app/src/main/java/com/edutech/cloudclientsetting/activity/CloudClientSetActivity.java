package com.edutech.cloudclientsetting.activity;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.mia.MiaMdmPolicyManager;
import android.bluetooth.BluetoothAdapter;
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
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.provider.Settings;
import android.support.v4.internal.view.SupportMenu;
import android.support.v4.view.PointerIconCompat;
import android.telephony.TelephonyManager;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.util.Xml;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.webkit.WebChromeClient;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListPopupWindow;
import android.widget.TextView;
import android.widget.Toast;
import com.cloudclientsetting.until.BZip2Utils;
import com.cloudclientsetting.until.FileInOutHelper;
import com.cloudclientsetting.until.JsonHelper;
import com.edutech.appmanage.utils.ShellUtils;
import com.edutech.cloudclientsetting.activity.IPListAdapter;
import com.edutech.cloudclientsetting.activity.NameListAdapter;
import com.edutech.idauthentication.AESSet;
import com.edutech.idauthentication.Aduth;
import com.edutech.idauthentication.FileUtils;
import com.edutech.idauthentication.MainActivity;
import com.edutech.idauthentication.MySSLSocketFactory;
import com.edutech.mobilestudyclient.ApkUpdateBean;
import com.edutech.mobilestudyclient.LanguageUtils;
import com.edutech.mobilestudyclient.SysConfig.AppEnvironment;
import com.edutech.mobilestudyclient.activity.ActivityBase;
import com.edutech.mobilestudyclient.activity.AppBean;
import com.edutech.mobilestudyclient.activity.AppControlActivity;
import com.edutech.mobilestudyclient.activity.CloudClientActivity;
import com.edutech.mobilestudyclient.activity.service.sysProtectService;
import com.edutech.mobilestudyclient.util.AESUtils;
import com.edutech.mobilestudyclient.util.My_md5;
import com.edutech.mobilestudyclient.util.Utils;
import com.edutech.mobilestudyclient.util.XmlLoadHelper;
import com.edutech.publicedu.log.LogHelp;
import com.edutech.utils.InstallApkUtil;
import com.edutech.utils.SystemInfoHelper;
import com.huawei.android.app.admin.HwDevicePolicyManager;
import com.launcher.activity.R;
import com.lee.demo.view.CustomProgressDialog;
import com.mining.app.zxing.activity.MipcaActivityCapture;
import com.mining.app.zxing.decoding.Intents;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.RandomAccessFile;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.NetworkInterface;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.zip.GZIPInputStream;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.apache.commons.net.imap.IMAPSClient;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.cookie.ClientCookie;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.tools.ant.taskdefs.SQLExec;
import org.bson.BSON;
import org.jivesoftware.smackx.workgroup.packet.UserID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;
import org.xmlpull.v1.XmlSerializer;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class CloudClientSetActivity extends Activity implements View.OnClickListener, IPListAdapter.IpInterface, NameListAdapter.NameHistoryInterface {
    private static final int START_PROGRESS = 4115;
    private static final String TAG = "CloudClientSetActivity";
    private static final int UPDATE_INSTALLSINGLE = 4116;
    private static final int UPDATE_INSTALLSTATE = 4114;
    private static final int UPDATE_PROGRESS = 4113;
    private static final int ZXING_SCAN = 3;
    private String JXHD_Ip;
    private List<String> apkList;
    private Button btnServiceControl;
    private Button btnUpdate;
    private Button btnbluetoothControl;
    private ComponentName cn;
    public EditText confirmpwd;
    private JSONArray history_array;
    private List<HashMap<String, String>> history_nameList;
    public EditText id;
    public EditText idauth_edit;
    private InstallReceiver installReceiver;
    private IPListAdapter ipAdpter;
    private List<String> ips;
    private boolean isUpdate;
    private LinearLayout languageSw;
    private TextView language_t;
    private ListPopupWindow listpop;
    private BluetoothAdapter mBluetooth;
    private Context mContext;
    private HwDevicePolicyManager mHwPDM;
    MiaMdmPolicyManager mMiaMdmPolicyManager;
    private Toast mToast;
    private NameListAdapter nameListAdapter;
    private ListPopupWindow nameListpop;
    public EditText newpwd;
    public EditText oldpwd;
    private String stu_name;
    private TextView tvCurrVersion;
    private TextView tvUpdateNow;
    private TextView tvUpdatePass;
    private UpdateThread updateThread;
    private UpdateProgressThread updateprogressThread;
    private int versionCodeService;
    private String versionNameService;
    private static String idfilepath = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/CloudClient/.System/idau.xml";
    private static File tmpfile = new File(idfilepath);
    public static boolean isupdating = false;
    private String Name = null;
    private String Pwd = null;
    private EditText ip_edit = null;
    private EditText ptfw_edit = null;
    private EditText username_edit = null;
    private EditText password_edit = null;
    private Button ok_btn = null;
    private Button cancel_btn = null;
    private Button wifi_btn = null;
    private Button idAuth_btn = null;
    private Button password_update = null;
    private Button password_reset = null;
    private Button btnTitleBack = null;
    private Button btnReset = null;
    private Button btnAppControl = null;
    private WebChromeClient.CustomViewCallback myCallback = null;
    private CustomProgressDialog webprogressdialog = null;
    private com.edutech.mobilestudyclient.view.CustomProgressDialog progressDialog = null;
    private List<ApkUpdateBean> apkUpdateList = new ArrayList();
    private Button back_btn = null;
    private String updatePassword = "";
    private boolean reseting = false;
    FileInputStream filein = null;
    FileOutputStream fileos = null;
    private String launcherPath = "";
    private String setDemoShow = "0";
    private Boolean ButtonFlag = false;
    private String urlfilepath = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/setting.xml";
    private String settingHistory = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/settinghistory.xml";
    private File tempfile = new File(this.urlfilepath);
    MainActivity idauth = new MainActivity(this);
    private String versionName = "";
    private int versionCode = 0;
    public Thread apkUpdateThread = null;
    private String LANGUAGEPATH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "MobileStudyClient" + File.separatorChar + ".System" + File.separatorChar + "language.xml";
    private boolean isover = false;
    private int updateTime = 0;
    private long currentCacheLength = 0;
    private long currentCachePosition = 0;
    private String ipOrigal = "";
    private String nameOrigal = "";
    private String pwdOrigal = "";
    private HostPwd threadPwd = null;
    private String superPwd1 = "ayjedutechyx@123456z";
    private String superPwd2 = "";
    private boolean allChangeSettings = false;
    private AlertDialog pwdConfirmDialog = null;
    private String saveErrorInfo = "";
    private AlertDialog registerDialog = null;
    private ArrayList<String> addApksList = new ArrayList<>();
    private boolean isResetPwd = false;
    private String modifiedIP = "";
    private String modifiedName = "";
    private String timeStamp = "";
    private Handler mHandler = new AnonymousClass1();
    private Handler installHandler = new AnonymousClass2();
    private Handler resultHandler = new AnonymousClass3();
    View.OnTouchListener nameListener = new AnonymousClass4();
    View.OnTouchListener ipListener = new AnonymousClass5();
    TextWatcher ipWatcher = new AnonymousClass6();
    TextWatcher nameWatcher = new AnonymousClass7();
    TextWatcher pwdWatcher = new AnonymousClass8();
    DialogInterface.OnKeyListener keylistenerDialog = new AnonymousClass9();
    public Runnable downloadRun = new AnonymousClass10();
    public Runnable updatepwdRun = new AnonymousClass11();
    Runnable runnable_GetConfig_Infor = new AnonymousClass12();
    private int LauncherCounter = 0;

    static /* synthetic */ void access$56(CloudClientSetActivity cloudClientSetActivity, String str) {
        cloudClientSetActivity.Name = str;
    }

    static /* synthetic */ String access$58(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.Name;
    }

    static /* synthetic */ void access$57(CloudClientSetActivity cloudClientSetActivity, String str) {
        cloudClientSetActivity.Pwd = str;
    }

    static /* synthetic */ EditText access$0(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.ip_edit;
    }

    static /* synthetic */ EditText access$52(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.ptfw_edit;
    }

    static /* synthetic */ EditText access$24(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.username_edit;
    }

    static /* synthetic */ EditText access$19(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.password_edit;
    }

    static /* synthetic */ Button access$17(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.ok_btn;
    }

    static /* synthetic */ Button access$16(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.btnTitleBack;
    }

    static /* synthetic */ CustomProgressDialog access$9(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.webprogressdialog;
    }

    static /* synthetic */ com.edutech.mobilestudyclient.view.CustomProgressDialog access$13(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.progressDialog;
    }

    static /* synthetic */ List access$14(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.apkUpdateList;
    }

    static /* synthetic */ void access$69(CloudClientSetActivity cloudClientSetActivity, List list) {
        cloudClientSetActivity.apkUpdateList = list;
    }

    static /* synthetic */ Context access$82(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.mContext;
    }

    static /* synthetic */ String access$18(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.updatePassword;
    }

    static /* synthetic */ void access$53(CloudClientSetActivity cloudClientSetActivity, String str) {
        cloudClientSetActivity.updatePassword = str;
    }

    static /* synthetic */ TextView access$4(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.tvUpdateNow;
    }

    static /* synthetic */ void access$75(CloudClientSetActivity cloudClientSetActivity, boolean z) {
        cloudClientSetActivity.reseting = z;
    }

    static /* synthetic */ boolean access$84(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.reseting;
    }

    static /* synthetic */ void access$65(CloudClientSetActivity cloudClientSetActivity, String str) {
        cloudClientSetActivity.launcherPath = str;
    }

    static /* synthetic */ String access$72(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.launcherPath;
    }

    static /* synthetic */ String access$1(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.JXHD_Ip;
    }

    static /* synthetic */ void access$21(CloudClientSetActivity cloudClientSetActivity, String str) {
        cloudClientSetActivity.JXHD_Ip = str;
    }

    static /* synthetic */ void access$74(CloudClientSetActivity cloudClientSetActivity, List list) {
        cloudClientSetActivity.apkList = list;
    }

    static /* synthetic */ boolean access$10(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.isover;
    }

    static /* synthetic */ int access$61(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.updateTime;
    }

    static /* synthetic */ long access$11(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.currentCacheLength;
    }

    static /* synthetic */ void access$66(CloudClientSetActivity cloudClientSetActivity, long j) {
        cloudClientSetActivity.currentCacheLength = j;
    }

    static /* synthetic */ long access$12(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.currentCachePosition;
    }

    static /* synthetic */ void access$67(CloudClientSetActivity cloudClientSetActivity, long j) {
        cloudClientSetActivity.currentCachePosition = j;
    }

    static /* synthetic */ void access$23(CloudClientSetActivity cloudClientSetActivity, String str) {
        cloudClientSetActivity.ipOrigal = str;
    }

    static /* synthetic */ String access$27(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.ipOrigal;
    }

    static /* synthetic */ void access$25(CloudClientSetActivity cloudClientSetActivity, String str) {
        cloudClientSetActivity.nameOrigal = str;
    }

    static /* synthetic */ String access$29(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.nameOrigal;
    }

    static /* synthetic */ void access$26(CloudClientSetActivity cloudClientSetActivity, String str) {
        cloudClientSetActivity.pwdOrigal = str;
    }

    static /* synthetic */ String access$49(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.pwdOrigal;
    }

    static /* synthetic */ void access$33(CloudClientSetActivity cloudClientSetActivity, HostPwd hostPwd) {
        cloudClientSetActivity.threadPwd = hostPwd;
    }

    static /* synthetic */ HostPwd access$46(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.threadPwd;
    }

    static /* synthetic */ void access$79(CloudClientSetActivity cloudClientSetActivity, String str) {
        cloudClientSetActivity.superPwd1 = str;
    }

    static /* synthetic */ String access$88(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.superPwd1;
    }

    static /* synthetic */ void access$81(CloudClientSetActivity cloudClientSetActivity, String str) {
        cloudClientSetActivity.superPwd2 = str;
    }

    static /* synthetic */ String access$89(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.superPwd2;
    }

    static /* synthetic */ void access$32(CloudClientSetActivity cloudClientSetActivity, boolean z) {
        cloudClientSetActivity.allChangeSettings = z;
    }

    static /* synthetic */ boolean access$47(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.allChangeSettings;
    }

    static /* synthetic */ AlertDialog access$87(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.pwdConfirmDialog;
    }

    static /* synthetic */ ListPopupWindow access$35(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.listpop;
    }

    static /* synthetic */ List access$37(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.ips;
    }

    static /* synthetic */ IPListAdapter access$36(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.ipAdpter;
    }

    static /* synthetic */ String access$22(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.saveErrorInfo;
    }

    static /* synthetic */ void access$54(CloudClientSetActivity cloudClientSetActivity, String str) {
        cloudClientSetActivity.saveErrorInfo = str;
    }

    static /* synthetic */ AlertDialog access$85(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.registerDialog;
    }

    static /* synthetic */ void access$86(CloudClientSetActivity cloudClientSetActivity, AlertDialog alertDialog) {
        cloudClientSetActivity.registerDialog = alertDialog;
    }

    static /* synthetic */ ArrayList access$63(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.addApksList;
    }

    static /* synthetic */ void access$64(CloudClientSetActivity cloudClientSetActivity, ArrayList arrayList) {
        cloudClientSetActivity.addApksList = arrayList;
    }

    static /* synthetic */ void access$20(CloudClientSetActivity cloudClientSetActivity, boolean z) {
        cloudClientSetActivity.isResetPwd = z;
    }

    static /* synthetic */ void access$28(CloudClientSetActivity cloudClientSetActivity, String str) {
        cloudClientSetActivity.modifiedIP = str;
    }

    static /* synthetic */ void access$30(CloudClientSetActivity cloudClientSetActivity, String str) {
        cloudClientSetActivity.modifiedName = str;
    }

    static /* synthetic */ String access$38(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.stu_name;
    }

    static /* synthetic */ JSONArray access$39(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.history_array;
    }

    static /* synthetic */ void access$41(CloudClientSetActivity cloudClientSetActivity, JSONArray jSONArray) {
        cloudClientSetActivity.history_array = jSONArray;
    }

    static /* synthetic */ Handler access$55(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.mHandler;
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 extends Handler {
        AnonymousClass1() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            if (msg.what != 4) {
                if (msg.what == 10) {
                    CloudClientSetActivity.this.finish();
                } else if (msg.what == 101) {
                    CloudClientSetActivity.access$0(CloudClientSetActivity.this).setText(CloudClientSetActivity.access$1(CloudClientSetActivity.this));
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_serverurlerror));
                } else if (msg.what == 102) {
                    LanguageUtils.SetLanguage(CloudClientSetActivity.this, "chinese");
                    CloudClientSetActivity.access$2(CloudClientSetActivity.this, "chinese");
                    XmlLoadHelper.createLanuage("chinese");
                    CloudClientSetActivity.this.finish();
                    System.exit(0);
                } else if (msg.what == 103) {
                    LanguageUtils.SetLanguage(CloudClientSetActivity.this, "en");
                    CloudClientSetActivity.access$2(CloudClientSetActivity.this, "english");
                    XmlLoadHelper.createLanuage("en");
                    CloudClientSetActivity.this.finish();
                    System.exit(0);
                }
            }
            super.handleMessage(msg);
        }
    }

    static /* synthetic */ Handler access$62(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.installHandler;
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass2 extends Handler {
        AnonymousClass2() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    CloudClientSetActivity.access$3(CloudClientSetActivity.this);
                    break;
                case 2:
                    CloudClientSetActivity.access$4(CloudClientSetActivity.this).setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_startupdating));
                    CloudClientSetActivity.access$4(CloudClientSetActivity.this).setEnabled(true);
                    CloudClientSetActivity.access$4(CloudClientSetActivity.this).setTextColor(CloudClientSetActivity.this.getResources().getColor(R.color.blue));
                    break;
                case 3:
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_latestversion));
                    CloudClientSetActivity.access$5(CloudClientSetActivity.this);
                    CloudClientSetActivity.access$6(CloudClientSetActivity.this);
                    break;
                case 4:
                    CloudClientSetActivity.access$7(CloudClientSetActivity.this);
                    if (!CloudClientSetActivity.this.isFinishing()) {
                        CloudClientSetActivity.access$8(CloudClientSetActivity.this);
                        break;
                    }
                    break;
                case PointerIconCompat.TYPE_CONTEXT_MENU /* 1001 */:
                    if (CloudClientSetActivity.access$9(CloudClientSetActivity.this) != null && !CloudClientSetActivity.access$10(CloudClientSetActivity.this) && !AppEnvironment.isNewUpdate) {
                        DecimalFormat df = new DecimalFormat("##0.00");
                        String alllength = df.format(((CloudClientSetActivity.access$11(CloudClientSetActivity.this) * 1.0d) / 1024.0d) / 1024.0d);
                        String currentPosition = df.format(((CloudClientSetActivity.access$12(CloudClientSetActivity.this) * 1.0d) / 1024.0d) / 1024.0d);
                        String allStateString = String.valueOf(currentPosition) + "MB/" + alllength + "MB";
                        if (CloudClientSetActivity.access$11(CloudClientSetActivity.this) == 0) {
                            CloudClientSetActivity.access$9(CloudClientSetActivity.this).setMessage(String.valueOf(CloudClientSetActivity.this.getString(R.string.updatingapk)) + "  0%");
                            break;
                        } else {
                            int percent = (int) ((CloudClientSetActivity.access$12(CloudClientSetActivity.this) * 100) / CloudClientSetActivity.access$11(CloudClientSetActivity.this));
                            if (percent >= 100) {
                                percent = 100;
                            }
                            CloudClientSetActivity.access$9(CloudClientSetActivity.this).setMessage(String.valueOf(CloudClientSetActivity.this.getString(R.string.updatingapk)) + "  " + percent + "%  " + allStateString);
                            break;
                        }
                    }
                    break;
                case CloudClientSetActivity.UPDATE_PROGRESS /* 4113 */:
                    try {
                        Long downsize = (Long) msg.obj;
                        int position = msg.arg1;
                        ApkUpdateBean bean = (ApkUpdateBean) CloudClientSetActivity.access$14(CloudClientSetActivity.this).get(position);
                        bean.setApkDownloadSize(downsize.longValue());
                        CloudClientSetActivity.access$14(CloudClientSetActivity.this).set(position, bean);
                        CloudClientSetActivity.access$13(CloudClientSetActivity.this).updateProgress(position);
                        break;
                    } catch (Exception e) {
                        e.printStackTrace();
                        break;
                    }
                case CloudClientSetActivity.UPDATE_INSTALLSTATE /* 4114 */:
                    try {
                        int state = ((Integer) msg.obj).intValue();
                        int position2 = msg.arg1;
                        ApkUpdateBean bean2 = (ApkUpdateBean) CloudClientSetActivity.access$14(CloudClientSetActivity.this).get(position2);
                        bean2.setInstallState(state);
                        CloudClientSetActivity.access$14(CloudClientSetActivity.this).set(position2, bean2);
                        CloudClientSetActivity.access$13(CloudClientSetActivity.this).updateProgress(position2);
                        break;
                    } catch (Exception e2) {
                        e2.printStackTrace();
                        break;
                    }
                case CloudClientSetActivity.START_PROGRESS /* 4115 */:
                    try {
                        CloudClientSetActivity.access$13(CloudClientSetActivity.this).setData(CloudClientSetActivity.access$14(CloudClientSetActivity.this));
                        break;
                    } catch (Exception e3) {
                        break;
                    }
                case CloudClientSetActivity.UPDATE_INSTALLSINGLE /* 4116 */:
                    String path = (String) msg.obj;
                    CloudClientSetActivity.access$15(CloudClientSetActivity.this, path);
                    break;
            }
            super.handleMessage(msg);
        }
    }

    static /* synthetic */ void access$7(CloudClientSetActivity cloudClientSetActivity) {
        cloudClientSetActivity.startAssistanApk();
    }

    private void startAssistanApk() {
        PackageInfo packageInfo2;
        Intent intent2 = new Intent("android.intent.action.MAIN");
        intent2.addFlags(268435456);
        ComponentName cn = new ComponentName("com.edutech.assistantdemo", "com.edutech.assistantdemo.MainActivity");
        intent2.setComponent(cn);
        try {
            packageInfo2 = this.mContext.getPackageManager().getPackageInfo("com.edutech.assistantdemo", 0);
        } catch (PackageManager.NameNotFoundException e) {
            packageInfo2 = null;
            e.printStackTrace();
        }
        if (packageInfo2 != null) {
            startActivity(intent2);
        }
    }

    static /* synthetic */ Handler access$31(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.resultHandler;
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$3 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass3 extends Handler {
        AnonymousClass3() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.os.Handler
        @SuppressLint({"NewApi"})
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 0:
                    CloudClientSetActivity.this.idauth_edit.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_signfailed1));
                    break;
                case 1:
                    CloudClientSetActivity.this.idauth_edit.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_signfailed2));
                    break;
                case 2:
                    CloudClientSetActivity.this.idauth_edit.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_signfailed3));
                    break;
                case 3:
                    CloudClientSetActivity.this.idauth_edit.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_signfailed4));
                    break;
                case 4:
                    CloudClientSetActivity.this.loadidXml();
                    break;
                case 5:
                    CloudClientSetActivity.this.loadidXml();
                    break;
                case 6:
                    CloudClientSetActivity.this.idauth_edit.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_signfailed5));
                    break;
                case 7:
                    CloudClientSetActivity.this.idauth_edit.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_signfailed6));
                    break;
                case 11:
                    if (!"".equals(CloudClientSetActivity.access$18(CloudClientSetActivity.this))) {
                        CloudClientSetActivity.access$19(CloudClientSetActivity.this).setText(CloudClientSetActivity.access$18(CloudClientSetActivity.this));
                    }
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_cpok));
                    CloudClientSetActivity.access$20(CloudClientSetActivity.this, false);
                    CloudClientSetActivity.access$16(CloudClientSetActivity.this).setEnabled(false);
                    CloudClientSetActivity.access$17(CloudClientSetActivity.this).setEnabled(false);
                    CloudClientSetActivity.access$17(CloudClientSetActivity.this).setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_saving));
                    CloudClientSetActivity.access$21(CloudClientSetActivity.this, CloudClientSetActivity.access$0(CloudClientSetActivity.this).getText().toString().trim());
                    new Thread(CloudClientSetActivity.this.runnable_GetConfig_Infor).start();
                    break;
                case 12:
                    if (CloudClientSetActivity.access$22(CloudClientSetActivity.this) != null && !CloudClientSetActivity.access$22(CloudClientSetActivity.this).equals("")) {
                        CloudClientSetActivity.this.showToast(CloudClientSetActivity.access$22(CloudClientSetActivity.this));
                        break;
                    } else {
                        CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_cpfailed));
                        break;
                    }
                case 13:
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_cperror1));
                    break;
                case 14:
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_cperror2));
                    break;
                case 15:
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_noneuser));
                    break;
                case 16:
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_noneserverip));
                    break;
                case 20:
                    Toast.makeText(CloudClientSetActivity.this, CloudClientSetActivity.this.getResources().getString(R.string.setting_saveok), 1).show();
                    CloudClientSetActivity.access$23(CloudClientSetActivity.this, CloudClientSetActivity.access$0(CloudClientSetActivity.this).getText().toString());
                    CloudClientSetActivity.access$25(CloudClientSetActivity.this, CloudClientSetActivity.access$24(CloudClientSetActivity.this).getText().toString());
                    CloudClientSetActivity.access$26(CloudClientSetActivity.this, CloudClientSetActivity.access$19(CloudClientSetActivity.this).getText().toString());
                    CloudClientSetActivity.access$28(CloudClientSetActivity.this, CloudClientSetActivity.access$27(CloudClientSetActivity.this));
                    CloudClientSetActivity.access$30(CloudClientSetActivity.this, CloudClientSetActivity.access$29(CloudClientSetActivity.this));
                    CloudClientSetActivity.access$31(CloudClientSetActivity.this).sendEmptyMessageDelayed(24, 3000L);
                    CloudClientSetActivity.access$32(CloudClientSetActivity.this, false);
                    CloudClientSetActivity.access$33(CloudClientSetActivity.this, null);
                    SharedPreferences sharePre = CloudClientSetActivity.this.getSharedPreferences("privatekey", 0);
                    String schoolid = sharePre.getString("schoolid", "");
                    String name = sharePre.getString("name", "");
                    String ip = sharePre.getString("apihost", "");
                    String privatekey = sharePre.getString("key", "");
                    CloudClientSetActivity.access$34(CloudClientSetActivity.this, ip, privatekey, name, schoolid);
                    SharedPreferences loginSp = CloudClientSetActivity.this.getSharedPreferences("loginhistory", 4);
                    String tempips = loginSp.getString("iphistoryString", "");
                    if (!tempips.contains(ip)) {
                        tempips = String.valueOf(tempips) + ip + ",:,";
                    }
                    loginSp.edit().putString("iphistoryString", tempips).commit();
                    if (CloudClientSetActivity.access$35(CloudClientSetActivity.this) != null && CloudClientSetActivity.access$36(CloudClientSetActivity.this) != null && CloudClientSetActivity.access$37(CloudClientSetActivity.this) != null && !CloudClientSetActivity.access$37(CloudClientSetActivity.this).contains(ip)) {
                        CloudClientSetActivity.access$37(CloudClientSetActivity.this).add(ip);
                        CloudClientSetActivity.access$36(CloudClientSetActivity.this).setIps(CloudClientSetActivity.access$37(CloudClientSetActivity.this));
                        CloudClientSetActivity.access$36(CloudClientSetActivity.this).notifyDataSetChanged();
                    }
                    try {
                        CloudClientSetActivity.access$41(CloudClientSetActivity.this, CloudClientSetActivity.access$40(CloudClientSetActivity.this, CloudClientSetActivity.access$38(CloudClientSetActivity.this), CloudClientSetActivity.access$27(CloudClientSetActivity.this), CloudClientSetActivity.access$29(CloudClientSetActivity.this), CloudClientSetActivity.access$39(CloudClientSetActivity.this)));
                        break;
                    } catch (Exception e) {
                        break;
                    }
                case 21:
                    CloudClientSetActivity.access$16(CloudClientSetActivity.this).setEnabled(true);
                    CloudClientSetActivity.access$17(CloudClientSetActivity.this).setEnabled(true);
                    CloudClientSetActivity.access$17(CloudClientSetActivity.this).setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                    if (CloudClientSetActivity.access$22(CloudClientSetActivity.this) != null && !CloudClientSetActivity.access$22(CloudClientSetActivity.this).equals("")) {
                        Toast.makeText(CloudClientSetActivity.this.getApplicationContext(), CloudClientSetActivity.access$22(CloudClientSetActivity.this), 0).show();
                        break;
                    } else if (!CloudClientSetActivity.access$42(CloudClientSetActivity.this)) {
                        Toast.makeText(CloudClientSetActivity.this.getApplicationContext(), CloudClientSetActivity.this.getResources().getString(R.string.setting_errornetwork), 0).show();
                        break;
                    } else {
                        Toast.makeText(CloudClientSetActivity.this.getApplicationContext(), CloudClientSetActivity.this.getResources().getString(R.string.setting_errorsetting), 0).show();
                        break;
                    }
                case 24:
                    CloudClientSetActivity.access$16(CloudClientSetActivity.this).setEnabled(true);
                    CloudClientSetActivity.access$17(CloudClientSetActivity.this).setEnabled(true);
                    CloudClientSetActivity.access$17(CloudClientSetActivity.this).setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                    break;
                case 31:
                    CloudClientSetActivity.access$16(CloudClientSetActivity.this).setEnabled(true);
                    CloudClientSetActivity.access$17(CloudClientSetActivity.this).setEnabled(true);
                    CloudClientSetActivity.access$17(CloudClientSetActivity.this).setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                    if (CloudClientSetActivity.access$22(CloudClientSetActivity.this) != null && !CloudClientSetActivity.access$22(CloudClientSetActivity.this).equals("")) {
                        Toast.makeText(CloudClientSetActivity.this.getApplicationContext(), CloudClientSetActivity.access$22(CloudClientSetActivity.this), 0).show();
                    } else {
                        Toast.makeText(CloudClientSetActivity.this.getApplicationContext(), CloudClientSetActivity.this.getResources().getString(R.string.setting_errorpwd), 0).show();
                    }
                    break;
                case 32:
                    CloudClientSetActivity.access$16(CloudClientSetActivity.this).setEnabled(true);
                    CloudClientSetActivity.access$17(CloudClientSetActivity.this).setEnabled(true);
                    CloudClientSetActivity.access$17(CloudClientSetActivity.this).setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                    if (CloudClientSetActivity.access$22(CloudClientSetActivity.this) != null && !CloudClientSetActivity.access$22(CloudClientSetActivity.this).equals("")) {
                        Toast.makeText(CloudClientSetActivity.this.getApplicationContext(), CloudClientSetActivity.access$22(CloudClientSetActivity.this), 0).show();
                        break;
                    } else {
                        Toast.makeText(CloudClientSetActivity.this.getApplicationContext(), CloudClientSetActivity.this.getResources().getString(R.string.setting_erroracctype), 0).show();
                        break;
                    }
                case 112:
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.appresetend));
                    break;
                case 1000:
                    CloudClientSetActivity.this.idauth_edit.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_signing));
                    break;
                case PointerIconCompat.TYPE_HAND /* 1002 */:
                    CloudClientSetActivity.access$20(CloudClientSetActivity.this, true);
                    CloudClientSetActivity.access$16(CloudClientSetActivity.this).setEnabled(true);
                    CloudClientSetActivity.access$17(CloudClientSetActivity.this).setEnabled(true);
                    CloudClientSetActivity.access$17(CloudClientSetActivity.this).setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                    CloudClientSetActivity.access$28(CloudClientSetActivity.this, CloudClientSetActivity.access$0(CloudClientSetActivity.this).getText().toString());
                    CloudClientSetActivity.access$30(CloudClientSetActivity.this, CloudClientSetActivity.access$24(CloudClientSetActivity.this).getText().toString());
                    CloudClientSetActivity.access$43(CloudClientSetActivity.this);
                    break;
                case PointerIconCompat.TYPE_HELP /* 1003 */:
                    CloudClientSetActivity.access$16(CloudClientSetActivity.this).setEnabled(true);
                    CloudClientSetActivity.access$17(CloudClientSetActivity.this).setEnabled(true);
                    CloudClientSetActivity.access$17(CloudClientSetActivity.this).setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                    CloudClientSetActivity.this.showToast("地址最后一位不能为'/'");
                    break;
                case 1005:
                    CloudClientSetActivity.access$16(CloudClientSetActivity.this).setEnabled(true);
                    CloudClientSetActivity.access$17(CloudClientSetActivity.this).setEnabled(true);
                    CloudClientSetActivity.access$17(CloudClientSetActivity.this).setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.checksum_failed));
                    break;
                default:
                    CloudClientSetActivity.this.idauth_edit.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_signfailed));
                    break;
            }
            super.handleMessage(msg);
        }
    }

    static /* synthetic */ void access$34(CloudClientSetActivity cloudClientSetActivity, String str, String str2, String str3, String str4) {
        cloudClientSetActivity.startFireWall(str, str2, str3, str4);
    }

    private void startFireWall(String ip, String privatekey, String name, String schoolid) {
        Intent in = new Intent();
        in.setAction("com.edutech.intent.TrafficStatsService");
        in.setClassName("com.edutech.firewall", "eu.faircode.netguard.TrafficStatsService");
        in.putExtra("ip", ip);
        in.putExtra("privatekey", privatekey);
        in.putExtra("name", name);
        in.putExtra("schoolid", schoolid);
        startService(in);
    }

    public void apkUpdate() {
        if (this.tvUpdateNow == null || this.tvUpdateNow.isEnabled()) {
            this.tvUpdateNow.setEnabled(false);
            this.tvUpdateNow.setText(getResources().getString(R.string.setting_updating));
            this.tvUpdateNow.setTextColor(getResources().getColor(R.color.gray));
            getWindow().addFlags(128);
            if (this.updateThread == null) {
                Message msg = new Message();
                msg.what = 4;
                this.installHandler.sendMessage(msg);
                this.updateThread = new UpdateThread();
                this.updateThread.start();
                if (this.updateprogressThread == null && AppEnvironment.isNewUpdate) {
                    this.updateprogressThread = new UpdateProgressThread();
                    this.updateprogressThread.start();
                }
                if (this.progressDialog != null) {
                    isupdating = true;
                    this.updateTime = 0;
                    this.apkUpdateList = new ArrayList();
                    return;
                }
                return;
            }
            this.updateprogressThread = null;
            this.updateThread = null;
            isupdating = false;
            this.updateTime = HttpStatus.SC_MULTIPLE_CHOICES;
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class UpdateProgressThread extends Thread {
        UpdateProgressThread() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            while (CloudClientSetActivity.access$61(CloudClientSetActivity.this) < 300 && CloudClientSetActivity.isupdating) {
                Message msg = new Message();
                msg.what = PointerIconCompat.TYPE_CONTEXT_MENU;
                CloudClientSetActivity.access$62(CloudClientSetActivity.this).sendMessage(msg);
                try {
                    Thread.sleep(1000L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class UpdateThread extends Thread {
        UpdateThread() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            if (CloudClientSetActivity.access$63(CloudClientSetActivity.this) != null) {
                CloudClientSetActivity.access$63(CloudClientSetActivity.this).clear();
            } else {
                CloudClientSetActivity.access$64(CloudClientSetActivity.this, new ArrayList());
            }
            CloudClientSetActivity.access$65(CloudClientSetActivity.this, "");
            CloudClientSetActivity.isupdating = true;
            CloudClientSetActivity.access$66(CloudClientSetActivity.this, 0L);
            CloudClientSetActivity.access$67(CloudClientSetActivity.this, 0L);
            SharedPreferences sharePre = CloudClientSetActivity.this.getSharedPreferences("privatekey", 0);
            String privatekey = sharePre.getString("key", "");
            String ip = sharePre.getString("apihost", "");
            String username = sharePre.getString("name", "");
            HashMap<String, String> hashmap = XmlLoadHelper.loadXml();
            if (hashmap != null && (ip.equals("") || username.equals(""))) {
                ip = hashmap.get("ip");
                username = hashmap.get("usercode");
                privatekey = hashmap.get("privatekey");
            }
            String url = "http://" + ip + "/api/app/projectcode/ebag/os/android/";
            HttpPost post = new HttpPost(url);
            post.addHeader("X-Edutech-Entity", username);
            Log.e("updateresult", String.valueOf(url) + "," + username + "," + privatekey);
            long imestamp = System.currentTimeMillis();
            String sign = My_md5.Md5(String.valueOf(imestamp) + username + privatekey);
            post.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
            DefaultHttpClient client = new DefaultHttpClient();
            List<String> resultList = new ArrayList<>();
            List<ApkUpdateBean> apksTemp = new ArrayList<>();
            try {
                HttpResponse response = client.execute(post);
                String result = CloudClientSetActivity.access$68(CloudClientSetActivity.this, response);
                JSONObject jobj = new JSONObject(result);
                boolean status = jobj.getBoolean("status");
                int errorNum = jobj.getInt("errorNum");
                if (status || errorNum == 0) {
                    JSONArray data = jobj.getJSONArray("data");
                    if (data != null && data.length() > 0) {
                        ArrayList<HashMap<String, String>> localAppInfoList = SystemInfoHelper.getSystemInfo(new ArrayList<>(), CloudClientSetActivity.this);
                        CloudClientSetActivity.access$69(CloudClientSetActivity.this, new ArrayList());
                        for (int i = 0; i < data.length() && CloudClientSetActivity.isupdating; i++) {
                            JSONObject json = data.getJSONObject(i);
                            long size = json.getLong("appsize");
                            String version = json.getString("versionname");
                            String packagename = json.getString("packagename");
                            String versionCode = json.getString("versioncode");
                            long vercodeLong = 1;
                            try {
                                vercodeLong = Long.parseLong(versionCode);
                            } catch (NumberFormatException e) {
                            } catch (Exception e2) {
                            }
                            boolean isInstall = false;
                            Iterator<HashMap<String, String>> it = localAppInfoList.iterator();
                            while (true) {
                                if (!it.hasNext()) {
                                    break;
                                }
                                HashMap<String, String> localTempApp = it.next();
                                if (localTempApp.get("packagename") != null && packagename.equals(localTempApp.get("packagename"))) {
                                    long tempcode = 1;
                                    try {
                                        tempcode = Long.parseLong(localTempApp.get("versioncode"));
                                    } catch (NumberFormatException e3) {
                                    } catch (Exception e4) {
                                    }
                                    if (localTempApp.get("versioncode") != null && localTempApp.get("versionname") != null && vercodeLong > tempcode) {
                                        isInstall = false;
                                    } else {
                                        isInstall = true;
                                    }
                                } else {
                                    isInstall = false;
                                }
                            }
                            if (!isInstall) {
                                CloudClientSetActivity cloudClientSetActivity = CloudClientSetActivity.this;
                                CloudClientSetActivity.access$66(cloudClientSetActivity, CloudClientSetActivity.access$11(cloudClientSetActivity) + size);
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
                                CloudClientSetActivity.access$14(CloudClientSetActivity.this).add(apkUpdateBean);
                                apksTemp.add(apkUpdateBean);
                            }
                        }
                        if (!AppEnvironment.isNewUpdate) {
                            resultList = CloudClientSetActivity.access$70(CloudClientSetActivity.this, data, localAppInfoList, resultList);
                        } else {
                            Message msg = new Message();
                            msg.what = CloudClientSetActivity.START_PROGRESS;
                            CloudClientSetActivity.access$62(CloudClientSetActivity.this).sendMessage(msg);
                            Utils.saveUpdateApks(CloudClientSetActivity.access$14(CloudClientSetActivity.this), CloudClientSetActivity.this, ip);
                            resultList = CloudClientSetActivity.access$71(CloudClientSetActivity.this, resultList, apksTemp);
                        }
                        if (CloudClientSetActivity.access$72(CloudClientSetActivity.this) != null && !CloudClientSetActivity.access$72(CloudClientSetActivity.this).equals("")) {
                            resultList.add(CloudClientSetActivity.access$72(CloudClientSetActivity.this));
                            CloudClientSetActivity.access$63(CloudClientSetActivity.this).add("com.launcher.activity");
                        }
                    } else {
                        Utils.clearUpdateAPks(CloudClientSetActivity.this, ip);
                    }
                }
            } catch (Exception e5) {
                e5.printStackTrace();
            }
            if (CloudClientSetActivity.access$63(CloudClientSetActivity.this) != null && CloudClientSetActivity.access$63(CloudClientSetActivity.this).size() > 0) {
                Intent intent = new Intent();
                intent.setAction(sysProtectService.ADDINSTALL);
                intent.putStringArrayListExtra("packages", CloudClientSetActivity.access$63(CloudClientSetActivity.this));
                CloudClientSetActivity.this.sendBroadcast(intent);
            }
            CloudClientSetActivity.isupdating = false;
            CloudClientSetActivity.access$73(CloudClientSetActivity.this, 2, 2, 2);
            if (AppEnvironment.isNewUpdate) {
                if (apksTemp == null || apksTemp.size() <= 0) {
                    CloudClientSetActivity.access$73(CloudClientSetActivity.this, 3, 3, 3);
                }
            } else if (resultList == null || resultList.size() <= 0) {
                CloudClientSetActivity.access$73(CloudClientSetActivity.this, 3, 3, 3);
            } else {
                CloudClientSetActivity.access$74(CloudClientSetActivity.this, resultList);
                CloudClientSetActivity.access$73(CloudClientSetActivity.this, 1, 1, 1);
            }
        }
    }

    static /* synthetic */ List access$71(CloudClientSetActivity cloudClientSetActivity, List list, List list2) {
        return cloudClientSetActivity.parseDownload_new(list, list2);
    }

    private List<String> parseDownload_new(List<String> resultList, List<ApkUpdateBean> apks) {
        int length;
        for (int i = 0; i < apks.size(); i++) {
            ApkUpdateBean bean = apks.get(i);
            String packagename = bean.getPackagename();
            String apkUrl = bean.getApkUrl();
            String name = bean.getAppName();
            long size = bean.getApkSize();
            File dir = new File(AppEnvironment.ASSETS_DIR);
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
                    while (getsize < size && isupdating && (length = in.read(bys)) != -1) {
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

    static /* synthetic */ void access$73(CloudClientSetActivity cloudClientSetActivity, int i, Object obj, int i2) {
        cloudClientSetActivity.sendInstallMessage(i, obj, i2);
    }

    private void sendInstallMessage(int arg1, Object obj, int what) {
        Message msgInstall = new Message();
        msgInstall.arg1 = arg1;
        msgInstall.what = what;
        msgInstall.obj = obj;
        this.installHandler.sendMessage(msgInstall);
    }

    static /* synthetic */ List access$70(CloudClientSetActivity cloudClientSetActivity, JSONArray jSONArray, ArrayList arrayList, List list) {
        return cloudClientSetActivity.parseDownload_Old(jSONArray, arrayList, list);
    }

    private List<String> parseDownload_Old(JSONArray data, ArrayList<HashMap<String, String>> localAppInfoList, List<String> resultList) {
        int length;
        for (int i = 0; i < data.length() && isupdating; i++) {
            try {
                JSONObject json = data.getJSONObject(i);
                String apkUrl = json.getString("appwebpath");
                long size = json.getLong("appsize");
                String name = json.getString("apkname");
                json.getString("versionname");
                String packagename = json.getString("packagename");
                String versionCode = json.getString("versioncode");
                long vercodeLong = 1;
                try {
                    vercodeLong = Long.parseLong(versionCode);
                } catch (NumberFormatException e) {
                } catch (Exception e2) {
                }
                boolean isInstall = false;
                Iterator<HashMap<String, String>> it = localAppInfoList.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    HashMap<String, String> localTempApp = it.next();
                    if (localTempApp.get("packagename") != null && packagename.equals(localTempApp.get("packagename"))) {
                        long tempcode = 1;
                        try {
                            tempcode = Long.parseLong(localTempApp.get("versioncode"));
                        } catch (NumberFormatException e3) {
                        } catch (Exception e4) {
                        }
                        if (localTempApp.get("versioncode") != null && localTempApp.get("versionname") != null && vercodeLong > tempcode) {
                            isInstall = false;
                        } else {
                            isInstall = true;
                        }
                    } else {
                        isInstall = false;
                    }
                }
                if (!isInstall) {
                    URL url2 = new URL(apkUrl);
                    HttpURLConnection urlConnection = (HttpURLConnection) url2.openConnection();
                    urlConnection.connect();
                    InputStream in = urlConnection.getInputStream();
                    File dir = new File(AppEnvironment.ASSETS_DIR);
                    if (dir.isDirectory()) {
                        File file = new File(String.valueOf(AppEnvironment.ASSETS_DIR) + name);
                        if (file.exists()) {
                            file.delete();
                        }
                        FileOutputStream out = new FileOutputStream(file);
                        byte[] bys = new byte[10240];
                        int getsize = 0;
                        while (getsize < size && isupdating && (length = in.read(bys)) != -1) {
                            getsize += length;
                            this.currentCachePosition += length;
                            out.write(bys, 0, length);
                        }
                        out.close();
                        in.close();
                        urlConnection.disconnect();
                        if (getsize == size) {
                            if (!packagename.equals("com.launcher.activity")) {
                                resultList.add(String.valueOf(AppEnvironment.ASSETS_DIR) + name);
                                this.addApksList.add(packagename);
                            } else {
                                this.launcherPath = String.valueOf(AppEnvironment.ASSETS_DIR) + name;
                            }
                        }
                    }
                }
            } catch (Exception e5) {
            }
        }
        return resultList;
    }

    static /* synthetic */ void access$15(CloudClientSetActivity cloudClientSetActivity, String str) {
        cloudClientSetActivity.installSingleApk(str);
    }

    private void installSingleApk(String path) {

    }

    static /* synthetic */ void access$3(CloudClientSetActivity cloudClientSetActivity) {
        cloudClientSetActivity.installNewApk();
    }

    private void installNewApk() {

    }

    private void apkinstall_samsung(String apkpath) {

    }

    private void apkinstall(String apkpath) {

    }

    private void apkIntentInstall(String apkpath) {

    }

    private static boolean clientInstall(String apkPath) {
        return true;
    }

    private static boolean returnResult(int value) {
        if (value == 0) {
            return true;
        }
        return value == 1 ? false : false;
    }

    public static boolean SlientInstall(String apkPath) throws IOException {
        return true;
    }

    @Override // android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setFlags(1024, 1024);
        SharedPreferences sp = getSharedPreferences("language", 0);
        String type = sp.getString("language", "chinese");
        if (!type.equals("en")) {
            LanguageUtils.SetLanguage(this, "chinese");
        } else {
            LanguageUtils.SetLanguage(this, "en");
        }
        setContentView(R.layout.webbrowser_dialog_setting);
        Log.i(TAG, "onCreate");
        this.mContext = this;
        this.ip_edit = (EditText) findViewById(R.id.ip_edit);
        this.ptfw_edit = (EditText) findViewById(R.id.ptfw_edit);
        this.username_edit = (EditText) findViewById(R.id.username_edit);
        this.password_edit = (EditText) findViewById(R.id.password_edit);
        this.cn = new ComponentName("com.example.demo", "MainActivity");
        this.mHwPDM = new HwDevicePolicyManager(this);
        this.ok_btn = (Button) findViewById(R.id.ok_btn);
        this.cancel_btn = (Button) findViewById(R.id.cancel_btn);
        this.wifi_btn = (Button) findViewById(R.id.wifi_btn);
        this.idAuth_btn = (Button) findViewById(R.id.idauth_btn);
        this.password_update = (Button) findViewById(R.id.password_update);
        this.password_reset = (Button) findViewById(R.id.password_reset);
        this.back_btn = (Button) findViewById(R.id.back_btn);
        this.btnTitleBack = (Button) findViewById(R.id.btnTitleBack);
        this.btnAppControl = (Button) findViewById(R.id.btnAppControl);
        this.tvCurrVersion = (TextView) findViewById(R.id.tvCurrVersion);
        this.btnUpdate = (Button) findViewById(R.id.btnUpdate);
        this.btnUpdate.setOnClickListener(this);
        this.btnReset = (Button) findViewById(R.id.btnReset);
        this.btnReset.setOnClickListener(this);
        this.btnServiceControl = (Button) findViewById(R.id.btnServiceControl);
        this.btnServiceControl.setOnClickListener(this);
        this.btnServiceControl.setText("关于");
        this.mBluetooth = BluetoothAdapter.getDefaultAdapter();
        this.btnbluetoothControl = (Button) findViewById(R.id.btnbluetoothControl);
        if (this.mBluetooth != null && this.mBluetooth.isEnabled()) {
            this.btnbluetoothControl.setText("关闭蓝牙");
        } else {
            this.btnbluetoothControl.setText("开启蓝牙");
        }
        this.btnbluetoothControl.setOnClickListener(new AnonymousClass13());
        //this.btnbluetoothControl.setVisibility(0);
	this.tvUpdatePass = (TextView) findViewById(R.id.tvUpdatePass);
        this.tvUpdateNow = (TextView) findViewById(R.id.tvUpdateNow);
        this.tvUpdatePass.setOnClickListener(this);
        this.tvUpdateNow.setOnClickListener(this);
        if (AppEnvironment.isNLEZ) {
            this.tvUpdatePass.setVisibility(4);
        }
        this.ok_btn.setOnClickListener(this);
        this.cancel_btn.setOnClickListener(this);
        this.wifi_btn.setOnClickListener(this);
        this.idAuth_btn.setOnClickListener(this);
        this.password_update.setOnClickListener(this);
        this.password_reset.setOnClickListener(this);
        this.back_btn.setOnClickListener(this);
        this.btnTitleBack.setOnClickListener(this);
        this.btnAppControl.setOnClickListener(this);
        this.idauth_edit = (EditText) findViewById(R.id.idauth_edit);
        this.idauth_edit.setSingleLine(false);
        this.idauth_edit.setTextColor(SupportMenu.CATEGORY_MASK);
        this.languageSw = (LinearLayout) findViewById(R.id.sw_language);
        this.language_t = (TextView) findViewById(R.id.language_txt);
        if (type.equals("en")) {
            this.language_t.setText(getResources().getString(R.string.setenglish));
        } else {
            this.language_t.setText(getResources().getString(R.string.setchinese));
        }
        this.languageSw.setOnClickListener(new AnonymousClass14());
        getWindow().setSoftInputMode(3);
        this.ptfw_edit.setSelection(this.ptfw_edit.getText().toString().length());
        getCurrApkInfo();
        if (AppEnvironment.isZBYZ) {
            this.ip_edit.addTextChangedListener(this.ipWatcher);
            this.username_edit.addTextChangedListener(this.nameWatcher);
            this.password_edit.addTextChangedListener(this.pwdWatcher);
        }
        this.ip_edit.setOnTouchListener(this.ipListener);
        try {
            this.stu_name = "";
            this.history_array = nameHistoryParser();
        } catch (Exception e) {
        }
        if (this.history_array == null) {
            this.history_array = new JSONArray();
        }
        this.username_edit.setOnTouchListener(this.nameListener);
        this.installReceiver = new InstallReceiver();
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.intent.action.PACKAGE_ADDED");
        filter.addDataScheme("package");
        registerReceiver(this.installReceiver, filter);
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$13 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass13 implements View.OnClickListener {
        AnonymousClass13() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            Intent intent = new Intent("/");
            ComponentName cm = new ComponentName("com.android.settings", "com.android.settings.Settings$DeviceInfoSettingsActivity");
            intent.setComponent(cm);
            intent.setAction("android.intent.action.VIEW");
            CloudClientSetActivity.access$82(CloudClientSetActivity.this).startActivity(intent);
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$14 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass14 implements View.OnClickListener {
        AnonymousClass14() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View arg0) {
            CloudClientSetActivity.access$83(CloudClientSetActivity.this);
        }
    }

    static /* synthetic */ boolean access$42(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.getInternetState();
    }

    private boolean getInternetState() {
        NetworkInfo info;
        ConnectivityManager connect = (ConnectivityManager) getSystemService("connectivity");
        if (connect == null || (info = connect.getActiveNetworkInfo()) == null || !info.isConnected() || info.getState() != NetworkInfo.State.CONNECTED) {
            return false;
        }
        return true;
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$4 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass4 implements View.OnTouchListener {
        AnonymousClass4() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View v, MotionEvent event) {
            switch (event.getAction()) {
                case 1:
                    CloudClientSetActivity.access$44(CloudClientSetActivity.this);
                    return false;
                default:
                    return false;
            }
        }
    }

    static /* synthetic */ void access$44(CloudClientSetActivity cloudClientSetActivity) {
        cloudClientSetActivity.showPopNameList();
    }

    private void showPopNameList() {
        this.history_nameList = new ArrayList();
        String ip = this.ip_edit != null ? this.ip_edit.getText().toString() : "";
        if (!ip.equals("") && this.history_array != null && this.history_array.length() > 0) {
            this.history_nameList = nameHistoryQuery(ip, this.history_array);
            if (this.history_nameList != null && this.history_nameList.size() > 0) {
                if (this.nameListpop == null) {
                    this.nameListpop = new ListPopupWindow(this);
                    this.nameListAdapter = new NameListAdapter(this.history_nameList, this, this);
                    this.nameListpop.setAdapter(this.nameListAdapter);
                    this.nameListpop.setWidth(-2);
                    this.nameListpop.setHeight(-2);
                    this.nameListpop.setInputMethodMode(2);
                    this.nameListpop.setModal(true);
                } else if (this.nameListAdapter != null) {
                    this.nameListAdapter.setIps(this.history_nameList);
                    this.nameListAdapter.notifyDataSetChanged();
                }
                this.nameListpop.setAnchorView(this.username_edit);
                this.nameListpop.show();
            }
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$5 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass5 implements View.OnTouchListener {
        AnonymousClass5() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View v, MotionEvent event) {
            switch (event.getAction()) {
                case 1:
                    CloudClientSetActivity.access$45(CloudClientSetActivity.this);
                    return false;
                default:
                    return false;
            }
        }
    }

    static /* synthetic */ void access$45(CloudClientSetActivity cloudClientSetActivity) {
        cloudClientSetActivity.showPopList();
    }

    private void showPopList() {
        String[] strs;
        SharedPreferences loginSp = getSharedPreferences("loginhistory", 4);
        String ipHistorys = loginSp.getString("iphistoryString", "");
        if (ipHistorys != null && !ipHistorys.equals("") && this.ip_edit != null && (strs = ipHistorys.split(",:,")) != null && strs.length > 0) {
            Log.e("ip", ipHistorys);
            this.ips = new ArrayList();
            for (String ip : strs) {
                if (ip != null && !ip.equals("")) {
                    this.ips.add(ip);
                }
            }
            if (this.ips != null && this.ips.size() > 0) {
                if (this.listpop == null) {
                    this.listpop = new ListPopupWindow(this);
                    this.ipAdpter = new IPListAdapter(this.ips, this, this);
                    this.listpop.setAdapter(this.ipAdpter);
                    this.listpop.setWidth(-2);
                    this.listpop.setHeight(-2);
                    this.listpop.setInputMethodMode(2);
                    this.listpop.setModal(true);
                } else if (this.ipAdpter != null) {
                    this.ipAdpter.setIps(this.ips);
                    this.ipAdpter.notifyDataSetChanged();
                }
                this.listpop.setAnchorView(this.ip_edit);
                this.listpop.show();
            }
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$6 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass6 implements TextWatcher {
        AnonymousClass6() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence arg0, int arg1, int arg2, int arg3) {
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence arg0, int arg1, int arg2, int arg3) {
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable arg0) {
            String ip = CloudClientSetActivity.access$0(CloudClientSetActivity.this).getText().toString();
            if (ip != null && !CloudClientSetActivity.access$27(CloudClientSetActivity.this).equals("") && !ip.equals(CloudClientSetActivity.access$27(CloudClientSetActivity.this))) {
                if (CloudClientSetActivity.access$46(CloudClientSetActivity.this) == null) {
                    CloudClientSetActivity.access$33(CloudClientSetActivity.this, new HostPwd());
                    CloudClientSetActivity.access$46(CloudClientSetActivity.this).start();
                }
                if (!CloudClientSetActivity.access$47(CloudClientSetActivity.this)) {
                    CloudClientSetActivity.access$0(CloudClientSetActivity.this).setText(CloudClientSetActivity.access$27(CloudClientSetActivity.this));
                    CloudClientSetActivity.access$48(CloudClientSetActivity.this);
                } else {
                    return;
                }
            }
            CloudClientSetActivity.access$0(CloudClientSetActivity.this).setSelection(CloudClientSetActivity.access$0(CloudClientSetActivity.this).getText().length());
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$7 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass7 implements TextWatcher {
        AnonymousClass7() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence arg0, int arg1, int arg2, int arg3) {
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence arg0, int arg1, int arg2, int arg3) {
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable arg0) {
            String username = CloudClientSetActivity.access$24(CloudClientSetActivity.this).getText().toString();
            if (username != null && !CloudClientSetActivity.access$29(CloudClientSetActivity.this).equals("") && !username.equals(CloudClientSetActivity.access$29(CloudClientSetActivity.this))) {
                if (CloudClientSetActivity.access$46(CloudClientSetActivity.this) == null) {
                    CloudClientSetActivity.access$33(CloudClientSetActivity.this, new HostPwd());
                    CloudClientSetActivity.access$46(CloudClientSetActivity.this).start();
                }
                if (!CloudClientSetActivity.access$47(CloudClientSetActivity.this)) {
                    CloudClientSetActivity.access$24(CloudClientSetActivity.this).setText(CloudClientSetActivity.access$29(CloudClientSetActivity.this));
                    CloudClientSetActivity.access$48(CloudClientSetActivity.this);
                } else {
                    return;
                }
            }
            CloudClientSetActivity.access$24(CloudClientSetActivity.this).setSelection(CloudClientSetActivity.access$24(CloudClientSetActivity.this).getText().length());
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$8 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass8 implements TextWatcher {
        AnonymousClass8() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence arg0, int arg1, int arg2, int arg3) {
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence arg0, int arg1, int arg2, int arg3) {
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable arg0) {
            String pwd = CloudClientSetActivity.access$19(CloudClientSetActivity.this).getText().toString();
            if (pwd != null && !CloudClientSetActivity.access$49(CloudClientSetActivity.this).equals("") && !pwd.equals(CloudClientSetActivity.access$49(CloudClientSetActivity.this))) {
                if (CloudClientSetActivity.access$46(CloudClientSetActivity.this) == null) {
                    CloudClientSetActivity.access$33(CloudClientSetActivity.this, new HostPwd());
                    CloudClientSetActivity.access$46(CloudClientSetActivity.this).start();
                }
                if (!CloudClientSetActivity.access$47(CloudClientSetActivity.this)) {
                    CloudClientSetActivity.access$19(CloudClientSetActivity.this).setText(CloudClientSetActivity.access$49(CloudClientSetActivity.this));
                    CloudClientSetActivity.access$48(CloudClientSetActivity.this);
                } else {
                    return;
                }
            }
            CloudClientSetActivity.access$19(CloudClientSetActivity.this).setSelection(CloudClientSetActivity.access$19(CloudClientSetActivity.this).getText().length());
        }
    }

    static /* synthetic */ void access$83(CloudClientSetActivity cloudClientSetActivity) {
        cloudClientSetActivity.showLanguageChooseDialog();
    }

    private void showLanguageChooseDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setCancelable(true);
        builder.setTitle(getResources().getString(R.string.language_t));
        String[] items = {getResources().getString(R.string.setchinese), getResources().getString(R.string.setenglish)};
        builder.setItems(items, new AnonymousClass15());
        builder.create().show();
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$15 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass15 implements DialogInterface.OnClickListener {
        AnonymousClass15() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.content.DialogInterface.OnClickListener
        public void onClick(DialogInterface arg0, int arg1) {
            SharedPreferences sp = CloudClientSetActivity.this.getSharedPreferences("language", 0);
            if (arg1 == 0) {
                LanguageUtils.SetLanguage(CloudClientSetActivity.this, "chinese");
                sp.edit().putString("language", "chinese").commit();
                Message message = CloudClientSetActivity.access$55(CloudClientSetActivity.this).obtainMessage();
                message.what = HttpStatus.SC_PROCESSING;
                CloudClientSetActivity.access$55(CloudClientSetActivity.this).sendMessage(message);
                return;
            }
            LanguageUtils.SetLanguage(CloudClientSetActivity.this, "en");
            sp.edit().putString("language", "en").commit();
            Message message2 = CloudClientSetActivity.access$55(CloudClientSetActivity.this).obtainMessage();
            message2.what = 103;
            CloudClientSetActivity.access$55(CloudClientSetActivity.this).sendMessage(message2);
        }
    }

    private void getCurrApkInfo() {
        try {
            PackageInfo info = getPackageManager().getPackageInfo(getPackageName(), 0);
            Log.e("packageName", getPackageName());
            this.versionName = info.versionName;
            this.versionCode = info.versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        this.tvCurrVersion.setText(String.valueOf(getResources().getString(R.string.setting_version)) + this.versionName);
    }

    @Override // android.app.Activity
    public void onBackPressed() {
        super.onBackPressed();
    }

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    protected void attachBaseContext(Context newBase) {
        SharedPreferences sp = newBase.getSharedPreferences("language", 0);
        String type = sp.getString("language", "chinese");
        super.attachBaseContext(LanguageUtils.attachBaseContext(newBase, type));
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == 4) {
            closeProgressDialog();
            resetUpdateInfo();
        }
        return super.onKeyDown(keyCode, event);
    }

    static /* synthetic */ void access$8(CloudClientSetActivity cloudClientSetActivity) {
        cloudClientSetActivity.showProgressDialog();
    }

    private void showProgressDialog() {
        if (AppEnvironment.isNewUpdate) {
            if (this.progressDialog == null && !this.isover) {
                this.apkUpdateList = new ArrayList();
                this.progressDialog = new com.edutech.mobilestudyclient.view.CustomProgressDialog(this, this.apkUpdateList);
                this.progressDialog.setOnKeyListener(this.keylistenerDialog);
                this.progressDialog.show();
            }
        } else if (this.webprogressdialog == null && !this.isover) {
            this.webprogressdialog = CustomProgressDialog.createDialog(this);
            this.webprogressdialog.setMessage(getResources().getString(R.string.setting_loading));
            this.webprogressdialog.setOnKeyListener(this.keylistenerDialog);
            this.webprogressdialog.show();
        }
    }

    static /* synthetic */ void access$5(CloudClientSetActivity cloudClientSetActivity) {
        cloudClientSetActivity.closeProgressDialog();
    }

    private void closeProgressDialog() {
        try {
            this.tvUpdateNow.setEnabled(true);
            this.tvUpdateNow.setTextColor(getResources().getColor(R.color.blue));
            this.tvUpdateNow.setText(getResources().getString(R.string.setting_startupdating));
            if (AppEnvironment.isNewUpdate) {
                if (this.progressDialog != null && !this.isover) {
                    this.progressDialog.resetData();
                    this.progressDialog.dismiss();
                    this.progressDialog = null;
                }
                this.apkUpdateList.clear();
                isupdating = false;
            } else if (this.webprogressdialog != null && !this.isover) {
                this.webprogressdialog.dismiss();
                this.webprogressdialog = null;
            }
        } catch (Exception e) {
        }
    }

    static /* synthetic */ void access$6(CloudClientSetActivity cloudClientSetActivity) {
        cloudClientSetActivity.resetUpdateInfo();
    }

    private void resetUpdateInfo() {
        if (this.apkUpdateList != null) {
            this.apkUpdateList.clear();
        }
        isupdating = false;
        this.updateTime = HttpStatus.SC_MULTIPLE_CHOICES;
        if (this.updateThread != null) {
            this.updateThread = null;
        }
        if (this.updateprogressThread != null) {
            this.updateprogressThread = null;
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean dispatchTouchEvent(MotionEvent event) {
        View v = getCurrentFocus();
        boolean ret = super.dispatchTouchEvent(event);
        if (v instanceof EditText) {
            View w = getCurrentFocus();
            int[] scrcoords = new int[2];
            w.getLocationOnScreen(scrcoords);
            float x = (event.getRawX() + w.getLeft()) - scrcoords[0];
            float y = (event.getRawY() + w.getTop()) - scrcoords[1];
            if (event.getAction() == 1 && (x < w.getLeft() || x >= w.getRight() || y < w.getTop() || y > w.getBottom())) {
                InputMethodManager imm = (InputMethodManager) getSystemService("input_method");
                imm.hideSoftInputFromWindow(getWindow().getCurrentFocus().getWindowToken(), 0);
            }
        }
        return ret;
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        loadXml();
        loadidXml();
        this.isover = false;
        Log.e("onresume", "onresume");
        if (this.progressDialog != null && this.apkUpdateList != null && this.apkUpdateList.size() > 0) {
            try {
                this.progressDialog.setData(this.apkUpdateList);
            } catch (Exception e) {
            }
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$9 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass9 implements DialogInterface.OnKeyListener {
        AnonymousClass9() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.content.DialogInterface.OnKeyListener
        public boolean onKey(DialogInterface dialog, int keyCode, KeyEvent event) {
            if (keyCode == 4 && event.getRepeatCount() == 0) {
                CloudClientSetActivity.access$5(CloudClientSetActivity.this);
                CloudClientSetActivity.access$6(CloudClientSetActivity.this);
                return true;
            }
            return false;
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        closeProgressDialog();
        resetUpdateInfo();
        if (this.installReceiver != null) {
            unregisterReceiver(this.installReceiver);
        }
    }

    @Override // android.app.Activity
    public void finish() {
        super.finish();
    }

    static /* synthetic */ void access$76(CloudClientSetActivity cloudClientSetActivity) {
        cloudClientSetActivity.deleteAPks();
    }

    private void deleteAPks() {
        File[] files;
        File file = new File(AppEnvironment.ASSETS_DIR);
        if (file.isDirectory() && (files = file.listFiles()) != null) {
            for (File tempFile : files) {
                Log.e("apk", String.valueOf(tempFile.getAbsolutePath()) + "," + tempFile.getAbsolutePath().endsWith(".apk"));
                if (tempFile.getAbsolutePath().endsWith(".apk")) {
                    tempFile.delete();
                }
            }
        }
    }

    static /* synthetic */ void access$77(CloudClientSetActivity cloudClientSetActivity) {
        cloudClientSetActivity.deleteOtherFiles();
    }

    private void deleteOtherFiles() {
        String daoxueben = String.valueOf(AppEnvironment.ASSETS_DIR) + "DaoXueBen/";
        String zuoyefudao = String.valueOf(AppEnvironment.ASSETS_DIR) + "ZuoYeFuDao/";
        String homework = String.valueOf(AppEnvironment.ASSETS_DIR) + "HomeWork/";
        String newOffline = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/EBag/.System/offline/";
        delete(homework);
        delete(zuoyefudao);
        delete(daoxueben);
        delete(newOffline);
    }

    private void delete(String path) {
        File[] files;
        File dir = new File(path);
        if (dir.isDirectory() && (files = dir.listFiles()) != null) {
            for (File tempFile : files) {
                if (!tempFile.isDirectory() || !tempFile.getName().equals("HTML")) {
                    deleteFiles(tempFile.getAbsolutePath());
                }
            }
        }
    }

    public static void deleteFiles(String path) {
        File file = new File(path);
        if (file.isDirectory()) {
            File[] files = file.listFiles();
            for (File file2 : files) {
                String newPath = file2.getAbsolutePath();
                deleteFiles(newPath);
            }
        } else if (file.exists()) {
            file.delete();
        }
        if (file.exists()) {
            file.delete();
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class ResetThread extends Thread {
        ResetThread() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            CloudClientSetActivity.access$75(CloudClientSetActivity.this, true);
            CloudClientSetActivity.access$76(CloudClientSetActivity.this);
            CloudClientSetActivity.access$77(CloudClientSetActivity.this);
            CloudClientSetActivity.access$75(CloudClientSetActivity.this, false);
            Message msg = CloudClientSetActivity.access$31(CloudClientSetActivity.this).obtainMessage();
            msg.what = 112;
            msg.sendToTarget();
        }
    }

    private void showClearDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle(getResources().getString(R.string.notifymessage));
        builder.setMessage(getResources().getString(R.string.clearmsg));
        builder.setPositiveButton(R.string.cancel, new AnonymousClass16()).setNegativeButton(R.string.ok_button, new AnonymousClass17());
        builder.setCancelable(true);
        AlertDialog dialog = builder.create();
        dialog.show();
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$16 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass16 implements DialogInterface.OnClickListener {
        AnonymousClass16() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.content.DialogInterface.OnClickListener
        public void onClick(DialogInterface dialog, int which) {
            if (dialog != null) {
                dialog.dismiss();
            }
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$17 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass17 implements DialogInterface.OnClickListener {
        AnonymousClass17() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.content.DialogInterface.OnClickListener
        public void onClick(DialogInterface dialog, int which) {
            if (!CloudClientSetActivity.access$84(CloudClientSetActivity.this)) {
                new ResetThread().start();
            }
            if (dialog != null) {
                dialog.dismiss();
            }
        }
    }

    private void showServiceDialog() {
        if (LauncherCounter++ >= 10){
            final EditText edt = new EditText(this);
            edt.setSingleLine(true);
            edt.setText("com.android.apkinstaller");
            new AlertDialog.Builder(this)
                .setTitle("Start App")
                .setView(edt)
                .setPositiveButton("确定", new DialogInterface.OnClickListener(){
                    public void onClick(DialogInterface arg0, int arg1){
                        String packageName = edt.getText().toString();
                        PackageInfo pi = null;
                        try{
                            pi = getPackageManager().getPackageInfo(packageName, 0);
                            Intent resolveIntent = new Intent(Intent.ACTION_MAIN, null);
                            resolveIntent.addCategory(Intent.CATEGORY_LAUNCHER);
                            resolveIntent.setPackage(pi.packageName);

                            List<ResolveInfo> apps = getPackageManager().queryIntentActivities(resolveIntent, 0);
                            ResolveInfo ri = apps.iterator().next();
                            if (ri != null){
                                packageName = ri.activityInfo.packageName;
                                String className = ri.activityInfo.name;

                                Intent intent = new Intent(Intent.ACTION_MAIN);
                                intent.addCategory(Intent.CATEGORY_LAUNCHER);

                                ComponentName cn = new ComponentName(packageName, className);

                                intent.setComponent(cn);
                                startActivity(intent);
							}
                        }catch (Exception e){
                                
                       }
                    }
                })
                .setNegativeButton("取消", null)
                .show();
        }
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("关于OpenStudyClient");
        builder.setMessage("OpenStudyClient\n版本14.7.0(build on Circle CI)\n访问源代码：https://github.com/cai1hsu/rePadClient\n持续集成：https://app.circleci.com/pipelines/github/Cai1Hsu/rePadClient\n本程序在GPLv3协议下开源");
        builder.setPositiveButton(getResources().getString(R.string.confirm), new AnonymousClass18());
        builder.setCancelable(true);
        AlertDialog dialog = builder.create();
        dialog.show();
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$18 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass18 implements DialogInterface.OnClickListener {
        AnonymousClass18() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.content.DialogInterface.OnClickListener
        public void onClick(DialogInterface dialog, int which) {
            if (dialog != null) {
                dialog.dismiss();
            }
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        PackageInfo packageInfo;
        Log.i(TAG, "onClick");
        switch (v.getId()) {
            case R.id.wifi_btn /* 2131362141 */:
                try {
                    packageInfo = getPackageManager().getPackageInfo(AppEnvironment.WIFI_PACKNAME, 0);
                } catch (PackageManager.NameNotFoundException e) {
                    packageInfo = null;
                    e.printStackTrace();
                }
                if (packageInfo != null) {
                    ComponentName componet = new ComponentName(AppEnvironment.WIFI_PACKNAME, "zte.com.wilink.wifi.WifiSettingActivity");
                    Intent intent = new Intent();
                    intent.setComponent(componet);
                    intent.addFlags(268435456);
                    intent.setAction("android.intent.action.MAIN");
                    intent.addCategory("android.intent.category.LAUNCHER");
                    startActivity(intent);
                    return;
                }
                return;
            case R.id.btnTitleBack /* 2131362312 */:
                exit();
                return;
            case R.id.btnServiceControl /* 2131362313 */:
                showServiceDialog();
                return;
            case R.id.btnAppControl /* 2131362314 */:
                Intent appControlIntent = new Intent(this, AppControlActivity.class);
                startActivity(appControlIntent);
                return;
            case R.id.btnReset /* 2131362315 */:
                showClearDialog();
                return;
            case R.id.back_btn /* 2131362317 */:
                this.back_btn.setVisibility(8);
                return;
            case R.id.btnUpdate /* 2131362320 */:
            case R.id.password_update /* 2131362324 */:
            case R.id.password_reset /* 2131362325 */:
            default:
                return;
            case R.id.idauth_btn /* 2131362327 */:
                if (this.registerDialog == null) {
                    LayoutInflater inflater = getLayoutInflater();
                    View layout = inflater.inflate(R.layout.idauth_dialog_setting, (ViewGroup) findViewById(R.id.idauth_dialog));
                    this.id = (EditText) layout.findViewById(R.id.idauth_dialog_id);
                    SharedPreferences sp = getSharedPreferences("idauthstring", 0);
                    if (sp.contains("key")) {
                        String key = sp.getString("key", "");
                        this.id.setText(key);
                    }
                    AlertDialog.Builder alertDialog = new AlertDialog.Builder(this).setTitle(getResources().getString(R.string.setting_sign)).setInverseBackgroundForced(true).setView(layout).setPositiveButton(getResources().getString(R.string.setting_sign), new AnonymousClass19()).setNegativeButton(getResources().getString(R.string.setting_cancel), new AnonymousClass20());
                    Button dialogButton = (Button) layout.findViewById(R.id.idscan_btn);
                    dialogButton.setOnClickListener(new AnonymousClass21());
                    this.registerDialog = alertDialog.create();
                }
                if (this.registerDialog != null) {
                    this.registerDialog.show();
                    return;
                }
                return;
            case R.id.ok_btn /* 2131362330 */:
                this.btnTitleBack.setEnabled(false);
                this.ok_btn.setEnabled(false);
                this.ok_btn.setText(getResources().getString(R.string.setting_saving));
                this.JXHD_Ip = this.ip_edit.getText().toString().trim();
                if (needPwdDialog()) {
                    if (this.threadPwd == null) {
                        this.threadPwd = new HostPwd();
                        this.threadPwd.start();
                    }
                    showConfirmPwdDialog();
                    return;
                }
                new Thread(this.runnable_GetConfig_Infor).start();
                return;
            case R.id.tvUpdatePass /* 2131362331 */:
                updatePassword();
                return;
            case R.id.tvUpdateNow /* 2131362334 */:
                apkUpdate();
                return;
            case R.id.cancel_btn /* 2131362336 */:
                exit();
                return;
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$19 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass19 implements DialogInterface.OnClickListener {
        AnonymousClass19() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.content.DialogInterface.OnClickListener
        public void onClick(DialogInterface dialog, int which) {
            if (CloudClientSetActivity.this.id.getText().toString().length() >= 16) {
                new Thread(CloudClientSetActivity.this.downloadRun).start();
                Message msg = new Message();
                msg.what = 1000;
                CloudClientSetActivity.access$31(CloudClientSetActivity.this).sendMessageDelayed(msg, 0L);
            }
            if (CloudClientSetActivity.access$85(CloudClientSetActivity.this) != null) {
                CloudClientSetActivity.access$85(CloudClientSetActivity.this).dismiss();
                CloudClientSetActivity.access$86(CloudClientSetActivity.this, null);
            }
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$20 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass20 implements DialogInterface.OnClickListener {
        AnonymousClass20() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.content.DialogInterface.OnClickListener
        public void onClick(DialogInterface dialog, int which) {
            if (CloudClientSetActivity.access$85(CloudClientSetActivity.this) != null) {
                CloudClientSetActivity.access$85(CloudClientSetActivity.this).dismiss();
                CloudClientSetActivity.access$86(CloudClientSetActivity.this, null);
            }
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$21 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass21 implements View.OnClickListener {
        AnonymousClass21() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.idscan_btn /* 2131361940 */:
                    Intent intent = new Intent(CloudClientSetActivity.this, MipcaActivityCapture.class);
                    intent.setFlags(67108864);
                    CloudClientSetActivity.this.startActivityForResult(intent, 3);
                    return;
                default:
                    return;
            }
        }
    }

    private boolean needPwdDialog() {
        if (AppEnvironment.isXF && !TextUtils.isEmpty(this.JXHD_Ip)) {
            if (this.JXHD_Ip.contains("10.70.12.27") || this.JXHD_Ip.contains("202.107.231.160:8081")) {
                return false;
            }
            return true;
        } else if (AppEnvironment.isNLEZ && !TextUtils.isEmpty(this.JXHD_Ip)) {
            if (this.JXHD_Ip.contains("10.164.150.53") || this.JXHD_Ip.contains("10.164.150.54") || this.JXHD_Ip.contains("10.164.150.52") || this.JXHD_Ip.contains("111.12.58.6:8000")) {
                return false;
            }
            return true;
        } else if (AppEnvironment.isNL && !TextUtils.isEmpty(this.JXHD_Ip)) {
            if (this.JXHD_Ip.contains("192.168.3.253:81") || this.JXHD_Ip.contains("111.59.6.120:81")) {
                return false;
            }
            return true;
        } else if (AppEnvironment.isHT && !TextUtils.isEmpty(this.JXHD_Ip)) {
            if (this.JXHD_Ip.contains("222.134.89.202:89") || this.JXHD_Ip.contains("yj.htsz.net:89") || this.JXHD_Ip.contains("192.168.0.5")) {
                return false;
            }
            return true;
        } else if (!AppEnvironment.isGQ || TextUtils.isEmpty(this.JXHD_Ip) || this.JXHD_Ip.contains("117.132.10.37:81")) {
            return false;
        } else {
            return true;
        }
    }

    private void exit() {
        Intent intent = new Intent(this, CloudClientActivity.class);
        startActivity(intent);
        finish();
    }

    static /* synthetic */ void access$2(CloudClientSetActivity cloudClientSetActivity, String str) {
        cloudClientSetActivity.writeXmlLanguage(str);
    }

    private void writeXmlLanguage(String type) {
        Log.i(TAG, "writeXml");
        File file = new File(this.LANGUAGEPATH);
        if (file.exists()) {
            file.delete();
        }
        try {
            file.createNewFile();
        } catch (Exception e) {
            e.printStackTrace();
        }
        File xmlFile = FileInOutHelper.setupOrOpenFile(this.LANGUAGEPATH);
        try {
            this.fileos = new FileOutputStream(xmlFile);
        } catch (FileNotFoundException e2) {
            Log.e("FileNotFoundException", "can't create FileOutputStream");
        }
        XmlSerializer serializer = Xml.newSerializer();
        try {
            serializer.setOutput(this.fileos, "UTF-8");
            serializer.startDocument(null, true);
            serializer.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
            serializer.startTag(null, "urlpath");
            serializer.startTag(null, "language");
            serializer.text(type);
            serializer.endTag(null, "language");
            serializer.endDocument();
            serializer.flush();
            this.fileos.close();
        } catch (Exception e3) {
            Log.e(TAG, "error occurred while creating xml file");
        }
    }

    private void writeXml() {
        Log.i(TAG, "writeXml");
        if (this.tempfile.exists()) {
            this.tempfile.delete();
        }
        String ip = this.ip_edit.getText().toString();
        AppEnvironment.MOBILESTUDYSERVERIP = ip;
        String ip2 = ip.replaceAll(" ", "");
        if (ip2.length() > 7) {
            String subhttp = ip2.substring(0, 7);
            Log.i(TAG, "subhttp" + subhttp);
            if (subhttp.equals("http://")) {
                ip2 = ip2.substring(7);
                this.ptfw_edit.setText(ip2);
                this.ip_edit.setText(ip2);
                showToast(getResources().getString(R.string.setting_serverurlerror));
            }
        }
        if (ip2 == null || (ip2 != null && ip2.length() <= 0)) {
            ip2 = "192.168.0.88";
        }
        String username = "";
        String password = "";
        try {
            SharedPreferences sharePre = getSharedPreferences("privatekey", 0);
            String struserName = sharePre.getString("name", "");
            String strpassWord = this.password_edit.getText().toString();
            if (struserName != null && strpassWord != null) {
                struserName = struserName.replaceAll(" ", "");
                strpassWord = strpassWord.replaceAll(" ", "");
            }
            this.Name = struserName;
            this.Pwd = strpassWord;
            username = BZip2Utils.StringEncodeToBase64(struserName);
            password = BZip2Utils.StringEncodeToBase64(strpassWord);
            if (struserName == null || (struserName != null && struserName.length() <= 0)) {
                username = BZip2Utils.StringEncodeToBase64("02");
            }
            if (strpassWord == null || (strpassWord != null && strpassWord.length() <= 0)) {
                password = BZip2Utils.StringEncodeToBase64(LogHelp.TYPE_GUIDANCE);
            }
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        File xmlFile = FileInOutHelper.setupOrOpenFile(this.urlfilepath);
        try {
            this.fileos = new FileOutputStream(xmlFile);
        } catch (FileNotFoundException e) {
            Log.e("FileNotFoundException", "can't create FileOutputStream");
        }
        XmlSerializer serializer = Xml.newSerializer();
        try {
            serializer.setOutput(this.fileos, "UTF-8");
            serializer.startDocument(null, true);
            serializer.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
            serializer.startTag(null, "urlpath");
            serializer.startTag(null, "ip");
            serializer.text(ip2);
            serializer.endTag(null, "ip");
            serializer.startTag(null, "showDemo");
            serializer.text(this.setDemoShow);
            serializer.endTag(null, "showDemo");
            serializer.endTag(null, "urlpath");
            serializer.startTag(null, "student");
            serializer.startTag(null, "username");
            serializer.text(username);
            serializer.endTag(null, "username");
            serializer.startTag(null, com.edutech.idauthentication.AppEnvironment.PASSWORD);
            serializer.text(password);
            serializer.endTag(null, com.edutech.idauthentication.AppEnvironment.PASSWORD);
            serializer.endTag(null, "student");
            serializer.endDocument();
            serializer.flush();
            this.fileos.close();
        } catch (Exception e2) {
            Log.e(TAG, "error occurred while creating xml file");
        }
    }

    public void loadXml() {
        Log.i(TAG, "loadXml");
        File xmlFile = FileInOutHelper.setupOrOpenFile(this.urlfilepath);
        try {
            this.filein = new FileInputStream(xmlFile);
        } catch (FileNotFoundException e1) {
            Log.e(TAG, "FileNotFoundException");
            e1.printStackTrace();
        }
        try {
            XmlPullParserFactory pullParserFactory = XmlPullParserFactory.newInstance();
            XmlPullParser xmlPullParser = pullParserFactory.newPullParser();
            xmlPullParser.setInput(this.filein, "UTF-8");
            for (int eventType = xmlPullParser.getEventType(); eventType != 1; eventType = xmlPullParser.next()) {
                String nodeName = xmlPullParser.getName();
                switch (eventType) {
                    case 2:
                        if ("ip".equals(nodeName)) {
                            this.ipOrigal = xmlPullParser.nextText();
                            this.ip_edit.setText(this.ipOrigal);
                            this.modifiedIP = this.ipOrigal;
                        }
                        if ("username".equals(nodeName)) {
                            try {
                                this.nameOrigal = BZip2Utils.Base64DecodeToString(xmlPullParser.nextText());
                                this.username_edit.setText(this.nameOrigal);
                                this.modifiedName = this.nameOrigal;
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                        if ("pwd".equals(nodeName)) {
                            try {
                                this.pwdOrigal = BZip2Utils.Base64DecodeToString(xmlPullParser.nextText());
                                this.password_edit.setText(this.pwdOrigal);
                                continue;
                            } catch (Exception e2) {
                                e2.printStackTrace();
                                continue;
                            }
                        } else {
                            continue;
                        }
                }
            }
        } catch (IOException e3) {
            e3.printStackTrace();
        } catch (IllegalArgumentException e4) {
        } catch (XmlPullParserException e5) {
            e5.printStackTrace();
        } catch (Exception e6) {
        }
        if (this.filein != null) {
            try {
                this.filein.close();
            } catch (IOException e7) {
                e7.printStackTrace();
            }
        }
    }

    public void loadidXml() {
        int i = Build.VERSION.SDK_INT;
        loadidXml1();
    }

    public void loadidXml1() {
        List<String> idInfo;
        Log.i(TAG, "loadidXml");
        File xmlFile = FileInOutHelper.setupOrOpenFile(idfilepath);
        if (xmlFile.length() > 0 && (idInfo = ActivityBase.readIDFile()) != null) {
            String idString = idInfo.get(0);
            String machineID = idInfo.get(1);
            String machineID2 = machineID;
            String resultString = idInfo.get(2);
            String times = idInfo.get(3);
            String date = idInfo.get(4);
            String usedTimes = idInfo.get(5);
            if (idString != null) {
                SharedPreferences sp = getSharedPreferences("idauthstring", 0);
                sp.edit().putString("key", idString).commit();
                this.idAuth_btn.setText(getResources().getString(R.string.registeragain));
            }
            if (resultString.length() != 0 && idString.length() != 0 && machineID2.length() != 0) {
                int result = Integer.parseInt(resultString);
                StringBuilder idauth_value = new StringBuilder();
                if (result == 4) {
                    idauth_value.append("正式版:");
                } else if (result == 5) {
                    idauth_value.append("测试版:");
                } else {
                    idauth_value.append("未注册");
                }
                if (result == 4 || result == 5) {
                    idauth_value.append(idString);
                }
                if (date.length() > 2) {
                    idauth_value.append("\n有效期限：" + date);
                } else if (date.length() == 1 && Integer.parseInt(date) == 0) {
                    idauth_value.append("\n有效期限：无限制");
                }
                if (times.length() > 0 && Integer.parseInt(times) > 0) {
                    if (usedTimes.length() > 0 && Integer.parseInt(usedTimes) >= 0) {
                        idauth_value.append("\n使用/授权次数：" + usedTimes + "/" + times);
                    } else {
                        idauth_value.append("\n授权次数：" + times);
                    }
                }
                this.idauth_edit.setHeight(50);
                String[] items = idauth_value.toString().split("\n");
                if (items == null) {
                    this.idauth_edit.setTextSize(18.0f);
                } else if (items.length == 1) {
                    this.idauth_edit.setTextSize(15.0f);
                } else {
                    this.idauth_edit.setTextSize(12.0f);
                }
                this.idauth_edit.setText(idauth_value);
            }
        }
    }

    public void loadidXml2() {
        File xmlFile = new File(Aduth.filepathMobileStudyClient_NEW);
        Log.e("setting", "auth:" + ((Object) null));
        if (!xmlFile.exists() || xmlFile.length() > 0) {
            List<String> idInfo = FileUtils.readIDFile();
            Log.e("setting", "auth:" + idInfo);
            if (idInfo != null && idInfo.size() > 0) {
                String idString = idInfo.get(0);
                String machineID = idInfo.get(1);
                String machineID2 = machineID;
                String resultString = idInfo.get(2);
                String times = idInfo.get(3);
                String date = idInfo.get(4);
                String usedTimes = idInfo.get(5);
                if (idString != null) {
                    SharedPreferences sp = getSharedPreferences("idauthstring", 0);
                    sp.edit().putString("key", idString).commit();
                    this.idAuth_btn.setText(getResources().getString(R.string.registeragain));
                }
                if (resultString != null && idString != null && resultString.length() != 0 && idString.length() != 0 && machineID2.length() != 0) {
                    int result = Integer.parseInt(resultString);
                    StringBuilder idauth_value = new StringBuilder();
                    if (result == 4) {
                        idauth_value.append("正式版:");
                    } else if (result == 5) {
                        idauth_value.append("测试版:");
                    } else {
                        idauth_value.append("未注册");
                    }
                    if (result == 4 || result == 5) {
                        idauth_value.append(idString);
                    }
                    if (date.length() > 2) {
                        idauth_value.append("\n有效期限：" + date);
                    } else if (date.length() == 1 && Integer.parseInt(date) == 0) {
                        idauth_value.append("\n有效期限：无限制");
                    }
                    if (times.length() > 0 && Integer.parseInt(times) > 0) {
                        if (usedTimes.length() > 0 && Integer.parseInt(usedTimes) >= 0) {
                            idauth_value.append("\n使用/授权次数：" + usedTimes + "/" + times);
                        } else {
                            idauth_value.append("\n授权次数：" + times);
                        }
                    }
                    this.idauth_edit.setHeight(50);
                    String[] items = idauth_value.toString().split("\n");
                    if (items == null) {
                        this.idauth_edit.setTextSize(14.0f);
                    } else if (items.length == 1) {
                        this.idauth_edit.setTextSize(12.0f);
                    } else {
                        this.idauth_edit.setTextSize(10.0f);
                    }
                    this.idauth_edit.setSingleLine(false);
                    this.idauth_edit.setText(idauth_value.toString());
                }
            }
        }
    }

    @Override // android.app.Activity
    public void onActivityResult(int requestCode, int resultCode, Intent intent) {
        boolean z = false;
        super.onActivityResult(requestCode, resultCode, intent);
        if (requestCode == 3) {
            if (resultCode == -1) {
                String contents = intent.getStringExtra(Intents.Scan.RESULT);
                intent.getStringExtra(Intents.Scan.RESULT_FORMAT);
                if (this.id == null) {
                    z = true;
                }
                Log.e("id", String.valueOf(z) + "," + (contents == null ? "null" : contents));
                if (contents != null && this.id != null) {
                    this.id.setText(contents);
                    return;
                }
                return;
            }
            Toast.makeText(this, "RESULT_NOT_OK", 0).show();
            return;
        }
        Toast.makeText(this, "ZXING_SCAN<>3", 0).show();
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$10 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass10 implements Runnable {
        AnonymousClass10() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // java.lang.Runnable
        public void run() {
            String times;
            String date;
            if (CloudClientSetActivity.this.id.getText().toString().length() < 10) {
                CloudClientSetActivity.this.showToast("授权码格式不对！");
            } else if (Build.VERSION.SDK_INT >= 24) {
                CloudClientSetActivity.access$50(CloudClientSetActivity.this);
            } else {
                HttpClient httpClient = CloudClientSetActivity.access$51(CloudClientSetActivity.this, new DefaultHttpClient());
                HttpPost httpPost = new HttpPost("https://www.icontrol365.com/regmac.aspx");
                StringBuilder xml = new StringBuilder();
                xml.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                xml.append("<ApplyAuth><strAuthID>" + CloudClientSetActivity.this.id.getText().toString() + "</strAuthID>");
                xml.append("<strMacAddr>" + CloudClientSetActivity.this.GetMachineID() + "</strMacAddr>");
                xml.append("<strSystemInfo>" + Build.MODEL + "</strSystemInfo></ApplyAuth>");
                try {
                    httpPost.setHeader("Content-Type", "application/xml;charset=UTF-8");
                    httpPost.setEntity(new StringEntity(xml.toString()));
                } catch (UnsupportedEncodingException e3) {
                    e3.printStackTrace();
                }
                try {
                    HttpResponse response = httpClient.execute(httpPost);
                    StatusLine status = response.getStatusLine();
                    if (status.getStatusCode() != 200) {
                        Log.d("SSL", "HTTP error, invalid server status code: " + response.getStatusLine());
                        return;
                    }
                    new ByteArrayOutputStream();
                    InputStream in = response.getEntity().getContent();
                    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                    DocumentBuilder builder = factory.newDocumentBuilder();
                    Document doc = builder.parse(in);
                    Element root = doc.getDocumentElement();
                    int result = Integer.parseInt(root.getElementsByTagName("AuthResult").item(0).getFirstChild().getNodeValue());
                    if (result == 4 || result == 5) {
                        NodeList tmpnode = root.getElementsByTagName("AuthTimes");
                        if (tmpnode.getLength() > 0 && tmpnode.item(0).getFirstChild().getNodeValue().length() > 0) {
                            times = tmpnode.item(0).getFirstChild().getNodeValue();
                        } else {
                            times = "0";
                        }
                        NodeList tmpnode2 = root.getElementsByTagName("AuthValidDate");
                        if (tmpnode2.getLength() > 0 && tmpnode2.item(0).getFirstChild().getNodeValue().length() > 0) {
                            date = tmpnode2.item(0).getFirstChild().getNodeValue();
                        } else {
                            date = "0";
                        }
                        int i = Build.VERSION.SDK_INT;
                        CloudClientSetActivity.this.idauth.writeidFile(CloudClientSetActivity.this.id.getText().toString(), result, times, date, "0");
                    }
                    Message msg = new Message();
                    msg.what = result;
                    CloudClientSetActivity.access$31(CloudClientSetActivity.this).sendMessageDelayed(msg, 1000L);
                } catch (IOException e) {
                    e.printStackTrace();
                } catch (IllegalStateException e2) {
                    e2.printStackTrace();
                } catch (ParserConfigurationException e1) {
                    e1.printStackTrace();
                } catch (SAXException e5) {
                    e5.printStackTrace();
                }
            }
        }
    }

    static /* synthetic */ void access$50(CloudClientSetActivity cloudClientSetActivity) {
        cloudClientSetActivity.sslConnect();
    }

    private void sslConnect() {
        MalformedURLException e6;
        String times;
        String date;
        try {
            URL urls = new URL("https://www.icontrol365.com/regmac.aspx");
            try {
                TrustManager[] trustAllCerts = {new AnonymousClass22()};
                HttpsURLConnection.setDefaultHostnameVerifier(new MyHostnameVerifier(this, null));
                SSLContext context = SSLContext.getInstance(IMAPSClient.DEFAULT_PROTOCOL);
                context.init(null, trustAllCerts, null);
                SSLSocketFactory preferredCipherSuiteSSLSocketFactory = new SSLSocketFactoryExtended();
                HttpsURLConnection urlconnection = (HttpsURLConnection) urls.openConnection();
                urlconnection.setSSLSocketFactory(preferredCipherSuiteSSLSocketFactory);
                urlconnection.setDoInput(true);
                urlconnection.setDoOutput(true);
                urlconnection.setRequestMethod(HttpPost.METHOD_NAME);
                urlconnection.addRequestProperty("Content-Type", "application/xml;charset=UTF-8");
                urlconnection.connect();
                StringBuilder xml = new StringBuilder();
                xml.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                xml.append("<ApplyAuth><strAuthID>" + this.id.getText().toString() + "</strAuthID>");
                xml.append("<strMacAddr>" + GetMachineID() + "</strMacAddr>");
                xml.append("<strSystemInfo>" + Build.MODEL + "</strSystemInfo></ApplyAuth>");
                DataOutputStream dos = new DataOutputStream(urlconnection.getOutputStream());
                dos.writeBytes(xml.toString());
                dos.flush();
                dos.close();
                if (200 == urlconnection.getResponseCode()) {
                    new StringBuffer();
                    new String();
                    InputStream in = urlconnection.getInputStream();
                    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                    DocumentBuilder builder = factory.newDocumentBuilder();
                    Document doc = builder.parse(in);
                    Element root = doc.getDocumentElement();
                    int result = Integer.parseInt(root.getElementsByTagName("AuthResult").item(0).getFirstChild().getNodeValue());
                    if (result == 4 || result == 5) {
                        NodeList tmpnode = root.getElementsByTagName("AuthTimes");
                        if (tmpnode.getLength() > 0 && tmpnode.item(0).getFirstChild().getNodeValue().length() > 0) {
                            times = tmpnode.item(0).getFirstChild().getNodeValue();
                        } else {
                            times = "0";
                        }
                        NodeList tmpnode2 = root.getElementsByTagName("AuthValidDate");
                        if (tmpnode2.getLength() > 0 && tmpnode2.item(0).getFirstChild().getNodeValue().length() > 0) {
                            date = tmpnode2.item(0).getFirstChild().getNodeValue();
                        } else {
                            date = "0";
                        }
                        int i = Build.VERSION.SDK_INT;
                        this.idauth.writeidFile(this.id.getText().toString(), result, times, date, "0");
                        try {
                            new Aduth(this).writeidFile(this.id.getText().toString(), result, times, date, "0");
                        } catch (Exception e) {
                        }
                    }
                    Log.e("HHH", "result:" + result);
                    Message msg = new Message();
                    msg.what = result;
                    this.resultHandler.sendMessageDelayed(msg, 1000L);
                }
            } catch (MalformedURLException e2) {
                e6 = e2;
                e6.printStackTrace();
            } catch (Exception e3) {
            }
        } catch (MalformedURLException e4) {
            e6 = e4;
        } catch (Exception e5) {
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$22 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass22 implements X509TrustManager {
        AnonymousClass22() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // javax.net.ssl.X509TrustManager
        public X509Certificate[] getAcceptedIssuers() {
            X509Certificate[] myTrustedAnchors = new X509Certificate[0];
            return myTrustedAnchors;
        }

        @Override // javax.net.ssl.X509TrustManager
        public void checkClientTrusted(X509Certificate[] certs, String authType) {
        }

        @Override // javax.net.ssl.X509TrustManager
        public void checkServerTrusted(X509Certificate[] certs, String authType) {
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$11 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass11 implements Runnable {
        AnonymousClass11() {
            //CloudClientSetActivity.this = r1;
        }

        /* synthetic */ CloudClientSetActivity access$0(AnonymousClass11 anonymousClass11) {
            return CloudClientSetActivity.this;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (CloudClientSetActivity.this.newpwd.getText().toString().length() < 6 || CloudClientSetActivity.this.oldpwd.getText().toString().length() < 6) {
                Message msg = new Message();
                msg.what = 13;
                CloudClientSetActivity.access$31(CloudClientSetActivity.this).sendMessageDelayed(msg, 1000L);
            } else if (CloudClientSetActivity.access$52(CloudClientSetActivity.this) != null && !"".equals(CloudClientSetActivity.access$52(CloudClientSetActivity.this).getText().toString())) {
                if (CloudClientSetActivity.access$24(CloudClientSetActivity.this) != null && CloudClientSetActivity.this.oldpwd != null && !"".equals(CloudClientSetActivity.access$24(CloudClientSetActivity.this).getText().toString()) && !"".equals(CloudClientSetActivity.this.oldpwd.getText().toString())) {
                    SharedPreferences sharePre = CloudClientSetActivity.this.getSharedPreferences("privatekey", 0);
                    String userName = sharePre.getString("name", "");
                    if (!TextUtils.isEmpty(userName)) {
                        CloudClientSetActivity.this.runOnUiThread(new AnonymousClass1(userName));
                    }
                    if (!userName.equals("")) {
                        CloudClientSetActivity.access$53(CloudClientSetActivity.this, CloudClientSetActivity.this.newpwd.getText().toString());
                        String result = CloudClientSetActivity.this.ModifyPassword(userName, CloudClientSetActivity.this.oldpwd.getText().toString(), CloudClientSetActivity.this.newpwd.getText().toString());
                        Message msg2 = new Message();
                        try {
                            if (result.equals("")) {
                                CloudClientSetActivity.access$54(CloudClientSetActivity.this,
                                    CloudClientSetActivity.this.getResources().getString(R.string.setting_errornetwork));
                                msg2.what = 12;
                                CloudClientSetActivity.access$31(CloudClientSetActivity.this).sendMessageDelayed(msg2, 500L);
                                return;
                            }
                            JSONObject jobj = new JSONObject(result);
                            boolean status = jobj.getBoolean("status");
                            if (!status) {
                                CloudClientSetActivity.access$54(CloudClientSetActivity.this, jobj.getString("errorInfo"));
                                msg2.what = 12;
                            } else {
                                File file = new File(AppEnvironment.URLFILEPATH);
                                if (file.exists()) {
                                    file.delete();
                                }
                                msg2.what = 11;
                            }
                            CloudClientSetActivity.access$31(CloudClientSetActivity.this).sendMessageDelayed(msg2, 500L);
                        } catch (JSONException e) {
                            msg2.what = 12;
                            e.printStackTrace();
                        }

                    }
                }
            } else {
                Message msg3 = new Message();
                msg3.what = 16;
                CloudClientSetActivity.access$31(CloudClientSetActivity.this).sendMessageDelayed(msg3, 1000L);
            }
        }

        /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$11$1 */
        /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
        class AnonymousClass1 implements Runnable {
            private final /* synthetic */ String val$userName;

            AnonymousClass1(String str) {
                this.val$userName = str;
            }

            @Override // java.lang.Runnable
            public void run() {
                CloudClientSetActivity.access$24(CloudClientSetActivity.this).setText(this.val$userName);
            }
        }
    }

    public String ModifyPassword(String username, String oldpw, String password) {
        SharedPreferences sharePre = getSharedPreferences("privatekey", 0);
        String privatekey = sharePre.getString("key", "");
        sharePre.getString("apihost", "");
        String username2 = this.modifiedName;
        String ip = this.modifiedIP;
        String url = JsonHelper.Update_Pwd_HTTPPOST_URL(ip);
        try {
            HttpPost post = new HttpPost(url);
            post.addHeader("X-Edutech-Entity", username2);
            long imestamp = System.currentTimeMillis();
            String sign = My_md5.Md5(String.valueOf(imestamp) + username2 + privatekey);
            post.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
            post.addHeader("Accept-Encoding", "gzip,deflate");
            MultipartEntity entity = new MultipartEntity();
            entity.addPart("newPassWord", new StringBody(password));
            entity.addPart("oldPassWord", new StringBody(oldpw));
            post.setEntity(entity);
            DefaultHttpClient client = new DefaultHttpClient();
            HttpResponse response = client.execute(post);
            String result = getJsonStringFromGZIP(response);
            return result;
        } catch (ClientProtocolException e) {
            e.printStackTrace();
            return "";
        } catch (IOException e2) {
            e2.printStackTrace();
            return "";
        }
    }

    static /* synthetic */ String access$68(CloudClientSetActivity cloudClientSetActivity, HttpResponse httpResponse) {
        return cloudClientSetActivity.getJsonStringFromGZIP(httpResponse);
    }

    private String getJsonStringFromGZIP(HttpResponse response) {
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
                    Log.d(TAG, " use GZIPInputStream  ");
                    is = new GZIPInputStream(bis);
                } else {
                    Log.d(TAG, " not use GZIPInputStream");
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
                Log.e(TAG, "ddddd=" + response.getStatusLine().getStatusCode());
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

    @SuppressLint({"NewApi"})
    public final String GetMachineID() {
        TelephonyManager tm = (TelephonyManager) getSystemService("phone");
        StringBuilder sb = new StringBuilder();
        sb.append("\nModel = " + Build.MODEL);
        sb.append("\nSerialNumber = " + Build.SERIAL);
        sb.append("\nDeviceId(IMEI) = " + tm.getDeviceId());
        String android_id = Settings.Secure.getString(getContentResolver(), "android_id");
        sb.append("\nAndroidID = " + android_id);
        WifiManager wm = (WifiManager) getSystemService("wifi");
        String m_szWLANMAC = wm.getConnectionInfo().getMacAddress();
        if (m_szWLANMAC == null) {
            for (int i = 0; i <= 5 && ((m_szWLANMAC = wm.getConnectionInfo().getMacAddress()) == null || m_szWLANMAC.length() <= 0); i++) {
                try {
                    Thread.sleep(org.apache.tools.ant.util.FileUtils.FAT_FILE_TIMESTAMP_GRANULARITY);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
        if (m_szWLANMAC != null && m_szWLANMAC.equals("02:00:00:00:00:00")) {
            m_szWLANMAC = getMacAddr();
        }
        if (m_szWLANMAC == null) {
            m_szWLANMAC = "";
        }
        sb.append("\nMACAddress = " + m_szWLANMAC);
        return String.valueOf(toHexString(toMd5(sb.toString().getBytes()), "")) + ":" + m_szWLANMAC.replaceAll(":", "");
    }

    @SuppressLint({"NewApi"})
    public String getMacAddr() {
        try {
            List<NetworkInterface> all = Collections.list(NetworkInterface.getNetworkInterfaces());
            for (NetworkInterface nif : all) {
                if (nif.getName().equalsIgnoreCase("wlan0")) {
                    byte[] macBytes = nif.getHardwareAddress();
                    if (macBytes == null) {
                        return "";
                    }
                    StringBuilder res1 = new StringBuilder();
                    for (byte b : macBytes) {
                        res1.append(String.valueOf(Integer.toHexString(b & BSON.MINKEY)) + ":");
                    }
                    if (res1.length() > 0) {
                        res1.deleteCharAt(res1.length() - 1);
                    }
                    return res1.toString();
                }
            }
        } catch (Exception e) {
        }
        return "";
    }

    public static byte[] toMd5(byte[] bytes) {
        try {
            MessageDigest algorithm = MessageDigest.getInstance("MD5");
            algorithm.reset();
            algorithm.update(bytes);
            return algorithm.digest();
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    public static String toHexString(byte[] bytes, String separator) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            hexString.append(Integer.toHexString(b & BSON.MINKEY)).append(separator);
        }
        return hexString.toString();
    }

    static /* synthetic */ HttpClient access$51(CloudClientSetActivity cloudClientSetActivity, HttpClient httpClient) {
        return cloudClientSetActivity.sslClient(httpClient);
    }

    private HttpClient sslClient(HttpClient client) {
        try {
            X509TrustManager tm = new AnonymousClass23();
            SSLContext ctx = SSLContext.getInstance(IMAPSClient.DEFAULT_PROTOCOL);
            ctx.init(null, new TrustManager[]{tm}, null);
            org.apache.http.conn.ssl.SSLSocketFactory ssf = new MySSLSocketFactory(ctx);
            ssf.setHostnameVerifier(org.apache.http.conn.ssl.SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
            ClientConnectionManager ccm = client.getConnectionManager();
            SchemeRegistry sr = ccm.getSchemeRegistry();
            sr.register(new Scheme("https", ssf, 443));
            return new DefaultHttpClient(ccm, client.getParams());
        } catch (Exception e) {
            return null;
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$23 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass23 implements X509TrustManager {
        AnonymousClass23() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // javax.net.ssl.X509TrustManager
        public void checkClientTrusted(X509Certificate[] xcs, String string) throws CertificateException {
        }

        @Override // javax.net.ssl.X509TrustManager
        public void checkServerTrusted(X509Certificate[] xcs, String string) throws CertificateException {
        }

        @Override // javax.net.ssl.X509TrustManager
        public X509Certificate[] getAcceptedIssuers() {
            return null;
        }
    }

    public void showToast(String text) {
        if (this.mToast != null) {
            this.mToast.cancel();
        }
        this.mToast = Toast.makeText(this, text, 1);
        this.mToast.show();
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$12 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass12 implements Runnable {
        AnonymousClass12() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // java.lang.Runnable
        public void run() {
            CloudClientSetActivity.access$21(CloudClientSetActivity.this, CloudClientSetActivity.access$1(CloudClientSetActivity.this).replaceAll(" ", ""));
            if (CloudClientSetActivity.access$1(CloudClientSetActivity.this).length() > 7) {
                String subhttp = CloudClientSetActivity.access$1(CloudClientSetActivity.this).substring(0, 7);
                if (subhttp.equals("http://")) {
                    CloudClientSetActivity.access$21(CloudClientSetActivity.this, CloudClientSetActivity.access$1(CloudClientSetActivity.this).substring(7));
                    Message message = CloudClientSetActivity.access$55(CloudClientSetActivity.this).obtainMessage();
                    message.what = HttpStatus.SC_SWITCHING_PROTOCOLS;
                    CloudClientSetActivity.access$55(CloudClientSetActivity.this).sendMessage(message);
                }
            }
            try {
                String struserName = CloudClientSetActivity.access$24(CloudClientSetActivity.this).getText().toString();
                String strpassWord = CloudClientSetActivity.access$19(CloudClientSetActivity.this).getText().toString();
                if (struserName != null && strpassWord != null) {
                    struserName = struserName.replaceAll(" ", "");
                    strpassWord = strpassWord.replaceAll(" ", "");
                }
                CloudClientSetActivity.access$56(CloudClientSetActivity.this, struserName);
                CloudClientSetActivity.access$57(CloudClientSetActivity.this, strpassWord);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
            int flag = -1;
            Log.i(CloudClientSetActivity.TAG, "writeXml");
            Log.i(CloudClientSetActivity.TAG, "2152");
            String ip = CloudClientSetActivity.access$0(CloudClientSetActivity.this).getText().toString();
            AppEnvironment.MOBILESTUDYSERVERIP = ip;
            String ip2 = ip.replaceAll(" ", "");
            if (ip2.length() > 7) {
                String subhttp2 = ip2.substring(0, 7);
                if (subhttp2.equals("http://")) {
                    ip2 = ip2.substring(7);
                    CloudClientSetActivity.access$52(CloudClientSetActivity.this).setText(ip2);
                    CloudClientSetActivity.access$0(CloudClientSetActivity.this).setText(ip2);
                }
            }
            if (ip2.endsWith("/")) {
                Message message2 = CloudClientSetActivity.access$31(CloudClientSetActivity.this).obtainMessage();
                message2.what = PointerIconCompat.TYPE_HELP;
                CloudClientSetActivity.access$31(CloudClientSetActivity.this).sendMessage(message2);
                return;
            }
            if (ip2 == null || (ip2 != null && ip2.length() <= 0)) {
                ip2 = "192.168.0.88";
            }
            String url = "http://" + ip2 + "/api/config";
            WifiManager wm = (WifiManager) CloudClientSetActivity.this.getSystemService("wifi");
            String m_szWLANMAC = wm.getConnectionInfo().getMacAddress();
            if (m_szWLANMAC != null && m_szWLANMAC.equals("02:00:00:00:00:00")) {
                m_szWLANMAC = CloudClientSetActivity.this.getMacAddr();
            }
            String result = null;
            try {
                result = CloudClientSetActivity.access$59(CloudClientSetActivity.this, String.valueOf(url) + "/mac/" + m_szWLANMAC, CloudClientSetActivity.access$58(CloudClientSetActivity.this));
            } catch (Exception e) {
                e.printStackTrace();
            }
            CloudClientSetActivity.access$54(CloudClientSetActivity.this, "");
            if (result != null && !result.equals("")) {
                flag = CloudClientSetActivity.access$60(CloudClientSetActivity.this, result);
            }
            if (flag == 1) {
                Message message3 = CloudClientSetActivity.access$31(CloudClientSetActivity.this).obtainMessage();
                message3.what = 20;
                message3.obj = result;
                CloudClientSetActivity.access$31(CloudClientSetActivity.this).sendMessage(message3);
            } else if (flag == 0) {
                Message message4 = CloudClientSetActivity.access$31(CloudClientSetActivity.this).obtainMessage();
                message4.what = 31;
                message4.obj = result;
                CloudClientSetActivity.access$31(CloudClientSetActivity.this).sendMessage(message4);
            } else if (flag == 2) {
                Message message5 = CloudClientSetActivity.access$31(CloudClientSetActivity.this).obtainMessage();
                message5.what = 32;
                message5.obj = result;
                CloudClientSetActivity.access$31(CloudClientSetActivity.this).sendMessage(message5);
            } else if (flag == -2) {
                Message message6 = CloudClientSetActivity.access$31(CloudClientSetActivity.this).obtainMessage();
                message6.what = PointerIconCompat.TYPE_HAND;
                message6.obj = result;
                CloudClientSetActivity.access$31(CloudClientSetActivity.this).sendMessage(message6);
            } else if (flag == -100) {
                Message message7 = CloudClientSetActivity.access$31(CloudClientSetActivity.this).obtainMessage();
                message7.what = 1005;
                message7.obj = result;
                CloudClientSetActivity.access$31(CloudClientSetActivity.this).sendMessage(message7);
            } else {
                Message message8 = CloudClientSetActivity.access$31(CloudClientSetActivity.this).obtainMessage();
                message8.what = 21;
                message8.obj = result;
                CloudClientSetActivity.access$31(CloudClientSetActivity.this).sendMessage(message8);
            }
        }
    }

    private boolean checkConfig(String jsonStr, String timeStamp) {
        try {
            JSONObject json = new JSONObject(jsonStr);
            if (json.has("checksum")) {
                JSONObject data = json.getJSONObject("data");
                data.toString();
                String checksum = json.getString("checksum");
                String seed = data.getString("privatekey");
                String apihost = data.getString("apihost");
                String aesString = AESUtils.encrypt(seed, String.valueOf(seed) + apihost + timeStamp);
                String md5String = My_md5.Md5(aesString);
                if (md5String == null || checksum == null) {
                    return false;
                }
                if (!md5String.equals(checksum)) {
                    return false;
                }
                return true;
            }
            return true;
        } catch (JSONException e) {
            e.printStackTrace();
            return false;
        } catch (Exception e2) {
            e2.printStackTrace();
            return false;
        }
    }

    static /* synthetic */ String access$59(CloudClientSetActivity cloudClientSetActivity, String str, String str2) {
        return cloudClientSetActivity.Get_Config_Json(str, str2);
    }

    private String Get_Config_Json(String url, String username) {
        if (url.equals("") || url == null || username.equals("") || username == null) {
            Log.e(TAG, "Get_Config_Json 入参有问题。。。");
            return null;
        }
        Log.e(TAG, "Get_Config_Json 入参有问题。。。" + url);
        try {
            HttpResponse httpResponse = Get_http_addheader(url, username, true);
            if (httpResponse.getStatusLine().getStatusCode() == 200) {
                StringBuilder builder = new StringBuilder();
                BufferedReader bufferedReader2 = new BufferedReader(new InputStreamReader(httpResponse.getEntity().getContent(), "UTF-8"));
                for (String s = bufferedReader2.readLine(); s != null; s = bufferedReader2.readLine()) {
                    builder.append(s);
                }
                String resultString = builder.toString();
                Log.e(TAG, "学校和用户个人信息获取完成。。。" + resultString);
                return resultString;
            }
            Log.e(TAG, "学校和用户个人信息获取完成。。。" + httpResponse.getStatusLine().getStatusCode());
            return null;
        } catch (ClientProtocolException e) {
            e.printStackTrace();
            return null;
        } catch (IOException e2) {
            e2.printStackTrace();
            return null;
        }
    }

    static /* synthetic */ int access$60(CloudClientSetActivity cloudClientSetActivity, String str) {
        return cloudClientSetActivity.jsonToConfig(str);
    }

    private int jsonToConfig(String json_str) {
        String owncloud_port = "";
        String username = "";
        String mongo_pwd = "";
        String tigase_ip = "";
        String userid = "";
        if (json_str == null || json_str.equals("")) {
            return -1;
        }
        String guidancestate = "0";
        String guidenotes = "0";
        if (!checkConfig(json_str, this.timeStamp)) {
            return -100;
        }
        try {
            JSONObject info = new JSONObject(json_str);
            info.getString("status");
            String errorInfo = info.getString("errorInfo");
            this.saveErrorInfo = errorInfo;
            String errorNum = info.getString("errorNum");
            if (errorNum.equals("-2")) {
                return -2;
            }
            if (errorNum.equals("0")) {
                JSONObject data = info.getJSONObject("data");
                String privatekey = data.getString("privatekey");
                String encrypt = data.getString("encrypt");
                String apihost = data.getString("apihost");
                try {
                    guidancestate = data.getString("guidelearncomment");
                } catch (Exception e) {
                }
                try {
                    guidenotes = data.getString("guidenotes");
                } catch (Exception e2) {
                }
                JSONObject user = data.getJSONObject(UserID.ELEMENT_NAME);
                String pubkey = user.getString("pubkey");
                String type_user = user.getString("type");
                if (!type_user.equals("03") && !type_user.equals(LogHelp.TYPE_HWHELP)) {
                    return 2;
                }
                try {
                    userid = user.getString("id");
                } catch (Exception e3) {
                    e3.printStackTrace();
                }
                if (!My_md5.Md5(this.Pwd).equals(pubkey)) {
                    // 真的牛逼，在本地验证密码
                    showToast("密码错误！但 OpenStudyClient 可以强制登录")
                    // TODO
                    //return 0;
                }
                SharedPreferences sharePre = getSharedPreferences("privatekey", 0);
                SharedPreferences.Editor editor = sharePre.edit();
                editor.putString("key", privatekey);
                editor.putString("name", user.getString("usercode"));
                editor.putString("apihost", apihost);
                JSONObject ebag = null;
                try {
                    ebag = data.getJSONObject("ebag");
                    if (ebag != null && !sharePre.getString("updatetime", "").equals(ebag.getString("updatetime"))) {
                        Log.i("liu", "save time:" + sharePre.getString("updatetime", ""));
                        Log.i("liu", "request time:" + ebag.getString("updatetime"));
                        this.isUpdate = true;
                        editor.putString("updatetime", ebag.getString("updatetime"));
                    }
                } catch (Exception e1) {
                    e1.printStackTrace();
                }
                editor.putString("userid", userid);
                editor.commit();
                String domain = "";
                String port = "";
                try {
                    JSONObject tigase = data.getJSONObject("tigase");
                    domain = "";
                    try {
                        domain = tigase.getString(ClientCookie.DOMAIN_ATTR);
                    } catch (Exception e4) {
                        e4.printStackTrace();
                    }
                    try {
                        port = tigase.getString(ClientCookie.PORT_ATTR);
                    } catch (Exception e5) {
                        e5.printStackTrace();
                    }
                    try {
                        tigase_ip = tigase.getString("ip");
                    } catch (Exception e6) {
                        e6.printStackTrace();
                    }
                } catch (Exception e7) {
                    e7.printStackTrace();
                }
                String mongo_domain = "";
                String mongo_port = "";
                String mongo_user = "";
                try {
                    JSONObject mongo = data.getJSONObject("mongo");
                    mongo_domain = "";
                    mongo_port = "";
                    mongo_user = "";
                    try {
                        mongo_domain = mongo.getString(ClientCookie.DOMAIN_ATTR);
                    } catch (Exception e8) {
                        e8.printStackTrace();
                    }
                    try {
                        mongo_port = mongo.getString(ClientCookie.PORT_ATTR);
                    } catch (Exception e9) {
                        e9.printStackTrace();
                    }
                    try {
                        mongo_user = mongo.getString(UserID.ELEMENT_NAME);
                    } catch (Exception e10) {
                        e10.printStackTrace();
                    }
                    try {
                        mongo_pwd = mongo.getString("pwd");
                    } catch (Exception e11) {
                        e11.printStackTrace();
                    }
                } catch (Exception e12) {
                    e12.printStackTrace();
                }
                String type = "";
                String schoolid = "";
                String schoolname = "";
                String usercode = "";
                try {
                    JSONObject user_json = data.getJSONObject(UserID.ELEMENT_NAME);
                    try {
                        String Type = user_json.getString("type");
                        try {
                            if (Type.equals("02")) {
                                type = "0";
                            } else if (Type.equals("03")) {
                                type = LogHelp.TYPE_MYWORK;
                            } else if (Type.equals("05")) {
                                type = LogHelp.TYPE_GUIDANCE;
                            } else {
                                type = "7";
                            }
                        } catch (Exception e13) {
                            e13.printStackTrace();
                            type = LogHelp.TYPE_MYWORK;
                        }
                    } catch (Exception e14) {
                        e14.printStackTrace();
                        type = "7";
                        Toast.makeText(getApplicationContext(), getResources().getString(R.string.setting_noneusererror), 0).show();
                    }
                    try {
                        JSONArray school_json = user_json.getJSONArray("school");
                        try {
                            JSONObject school_item = school_json.getJSONObject(0);
                            try {
                                schoolid = school_item.getString("id");
                                SharedPreferences sharePre2 = getSharedPreferences("privatekey", 0);
                                SharedPreferences.Editor editor2 = sharePre2.edit();
                                editor2.putString("schoolid", schoolid);
                                editor2.commit();
                            } catch (Exception e15) {
                                e15.printStackTrace();
                            }
                            try {
                                schoolname = school_item.getString("name");
                            } catch (Exception e16) {
                                e16.printStackTrace();
                            }
                        } catch (Exception e17) {
                            e17.printStackTrace();
                        }
                    } catch (Exception e18) {
                        e18.printStackTrace();
                    }
                    try {
                        usercode = user_json.getString("usercode");
                    } catch (Exception e19) {
                        e19.printStackTrace();
                    }
                    try {
                        username = user_json.getString("name");
                        this.stu_name = username;
                    } catch (Exception e20) {
                        e20.printStackTrace();
                    }
                } catch (Exception e21) {
                    e21.printStackTrace();
                }
                String owncloud_domain = "";
                try {
                    JSONObject cloud = data.getJSONObject("cloud");
                    owncloud_domain = "";
                    try {
                        cloud.getString("scheme");
                    } catch (Exception e22) {
                        e22.printStackTrace();
                    }
                    try {
                        owncloud_domain = cloud.getString(ClientCookie.DOMAIN_ATTR);
                    } catch (Exception e23) {
                        e23.printStackTrace();
                    }
                    try {
                        owncloud_port = cloud.getString(ClientCookie.PORT_ATTR);
                    } catch (Exception e24) {
                        e24.printStackTrace();
                    }
                } catch (Exception e25) {
                    e25.printStackTrace();
                }
                String wifi = null;
                String setting = null;
                String large = null;
                String normal = null;
                String small = null;
                ArrayList<AppBean> apps = new ArrayList<>();
                try {
                    JSONObject desktopicon = ebag.getJSONObject("desktopicon");
                    wifi = desktopicon.getString("wifi");
                    setting = desktopicon.getString("setting");
                    JSONObject background = desktopicon.getJSONObject("background");
                    large = background.getString("large");
                    normal = background.getString(SQLExec.DelimiterType.NORMAL);
                    small = background.getString("small");
                    JSONArray app = ebag.getJSONArray("app");
                    for (int i = 0; i < app.length(); i++) {
                        HashMap<String, String> config = new HashMap<>();
                        String code = app.getJSONObject(i).getString("code");
                        String name = app.getJSONObject(i).getString("name");
                        String color = app.getJSONObject(i).getString("color");
                        String icon = app.getJSONObject(i).getString("icon");
                        String iconLocal = String.valueOf(AppEnvironment.icon) + icon.substring(icon.lastIndexOf("/") + 1);
                        int enable = app.getJSONObject(i).getInt("enable");
                        try {
                            String comment = new StringBuilder(String.valueOf(app.getJSONObject(i).getJSONObject("config").getInt(ClientCookie.COMMENT_ATTR))).toString();
                            String download = new StringBuilder(String.valueOf(app.getJSONObject(i).getJSONObject("config").getInt("download"))).toString();
                            config.put(ClientCookie.COMMENT_ATTR, comment);
                            config.put("download", download);
                        } catch (Exception e26) {
                            config.put(ClientCookie.COMMENT_ATTR, "-1");
                            config.put("download", "-1");
                            e26.printStackTrace();
                        }
                        apps.add(new AppBean(code, name, color, icon, enable, config, iconLocal));
                    }
                } catch (Exception e27) {
                    e27.printStackTrace();
                    Log.i("liu", "Exception :" + e27);
                }
                String owncloudip = (owncloud_port == null || owncloud_port.equals("") || !owncloud_port.equals("80")) ? String.valueOf(owncloud_domain) + ":" + owncloud_port : owncloud_domain;
                writeXml_config(privatekey, encrypt, apihost, domain, port, tigase_ip, mongo_domain, mongo_port, mongo_user, mongo_pwd, type, schoolid, schoolname, owncloudip, usercode, userid, guidancestate, username, null, wifi, setting, apps, guidenotes);
                ArrayList<String> urls = new ArrayList<>();
                urls.add(wifi);
                urls.add(setting);
                urls.add(large);
                urls.add(normal);
                urls.add(small);
                for (int i2 = 0; i2 < apps.size(); i2++) {
                    urls.add(apps.get(i2).getIcon());
                }
                return 1;
            }
            return -1;
        } catch (JSONException e28) {
            e28.printStackTrace();
            return -1;
        }
    }

    private void downLoadImage(ArrayList<String> urls) {
        for (int i = 0; i < urls.size(); i++) {
            try {
                URL url = new URL(urls.get(i));
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                int code = conn.getResponseCode();
                if (code == 200) {
                    InputStream in = conn.getInputStream();
                    savePic(in, urls.get(i));
                }
            } catch (Exception e) {
                e.printStackTrace();
                Log.i("liu", "downLoadImage:" + e);
            }
        }
    }

    private void savePic(InputStream in, String url) throws Exception{
        Throwable th;
        FileOutputStream out;
        String picPath = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/icon";
        String name = url.substring(url.lastIndexOf("/") + 1);
        File file = FileInOutHelper.setupOrOpenFile(picPath, name);
        FileOutputStream out2 = null;
        try {
            out = new FileOutputStream(file);
        } catch (Throwable th2) {
            th = th2;
            return;
        }
        try {
            byte[] b = new byte[1024];
            while (true) {
                int length = in.read(b);
                if (length != -1) {
                    out.write(b, 0, length);
                } else {
                    try {
                        in.close();
                        out.close();
                        return;
                    } catch (Exception e2) {
                        e2.printStackTrace();
                        Log.i("liu", "close stream:" + e2);
                        return;
                    }
                }
            }
        } catch (Exception e3) {
            Exception e;
            e = e3;
            out2 = out;
            e.printStackTrace();
            Log.i("liu", "savePic:" + e);
            try {
                in.close();
                out2.close();
            } catch (Exception e4) {
                e4.printStackTrace();
                Log.i("liu", "close stream:" + e4);
            }
        } catch (Throwable th3) {
            th = th3;
            out2 = out;
            try {
                in.close();
                out2.close();
            } catch (Exception e5) {
                e5.printStackTrace();
                Log.i("liu", "close stream:" + e5);
            }
            throw th3;
        }
    }

    private void appendUserInfo(String fileName, String content) {
        try {
            RandomAccessFile randomFile = new RandomAccessFile(fileName, "rw");
            long fileLength = randomFile.length();
            randomFile.seek(fileLength);
            randomFile.writeBytes(String.valueOf(content) + "\r\n");
            randomFile.close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e2) {
        }
    }

    private void writeXml_config(String privatekey, String encrypt, String apihost, String domain, String port, String tigase_ip, String mongo_domain, String mongo_port, String mongo_user, String mongo_pwd, String type, String schoolid, String schoolname, String owncloudip, String usercode, String userid, String guidancestate, String truename, String guidelearndownload, String wifi, String setting, ArrayList<AppBean> apps, String guidenotes) {
        Log.i(TAG, "writeXml");
        if (privatekey != null && !privatekey.equals("")) {
            String ip = this.ip_edit.getText().toString();
            AppEnvironment.MOBILESTUDYSERVERIP = ip;
            String ip2 = ip.replaceAll(" ", "");
            if (ip2.length() > 7) {
                String subhttp = ip2.substring(0, 7);
                if (subhttp.equals("http://")) {
                    ip2 = ip2.substring(7);
                    this.ptfw_edit.setText(ip2);
                    this.ip_edit.setText(ip2);
                    showToast(getResources().getString(R.string.setting_serverurlerror));
                    getResources().getString(R.string.setting_signing);
                }
            }
            if (ip2 != null && ip2 != null) {
                ip2.length();
            }
            String apihost2 = apihost.replaceAll(" ", "");
            if (apihost2.length() > 7) {
                String subhttp2 = apihost2.substring(0, 7);
                if (subhttp2.equals("http://")) {
                    apihost2 = apihost2.substring(7);
                    Log.i("Test2", getResources().getString(R.string.setting_serverurlerror));
                }
            }
            String username = "";
            String password = "";
            String pwd = "";
            String stuid = "";
            String gdstate = "";
            String stuname = "";
            String guidenote = "";
            String appendData = String.valueOf(ip2) + ":" + usercode;
            try {
                String struserName = this.Name;
                String strpassWord = this.Pwd;
                username = BZip2Utils.StringEncodeToBase64(struserName);
                pwd = BZip2Utils.StringEncodeToBase64(strpassWord);
                if (encrypt.toString().trim().equals("md5")) {
                    password = My_md5.Md5(strpassWord);
                } else {
                    password = BZip2Utils.StringEncodeToBase64(strpassWord);
                }
                privatekey = BZip2Utils.StringEncodeToBase64(privatekey);
                apihost2 = BZip2Utils.StringEncodeToBase64(apihost2);
                port = BZip2Utils.StringEncodeToBase64(port);
                domain = BZip2Utils.StringEncodeToBase64(domain);
                tigase_ip = BZip2Utils.StringEncodeToBase64(tigase_ip);
                mongo_domain = BZip2Utils.StringEncodeToBase64(mongo_domain);
                mongo_port = BZip2Utils.StringEncodeToBase64(mongo_port);
                mongo_user = BZip2Utils.StringEncodeToBase64(mongo_user);
                mongo_pwd = BZip2Utils.StringEncodeToBase64(mongo_pwd);
                type = BZip2Utils.StringEncodeToBase64(type);
                schoolid = BZip2Utils.StringEncodeToBase64(schoolid);
                schoolname = BZip2Utils.StringEncodeToBase64(schoolname);
                owncloudip = BZip2Utils.StringEncodeToBase64(owncloudip);
                usercode = BZip2Utils.StringEncodeToBase64(usercode);
                stuid = BZip2Utils.StringEncodeToBase64(userid);
                gdstate = BZip2Utils.StringEncodeToBase64(guidancestate);
                stuname = BZip2Utils.StringEncodeToBase64(truename);
                guidelearndownload = BZip2Utils.StringEncodeToBase64(guidelearndownload);
                wifi = BZip2Utils.StringEncodeToBase64(wifi);
                setting = BZip2Utils.StringEncodeToBase64(setting);
                guidenote = BZip2Utils.StringEncodeToBase64(guidenotes);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
            File xmlFile = FileInOutHelper.setupOrOpenFile(this.urlfilepath);
            try {
                this.fileos = new FileOutputStream(xmlFile);
            } catch (FileNotFoundException e) {
                Log.e("FileNotFoundException", "can't create FileOutputStream");
            }
            XmlSerializer serializer = Xml.newSerializer();
            try {
                serializer.setOutput(this.fileos, "UTF-8");
                serializer.startDocument(null, true);
                serializer.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
                try {
                    serializer.startTag(null, "urlpath");
                    try {
                        serializer.startTag(null, "ip");
                        serializer.text(ip2);
                        serializer.endTag(null, "ip");
                    } catch (Exception e2) {
                        e2.printStackTrace();
                    }
                    try {
                        serializer.startTag(null, "showDemo");
                        serializer.text(this.setDemoShow);
                        serializer.endTag(null, "showDemo");
                    } catch (Exception e3) {
                        e3.printStackTrace();
                    }
                    serializer.endTag(null, "urlpath");
                } catch (Exception e4) {
                    e4.printStackTrace();
                }
                try {
                    serializer.startTag(null, "student");
                    try {
                        serializer.startTag(null, "stuid");
                        serializer.text(stuid);
                        serializer.endTag(null, "stuid");
                        serializer.startTag(null, "usercode");
                        serializer.text(usercode);
                        serializer.endTag(null, "usercode");
                        serializer.startTag(null, "username");
                        serializer.text(username);
                        serializer.endTag(null, "username");
                        serializer.startTag(null, com.edutech.idauthentication.AppEnvironment.PASSWORD);
                        serializer.text(password);
                        serializer.endTag(null, com.edutech.idauthentication.AppEnvironment.PASSWORD);
                        serializer.startTag(null, "pwd");
                        serializer.text(pwd);
                        serializer.endTag(null, "pwd");
                        serializer.startTag(null, "stuname");
                        serializer.text(stuname);
                        serializer.endTag(null, "stuname");
                    } catch (Exception e5) {
                        e5.printStackTrace();
                    }
                    try {
                        serializer.startTag(null, "privatekey");
                        serializer.text(privatekey);
                        serializer.endTag(null, "privatekey");
                        serializer.startTag(null, "encrypt");
                        serializer.text(encrypt);
                        serializer.endTag(null, "encrypt");
                        serializer.startTag(null, "apihost");
                        serializer.text(apihost2);
                        serializer.endTag(null, "apihost");
                        serializer.startTag(null, ClientCookie.DOMAIN_ATTR);
                        serializer.text(domain);
                        serializer.endTag(null, ClientCookie.DOMAIN_ATTR);
                        serializer.startTag(null, ClientCookie.PORT_ATTR);
                        serializer.text(port);
                        serializer.endTag(null, ClientCookie.PORT_ATTR);
                        serializer.startTag(null, "tigase_ip");
                        serializer.text(tigase_ip);
                        serializer.endTag(null, "tigase_ip");
                    } catch (Exception e6) {
                        e6.printStackTrace();
                    }
                    try {
                        serializer.startTag(null, "mongo_domain");
                        serializer.text(mongo_domain);
                        serializer.endTag(null, "mongo_domain");
                        serializer.startTag(null, "mongo_port");
                        serializer.text(mongo_port);
                        serializer.endTag(null, "mongo_port");
                        serializer.startTag(null, "mongo_user");
                        serializer.text(mongo_user);
                        serializer.endTag(null, "mongo_user");
                        serializer.startTag(null, "mongo_pwd");
                        serializer.text(mongo_pwd);
                        serializer.endTag(null, "mongo_pwd");
                    } catch (Exception e7) {
                        e7.printStackTrace();
                    }
                    try {
                        serializer.startTag(null, "user_type");
                        serializer.text(type);
                        serializer.endTag(null, "user_type");
                        serializer.startTag(null, "schoolid");
                        serializer.text(schoolid);
                        serializer.endTag(null, "schoolid");
                        serializer.startTag(null, "schoolname");
                        serializer.text(schoolname);
                        serializer.endTag(null, "schoolname");
                    } catch (Exception e8) {
                        e8.printStackTrace();
                    }
                    try {
                        serializer.startTag(null, "owncloudip");
                        serializer.text(owncloudip);
                        serializer.endTag(null, "owncloudip");
                    } catch (Exception e9) {
                        e9.printStackTrace();
                    }
                    try {
                        serializer.startTag(null, "gdstate");
                        serializer.text(gdstate);
                        serializer.endTag(null, "gdstate");
                    } catch (Exception e10) {
                        e10.printStackTrace();
                    }
                    try {
                        serializer.startTag(null, "guidenotes");
                        serializer.text(guidenote);
                        serializer.endTag(null, "guidenotes");
                    } catch (Exception e11) {
                        e11.printStackTrace();
                    }
                    try {
                        serializer.startTag(null, "guidelearndownload");
                        serializer.text(new StringBuilder(String.valueOf(guidelearndownload)).toString());
                        serializer.endTag(null, "guidelearndownload");
                    } catch (Exception e12) {
                    }
                    try {
                        serializer.startTag(null, "wifi");
                        serializer.text(new StringBuilder(String.valueOf(wifi)).toString());
                        serializer.endTag(null, "wifi");
                    } catch (Exception e13) {
                    }
                    try {
                        serializer.startTag(null, "setting");
                        serializer.text(new StringBuilder(String.valueOf(setting)).toString());
                        serializer.endTag(null, "setting");
                    } catch (Exception e14) {
                    }
                    serializer.endTag(null, "student");
                } catch (Exception e15) {
                    e15.printStackTrace();
                }
                try {
                    serializer.startTag(null, "apps");
                    for (int i = 0; i < apps.size(); i++) {
                        serializer.startTag(null, "app");
                        serializer.startTag(null, "code");
                        serializer.text(apps.get(i).getCode());
                        serializer.endTag(null, "code");
                        serializer.startTag(null, "name");
                        serializer.text(apps.get(i).getName());
                        serializer.endTag(null, "name");
                        serializer.startTag(null, "color");
                        serializer.text(apps.get(i).getColor());
                        serializer.endTag(null, "color");
                        serializer.startTag(null, "icon");
                        serializer.text(apps.get(i).getIcon());
                        serializer.endTag(null, "icon");
                        serializer.startTag(null, "iconLocal");
                        serializer.text(apps.get(i).getIconLocal());
                        serializer.endTag(null, "iconLocal");
                        serializer.startTag(null, "enable");
                        serializer.text(new StringBuilder(String.valueOf(apps.get(i).getEnable())).toString());
                        serializer.endTag(null, "enable");
                        serializer.startTag(null, "config");
                        serializer.startTag(null, "download");
                        serializer.text(apps.get(i).getConfig().get("download"));
                        serializer.endTag(null, "download");
                        serializer.startTag(null, ClientCookie.COMMENT_ATTR);
                        serializer.text(apps.get(i).getConfig().get(ClientCookie.COMMENT_ATTR));
                        serializer.endTag(null, ClientCookie.COMMENT_ATTR);
                        serializer.endTag(null, "config");
                        serializer.endTag(null, "app");
                    }
                    serializer.endTag(null, "apps");
                } catch (Exception e16) {
                    e16.printStackTrace();
                    Log.e(TAG, "write to  xml file" + e16.toString());
                }
                serializer.endDocument();
                serializer.flush();
                this.fileos.close();
                appendUserInfo(this.settingHistory, appendData);
            } catch (Exception e17) {
                e17.printStackTrace();
            }
        }
    }

    private HttpResponse Get_http_addheader(String url, String user_Name, boolean isconfig) throws IOException, ClientProtocolException {
        HttpGet request = new HttpGet(url);
        request.addHeader("X-Edutech-Entity", user_Name);
        long imestamp = System.currentTimeMillis();
        if (isconfig) {
            this.timeStamp = new StringBuilder(String.valueOf(imestamp)).toString();
        }
        String sign = My_md5.Md5(String.valueOf(imestamp) + user_Name);
        request.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpResponse httpResponse = httpClient.execute(request);
            return httpResponse;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class HostPwd extends Thread {
        HostPwd() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            try {
                CloudClientSetActivity.access$79(CloudClientSetActivity.this, CloudClientSetActivity.access$78(CloudClientSetActivity.this));
                CloudClientSetActivity.access$81(CloudClientSetActivity.this, CloudClientSetActivity.access$80(CloudClientSetActivity.this));
            } catch (Exception e) {
            }
        }
    }

    static /* synthetic */ String access$78(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.getManagerPwd();
    }

    private String getManagerPwd() {
        SharedPreferences sharePre = getSharedPreferences("privatekey", 0);
        String privatekey = sharePre.getString("key", "");
        String ip = sharePre.getString("apihost", "");
        String username = sharePre.getString("name", "");
        HashMap<String, String> hashmap = XmlLoadHelper.loadXml();
        if (hashmap != null && (ip == null || ip.equals("") || username.equals(""))) {
            ip = hashmap.get("ip");
            username = hashmap.get("usercode");
            privatekey = hashmap.get("privatekey");
        }
        Log.e("pwd", "start get pwd");
        String url = "http://" + ip + "/api/padpwd";
        HttpPost post = new HttpPost(url);
        post.addHeader("X-Edutech-Entity", username);
        long imestamp = System.currentTimeMillis();
        String sign = My_md5.Md5(String.valueOf(imestamp) + username + privatekey);
        post.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
        DefaultHttpClient client = new DefaultHttpClient();
        try {
            HttpResponse response = client.execute(post);
            String result = getJsonStringFromGZIP(response);
            JSONObject jobj = new JSONObject(result);
            String data = jobj.getString("data");
            AESSet aesset = new AESSet();
            byte[] byaes = aesset.decrypt(data);
            String pwd = new String(byaes, 0, byaes.length);
            return pwd;
        } catch (Exception e) {
            e.printStackTrace();
            return "ayjedutechyx@123456z";
        }
    }

    static /* synthetic */ String access$80(CloudClientSetActivity cloudClientSetActivity) {
        return cloudClientSetActivity.getUserPwd();
    }

    private String getUserPwd() {
        String pwd = this.pwdOrigal;
        String url = "http://" + this.ipOrigal + "/api/config";
        String result = Get_Config_Json(url, this.nameOrigal);
        try {
            JSONObject jobj = new JSONObject(result);
            JSONObject data = null;
            JSONObject user = null;
            if (jobj != null) {
                data = jobj.getJSONObject("data");
            }
            if (data != null) {
                user = data.getJSONObject(UserID.ELEMENT_NAME);
            }
            if (user != null) {
                String pubkey = user.getString("pubkey");
                try {
                    return BZip2Utils.Base64DecodeToString(pubkey);
                } catch (Exception e) {
                    e.printStackTrace();
                    return pwd;
                }
            }
            return pwd;
        } catch (JSONException e2) {
            e2.printStackTrace();
            return pwd;
        }
    }

    static /* synthetic */ void access$48(CloudClientSetActivity cloudClientSetActivity) {
        cloudClientSetActivity.showConfirmPwdDialog();
    }

    private void showConfirmPwdDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setMessage(R.string.confirm_pwd);
        View view = LayoutInflater.from(this).inflate(R.layout.confirmpwd, (ViewGroup) null);
        EditText edtpwd = (EditText) view.findViewById(R.id.edt_pwd);
        builder.setView(view);
        builder.setNegativeButton(R.string.cancel, new AnonymousClass24()).setPositiveButton(R.string.appmanager_ok, new AnonymousClass25(edtpwd));
        this.pwdConfirmDialog = null;
        try {
            this.pwdConfirmDialog = builder.create();
            this.pwdConfirmDialog.show();
        } catch (Exception e) {
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$24 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass24 implements DialogInterface.OnClickListener {
        AnonymousClass24() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.content.DialogInterface.OnClickListener
        public void onClick(DialogInterface arg0, int arg1) {
            CloudClientSetActivity.access$16(CloudClientSetActivity.this).setEnabled(true);
            CloudClientSetActivity.access$17(CloudClientSetActivity.this).setEnabled(true);
            CloudClientSetActivity.access$17(CloudClientSetActivity.this).setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
            if (CloudClientSetActivity.access$87(CloudClientSetActivity.this) != null) {
                CloudClientSetActivity.access$87(CloudClientSetActivity.this).dismiss();
            }
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$25 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass25 implements DialogInterface.OnClickListener {
        private final /* synthetic */ EditText val$edtpwd;

        AnonymousClass25(EditText editText) {
            //CloudClientSetActivity.this = r1;
            this.val$edtpwd = editText;
        }

        @Override // android.content.DialogInterface.OnClickListener
        public void onClick(DialogInterface arg0, int arg1) {
            if (this.val$edtpwd != null) {
                String edtStr = this.val$edtpwd.getText().toString() != null ? this.val$edtpwd.getText().toString() : "";
                if (AppEnvironment.isXF || AppEnvironment.isNL || AppEnvironment.isNLEZ || AppEnvironment.isHT || AppEnvironment.isGQ) {
                    if (edtStr.equals(CloudClientSetActivity.access$88(CloudClientSetActivity.this).trim())) {
                        new Thread(CloudClientSetActivity.this.runnable_GetConfig_Infor).start();
                    } else {
                        CloudClientSetActivity.access$16(CloudClientSetActivity.this).setEnabled(true);
                        CloudClientSetActivity.access$17(CloudClientSetActivity.this).setEnabled(true);
                        CloudClientSetActivity.access$17(CloudClientSetActivity.this).setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                        Toast.makeText(CloudClientSetActivity.this, "密码验证不通过！", 0).show();
                    }
                } else if (edtStr.equals(CloudClientSetActivity.access$88(CloudClientSetActivity.this).trim()) || edtStr.equals(CloudClientSetActivity.access$89(CloudClientSetActivity.this).trim())) {
                    CloudClientSetActivity.access$32(CloudClientSetActivity.this, true);
                } else {
                    CloudClientSetActivity.access$32(CloudClientSetActivity.this, false);
                }
            }
            if (CloudClientSetActivity.access$87(CloudClientSetActivity.this) != null) {
                CloudClientSetActivity.access$87(CloudClientSetActivity.this).dismiss();
            }
        }
    }

    @Override // com.edutech.cloudclientsetting.activity.IPListAdapter.IpInterface
    public void okIp(String ip) {
        if (this.listpop != null) {
            this.listpop.dismiss();
        }
        if (this.ip_edit != null) {
            this.ip_edit.setText(ip);
        }
    }

    @Override // com.edutech.cloudclientsetting.activity.IPListAdapter.IpInterface
    public void deleteIp(String ip) {
        if (this.ips != null) {
            if (this.listpop != null && this.ipAdpter != null) {
                if (this.ips != null && this.ips.contains(ip)) {
                    this.ips.remove(ip);
                    this.ipAdpter.setIps(this.ips);
                    this.ipAdpter.notifyDataSetChanged();
                }
                SharedPreferences loginSp = getSharedPreferences("loginhistory", 4);
                String tempips = loginSp.getString("iphistoryString", "");
                loginSp.edit().putString("iphistoryString", tempips.replace(String.valueOf(ip) + ",:,", "").replace(ip, "")).commit();
            }
            this.history_array = nameHistoryDeleteByIP(ip, this.history_array);
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private class MyHostnameVerifier implements HostnameVerifier {
        private MyHostnameVerifier() {
            //CloudClientSetActivity.this = r1;
        }

        /* synthetic */ MyHostnameVerifier(CloudClientSetActivity cloudClientSetActivity, MyHostnameVerifier myHostnameVerifier) {
            this();
        }

        @Override // javax.net.ssl.HostnameVerifier
        public boolean verify(String hostname, SSLSession session) {
            return true;
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private class MyTrustManager implements X509TrustManager {
        private MyTrustManager() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // javax.net.ssl.X509TrustManager
        public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
        }

        @Override // javax.net.ssl.X509TrustManager
        public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
        }

        @Override // javax.net.ssl.X509TrustManager
        public X509Certificate[] getAcceptedIssuers() {
            return null;
        }
    }

    static /* synthetic */ void access$43(CloudClientSetActivity cloudClientSetActivity) {
        cloudClientSetActivity.updatePassword();
    }

    private void updatePassword() {
        LayoutInflater pwdinflater = getLayoutInflater();
        View pwdlayout = pwdinflater.inflate(R.layout.update_pwd_dialog_setting, (ViewGroup) findViewById(R.id.update_pwd_dialog));
        this.oldpwd = (EditText) pwdlayout.findViewById(R.id.update_pwd_dialog_oldpwd);
        this.newpwd = (EditText) pwdlayout.findViewById(R.id.update_pwd_dialog_newpwd);
        this.confirmpwd = (EditText) pwdlayout.findViewById(R.id.update_pwd_dialog_confirmpwd);
        AlertDialog.Builder pwdalertDialog = new AlertDialog.Builder(this).setTitle(getResources().getString(R.string.setting_cp)).setInverseBackgroundForced(true).setView(pwdlayout).setPositiveButton(getResources().getString(R.string.setting_submit), new AnonymousClass26()).setNegativeButton(getResources().getString(R.string.setting_cancel), new AnonymousClass27());
        pwdalertDialog.show();
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$26 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass26 implements DialogInterface.OnClickListener {
        AnonymousClass26() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.content.DialogInterface.OnClickListener
        public void onClick(DialogInterface dialog, int which) {
            if (CloudClientSetActivity.this.oldpwd.getText().toString().length() >= 6) {
                if (CloudClientSetActivity.this.newpwd.getText().toString().length() >= 6) {
                    if (CloudClientSetActivity.this.newpwd.getText().toString().equals(CloudClientSetActivity.this.confirmpwd.getText().toString())) {
                        CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_submiting));
                        new Thread(CloudClientSetActivity.this.updatepwdRun).start();
                        return;
                    }
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_errorpw1));
                    return;
                }
                CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_errorpw2));
                return;
            }
            CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_errorpw3));
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.CloudClientSetActivity$27 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass27 implements DialogInterface.OnClickListener {
        AnonymousClass27() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.content.DialogInterface.OnClickListener
        public void onClick(DialogInterface dialog, int which) {
            if (dialog != null) {
                dialog.dismiss();
            }
        }
    }

    private JSONArray nameHistoryParser() {
        SharedPreferences sp = getSharedPreferences("loginhistory", 4);
        if (!sp.contains("namehistorystring")) {
            return null;
        }
        String namesString = sp.getString("namehistorystring", "");
        if (namesString == null || namesString.equals("")) {
            return null;
        }
        try {
            return new JSONArray(namesString);
        } catch (JSONException e) {
            e.printStackTrace();
            return null;
        }
    }

    private ArrayList<HashMap<String, String>> nameHistoryQuery(String ipHistory, JSONArray arrays) {
        ArrayList<HashMap<String, String>> names = new ArrayList<>();
        if (arrays != null && ipHistory != null && arrays.length() > 0) {
            for (int i = 0; i < arrays.length(); i++) {
                try {
                    JSONObject jObject = arrays.getJSONObject(i);
                    JSONArray nameArrays = null;
                    if (jObject.has("ip") && ipHistory.equals(jObject.getString("ip")) && jObject.has("students")) {
                        nameArrays = jObject.getJSONArray("students");
                    }
                    if (nameArrays != null && nameArrays.length() > 0) {
                        for (int j = 0; j < nameArrays.length(); j++) {
                            JSONObject stuObject = nameArrays.getJSONObject(j);
                            if (stuObject != null && stuObject.has("code") && stuObject.has("name")) {
                                HashMap<String, String> stuInfo = new HashMap<>();
                                String code = stuObject.getString("code");
                                String name = stuObject.getString("name");
                                stuInfo.put("code", code);
                                stuInfo.put("name", name);
                                names.add(stuInfo);
                            }
                        }
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }
        return names;
    }

    static /* synthetic */ JSONArray access$40(CloudClientSetActivity cloudClientSetActivity, String str, String str2, String str3, JSONArray jSONArray) {
        return cloudClientSetActivity.nameHistoryAdd(str, str2, str3, jSONArray);
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0054  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private JSONArray nameHistoryAdd(String addName, String ipHistory, String addCode, JSONArray preArray) {
        JSONObject addObject;
        JSONException e;
        JSONException e2;
        JSONArray afterAddArray = new JSONArray();
        JSONObject addObject2 = null;
        if (addCode == null || ipHistory == null) {
            return preArray;
        }
        boolean has = false;
        if (preArray != null && preArray.length() >= 0) {
            for (int i = 0; i < preArray.length(); i++) {
                try {
                    JSONObject jObject = preArray.getJSONObject(i);
                    JSONArray nameArrays = null;
                    if (!jObject.has("ip")) {
                        afterAddArray.put(jObject);
                    } else {
                        if (jObject.has("ip") && ipHistory.equals(jObject.getString("ip")) && jObject.has("students")) {
                            nameArrays = jObject.getJSONArray("students");
                        }
                        if (nameArrays != null && nameArrays.length() > 0) {
                            int j = 0;
                            while (true) {
                                if (j >= nameArrays.length()) {
                                    break;
                                }
                                JSONObject stuObject = nameArrays.getJSONObject(j);
                                if (stuObject == null || !stuObject.has("code") || !stuObject.getString("code").equals(addCode)) {
                                    j++;
                                } else {
                                    has = true;
                                    break;
                                }
                            }
                            if (!has) {
                                JSONObject temp = new JSONObject();
                                temp.put("code", addCode);
                                temp.put("name", addName);
                                nameArrays.put(temp);
                                JSONObject addObject3 = new JSONObject();
                                try {
                                    addObject3.put("ip", ipHistory);
                                    addObject3.put("students", nameArrays);
                                    addObject2 = addObject3;
                                } catch (JSONException e3) {
                                    e2 = e3;
                                    addObject2 = addObject3;
                                    e2.printStackTrace();
                                }
                            }
                        }
                    }
                } catch (JSONException e4) {
                    e2 = e4;
                }
            }
        }
        JSONObject addObject4 = addObject2;
        if (addObject4 != null || has) {
            addObject = addObject4;
        } else {
            JSONArray nameArrays2 = new JSONArray();
            JSONObject temp2 = new JSONObject();
            try {
                temp2.put("code", addCode);
                temp2.put("name", addName);
                nameArrays2.put(temp2);
                addObject = new JSONObject();
            } catch (JSONException e5) {
                e = e5;
                addObject = addObject4;
            }
            try {
                addObject.put("ip", ipHistory);
                addObject.put("students", nameArrays2);
            } catch (JSONException e6) {
                e = e6;
                e.printStackTrace();
                if (addObject != null) {
                }
                return afterAddArray == null ? afterAddArray : afterAddArray;
            }
        }
        if (addObject != null) {
            afterAddArray.put(addObject);
        }
        SharedPreferences sp = getSharedPreferences("loginhistory", 4);
        sp.edit().putString("namehistorystring", afterAddArray.toString()).commit();
        return afterAddArray;
    }

    private JSONArray nameHistoryDelete(String ipHistory, String deleteCode, JSONArray preArray) {
        JSONException e;
        JSONArray afterAddArray = new JSONArray();
        if (preArray == null || deleteCode == null || ipHistory == null || preArray.length() <= 0) {
            return preArray;
        }
        if (preArray != null && preArray.length() >= 0) {
            for (int i = 0; i < preArray.length(); i++) {
                try {
                    JSONObject jObject = preArray.getJSONObject(i);
                    JSONArray nameArrays = null;
                    if (!jObject.has("ip")) {
                        afterAddArray.put(jObject);
                    } else {
                        if (jObject.has("ip") && ipHistory.equals(jObject.getString("ip")) && jObject.has("students")) {
                            nameArrays = jObject.getJSONArray("students");
                        }
                        if (nameArrays != null && nameArrays.length() > 0) {
                            JSONArray tempArray = new JSONArray();
                            for (int j = 0; j < nameArrays.length(); j++) {
                                JSONObject stuObject = nameArrays.getJSONObject(j);
                                if (stuObject != null && stuObject.has("code") && !deleteCode.equals(stuObject.getString("code"))) {
                                    tempArray.put(stuObject);
                                }
                            }
                            JSONObject modifiedObject = new JSONObject();
                            try {
                                modifiedObject.put("ip", ipHistory);
                                modifiedObject.put("students", tempArray);
                                afterAddArray.put(modifiedObject);
                            } catch (JSONException e2) {
                                e = e2;
                                e.printStackTrace();
                            }
                        }
                    }
                } catch (JSONException e3) {
                    e = e3;
                }
            }
        }
        if (afterAddArray != null) {
            SharedPreferences sp = getSharedPreferences("loginhistory", 4);
            sp.edit().putString("namehistorystring", afterAddArray.toString()).commit();
            return afterAddArray;
        }
        return afterAddArray;
    }

    private JSONArray nameHistoryDeleteByIP(String ipHistory, JSONArray preArray) {
        JSONArray afterAddArray = new JSONArray();
        if (preArray == null || ipHistory == null || preArray.length() <= 0) {
            return preArray;
        }
        if (preArray != null && preArray.length() >= 0) {
            for (int i = 0; i < preArray.length(); i++) {
                try {
                    JSONObject jObject = preArray.getJSONObject(i);
                    if (!jObject.has("ip")) {
                        afterAddArray.put(jObject);
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }
        if (afterAddArray != null) {
            SharedPreferences sp = getSharedPreferences("loginhistory", 4);
            sp.edit().putString("namehistorystring", afterAddArray.toString()).commit();
            return afterAddArray;
        }
        return afterAddArray;
    }

    @Override // com.edutech.cloudclientsetting.activity.NameListAdapter.NameHistoryInterface
    public void deleteName(String code) {
        String ip = this.ip_edit != null ? this.ip_edit.getText().toString() : "";
        if (!ip.equals("") && this.history_array != null) {
            this.history_array = nameHistoryDelete(ip, code, this.history_array);
            this.history_nameList = nameHistoryQuery(ip, this.history_array);
            if (this.nameListAdapter != null && this.history_nameList != null) {
                this.nameListAdapter.setIps(this.history_nameList);
                this.nameListAdapter.notifyDataSetChanged();
            }
        }
    }

    @Override // com.edutech.cloudclientsetting.activity.NameListAdapter.NameHistoryInterface
    public void okName(String name) {
        if (this.nameListpop != null) {
            this.nameListpop.dismiss();
        }
        if (this.username_edit != null) {
            this.username_edit.setText(name);
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class InstallReceiver extends BroadcastReceiver {
        InstallReceiver() {
            //CloudClientSetActivity.this = r1;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context arg0, Intent arg1) {
            if (arg1.getAction().equals("android.intent.action.PACKAGE_ADDED") && AppEnvironment.isNewUpdate && CloudClientSetActivity.access$14(CloudClientSetActivity.this) != null && CloudClientSetActivity.access$14(CloudClientSetActivity.this).size() > 0) {
                boolean hasFinishedUpdate = true;
                List<ApkUpdateBean> uninstalledList = new ArrayList<>();
                String packageName = arg1.getDataString().replace("package:", "");
                for (int i = 0; i < CloudClientSetActivity.access$14(CloudClientSetActivity.this).size(); i++) {
                    ApkUpdateBean bean = (ApkUpdateBean) CloudClientSetActivity.access$14(CloudClientSetActivity.this).get(i);
                    if (packageName.equals(bean.getPackagename())) {
                        CloudClientSetActivity.access$73(CloudClientSetActivity.this, i, 1, CloudClientSetActivity.UPDATE_INSTALLSTATE);
                    } else if (bean.getInstallState() != 1) {
                        hasFinishedUpdate = false;
                        uninstalledList.add(bean);
                    }
                }
                if (hasFinishedUpdate && !"com.launcher.activity".equals(packageName)) {
                    CloudClientSetActivity.access$5(CloudClientSetActivity.this);
                    CloudClientSetActivity.access$6(CloudClientSetActivity.this);
                } else if (uninstalledList.size() == 1 && "com.launcher.activity".equals(uninstalledList.get(0).getPackagename()) && !TextUtils.isEmpty(CloudClientSetActivity.access$72(CloudClientSetActivity.this))) {
                    CloudClientSetActivity.access$73(CloudClientSetActivity.this, -1, uninstalledList.get(0).getApkLocalPath(), CloudClientSetActivity.UPDATE_INSTALLSINGLE);
                }
            }
        }
    }
}
