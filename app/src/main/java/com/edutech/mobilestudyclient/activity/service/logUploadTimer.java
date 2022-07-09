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
    }

    private long getSDAvailableSize() {
        File path = Environment.getExternalStorageDirectory();
        StatFs stat = new StatFs(path.getPath());
        long blockSize = stat.getBlockSize();
        long availableBlocks = stat.getAvailableBlocks();
        return (long) ((((blockSize * availableBlocks) * 1.0d) / 1024.0d) / 1024.0d);
    }

    private void deleteCameraFiles() {
    }

    private void deleteOtherFiles() {

    }

    private void delete(String path) {

    }

    public static void deleteFiles(String path) {

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

    }

    private boolean isNormalState() {
        return true;
    }

    private void getMyApps() {
        
    }

    private void uninstallBMD() {
        
    }

    private void uninstallIlleagalAPP() {
        
    }

    private void uninstallPkg(String pkgname) {
        
    }

    private void addLogData() {
        
    }

    @SuppressLint({"NewApi"})
    private String getOtherApps() {
        return "";
    }

    @SuppressLint({"NewApi"})
    public String getMacAddr() {
        return "";
    }

    public static boolean IsLocked() {
        return false;
    }
    
    public static void padInFoPostHttp() {

    }

    public static String getYogaSerialNumber() {
        return "";
    }

    public static String getManufacturerSerialNumber() {
        return "";
    }

    public static int chechDeviceStatus() {
        invalidApkInstall = false;
        return 0;
    }

    static boolean isProtectExist() {
        return true;
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
        return 1;
    }
}
