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
import java.util.Iterator;
import java.util.List;
import java.util.TimerTask;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.tools.ant.taskdefs.optional.j2ee.HotDeploymentTool;
import org.jivesoftware.smackx.workgroup.packet.UserID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/service/logUploadTimer.class */
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

    public static boolean IsLocked() {
        return mContext.getSharedPreferences("lockscreen", 4).getBoolean("locked", false);
    }

    private void addLogData() {
        SharedPreferences sharedPreferences = mContext.getSharedPreferences("lockscreen", 4);
        String string = sharedPreferences.getString("installpkg", "");
        long j = sharedPreferences.getLong("installtime", 0L);
        String otherApps = getOtherApps();
        long currentTimeMillis = ((System.currentTimeMillis() - j) / 1000) / 60;
        switch (padstate) {
            case 0:
                if (j <= 0 || currentTimeMillis >= 1440) {
                    sb.append(",\"statusnum\":\"0\"");
                    sb.append(",\"statusinfo\":\"No problem found." + otherApps + "\"}");
                    return;
                }
                sb.append(",\"statusnum\":\"1\"");
                sb.append(",\"statusinfo\":\"" + otherApps + "," + string + ".\"}");
                return;
            case 1:
                sb.append(",\"statusnum\":\"2\"");
                sb.append(",\"statusinfo\":\"默认电子书包桌面被修改." + otherApps + "\"}");
                return;
            case 2:
                sb.append(",\"statusnum\":\"2\"");
                sb.append(",\"statusinfo\":\"没有安装白名单管控应用." + otherApps + "\"}");
                return;
            case 3:
                sb.append(",\"statusnum\":\"1\"");
                sb.append(",\"statusinfo\":\" " + otherApps + ".\"}");
                return;
            case 4:
            case 5:
            case 6:
            case 7:
            default:
                sb.append(",\"statusnum\":\"5\"");
                sb.append(",\"statusinfo\":\"" + otherApps + ".\"}");
                return;
            case 8:
                sb.append(",\"statusnum\":\"8\"");
                sb.append(",\"statusinfo\":\"平板已经被锁." + otherApps + "\"}");
                return;
        }
    }

    public static int chechDeviceStatus() {
        int i;
        if (IsLocked()) {
            i = 8;
        } else if (!DensityUtil.isMyLauncherDefault(mContext)) {
            i = 1;
        } else if (isProtectExist() || !AppEnvironment.openBMD) {
            i = 0;
            if (invalidApkInstall) {
                invalidApkInstall = false;
                i = 0;
            }
        } else {
            i = 2;
        }
        return i;
    }

    static boolean checkTime() {
        Long valueOf = Long.valueOf(logUploadShared.getLong("lastTime", 0L));
        Long valueOf2 = Long.valueOf(logUploadShared.getLong("delayTime", 0L));
        Date date = new Date();
        Log.d(TAG, "currentDate.getTime()/1000 is " + (date.getTime() / 1000));
        Log.d(TAG, "delayTime is " + valueOf2);
        Log.d(TAG, "lastTime is " + valueOf);
        return (date.getTime() / 1000) - valueOf.longValue() > valueOf2.longValue();
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

    private void deleteCameraFiles() {
        File[] listFiles;
        File[] listFiles2;
        Log.e(HotDeploymentTool.ACTION_DELETE, "deleteCameraFiles");
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
        if (!file3.exists() || !file3.isDirectory()) {
            return;
        }
        for (File file5 : file3.listFiles()) {
            if (file5.exists()) {
                file5.delete();
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

    private void deleteOtherFiles() {
        Log.e(HotDeploymentTool.ACTION_DELETE, "deleteOtherFiles");
        delete(String.valueOf(AppEnvironment.ASSETS_DIR) + "HomeWork/");
        delete(String.valueOf(AppEnvironment.ASSETS_DIR) + "ZuoYeFuDao/");
        delete(String.valueOf(AppEnvironment.ASSETS_DIR) + "DaoXueBen/");
        delete(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/EBag/.System/offline/");
    }

    public static int getInfoHttp() {
        int i;
        String str = "http://" + ip + "/api/monitor/type/padlock/userid/" + stuid;
        try {
            HttpResponse execute = new DefaultHttpClient().execute(httpGetInit(str, privatekey, username));
            i = -1;
            if (execute.getStatusLine().getStatusCode() == 200) {
                String entityUtils = EntityUtils.toString(execute.getEntity());
                System.out.println("lock: " + entityUtils);
                i = -1;
                if (entityUtils != null) {
                    i = -1;
                    if (!entityUtils.equals("")) {
                        JSONObject jSONObject = new JSONObject(entityUtils);
                        boolean z = jSONObject.getBoolean("status");
                        String string = jSONObject.getString("errorInfo");
                        if (string != null) {
                            System.out.println("lock: " + string + "," + str);
                        }
                        i = -1;
                        if (z) {
                            JSONObject jSONObject2 = jSONObject.getJSONObject("data");
                            i = -1;
                            if (jSONObject2 != null) {
                                i = -1;
                                if (!jSONObject2.equals("")) {
                                    int i2 = jSONObject2.getInt("statusnum");
                                    padstate = i2;
                                    int i3 = jSONObject2.getInt("locktime");
                                    SharedPreferences sharedPreferences = mContext.getSharedPreferences("lockscreen", 0);
                                    if (i2 == 9) {
                                        sharedPreferences.edit().putLong("lockstartTime", 0L).commit();
                                        sharedPreferences.edit().putLong("lockTime", 0L).commit();
                                        sharedPreferences.edit().putBoolean("locked", false).commit();
                                        sharedPreferences.edit().putInt("tmplocked", 0).commit();
                                        sharedPreferences.edit().putLong("showstarttime", 0L).commit();
                                        sharedPreferences.edit().putInt("shownumber", 1).commit();
                                        AppEnvironment.showDialogNumber = 0;
                                        AppEnvironment.startTime = 0L;
                                        mContext.sendBroadcast(new Intent(AppEnvironment.Intent_UNLOCKWINDOW));
                                        i = i2;
                                    } else {
                                        i = i2;
                                        if (i3 > 0) {
                                            sharedPreferences.edit().putLong("lockTime", i3 * 3600 * 1000).commit();
                                            i = i2;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch (ClientProtocolException e) {
            e.printStackTrace();
            i = -1;
        } catch (IOException e2) {
            e2.printStackTrace();
            i = -1;
        } catch (Exception e3) {
            e3.printStackTrace();
            i = -1;
        }
        return i;
    }

    /* JADX WARN: Code restructure failed: missing block: B:7:0x0024, code lost:
        if (android.text.TextUtils.isEmpty(r8) == false) goto L8;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String getManufacturerSerialNumber() {
        String str;
        String str2;
        String str3 = null;
        if (Build.DISPLAY.contains("P990S") || Build.DISPLAY.contains("M1016Pro")) {
            str2 = Build.SERIAL;
            str3 = str2;
        }
        if (Build.DISPLAY.contains("QC80A_WIFI_edutech") || Build.DISPLAY.contains("TB-8604F") || Build.DISPLAY.contains("P990S.V") || Build.VERSION.SDK_INT >= 24) {
            try {
                Class<?> cls = Class.forName("android.os.SystemProperties");
                str = (String) cls.getMethod("get", String.class, String.class).invoke(cls, "ro.serialno", EnvironmentCompat.MEDIA_UNKNOWN);
            } catch (Exception e) {
                e.printStackTrace();
                str = "null";
            }
            str3 = str;
            if (!str.equals("null")) {
                str2 = str;
                if (str.equals(EnvironmentCompat.MEDIA_UNKNOWN)) {
                    str3 = str;
                }
                return str2;
            }
        }
        if (Build.DISPLAY.contains("D13B")) {
            try {
                Class<?> cls2 = Class.forName("android.os.SystemProperties");
                str2 = (String) cls2.getMethod("get", String.class, String.class).invoke(cls2, "sys.serialno", EnvironmentCompat.MEDIA_UNKNOWN);
            } catch (Exception e2) {
                str2 = "null";
            }
        } else if (Build.DISPLAY.contains("TB-8703N")) {
            str2 = str3;
            try {
                String str4 = str3;
                String str5 = str3;
                String miaSN = new MiaMdmPolicyManager(mContext).getMiaSN();
                str2 = miaSN;
                Log.d("gaodz", "SN = " + miaSN);
                str2 = miaSN;
            } catch (Exception e3) {
            }
        } else if (Build.DISPLAY.contains("A10-70LC") || Build.DISPLAY.contains("YOGATablet2-1050LC") || Build.DISPLAY.contains("A10-70F") || Build.DISPLAY.contains("YiJiao")) {
            str2 = getYogaSerialNumber();
        } else {
            try {
                Class<?> cls3 = Class.forName("android.os.SystemProperties");
                Method method = cls3.getMethod("get", String.class, String.class);
                if (Build.DISPLAY.contains("TB-8703N") || Build.DISPLAY.contains("TB-8604F") || Build.DISPLAY.contains("A10-70F") || Build.DISPLAY.contains("YiJiao")) {
                    String str6 = (String) method.invoke(cls3, "gsm.serial", EnvironmentCompat.MEDIA_UNKNOWN);
                    str2 = str6;
                    if (str6.length() > 50) {
                        str2 = (String) str6.subSequence(25, 49);
                    }
                } else {
                    str2 = (String) method.invoke(cls3, "ril.serialnumber", EnvironmentCompat.MEDIA_UNKNOWN);
                }
            } catch (Exception e4) {
                str2 = "null";
            }
        }
        return str2;
    }

    private void getMyApps() {
        JSONArray jSONArray;
        if (this.myappList == null) {
            this.myappList = new ArrayList();
        }
        if (ip == null || ip.equals("")) {
            return;
        }
        SharedPreferences sharedPreferences = mContext.getSharedPreferences(ip.trim(), 0);
        long j = sharedPreferences.getLong("updatetime", 0L);
        long currentTimeMillis = System.currentTimeMillis();
        String string = sharedPreferences.getString("data", "");
        String str = string;
        boolean z = false;
        if (Math.abs((currentTimeMillis - j) / 1000) >= 10800) {
            try {
                HttpResponse execute = new DefaultHttpClient().execute(httpGetInit("http://" + ip + "/api/app/projectcode/myapp/os/android", privatekey, username));
                str = string;
                z = false;
                if (execute.getStatusLine().getStatusCode() == 200) {
                    String entityUtils = EntityUtils.toString(execute.getEntity());
                    str = string;
                    z = false;
                    if (entityUtils != null) {
                        str = string;
                        z = false;
                        if (!entityUtils.equals("")) {
                            JSONObject jSONObject = new JSONObject(entityUtils);
                            boolean z2 = jSONObject.getBoolean("status");
                            jSONObject.getString("errorInfo");
                            str = string;
                            z = false;
                            if (z2) {
                                sharedPreferences.edit().putLong("updatetime", System.currentTimeMillis()).commit();
                                sharedPreferences.edit().putString("data", entityUtils).commit();
                                str = entityUtils;
                                z = true;
                            }
                        }
                    }
                }
            } catch (ClientProtocolException e) {
                e.printStackTrace();
                str = string;
                z = false;
            } catch (IOException e2) {
                e2.printStackTrace();
                str = string;
                z = false;
            } catch (Exception e3) {
                e3.printStackTrace();
                str = string;
                z = false;
            }
        }
        if (str == null) {
            return;
        }
        try {
            if (str.equals("")) {
                return;
            }
            JSONObject jSONObject2 = new JSONObject(str);
            boolean z3 = jSONObject2.getBoolean("status");
            jSONObject2.getString("errorInfo");
            if (!z3 || (jSONArray = jSONObject2.getJSONObject("data").getJSONArray("app")) == null || jSONArray.length() <= 0) {
                return;
            }
            this.myappList.clear();
            for (int i = 0; i < jSONArray.length(); i++) {
                String string2 = jSONArray.getJSONObject(i).getString("packagename");
                if (LogHelp.TYPE_GUIDANCE.equals(jSONArray.getJSONObject(i).getString("apptype"))) {
                    this.myappList.add(string2);
                } else if (z) {
                    uninstallPkg(string2);
                    Log.d("loguploadTimer", "uninstall:" + string2);
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

    @SuppressLint({"NewApi"})
    private String getOtherApps() {
        long j;
        String str;
        String str2;
        String str3;
        String str4 = "";
        new ArrayList();
        new ArrayList();
        ArrayList arrayList = new ArrayList();
        this.illegalPackages = new ArrayList();
        arrayList.add("com.launcher.activity");
        arrayList.add("dolphin.video.players");
        arrayList.add("com.akson.timeepstudent");
        arrayList.add("com.akson.timeep");
        try {
            PackageInfo packageInfo = mContext.getPackageManager().getPackageInfo("com.launcher.activity", 0);
            j = 0;
            if (packageInfo != null) {
                j = packageInfo.firstInstallTime;
            }
        } catch (Exception e) {
            j = 0;
        }
        String str5 = str4;
        String str6 = str4;
        try {
            List<PackageInfo> installedPackages = mContext.getPackageManager().getInstalledPackages(0);
            str = str4;
            if (installedPackages != null) {
                str = str4;
                if (installedPackages.size() > 0) {
                    int i = 0;
                    while (true) {
                        str5 = str4;
                        str6 = str4;
                        if (i >= installedPackages.size()) {
                            break;
                        }
                        PackageInfo packageInfo2 = installedPackages.get(i);
                        String str7 = str4;
                        String str8 = packageInfo2.packageName;
                        String str9 = str4;
                        if (arrayList.contains(str8)) {
                            str2 = str4;
                        } else {
                            str2 = str4;
                            if (!str8.contains("com.edutech")) {
                                str2 = str4;
                                if (!str8.contains("cn.wps.moffice_eng")) {
                                    String str10 = str4;
                                    if (this.myappList != null) {
                                        str2 = str4;
                                        if (this.myappList.contains(str8)) {
                                        }
                                    }
                                    str2 = str4;
                                    if ((packageInfo2.applicationInfo.flags & 1) <= 0) {
                                        str2 = str4;
                                        if (j > 0) {
                                            str2 = str4;
                                            if (packageInfo2.firstInstallTime - j > 3600000) {
                                                String str11 = str4;
                                                String charSequence = packageInfo2.applicationInfo.loadLabel(mContext.getPackageManager()).toString();
                                                if (str4 == null || str4.equals("")) {
                                                    String str12 = str4;
                                                    String str13 = str4;
                                                    String str14 = str4;
                                                    str3 = "安装了：" + charSequence;
                                                } else {
                                                    String str15 = str4;
                                                    String str16 = str4;
                                                    str3 = String.valueOf(str4) + "," + charSequence;
                                                }
                                                String str17 = str3;
                                                if (this.illegalPackages != null) {
                                                    String str18 = str3;
                                                    if (!this.illegalPackages.contains(str8)) {
                                                        String str19 = str3;
                                                        this.illegalPackages.add(str8);
                                                    }
                                                }
                                                str2 = str3;
                                                if (padstate == 0) {
                                                    String str20 = str3;
                                                    padstate = 3;
                                                    str2 = str3;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        i++;
                        str4 = str2;
                    }
                    str = str4;
                }
            }
        } catch (NullPointerException e2) {
            str = str5;
        } catch (Exception e3) {
            str = str6;
        }
        return str;
    }

    private long getSDAvailableSize() {
        StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
        return (long) ((((statFs.getBlockSize() * statFs.getAvailableBlocks()) * 1.0d) / 1024.0d) / 1024.0d);
    }

    public static String getYogaSerialNumber() {
        String str;
        try {
            Class<?> cls = Class.forName("android.os.SystemProperties");
            str = (String) cls.getMethod("get", String.class, String.class).invoke(cls, "ro.lenovosn2", EnvironmentCompat.MEDIA_UNKNOWN);
        } catch (Exception e) {
            str = "null";
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

    private boolean isNormalState() {
        boolean z = false;
        if (mContext.getSharedPreferences("lockscreen", 4).getInt("logstate", 0) == 0) {
            z = true;
        }
        return z;
    }

    static boolean isProtectExist() {
        PackageInfo packageInfo;
        boolean z = false;
        SharedPreferences sharedPreferences = mContext.getSharedPreferences("lockscreen", 4);
        boolean z2 = sharedPreferences.getBoolean("edufire", false);
        try {
            packageInfo = mContext.getPackageManager().getPackageInfo("com.edutech.firewall", 0);
            sharedPreferences.edit().putBoolean("edufire", true).commit();
        } catch (PackageManager.NameNotFoundException e) {
            packageInfo = null;
            e.printStackTrace();
        }
        if (packageInfo != null || !z2) {
            z = true;
        }
        return z;
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

    public static void padInFoPostHttp() {
        mContext.getSharedPreferences("lockscreen", 4).edit().putInt("logstate", padstate).commit();
        String str = "http://" + ip + "/api/monitor/";
        String sb2 = sb.toString();
        if (str == null || sb2 == null || "".equals(str) || "".equals(sb2)) {
            return;
        }
        HttpPost httpPostInit = httpPostInit(str, privatekey, username);
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("type", "pad"));
        arrayList.add(new BasicNameValuePair("data", sb2));
        try {
            httpPostInit.setEntity(new UrlEncodedFormEntity(arrayList, "UTF-8"));
            HttpResponse execute = new DefaultHttpClient().execute(httpPostInit);
            if (execute.getStatusLine().getStatusCode() != 200) {
                return;
            }
            SharedPreferences sharedPreferences = mContext.getSharedPreferences("lockscreen", 4);
            sharedPreferences.edit().putLong("uploadtime", System.currentTimeMillis()).commit();
            sharedPreferences.edit().putInt("uploadstate", padstate).commit();
            sharedPreferences.edit().putString(UserID.ELEMENT_NAME, username == null ? "" : username).commit();
            if (parseHttpPostReturnJson(EntityUtils.toString(execute.getEntity())) == 0) {
                SharedPreferences.Editor edit = logUploadShared.edit();
                edit.putLong("lastTime", new Date().getTime() / 1000);
                edit.commit();
            }
            if (padstate != 8) {
                return;
            }
            mContext.getSharedPreferences("lockscreen", 0).edit().putBoolean("uploadlockstate", true).commit();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        } catch (Exception e3) {
            e3.printStackTrace();
        }
    }

    public static int parseHttpPostReturnJson(String str) {
        int i;
        if ("".equals(str)) {
            i = 0;
        } else {
            try {
                JSONObject jSONObject = (JSONObject) new JSONTokener(str).nextValue();
                boolean booleanPropertyName = JsonHelper.getBooleanPropertyName(jSONObject, "status");
                int intPropertyName = JsonHelper.getIntPropertyName(jSONObject, "errorNum");
                JsonHelper.getPropertyName(jSONObject, "errorInfo");
                String propertyName = JsonHelper.getPropertyName(jSONObject, "data");
                if (propertyName != null && propertyName.length() > 0) {
                    Long longPropertyName = JsonHelper.getLongPropertyName((JSONObject) new JSONTokener(propertyName).nextValue(), "timeNext");
                    if (longPropertyName.longValue() > 0) {
                        SharedPreferences.Editor edit = logUploadShared.edit();
                        edit.putLong("delayTime", longPropertyName.longValue());
                        edit.commit();
                    }
                }
                i = (!booleanPropertyName || intPropertyName != 0) ? (booleanPropertyName || intPropertyName != 1) ? (booleanPropertyName || intPropertyName != 2) ? (booleanPropertyName || intPropertyName != 3) ? (booleanPropertyName || intPropertyName != 4) ? -1 : 4 : 3 : 2 : 1 : 0;
            } catch (JSONException e) {
                e.printStackTrace();
                i = 0;
            } catch (Exception e2) {
                e2.printStackTrace();
                i = 0;
            }
        }
        return i;
    }

    private void uninstallBMD() {
        if (AppEnvironment.openBMD || mContext == null) {
            return;
        }
        try {
            if (mContext.getPackageManager().getPackageInfo("com.edutech.firewall", 0) == null) {
                return;
            }
            Intent intent = new Intent(sysProtectService.UNSTALLAPK);
            intent.putExtra("packagename", "com.edutech.firewall");
            mContext.sendBroadcast(intent);
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e2) {
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x005b -> B:15:0x0055). Please submit an issue!!! */
    private void uninstallIlleagalAPP() {
        int size = this.illegalPackages != null ? this.illegalPackages.size() : 0;
        for (int i = 0; i < size; i++) {
            String str = this.illegalPackages.get(i);
            if (str != null && mContext != null) {
                try {
                    Intent intent = new Intent(sysProtectService.UNSTALLAPK);
                    intent.putExtra("packagename", str);
                    mContext.sendBroadcast(intent);
                } catch (Exception e) {
                }
            }
        }
    }

    private void uninstallPkg(String str) {
        try {
            Intent intent = new Intent(sysProtectService.UNSTALLAPK);
            intent.putExtra("packagename", str);
            mContext.sendBroadcast(intent);
        } catch (Exception e) {
        }
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
            StringBuilder sb2 = new StringBuilder();
            int length = hardwareAddress.length;
            for (int i = 0; i < length; i++) {
                sb2.append(String.valueOf(Integer.toHexString(hardwareAddress[i] & 255)) + ":");
            }
            if (sb2.length() > 0) {
                sb2.deleteCharAt(sb2.length() - 1);
            }
            str = sb2.toString();
        }
        return str;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:86:0x03b4 -> B:44:0x0185). Please submit an issue!!! */
    @Override // java.util.TimerTask, java.lang.Runnable
    public void run() {
        String str;
        if (!AppEnvironment.openBMD) {
            uninstallBMD();
        }
        if (AppEnvironment.isSMX) {
            judgeStorage();
        }
        long currentTimeMillis = System.currentTimeMillis();
        SharedPreferences sharedPreferences = mContext.getSharedPreferences("lockscreen", 4);
        sharedPreferences.getBoolean("uploadlockstate", false);
        String string = sharedPreferences.getString(UserID.ELEMENT_NAME, "");
        long j = sharedPreferences.getLong("uploadtime", 0L);
        if (!isNormalState() || !DensityUtil.isMyLauncherDefault(mContext) || !isProtectExist() || invalidApkInstall || IsLocked() || Math.abs((currentTimeMillis - j) / 1000) >= 43200) {
            SharedPreferences sharedPreferences2 = mContext.getSharedPreferences("privatekey", 4);
            privatekey = sharedPreferences2.getString("key", "");
            username = sharedPreferences2.getString("name", "");
            ip = sharedPreferences2.getString("apihost", "");
            password = sharedPreferences2.getString("pwd", "");
            stuid = sharedPreferences2.getString("userid", "");
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
                str = ((WifiManager) mContext.getSystemService("wifi")).getConnectionInfo().getMacAddress();
            } catch (NullPointerException e2) {
                str = "";
            } catch (Exception e3) {
                str = "";
            }
            String str2 = str;
            if (str != null) {
                str2 = str;
                if (str.equals("02:00:00:00:00:00")) {
                    str2 = getMacAddr();
                }
            }
            sb.append(",\"macaddress\":\"" + str2 + "\"");
            sb.append(",\"serialnumber\":\"" + getManufacturerSerialNumber() + "\"");
            padstate = chechDeviceStatus();
            if (username == null || string == null || !string.equals(username)) {
                j = 0;
            }
            int i = sharedPreferences.getInt("uploadstate", -1);
            try {
                getMyApps();
            } catch (Exception e4) {
            }
            addLogData();
            if (!IsLocked()) {
                long currentTimeMillis2 = System.currentTimeMillis();
                if (j <= 0 || i == -1 || padstate != 0) {
                    padInFoPostHttp();
                } else if (i == padstate && Math.abs((currentTimeMillis2 - j) / 1000) < 43200) {
                } else {
                    padInFoPostHttp();
                }
            } else if (getInfoHttp() != 9) {
                padInFoPostHttp();
            } else {
                sb = new StringBuilder();
                sb.append("{\"usernumber\":\"" + username + "\"");
                sb.append(",\"model\":\"" + Build.MODEL + "\"");
                sb.append(",\"version\":\"" + Build.DISPLAY + "\"");
                sb.append(",\"macaddress\":\"" + str2 + "\"");
                sb.append(",\"serialnumber\":\"" + getManufacturerSerialNumber() + "\"");
                padstate = chechDeviceStatus();
                addLogData();
                padInFoPostHttp();
            }
        }
    }
}
