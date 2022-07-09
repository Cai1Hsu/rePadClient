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
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.apache.commons.compress.archivers.tar.TarConstants;
import org.apache.commons.net.imap.IMAPSClient;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.cookie.ClientCookie;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.tools.ant.taskdefs.SQLExec;
import org.apache.tools.ant.util.FileUtils;
import org.jivesoftware.smackx.workgroup.packet.UserID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/CloudClientSetActivity.class */
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
    private Handler mHandler = new Handler() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.1
        @Override // android.os.Handler
        public void handleMessage(Message message) {
            if (message.what != 4) {
                if (message.what == 10) {
                    CloudClientSetActivity.this.finish();
                } else if (message.what == 101) {
                    CloudClientSetActivity.this.ip_edit.setText(CloudClientSetActivity.this.JXHD_Ip);
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_serverurlerror));
                } else if (message.what == 102) {
                    LanguageUtils.SetLanguage(CloudClientSetActivity.this, "chinese");
                    CloudClientSetActivity.this.writeXmlLanguage("chinese");
                    XmlLoadHelper.createLanuage("chinese");
                    CloudClientSetActivity.this.finish();
                    System.exit(0);
                } else if (message.what == 103) {
                    LanguageUtils.SetLanguage(CloudClientSetActivity.this, "en");
                    CloudClientSetActivity.this.writeXmlLanguage("english");
                    XmlLoadHelper.createLanuage("en");
                    CloudClientSetActivity.this.finish();
                    System.exit(0);
                }
            }
            super.handleMessage(message);
        }
    };
    private Handler installHandler = new Handler() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.2
        @Override // android.os.Handler
        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    CloudClientSetActivity.this.installNewApk();
                    break;
                case 2:
                    CloudClientSetActivity.this.tvUpdateNow.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_startupdating));
                    CloudClientSetActivity.this.tvUpdateNow.setEnabled(true);
                    CloudClientSetActivity.this.tvUpdateNow.setTextColor(CloudClientSetActivity.this.getResources().getColor(R.color.blue));
                    break;
                case 3:
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_latestversion));
                    CloudClientSetActivity.this.closeProgressDialog();
                    CloudClientSetActivity.this.resetUpdateInfo();
                    break;
                case 4:
                    CloudClientSetActivity.this.startAssistanApk();
                    if (!CloudClientSetActivity.this.isFinishing()) {
                        CloudClientSetActivity.this.showProgressDialog();
                        break;
                    }
                    break;
                case PointerIconCompat.TYPE_CONTEXT_MENU /* 1001 */:
                    if (CloudClientSetActivity.this.webprogressdialog != null && !CloudClientSetActivity.this.isover && !AppEnvironment.isNewUpdate) {
                        DecimalFormat decimalFormat = new DecimalFormat("##0.00");
                        String str = String.valueOf(decimalFormat.format(((CloudClientSetActivity.this.currentCachePosition * 1.0d) / 1024.0d) / 1024.0d)) + "MB/" + decimalFormat.format(((CloudClientSetActivity.this.currentCacheLength * 1.0d) / 1024.0d) / 1024.0d) + "MB";
                        if (CloudClientSetActivity.this.currentCacheLength != 0) {
                            int i = (int) ((CloudClientSetActivity.this.currentCachePosition * 100) / CloudClientSetActivity.this.currentCacheLength);
                            int i2 = i;
                            if (i >= 100) {
                                i2 = 100;
                            }
                            CloudClientSetActivity.this.webprogressdialog.setMessage(String.valueOf(CloudClientSetActivity.this.getString(R.string.updatingapk)) + "  " + i2 + "%  " + str);
                            break;
                        } else {
                            CloudClientSetActivity.this.webprogressdialog.setMessage(String.valueOf(CloudClientSetActivity.this.getString(R.string.updatingapk)) + "  0%");
                            break;
                        }
                    }
                    break;
                case CloudClientSetActivity.UPDATE_PROGRESS /* 4113 */:
                    try {
                        Long l = (Long) message.obj;
                        int i3 = message.arg1;
                        ApkUpdateBean apkUpdateBean = (ApkUpdateBean) CloudClientSetActivity.this.apkUpdateList.get(i3);
                        apkUpdateBean.setApkDownloadSize(l.longValue());
                        CloudClientSetActivity.this.apkUpdateList.set(i3, apkUpdateBean);
                        CloudClientSetActivity.this.progressDialog.updateProgress(i3);
                        break;
                    } catch (Exception e) {
                        e.printStackTrace();
                        break;
                    }
                case CloudClientSetActivity.UPDATE_INSTALLSTATE /* 4114 */:
                    try {
                        int intValue = ((Integer) message.obj).intValue();
                        int i4 = message.arg1;
                        ApkUpdateBean apkUpdateBean2 = (ApkUpdateBean) CloudClientSetActivity.this.apkUpdateList.get(i4);
                        apkUpdateBean2.setInstallState(intValue);
                        CloudClientSetActivity.this.apkUpdateList.set(i4, apkUpdateBean2);
                        CloudClientSetActivity.this.progressDialog.updateProgress(i4);
                        break;
                    } catch (Exception e2) {
                        e2.printStackTrace();
                        break;
                    }
                case CloudClientSetActivity.START_PROGRESS /* 4115 */:
                    try {
                        CloudClientSetActivity.this.progressDialog.setData(CloudClientSetActivity.this.apkUpdateList);
                        break;
                    } catch (Exception e3) {
                        break;
                    }
                case CloudClientSetActivity.UPDATE_INSTALLSINGLE /* 4116 */:
                    CloudClientSetActivity.this.installSingleApk((String) message.obj);
                    break;
            }
            super.handleMessage(message);
        }
    };
    private Handler resultHandler = new Handler() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.3
        @Override // android.os.Handler
        @SuppressLint({"NewApi"})
        public void handleMessage(Message message) {
            switch (message.what) {
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
                    if (!"".equals(CloudClientSetActivity.this.updatePassword)) {
                        CloudClientSetActivity.this.password_edit.setText(CloudClientSetActivity.this.updatePassword);
                    }
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_cpok));
                    CloudClientSetActivity.this.isResetPwd = false;
                    CloudClientSetActivity.this.btnTitleBack.setEnabled(false);
                    CloudClientSetActivity.this.ok_btn.setEnabled(false);
                    CloudClientSetActivity.this.ok_btn.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_saving));
                    CloudClientSetActivity.this.JXHD_Ip = CloudClientSetActivity.this.ip_edit.getText().toString().trim();
                    new Thread(CloudClientSetActivity.this.runnable_GetConfig_Infor).start();
                    break;
                case 12:
                    if (CloudClientSetActivity.this.saveErrorInfo != null && !CloudClientSetActivity.this.saveErrorInfo.equals("")) {
                        CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.saveErrorInfo);
                        break;
                    } else {
                        CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_cpfailed));
                        break;
                    }
                    break;
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
                    CloudClientSetActivity.this.ipOrigal = CloudClientSetActivity.this.ip_edit.getText().toString();
                    CloudClientSetActivity.this.nameOrigal = CloudClientSetActivity.this.username_edit.getText().toString();
                    CloudClientSetActivity.this.pwdOrigal = CloudClientSetActivity.this.password_edit.getText().toString();
                    CloudClientSetActivity.this.modifiedIP = CloudClientSetActivity.this.ipOrigal;
                    CloudClientSetActivity.this.modifiedName = CloudClientSetActivity.this.nameOrigal;
                    CloudClientSetActivity.this.resultHandler.sendEmptyMessageDelayed(24, 3000L);
                    CloudClientSetActivity.this.allChangeSettings = false;
                    CloudClientSetActivity.this.threadPwd = null;
                    SharedPreferences sharedPreferences = CloudClientSetActivity.this.getSharedPreferences("privatekey", 0);
                    String string = sharedPreferences.getString("schoolid", "");
                    String string2 = sharedPreferences.getString("name", "");
                    String string3 = sharedPreferences.getString("apihost", "");
                    CloudClientSetActivity.this.startFireWall(string3, sharedPreferences.getString("key", ""), string2, string);
                    SharedPreferences sharedPreferences2 = CloudClientSetActivity.this.getSharedPreferences("loginhistory", 4);
                    String string4 = sharedPreferences2.getString("iphistoryString", "");
                    String str = string4;
                    if (!string4.contains(string3)) {
                        str = String.valueOf(string4) + string3 + ",:,";
                    }
                    sharedPreferences2.edit().putString("iphistoryString", str).commit();
                    if (CloudClientSetActivity.this.listpop != null && CloudClientSetActivity.this.ipAdpter != null && CloudClientSetActivity.this.ips != null && !CloudClientSetActivity.this.ips.contains(string3)) {
                        CloudClientSetActivity.this.ips.add(string3);
                        CloudClientSetActivity.this.ipAdpter.setIps(CloudClientSetActivity.this.ips);
                        CloudClientSetActivity.this.ipAdpter.notifyDataSetChanged();
                    }
                    try {
                        CloudClientSetActivity.this.history_array = CloudClientSetActivity.this.nameHistoryAdd(CloudClientSetActivity.this.stu_name, CloudClientSetActivity.this.ipOrigal, CloudClientSetActivity.this.nameOrigal, CloudClientSetActivity.this.history_array);
                        break;
                    } catch (Exception e) {
                        break;
                    }
                case 21:
                    CloudClientSetActivity.this.btnTitleBack.setEnabled(true);
                    CloudClientSetActivity.this.ok_btn.setEnabled(true);
                    CloudClientSetActivity.this.ok_btn.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                    if (CloudClientSetActivity.this.saveErrorInfo != null && !CloudClientSetActivity.this.saveErrorInfo.equals("")) {
                        Toast.makeText(CloudClientSetActivity.this.getApplicationContext(), CloudClientSetActivity.this.saveErrorInfo, 0).show();
                        break;
                    } else if (CloudClientSetActivity.this.getInternetState()) {
                        Toast.makeText(CloudClientSetActivity.this.getApplicationContext(), CloudClientSetActivity.this.getResources().getString(R.string.setting_errorsetting), 0).show();
                        break;
                    } else {
                        Toast.makeText(CloudClientSetActivity.this.getApplicationContext(), CloudClientSetActivity.this.getResources().getString(R.string.setting_errornetwork), 0).show();
                        break;
                    }
                    break;
                case 24:
                    CloudClientSetActivity.this.btnTitleBack.setEnabled(true);
                    CloudClientSetActivity.this.ok_btn.setEnabled(true);
                    CloudClientSetActivity.this.ok_btn.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                    break;
                case 31:
                    CloudClientSetActivity.this.btnTitleBack.setEnabled(true);
                    CloudClientSetActivity.this.ok_btn.setEnabled(true);
                    CloudClientSetActivity.this.ok_btn.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                    if (CloudClientSetActivity.this.saveErrorInfo != null && !CloudClientSetActivity.this.saveErrorInfo.equals("")) {
                        Toast.makeText(CloudClientSetActivity.this.getApplicationContext(), CloudClientSetActivity.this.saveErrorInfo, 0).show();
                        break;
                    } else {
                        Toast.makeText(CloudClientSetActivity.this.getApplicationContext(), CloudClientSetActivity.this.getResources().getString(R.string.setting_errorpwd), 0).show();
                        break;
                    }
                    break;
                case 32:
                    CloudClientSetActivity.this.btnTitleBack.setEnabled(true);
                    CloudClientSetActivity.this.ok_btn.setEnabled(true);
                    CloudClientSetActivity.this.ok_btn.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                    if (CloudClientSetActivity.this.saveErrorInfo != null && !CloudClientSetActivity.this.saveErrorInfo.equals("")) {
                        Toast.makeText(CloudClientSetActivity.this.getApplicationContext(), CloudClientSetActivity.this.saveErrorInfo, 0).show();
                        break;
                    } else {
                        Toast.makeText(CloudClientSetActivity.this.getApplicationContext(), CloudClientSetActivity.this.getResources().getString(R.string.setting_erroracctype), 0).show();
                        break;
                    }
                    break;
                case 112:
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.appresetend));
                    break;
                case 1000:
                    CloudClientSetActivity.this.idauth_edit.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_signing));
                    break;
                case PointerIconCompat.TYPE_HAND /* 1002 */:
                    CloudClientSetActivity.this.isResetPwd = true;
                    CloudClientSetActivity.this.btnTitleBack.setEnabled(true);
                    CloudClientSetActivity.this.ok_btn.setEnabled(true);
                    CloudClientSetActivity.this.ok_btn.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                    CloudClientSetActivity.this.modifiedIP = CloudClientSetActivity.this.ip_edit.getText().toString();
                    CloudClientSetActivity.this.modifiedName = CloudClientSetActivity.this.username_edit.getText().toString();
                    CloudClientSetActivity.this.updatePassword();
                    break;
                case PointerIconCompat.TYPE_HELP /* 1003 */:
                    CloudClientSetActivity.this.btnTitleBack.setEnabled(true);
                    CloudClientSetActivity.this.ok_btn.setEnabled(true);
                    CloudClientSetActivity.this.ok_btn.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                    CloudClientSetActivity.this.showToast("地址最后一位不能为'/'");
                    break;
                case 1005:
                    CloudClientSetActivity.this.btnTitleBack.setEnabled(true);
                    CloudClientSetActivity.this.ok_btn.setEnabled(true);
                    CloudClientSetActivity.this.ok_btn.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.checksum_failed));
                    break;
                default:
                    CloudClientSetActivity.this.idauth_edit.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_signfailed));
                    break;
            }
            super.handleMessage(message);
        }
    };
    View.OnTouchListener nameListener = new View.OnTouchListener() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.4
        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View view, MotionEvent motionEvent) {
            switch (motionEvent.getAction()) {
                case 1:
                    CloudClientSetActivity.this.showPopNameList();
                    return false;
                default:
                    return false;
            }
        }
    };
    View.OnTouchListener ipListener = new View.OnTouchListener() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.5
        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View view, MotionEvent motionEvent) {
            switch (motionEvent.getAction()) {
                case 1:
                    CloudClientSetActivity.this.showPopList();
                    return false;
                default:
                    return false;
            }
        }
    };
    TextWatcher ipWatcher = new TextWatcher() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.6
        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable editable) {
            String editable2 = CloudClientSetActivity.this.ip_edit.getText().toString();
            if (editable2 != null && !CloudClientSetActivity.this.ipOrigal.equals("") && !editable2.equals(CloudClientSetActivity.this.ipOrigal)) {
                if (CloudClientSetActivity.this.threadPwd == null) {
                    CloudClientSetActivity.this.threadPwd = new HostPwd();
                    CloudClientSetActivity.this.threadPwd.start();
                }
                if (CloudClientSetActivity.this.allChangeSettings) {
                    return;
                }
                CloudClientSetActivity.this.ip_edit.setText(CloudClientSetActivity.this.ipOrigal);
                CloudClientSetActivity.this.showConfirmPwdDialog();
            }
            CloudClientSetActivity.this.ip_edit.setSelection(CloudClientSetActivity.this.ip_edit.getText().length());
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        }
    };
    TextWatcher nameWatcher = new TextWatcher() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.7
        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable editable) {
            String editable2 = CloudClientSetActivity.this.username_edit.getText().toString();
            if (editable2 != null && !CloudClientSetActivity.this.nameOrigal.equals("") && !editable2.equals(CloudClientSetActivity.this.nameOrigal)) {
                if (CloudClientSetActivity.this.threadPwd == null) {
                    CloudClientSetActivity.this.threadPwd = new HostPwd();
                    CloudClientSetActivity.this.threadPwd.start();
                }
                if (CloudClientSetActivity.this.allChangeSettings) {
                    return;
                }
                CloudClientSetActivity.this.username_edit.setText(CloudClientSetActivity.this.nameOrigal);
                CloudClientSetActivity.this.showConfirmPwdDialog();
            }
            CloudClientSetActivity.this.username_edit.setSelection(CloudClientSetActivity.this.username_edit.getText().length());
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        }
    };
    TextWatcher pwdWatcher = new TextWatcher() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.8
        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable editable) {
            String editable2 = CloudClientSetActivity.this.password_edit.getText().toString();
            if (editable2 != null && !CloudClientSetActivity.this.pwdOrigal.equals("") && !editable2.equals(CloudClientSetActivity.this.pwdOrigal)) {
                if (CloudClientSetActivity.this.threadPwd == null) {
                    CloudClientSetActivity.this.threadPwd = new HostPwd();
                    CloudClientSetActivity.this.threadPwd.start();
                }
                if (CloudClientSetActivity.this.allChangeSettings) {
                    return;
                }
                CloudClientSetActivity.this.password_edit.setText(CloudClientSetActivity.this.pwdOrigal);
                CloudClientSetActivity.this.showConfirmPwdDialog();
            }
            CloudClientSetActivity.this.password_edit.setSelection(CloudClientSetActivity.this.password_edit.getText().length());
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        }
    };
    DialogInterface.OnKeyListener keylistenerDialog = new DialogInterface.OnKeyListener() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.9
        @Override // android.content.DialogInterface.OnKeyListener
        public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
            boolean z;
            if (i == 4 && keyEvent.getRepeatCount() == 0) {
                CloudClientSetActivity.this.closeProgressDialog();
                CloudClientSetActivity.this.resetUpdateInfo();
                z = true;
            } else {
                z = false;
            }
            return z;
        }
    };
    public Runnable downloadRun = new Runnable() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.10
        @Override // java.lang.Runnable
        public void run() {
            if (CloudClientSetActivity.this.id.getText().toString().length() < 10) {
                CloudClientSetActivity.this.showToast("授权码格式不对！");
            } else if (Build.VERSION.SDK_INT >= 24) {
                CloudClientSetActivity.this.sslConnect();
            } else {
                HttpClient sslClient = CloudClientSetActivity.this.sslClient(new DefaultHttpClient());
                HttpPost httpPost = new HttpPost("https://www.icontrol365.com/regmac.aspx");
                StringBuilder sb = new StringBuilder();
                sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                sb.append("<ApplyAuth><strAuthID>" + CloudClientSetActivity.this.id.getText().toString() + "</strAuthID>");
                sb.append("<strMacAddr>" + CloudClientSetActivity.this.GetMachineID() + "</strMacAddr>");
                sb.append("<strSystemInfo>" + Build.MODEL + "</strSystemInfo></ApplyAuth>");
                try {
                    httpPost.setHeader("Content-Type", "application/xml;charset=UTF-8");
                    httpPost.setEntity(new StringEntity(sb.toString()));
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                try {
                    HttpResponse execute = sslClient.execute(httpPost);
                    if (execute.getStatusLine().getStatusCode() != 200) {
                        Log.d("SSL", "HTTP error, invalid server status code: " + execute.getStatusLine());
                        return;
                    }
                    new ByteArrayOutputStream();
                    Element documentElement = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(execute.getEntity().getContent()).getDocumentElement();
                    int parseInt = Integer.parseInt(documentElement.getElementsByTagName("AuthResult").item(0).getFirstChild().getNodeValue());
                    if (parseInt == 4 || parseInt == 5) {
                        NodeList elementsByTagName = documentElement.getElementsByTagName("AuthTimes");
                        String nodeValue = (elementsByTagName.getLength() <= 0 || elementsByTagName.item(0).getFirstChild().getNodeValue().length() <= 0) ? "0" : elementsByTagName.item(0).getFirstChild().getNodeValue();
                        NodeList elementsByTagName2 = documentElement.getElementsByTagName("AuthValidDate");
                        String nodeValue2 = (elementsByTagName2.getLength() <= 0 || elementsByTagName2.item(0).getFirstChild().getNodeValue().length() <= 0) ? "0" : elementsByTagName2.item(0).getFirstChild().getNodeValue();
                        int i = Build.VERSION.SDK_INT;
                        CloudClientSetActivity.this.idauth.writeidFile(CloudClientSetActivity.this.id.getText().toString(), parseInt, nodeValue, nodeValue2, "0");
                    }
                    Message message = new Message();
                    message.what = parseInt;
                    CloudClientSetActivity.this.resultHandler.sendMessageDelayed(message, 1000L);
                } catch (IOException e2) {
                    e2.printStackTrace();
                } catch (IllegalStateException e3) {
                    e3.printStackTrace();
                } catch (ParserConfigurationException e4) {
                    e4.printStackTrace();
                } catch (ClientProtocolException e5) {
                    e5.printStackTrace();
                } catch (SAXException e6) {
                    e6.printStackTrace();
                }
            }
        }
    };
    public Runnable updatepwdRun = new Runnable() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.11
        @Override // java.lang.Runnable
        public void run() {
            if (CloudClientSetActivity.this.newpwd.getText().toString().length() < 6 || CloudClientSetActivity.this.oldpwd.getText().toString().length() < 6) {
                Message message = new Message();
                message.what = 13;
                CloudClientSetActivity.this.resultHandler.sendMessageDelayed(message, 1000L);
            } else if (CloudClientSetActivity.this.ptfw_edit == null || "".equals(CloudClientSetActivity.this.ptfw_edit.getText().toString())) {
                Message message2 = new Message();
                message2.what = 16;
                CloudClientSetActivity.this.resultHandler.sendMessageDelayed(message2, 1000L);
            } else if (CloudClientSetActivity.this.username_edit == null || CloudClientSetActivity.this.oldpwd == null || "".equals(CloudClientSetActivity.this.username_edit.getText().toString()) || "".equals(CloudClientSetActivity.this.oldpwd.getText().toString())) {
            } else {
                final String string = CloudClientSetActivity.this.getSharedPreferences("privatekey", 0).getString("name", "");
                if (!TextUtils.isEmpty(string)) {
                    CloudClientSetActivity.this.runOnUiThread(new Runnable() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.11.1
                        @Override // java.lang.Runnable
                        public void run() {
                            CloudClientSetActivity.this.username_edit.setText(string);
                        }
                    });
                }
                if (string.equals("")) {
                    return;
                }
                CloudClientSetActivity.this.updatePassword = CloudClientSetActivity.this.newpwd.getText().toString();
                String ModifyPassword = CloudClientSetActivity.this.ModifyPassword(string, CloudClientSetActivity.this.oldpwd.getText().toString(), CloudClientSetActivity.this.newpwd.getText().toString());
                Message message3 = new Message();
                try {
                } catch (JSONException e) {
                    message3.what = 12;
                    e.printStackTrace();
                }
                if (ModifyPassword.equals("")) {
                    CloudClientSetActivity.this.saveErrorInfo = CloudClientSetActivity.this.getResources().getString(R.string.setting_errornetwork);
                    message3.what = 12;
                    CloudClientSetActivity.this.resultHandler.sendMessageDelayed(message3, 500L);
                    return;
                }
                JSONObject jSONObject = new JSONObject(ModifyPassword);
                if (!jSONObject.getBoolean("status")) {
                    CloudClientSetActivity.this.saveErrorInfo = jSONObject.getString("errorInfo");
                    message3.what = 12;
                } else {
                    File file = new File(AppEnvironment.URLFILEPATH);
                    if (file.exists()) {
                        file.delete();
                    }
                    message3.what = 11;
                }
                CloudClientSetActivity.this.resultHandler.sendMessageDelayed(message3, 500L);
            }
        }
    };
    Runnable runnable_GetConfig_Infor = new Runnable() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.12
        /* JADX WARN: Can't wrap try/catch for region: R(13:27|(12:29|(1:31)|34|(2:36|(1:38))|39|65|40|41|42|(2:44|(1:46))|47|(2:49|69)(2:52|(2:54|70)(2:55|(2:57|71)(2:58|(2:60|72)(2:61|(2:63|73)(2:64|74))))))|33|34|(0)|39|65|40|41|42|(0)|47|(0)(0)) */
        /* JADX WARN: Code restructure failed: missing block: B:32:0x0170, code lost:
            if (r6.length() <= 0) goto L33;
         */
        /* JADX WARN: Code restructure failed: missing block: B:50:0x0246, code lost:
            r9 = move-exception;
         */
        /* JADX WARN: Code restructure failed: missing block: B:51:0x0248, code lost:
            r9.printStackTrace();
         */
        /* JADX WARN: Removed duplicated region for block: B:36:0x01aa  */
        /* JADX WARN: Removed duplicated region for block: B:44:0x0200  */
        /* JADX WARN: Removed duplicated region for block: B:49:0x021d  */
        /* JADX WARN: Removed duplicated region for block: B:52:0x0250  */
        @Override // java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public void run() {
            String str;
            String macAddress;
            String str2;
            int i;
            CloudClientSetActivity.this.JXHD_Ip = CloudClientSetActivity.this.JXHD_Ip.replaceAll(" ", "");
            if (CloudClientSetActivity.this.JXHD_Ip.length() > 7 && CloudClientSetActivity.this.JXHD_Ip.substring(0, 7).equals("http://")) {
                CloudClientSetActivity.this.JXHD_Ip = CloudClientSetActivity.this.JXHD_Ip.substring(7);
                Message obtainMessage = CloudClientSetActivity.this.mHandler.obtainMessage();
                obtainMessage.what = HttpStatus.SC_SWITCHING_PROTOCOLS;
                CloudClientSetActivity.this.mHandler.sendMessage(obtainMessage);
            }
            try {
                String editable = CloudClientSetActivity.this.username_edit.getText().toString();
                String editable2 = CloudClientSetActivity.this.password_edit.getText().toString();
                String str3 = editable2;
                String str4 = editable;
                if (editable != null) {
                    str3 = editable2;
                    str4 = editable;
                    if (editable2 != null) {
                        str4 = editable.replaceAll(" ", "");
                        str3 = editable2.replaceAll(" ", "");
                    }
                }
                CloudClientSetActivity.this.Name = str4;
                CloudClientSetActivity.this.Pwd = str3;
            } catch (Exception e) {
                e.printStackTrace();
            }
            Log.i(CloudClientSetActivity.TAG, "writeXml");
            Log.i(CloudClientSetActivity.TAG, "2152");
            String editable3 = CloudClientSetActivity.this.ip_edit.getText().toString();
            AppEnvironment.MOBILESTUDYSERVERIP = editable3;
            String replaceAll = editable3.replaceAll(" ", "");
            String str5 = replaceAll;
            if (replaceAll.length() > 7) {
                str5 = replaceAll;
                if (replaceAll.substring(0, 7).equals("http://")) {
                    str5 = replaceAll.substring(7);
                    CloudClientSetActivity.this.ptfw_edit.setText(str5);
                    CloudClientSetActivity.this.ip_edit.setText(str5);
                }
            }
            if (str5.endsWith("/")) {
                Message obtainMessage2 = CloudClientSetActivity.this.resultHandler.obtainMessage();
                obtainMessage2.what = PointerIconCompat.TYPE_HELP;
                CloudClientSetActivity.this.resultHandler.sendMessage(obtainMessage2);
                return;
            }
            if (str5 != null) {
                str = str5;
                if (str5 != null) {
                    str = str5;
                }
                String str6 = "http://" + str + "/api/config";
                macAddress = ((WifiManager) CloudClientSetActivity.this.getSystemService("wifi")).getConnectionInfo().getMacAddress();
                String str7 = macAddress;
                if (macAddress != null) {
                    str7 = macAddress;
                    if (macAddress.equals("02:00:00:00:00:00")) {
                        str7 = CloudClientSetActivity.this.getMacAddr();
                    }
                }
                String str8 = String.valueOf(str6) + "/mac/" + str7;
                str2 = null;
                str2 = CloudClientSetActivity.this.Get_Config_Json(str8, CloudClientSetActivity.this.Name);
                CloudClientSetActivity.this.saveErrorInfo = "";
                i = -1;
                if (str2 != null) {
                    i = -1;
                    if (!str2.equals("")) {
                        i = CloudClientSetActivity.this.jsonToConfig(str2);
                    }
                }
                if (i != 1) {
                    Message obtainMessage3 = CloudClientSetActivity.this.resultHandler.obtainMessage();
                    obtainMessage3.what = 20;
                    obtainMessage3.obj = str2;
                    CloudClientSetActivity.this.resultHandler.sendMessage(obtainMessage3);
                    return;
                } else if (i == 0) {
                    Message obtainMessage4 = CloudClientSetActivity.this.resultHandler.obtainMessage();
                    obtainMessage4.what = 31;
                    obtainMessage4.obj = str2;
                    CloudClientSetActivity.this.resultHandler.sendMessage(obtainMessage4);
                    return;
                } else if (i == 2) {
                    Message obtainMessage5 = CloudClientSetActivity.this.resultHandler.obtainMessage();
                    obtainMessage5.what = 32;
                    obtainMessage5.obj = str2;
                    CloudClientSetActivity.this.resultHandler.sendMessage(obtainMessage5);
                    return;
                } else if (i == -2) {
                    Message obtainMessage6 = CloudClientSetActivity.this.resultHandler.obtainMessage();
                    obtainMessage6.what = PointerIconCompat.TYPE_HAND;
                    obtainMessage6.obj = str2;
                    CloudClientSetActivity.this.resultHandler.sendMessage(obtainMessage6);
                    return;
                } else if (i == -100) {
                    Message obtainMessage7 = CloudClientSetActivity.this.resultHandler.obtainMessage();
                    obtainMessage7.what = 1005;
                    obtainMessage7.obj = str2;
                    CloudClientSetActivity.this.resultHandler.sendMessage(obtainMessage7);
                    return;
                } else {
                    Message obtainMessage8 = CloudClientSetActivity.this.resultHandler.obtainMessage();
                    obtainMessage8.what = 21;
                    obtainMessage8.obj = str2;
                    CloudClientSetActivity.this.resultHandler.sendMessage(obtainMessage8);
                    return;
                }
            }
            str = "192.168.0.88";
            String str62 = "http://" + str + "/api/config";
            macAddress = ((WifiManager) CloudClientSetActivity.this.getSystemService("wifi")).getConnectionInfo().getMacAddress();
            String str72 = macAddress;
            if (macAddress != null) {
            }
            String str82 = String.valueOf(str62) + "/mac/" + str72;
            str2 = null;
            str2 = CloudClientSetActivity.this.Get_Config_Json(str82, CloudClientSetActivity.this.Name);
            CloudClientSetActivity.this.saveErrorInfo = "";
            i = -1;
            if (str2 != null) {
            }
            if (i != 1) {
            }
        }
    };

    /* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd.class */
    class HostPwd extends Thread {
        HostPwd() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            try {
                CloudClientSetActivity.this.superPwd1 = CloudClientSetActivity.this.getManagerPwd();
                CloudClientSetActivity.this.superPwd2 = CloudClientSetActivity.this.getUserPwd();
            } catch (Exception e) {
            }
        }
    }

    /* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver.class */
    class InstallReceiver extends BroadcastReceiver {
        InstallReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (!intent.getAction().equals("android.intent.action.PACKAGE_ADDED") || !AppEnvironment.isNewUpdate || CloudClientSetActivity.this.apkUpdateList == null || CloudClientSetActivity.this.apkUpdateList.size() <= 0) {
                return;
            }
            boolean z = true;
            ArrayList arrayList = new ArrayList();
            String replace = intent.getDataString().replace("package:", "");
            for (int i = 0; i < CloudClientSetActivity.this.apkUpdateList.size(); i++) {
                ApkUpdateBean apkUpdateBean = (ApkUpdateBean) CloudClientSetActivity.this.apkUpdateList.get(i);
                if (replace.equals(apkUpdateBean.getPackagename())) {
                    CloudClientSetActivity.this.sendInstallMessage(i, 1, CloudClientSetActivity.UPDATE_INSTALLSTATE);
                } else if (apkUpdateBean.getInstallState() != 1) {
                    z = false;
                    arrayList.add(apkUpdateBean);
                }
            }
            if (z && !"com.launcher.activity".equals(replace)) {
                CloudClientSetActivity.this.closeProgressDialog();
                CloudClientSetActivity.this.resetUpdateInfo();
            } else if (arrayList.size() == 1 && "com.launcher.activity".equals(((ApkUpdateBean) arrayList.get(0)).getPackagename()) && !TextUtils.isEmpty(CloudClientSetActivity.this.launcherPath)) {
                CloudClientSetActivity.this.sendInstallMessage(-1, ((ApkUpdateBean) arrayList.get(0)).getApkLocalPath(), CloudClientSetActivity.UPDATE_INSTALLSINGLE);
            }
        }
    }

    /* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/CloudClientSetActivity$MyHostnameVerifier.class */
    private class MyHostnameVerifier implements HostnameVerifier {
        private MyHostnameVerifier() {
        }

        /* synthetic */ MyHostnameVerifier(CloudClientSetActivity cloudClientSetActivity, MyHostnameVerifier myHostnameVerifier) {
            this();
        }

        @Override // javax.net.ssl.HostnameVerifier
        public boolean verify(String str, SSLSession sSLSession) {
            return true;
        }
    }

    /* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/CloudClientSetActivity$MyTrustManager.class */
    private class MyTrustManager implements X509TrustManager {
        private MyTrustManager() {
        }

        @Override // javax.net.ssl.X509TrustManager
        public void checkClientTrusted(X509Certificate[] x509CertificateArr, String str) throws CertificateException {
        }

        @Override // javax.net.ssl.X509TrustManager
        public void checkServerTrusted(X509Certificate[] x509CertificateArr, String str) throws CertificateException {
        }

        @Override // javax.net.ssl.X509TrustManager
        public X509Certificate[] getAcceptedIssuers() {
            return null;
        }
    }

    /* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/CloudClientSetActivity$ResetThread.class */
    class ResetThread extends Thread {
        ResetThread() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            CloudClientSetActivity.this.reseting = true;
            CloudClientSetActivity.this.deleteAPks();
            CloudClientSetActivity.this.deleteOtherFiles();
            CloudClientSetActivity.this.reseting = false;
            Message obtainMessage = CloudClientSetActivity.this.resultHandler.obtainMessage();
            obtainMessage.what = 112;
            obtainMessage.sendToTarget();
        }
    }

    /* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateProgressThread.class */
    class UpdateProgressThread extends Thread {
        UpdateProgressThread() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            while (CloudClientSetActivity.this.updateTime < 300 && CloudClientSetActivity.isupdating) {
                Message message = new Message();
                message.what = PointerIconCompat.TYPE_CONTEXT_MENU;
                CloudClientSetActivity.this.installHandler.sendMessage(message);
                try {
                    Thread.sleep(1000L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread.class */
    class UpdateThread extends Thread {
        UpdateThread() {
        }

        /* JADX WARN: Code restructure failed: missing block: B:10:0x008a, code lost:
            if (r0.equals("") != false) goto L11;
         */
        /* JADX WARN: Code restructure failed: missing block: B:26:0x01ab, code lost:
            if (r0 == 0) goto L27;
         */
        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v146, types: [java.util.List] */
        /* JADX WARN: Type inference failed for: r0v170, types: [java.util.List] */
        @Override // java.lang.Thread, java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public void run() {
            String str;
            ArrayList arrayList;
            ArrayList parseDownload_new;
            long j;
            boolean z;
            if (CloudClientSetActivity.this.addApksList != null) {
                CloudClientSetActivity.this.addApksList.clear();
            } else {
                CloudClientSetActivity.this.addApksList = new ArrayList();
            }
            CloudClientSetActivity.this.launcherPath = "";
            CloudClientSetActivity.isupdating = true;
            CloudClientSetActivity.this.currentCacheLength = 0L;
            CloudClientSetActivity.this.currentCachePosition = 0L;
            SharedPreferences sharedPreferences = CloudClientSetActivity.this.getSharedPreferences("privatekey", 0);
            String string = sharedPreferences.getString("key", "");
            String string2 = sharedPreferences.getString("apihost", "");
            String string3 = sharedPreferences.getString("name", "");
            HashMap<String, String> loadXml = XmlLoadHelper.loadXml();
            String str2 = string2;
            String str3 = string;
            String str4 = string3;
            if (loadXml != null) {
                if (!string2.equals("")) {
                    str2 = string2;
                    str3 = string;
                    str4 = string3;
                }
                str2 = loadXml.get("ip");
                str4 = loadXml.get("usercode");
                str3 = loadXml.get("privatekey");
            }
            HttpPost httpPost = new HttpPost("http://" + str2 + "/api/app/projectcode/ebag/os/android/");
            httpPost.addHeader("X-Edutech-Entity", str4);
            Log.e("updateresult", String.valueOf(str) + "," + str4 + "," + str3);
            long currentTimeMillis = System.currentTimeMillis();
            httpPost.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + My_md5.Md5(String.valueOf(currentTimeMillis) + str4 + str3));
            DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
            ArrayList arrayList2 = new ArrayList();
            ArrayList arrayList3 = new ArrayList();
            try {
                JSONObject jSONObject = new JSONObject(CloudClientSetActivity.this.getJsonStringFromGZIP(defaultHttpClient.execute(httpPost)));
                boolean z2 = jSONObject.getBoolean("status");
                int i = jSONObject.getInt("errorNum");
                if (!z2) {
                    arrayList = arrayList2;
                }
                JSONArray jSONArray = jSONObject.getJSONArray("data");
                if (jSONArray == null || jSONArray.length() <= 0) {
                    Utils.clearUpdateAPks(CloudClientSetActivity.this, str2);
                    arrayList = arrayList2;
                } else {
                    ArrayList<HashMap<String, String>> systemInfo = SystemInfoHelper.getSystemInfo(new ArrayList(), CloudClientSetActivity.this);
                    CloudClientSetActivity.this.apkUpdateList = new ArrayList();
                    for (int i2 = 0; i2 < jSONArray.length() && CloudClientSetActivity.isupdating; i2++) {
                        JSONObject jSONObject2 = jSONArray.getJSONObject(i2);
                        long j2 = jSONObject2.getLong("appsize");
                        String string4 = jSONObject2.getString("versionname");
                        String string5 = jSONObject2.getString("packagename");
                        String string6 = jSONObject2.getString("versioncode");
                        try {
                            j = Long.parseLong(string6);
                        } catch (NumberFormatException e) {
                            j = 1;
                        } catch (Exception e2) {
                            j = 1;
                        }
                        Iterator<HashMap<String, String>> it = systemInfo.iterator();
                        while (true) {
                            z = false;
                            if (!it.hasNext()) {
                                break;
                            }
                            HashMap<String, String> next = it.next();
                            if (next.get("packagename") != null && string5.equals(next.get("packagename"))) {
                                long j3 = 1;
                                try {
                                    j3 = Long.parseLong(next.get("versioncode"));
                                } catch (NumberFormatException e3) {
                                } catch (Exception e4) {
                                }
                                z = next.get("versioncode") == null || next.get("versionname") == null || j <= j3;
                            }
                        }
                        if (!z) {
                            CloudClientSetActivity.this.currentCacheLength += j2;
                            ApkUpdateBean apkUpdateBean = new ApkUpdateBean();
                            apkUpdateBean.setPackagename(string5);
                            apkUpdateBean.setApkDownloadSize(0L);
                            apkUpdateBean.setApkSize(j2);
                            apkUpdateBean.setInstallState(-1);
                            apkUpdateBean.setApkLocalPath("");
                            apkUpdateBean.setApkUrl(jSONObject2.getString("appwebpath"));
                            apkUpdateBean.setAppName(jSONObject2.getString("apkname"));
                            apkUpdateBean.setVersioncode(string6);
                            apkUpdateBean.setVersionname(string4);
                            CloudClientSetActivity.this.apkUpdateList.add(apkUpdateBean);
                            arrayList3.add(apkUpdateBean);
                        }
                    }
                    if (!AppEnvironment.isNewUpdate) {
                        parseDownload_new = CloudClientSetActivity.this.parseDownload_Old(jSONArray, systemInfo, arrayList2);
                    } else {
                        Message message = new Message();
                        message.what = CloudClientSetActivity.START_PROGRESS;
                        CloudClientSetActivity.this.installHandler.sendMessage(message);
                        Utils.saveUpdateApks(CloudClientSetActivity.this.apkUpdateList, CloudClientSetActivity.this, str2);
                        parseDownload_new = CloudClientSetActivity.this.parseDownload_new(arrayList2, arrayList3);
                    }
                    arrayList = parseDownload_new;
                    if (CloudClientSetActivity.this.launcherPath != null) {
                        arrayList = parseDownload_new;
                        if (!CloudClientSetActivity.this.launcherPath.equals("")) {
                            ArrayList arrayList4 = parseDownload_new;
                            parseDownload_new.add(CloudClientSetActivity.this.launcherPath);
                            ArrayList arrayList5 = parseDownload_new;
                            CloudClientSetActivity.this.addApksList.add("com.launcher.activity");
                            arrayList = parseDownload_new;
                        }
                    }
                }
            } catch (Exception e5) {
                e5.printStackTrace();
                arrayList = arrayList2;
            }
            if (CloudClientSetActivity.this.addApksList != null && CloudClientSetActivity.this.addApksList.size() > 0) {
                Intent intent = new Intent();
                intent.setAction(sysProtectService.ADDINSTALL);
                intent.putStringArrayListExtra("packages", CloudClientSetActivity.this.addApksList);
                CloudClientSetActivity.this.sendBroadcast(intent);
            }
            CloudClientSetActivity.isupdating = false;
            CloudClientSetActivity.this.sendInstallMessage(2, 2, 2);
            if (AppEnvironment.isNewUpdate) {
                if (arrayList3 != null && arrayList3.size() > 0) {
                    return;
                }
                CloudClientSetActivity.this.sendInstallMessage(3, 3, 3);
            } else if (arrayList == null || arrayList.size() <= 0) {
                CloudClientSetActivity.this.sendInstallMessage(3, 3, 3);
            } else {
                CloudClientSetActivity.this.apkList = arrayList;
                CloudClientSetActivity.this.sendInstallMessage(1, 1, 1);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String Get_Config_Json(String str, String str2) {
        String str3;
        if (str.equals("") || str == null || str2.equals("") || str2 == null) {
            Log.e(TAG, "Get_Config_Json 入参有问题。。。");
            str3 = null;
        } else {
            Log.e(TAG, "Get_Config_Json 入参有问题。。。" + str);
            try {
                HttpResponse Get_http_addheader = Get_http_addheader(str, str2, true);
                if (Get_http_addheader.getStatusLine().getStatusCode() == 200) {
                    StringBuilder sb = new StringBuilder();
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(Get_http_addheader.getEntity().getContent(), "UTF-8"));
                    for (String readLine = bufferedReader.readLine(); readLine != null; readLine = bufferedReader.readLine()) {
                        sb.append(readLine);
                    }
                    str3 = sb.toString();
                    Log.e(TAG, "学校和用户个人信息获取完成。。。" + str3);
                } else {
                    Log.e(TAG, "学校和用户个人信息获取完成。。。" + Get_http_addheader.getStatusLine().getStatusCode());
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

    private HttpResponse Get_http_addheader(String str, String str2, boolean z) throws IOException, ClientProtocolException {
        HttpGet httpGet = new HttpGet(str);
        httpGet.addHeader("X-Edutech-Entity", str2);
        long currentTimeMillis = System.currentTimeMillis();
        if (z) {
            this.timeStamp = new StringBuilder(String.valueOf(currentTimeMillis)).toString();
        }
        httpGet.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + My_md5.Md5(String.valueOf(currentTimeMillis) + str2));
        HttpResponse httpResponse = null;
        try {
            httpResponse = new DefaultHttpClient().execute(httpGet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return httpResponse;
    }

    public static boolean SlientInstall(String str) throws IOException {
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
        return sb.toString().equals("Success");
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

    private void appendUserInfo(String str, String str2) {
        try {
            RandomAccessFile randomAccessFile = new RandomAccessFile(str, "rw");
            randomAccessFile.seek(randomAccessFile.length());
            randomAccessFile.writeBytes(String.valueOf(str2) + "\r\n");
            randomAccessFile.close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e2) {
        }
    }

    private boolean checkConfig(String str, String str2) {
        boolean z;
        String string;
        try {
            JSONObject jSONObject = new JSONObject(str);
            if (jSONObject.has("checksum")) {
                JSONObject jSONObject2 = jSONObject.getJSONObject("data");
                jSONObject2.toString();
                String string2 = jSONObject.getString("checksum");
                String Md5 = My_md5.Md5(AESUtils.encrypt(jSONObject2.getString("privatekey"), String.valueOf(string) + jSONObject2.getString("apihost") + str2));
                z = false;
                if (Md5 != null) {
                    z = false;
                    if (string2 != null) {
                        z = false;
                        if (Md5.equals(string2)) {
                            z = true;
                        }
                    }
                }
            } else {
                z = true;
            }
        } catch (JSONException e) {
            e.printStackTrace();
            z = false;
        } catch (Exception e2) {
            e2.printStackTrace();
            z = false;
        }
        return z;
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:30:0x0004 */
    /* JADX DEBUG: Multi-variable search result rejected for r5v7, resolved type: java.lang.StringBuilder */
    /* JADX WARN: Multi-variable type inference failed */
    private static boolean clientInstall(String str) {
        Process process;
        Throwable th;
        Exception e;
        boolean z;
        PrintWriter printWriter;
        Process process2 = null;
        Process process3 = null;
        try {
            try {
                process = Runtime.getRuntime().exec(ShellUtils.COMMAND_SU);
                process3 = process;
                printWriter = new PrintWriter(process.getOutputStream());
            } catch (Throwable th2) {
                th = th2;
                process = process2 == 1 ? 1 : 0;
            }
        } catch (Exception e2) {
            e = e2;
            process = process3;
        }
        try {
            printWriter.println("chmod 777 " + str);
            printWriter.println("export LD_LIBRARY_PATH=/vendor/lib:/system/lib");
            StringBuilder sb = new StringBuilder("pm install -r ");
            printWriter.println(sb.append(str).toString());
            printWriter.flush();
            printWriter.close();
            z = returnResult(process.waitFor());
            process2 = sb;
            if (process != null) {
                process.destroy();
                process2 = sb;
            }
        } catch (Exception e3) {
            e = e3;
            process2 = process;
            e.printStackTrace();
            if (process != null) {
                process.destroy();
            }
            z = false;
            return z;
        } catch (Throwable th3) {
            th = th3;
            if (process != null) {
                process.destroy();
            }
            throw th;
        }
        return z;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void closeProgressDialog() {
        try {
            this.tvUpdateNow.setEnabled(true);
            this.tvUpdateNow.setTextColor(getResources().getColor(R.color.blue));
            this.tvUpdateNow.setText(getResources().getString(R.string.setting_startupdating));
            if (!AppEnvironment.isNewUpdate) {
                if (this.webprogressdialog == null || this.isover) {
                    return;
                }
                this.webprogressdialog.dismiss();
                this.webprogressdialog = null;
                return;
            }
            if (this.progressDialog != null && !this.isover) {
                this.progressDialog.resetData();
                this.progressDialog.dismiss();
                this.progressDialog = null;
            }
            this.apkUpdateList.clear();
            isupdating = false;
        } catch (Exception e) {
        }
    }

    private void delete(String str) {
        File[] listFiles;
        File file = new File(str);
        if (file.isDirectory() && (listFiles = file.listFiles()) != null) {
            for (File file2 : listFiles) {
                if (!file2.isDirectory() || !file2.getName().equals("HTML")) {
                    deleteFiles(file2.getAbsolutePath());
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void deleteAPks() {
        File[] listFiles;
        File file = new File(AppEnvironment.ASSETS_DIR);
        if (!file.isDirectory() || (listFiles = file.listFiles()) == null) {
            return;
        }
        for (File file2 : listFiles) {
            Log.e("apk", String.valueOf(file2.getAbsolutePath()) + "," + file2.getAbsolutePath().endsWith(".apk"));
            if (file2.getAbsolutePath().endsWith(".apk")) {
                file2.delete();
            }
        }
    }

    public static void deleteFiles(String str) {
        File file = new File(str);
        if (file.isDirectory()) {
            for (File file2 : file.listFiles()) {
                deleteFiles(file2.getAbsolutePath());
            }
        } else if (file.exists()) {
            file.delete();
        }
        if (file.exists()) {
            file.delete();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void deleteOtherFiles() {
        delete(String.valueOf(AppEnvironment.ASSETS_DIR) + "HomeWork/");
        delete(String.valueOf(AppEnvironment.ASSETS_DIR) + "ZuoYeFuDao/");
        delete(String.valueOf(AppEnvironment.ASSETS_DIR) + "DaoXueBen/");
        delete(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/EBag/.System/offline/");
    }

    private void downLoadImage(ArrayList<String> arrayList) {
        for (int i = 0; i < arrayList.size(); i++) {
            try {
                HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(arrayList.get(i)).openConnection();
                if (httpURLConnection.getResponseCode() == 200) {
                    savePic(httpURLConnection.getInputStream(), arrayList.get(i));
                }
            } catch (Exception e) {
                e.printStackTrace();
                Log.i("liu", "downLoadImage:" + e);
            }
        }
    }

    private void exit() {
        startActivity(new Intent(this, CloudClientActivity.class));
        finish();
    }

    private void getCurrApkInfo() {
        try {
            PackageInfo packageInfo = getPackageManager().getPackageInfo(getPackageName(), 0);
            Log.e("packageName", getPackageName());
            this.versionName = packageInfo.versionName;
            this.versionCode = packageInfo.versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        this.tvCurrVersion.setText(String.valueOf(getResources().getString(R.string.setting_version)) + this.versionName);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean getInternetState() {
        ConnectivityManager connectivityManager = (ConnectivityManager) getSystemService("connectivity");
        boolean z = false;
        if (connectivityManager != null) {
            NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
            z = false;
            if (activeNetworkInfo != null) {
                z = false;
                if (activeNetworkInfo.isConnected()) {
                    z = false;
                    if (activeNetworkInfo.getState() == NetworkInfo.State.CONNECTED) {
                        z = true;
                    }
                }
            }
        }
        return z;
    }

    /* JADX INFO: Access modifiers changed from: private */
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
                    Log.d(TAG, " not use GZIPInputStream");
                    inputStream = bufferedInputStream;
                } else {
                    Log.d(TAG, " use GZIPInputStream  ");
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
                Log.e(TAG, "与服务端连接失败。。。");
                Log.e(TAG, "ddddd=" + httpResponse.getStatusLine().getStatusCode());
                str = "";
            }
        } catch (Exception e) {
            Log.e(TAG, e.toString(), e);
            str = "";
        }
        return str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:9:0x006c, code lost:
        if (r0.equals("") != false) goto L10;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public String getManagerPwd() {
        String str;
        SharedPreferences sharedPreferences = getSharedPreferences("privatekey", 0);
        String string = sharedPreferences.getString("key", "");
        String string2 = sharedPreferences.getString("apihost", "");
        String string3 = sharedPreferences.getString("name", "");
        HashMap<String, String> loadXml = XmlLoadHelper.loadXml();
        String str2 = string2;
        String str3 = string;
        String str4 = string3;
        if (loadXml != null) {
            if (string2 != null && !string2.equals("")) {
                str2 = string2;
                str3 = string;
                str4 = string3;
            }
            str2 = loadXml.get("ip");
            str4 = loadXml.get("usercode");
            str3 = loadXml.get("privatekey");
        }
        Log.e("pwd", "start get pwd");
        HttpPost httpPost = new HttpPost("http://" + str2 + "/api/padpwd");
        httpPost.addHeader("X-Edutech-Entity", str4);
        long currentTimeMillis = System.currentTimeMillis();
        httpPost.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + My_md5.Md5(String.valueOf(currentTimeMillis) + str4 + str3));
        try {
            byte[] decrypt = new AESSet().decrypt(new JSONObject(getJsonStringFromGZIP(new DefaultHttpClient().execute(httpPost))).getString("data"));
            str = new String(decrypt, 0, decrypt.length);
        } catch (Exception e) {
            e.printStackTrace();
            str = "ayjedutechyx@123456z";
        }
        return str;
    }

    private int getShort(byte[] bArr) {
        return (bArr[0] << 8) | (bArr[1] & 255);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getUserPwd() {
        String str;
        String str2 = this.pwdOrigal;
        try {
            JSONObject jSONObject = new JSONObject(Get_Config_Json("http://" + this.ipOrigal + "/api/config", this.nameOrigal));
            JSONObject jSONObject2 = null;
            JSONObject jSONObject3 = null;
            if (jSONObject != null) {
                jSONObject2 = jSONObject.getJSONObject("data");
            }
            if (jSONObject2 != null) {
                jSONObject3 = jSONObject2.getJSONObject(UserID.ELEMENT_NAME);
            }
            str = str2;
            if (jSONObject3 != null) {
                try {
                    str = BZip2Utils.Base64DecodeToString(jSONObject3.getString("pubkey"));
                } catch (Exception e) {
                    e.printStackTrace();
                    str = str2;
                }
            }
        } catch (JSONException e2) {
            e2.printStackTrace();
            str = str2;
        }
        return str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void installNewApk() {
        boolean z;
        if (this.apkList == null || this.apkList.size() <= 0) {
            return;
        }
        this.mMiaMdmPolicyManager = new MiaMdmPolicyManager(this);
        try {
            z = this.mHwPDM.isRecentTaskButtonDisabled(this.cn);
        } catch (Exception e) {
            e.printStackTrace();
            z = false;
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
                } else {
                    try {
                        if (this.mContext != null) {
                            if (Build.DISPLAY.indexOf("M1016Pro") >= 0 || Build.DISPLAY.indexOf("P990S.V") >= 0 || Build.DISPLAY.indexOf("S1016PRO") >= 0 || Build.DISPLAY.indexOf("D13B") >= 0 || Build.DISPLAY.indexOf("QC80A") >= 0 || Build.DISPLAY.indexOf("N5110ZB") >= 0 || Build.DISPLAY.indexOf(".T360Z") >= 0 || Build.DISPLAY.indexOf("P350") >= 0 || Build.DISPLAY.indexOf("P550") >= 0 || Build.DISPLAY.indexOf("M856.V") >= 0 || Build.DISPLAY.indexOf("S1016.V1") >= 0 || Build.DISPLAY.indexOf("S106.V1") >= 0 || Build.DISPLAY.indexOf("S1016E") >= 0 || Build.DISPLAY.indexOf("P583") >= 0) {
                                apkinstall_samsung(this.apkList.get(i));
                            } else {
                                Intent intent = new Intent();
                                intent.setAction(sysProtectService.INSTALL);
                                sendBroadcast(intent);
                                apkinstall(this.apkList.get(i));
                            }
                        }
                    } catch (Exception e3) {
                    }
                }
            }
        }
        finish();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void installSingleApk(String str) {
        boolean z;
        if (TextUtils.isEmpty(str) || str.lastIndexOf(".apk") == -1) {
            return;
        }
        this.mMiaMdmPolicyManager = new MiaMdmPolicyManager(this);
        try {
            z = this.mHwPDM.isRecentTaskButtonDisabled(this.cn);
        } catch (Exception e) {
            e.printStackTrace();
            z = false;
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
                if (this.mContext != null) {
                    if (Build.DISPLAY.indexOf("M1016Pro") >= 0 || Build.DISPLAY.indexOf("P990S.V") >= 0 || Build.DISPLAY.indexOf("S1016PRO") >= 0 || Build.DISPLAY.indexOf("D13B") >= 0 || Build.DISPLAY.indexOf("QC80A") >= 0 || Build.DISPLAY.indexOf("N5110ZB") >= 0 || Build.DISPLAY.indexOf(".T360Z") >= 0 || Build.DISPLAY.indexOf("P350") >= 0 || Build.DISPLAY.indexOf("P550") >= 0 || Build.DISPLAY.indexOf("M856.V") >= 0 || Build.DISPLAY.indexOf("S1016.V1") >= 0 || Build.DISPLAY.indexOf("S106.V1") >= 0 || Build.DISPLAY.indexOf("S1016E") >= 0 || Build.DISPLAY.indexOf("P583") >= 0) {
                        apkinstall_samsung(str);
                    } else {
                        Intent intent = new Intent();
                        intent.setAction(sysProtectService.INSTALL);
                        sendBroadcast(intent);
                        apkinstall(str);
                    }
                }
            } catch (Exception e3) {
            }
        }
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:299:0x03ce */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:307:0x028a */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:313:0x0314 */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:336:0x0337 */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:351:0x0349 */
    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r26v9, types: [java.lang.Exception] */
    /* JADX WARN: Type inference failed for: r30v7, types: [java.lang.Exception] */
    /* JADX WARN: Type inference failed for: r37v3 */
    /* JADX WARN: Type inference failed for: r37v38 */
    /* JADX WARN: Type inference failed for: r37v39 */
    /* JADX WARN: Type inference failed for: r37v4 */
    /* JADX WARN: Type inference failed for: r37v40 */
    /* JADX WARN: Type inference failed for: r37v42 */
    /* JADX WARN: Type inference failed for: r37v43 */
    /* JADX WARN: Type inference failed for: r37v44, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r37v45 */
    /* JADX WARN: Type inference failed for: r37v46, types: [org.json.JSONArray] */
    /* JADX WARN: Type inference failed for: r37v47 */
    /* JADX WARN: Type inference failed for: r37v50 */
    /* JADX WARN: Type inference failed for: r37v51, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r37v62 */
    /* JADX WARN: Type inference failed for: r37v63 */
    /* JADX WARN: Type inference failed for: r37v64 */
    /* JADX WARN: Type inference failed for: r37v65 */
    /* JADX WARN: Type inference failed for: r37v66 */
    public int jsonToConfig(String str) {
        int i;
        JSONObject jSONObject;
        String str2;
        String str3;
        String str4;
        String str5;
        String str6;
        String str7;
        JSONObject jSONObject2;
        SharedPreferences.Editor editor;
        String str8;
        String str9;
        SharedPreferences.Editor editor2;
        String str10;
        if (str == null || str.equals("")) {
            i = -1;
        } else {
            String str11 = "0";
            String str12 = "0";
            if (!checkConfig(str, this.timeStamp)) {
                i = -100;
            } else {
                try {
                    JSONObject jSONObject3 = new JSONObject(str);
                    jSONObject3.getString("status");
                    this.saveErrorInfo = jSONObject3.getString("errorInfo");
                    String string = jSONObject3.getString("errorNum");
                    if (string.equals("-2")) {
                        i = -2;
                    } else if (string.equals("0")) {
                        JSONObject jSONObject4 = jSONObject3.getJSONObject("data");
                        String string2 = jSONObject4.getString("privatekey");
                        String string3 = jSONObject4.getString("encrypt");
                        String string4 = jSONObject4.getString("apihost");
                        try {
                            str11 = jSONObject4.getString("guidelearncomment");
                        } catch (Exception e) {
                        }
                        try {
                            str12 = jSONObject4.getString("guidenotes");
                        } catch (Exception e2) {
                        }
                        JSONObject jSONObject5 = jSONObject4.getJSONObject(UserID.ELEMENT_NAME);
                        String string5 = jSONObject5.getString("pubkey");
                        String string6 = jSONObject5.getString("type");
                        if (string6.equals("03") || string6.equals(LogHelp.TYPE_HWHELP)) {
                            String str13 = "-1";
                            try {
                                str13 = jSONObject5.getString("id");
                            } catch (Exception e3) {
                                e3.printStackTrace();
                            }
                            if (!My_md5.Md5(this.Pwd).equals(string5)) {
                                i = 0;
                            } else {
                                SharedPreferences sharedPreferences = getSharedPreferences("privatekey", 0);
                                SharedPreferences.Editor edit = sharedPreferences.edit();
                                edit.putString("key", string2);
                                edit.putString("name", jSONObject5.getString("usercode"));
                                edit.putString("apihost", string4);
                                JSONObject jSONObject6 = null;
                                try {
                                    JSONObject jSONObject7 = jSONObject4.getJSONObject("ebag");
                                    jSONObject = jSONObject7;
                                    if (jSONObject7 != null) {
                                        jSONObject = jSONObject7;
                                        if (!sharedPreferences.getString("updatetime", "").equals(jSONObject7.getString("updatetime"))) {
                                            Log.i("liu", "save time:" + sharedPreferences.getString("updatetime", ""));
                                            Log.i("liu", "request time:" + jSONObject7.getString("updatetime"));
                                            this.isUpdate = true;
                                            jSONObject6 = jSONObject7;
                                            edit.putString("updatetime", jSONObject7.getString("updatetime"));
                                            jSONObject = jSONObject7;
                                        }
                                    }
                                } catch (Exception e4) {
                                    e4.printStackTrace();
                                    jSONObject = jSONObject6;
                                }
                                edit.putString("userid", str13);
                                edit.commit();
                                String str14 = "";
                                String str15 = "";
                                String str16 = "";
                                try {
                                    JSONObject jSONObject8 = jSONObject4.getJSONObject("tigase");
                                    String str17 = "";
                                    String str18 = "";
                                    try {
                                        str14 = jSONObject8.getString(ClientCookie.DOMAIN_ATTR);
                                        str17 = str14;
                                    } catch (Exception e5) {
                                        str14 = str17;
                                        str15 = str18;
                                        e5.printStackTrace();
                                    }
                                    try {
                                        str14 = jSONObject8.getString(ClientCookie.PORT_ATTR);
                                        str18 = str14;
                                    } catch (Exception e6) {
                                        str14 = str17;
                                        str15 = str18;
                                        e6.printStackTrace();
                                    }
                                    try {
                                        str14 = jSONObject8.getString("ip");
                                        str16 = str14;
                                        str3 = str18;
                                        str2 = str17;
                                    } catch (Exception e7) {
                                        str14 = str17;
                                        str15 = str18;
                                        e7.printStackTrace();
                                        str2 = str17;
                                        str3 = str18;
                                    }
                                } catch (Exception e8) {
                                    e8.printStackTrace();
                                    str2 = str14;
                                    str3 = str15;
                                }
                                String str19 = "";
                                String str20 = "";
                                String str21 = "";
                                String str22 = str21;
                                try {
                                    JSONObject jSONObject9 = jSONObject4.getJSONObject("mongo");
                                    String str23 = "";
                                    String str24 = "";
                                    String str25 = "";
                                    str21 = "";
                                    str4 = str21;
                                    try {
                                        str20 = jSONObject9.getString(ClientCookie.DOMAIN_ATTR);
                                        String str26 = str20;
                                        str23 = str26;
                                        str21 = str26;
                                    } catch (Exception e9) {
                                        str19 = str23;
                                        str20 = str24;
                                        str22 = str25;
                                        Exception exc = e9;
                                        exc.printStackTrace();
                                        str21 = exc;
                                    }
                                    try {
                                        str20 = jSONObject9.getString(ClientCookie.PORT_ATTR);
                                        String str27 = str20;
                                        str24 = str27;
                                        str21 = str27;
                                    } catch (Exception e10) {
                                        str19 = str23;
                                        str20 = str24;
                                        str22 = str25;
                                        Exception exc2 = e10;
                                        exc2.printStackTrace();
                                        str21 = exc2;
                                    }
                                    try {
                                        str20 = jSONObject9.getString(UserID.ELEMENT_NAME);
                                        String str28 = str20;
                                        str25 = str28;
                                        str21 = str28;
                                    } catch (Exception e11) {
                                        str19 = str23;
                                        str20 = str24;
                                        str22 = str25;
                                        Exception exc3 = e11;
                                        exc3.printStackTrace();
                                        str21 = exc3;
                                    }
                                    try {
                                        str20 = jSONObject9.getString("pwd");
                                        str4 = str20;
                                        str7 = str25;
                                        str6 = str24;
                                        str5 = str23;
                                    } catch (Exception e12) {
                                        str19 = str23;
                                        str20 = str24;
                                        str22 = str25;
                                        e12.printStackTrace();
                                        str5 = str23;
                                        str6 = str24;
                                        str7 = str25;
                                    }
                                } catch (Exception unused) {
                                    str4 = "";
                                    str21.printStackTrace();
                                    str5 = str19;
                                    str6 = str20;
                                    str7 = str22;
                                }
                                String str29 = "";
                                SharedPreferences.Editor editor3 = "";
                                String str30 = "";
                                JSONObject jSONObject10 = str29;
                                SharedPreferences.Editor editor4 = editor3;
                                String str31 = "";
                                String str32 = "";
                                String str33 = str30;
                                try {
                                    JSONObject jSONObject11 = jSONObject4.getJSONObject(UserID.ELEMENT_NAME);
                                    try {
                                        String string7 = jSONObject11.getString("type");
                                        try {
                                            str29 = string7.equals("02") ? "0" : string7.equals("03") ? LogHelp.TYPE_MYWORK : string7.equals("05") ? LogHelp.TYPE_GUIDANCE : "7";
                                        } catch (Exception e13) {
                                            e13.printStackTrace();
                                            str29 = LogHelp.TYPE_MYWORK;
                                        }
                                    } catch (Exception e14) {
                                        e14.printStackTrace();
                                        str29 = "7";
                                        jSONObject10 = str29;
                                        editor4 = editor3;
                                        str31 = "";
                                        str32 = "";
                                        str33 = str30;
                                        Toast.makeText(getApplicationContext(), getResources().getString(R.string.setting_noneusererror), 0).show();
                                    }
                                    try {
                                        editor4 = jSONObject11.getJSONArray("school");
                                        editor2 = editor3;
                                        try {
                                            jSONObject10 = editor4.getJSONObject(0);
                                            try {
                                                editor4 = jSONObject10.getString("id");
                                                editor2 = getSharedPreferences("privatekey", 0).edit();
                                                editor2.putString("schoolid", editor4);
                                                editor3 = editor4;
                                                editor2.commit();
                                                editor4 = editor4;
                                            } catch (Exception e15) {
                                                editor2 = editor3;
                                                e15.printStackTrace();
                                                editor4 = editor3;
                                            }
                                            try {
                                                str9 = jSONObject10.getString("name");
                                                editor2 = editor4;
                                                editor4 = editor4;
                                            } catch (Exception e16) {
                                                editor2 = editor4;
                                                e16.printStackTrace();
                                                editor2 = editor4;
                                                str9 = "";
                                                editor4 = editor4;
                                            }
                                        } catch (Exception e17) {
                                            e17.printStackTrace();
                                            str9 = "";
                                            editor4 = editor4;
                                        }
                                    } catch (Exception e18) {
                                        jSONObject10 = str29;
                                        editor4 = editor3;
                                        str31 = "";
                                        str32 = "";
                                        str33 = str30;
                                        e18.printStackTrace();
                                        editor2 = editor3;
                                        str9 = "";
                                    }
                                    try {
                                        str10 = jSONObject11.getString("usercode");
                                        editor4 = editor4;
                                    } catch (Exception e19) {
                                        jSONObject10 = str29;
                                        editor4 = editor2;
                                        str31 = str9;
                                        str32 = "";
                                        str33 = str30;
                                        e19.printStackTrace();
                                        str10 = "";
                                    }
                                    try {
                                        editor4 = jSONObject11.getString("name");
                                        str30 = editor4;
                                        this.stu_name = editor4;
                                        str30 = editor4;
                                        str32 = str10;
                                        str31 = str9;
                                        editor = editor2;
                                        jSONObject2 = str29;
                                    } catch (Exception e20) {
                                        jSONObject10 = str29;
                                        editor4 = editor2;
                                        str31 = str9;
                                        str32 = str10;
                                        str33 = str30;
                                        e20.printStackTrace();
                                        jSONObject2 = str29;
                                        editor = editor2;
                                        str31 = str9;
                                        str32 = str10;
                                    }
                                } catch (Exception e21) {
                                    e21.printStackTrace();
                                    jSONObject2 = jSONObject10;
                                    editor = editor4;
                                    str30 = str33;
                                }
                                String str34 = "";
                                String str35 = str34;
                                try {
                                    JSONObject jSONObject12 = jSONObject4.getJSONObject("cloud");
                                    String str36 = "";
                                    str34 = "";
                                    str8 = str34;
                                    try {
                                        str34 = jSONObject12.getString("scheme");
                                    } catch (Exception e22) {
                                        str35 = str36;
                                        e22.printStackTrace();
                                    }
                                    try {
                                        str35 = jSONObject12.getString(ClientCookie.DOMAIN_ATTR);
                                        String str37 = str35;
                                        str36 = str37;
                                        str34 = str37;
                                    } catch (Exception e23) {
                                        str35 = str36;
                                        Exception exc4 = e23;
                                        exc4.printStackTrace();
                                        str34 = exc4;
                                    }
                                    try {
                                        str35 = jSONObject12.getString(ClientCookie.PORT_ATTR);
                                        str8 = str35;
                                        str35 = str36;
                                    } catch (Exception e24) {
                                        str35 = str36;
                                        e24.printStackTrace();
                                        str35 = str36;
                                    }
                                } catch (Exception unused2) {
                                    str8 = "";
                                    str34.printStackTrace();
                                }
                                ArrayList<AppBean> arrayList = new ArrayList<>();
                                String str38 = null;
                                String str39 = null;
                                String str40 = null;
                                String str41 = null;
                                String str42 = null;
                                try {
                                    JSONObject jSONObject13 = jSONObject.getJSONObject("desktopicon");
                                    String string8 = jSONObject13.getString("wifi");
                                    String string9 = jSONObject13.getString("setting");
                                    JSONObject jSONObject14 = jSONObject13.getJSONObject("background");
                                    String string10 = jSONObject14.getString("large");
                                    String string11 = jSONObject14.getString(SQLExec.DelimiterType.NORMAL);
                                    String string12 = jSONObject14.getString("small");
                                    JSONArray jSONArray = jSONObject.getJSONArray("app");
                                    int i2 = 0;
                                    while (true) {
                                        str38 = string8;
                                        str39 = string9;
                                        str40 = string10;
                                        str41 = string11;
                                        str42 = string12;
                                        if (i2 >= jSONArray.length()) {
                                            break;
                                        }
                                        HashMap hashMap = new HashMap();
                                        String string13 = jSONArray.getJSONObject(i2).getString("code");
                                        String string14 = jSONArray.getJSONObject(i2).getString("name");
                                        String string15 = jSONArray.getJSONObject(i2).getString("color");
                                        String string16 = jSONArray.getJSONObject(i2).getString("icon");
                                        String str43 = String.valueOf(AppEnvironment.icon) + string16.substring(string16.lastIndexOf("/") + 1);
                                        str38 = string8;
                                        str39 = string9;
                                        str40 = string10;
                                        str41 = string11;
                                        str42 = string12;
                                        int i3 = jSONArray.getJSONObject(i2).getInt("enable");
                                        try {
                                            str42 = new StringBuilder(String.valueOf(jSONArray.getJSONObject(i2).getJSONObject("config").getInt(ClientCookie.COMMENT_ATTR))).toString();
                                            str41 = new StringBuilder(String.valueOf(jSONArray.getJSONObject(i2).getJSONObject("config").getInt("download"))).toString();
                                            hashMap.put(ClientCookie.COMMENT_ATTR, str42);
                                            hashMap.put("download", str41);
                                        } catch (Exception e25) {
                                            hashMap.put(ClientCookie.COMMENT_ATTR, "-1");
                                            hashMap.put("download", "-1");
                                            e25.printStackTrace();
                                        }
                                        arrayList.add(new AppBean(string13, string14, string15, string16, i3, hashMap, str43));
                                        i2++;
                                    }
                                    str42 = string12;
                                    str41 = string11;
                                    str40 = string10;
                                    str39 = string9;
                                    str38 = string8;
                                } catch (Exception e26) {
                                    e26.printStackTrace();
                                    Log.i("liu", "Exception :" + e26);
                                }
                                if (str8 == null || str8.equals("") || !str8.equals("80")) {
                                    str35 = String.valueOf(str35) + ":" + str8;
                                }
                                writeXml_config(string2, string3, string4, str2, str3, str16, str5, str6, str7, str4, jSONObject2, editor, str31, str35, str32, str13, str11, str30, null, str38, str39, arrayList, str12);
                                ArrayList arrayList2 = new ArrayList();
                                arrayList2.add(str38);
                                arrayList2.add(str39);
                                arrayList2.add(str40);
                                arrayList2.add(str41);
                                arrayList2.add(str42);
                                for (int i4 = 0; i4 < arrayList.size(); i4++) {
                                    arrayList2.add(arrayList.get(i4).getIcon());
                                }
                                i = 1;
                            }
                        } else {
                            i = 2;
                        }
                    } else {
                        i = -1;
                    }
                } catch (JSONException e27) {
                    e27.printStackTrace();
                    i = -1;
                }
            }
        }
        return i;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00ba  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public JSONArray nameHistoryAdd(String str, String str2, String str3, JSONArray jSONArray) {
        JSONArray jSONArray2;
        JSONObject jSONObject;
        JSONException e;
        JSONException e2;
        JSONObject jSONObject2;
        boolean z;
        JSONArray jSONArray3 = new JSONArray();
        if (str3 == null || str2 == null) {
            jSONArray2 = jSONArray;
        } else {
            JSONObject jSONObject3 = null;
            boolean z2 = false;
            if (jSONArray != null) {
                jSONObject3 = null;
                z2 = false;
                if (jSONArray.length() >= 0) {
                    int i = 0;
                    z2 = false;
                    jSONObject3 = null;
                    while (i < jSONArray.length()) {
                        boolean z3 = z2;
                        try {
                            JSONObject jSONObject4 = jSONArray.getJSONObject(i);
                            if (!jSONObject4.has("ip")) {
                                boolean z4 = z2;
                                jSONArray3.put(jSONObject4);
                                z = z2;
                                jSONObject2 = jSONObject3;
                            } else {
                                JSONArray jSONArray4 = null;
                                if (jSONObject4.has("ip")) {
                                    jSONArray4 = null;
                                    if (str2.equals(jSONObject4.getString("ip"))) {
                                        jSONArray4 = null;
                                        if (jSONObject4.has("students")) {
                                            boolean z5 = z2;
                                            jSONArray4 = jSONObject4.getJSONArray("students");
                                        }
                                    }
                                }
                                jSONObject2 = jSONObject3;
                                z = z2;
                                if (jSONArray4 != null) {
                                    jSONObject2 = jSONObject3;
                                    z = z2;
                                    if (jSONArray4.length() > 0) {
                                        int i2 = 0;
                                        while (true) {
                                            if (i2 >= jSONArray4.length()) {
                                                break;
                                            }
                                            JSONObject jSONObject5 = jSONArray4.getJSONObject(i2);
                                            if (jSONObject5 != null && jSONObject5.has("code")) {
                                                boolean z6 = z2;
                                                if (jSONObject5.getString("code").equals(str3)) {
                                                    z2 = true;
                                                    break;
                                                }
                                            }
                                            i2++;
                                        }
                                        jSONObject2 = jSONObject3;
                                        z = z2;
                                        if (!z2) {
                                            boolean z7 = z2;
                                            JSONObject jSONObject6 = new JSONObject();
                                            boolean z8 = z2;
                                            jSONObject6.put("code", str3);
                                            boolean z9 = z2;
                                            jSONObject6.put("name", str);
                                            boolean z10 = z2;
                                            jSONArray4.put(jSONObject6);
                                            boolean z11 = z2;
                                            jSONObject2 = new JSONObject();
                                            try {
                                                jSONObject2.put("ip", str2);
                                                jSONObject2.put("students", jSONArray4);
                                                z = z2;
                                            } catch (JSONException e3) {
                                                e2 = e3;
                                                jSONObject3 = jSONObject2;
                                                e2.printStackTrace();
                                                jSONObject2 = jSONObject3;
                                                z = z2;
                                                i++;
                                                jSONObject3 = jSONObject2;
                                                z2 = z;
                                            }
                                        }
                                    }
                                }
                            }
                        } catch (JSONException e4) {
                            e2 = e4;
                            z2 = z3;
                        }
                        i++;
                        jSONObject3 = jSONObject2;
                        z2 = z;
                    }
                }
            }
            if (jSONObject3 != null || z2) {
                jSONObject = jSONObject3;
            } else {
                JSONArray jSONArray5 = new JSONArray();
                JSONObject jSONObject7 = new JSONObject();
                try {
                    jSONObject7.put("code", str3);
                    jSONObject7.put("name", str);
                    jSONArray5.put(jSONObject7);
                    jSONObject = new JSONObject();
                } catch (JSONException e5) {
                    e = e5;
                    jSONObject = jSONObject3;
                }
                try {
                    jSONObject.put("ip", str2);
                    jSONObject.put("students", jSONArray5);
                } catch (JSONException e6) {
                    e = e6;
                    e.printStackTrace();
                    if (jSONObject != null) {
                    }
                    jSONArray2 = jSONArray3;
                    if (jSONArray3 != null) {
                    }
                    return jSONArray2;
                }
            }
            if (jSONObject != null) {
                jSONArray3.put(jSONObject);
            }
            jSONArray2 = jSONArray3;
            if (jSONArray3 != null) {
                jSONArray2 = jSONArray3;
                if (jSONArray3.length() > 0) {
                    getSharedPreferences("loginhistory", 4).edit().putString("namehistorystring", jSONArray3.toString()).commit();
                    jSONArray2 = jSONArray3;
                }
            }
        }
        return jSONArray2;
    }

    private JSONArray nameHistoryDelete(String str, String str2, JSONArray jSONArray) {
        JSONArray jSONArray2;
        JSONException e;
        JSONArray jSONArray3 = new JSONArray();
        if (jSONArray == null || str2 == null || str == null || jSONArray.length() <= 0) {
            jSONArray2 = jSONArray;
        } else {
            if (jSONArray != null && jSONArray.length() >= 0) {
                for (int i = 0; i < jSONArray.length(); i++) {
                    try {
                        JSONObject jSONObject = jSONArray.getJSONObject(i);
                        if (!jSONObject.has("ip")) {
                            jSONArray3.put(jSONObject);
                        } else {
                            JSONArray jSONArray4 = null;
                            if (jSONObject.has("ip")) {
                                jSONArray4 = null;
                                if (str.equals(jSONObject.getString("ip"))) {
                                    jSONArray4 = null;
                                    if (jSONObject.has("students")) {
                                        jSONArray4 = jSONObject.getJSONArray("students");
                                    }
                                }
                            }
                            if (jSONArray4 != null && jSONArray4.length() > 0) {
                                JSONArray jSONArray5 = new JSONArray();
                                for (int i2 = 0; i2 < jSONArray4.length(); i2++) {
                                    JSONObject jSONObject2 = jSONArray4.getJSONObject(i2);
                                    if (jSONObject2 != null && jSONObject2.has("code") && !str2.equals(jSONObject2.getString("code"))) {
                                        jSONArray5.put(jSONObject2);
                                    }
                                }
                                JSONObject jSONObject3 = new JSONObject();
                                try {
                                    jSONObject3.put("ip", str);
                                    jSONObject3.put("students", jSONArray5);
                                    jSONArray3.put(jSONObject3);
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
            jSONArray2 = jSONArray3;
            if (jSONArray3 != null) {
                getSharedPreferences("loginhistory", 4).edit().putString("namehistorystring", jSONArray3.toString()).commit();
                jSONArray2 = jSONArray3;
            }
        }
        return jSONArray2;
    }

    private JSONArray nameHistoryDeleteByIP(String str, JSONArray jSONArray) {
        JSONArray jSONArray2;
        JSONArray jSONArray3 = new JSONArray();
        if (jSONArray == null || str == null || jSONArray.length() <= 0) {
            jSONArray2 = jSONArray;
        } else {
            if (jSONArray != null && jSONArray.length() >= 0) {
                for (int i = 0; i < jSONArray.length(); i++) {
                    try {
                        JSONObject jSONObject = jSONArray.getJSONObject(i);
                        if (!jSONObject.has("ip")) {
                            jSONArray3.put(jSONObject);
                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
            }
            jSONArray2 = jSONArray3;
            if (jSONArray3 != null) {
                getSharedPreferences("loginhistory", 4).edit().putString("namehistorystring", jSONArray3.toString()).commit();
                jSONArray2 = jSONArray3;
            }
        }
        return jSONArray2;
    }

    private JSONArray nameHistoryParser() {
        JSONArray jSONArray;
        SharedPreferences sharedPreferences = getSharedPreferences("loginhistory", 4);
        if (!sharedPreferences.contains("namehistorystring")) {
            jSONArray = null;
        } else {
            String string = sharedPreferences.getString("namehistorystring", "");
            if (string == null || string.equals("")) {
                jSONArray = null;
            } else {
                try {
                    jSONArray = new JSONArray(string);
                } catch (JSONException e) {
                    e.printStackTrace();
                    jSONArray = null;
                }
            }
        }
        return jSONArray;
    }

    private ArrayList<HashMap<String, String>> nameHistoryQuery(String str, JSONArray jSONArray) {
        ArrayList<HashMap<String, String>> arrayList = new ArrayList<>();
        if (jSONArray != null && str != null && jSONArray.length() > 0) {
            for (int i = 0; i < jSONArray.length(); i++) {
                try {
                    JSONObject jSONObject = jSONArray.getJSONObject(i);
                    JSONArray jSONArray2 = null;
                    if (jSONObject.has("ip")) {
                        jSONArray2 = null;
                        if (str.equals(jSONObject.getString("ip"))) {
                            jSONArray2 = null;
                            if (jSONObject.has("students")) {
                                jSONArray2 = jSONObject.getJSONArray("students");
                            }
                        }
                    }
                    if (jSONArray2 != null && jSONArray2.length() > 0) {
                        for (int i2 = 0; i2 < jSONArray2.length(); i2++) {
                            JSONObject jSONObject2 = jSONArray2.getJSONObject(i2);
                            if (jSONObject2 != null && jSONObject2.has("code") && jSONObject2.has("name")) {
                                HashMap<String, String> hashMap = new HashMap<>();
                                String string = jSONObject2.getString("code");
                                String string2 = jSONObject2.getString("name");
                                hashMap.put("code", string);
                                hashMap.put("name", string2);
                                arrayList.add(hashMap);
                            }
                        }
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }
        return arrayList;
    }

    private boolean needPwdDialog() {
        return (!AppEnvironment.isXF || TextUtils.isEmpty(this.JXHD_Ip)) ? (!AppEnvironment.isNLEZ || TextUtils.isEmpty(this.JXHD_Ip)) ? (!AppEnvironment.isNL || TextUtils.isEmpty(this.JXHD_Ip)) ? (!AppEnvironment.isHT || TextUtils.isEmpty(this.JXHD_Ip)) ? (!AppEnvironment.isGQ || TextUtils.isEmpty(this.JXHD_Ip)) ? false : !this.JXHD_Ip.contains("117.132.10.37:81") : !this.JXHD_Ip.contains("222.134.89.202:89") && !this.JXHD_Ip.contains("yj.htsz.net:89") && !this.JXHD_Ip.contains("192.168.0.5") : !this.JXHD_Ip.contains("192.168.3.253:81") && !this.JXHD_Ip.contains("111.59.6.120:81") : !this.JXHD_Ip.contains("10.164.150.53") && !this.JXHD_Ip.contains("10.164.150.54") && !this.JXHD_Ip.contains("10.164.150.52") && !this.JXHD_Ip.contains("111.12.58.6:8000") : !this.JXHD_Ip.contains("10.70.12.27") && !this.JXHD_Ip.contains("202.107.231.160:8081");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public List<String> parseDownload_Old(JSONArray jSONArray, ArrayList<HashMap<String, String>> arrayList, List<String> list) {
        long j;
        boolean z;
        for (int i = 0; i < jSONArray.length() && isupdating; i++) {
            try {
                JSONObject jSONObject = jSONArray.getJSONObject(i);
                String string = jSONObject.getString("appwebpath");
                long j2 = jSONObject.getLong("appsize");
                String string2 = jSONObject.getString("apkname");
                jSONObject.getString("versionname");
                String string3 = jSONObject.getString("packagename");
                try {
                    j = Long.parseLong(jSONObject.getString("versioncode"));
                } catch (NumberFormatException e) {
                    j = 1;
                } catch (Exception e2) {
                    j = 1;
                }
                Iterator<HashMap<String, String>> it = arrayList.iterator();
                while (true) {
                    z = false;
                    if (!it.hasNext()) {
                        break;
                    }
                    HashMap<String, String> next = it.next();
                    if (next.get("packagename") != null && string3.equals(next.get("packagename"))) {
                        long j3 = 1;
                        try {
                            j3 = Long.parseLong(next.get("versioncode"));
                        } catch (NumberFormatException e3) {
                        } catch (Exception e4) {
                        }
                        z = next.get("versioncode") == null || next.get("versionname") == null || j <= j3;
                    }
                }
                if (!z) {
                    HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(string).openConnection();
                    httpURLConnection.connect();
                    InputStream inputStream = httpURLConnection.getInputStream();
                    if (new File(AppEnvironment.ASSETS_DIR).isDirectory()) {
                        File file = new File(String.valueOf(AppEnvironment.ASSETS_DIR) + string2);
                        if (file.exists()) {
                            file.delete();
                        }
                        FileOutputStream fileOutputStream = new FileOutputStream(file);
                        byte[] bArr = new byte[10240];
                        int i2 = 0;
                        while (i2 < j2 && isupdating) {
                            int read = inputStream.read(bArr);
                            if (read == -1) {
                                break;
                            }
                            i2 += read;
                            this.currentCachePosition += read;
                            fileOutputStream.write(bArr, 0, read);
                        }
                        fileOutputStream.close();
                        inputStream.close();
                        httpURLConnection.disconnect();
                        if (i2 == j2) {
                            if (!string3.equals("com.launcher.activity")) {
                                list.add(String.valueOf(AppEnvironment.ASSETS_DIR) + string2);
                                this.addApksList.add(string3);
                            } else {
                                this.launcherPath = String.valueOf(AppEnvironment.ASSETS_DIR) + string2;
                            }
                        }
                    }
                }
            } catch (Exception e5) {
            }
        }
        return list;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public List<String> parseDownload_new(List<String> list, List<ApkUpdateBean> list2) {
        HttpURLConnection httpURLConnection;
        for (int i = 0; i < list2.size(); i++) {
            ApkUpdateBean apkUpdateBean = list2.get(i);
            String packagename = apkUpdateBean.getPackagename();
            String apkUrl = apkUpdateBean.getApkUrl();
            String appName = apkUpdateBean.getAppName();
            long apkSize = apkUpdateBean.getApkSize();
            if (new File(AppEnvironment.ASSETS_DIR).isDirectory()) {
                File file = new File(String.valueOf(AppEnvironment.ASSETS_DIR) + appName);
                if (file.exists()) {
                    file.delete();
                }
                byte[] bArr = new byte[10240];
                long j = 0;
                try {
                    httpURLConnection = (HttpURLConnection) new URL(apkUrl).openConnection();
                    httpURLConnection.connect();
                    InputStream inputStream = httpURLConnection.getInputStream();
                    FileOutputStream fileOutputStream = new FileOutputStream(file);
                    int i2 = 0;
                    while (j < apkSize && isupdating) {
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
                    long j3 = j;
                    sendInstallMessage(i, Long.valueOf(j), UPDATE_PROGRESS);
                    long j4 = j;
                    fileOutputStream.close();
                    long j5 = j;
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

    /* JADX INFO: Access modifiers changed from: private */
    public void resetUpdateInfo() {
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

    private static boolean returnResult(int i) {
        boolean z = true;
        if (i != 0) {
            z = i == 1 ? false : false;
        }
        return z;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v12, types: [java.io.FileOutputStream] */
    private void savePic(InputStream inputStream, String str) {
        Throwable th;
        FileOutputStream fileOutputStream;
        FileOutputStream fileOutputStream2;
        File file = FileInOutHelper.setupOrOpenFile(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/icon", str.substring(str.lastIndexOf("/") + 1));
        byte[] bArr = null;
        try {
            try {
                fileOutputStream2 = new FileOutputStream(file);
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = bArr;
            }
        } catch (Exception e) {
            e = e;
            fileOutputStream2 = null;
        }
        try {
            bArr = new byte[1024];
            while (true) {
                int read = inputStream.read(bArr);
                if (read == -1) {
                    try {
                        inputStream.close();
                        fileOutputStream2.close();
                        return;
                    } catch (Exception e2) {
                        e2.printStackTrace();
                        Log.i("liu", "close stream:" + e2);
                        return;
                    }
                }
                fileOutputStream2.write(bArr, 0, read);
            }
        } catch (Exception e3) {
            e = e3;
            e.printStackTrace();
            FileOutputStream fileOutputStream3 = fileOutputStream2;
            FileOutputStream fileOutputStream4 = fileOutputStream2;
            FileOutputStream fileOutputStream5 = fileOutputStream2;
            Log.i("liu", "savePic:" + e);
            try {
                inputStream.close();
                fileOutputStream2.close();
            } catch (Exception e4) {
                e4.printStackTrace();
                Log.i("liu", "close stream:" + e4);
            }
        } catch (Throwable th3) {
            fileOutputStream = fileOutputStream2;
            th = th3;
            try {
                inputStream.close();
                fileOutputStream.close();
            } catch (Exception e5) {
                e5.printStackTrace();
                Log.i("liu", "close stream:" + e5);
            }
            throw th;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendInstallMessage(int i, Object obj, int i2) {
        Message message = new Message();
        message.arg1 = i;
        message.what = i2;
        message.obj = obj;
        this.installHandler.sendMessage(message);
    }

    private void showClearDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle(getResources().getString(R.string.notifymessage));
        builder.setMessage(getResources().getString(R.string.clearmsg));
        builder.setPositiveButton(R.string.cancel, new DialogInterface.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.16
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                if (dialogInterface != null) {
                    dialogInterface.dismiss();
                }
            }
        }).setNegativeButton(R.string.ok_button, new DialogInterface.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.17
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                if (!CloudClientSetActivity.this.reseting) {
                    new ResetThread().start();
                }
                if (dialogInterface != null) {
                    dialogInterface.dismiss();
                }
            }
        });
        builder.setCancelable(true);
        builder.create().show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showConfirmPwdDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setMessage(R.string.confirm_pwd);
        View inflate = LayoutInflater.from(this).inflate(R.layout.confirmpwd, (ViewGroup) null);
        final EditText editText = (EditText) inflate.findViewById(R.id.edt_pwd);
        builder.setView(inflate);
        builder.setNegativeButton(R.string.cancel, new DialogInterface.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.24
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                CloudClientSetActivity.this.btnTitleBack.setEnabled(true);
                CloudClientSetActivity.this.ok_btn.setEnabled(true);
                CloudClientSetActivity.this.ok_btn.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                if (CloudClientSetActivity.this.pwdConfirmDialog != null) {
                    CloudClientSetActivity.this.pwdConfirmDialog.dismiss();
                }
            }
        }).setPositiveButton(R.string.appmanager_ok, new DialogInterface.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.25
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                if (editText != null) {
                    String editable = editText.getText().toString() != null ? editText.getText().toString() : "";
                    if (AppEnvironment.isXF || AppEnvironment.isNL || AppEnvironment.isNLEZ || AppEnvironment.isHT || AppEnvironment.isGQ) {
                        if (editable.equals(CloudClientSetActivity.this.superPwd1.trim())) {
                            new Thread(CloudClientSetActivity.this.runnable_GetConfig_Infor).start();
                        } else {
                            CloudClientSetActivity.this.btnTitleBack.setEnabled(true);
                            CloudClientSetActivity.this.ok_btn.setEnabled(true);
                            CloudClientSetActivity.this.ok_btn.setText(CloudClientSetActivity.this.getResources().getString(R.string.setting_save));
                            Toast.makeText(CloudClientSetActivity.this, "密码验证不通过！", 0).show();
                        }
                    } else if (editable.equals(CloudClientSetActivity.this.superPwd1.trim()) || editable.equals(CloudClientSetActivity.this.superPwd2.trim())) {
                        CloudClientSetActivity.this.allChangeSettings = true;
                    } else {
                        CloudClientSetActivity.this.allChangeSettings = false;
                    }
                }
                if (CloudClientSetActivity.this.pwdConfirmDialog != null) {
                    CloudClientSetActivity.this.pwdConfirmDialog.dismiss();
                }
            }
        });
        this.pwdConfirmDialog = null;
        try {
            this.pwdConfirmDialog = builder.create();
            this.pwdConfirmDialog.show();
        } catch (Exception e) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showLanguageChooseDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setCancelable(true);
        builder.setTitle(getResources().getString(R.string.language_t));
        builder.setItems(new String[]{getResources().getString(R.string.setchinese), getResources().getString(R.string.setenglish)}, new DialogInterface.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.15
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                SharedPreferences sharedPreferences = CloudClientSetActivity.this.getSharedPreferences("language", 0);
                if (i == 0) {
                    LanguageUtils.SetLanguage(CloudClientSetActivity.this, "chinese");
                    sharedPreferences.edit().putString("language", "chinese").commit();
                    Message obtainMessage = CloudClientSetActivity.this.mHandler.obtainMessage();
                    obtainMessage.what = HttpStatus.SC_PROCESSING;
                    CloudClientSetActivity.this.mHandler.sendMessage(obtainMessage);
                    return;
                }
                LanguageUtils.SetLanguage(CloudClientSetActivity.this, "en");
                sharedPreferences.edit().putString("language", "en").commit();
                Message obtainMessage2 = CloudClientSetActivity.this.mHandler.obtainMessage();
                obtainMessage2.what = TarConstants.LF_PAX_GLOBAL_EXTENDED_HEADER;
                CloudClientSetActivity.this.mHandler.sendMessage(obtainMessage2);
            }
        });
        builder.create().show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showPopList() {
        String[] split;
        String string = getSharedPreferences("loginhistory", 4).getString("iphistoryString", "");
        if (string == null || string.equals("") || this.ip_edit == null || (split = string.split(",:,")) == null || split.length <= 0) {
            return;
        }
        Log.e("ip", string);
        this.ips = new ArrayList();
        for (String str : split) {
            if (str != null && !str.equals("")) {
                this.ips.add(str);
            }
        }
        if (this.ips == null || this.ips.size() <= 0) {
            return;
        }
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

    /* JADX INFO: Access modifiers changed from: private */
    public void showPopNameList() {
        this.history_nameList = new ArrayList();
        String editable = this.ip_edit != null ? this.ip_edit.getText().toString() : "";
        if (editable.equals("") || this.history_array == null || this.history_array.length() <= 0) {
            return;
        }
        this.history_nameList = nameHistoryQuery(editable, this.history_array);
        if (this.history_nameList == null || this.history_nameList.size() <= 0) {
            return;
        }
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

    /* JADX INFO: Access modifiers changed from: private */
    public void showProgressDialog() {
        if (AppEnvironment.isNewUpdate) {
            if (this.progressDialog != null || this.isover) {
                return;
            }
            this.apkUpdateList = new ArrayList();
            this.progressDialog = new com.edutech.mobilestudyclient.view.CustomProgressDialog(this, this.apkUpdateList);
            this.progressDialog.setOnKeyListener(this.keylistenerDialog);
            this.progressDialog.show();
        } else if (this.webprogressdialog != null || this.isover) {
        } else {
            this.webprogressdialog = CustomProgressDialog.createDialog(this);
            this.webprogressdialog.setMessage(getResources().getString(R.string.setting_loading));
            this.webprogressdialog.setOnKeyListener(this.keylistenerDialog);
            this.webprogressdialog.show();
        }
    }

    private void showServiceDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle(getResources().getString(R.string.notifymessage));
        builder.setMessage(getResources().getString(R.string.feedbackmsg));
        builder.setPositiveButton(getResources().getString(R.string.confirm), new DialogInterface.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.18
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                if (dialogInterface != null) {
                    dialogInterface.dismiss();
                }
            }
        });
        builder.setCancelable(true);
        builder.create().show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public HttpClient sslClient(HttpClient httpClient) {
        DefaultHttpClient defaultHttpClient;
        try {
            X509TrustManager x509TrustManager = new X509TrustManager() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.23
                @Override // javax.net.ssl.X509TrustManager
                public void checkClientTrusted(X509Certificate[] x509CertificateArr, String str) throws CertificateException {
                }

                @Override // javax.net.ssl.X509TrustManager
                public void checkServerTrusted(X509Certificate[] x509CertificateArr, String str) throws CertificateException {
                }

                @Override // javax.net.ssl.X509TrustManager
                public X509Certificate[] getAcceptedIssuers() {
                    return null;
                }
            };
            SSLContext sSLContext = SSLContext.getInstance(IMAPSClient.DEFAULT_PROTOCOL);
            sSLContext.init(null, new TrustManager[]{x509TrustManager}, null);
            MySSLSocketFactory mySSLSocketFactory = new MySSLSocketFactory(sSLContext);
            mySSLSocketFactory.setHostnameVerifier(SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
            ClientConnectionManager connectionManager = httpClient.getConnectionManager();
            connectionManager.getSchemeRegistry().register(new Scheme("https", mySSLSocketFactory, 443));
            defaultHttpClient = new DefaultHttpClient(connectionManager, httpClient.getParams());
        } catch (Exception e) {
            defaultHttpClient = null;
        }
        return defaultHttpClient;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:36:0x0263 -> B:26:0x020b). Please submit an issue!!! */
    public void sslConnect() {
        MalformedURLException e;
        try {
            URL url = new URL("https://www.icontrol365.com/regmac.aspx");
            try {
                X509TrustManager x509TrustManager = new X509TrustManager() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.22
                    @Override // javax.net.ssl.X509TrustManager
                    public void checkClientTrusted(X509Certificate[] x509CertificateArr, String str) {
                    }

                    @Override // javax.net.ssl.X509TrustManager
                    public void checkServerTrusted(X509Certificate[] x509CertificateArr, String str) {
                    }

                    @Override // javax.net.ssl.X509TrustManager
                    public X509Certificate[] getAcceptedIssuers() {
                        return new X509Certificate[0];
                    }
                };
                HttpsURLConnection.setDefaultHostnameVerifier(new MyHostnameVerifier(this, null));
                SSLContext.getInstance(IMAPSClient.DEFAULT_PROTOCOL).init(null, new TrustManager[]{x509TrustManager}, null);
                SSLSocketFactoryExtended sSLSocketFactoryExtended = new SSLSocketFactoryExtended();
                HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
                httpsURLConnection.setSSLSocketFactory(sSLSocketFactoryExtended);
                httpsURLConnection.setDoInput(true);
                httpsURLConnection.setDoOutput(true);
                httpsURLConnection.setRequestMethod(HttpPost.METHOD_NAME);
                httpsURLConnection.addRequestProperty("Content-Type", "application/xml;charset=UTF-8");
                httpsURLConnection.connect();
                StringBuilder sb = new StringBuilder();
                sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                sb.append("<ApplyAuth><strAuthID>" + this.id.getText().toString() + "</strAuthID>");
                sb.append("<strMacAddr>" + GetMachineID() + "</strMacAddr>");
                sb.append("<strSystemInfo>" + Build.MODEL + "</strSystemInfo></ApplyAuth>");
                DataOutputStream dataOutputStream = new DataOutputStream(httpsURLConnection.getOutputStream());
                dataOutputStream.writeBytes(sb.toString());
                dataOutputStream.flush();
                dataOutputStream.close();
                if (200 != httpsURLConnection.getResponseCode()) {
                    return;
                }
                new StringBuffer();
                new String();
                Element documentElement = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(httpsURLConnection.getInputStream()).getDocumentElement();
                int parseInt = Integer.parseInt(documentElement.getElementsByTagName("AuthResult").item(0).getFirstChild().getNodeValue());
                if (parseInt == 4 || parseInt == 5) {
                    NodeList elementsByTagName = documentElement.getElementsByTagName("AuthTimes");
                    String nodeValue = (elementsByTagName.getLength() <= 0 || elementsByTagName.item(0).getFirstChild().getNodeValue().length() <= 0) ? "0" : elementsByTagName.item(0).getFirstChild().getNodeValue();
                    NodeList elementsByTagName2 = documentElement.getElementsByTagName("AuthValidDate");
                    String nodeValue2 = (elementsByTagName2.getLength() <= 0 || elementsByTagName2.item(0).getFirstChild().getNodeValue().length() <= 0) ? "0" : elementsByTagName2.item(0).getFirstChild().getNodeValue();
                    int i = Build.VERSION.SDK_INT;
                    this.idauth.writeidFile(this.id.getText().toString(), parseInt, nodeValue, nodeValue2, "0");
                    try {
                        new Aduth(this).writeidFile(this.id.getText().toString(), parseInt, nodeValue, nodeValue2, "0");
                    } catch (Exception e2) {
                    }
                }
                Log.e("HHH", "result:" + parseInt);
                Message message = new Message();
                message.what = parseInt;
                this.resultHandler.sendMessageDelayed(message, 1000L);
            } catch (MalformedURLException e3) {
                e = e3;
                e.printStackTrace();
            } catch (Exception e4) {
            }
        } catch (MalformedURLException e5) {
            e = e5;
        } catch (Exception e6) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startAssistanApk() {
        PackageInfo packageInfo;
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.addFlags(268435456);
        intent.setComponent(new ComponentName("com.edutech.assistantdemo", "com.edutech.assistantdemo.MainActivity"));
        try {
            packageInfo = this.mContext.getPackageManager().getPackageInfo("com.edutech.assistantdemo", 0);
        } catch (PackageManager.NameNotFoundException e) {
            packageInfo = null;
            e.printStackTrace();
        }
        if (packageInfo != null) {
            startActivity(intent);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startFireWall(String str, String str2, String str3, String str4) {
        Intent intent = new Intent();
        intent.setAction("com.edutech.intent.TrafficStatsService");
        intent.setClassName("com.edutech.firewall", "eu.faircode.netguard.TrafficStatsService");
        intent.putExtra("ip", str);
        intent.putExtra("privatekey", str2);
        intent.putExtra("name", str3);
        intent.putExtra("schoolid", str4);
        startService(intent);
    }

    public static String toHexString(byte[] bArr, String str) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bArr) {
            sb.append(Integer.toHexString(b & 255)).append(str);
        }
        return sb.toString();
    }

    public static byte[] toMd5(byte[] bArr) {
        byte[] bArr2;
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            messageDigest.update(bArr);
            bArr2 = messageDigest.digest();
        } catch (NoSuchAlgorithmException e) {
            bArr2 = null;
        }
        return bArr2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updatePassword() {
        View inflate = getLayoutInflater().inflate(R.layout.update_pwd_dialog_setting, (ViewGroup) findViewById(R.id.update_pwd_dialog));
        this.oldpwd = (EditText) inflate.findViewById(R.id.update_pwd_dialog_oldpwd);
        this.newpwd = (EditText) inflate.findViewById(R.id.update_pwd_dialog_newpwd);
        this.confirmpwd = (EditText) inflate.findViewById(R.id.update_pwd_dialog_confirmpwd);
        new AlertDialog.Builder(this).setTitle(getResources().getString(R.string.setting_cp)).setInverseBackgroundForced(true).setView(inflate).setPositiveButton(getResources().getString(R.string.setting_submit), new DialogInterface.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.26
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                if (CloudClientSetActivity.this.oldpwd.getText().toString().length() < 6) {
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_errorpw3));
                } else if (CloudClientSetActivity.this.newpwd.getText().toString().length() < 6) {
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_errorpw2));
                } else if (!CloudClientSetActivity.this.newpwd.getText().toString().equals(CloudClientSetActivity.this.confirmpwd.getText().toString())) {
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_errorpw1));
                } else {
                    CloudClientSetActivity.this.showToast(CloudClientSetActivity.this.getResources().getString(R.string.setting_submiting));
                    new Thread(CloudClientSetActivity.this.updatepwdRun).start();
                }
            }
        }).setNegativeButton(getResources().getString(R.string.setting_cancel), new DialogInterface.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.27
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                if (dialogInterface != null) {
                    dialogInterface.dismiss();
                }
            }
        }).show();
    }

    /* JADX WARN: Can't wrap try/catch for region: R(39:2|(1:4)|5|(2:7|(1:9))|10|(4:(36:12|(1:14)|17|70|18|19|20|21|(2:23|(4:25|26|27|28))|29|30|31|32|33|34|35|36|37|(16:39|(2:41|42)|47|(10:49|(2:51|52)|58|72|59|60|61|74|62|63)|54|55|56|57|58|72|59|60|61|74|62|63)|44|45|46|47|(0)|54|55|56|57|58|72|59|60|61|74|62|63)|74|62|63)|16|17|70|18|19|20|21|(0)|29|30|31|32|33|34|35|36|37|(0)|44|45|46|47|(0)|54|55|56|57|58|72|59|60|61|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x00a4, code lost:
        if (r6.length() <= 0) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x0169, code lost:
        if (r14.length() <= 0) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x019b, code lost:
        if (r13.length() <= 0) goto L54;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x02a8, code lost:
        r7 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x02a9, code lost:
        r7.printStackTrace();
        r14 = r8;
        r10 = r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x02b7, code lost:
        android.util.Log.e("FileNotFoundException", "can't create FileOutputStream");
     */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00ef  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0153  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x017e  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:67:0x02b7 -> B:60:0x01c4). Please submit an issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void writeXml() {
        String str;
        String str2;
        String str3;
        String string;
        String str4;
        String str5;
        String str6;
        Log.i(TAG, "writeXml");
        if (this.tempfile.exists()) {
            this.tempfile.delete();
        }
        String editable = this.ip_edit.getText().toString();
        AppEnvironment.MOBILESTUDYSERVERIP = editable;
        String replaceAll = editable.replaceAll(" ", "");
        String str7 = replaceAll;
        if (replaceAll.length() > 7) {
            String substring = replaceAll.substring(0, 7);
            Log.i(TAG, "subhttp" + substring);
            str7 = replaceAll;
            if (substring.equals("http://")) {
                str7 = replaceAll.substring(7);
                this.ptfw_edit.setText(str7);
                this.ip_edit.setText(str7);
                showToast(getResources().getString(R.string.setting_serverurlerror));
            }
        }
        try {
            if (str7 != null) {
                str = str7;
                if (str7 != null) {
                    str = str7;
                }
                String str8 = "";
                String str9 = "";
                string = getSharedPreferences("privatekey", 0).getString("name", "");
                String editable2 = this.password_edit.getText().toString();
                str4 = editable2;
                str5 = string;
                if (string != null) {
                    str4 = editable2;
                    str5 = string;
                    if (editable2 != null) {
                        str5 = string.replaceAll(" ", "");
                        str4 = editable2.replaceAll(" ", "");
                    }
                }
                this.Name = str5;
                this.Pwd = str4;
                String StringEncodeToBase64 = BZip2Utils.StringEncodeToBase64(str5);
                String StringEncodeToBase642 = BZip2Utils.StringEncodeToBase64(str4);
                if (str5 != null) {
                    str6 = StringEncodeToBase64;
                    if (str5 != null) {
                        str6 = StringEncodeToBase64;
                    }
                    if (str4 != null) {
                        str2 = StringEncodeToBase642;
                        str3 = str6;
                        if (str4 != null) {
                            str2 = StringEncodeToBase642;
                            str3 = str6;
                        }
                        this.fileos = new FileOutputStream(FileInOutHelper.setupOrOpenFile(this.urlfilepath));
                        XmlSerializer newSerializer = Xml.newSerializer();
                        newSerializer.setOutput(this.fileos, "UTF-8");
                        newSerializer.startDocument(null, true);
                        newSerializer.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
                        newSerializer.startTag(null, "urlpath");
                        newSerializer.startTag(null, "ip");
                        newSerializer.text(str);
                        newSerializer.endTag(null, "ip");
                        newSerializer.startTag(null, "showDemo");
                        newSerializer.text(this.setDemoShow);
                        newSerializer.endTag(null, "showDemo");
                        newSerializer.endTag(null, "urlpath");
                        newSerializer.startTag(null, "student");
                        newSerializer.startTag(null, "username");
                        newSerializer.text(str3);
                        newSerializer.endTag(null, "username");
                        newSerializer.startTag(null, com.edutech.idauthentication.AppEnvironment.PASSWORD);
                        newSerializer.text(str2);
                        newSerializer.endTag(null, com.edutech.idauthentication.AppEnvironment.PASSWORD);
                        newSerializer.endTag(null, "student");
                        newSerializer.endDocument();
                        newSerializer.flush();
                        this.fileos.close();
                        return;
                    }
                    str8 = StringEncodeToBase642;
                    str9 = str6;
                    str2 = BZip2Utils.StringEncodeToBase64(LogHelp.TYPE_GUIDANCE);
                    str3 = str6;
                    this.fileos = new FileOutputStream(FileInOutHelper.setupOrOpenFile(this.urlfilepath));
                    XmlSerializer newSerializer2 = Xml.newSerializer();
                    newSerializer2.setOutput(this.fileos, "UTF-8");
                    newSerializer2.startDocument(null, true);
                    newSerializer2.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
                    newSerializer2.startTag(null, "urlpath");
                    newSerializer2.startTag(null, "ip");
                    newSerializer2.text(str);
                    newSerializer2.endTag(null, "ip");
                    newSerializer2.startTag(null, "showDemo");
                    newSerializer2.text(this.setDemoShow);
                    newSerializer2.endTag(null, "showDemo");
                    newSerializer2.endTag(null, "urlpath");
                    newSerializer2.startTag(null, "student");
                    newSerializer2.startTag(null, "username");
                    newSerializer2.text(str3);
                    newSerializer2.endTag(null, "username");
                    newSerializer2.startTag(null, com.edutech.idauthentication.AppEnvironment.PASSWORD);
                    newSerializer2.text(str2);
                    newSerializer2.endTag(null, com.edutech.idauthentication.AppEnvironment.PASSWORD);
                    newSerializer2.endTag(null, "student");
                    newSerializer2.endDocument();
                    newSerializer2.flush();
                    this.fileos.close();
                    return;
                }
                str6 = BZip2Utils.StringEncodeToBase64("02");
                if (str4 != null) {
                }
                str8 = StringEncodeToBase642;
                str9 = str6;
                str2 = BZip2Utils.StringEncodeToBase64(LogHelp.TYPE_GUIDANCE);
                str3 = str6;
                this.fileos = new FileOutputStream(FileInOutHelper.setupOrOpenFile(this.urlfilepath));
                XmlSerializer newSerializer22 = Xml.newSerializer();
                newSerializer22.setOutput(this.fileos, "UTF-8");
                newSerializer22.startDocument(null, true);
                newSerializer22.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
                newSerializer22.startTag(null, "urlpath");
                newSerializer22.startTag(null, "ip");
                newSerializer22.text(str);
                newSerializer22.endTag(null, "ip");
                newSerializer22.startTag(null, "showDemo");
                newSerializer22.text(this.setDemoShow);
                newSerializer22.endTag(null, "showDemo");
                newSerializer22.endTag(null, "urlpath");
                newSerializer22.startTag(null, "student");
                newSerializer22.startTag(null, "username");
                newSerializer22.text(str3);
                newSerializer22.endTag(null, "username");
                newSerializer22.startTag(null, com.edutech.idauthentication.AppEnvironment.PASSWORD);
                newSerializer22.text(str2);
                newSerializer22.endTag(null, com.edutech.idauthentication.AppEnvironment.PASSWORD);
                newSerializer22.endTag(null, "student");
                newSerializer22.endDocument();
                newSerializer22.flush();
                this.fileos.close();
                return;
            }
            newSerializer22.setOutput(this.fileos, "UTF-8");
            newSerializer22.startDocument(null, true);
            newSerializer22.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
            newSerializer22.startTag(null, "urlpath");
            newSerializer22.startTag(null, "ip");
            newSerializer22.text(str);
            newSerializer22.endTag(null, "ip");
            newSerializer22.startTag(null, "showDemo");
            newSerializer22.text(this.setDemoShow);
            newSerializer22.endTag(null, "showDemo");
            newSerializer22.endTag(null, "urlpath");
            newSerializer22.startTag(null, "student");
            newSerializer22.startTag(null, "username");
            newSerializer22.text(str3);
            newSerializer22.endTag(null, "username");
            newSerializer22.startTag(null, com.edutech.idauthentication.AppEnvironment.PASSWORD);
            newSerializer22.text(str2);
            newSerializer22.endTag(null, com.edutech.idauthentication.AppEnvironment.PASSWORD);
            newSerializer22.endTag(null, "student");
            newSerializer22.endDocument();
            newSerializer22.flush();
            this.fileos.close();
            return;
        } catch (Exception e) {
            Log.e(TAG, "error occurred while creating xml file");
            return;
        }
        str = "192.168.0.88";
        String str82 = "";
        String str92 = "";
        string = getSharedPreferences("privatekey", 0).getString("name", "");
        String editable22 = this.password_edit.getText().toString();
        str4 = editable22;
        str5 = string;
        if (string != null) {
        }
        this.Name = str5;
        this.Pwd = str4;
        String StringEncodeToBase643 = BZip2Utils.StringEncodeToBase64(str5);
        String StringEncodeToBase6422 = BZip2Utils.StringEncodeToBase64(str4);
        if (str5 != null) {
        }
        str6 = BZip2Utils.StringEncodeToBase64("02");
        if (str4 != null) {
        }
        str82 = StringEncodeToBase6422;
        str92 = str6;
        str2 = BZip2Utils.StringEncodeToBase64(LogHelp.TYPE_GUIDANCE);
        str3 = str6;
        this.fileos = new FileOutputStream(FileInOutHelper.setupOrOpenFile(this.urlfilepath));
        XmlSerializer newSerializer222 = Xml.newSerializer();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x00a8 -> B:9:0x003c). Please submit an issue!!! */
    public void writeXmlLanguage(String str) {
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
        try {
            this.fileos = new FileOutputStream(FileInOutHelper.setupOrOpenFile(this.LANGUAGEPATH));
        } catch (FileNotFoundException e2) {
            Log.e("FileNotFoundException", "can't create FileOutputStream");
        }
        XmlSerializer newSerializer = Xml.newSerializer();
        try {
            newSerializer.setOutput(this.fileos, "UTF-8");
            newSerializer.startDocument(null, true);
            newSerializer.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
            newSerializer.startTag(null, "urlpath");
            newSerializer.startTag(null, "language");
            newSerializer.text(str);
            newSerializer.endTag(null, "language");
            newSerializer.endDocument();
            newSerializer.flush();
            this.fileos.close();
        } catch (Exception e3) {
            Log.e(TAG, "error occurred while creating xml file");
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:132:0x10b2 -> B:82:0x0ba4). Please submit an issue!!! */
    private void writeXml_config(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9, String str10, String str11, String str12, String str13, String str14, String str15, String str16, String str17, String str18, String str19, String str20, String str21, ArrayList<AppBean> arrayList, String str22) {
        String str23;
        String str24;
        String str25;
        String str26;
        String str27;
        String str28;
        String str29;
        String str30;
        String str31;
        String str32;
        String str33;
        String str34;
        String str35;
        String str36;
        Log.i(TAG, "writeXml");
        if (str == null || str.equals("")) {
            return;
        }
        String editable = this.ip_edit.getText().toString();
        AppEnvironment.MOBILESTUDYSERVERIP = editable;
        String replaceAll = editable.replaceAll(" ", "");
        String str37 = replaceAll;
        if (replaceAll.length() > 7) {
            str37 = replaceAll;
            if (replaceAll.substring(0, 7).equals("http://")) {
                str37 = replaceAll.substring(7);
                this.ptfw_edit.setText(str37);
                this.ip_edit.setText(str37);
                showToast(getResources().getString(R.string.setting_serverurlerror));
                getResources().getString(R.string.setting_signing);
            }
        }
        if (str37 != null && str37 != null) {
            str37.length();
        }
        String replaceAll2 = str3.replaceAll(" ", "");
        String str38 = replaceAll2;
        if (replaceAll2.length() > 7) {
            str38 = replaceAll2;
            if (replaceAll2.substring(0, 7).equals("http://")) {
                str38 = replaceAll2.substring(7);
                Log.i("Test2", getResources().getString(R.string.setting_serverurlerror));
            }
        }
        String str39 = String.valueOf(str37) + ":" + str15;
        String str40 = "";
        String str41 = "";
        String str42 = "";
        String str43 = "";
        String str44 = "";
        String str45 = "";
        String str46 = str;
        String str47 = str38;
        String str48 = str4;
        String str49 = str5;
        String str50 = str6;
        String str51 = str7;
        String str52 = str8;
        String str53 = str9;
        String str54 = str10;
        String str55 = str11;
        String str56 = str12;
        String str57 = str13;
        String str58 = str14;
        String str59 = str15;
        String str60 = str19;
        String str61 = str20;
        String str62 = str21;
        try {
            String str63 = this.Name;
            String str64 = this.Pwd;
            String StringEncodeToBase64 = BZip2Utils.StringEncodeToBase64(str63);
            String StringEncodeToBase642 = BZip2Utils.StringEncodeToBase64(str64);
            str25 = str2.toString().trim().equals("md5") ? My_md5.Md5(str64) : BZip2Utils.StringEncodeToBase64(str64);
            String StringEncodeToBase643 = BZip2Utils.StringEncodeToBase64(str);
            String StringEncodeToBase644 = BZip2Utils.StringEncodeToBase64(str38);
            str29 = BZip2Utils.StringEncodeToBase64(str5);
            str28 = BZip2Utils.StringEncodeToBase64(str4);
            str30 = BZip2Utils.StringEncodeToBase64(str6);
            str31 = BZip2Utils.StringEncodeToBase64(str7);
            String StringEncodeToBase645 = BZip2Utils.StringEncodeToBase64(str8);
            String StringEncodeToBase646 = BZip2Utils.StringEncodeToBase64(str9);
            str32 = BZip2Utils.StringEncodeToBase64(str10);
            String StringEncodeToBase647 = BZip2Utils.StringEncodeToBase64(str11);
            str33 = BZip2Utils.StringEncodeToBase64(str12);
            str34 = BZip2Utils.StringEncodeToBase64(str13);
            str35 = BZip2Utils.StringEncodeToBase64(str14);
            str36 = BZip2Utils.StringEncodeToBase64(str15);
            str26 = BZip2Utils.StringEncodeToBase64(str16);
            str23 = BZip2Utils.StringEncodeToBase64(str17);
            str27 = BZip2Utils.StringEncodeToBase64(str18);
            String StringEncodeToBase648 = BZip2Utils.StringEncodeToBase64(str19);
            String StringEncodeToBase649 = BZip2Utils.StringEncodeToBase64(str20);
            String StringEncodeToBase6410 = BZip2Utils.StringEncodeToBase64(str21);
            str40 = str23;
            str41 = str25;
            str42 = StringEncodeToBase642;
            str43 = str26;
            str44 = str27;
            str45 = StringEncodeToBase64;
            str46 = StringEncodeToBase643;
            str47 = StringEncodeToBase644;
            str48 = str28;
            str49 = str29;
            str50 = str30;
            str51 = str31;
            str52 = StringEncodeToBase645;
            str53 = StringEncodeToBase646;
            str54 = str32;
            str55 = StringEncodeToBase647;
            str56 = str33;
            str57 = str34;
            str58 = str35;
            str59 = str36;
            str60 = StringEncodeToBase648;
            str61 = StringEncodeToBase649;
            str62 = StringEncodeToBase6410;
            str62 = StringEncodeToBase6410;
            str61 = StringEncodeToBase649;
            str60 = StringEncodeToBase648;
            str55 = StringEncodeToBase647;
            str53 = StringEncodeToBase646;
            str52 = StringEncodeToBase645;
            str47 = StringEncodeToBase644;
            str46 = StringEncodeToBase643;
            str45 = StringEncodeToBase64;
            str42 = StringEncodeToBase642;
            str24 = BZip2Utils.StringEncodeToBase64(str22);
        } catch (Exception e) {
            e.printStackTrace();
            str23 = str40;
            str24 = "";
            str25 = str41;
            str26 = str43;
            str27 = str44;
            str28 = str48;
            str29 = str49;
            str30 = str50;
            str31 = str51;
            str32 = str54;
            str33 = str56;
            str34 = str57;
            str35 = str58;
            str36 = str59;
        }
        try {
            this.fileos = new FileOutputStream(FileInOutHelper.setupOrOpenFile(this.urlfilepath));
        } catch (FileNotFoundException e2) {
            Log.e("FileNotFoundException", "can't create FileOutputStream");
        }
        XmlSerializer newSerializer = Xml.newSerializer();
        try {
            newSerializer.setOutput(this.fileos, "UTF-8");
            newSerializer.startDocument(null, true);
            newSerializer.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
            try {
                newSerializer.startTag(null, "urlpath");
                try {
                    newSerializer.startTag(null, "ip");
                    newSerializer.text(str37);
                    newSerializer.endTag(null, "ip");
                } catch (Exception e3) {
                    e3.printStackTrace();
                }
                try {
                    newSerializer.startTag(null, "showDemo");
                    newSerializer.text(this.setDemoShow);
                    newSerializer.endTag(null, "showDemo");
                } catch (Exception e4) {
                    e4.printStackTrace();
                }
                newSerializer.endTag(null, "urlpath");
            } catch (Exception e5) {
                e5.printStackTrace();
            }
            try {
                newSerializer.startTag(null, "student");
                try {
                    newSerializer.startTag(null, "stuid");
                    newSerializer.text(str26);
                    newSerializer.endTag(null, "stuid");
                    newSerializer.startTag(null, "usercode");
                    newSerializer.text(str36);
                    newSerializer.endTag(null, "usercode");
                    newSerializer.startTag(null, "username");
                    newSerializer.text(str45);
                    newSerializer.endTag(null, "username");
                    newSerializer.startTag(null, com.edutech.idauthentication.AppEnvironment.PASSWORD);
                    newSerializer.text(str25);
                    newSerializer.endTag(null, com.edutech.idauthentication.AppEnvironment.PASSWORD);
                    newSerializer.startTag(null, "pwd");
                    newSerializer.text(str42);
                    newSerializer.endTag(null, "pwd");
                    newSerializer.startTag(null, "stuname");
                    newSerializer.text(str27);
                    newSerializer.endTag(null, "stuname");
                } catch (Exception e6) {
                    e6.printStackTrace();
                }
                try {
                    newSerializer.startTag(null, "privatekey");
                    newSerializer.text(str46);
                    newSerializer.endTag(null, "privatekey");
                    newSerializer.startTag(null, "encrypt");
                    newSerializer.text(str2);
                    newSerializer.endTag(null, "encrypt");
                    newSerializer.startTag(null, "apihost");
                    newSerializer.text(str47);
                    newSerializer.endTag(null, "apihost");
                    newSerializer.startTag(null, ClientCookie.DOMAIN_ATTR);
                    newSerializer.text(str28);
                    newSerializer.endTag(null, ClientCookie.DOMAIN_ATTR);
                    newSerializer.startTag(null, ClientCookie.PORT_ATTR);
                    newSerializer.text(str29);
                    newSerializer.endTag(null, ClientCookie.PORT_ATTR);
                    newSerializer.startTag(null, "tigase_ip");
                    newSerializer.text(str30);
                    newSerializer.endTag(null, "tigase_ip");
                } catch (Exception e7) {
                    e7.printStackTrace();
                }
                try {
                    newSerializer.startTag(null, "mongo_domain");
                    newSerializer.text(str31);
                    newSerializer.endTag(null, "mongo_domain");
                    newSerializer.startTag(null, "mongo_port");
                    newSerializer.text(str52);
                    newSerializer.endTag(null, "mongo_port");
                    newSerializer.startTag(null, "mongo_user");
                    newSerializer.text(str53);
                    newSerializer.endTag(null, "mongo_user");
                    newSerializer.startTag(null, "mongo_pwd");
                    newSerializer.text(str32);
                    newSerializer.endTag(null, "mongo_pwd");
                } catch (Exception e8) {
                    e8.printStackTrace();
                }
                try {
                    newSerializer.startTag(null, "user_type");
                    newSerializer.text(str55);
                    newSerializer.endTag(null, "user_type");
                    newSerializer.startTag(null, "schoolid");
                    newSerializer.text(str33);
                    newSerializer.endTag(null, "schoolid");
                    newSerializer.startTag(null, "schoolname");
                    newSerializer.text(str34);
                    newSerializer.endTag(null, "schoolname");
                } catch (Exception e9) {
                    e9.printStackTrace();
                }
                try {
                    newSerializer.startTag(null, "owncloudip");
                    newSerializer.text(str35);
                    newSerializer.endTag(null, "owncloudip");
                } catch (Exception e10) {
                    e10.printStackTrace();
                }
                try {
                    newSerializer.startTag(null, "gdstate");
                    newSerializer.text(str23);
                    newSerializer.endTag(null, "gdstate");
                } catch (Exception e11) {
                    e11.printStackTrace();
                }
                try {
                    newSerializer.startTag(null, "guidenotes");
                    newSerializer.text(str24);
                    newSerializer.endTag(null, "guidenotes");
                } catch (Exception e12) {
                    e12.printStackTrace();
                }
                try {
                    newSerializer.startTag(null, "guidelearndownload");
                    newSerializer.text(new StringBuilder(String.valueOf(str60)).toString());
                    newSerializer.endTag(null, "guidelearndownload");
                } catch (Exception e13) {
                }
                try {
                    newSerializer.startTag(null, "wifi");
                    newSerializer.text(new StringBuilder(String.valueOf(str61)).toString());
                    newSerializer.endTag(null, "wifi");
                } catch (Exception e14) {
                }
                try {
                    newSerializer.startTag(null, "setting");
                    newSerializer.text(new StringBuilder(String.valueOf(str62)).toString());
                    newSerializer.endTag(null, "setting");
                } catch (Exception e15) {
                }
                newSerializer.endTag(null, "student");
            } catch (Exception e16) {
                e16.printStackTrace();
            }
            try {
                newSerializer.startTag(null, "apps");
                for (int i = 0; i < arrayList.size(); i++) {
                    newSerializer.startTag(null, "app");
                    newSerializer.startTag(null, "code");
                    newSerializer.text(arrayList.get(i).getCode());
                    newSerializer.endTag(null, "code");
                    newSerializer.startTag(null, "name");
                    newSerializer.text(arrayList.get(i).getName());
                    newSerializer.endTag(null, "name");
                    newSerializer.startTag(null, "color");
                    newSerializer.text(arrayList.get(i).getColor());
                    newSerializer.endTag(null, "color");
                    newSerializer.startTag(null, "icon");
                    newSerializer.text(arrayList.get(i).getIcon());
                    newSerializer.endTag(null, "icon");
                    newSerializer.startTag(null, "iconLocal");
                    newSerializer.text(arrayList.get(i).getIconLocal());
                    newSerializer.endTag(null, "iconLocal");
                    newSerializer.startTag(null, "enable");
                    newSerializer.text(new StringBuilder(String.valueOf(arrayList.get(i).getEnable())).toString());
                    newSerializer.endTag(null, "enable");
                    newSerializer.startTag(null, "config");
                    newSerializer.startTag(null, "download");
                    newSerializer.text(arrayList.get(i).getConfig().get("download"));
                    newSerializer.endTag(null, "download");
                    newSerializer.startTag(null, ClientCookie.COMMENT_ATTR);
                    newSerializer.text(arrayList.get(i).getConfig().get(ClientCookie.COMMENT_ATTR));
                    newSerializer.endTag(null, ClientCookie.COMMENT_ATTR);
                    newSerializer.endTag(null, "config");
                    newSerializer.endTag(null, "app");
                }
                newSerializer.endTag(null, "apps");
            } catch (Exception e17) {
                e17.printStackTrace();
                Log.e(TAG, "write to  xml file" + e17.toString());
            }
            newSerializer.endDocument();
            newSerializer.flush();
            this.fileos.close();
            appendUserInfo(this.settingHistory, str39);
        } catch (Exception e18) {
            e18.printStackTrace();
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x013b -> B:22:0x0131). Please submit an issue!!! */
    @SuppressLint({"NewApi"})
    public final String GetMachineID() {
        TelephonyManager telephonyManager = (TelephonyManager) getSystemService("phone");
        StringBuilder sb = new StringBuilder();
        sb.append("\nModel = " + Build.MODEL);
        sb.append("\nSerialNumber = " + Build.SERIAL);
        sb.append("\nDeviceId(IMEI) = " + telephonyManager.getDeviceId());
        sb.append("\nAndroidID = " + Settings.Secure.getString(getContentResolver(), "android_id"));
        WifiManager wifiManager = (WifiManager) getSystemService("wifi");
        String macAddress = wifiManager.getConnectionInfo().getMacAddress();
        String str = macAddress;
        if (macAddress == null) {
            int i = 0;
            while (true) {
                str = macAddress;
                if (i > 5) {
                    break;
                }
                macAddress = wifiManager.getConnectionInfo().getMacAddress();
                if (macAddress != null) {
                    str = macAddress;
                    if (macAddress.length() > 0) {
                        break;
                    }
                }
                try {
                    Thread.sleep(FileUtils.FAT_FILE_TIMESTAMP_GRANULARITY);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                i++;
            }
        }
        String str2 = str;
        if (str != null) {
            str2 = str;
            if (str.equals("02:00:00:00:00:00")) {
                str2 = getMacAddr();
            }
        }
        String str3 = str2;
        if (str2 == null) {
            str3 = "";
        }
        sb.append("\nMACAddress = " + str3);
        return String.valueOf(toHexString(toMd5(sb.toString().getBytes()), "")) + ":" + str3.replaceAll(":", "");
    }

    public String ModifyPassword(String str, String str2, String str3) {
        String str4 = "";
        SharedPreferences sharedPreferences = getSharedPreferences("privatekey", 0);
        String string = sharedPreferences.getString("key", "");
        sharedPreferences.getString("apihost", "");
        String str5 = this.modifiedName;
        try {
            HttpPost httpPost = new HttpPost(JsonHelper.Update_Pwd_HTTPPOST_URL(this.modifiedIP));
            httpPost.addHeader("X-Edutech-Entity", str5);
            long currentTimeMillis = System.currentTimeMillis();
            httpPost.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + My_md5.Md5(String.valueOf(currentTimeMillis) + str5 + string));
            httpPost.addHeader("Accept-Encoding", "gzip,deflate");
            MultipartEntity multipartEntity = new MultipartEntity();
            multipartEntity.addPart("newPassWord", new StringBody(str3));
            multipartEntity.addPart("oldPassWord", new StringBody(str2));
            httpPost.setEntity(multipartEntity);
            str4 = getJsonStringFromGZIP(new DefaultHttpClient().execute(httpPost));
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
        return str4;
    }

    public void apkUpdate() {
        if (this.tvUpdateNow == null || this.tvUpdateNow.isEnabled()) {
            this.tvUpdateNow.setEnabled(false);
            this.tvUpdateNow.setText(getResources().getString(R.string.setting_updating));
            this.tvUpdateNow.setTextColor(getResources().getColor(R.color.gray));
            getWindow().addFlags(128);
            if (this.updateThread != null) {
                this.updateprogressThread = null;
                this.updateThread = null;
                isupdating = false;
                this.updateTime = HttpStatus.SC_MULTIPLE_CHOICES;
                return;
            }
            Message message = new Message();
            message.what = 4;
            this.installHandler.sendMessage(message);
            this.updateThread = new UpdateThread();
            this.updateThread.start();
            if (this.updateprogressThread == null && AppEnvironment.isNewUpdate) {
                this.updateprogressThread = new UpdateProgressThread();
                this.updateprogressThread.start();
            }
            if (this.progressDialog == null) {
                return;
            }
            isupdating = true;
            this.updateTime = 0;
            this.apkUpdateList = new ArrayList();
        }
    }

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    protected void attachBaseContext(Context context) {
        super.attachBaseContext(LanguageUtils.attachBaseContext(context, context.getSharedPreferences("language", 0).getString("language", "chinese")));
    }

    @Override // com.edutech.cloudclientsetting.activity.IPListAdapter.IpInterface
    public void deleteIp(String str) {
        if (this.ips == null) {
            return;
        }
        if (this.listpop != null && this.ipAdpter != null) {
            if (this.ips != null && this.ips.contains(str)) {
                this.ips.remove(str);
                this.ipAdpter.setIps(this.ips);
                this.ipAdpter.notifyDataSetChanged();
            }
            SharedPreferences sharedPreferences = getSharedPreferences("loginhistory", 4);
            sharedPreferences.edit().putString("iphistoryString", sharedPreferences.getString("iphistoryString", "").replace(String.valueOf(str) + ",:,", "").replace(str, "")).commit();
        }
        this.history_array = nameHistoryDeleteByIP(str, this.history_array);
    }

    @Override // com.edutech.cloudclientsetting.activity.NameListAdapter.NameHistoryInterface
    public void deleteName(String str) {
        String editable = this.ip_edit != null ? this.ip_edit.getText().toString() : "";
        if (editable.equals("") || this.history_array == null) {
            return;
        }
        this.history_array = nameHistoryDelete(editable, str, this.history_array);
        this.history_nameList = nameHistoryQuery(editable, this.history_array);
        if (this.nameListAdapter == null || this.history_nameList == null) {
            return;
        }
        this.nameListAdapter.setIps(this.history_nameList);
        this.nameListAdapter.notifyDataSetChanged();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        View currentFocus = getCurrentFocus();
        boolean dispatchTouchEvent = super.dispatchTouchEvent(motionEvent);
        if (currentFocus instanceof EditText) {
            View currentFocus2 = getCurrentFocus();
            int[] iArr = new int[2];
            currentFocus2.getLocationOnScreen(iArr);
            float rawX = (motionEvent.getRawX() + currentFocus2.getLeft()) - iArr[0];
            float rawY = (motionEvent.getRawY() + currentFocus2.getTop()) - iArr[1];
            if (motionEvent.getAction() == 1 && (rawX < currentFocus2.getLeft() || rawX >= currentFocus2.getRight() || rawY < currentFocus2.getTop() || rawY > currentFocus2.getBottom())) {
                ((InputMethodManager) getSystemService("input_method")).hideSoftInputFromWindow(getWindow().getCurrentFocus().getWindowToken(), 0);
            }
        }
        return dispatchTouchEvent;
    }

    @Override // android.app.Activity
    public void finish() {
        super.finish();
    }

    @SuppressLint({"NewApi"})
    public String getMacAddr() {
        String str;
        Iterator it;
        NetworkInterface networkInterface;
        try {
            it = Collections.list(NetworkInterface.getNetworkInterfaces()).iterator();
        } catch (Exception e) {
        }
        do {
            if (!it.hasNext()) {
                str = "";
                break;
            }
            networkInterface = (NetworkInterface) it.next();
        } while (!networkInterface.getName().equalsIgnoreCase("wlan0"));
        byte[] hardwareAddress = networkInterface.getHardwareAddress();
        if (hardwareAddress == null) {
            str = "";
        } else {
            StringBuilder sb = new StringBuilder();
            int length = hardwareAddress.length;
            for (int i = 0; i < length; i++) {
                sb.append(String.valueOf(Integer.toHexString(hardwareAddress[i] & 255)) + ":");
            }
            if (sb.length() > 0) {
                sb.deleteCharAt(sb.length() - 1);
            }
            str = sb.toString();
        }
        return str;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:14:0x004f -> B:49:0x001f). Please submit an issue!!! */
    public void loadXml() {
        Log.i(TAG, "loadXml");
        try {
            this.filein = new FileInputStream(FileInOutHelper.setupOrOpenFile(this.urlfilepath));
        } catch (FileNotFoundException e) {
            Log.e(TAG, "FileNotFoundException");
            e.printStackTrace();
        }
        try {
            XmlPullParser newPullParser = XmlPullParserFactory.newInstance().newPullParser();
            newPullParser.setInput(this.filein, "UTF-8");
            for (int eventType = newPullParser.getEventType(); eventType != 1; eventType = newPullParser.next()) {
                String name = newPullParser.getName();
                switch (eventType) {
                    case 2:
                        if ("ip".equals(name)) {
                            this.ipOrigal = newPullParser.nextText();
                            this.ip_edit.setText(this.ipOrigal);
                            this.modifiedIP = this.ipOrigal;
                        }
                        if ("username".equals(name)) {
                            try {
                                this.nameOrigal = BZip2Utils.Base64DecodeToString(newPullParser.nextText());
                                this.username_edit.setText(this.nameOrigal);
                                this.modifiedName = this.nameOrigal;
                            } catch (Exception e2) {
                                e2.printStackTrace();
                            }
                        }
                        if ("pwd".equals(name)) {
                            try {
                                this.pwdOrigal = BZip2Utils.Base64DecodeToString(newPullParser.nextText());
                                this.password_edit.setText(this.pwdOrigal);
                                break;
                            } catch (Exception e3) {
                                e3.printStackTrace();
                                break;
                            }
                        } else {
                            break;
                        }
                }
            }
        } catch (IOException e4) {
            e4.printStackTrace();
        } catch (IllegalArgumentException e5) {
        } catch (XmlPullParserException e6) {
            e6.printStackTrace();
        } catch (Exception e7) {
        }
        if (this.filein != null) {
            try {
                this.filein.close();
            } catch (IOException e8) {
                e8.printStackTrace();
            }
        }
    }

    public void loadidXml() {
        int i = Build.VERSION.SDK_INT;
        loadidXml1();
    }

    public void loadidXml1() {
        List<String> readIDFile;
        Log.i(TAG, "loadidXml");
        if (FileInOutHelper.setupOrOpenFile(idfilepath).length() > 0 && (readIDFile = ActivityBase.readIDFile()) != null) {
            String str = readIDFile.get(0);
            String str2 = readIDFile.get(1);
            String str3 = readIDFile.get(2);
            String str4 = readIDFile.get(3);
            String str5 = readIDFile.get(4);
            String str6 = readIDFile.get(5);
            if (str != null) {
                getSharedPreferences("idauthstring", 0).edit().putString("key", str).commit();
                this.idAuth_btn.setText(getResources().getString(R.string.registeragain));
            }
            if (str3.length() == 0 || str.length() == 0 || str2.length() == 0) {
                return;
            }
            int parseInt = Integer.parseInt(str3);
            StringBuilder sb = new StringBuilder();
            if (parseInt == 4) {
                sb.append("正式版:");
            } else if (parseInt == 5) {
                sb.append("测试版:");
            } else {
                sb.append("未注册");
            }
            if (parseInt == 4 || parseInt == 5) {
                sb.append(str);
            }
            if (str5.length() > 2) {
                sb.append("\n有效期限：" + str5);
            } else if (str5.length() == 1 && Integer.parseInt(str5) == 0) {
                sb.append("\n有效期限：无限制");
            }
            if (str4.length() > 0 && Integer.parseInt(str4) > 0) {
                if (str6.length() <= 0 || Integer.parseInt(str6) < 0) {
                    sb.append("\n授权次数：" + str4);
                } else {
                    sb.append("\n使用/授权次数：" + str6 + "/" + str4);
                }
            }
            this.idauth_edit.setHeight(50);
            String[] split = sb.toString().split("\n");
            if (split == null) {
                this.idauth_edit.setTextSize(18.0f);
            } else if (split.length == 1) {
                this.idauth_edit.setTextSize(15.0f);
            } else {
                this.idauth_edit.setTextSize(12.0f);
            }
            this.idauth_edit.setText(sb);
        }
    }

    public void loadidXml2() {
        File file = new File(Aduth.filepathMobileStudyClient_NEW);
        Log.e("setting", "auth:" + ((Object) null));
        if (!file.exists() || file.length() > 0) {
            List<String> readIDFile = com.edutech.idauthentication.FileUtils.readIDFile();
            Log.e("setting", "auth:" + readIDFile);
            if (readIDFile == null || readIDFile.size() <= 0) {
                return;
            }
            String str = readIDFile.get(0);
            String str2 = readIDFile.get(1);
            String str3 = readIDFile.get(2);
            String str4 = readIDFile.get(3);
            String str5 = readIDFile.get(4);
            String str6 = readIDFile.get(5);
            if (str != null) {
                getSharedPreferences("idauthstring", 0).edit().putString("key", str).commit();
                this.idAuth_btn.setText(getResources().getString(R.string.registeragain));
            }
            if (str3 == null || str == null || str3.length() == 0 || str.length() == 0 || str2.length() == 0) {
                return;
            }
            int parseInt = Integer.parseInt(str3);
            StringBuilder sb = new StringBuilder();
            if (parseInt == 4) {
                sb.append("正式版:");
            } else if (parseInt == 5) {
                sb.append("测试版:");
            } else {
                sb.append("未注册");
            }
            if (parseInt == 4 || parseInt == 5) {
                sb.append(str);
            }
            if (str5.length() > 2) {
                sb.append("\n有效期限：" + str5);
            } else if (str5.length() == 1 && Integer.parseInt(str5) == 0) {
                sb.append("\n有效期限：无限制");
            }
            if (str4.length() > 0 && Integer.parseInt(str4) > 0) {
                if (str6.length() <= 0 || Integer.parseInt(str6) < 0) {
                    sb.append("\n授权次数：" + str4);
                } else {
                    sb.append("\n使用/授权次数：" + str6 + "/" + str4);
                }
            }
            this.idauth_edit.setHeight(50);
            String[] split = sb.toString().split("\n");
            if (split == null) {
                this.idauth_edit.setTextSize(14.0f);
            } else if (split.length == 1) {
                this.idauth_edit.setTextSize(12.0f);
            } else {
                this.idauth_edit.setTextSize(10.0f);
            }
            this.idauth_edit.setSingleLine(false);
            this.idauth_edit.setText(sb.toString());
        }
    }

    @Override // com.edutech.cloudclientsetting.activity.IPListAdapter.IpInterface
    public void okIp(String str) {
        if (this.listpop != null) {
            this.listpop.dismiss();
        }
        if (this.ip_edit != null) {
            this.ip_edit.setText(str);
        }
    }

    @Override // com.edutech.cloudclientsetting.activity.NameListAdapter.NameHistoryInterface
    public void okName(String str) {
        if (this.nameListpop != null) {
            this.nameListpop.dismiss();
        }
        if (this.username_edit != null) {
            this.username_edit.setText(str);
        }
    }

    @Override // android.app.Activity
    public void onActivityResult(int i, int i2, Intent intent) {
        boolean z = false;
        super.onActivityResult(i, i2, intent);
        if (i != 3) {
            Toast.makeText(this, "ZXING_SCAN<>3", 0).show();
        } else if (i2 != -1) {
            Toast.makeText(this, "RESULT_NOT_OK", 0).show();
        } else {
            String stringExtra = intent.getStringExtra(Intents.Scan.RESULT);
            intent.getStringExtra(Intents.Scan.RESULT_FORMAT);
            if (this.id == null) {
                z = true;
            }
            Log.e("id", String.valueOf(z) + "," + (stringExtra == null ? "null" : stringExtra));
            if (stringExtra == null || this.id == null) {
                return;
            }
            this.id.setText(stringExtra);
        }
    }

    @Override // android.app.Activity
    public void onBackPressed() {
        super.onBackPressed();
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        PackageInfo packageInfo;
        Log.i(TAG, "onClick");
        switch (view.getId()) {
            case R.id.wifi_btn /* 2131362141 */:
                try {
                    packageInfo = getPackageManager().getPackageInfo(AppEnvironment.WIFI_PACKNAME, 0);
                } catch (PackageManager.NameNotFoundException e) {
                    packageInfo = null;
                    e.printStackTrace();
                }
                if (packageInfo == null) {
                    return;
                }
                ComponentName componentName = new ComponentName(AppEnvironment.WIFI_PACKNAME, "zte.com.wilink.wifi.WifiSettingActivity");
                Intent intent = new Intent();
                intent.setComponent(componentName);
                intent.addFlags(268435456);
                intent.setAction("android.intent.action.MAIN");
                intent.addCategory("android.intent.category.LAUNCHER");
                startActivity(intent);
                return;
            case R.id.btnTitleBack /* 2131362312 */:
                exit();
                return;
            case R.id.btnServiceControl /* 2131362313 */:
                showServiceDialog();
                return;
            case R.id.btnAppControl /* 2131362314 */:
                startActivity(new Intent(this, AppControlActivity.class));
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
                    View inflate = getLayoutInflater().inflate(R.layout.idauth_dialog_setting, (ViewGroup) findViewById(R.id.idauth_dialog));
                    this.id = (EditText) inflate.findViewById(R.id.idauth_dialog_id);
                    SharedPreferences sharedPreferences = getSharedPreferences("idauthstring", 0);
                    if (sharedPreferences.contains("key")) {
                        this.id.setText(sharedPreferences.getString("key", ""));
                    }
                    AlertDialog.Builder negativeButton = new AlertDialog.Builder(this).setTitle(getResources().getString(R.string.setting_sign)).setInverseBackgroundForced(true).setView(inflate).setPositiveButton(getResources().getString(R.string.setting_sign), new DialogInterface.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.19
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialogInterface, int i) {
                            if (CloudClientSetActivity.this.id.getText().toString().length() >= 16) {
                                new Thread(CloudClientSetActivity.this.downloadRun).start();
                                Message message = new Message();
                                message.what = 1000;
                                CloudClientSetActivity.this.resultHandler.sendMessageDelayed(message, 0L);
                            }
                            if (CloudClientSetActivity.this.registerDialog != null) {
                                CloudClientSetActivity.this.registerDialog.dismiss();
                                CloudClientSetActivity.this.registerDialog = null;
                            }
                        }
                    }).setNegativeButton(getResources().getString(R.string.setting_cancel), new DialogInterface.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.20
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialogInterface, int i) {
                            if (CloudClientSetActivity.this.registerDialog != null) {
                                CloudClientSetActivity.this.registerDialog.dismiss();
                                CloudClientSetActivity.this.registerDialog = null;
                            }
                        }
                    });
                    ((Button) inflate.findViewById(R.id.idscan_btn)).setOnClickListener(new View.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.21
                        @Override // android.view.View.OnClickListener
                        public void onClick(View view2) {
                            switch (view2.getId()) {
                                case R.id.idscan_btn /* 2131361940 */:
                                    Intent intent2 = new Intent(CloudClientSetActivity.this, MipcaActivityCapture.class);
                                    intent2.setFlags(67108864);
                                    CloudClientSetActivity.this.startActivityForResult(intent2, 3);
                                    return;
                                default:
                                    return;
                            }
                        }
                    });
                    this.registerDialog = negativeButton.create();
                }
                if (this.registerDialog == null) {
                    return;
                }
                this.registerDialog.show();
                return;
            case R.id.ok_btn /* 2131362330 */:
                this.btnTitleBack.setEnabled(false);
                this.ok_btn.setEnabled(false);
                this.ok_btn.setText(getResources().getString(R.string.setting_saving));
                this.JXHD_Ip = this.ip_edit.getText().toString().trim();
                if (!needPwdDialog()) {
                    new Thread(this.runnable_GetConfig_Infor).start();
                    return;
                }
                if (this.threadPwd == null) {
                    this.threadPwd = new HostPwd();
                    this.threadPwd.start();
                }
                showConfirmPwdDialog();
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

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getWindow().setFlags(1024, 1024);
        String string = getSharedPreferences("language", 0).getString("language", "chinese");
        if (!string.equals("en")) {
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
        this.mBluetooth = BluetoothAdapter.getDefaultAdapter();
        this.btnbluetoothControl = (Button) findViewById(R.id.btnbluetoothControl);
        if (this.mBluetooth == null || !this.mBluetooth.isEnabled()) {
            this.btnbluetoothControl.setText("开启蓝牙");
        } else {
            this.btnbluetoothControl.setText("关闭蓝牙");
        }
        this.btnbluetoothControl.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.13
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Intent intent = new Intent("/");
                intent.setComponent(new ComponentName("com.android.settings", "com.android.settings.Settings$DeviceInfoSettingsActivity"));
                intent.setAction("android.intent.action.VIEW");
                CloudClientSetActivity.this.mContext.startActivity(intent);
            }
        });
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
        if (string.equals("en")) {
            this.language_t.setText(getResources().getString(R.string.setenglish));
        } else {
            this.language_t.setText(getResources().getString(R.string.setchinese));
        }
        this.languageSw.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.CloudClientSetActivity.14
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                CloudClientSetActivity.this.showLanguageChooseDialog();
            }
        });
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
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.PACKAGE_ADDED");
        intentFilter.addDataScheme("package");
        registerReceiver(this.installReceiver, intentFilter);
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

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i == 4) {
            closeProgressDialog();
            resetUpdateInfo();
        }
        return super.onKeyDown(i, keyEvent);
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        loadXml();
        loadidXml();
        this.isover = false;
        Log.e("onresume", "onresume");
        if (this.progressDialog == null || this.apkUpdateList == null || this.apkUpdateList.size() <= 0) {
            return;
        }
        try {
            this.progressDialog.setData(this.apkUpdateList);
        } catch (Exception e) {
        }
    }

    public void showToast(String str) {
        if (this.mToast != null) {
            this.mToast.cancel();
        }
        this.mToast = Toast.makeText(this, str, 1);
        this.mToast.show();
    }
}
