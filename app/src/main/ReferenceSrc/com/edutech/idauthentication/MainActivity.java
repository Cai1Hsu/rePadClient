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
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpHead;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.util.DateUtils;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: classes.jar:com/edutech/idauthentication/MainActivity.class */
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
        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    new InstallApkHelper(MainActivity.this, MainActivity.selfpackageName).InstallAll();
                    MainActivity.isDown = false;
                    break;
            }
            super.handleMessage(message);
        }
    };
    Runnable apkUpdateRunnable = new Runnable() { // from class: com.edutech.idauthentication.MainActivity.2
        @Override // java.lang.Runnable
        public void run() {
            if (MainActivity.selfpackageName != null) {
                HashMap<String, String> loadIpXml = XmlLoadHelper.loadIpXml();
                String str = loadIpXml.get("ip");
                String str2 = loadIpXml.get("username");
                if (str == null || str2 == null || "".equals(str) || "".equals(str2)) {
                    return;
                }
                String SETTING_APK_UPDATE_HTTPPOST_URL = AppEnvironment.SETTING_APK_UPDATE_HTTPPOST_URL(str, str2);
                File file = new File(AppEnvironment.FOLDER_EDUTECH);
                if (file.exists()) {
                    try {
                        FileInOutHelper.deleteDir(file);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                String updateJson = MainActivity.this.getUpdateJson(SETTING_APK_UPDATE_HTTPPOST_URL);
                ArrayList<HashMap<String, String>> arrayList = new ArrayList<>();
                ArrayList<HashMap<String, String>> arrayList2 = arrayList;
                if (updateJson != null) {
                    arrayList2 = arrayList;
                    if (!"".equals(updateJson)) {
                        arrayList2 = JsonHelper.dataParse(arrayList, updateJson);
                    }
                }
                File file2 = new File(String.valueOf(AppEnvironment.FOLDER_EDUTECH) + "apk.json");
                ArrayList<HashMap<String, String>> arrayList3 = new ArrayList<>();
                ArrayList<HashMap<String, String>> arrayList4 = arrayList3;
                if (file2.exists()) {
                    arrayList4 = JsonHelper.dataParse(arrayList3, JsonHelper.getFileString(String.valueOf(AppEnvironment.FOLDER_EDUTECH) + "apk.json"));
                }
                ArrayList<HashMap<String, String>> systemInfo = SystemInfoHelper.getSystemInfo(new ArrayList(), MainActivity.this.mContext);
                File file3 = new File(String.valueOf(AppEnvironment.FOLDER_EDUTECH) + "apkinfo.json");
                if (!file3.exists()) {
                    FileInOutHelper.createNewFile(file3);
                }
                JsonHelper.CreateFile(updateJson, String.valueOf(AppEnvironment.FOLDER_EDUTECH) + "apkinfo.json");
                SystemInfoHelper.compareAppInfo(MainActivity.apkdownloadlist, arrayList2, arrayList4, systemInfo);
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
                    int i2 = i;
                    if (MainActivity.apkfinList.size() > 0) {
                        i2 = i;
                        if (i != MainActivity.apkfinList.size()) {
                            i2 = MainActivity.apkfinList.size();
                            Iterator<HashMap<String, String>> it2 = arrayList2.iterator();
                            while (it2.hasNext()) {
                                HashMap<String, String> next = it2.next();
                                Iterator<String> it3 = MainActivity.apkfinList.iterator();
                                while (it3.hasNext()) {
                                    if ((String.valueOf(AppEnvironment.FOLDER_EDUTECH) + next.get("appname")).equals(it3.next())) {
                                        next.put("is_down_finish", LogHelp.TYPE_GUIDANCE);
                                    }
                                }
                            }
                        }
                    }
                    i = i2;
                    if (MainActivity.apkTaskList.size() < 5) {
                        SystemInfoHelper.startDownLoadList(MainActivity.apkdownloadlist, MainActivity.apkTaskList);
                        i = i2;
                    }
                }
                if (MainActivity.apkdownloadlist.size() != 0 || MainActivity.apkfinList.size() <= 0) {
                    return;
                }
                Message message = new Message();
                message.what = 1;
                MainActivity.this.handler.sendMessage(message);
            }
        }
    };
    DialogInterface.OnKeyListener keylistener = new DialogInterface.OnKeyListener() { // from class: com.edutech.idauthentication.MainActivity.3
        @Override // android.content.DialogInterface.OnKeyListener
        public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
            return i == 4 && keyEvent.getRepeatCount() == 0;
        }
    };

    /* loaded from: classes.jar:com/edutech/idauthentication/MainActivity$TouchListenerImpl.class */
    private class TouchListenerImpl implements View.OnTouchListener {
        private TouchListenerImpl() {
            MainActivity.this = r4;
        }

        /* synthetic */ TouchListenerImpl(MainActivity mainActivity, TouchListenerImpl touchListenerImpl) {
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
                    int measuredHeight = MainActivity.this.scrollView.getChildAt(0).getMeasuredHeight();
                    int i = measuredHeight;
                    if (measuredHeight > 20) {
                        i = measuredHeight - 20;
                    }
                    if (scrollY + height <= i) {
                        return false;
                    }
                    MainActivity.this.btnYes.setEnabled(true);
                    return false;
            }
        }
    }

    public MainActivity(Context context) {
        this.mContext = null;
        this.mContext = context;
    }

    public static final List<String> readIDFile() {
        ArrayList arrayList = new ArrayList();
        String str = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        String str6 = null;
        FileInputStream fileInputStream = null;
        try {
            fileInputStream = new FileInputStream(idfile);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        String str7 = null;
        String str8 = null;
        String str9 = null;
        String str10 = null;
        String str11 = null;
        String str12 = null;
        String str13 = null;
        String str14 = null;
        String str15 = null;
        String str16 = null;
        String str17 = null;
        String str18 = null;
        try {
            XmlPullParser newPullParser = XmlPullParserFactory.newInstance().newPullParser();
            newPullParser.setInput(fileInputStream, "UTF-8");
            int eventType = newPullParser.getEventType();
            while (eventType != 1) {
                str7 = str5;
                str8 = str;
                str9 = str2;
                str10 = str3;
                str11 = str4;
                str12 = str6;
                str13 = str5;
                str14 = str;
                str15 = str2;
                str16 = str3;
                str17 = str4;
                str18 = str6;
                String name = newPullParser.getName();
                String str19 = str5;
                String str20 = str;
                String str21 = str2;
                String str22 = str3;
                String str23 = str4;
                String str24 = str6;
                switch (eventType) {
                    case 0:
                    case 1:
                    case 3:
                        break;
                    case 2:
                        String str25 = str;
                        if ("a1".equals(name)) {
                            String str26 = str5;
                            str25 = newPullParser.nextText();
                        }
                        String str27 = str2;
                        if ("b2".equals(name)) {
                            String str28 = str5;
                            str27 = newPullParser.nextText();
                        }
                        String str29 = str3;
                        if ("c3".equals(name)) {
                            String str30 = str5;
                            str29 = newPullParser.nextText();
                        }
                        String str31 = str4;
                        if ("d4".equals(name)) {
                            String str32 = str5;
                            str31 = newPullParser.nextText();
                        }
                        String str33 = str5;
                        if ("e5".equals(name)) {
                            String str34 = str5;
                            str33 = newPullParser.nextText();
                        }
                        str19 = str33;
                        str20 = str25;
                        str21 = str27;
                        str22 = str29;
                        str23 = str31;
                        str24 = str6;
                        if ("f6".equals(name)) {
                            String str35 = str33;
                            str24 = newPullParser.nextText();
                            str19 = str33;
                            str20 = str25;
                            str21 = str27;
                            str22 = str29;
                            str23 = str31;
                            break;
                        }
                        break;
                    default:
                        str24 = str6;
                        str23 = str4;
                        str22 = str3;
                        str21 = str2;
                        str20 = str;
                        str19 = str5;
                        break;
                }
                eventType = newPullParser.next();
                str5 = str19;
                str = str20;
                str2 = str21;
                str3 = str22;
                str4 = str23;
                str6 = str24;
            }
        } catch (IOException e2) {
            e2.printStackTrace();
            str5 = str13;
            str = str14;
            str2 = str15;
            str3 = str16;
            str4 = str17;
            str6 = str18;
        } catch (XmlPullParserException e3) {
            e3.printStackTrace();
            str5 = str7;
            str = str8;
            str2 = str9;
            str3 = str10;
            str4 = str11;
            str6 = str12;
        }
        try {
            fileInputStream.close();
        } catch (IOException e4) {
            e4.printStackTrace();
        }
        arrayList.add("");
        arrayList.add("");
        arrayList.add("");
        arrayList.add("");
        arrayList.add("");
        arrayList.add("");
        if (str != null) {
            try {
                arrayList.set(0, AES.decrypt(seed, str));
            } catch (Exception e5) {
                e5.printStackTrace();
            }
        }
        if (str2 != null) {
            arrayList.set(1, AES.decrypt(seed, str2));
        }
        if (str3 != null) {
            arrayList.set(2, AES.decrypt(seed, str3));
        }
        if (str4 != null) {
            arrayList.set(3, AES.decrypt(seed, str4));
        }
        if (str5 != null) {
            arrayList.set(4, AES.decrypt(seed, str5));
        }
        if (str6 != null) {
            arrayList.set(5, AES.decrypt(seed, str6));
        }
        return arrayList;
    }

    private HttpClient sslClient(HttpClient httpClient) {
        DefaultHttpClient defaultHttpClient;
        try {
            X509TrustManager x509TrustManager = new X509TrustManager() { // from class: com.edutech.idauthentication.MainActivity.4
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

    /* JADX WARN: Code restructure failed: missing block: B:7:0x00a3, code lost:
        if (r6.equals("") != false) goto L8;
     */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:33:0x0149 -> B:27:0x0134). Please submit an issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String GetMachineID() {
        String str;
        String str2;
        TelephonyManager telephonyManager = (TelephonyManager) this.mContext.getSystemService("phone");
        StringBuilder sb = new StringBuilder();
        sb.append("\nModel = " + Build.MODEL);
        sb.append("\nSerialNumber = " + Build.SERIAL);
        sb.append("\nDeviceId(IMEI) = " + telephonyManager.getDeviceId());
        sb.append("\nAndroidID = " + Settings.Secure.getString(this.mContext.getContentResolver(), "android_id"));
        try {
            str = ((WifiManager) this.mContext.getSystemService("wifi")).getConnectionInfo().getMacAddress();
        } catch (NullPointerException e) {
            str = "";
        } catch (Exception e2) {
            str = "";
        }
        if (str != null) {
            str2 = str;
        }
        int i = 0;
        while (true) {
            if (i > 5) {
                str2 = str;
                break;
            }
            try {
                str = ((WifiManager) this.mContext.getSystemService("wifi")).getConnectionInfo().getMacAddress();
            } catch (NullPointerException e3) {
                str = "";
            } catch (Exception e4) {
                str = "";
            }
            if (str != null) {
                str2 = str;
                if (str.length() > 0) {
                    break;
                }
            }
            try {
                Thread.sleep(org.apache.tools.ant.util.FileUtils.FAT_FILE_TIMESTAMP_GRANULARITY);
            } catch (InterruptedException e5) {
                e5.printStackTrace();
            }
            i++;
        }
        String str3 = str2;
        if (str2 == null) {
            str3 = "";
        }
        sb.append("\nMACAddress = " + str3);
        return String.valueOf(toHexString(toMd5(sb.toString().getBytes()), "")) + ":" + str3.replaceAll(":", "");
    }

    public void InstallApk() {
        new InstallApkHelper(this, selfpackageName).InstallAll();
    }

    public void addUsedTimes() {
        List<String> readIDFile;
        if (!idfile.exists() || idfile.length() <= 0 || (readIDFile = readIDFile()) == null) {
            return;
        }
        String str = readIDFile.get(0);
        readIDFile.get(1);
        writeidFile(str, Integer.parseInt(readIDFile.get(2)), readIDFile.get(3), readIDFile.get(4), String.valueOf(Integer.parseInt(readIDFile.get(5)) + 1));
    }

    public LogInfo alogparserJson(String str, String str2, LogInfo logInfo, String str3) {
        return JsonHelper.alogparserJson(str, str2, logInfo, str3);
    }

    public void apkUpdate(String str) {
        selfpackageName = str;
        if (!isDown) {
            isDown = true;
            if (this.apkUpdateThread == null) {
                this.apkUpdateThread = new Thread(this.apkUpdateRunnable);
            }
            if (this.apkUpdateThread.isAlive()) {
                return;
            }
            this.apkUpdateThread.start();
        }
    }

    public int checkIDAuth() {
        int i;
        if (!idfile.exists() || idfile.length() <= 0) {
            i = 1;
        } else {
            List<String> readIDFile = readIDFile();
            if (readIDFile != null) {
                String str = readIDFile.get(0);
                String str2 = readIDFile.get(1);
                String str3 = readIDFile.get(2);
                String str4 = readIDFile.get(3);
                String str5 = readIDFile.get(4);
                String str6 = readIDFile.get(5);
                if (str == null || str.length() < 16) {
                    i = 3;
                } else if (str2 == null || str2.length() < 32 || !str2.equals(GetMachineID())) {
                    i = 4;
                } else if (str3 == null || str3.length() <= 0 || (!str3.equals("4") && !str3.equals("5"))) {
                    i = 5;
                } else {
                    Date date = new Date();
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DateUtils.ISO8601_DATE_PATTERN);
                    Date date2 = null;
                    if (str5 != null && str5.length() >= 10) {
                        try {
                            date2 = simpleDateFormat.parse(str5);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        if (date2 == null || date.after(date2)) {
                            i = 6;
                        }
                    }
                    if (str4 != null && str4.length() > 0 && Integer.parseInt(str4) > 0 && str6 != null && str6.length() > 0) {
                        if (Integer.parseInt(str4) <= Integer.parseInt(str6)) {
                            i = 7;
                        } else if (Integer.parseInt(str4) > 0) {
                            writeidFile(str, Integer.parseInt(str3), str4, str5, String.valueOf(Integer.parseInt(str6) + 1));
                        }
                    }
                    i = 0;
                }
            } else {
                i = 2;
            }
        }
        return i;
    }

    public boolean checkNotFoundUrl(String str) {
        int i = -1;
        try {
            if (str.startsWith("http://")) {
                i = new DefaultHttpClient().execute(new HttpHead(str)).getStatusLine().getStatusCode();
            }
        } catch (Exception e) {
            i = -1;
        }
        return i == 404 || i == 500;
    }

    public void clearTimer(Timer timer, TimerTask timerTask) {
        if (timer == null) {
            new Timer(true);
        } else if (timerTask == null) {
        } else {
            timerTask.cancel();
        }
    }

    public void getAppInfo() {
        SystemInfoHelper.getSystemInfo(new ArrayList(), this.mContext);
    }

    public String getDataFromAssets(String str) {
        Throwable th;
        BufferedReader bufferedReader;
        StringBuffer stringBuffer = new StringBuffer();
        BufferedReader bufferedReader2 = null;
        try {
            try {
                BufferedReader bufferedReader3 = new BufferedReader(new InputStreamReader(this.mContext.getAssets().open(str)));
                while (true) {
                    try {
                        bufferedReader2 = bufferedReader3.readLine();
                        if (bufferedReader2 == null) {
                            try {
                                break;
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        } else {
                            stringBuffer.append(String.valueOf(bufferedReader2) + "\n");
                        }
                    } catch (IOException e2) {
                        e = e2;
                        bufferedReader = bufferedReader3;
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
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (IOException e5) {
            e = e5;
            bufferedReader = null;
        }
        return stringBuffer.toString();
    }

    public LogInfo getExamLog(LogInfo logInfo, String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8) {
        return JsonHelper.getExamLog(logInfo, str, str2, str3, str4, str5, str6, str7, str8);
    }

    public final String getIDAuth() {
        return null;
    }

    public String getSettingPwd() {
        String str;
        ArrayList<HashMap<String, String>> loadXml = XmlLoadHelper.loadXml(new ArrayList());
        String str2 = "";
        if (loadXml.size() == 1) {
            str = loadXml.get(0).get(AppEnvironment.PASSWORD);
        } else {
            str = str2;
            if (loadXml.size() >= 2) {
                int i = 0;
                while (true) {
                    str = str2;
                    if (i >= loadXml.size()) {
                        break;
                    }
                    String str3 = loadXml.get(i).get(AppEnvironment.ISNEW);
                    str2 = str;
                    if (str3 != null) {
                        str2 = str;
                        if (str3.equals(LogHelp.TYPE_GUIDANCE)) {
                            str2 = loadXml.get(i).get(AppEnvironment.PASSWORD);
                        }
                    }
                    i++;
                }
            }
        }
        if (str != null && !"".equals(str)) {
            try {
                str = new String(new AESSet().decrypt(str), "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
                str = "";
            } catch (Exception e2) {
                str = "";
                e2.printStackTrace();
            }
        }
        return str;
    }

    public String getStuId(String str) {
        return JsonHelper.idXmlParse(str);
    }

    public String getUpdateJson(String str) {
        int i = 0;
        while (i < 6 && !NetWorkHelper.isNetworkConnected(this.mContext)) {
            i++;
            try {
                Thread.sleep(5000L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        Log.e(MagicNames.ANT_FILE_TYPE_URL, str);
        String postHttp = PostThreadHelper.postHttp(str);
        int i2 = 0;
        while (i2 < 6 && (postHttp == null || "".equals(postHttp))) {
            int i3 = i2;
            try {
                Thread.sleep(5000L);
                i2++;
                postHttp = PostThreadHelper.postHttp(str);
            } catch (InterruptedException e2) {
                e2.printStackTrace();
                i2 = i3;
            }
        }
        return postHttp;
    }

    public boolean goBackError(String str, String str2) {
        return OnConsoleHelper.goBackError(str, str2);
    }

    public void logPostHttp(String str, String str2) {
        PostThreadHelper.logPostHttp(str, str2);
    }

    public String logscreateJson(LogInfo logInfo, String str) {
        return JsonHelper.logscreateJson(logInfo, str);
    }

    public void saveStuId(String str, String str2) {
        JsonHelper.idXmlCreate(str, str2);
    }

    public long setStartLoadingTime() {
        return 3000L;
    }

    public long setStartLogSendTime(boolean z) {
        long j = 43200000;
        if (z) {
            j = 3600000;
        }
        return j;
    }

    public void settingPwdUpdate(String str, String str2) {
        PostThreadHelper.savdSettingPwd(str, str2);
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [com.edutech.idauthentication.MainActivity$5] */
    public void settingPwdUpdateHttp() {
        if (!isUpdatePwd) {
            isUpdatePwd = true;
            new Thread() { // from class: com.edutech.idauthentication.MainActivity.5
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    HashMap<String, String> loadIpXml = XmlLoadHelper.loadIpXml();
                    String str = loadIpXml.get("ip");
                    String str2 = loadIpXml.get("username");
                    if (str == null || str2 == null || "".equals(str) || "".equals(str2)) {
                        return;
                    }
                    String parseSetPwdReturnJson = JsonHelper.parseSetPwdReturnJson(MainActivity.this.getUpdateJson(AppEnvironment.SETTING_PWD_UPDATE_HTTPPOST_URL(str, str2)));
                    if (parseSetPwdReturnJson != null && !"".equals(parseSetPwdReturnJson)) {
                        MainActivity.this.settingPwdUpdate("0", parseSetPwdReturnJson);
                    }
                    MainActivity.isUpdatePwd = false;
                }
            }.start();
        }
    }

    public void userLicenseAgreementDialog() {
        View inflate = View.inflate(this.mContext, R.layout.layout_userlicense, null);
        this.btnYes = (Button) inflate.findViewById(R.id.btnYes);
        Button button = (Button) inflate.findViewById(R.id.btnCancle);
        this.scrollView = (ScrollView) inflate.findViewById(R.id.ScrollView);
        ((TextView) inflate.findViewById(R.id.tvUserLiceseContent)).setText(getDataFromAssets("UserLicenseAgreement.txt"));
        if (rightFile.exists()) {
            return;
        }
        final AlertDialog show = new AlertDialog.Builder(this.mContext).setTitle("用户最终许可协议").setView(inflate).setOnKeyListener(this.keylistener).setCancelable(false).show();
        this.scrollView.setOnTouchListener(new TouchListenerImpl(this, null));
        this.btnYes.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.idauthentication.MainActivity.6
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                FileInOutHelper.setupOrOpenFile(MainActivity.rightFilePath);
                show.dismiss();
            }
        });
        button.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.idauthentication.MainActivity.7
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ((Activity) MainActivity.this.mContext).finish();
            }
        });
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:23:0x01cf -> B:16:0x008c). Please submit an issue!!! */
    public void writeidFile(String str, int i, String str2, String str3, String str4) {
        FileOutputStream fileOutputStream;
        String str5 = str4;
        if (idfile.exists()) {
            str5 = str4;
            if (str4.equals("0")) {
                List<String> readIDFile = readIDFile();
                str5 = str4;
                if (readIDFile.get(0).equals(str)) {
                    str5 = str4;
                    if (readIDFile.get(5) != null) {
                        str5 = str4;
                        if (readIDFile.get(5).length() > 0) {
                            str5 = readIDFile.get(5);
                        }
                    }
                }
            }
            idfile.delete();
        }
        idfile = FileInOutHelper.setupOrOpenFile(filepath);
        try {
            fileOutputStream = new FileOutputStream(idfile);
        } catch (FileNotFoundException e) {
            fileOutputStream = null;
        }
        XmlSerializer newSerializer = Xml.newSerializer();
        try {
            newSerializer.setOutput(fileOutputStream, "UTF-8");
            newSerializer.startDocument(null, true);
            newSerializer.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
            newSerializer.startTag(null, "id");
            newSerializer.startTag(null, "a1");
            newSerializer.text(AES.encrypt(seed, str));
            newSerializer.endTag(null, "a1");
            newSerializer.startTag(null, "b2");
            newSerializer.text(AES.encrypt(seed, GetMachineID()));
            newSerializer.endTag(null, "b2");
            newSerializer.startTag(null, "c3");
            newSerializer.text(AES.encrypt(seed, String.valueOf(i)));
            newSerializer.endTag(null, "c3");
            newSerializer.startTag(null, "d4");
            newSerializer.text(AES.encrypt(seed, str2));
            newSerializer.endTag(null, "d4");
            newSerializer.startTag(null, "e5");
            newSerializer.text(AES.encrypt(seed, str3));
            newSerializer.endTag(null, "e5");
            newSerializer.startTag(null, "f6");
            newSerializer.text(AES.encrypt(seed, str5));
            newSerializer.endTag(null, "f6");
            newSerializer.endTag(null, "id");
            newSerializer.endDocument();
            newSerializer.flush();
            fileOutputStream.close();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }
}
