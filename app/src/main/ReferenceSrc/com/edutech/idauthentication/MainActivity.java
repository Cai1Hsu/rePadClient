package com.edutech.idauthentication;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.util.Xml;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.ScrollView;
import android.widget.TextView;
import com.edutech.publicedu.log.LogHelp;
import com.edutech.utils.InstallApkHelper;
import com.edutech.utils.NetWorkHelper;
import com.edutech.utils.SystemInfoHelper;
import com.edutech.utils.XmlLoadHelper;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.apache.commons.net.imap.IMAPSClient;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpHead;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.util.DateUtils;
import org.bson.BSON;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: classes.dex */
public class MainActivity {
    private Button btnYes;
    public Context mContext;
    private ScrollView scrollView;
    private static String filepath = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/CloudClient/.System/idau.xml";
    private static File idfile = new File(filepath);
    private static String rightFilePath = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/CloudClient/.System/copyright.xml";
    private static File rightFile = new File(rightFilePath);
    public static ArrayList<Map<String, Async>> apkTaskList = new ArrayList<>();
    public static ArrayList<String> apkfinList = null;
    public static ArrayList<HashMap<String, String>> apkdownloadlist = new ArrayList<>();
    public static String selfpackageName = "";
    public static String seed = "Edutech@2013";
    public static boolean isDown = false;
    public static boolean isUpdatePwd = false;
    public Thread apkUpdateThread = null;
    private Handler handler = new Handler() { // from class: com.edutech.idauthentication.MainActivity.1
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    InstallApkHelper installapk = new InstallApkHelper(MainActivity.this, MainActivity.selfpackageName);
                    installapk.InstallAll();
                    MainActivity.isDown = false;
                    break;
            }
            super.handleMessage(msg);
        }
    };
    Runnable apkUpdateRunnable = new Runnable() { // from class: com.edutech.idauthentication.MainActivity.2
        @Override // java.lang.Runnable
        public void run() {
            if (MainActivity.selfpackageName != null) {
                HashMap<String, String> hashmap = XmlLoadHelper.loadIpXml();
                String ip = hashmap.get("ip");
                String username = hashmap.get("username");
                if (ip != null && username != null && !"".equals(ip) && !"".equals(username)) {
                    String url = AppEnvironment.SETTING_APK_UPDATE_HTTPPOST_URL(ip, username);
                    File edutechDir = new File(AppEnvironment.FOLDER_EDUTECH);
                    if (edutechDir.exists()) {
                        try {
                            FileInOutHelper.deleteDir(edutechDir);
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    String json = MainActivity.this.getUpdateJson(url);
                    ArrayList<HashMap<String, String>> jsonAppInfoList = new ArrayList<>();
                    if (json != null && !"".equals(json)) {
                        jsonAppInfoList = JsonHelper.dataParse(jsonAppInfoList, json);
                    }
                    File file = new File(String.valueOf(AppEnvironment.FOLDER_EDUTECH) + "apk.json");
                    ArrayList<HashMap<String, String>> localjsonAppInfoList = new ArrayList<>();
                    if (file.exists()) {
                        String localjson = JsonHelper.getFileString(String.valueOf(AppEnvironment.FOLDER_EDUTECH) + "apk.json");
                        localjsonAppInfoList = JsonHelper.dataParse(localjsonAppInfoList, localjson);
                    }
                    ArrayList<HashMap<String, String>> localAppInfoList = new ArrayList<>();
                    ArrayList<HashMap<String, String>> localAppInfoList2 = SystemInfoHelper.getSystemInfo(localAppInfoList, MainActivity.this.mContext);
                    File apkjsonFile = new File(String.valueOf(AppEnvironment.FOLDER_EDUTECH) + "apkinfo.json");
                    if (!apkjsonFile.exists()) {
                        FileInOutHelper.createNewFile(apkjsonFile);
                    }
                    JsonHelper.CreateFile(json, String.valueOf(AppEnvironment.FOLDER_EDUTECH) + "apkinfo.json");
                    SystemInfoHelper.compareAppInfo(MainActivity.apkdownloadlist, jsonAppInfoList, localjsonAppInfoList, localAppInfoList2);
                    Iterator<HashMap<String, String>> it = MainActivity.apkdownloadlist.iterator();
                    while (it.hasNext()) {
                        it.next().put("redownload_count", "0");
                    }
                    MainActivity.apkfinList = new ArrayList<>();
                    SystemInfoHelper.startDownLoadList(MainActivity.apkdownloadlist, MainActivity.apkTaskList);
                    int i = 0;
                    while (MainActivity.apkdownloadlist.size() > 0) {
                        try {
                            Thread.sleep(3000L);
                        } catch (InterruptedException e2) {
                            e2.printStackTrace();
                        }
                        if (MainActivity.apkfinList.size() > 0 && i != MainActivity.apkfinList.size()) {
                            i = MainActivity.apkfinList.size();
                            Iterator<HashMap<String, String>> it2 = jsonAppInfoList.iterator();
                            while (it2.hasNext()) {
                                HashMap<String, String> temp = it2.next();
                                Iterator<String> it3 = MainActivity.apkfinList.iterator();
                                while (it3.hasNext()) {
                                    String temp1 = it3.next();
                                    String path = String.valueOf(AppEnvironment.FOLDER_EDUTECH) + temp.get("appname");
                                    if (path.equals(temp1)) {
                                        temp.put("is_down_finish", LogHelp.TYPE_GUIDANCE);
                                    }
                                }
                            }
                        }
                        if (MainActivity.apkTaskList.size() < 5) {
                            SystemInfoHelper.startDownLoadList(MainActivity.apkdownloadlist, MainActivity.apkTaskList);
                        }
                    }
                    if (MainActivity.apkdownloadlist.size() == 0 && MainActivity.apkfinList.size() > 0) {
                        Message message = new Message();
                        message.what = 1;
                        MainActivity.this.handler.sendMessage(message);
                    }
                }
            }
        }
    };
    DialogInterface.OnKeyListener keylistener = new DialogInterface.OnKeyListener() { // from class: com.edutech.idauthentication.MainActivity.3
        @Override // android.content.DialogInterface.OnKeyListener
        public boolean onKey(DialogInterface dialog, int keyCode, KeyEvent event) {
            return keyCode == 4 && event.getRepeatCount() == 0;
        }
    };

    public MainActivity(Context context) {
        this.mContext = null;
        this.mContext = context;
    }

    public int checkIDAuth() {
        if (!idfile.exists() || idfile.length() <= 0) {
            return 1;
        }
        List<String> idInfo = readIDFile();
        if (idInfo != null) {
            String idString = idInfo.get(0);
            String machineID = idInfo.get(1);
            String resultString = idInfo.get(2);
            String times = idInfo.get(3);
            String date = idInfo.get(4);
            String usedTimes = idInfo.get(5);
            if (idString == null || idString.length() < 16) {
                return 3;
            }
            if (machineID == null || machineID.length() < 32 || !machineID.equals(GetMachineID())) {
                return 4;
            }
            if (resultString == null || resultString.length() <= 0 || (!resultString.equals("4") && !resultString.equals("5"))) {
                return 5;
            }
            Date curretDate = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat(DateUtils.ISO8601_DATE_PATTERN);
            Date authDate = null;
            if (date != null && date.length() >= 10) {
                try {
                    authDate = sdf.parse(date);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                if (authDate == null || curretDate.after(authDate)) {
                    return 6;
                }
            }
            if (times != null && times.length() > 0 && Integer.parseInt(times) > 0 && usedTimes != null && usedTimes.length() > 0) {
                if (Integer.parseInt(times) <= Integer.parseInt(usedTimes)) {
                    return 7;
                }
                if (Integer.parseInt(times) > 0) {
                    int usedTimesInt = Integer.parseInt(usedTimes) + 1;
                    writeidFile(idString, Integer.parseInt(resultString), times, date, String.valueOf(usedTimesInt));
                }
            }
            return 0;
        }
        return 2;
    }

    public void addUsedTimes() {
        List<String> idInfo;
        if (idfile.exists() && idfile.length() > 0 && (idInfo = readIDFile()) != null) {
            String idString = idInfo.get(0);
            idInfo.get(1);
            String resultString = idInfo.get(2);
            String times = idInfo.get(3);
            String date = idInfo.get(4);
            String usedTimes = idInfo.get(5);
            int usedTimesInt = Integer.parseInt(usedTimes) + 1;
            writeidFile(idString, Integer.parseInt(resultString), times, date, String.valueOf(usedTimesInt));
        }
    }

    public static final List<String> readIDFile() {
        List<String> idInfo = new ArrayList<>();
        String idString = null;
        String machineID = null;
        String resultString = null;
        String times = null;
        String date = null;
        String usedTimes = null;
        FileInputStream filein = null;
        try {
            FileInputStream filein2 = new FileInputStream(idfile);
            filein = filein2;
        } catch (FileNotFoundException e1) {
            e1.printStackTrace();
        }
        try {
            XmlPullParserFactory pullParserFactory = XmlPullParserFactory.newInstance();
            XmlPullParser xmlPullParser = pullParserFactory.newPullParser();
            xmlPullParser.setInput(filein, "UTF-8");
            for (int eventType = xmlPullParser.getEventType(); eventType != 1; eventType = xmlPullParser.next()) {
                String nodeName = xmlPullParser.getName();
                switch (eventType) {
                    case 2:
                        if ("a1".equals(nodeName)) {
                            idString = xmlPullParser.nextText();
                        }
                        if ("b2".equals(nodeName)) {
                            machineID = xmlPullParser.nextText();
                        }
                        if ("c3".equals(nodeName)) {
                            resultString = xmlPullParser.nextText();
                        }
                        if ("d4".equals(nodeName)) {
                            times = xmlPullParser.nextText();
                        }
                        if ("e5".equals(nodeName)) {
                            date = xmlPullParser.nextText();
                        }
                        if ("f6".equals(nodeName)) {
                            usedTimes = xmlPullParser.nextText();
                            continue;
                        } else {
                            continue;
                        }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (XmlPullParserException e2) {
            e2.printStackTrace();
        }
        try {
            filein.close();
        } catch (IOException e12) {
            e12.printStackTrace();
        }
        idInfo.add("");
        idInfo.add("");
        idInfo.add("");
        idInfo.add("");
        idInfo.add("");
        idInfo.add("");
        if (idString != null) {
            try {
                idInfo.set(0, AES.decrypt(seed, idString));
            } catch (Exception e3) {
                e3.printStackTrace();
            }
        }
        if (machineID != null) {
            idInfo.set(1, AES.decrypt(seed, machineID));
        }
        if (resultString != null) {
            idInfo.set(2, AES.decrypt(seed, resultString));
        }
        if (times != null) {
            idInfo.set(3, AES.decrypt(seed, times));
        }
        if (date != null) {
            idInfo.set(4, AES.decrypt(seed, date));
        }
        if (usedTimes != null) {
            idInfo.set(5, AES.decrypt(seed, usedTimes));
        }
        return idInfo;
    }

    public void writeidFile(String idString, int result, String times, String date, String usedTimes) {
        FileOutputStream fileos = null;
        String hasUsedTimes = usedTimes;
        if (idfile.exists()) {
            if (usedTimes.equals("0")) {
                List<String> idInfo = readIDFile();
                if (idInfo.get(0).equals(idString) && idInfo.get(5) != null && idInfo.get(5).length() > 0) {
                    hasUsedTimes = idInfo.get(5);
                }
            }
            idfile.delete();
        }
        idfile = FileInOutHelper.setupOrOpenFile(filepath);
        try {
            FileOutputStream fileos2 = new FileOutputStream(idfile);
            fileos = fileos2;
        } catch (FileNotFoundException e) {
        }
        XmlSerializer serializer = Xml.newSerializer();
        try {
            serializer.setOutput(fileos, "UTF-8");
            serializer.startDocument(null, true);
            serializer.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
            serializer.startTag(null, "id");
            serializer.startTag(null, "a1");
            serializer.text(AES.encrypt(seed, idString));
            serializer.endTag(null, "a1");
            serializer.startTag(null, "b2");
            serializer.text(AES.encrypt(seed, GetMachineID()));
            serializer.endTag(null, "b2");
            serializer.startTag(null, "c3");
            serializer.text(AES.encrypt(seed, String.valueOf(result)));
            serializer.endTag(null, "c3");
            serializer.startTag(null, "d4");
            serializer.text(AES.encrypt(seed, times));
            serializer.endTag(null, "d4");
            serializer.startTag(null, "e5");
            serializer.text(AES.encrypt(seed, date));
            serializer.endTag(null, "e5");
            serializer.startTag(null, "f6");
            serializer.text(AES.encrypt(seed, hasUsedTimes));
            serializer.endTag(null, "f6");
            serializer.endTag(null, "id");
            serializer.endDocument();
            serializer.flush();
            fileos.close();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

    public final String getIDAuth() {
        return null;
    }

    public final String GetMachineID() {
        String m_szWLANMAC;
        TelephonyManager tm = (TelephonyManager) this.mContext.getSystemService("phone");
        StringBuilder sb = new StringBuilder();
        sb.append("\nModel = " + Build.MODEL);
        sb.append("\nSerialNumber = " + Build.SERIAL);
        sb.append("\nDeviceId(IMEI) = " + tm.getDeviceId());
        String android_id = Settings.Secure.getString(this.mContext.getContentResolver(), "android_id");
        sb.append("\nAndroidID = " + android_id);
        try {
            WifiManager wm = (WifiManager) this.mContext.getSystemService("wifi");
            m_szWLANMAC = wm.getConnectionInfo().getMacAddress();
        } catch (NullPointerException e) {
            m_szWLANMAC = "";
        } catch (Exception e2) {
            m_szWLANMAC = "";
        }
        if (m_szWLANMAC == null || m_szWLANMAC.equals("")) {
            for (int i = 0; i <= 5; i++) {
                try {
                    WifiManager wm2 = (WifiManager) this.mContext.getSystemService("wifi");
                    m_szWLANMAC = wm2.getConnectionInfo().getMacAddress();
                } catch (NullPointerException e3) {
                    m_szWLANMAC = "";
                } catch (Exception e4) {
                    m_szWLANMAC = "";
                }
                if (m_szWLANMAC != null && m_szWLANMAC.length() > 0) {
                    break;
                }
                try {
                    Thread.sleep(org.apache.tools.ant.util.FileUtils.FAT_FILE_TIMESTAMP_GRANULARITY);
                } catch (InterruptedException e5) {
                    e5.printStackTrace();
                }
            }
        }
        if (m_szWLANMAC == null) {
            m_szWLANMAC = "";
        }
        sb.append("\nMACAddress = " + m_szWLANMAC);
        return String.valueOf(toHexString(toMd5(sb.toString().getBytes()), "")) + ":" + m_szWLANMAC.replaceAll(":", "");
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

    private HttpClient sslClient(HttpClient client) {
        try {
            X509TrustManager tm = new X509TrustManager() { // from class: com.edutech.idauthentication.MainActivity.4
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
            };
            SSLContext ctx = SSLContext.getInstance(IMAPSClient.DEFAULT_PROTOCOL);
            ctx.init(null, new TrustManager[]{tm}, null);
            SSLSocketFactory ssf = new MySSLSocketFactory(ctx);
            ssf.setHostnameVerifier(SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
            ClientConnectionManager ccm = client.getConnectionManager();
            SchemeRegistry sr = ccm.getSchemeRegistry();
            sr.register(new Scheme("https", ssf, 443));
            return new DefaultHttpClient(ccm, client.getParams());
        } catch (Exception e) {
            return null;
        }
    }

    public String getStuId(String userName) {
        return JsonHelper.idXmlParse(userName);
    }

    public void saveStuId(String userName, String stuId) {
        JsonHelper.idXmlCreate(userName, stuId);
    }

    public LogInfo alogparserJson(String studentId, String machineId, LogInfo loginfo, String json) {
        return JsonHelper.alogparserJson(studentId, machineId, loginfo, json);
    }

    public String logscreateJson(LogInfo loginfo, String logPath) {
        String Logjson = JsonHelper.logscreateJson(loginfo, logPath);
        return Logjson;
    }

    public void logPostHttp(String ip, String logPath) {
        PostThreadHelper.logPostHttp(ip, logPath);
    }

    public LogInfo getExamLog(LogInfo loginfo, String MachineID, String Type, String UserID, String SubjectID, String BookID, String BookName, String AssetsID, String AssetsName) {
        return JsonHelper.getExamLog(loginfo, MachineID, Type, UserID, SubjectID, BookID, BookName, AssetsID, AssetsName);
    }

    public boolean goBackError(String errorMessage, String jsName) {
        return OnConsoleHelper.goBackError(errorMessage, jsName);
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [com.edutech.idauthentication.MainActivity$5] */
    public void settingPwdUpdateHttp() {
        if (!isUpdatePwd) {
            isUpdatePwd = true;
            new Thread() { // from class: com.edutech.idauthentication.MainActivity.5
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    HashMap<String, String> hashmap = XmlLoadHelper.loadIpXml();
                    String ip = hashmap.get("ip");
                    String username = hashmap.get("username");
                    if (ip != null && username != null && !"".equals(ip) && !"".equals(username)) {
                        String url = AppEnvironment.SETTING_PWD_UPDATE_HTTPPOST_URL(ip, username);
                        String json = MainActivity.this.getUpdateJson(url);
                        String password = JsonHelper.parseSetPwdReturnJson(json);
                        if (password != null && !"".equals(password)) {
                            MainActivity.this.settingPwdUpdate("0", password);
                        }
                        MainActivity.isUpdatePwd = false;
                    }
                }
            }.start();
        }
    }

    public void settingPwdUpdate(String type, String password) {
        PostThreadHelper.savdSettingPwd(type, password);
    }

    public String getSettingPwd() {
        String password;
        ArrayList<HashMap<String, String>> settinginfo = XmlLoadHelper.loadXml(new ArrayList<>());
        String password2 = "";
        if (settinginfo.size() == 1) {
            password = settinginfo.get(0).get(AppEnvironment.PASSWORD);
        } else {
            if (settinginfo.size() >= 2) {
                for (int i = 0; i < settinginfo.size(); i++) {
                    String isNew = settinginfo.get(i).get(AppEnvironment.ISNEW);
                    if (isNew != null && isNew.equals(LogHelp.TYPE_GUIDANCE)) {
                        password2 = settinginfo.get(i).get(AppEnvironment.PASSWORD);
                    }
                }
            }
            password = password2;
        }
        if (password == null || "".equals(password)) {
            return password;
        }
        AESSet aesSetting = new AESSet();
        try {
            return new String(aesSetting.decrypt(password), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return "";
        } catch (Exception e2) {
            e2.printStackTrace();
            return "";
        }
    }

    public void apkUpdate(String packagename) {
        selfpackageName = packagename;
        if (!isDown) {
            isDown = true;
            if (this.apkUpdateThread == null) {
                this.apkUpdateThread = new Thread(this.apkUpdateRunnable);
            }
            if (!this.apkUpdateThread.isAlive()) {
                this.apkUpdateThread.start();
            }
        }
    }

    public String getUpdateJson(String url) {
        int netCount = 0;
        while (netCount < 6 && !NetWorkHelper.isNetworkConnected(this.mContext)) {
            netCount++;
            try {
                Thread.sleep(5000L);
            } catch (InterruptedException e1) {
                e1.printStackTrace();
            }
        }
        Log.e(MagicNames.ANT_FILE_TYPE_URL, url);
        String json = PostThreadHelper.postHttp(url);
        int i = 0;
        while (i < 6 && (json == null || "".equals(json))) {
            try {
                Thread.sleep(5000L);
                i++;
                json = PostThreadHelper.postHttp(url);
            } catch (InterruptedException e12) {
                e12.printStackTrace();
            }
        }
        return json;
    }

    public void getAppInfo() {
        ArrayList<HashMap<String, String>> appInfoList = new ArrayList<>();
        SystemInfoHelper.getSystemInfo(appInfoList, this.mContext);
    }

    public void InstallApk() {
        InstallApkHelper installapk = new InstallApkHelper(this, selfpackageName);
        installapk.InstallAll();
    }

    public boolean checkNotFoundUrl(String url) {
        int status = -1;
        try {
            if (url.startsWith("http://")) {
                HttpUriRequest head = new HttpHead(url);
                HttpClient client = new DefaultHttpClient();
                HttpResponse resp = client.execute(head);
                status = resp.getStatusLine().getStatusCode();
            }
        } catch (Exception e) {
        }
        return status == 404 || status == 500;
    }

    public void clearTimer(Timer mTimer, TimerTask mTimerTask) {
        if (mTimer != null) {
            if (mTimerTask != null) {
                mTimerTask.cancel();
                return;
            }
            return;
        }
        new Timer(true);
    }

    public long setStartLoadingTime() {
        return 3000L;
    }

    public long setStartLogSendTime(boolean isUnUpLog) {
        if (!isUnUpLog) {
            return 43200000L;
        }
        return 3600000L;
    }

    public void userLicenseAgreementDialog() {
        View view = View.inflate(this.mContext, R.layout.layout_userlicense, null);
        this.btnYes = (Button) view.findViewById(R.id.btnYes);
        Button btnCancle = (Button) view.findViewById(R.id.btnCancle);
        TextView tvUserLiceseContent = (TextView) view.findViewById(R.id.tvUserLiceseContent);
        this.scrollView = (ScrollView) view.findViewById(R.id.ScrollView);
        tvUserLiceseContent.setText(getDataFromAssets("UserLicenseAgreement.txt"));
        if (!rightFile.exists()) {
            final AlertDialog dialog = new AlertDialog.Builder(this.mContext).setTitle("用户最终许可协议").setView(view).setOnKeyListener(this.keylistener).setCancelable(false).show();
            this.scrollView.setOnTouchListener(new TouchListenerImpl(this, null));
            this.btnYes.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.idauthentication.MainActivity.6
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    FileInOutHelper.setupOrOpenFile(MainActivity.rightFilePath);
                    dialog.dismiss();
                }
            });
            btnCancle.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.idauthentication.MainActivity.7
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    ((Activity) MainActivity.this.mContext).finish();
                }
            });
        }
    }

    /* loaded from: classes.dex */
    private class TouchListenerImpl implements View.OnTouchListener {
        private TouchListenerImpl() {
            MainActivity.this = r1;
        }

        /* synthetic */ TouchListenerImpl(MainActivity mainActivity, TouchListenerImpl touchListenerImpl) {
            this();
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View view, MotionEvent motionEvent) {
            switch (motionEvent.getAction()) {
                case 2:
                    int scrollY = view.getScrollY();
                    int height = view.getHeight();
                    int scrollViewMeasuredHeight = MainActivity.this.scrollView.getChildAt(0).getMeasuredHeight();
                    if (scrollViewMeasuredHeight > 20) {
                        scrollViewMeasuredHeight -= 20;
                    }
                    if (scrollY + height > scrollViewMeasuredHeight) {
                        MainActivity.this.btnYes.setEnabled(true);
                        break;
                    }
                    break;
            }
            return false;
        }
    }

    public String getDataFromAssets(String filePath) {
        Throwable th;
        BufferedReader br = null;
        StringBuffer sb = new StringBuffer();
        try {
            try {
                BufferedReader br2 = new BufferedReader(new InputStreamReader(this.mContext.getAssets().open(filePath)));
                while (true) {
                    try {
                        String line = br2.readLine();
                        if (line != null) {
                            sb.append(String.valueOf(line) + "\n");
                        } else {
                            try {
                                break;
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                    } catch (IOException e2) {
                        e = e2;
                        br = br2;
                        e.printStackTrace();
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
                e = e5;
            }
            return sb.toString();
        } catch (Throwable th3) {
            th = th3;
        }
    }
}
