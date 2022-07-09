package com.edutech.mobilestudyclient.activity.service;

import android.annotation.SuppressLint;
import android.app.ActivityManager;
import android.app.mia.MiaMdmPolicyManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.support.v4.media.session.PlaybackStateCompat;
import android.support.v4.os.EnvironmentCompat;
import android.text.TextUtils;
import android.util.Log;
import com.edutech.idauthentication.JsonHelper;
import com.edutech.mobilestudyclient.SysConfig.AppEnvironment;
import com.edutech.mobilestudyclient.util.DensityUtil;
import com.edutech.mobilestudyclient.util.My_md5;
import com.edutech.mobilestudyclient.util.XmlLoadHelper;
import com.edutech.publicedu.log.LogHelp;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.net.NetworkInterface;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.TimerTask;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.tools.ant.taskdefs.optional.j2ee.HotDeploymentTool;
import org.bson.BSON;
import org.jivesoftware.smackx.workgroup.packet.UserID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* loaded from: classes.dex */
public class logUploadTimer extends TimerTask {
    public static final String TAG = "logUploadTimer";
    static SharedPreferences logUploadShared;
    private static Context mContext;
    static StringBuilder sb;
    public ActivityManager mActivityManager;
    private static String ip = "";
    private static String username = "";
    private static String password = "";
    private static String privatekey = "";
    private static String stuid = "";
    public static boolean invalidApkInstall = false;
    private static int padstate = 0;
    private HashMap<String, String> hashmap = null;
    private List<String> illegalPackages = new ArrayList();
    private List<String> myappList = new ArrayList();

    public logUploadTimer(Context context) {
        mContext = context;
        logUploadShared = mContext.getSharedPreferences("LogUpLoad", 0);
    }

    private long getSDAvailableSize() {
        File path = Environment.getExternalStorageDirectory();
        StatFs stat = new StatFs(path.getPath());
        long blockSize = stat.getBlockSize();
        long availableBlocks = stat.getAvailableBlocks();
        return (long) ((((blockSize * availableBlocks) * 1.0d) / 1024.0d) / 1024.0d);
    }

    private void deleteCameraFiles() {
        Log.e(HotDeploymentTool.ACTION_DELETE, "deleteCameraFiles");
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
        }
    }

    private void deleteOtherFiles() {
        Log.e(HotDeploymentTool.ACTION_DELETE, "deleteOtherFiles");
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

    private void judgeStorage() {
        try {
            if (getSDAvailableSize() <= PlaybackStateCompat.ACTION_PLAY_FROM_SEARCH) {
                deleteCameraFiles();
                deleteOtherFiles();
            }
            Log.e("storage", String.valueOf(getSDAvailableSize()) + "size");
        } catch (Exception e) {
        }
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    public void run() {
        String m_szWLANMAC;
        if (!AppEnvironment.openBMD) {
            uninstallBMD();
        }
        if (AppEnvironment.isSMX) {
            judgeStorage();
        }
        long currentTime = System.currentTimeMillis();
        SharedPreferences spf = mContext.getSharedPreferences("lockscreen", 4);
        spf.getBoolean("uploadlockstate", false);
        String user = spf.getString(UserID.ELEMENT_NAME, "");
        long uploadtime = spf.getLong("uploadtime", 0L);
        if (!isNormalState() || !DensityUtil.isMyLauncherDefault(mContext) || !isProtectExist() || invalidApkInstall || IsLocked() || Math.abs((currentTime - uploadtime) / 1000) >= 43200) {
            SharedPreferences share = mContext.getSharedPreferences("privatekey", 4);
            privatekey = share.getString("key", "");
            username = share.getString("name", "");
            ip = share.getString("apihost", "");
            password = share.getString("pwd", "");
            stuid = share.getString("userid", "");
            if (privatekey == null || username == null || ip == null || password == null || stuid == null || privatekey.equals("") || username.equals("") || ip.equals("") || password.equals("") || stuid.equals("")) {
                try {
                    this.hashmap = XmlLoadHelper.loadXml();
                    if (this.hashmap != null) {
                        ip = this.hashmap.get("ip");
                        username = this.hashmap.get("username");
                        privatekey = this.hashmap.get("privatekey");
                        password = this.hashmap.get("pwd");
                        stuid = this.hashmap.get("stuid");
                    }
                } catch (Exception e) {
                }
            }
            sb = new StringBuilder();
            sb.append("{\"usernumber\":\"" + username + "\"");
            sb.append(",\"model\":\"" + Build.MODEL + "\"");
            sb.append(",\"version\":\"" + Build.DISPLAY + "\"");
            try {
                WifiManager wm = (WifiManager) mContext.getSystemService("wifi");
                m_szWLANMAC = wm.getConnectionInfo().getMacAddress();
            } catch (NullPointerException e2) {
                m_szWLANMAC = "";
            } catch (Exception e3) {
                m_szWLANMAC = "";
            }
            if (m_szWLANMAC != null && m_szWLANMAC.equals("02:00:00:00:00:00")) {
                m_szWLANMAC = getMacAddr();
            }
            sb.append(",\"macaddress\":\"" + m_szWLANMAC + "\"");
            sb.append(",\"serialnumber\":\"" + getManufacturerSerialNumber() + "\"");
            padstate = chechDeviceStatus();
            if (username == null || user == null || !user.equals(username)) {
                uploadtime = 0;
            }
            int state = spf.getInt("uploadstate", -1);
            try {
                getMyApps();
            } catch (Exception e4) {
            }
            addLogData();
            if (IsLocked()) {
                int pdstate = getInfoHttp();
                if (pdstate != 9) {
                    padInFoPostHttp();
                    return;
                }
                sb = new StringBuilder();
                sb.append("{\"usernumber\":\"" + username + "\"");
                sb.append(",\"model\":\"" + Build.MODEL + "\"");
                sb.append(",\"version\":\"" + Build.DISPLAY + "\"");
                sb.append(",\"macaddress\":\"" + m_szWLANMAC + "\"");
                sb.append(",\"serialnumber\":\"" + getManufacturerSerialNumber() + "\"");
                padstate = chechDeviceStatus();
                addLogData();
                padInFoPostHttp();
                return;
            }
            long time = System.currentTimeMillis();
            if (uploadtime <= 0 || state == -1 || padstate != 0) {
                padInFoPostHttp();
            } else if (state != padstate || Math.abs((time - uploadtime) / 1000) >= 43200) {
                padInFoPostHttp();
            }
        }
    }

    private boolean isNormalState() {
        SharedPreferences spf = mContext.getSharedPreferences("lockscreen", 4);
        int state = spf.getInt("logstate", 0);
        return state == 0;
    }

    private void getMyApps() {
        String strResult;
        if (this.myappList == null) {
            this.myappList = new ArrayList();
        }
        if (ip != null && !ip.equals("")) {
            String sppref = ip.trim();
            SharedPreferences sp = mContext.getSharedPreferences(sppref, 0);
            long lasttime = sp.getLong("updatetime", 0L);
            long time = System.currentTimeMillis();
            String myapps = sp.getString("data", "");
            boolean statueOk = false;
            if (Math.abs((time - lasttime) / 1000) >= 10800) {
                String url = "http://" + ip + "/api/app/projectcode/myapp/os/android";
                HttpGet httpRequest = httpGetInit(url, privatekey, username);
                try {
                    HttpResponse httpResponse = new DefaultHttpClient().execute(httpRequest);
                    if (httpResponse.getStatusLine().getStatusCode() == 200 && (strResult = EntityUtils.toString(httpResponse.getEntity())) != null && !strResult.equals("")) {
                        JSONObject jobj = new JSONObject(strResult);
                        boolean status = jobj.getBoolean("status");
                        jobj.getString("errorInfo");
                        if (status) {
                            sp.edit().putLong("updatetime", System.currentTimeMillis()).commit();
                            sp.edit().putString("data", strResult).commit();
                            myapps = strResult;
                            statueOk = true;
                        }
                    }
                } catch (ClientProtocolException e) {
                    e.printStackTrace();
                } catch (IOException e2) {
                    e2.printStackTrace();
                } catch (Exception e3) {
                    e3.printStackTrace();
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
                                    } else if (statueOk) {
                                        uninstallPkg(pkg);
                                        Log.d("loguploadTimer", "uninstall:" + pkg);
                                    }
                                }
                            }
                        }
                    }
                } catch (NullPointerException e4) {
                    e4.printStackTrace();
                } catch (JSONException e5) {
                    e5.printStackTrace();
                } catch (Exception e6) {
                    e6.printStackTrace();
                }
            }
        }
    }

    private void uninstallBMD() {
        if (!AppEnvironment.openBMD && mContext != null) {
            try {
                PackageInfo pinfo = mContext.getPackageManager().getPackageInfo("com.edutech.firewall", 0);
                if (pinfo != null) {
                    Intent installIntent = new Intent(sysProtectService.UNSTALLAPK);
                    installIntent.putExtra("packagename", "com.edutech.firewall");
                    mContext.sendBroadcast(installIntent);
                }
            } catch (PackageManager.NameNotFoundException e1) {
                e1.printStackTrace();
            } catch (Exception e) {
            }
        }
    }

    private void uninstallIlleagalAPP() {
        int length = this.illegalPackages != null ? this.illegalPackages.size() : 0;
        for (int i = 0; i < length; i++) {
            String pkname = this.illegalPackages.get(i);
            if (pkname != null && mContext != null) {
                try {
                    Intent installIntent = new Intent(sysProtectService.UNSTALLAPK);
                    installIntent.putExtra("packagename", pkname);
                    mContext.sendBroadcast(installIntent);
                } catch (Exception e) {
                }
            }
        }
    }

    private void uninstallPkg(String pkgname) {
        try {
            Intent installIntent = new Intent(sysProtectService.UNSTALLAPK);
            installIntent.putExtra("packagename", pkgname);
            mContext.sendBroadcast(installIntent);
        } catch (Exception e) {
        }
    }

    private void addLogData() {
        SharedPreferences sp = mContext.getSharedPreferences("lockscreen", 4);
        String installPkg = sp.getString("installpkg", "");
        long installTime = sp.getLong("installtime", 0L);
        String addApps = getOtherApps();
        long leavetime = ((System.currentTimeMillis() - installTime) / 1000) / 60;
        switch (padstate) {
            case 0:
                if (installTime > 0 && leavetime < 1440) {
                    sb.append(",\"statusnum\":\"1\"");
                    sb.append(",\"statusinfo\":\"" + addApps + "," + installPkg + ".\"}");
                    return;
                }
                sb.append(",\"statusnum\":\"0\"");
                sb.append(",\"statusinfo\":\"No problem found." + addApps + "\"}");
                return;
            case 1:
                sb.append(",\"statusnum\":\"2\"");
                sb.append(",\"statusinfo\":\"默认电子书包桌面被修改." + addApps + "\"}");
                return;
            case 2:
                sb.append(",\"statusnum\":\"2\"");
                sb.append(",\"statusinfo\":\"没有安装白名单管控应用." + addApps + "\"}");
                return;
            case 3:
                sb.append(",\"statusnum\":\"1\"");
                sb.append(",\"statusinfo\":\" " + addApps + ".\"}");
                return;
            case 4:
            case 5:
            case 6:
            case 7:
            default:
                sb.append(",\"statusnum\":\"5\"");
                sb.append(",\"statusinfo\":\"" + addApps + ".\"}");
                return;
            case 8:
                sb.append(",\"statusnum\":\"8\"");
                sb.append(",\"statusinfo\":\"平板已经被锁." + addApps + "\"}");
                return;
        }
    }

    @SuppressLint({"NewApi"})
    private String getOtherApps() {
        String addApps = "";
        new ArrayList();
        new ArrayList();
        ArrayList<String> selfApps = new ArrayList<>();
        this.illegalPackages = new ArrayList();
        selfApps.add("com.launcher.activity");
        selfApps.add("dolphin.video.players");
        selfApps.add("com.akson.timeepstudent");
        selfApps.add("com.akson.timeep");
        long sysLong = 0;
        try {
            PackageInfo info = mContext.getPackageManager().getPackageInfo("com.launcher.activity", 0);
            if (info != null) {
                sysLong = info.firstInstallTime;
            }
        } catch (Exception e) {
        }
        try {
            List<PackageInfo> packages = mContext.getPackageManager().getInstalledPackages(0);
            if (packages != null && packages.size() > 0) {
                for (int i = 0; i < packages.size(); i++) {
                    PackageInfo info2 = packages.get(i);
                    String pkName = info2.packageName;
                    if (!selfApps.contains(pkName) && !pkName.contains("com.edutech") && !pkName.contains("cn.wps.moffice_eng") && ((this.myappList == null || !this.myappList.contains(pkName)) && (info2.applicationInfo.flags & 1) <= 0 && sysLong > 0 && info2.firstInstallTime - sysLong > 3600000)) {
                        String name = info2.applicationInfo.loadLabel(mContext.getPackageManager()).toString();
                        if (addApps == null || addApps.equals("")) {
                            addApps = "安装了：" + name;
                        } else {
                            addApps = String.valueOf(addApps) + "," + name;
                        }
                        if (this.illegalPackages != null && !this.illegalPackages.contains(pkName)) {
                            this.illegalPackages.add(pkName);
                        }
                        if (padstate == 0) {
                            padstate = 3;
                        }
                    }
                }
            }
        } catch (NullPointerException e2) {
        } catch (Exception e3) {
        }
        return addApps;
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

    public static boolean IsLocked() {
        SharedPreferences spf = mContext.getSharedPreferences("lockscreen", 4);
        boolean locked = spf.getBoolean("locked", false);
        return locked;
    }

    public static HttpPost httpPostInit(String url, String privatekey2, String username2) {
        HttpPost post = new HttpPost(url);
        post.addHeader("X-Edutech-Entity", String.valueOf(username2) + "+" + privatekey2);
        long imestamp = System.currentTimeMillis();
        String sign = My_md5.Md5(String.valueOf(imestamp) + username2 + privatekey2);
        post.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
        return post;
    }

    public static HttpGet httpGetInit(String url, String privatekey2, String username2) {
        HttpGet get = new HttpGet(url);
        get.addHeader("X-Edutech-Entity", String.valueOf(username2) + "+" + privatekey2);
        long imestamp = System.currentTimeMillis();
        String sign = My_md5.Md5(String.valueOf(imestamp) + username2 + privatekey2);
        get.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
        return get;
    }

    public static int getInfoHttp() {
        JSONObject data;
        int pdstate = -1;
        String url = "http://" + ip + "/api/monitor/type/padlock/userid/" + stuid;
        HttpGet httpRequest = httpGetInit(url, privatekey, username);
        try {
            HttpResponse httpResponse = new DefaultHttpClient().execute(httpRequest);
            if (httpResponse.getStatusLine().getStatusCode() == 200) {
                String strResult = EntityUtils.toString(httpResponse.getEntity());
                System.out.println("lock: " + strResult);
                if (strResult != null && !strResult.equals("")) {
                    JSONObject jobj = new JSONObject(strResult);
                    boolean status = jobj.getBoolean("status");
                    String errorinfo = jobj.getString("errorInfo");
                    if (errorinfo != null) {
                        System.out.println("lock: " + errorinfo + "," + url);
                    }
                    if (status && (data = jobj.getJSONObject("data")) != null && !data.equals("")) {
                        int state = data.getInt("statusnum");
                        padstate = state;
                        pdstate = state;
                        int locktime = data.getInt("locktime");
                        SharedPreferences spf = mContext.getSharedPreferences("lockscreen", 0);
                        if (state == 9) {
                            spf.edit().putLong("lockstartTime", 0L).commit();
                            spf.edit().putLong("lockTime", 0L).commit();
                            spf.edit().putBoolean("locked", false).commit();
                            spf.edit().putInt("tmplocked", 0).commit();
                            spf.edit().putLong("showstarttime", 0L).commit();
                            spf.edit().putInt("shownumber", 1).commit();
                            AppEnvironment.showDialogNumber = 0;
                            AppEnvironment.startTime = 0L;
                            Intent intent = new Intent(AppEnvironment.Intent_UNLOCKWINDOW);
                            mContext.sendBroadcast(intent);
                        } else if (locktime > 0) {
                            spf.edit().putLong("lockTime", locktime * 3600 * 1000).commit();
                        }
                    }
                }
            }
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        } catch (Exception e3) {
            e3.printStackTrace();
        }
        return pdstate;
    }

    public static void padInFoPostHttp() {
        SharedPreferences spfes = mContext.getSharedPreferences("lockscreen", 4);
        spfes.edit().putInt("logstate", padstate).commit();
        String url = "http://" + ip + "/api/monitor/";
        String json = sb.toString();
        if (url != null && json != null && !"".equals(url) && !"".equals(json)) {
            HttpPost httpRequest = httpPostInit(url, privatekey, username);
            List<NameValuePair> params = new ArrayList<>();
            params.add(new BasicNameValuePair("type", "pad"));
            params.add(new BasicNameValuePair("data", json));
            try {
                httpRequest.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
                HttpResponse httpResponse = new DefaultHttpClient().execute(httpRequest);
                if (httpResponse.getStatusLine().getStatusCode() == 200) {
                    SharedPreferences spf2 = mContext.getSharedPreferences("lockscreen", 4);
                    spf2.edit().putLong("uploadtime", System.currentTimeMillis()).commit();
                    spf2.edit().putInt("uploadstate", padstate).commit();
                    spf2.edit().putString(UserID.ELEMENT_NAME, username == null ? "" : username).commit();
                    String strResult = EntityUtils.toString(httpResponse.getEntity());
                    int intResult = parseHttpPostReturnJson(strResult);
                    if (intResult == 0) {
                        SharedPreferences.Editor edit = logUploadShared.edit();
                        Date currentDate = new Date();
                        edit.putLong("lastTime", currentDate.getTime() / 1000);
                        edit.commit();
                    }
                    if (padstate == 8) {
                        SharedPreferences spf = mContext.getSharedPreferences("lockscreen", 0);
                        spf.edit().putBoolean("uploadlockstate", true).commit();
                    }
                }
            } catch (ClientProtocolException e) {
                e.printStackTrace();
            } catch (IOException e2) {
                e2.printStackTrace();
            } catch (Exception e3) {
                e3.printStackTrace();
            }
        }
    }

    public static String getYogaSerialNumber() {
        try {
            Class<?> c = Class.forName("android.os.SystemProperties");
            Method get = c.getMethod("get", String.class, String.class);
            String serial = (String) get.invoke(c, "ro.lenovosn2", EnvironmentCompat.MEDIA_UNKNOWN);
            return serial;
        } catch (Exception e) {
            return "null";
        }
    }

    public static String getManufacturerSerialNumber() {
        String serial;
        String serial2 = null;
        if (Build.DISPLAY.contains("P990S") || Build.DISPLAY.contains("M1016Pro")) {
            serial2 = Build.SERIAL;
            if (!TextUtils.isEmpty(serial2)) {
                return serial2;
            }
        }
        if (Build.DISPLAY.contains("QC80A_WIFI_edutech") || Build.DISPLAY.contains("TB-8604F") || Build.DISPLAY.contains("P990S.V") || Build.VERSION.SDK_INT >= 24) {
            try {
                Class<?> c = Class.forName("android.os.SystemProperties");
                Method get = c.getMethod("get", String.class, String.class);
                serial2 = (String) get.invoke(c, "ro.serialno", EnvironmentCompat.MEDIA_UNKNOWN);
            } catch (Exception e) {
                e.printStackTrace();
                serial2 = "null";
            }
            if (!serial2.equals("null") && !serial2.equals(EnvironmentCompat.MEDIA_UNKNOWN)) {
                return serial2;
            }
        }
        if (Build.DISPLAY.contains("D13B")) {
            try {
                Class<?> c2 = Class.forName("android.os.SystemProperties");
                Method get2 = c2.getMethod("get", String.class, String.class);
                String serial3 = (String) get2.invoke(c2, "sys.serialno", EnvironmentCompat.MEDIA_UNKNOWN);
                return serial3;
            } catch (Exception e2) {
                return "null";
            }
        } else if (Build.DISPLAY.contains("TB-8703N")) {
            try {
                MiaMdmPolicyManager mMiaMdmPolicyManager = new MiaMdmPolicyManager(mContext);
                serial2 = mMiaMdmPolicyManager.getMiaSN();
                Log.d("gaodz", "SN = " + serial2);
                return serial2;
            } catch (Exception e3) {
                return serial2;
            }
        } else if (Build.DISPLAY.contains("A10-70LC") || Build.DISPLAY.contains("YOGATablet2-1050LC") || Build.DISPLAY.contains("A10-70F") || Build.DISPLAY.contains("YiJiao")) {
            String serial4 = getYogaSerialNumber();
            return serial4;
        } else {
            try {
                Class<?> c3 = Class.forName("android.os.SystemProperties");
                Method get3 = c3.getMethod("get", String.class, String.class);
                if (Build.DISPLAY.contains("TB-8703N") || Build.DISPLAY.contains("TB-8604F") || Build.DISPLAY.contains("A10-70F") || Build.DISPLAY.contains("YiJiao")) {
                    serial = (String) get3.invoke(c3, "gsm.serial", EnvironmentCompat.MEDIA_UNKNOWN);
                    if (serial.length() > 50) {
                        serial = (String) serial.subSequence(25, 49);
                    }
                } else {
                    serial = (String) get3.invoke(c3, "ril.serialnumber", EnvironmentCompat.MEDIA_UNKNOWN);
                }
                return serial;
            } catch (Exception e4) {
                return "null";
            }
        }
    }

    public static int chechDeviceStatus() {
        if (IsLocked()) {
            return 8;
        }
        if (!DensityUtil.isMyLauncherDefault(mContext)) {
            return 1;
        }
        if (!isProtectExist() && AppEnvironment.openBMD) {
            return 2;
        }
        if (!invalidApkInstall) {
            return 0;
        }
        invalidApkInstall = false;
        return 0;
    }

    static boolean isProtectExist() {
        PackageInfo packageInfo;
        SharedPreferences sp = mContext.getSharedPreferences("lockscreen", 4);
        boolean hasEdufire = sp.getBoolean("edufire", false);
        try {
            packageInfo = mContext.getPackageManager().getPackageInfo("com.edutech.firewall", 0);
            sp.edit().putBoolean("edufire", true).commit();
        } catch (PackageManager.NameNotFoundException e) {
            packageInfo = null;
            e.printStackTrace();
        }
        return packageInfo != null || !hasEdufire;
    }

    static boolean checkTime() {
        Long lastTime = Long.valueOf(logUploadShared.getLong("lastTime", 0L));
        Long delayTime = Long.valueOf(logUploadShared.getLong("delayTime", 0L));
        Date currentDate = new Date();
        Log.d(TAG, "currentDate.getTime()/1000 is " + (currentDate.getTime() / 1000));
        Log.d(TAG, "delayTime is " + delayTime);
        Log.d(TAG, "lastTime is " + lastTime);
        return (currentDate.getTime() / 1000) - lastTime.longValue() > delayTime.longValue();
    }

    public static int parseHttpPostReturnJson(String json) {
        if ("".equals(json)) {
            return 0;
        }
        try {
            JSONTokener jsonTokener = new JSONTokener(json);
            JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
            boolean status = JsonHelper.getBooleanPropertyName(jsonObject, "status");
            int errorNum = JsonHelper.getIntPropertyName(jsonObject, "errorNum");
            JsonHelper.getPropertyName(jsonObject, "errorInfo");
            String data = JsonHelper.getPropertyName(jsonObject, "data");
            if (data != null && data.length() > 0) {
                JSONTokener jsonTokener1 = new JSONTokener(data);
                JSONObject jsonObject1 = (JSONObject) jsonTokener1.nextValue();
                Long timeNext = JsonHelper.getLongPropertyName(jsonObject1, "timeNext");
                if (timeNext.longValue() > 0) {
                    SharedPreferences.Editor edit = logUploadShared.edit();
                    edit.putLong("delayTime", timeNext.longValue());
                    edit.commit();
                }
            }
            if (status && errorNum == 0) {
                return 0;
            }
            if (!status && errorNum == 1) {
                return 1;
            }
            if (!status && errorNum == 2) {
                return 2;
            }
            if (!status && errorNum == 3) {
                return 3;
            }
            if (!status && errorNum == 4) {
                return 4;
            }
            return -1;
        } catch (JSONException e) {
            e.printStackTrace();
            return 0;
        } catch (Exception e2) {
            e2.printStackTrace();
            return 0;
        }
    }
}
