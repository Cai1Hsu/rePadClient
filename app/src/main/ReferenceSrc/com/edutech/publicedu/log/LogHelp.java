package com.edutech.publicedu.log;

import android.content.Context;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Environment;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.util.Log;
import com.edutech.daoxueben.sysconfig.AppEnvironment;
import com.edutech.daoxueben.until.JsonHelper;
import com.edutech.daoxueben.until.UpOrDownFile;
import com.edutech.mobilestudyclient.util.My_md5;
import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.net.NetworkInterface;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import org.apache.commons.io.FileUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

/* loaded from: classes.jar:com/edutech/publicedu/log/LogHelp.class */
public class LogHelp {
    public static final String TYPE_GUIDANCE = "1";
    public static final String TYPE_HWHELP = "3";
    public static final String TYPE_MYWORK = "2";
    private static LogHelp logHelp = new LogHelp();
    private static String logPath = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "MobileStudyClient" + File.separatorChar + ".System" + File.separatorChar + "DaoXueBen" + File.separatorChar + "log.json";
    private String BookID;
    private String BookName;
    private String SubjectID;
    private long continueTime;
    private SimpleDateFormat dateFormat;
    private Gson gson = new Gson();
    private boolean isResee;
    private LogDataItem logDataItem;
    private File logFile;
    private LogInfo logInfo;
    private long pauseTime;
    private boolean starting;

    private LogHelp() {
    }

    private String getCurrentFormatTime() {
        return this.dateFormat.format(new Date(System.currentTimeMillis()));
    }

    public static LogHelp getInstance() {
        return logHelp;
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

    public void continueLog() {
        Log.i("qwe", "continueLog");
        if (this.starting) {
            this.continueTime = System.currentTimeMillis();
        }
    }

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

    public final String getMachineID(Context context) {
        TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
        StringBuilder sb = new StringBuilder();
        sb.append("\nModel = " + Build.MODEL);
        sb.append("\nSerialNumber = " + Build.SERIAL);
        sb.append("\nDeviceId(IMEI) = " + telephonyManager.getDeviceId());
        sb.append("\nAndroidID = " + Settings.Secure.getString(context.getContentResolver(), "android_id"));
        String macAddress = ((WifiManager) context.getSystemService("wifi")).getConnectionInfo().getMacAddress();
        String str = macAddress;
        if (macAddress != null) {
            str = macAddress;
            if (macAddress.equals("02:00:00:00:00:00")) {
                str = getMacAddr();
            }
        }
        String str2 = str;
        if (str == null) {
            str2 = "";
        }
        sb.append("\nMACAddress = " + str2);
        return String.valueOf(toHexString(toMd5(sb.toString().getBytes()), "")) + ":" + str2.replaceAll(":", "");
    }

    public void initLog(Context context, String str, String str2, String str3, String str4) {
        this.SubjectID = str;
        this.BookID = str2;
        this.BookName = str3;
        this.dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.logFile = new File(logPath);
        try {
            if (this.logFile == null || !this.logFile.exists() || this.logFile.length() <= 0) {
                this.logInfo = new LogInfo();
                this.logInfo.setUserID(str4);
                this.logInfo.setMachineID(getMachineID(context));
                this.logInfo.setData(new ArrayList());
            } else {
                this.logInfo = (LogInfo) this.gson.fromJson(FileUtils.readFileToString(this.logFile, "UTF-8"), (Class<Object>) LogInfo.class);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void pauseLog() {
        Log.i("qwe", "pauseLog");
        if (this.starting) {
            this.pauseTime = System.currentTimeMillis();
            try {
                this.logDataItem.setTotalTime(new StringBuilder(String.valueOf(Integer.valueOf(this.logDataItem.getTotalTime()).intValue() + ((this.pauseTime - this.continueTime) / 1000))).toString());
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
    }

    /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x0121: INVOKE  (r2v21 int A[REMOVE]) = 
      (wrap: org.apache.http.StatusLine : 0x011c: INVOKE  (r2v20 org.apache.http.StatusLine A[REMOVE]) = (r0v35 org.apache.http.HttpResponse) type: INTERFACE call: org.apache.http.HttpResponse.getStatusLine():org.apache.http.StatusLine)
     type: INTERFACE call: org.apache.http.StatusLine.getStatusCode():int)] */
    public void sendLog() {
        String LOGJSON_HTTPPOST_URL = AppEnvironment.LOGJSON_HTTPPOST_URL(UpOrDownFile.apihost);
        String fileString = JsonHelper.getFileString(logPath);
        Log.d("LogReturn", fileString);
        if (LOGJSON_HTTPPOST_URL == null || fileString == null || "".equals(LOGJSON_HTTPPOST_URL) || "".equals(fileString)) {
            return;
        }
        HttpPost httpPost = new HttpPost(LOGJSON_HTTPPOST_URL);
        httpPost.addHeader("X-Edutech-Entity", String.valueOf(UpOrDownFile.username) + "+" + UpOrDownFile.privatekey);
        long currentTimeMillis = System.currentTimeMillis();
        String Md5 = My_md5.Md5(String.valueOf(currentTimeMillis) + UpOrDownFile.username + UpOrDownFile.privatekey);
        Log.e("Test2", "timestamp=" + currentTimeMillis + "   sign=" + Md5);
        httpPost.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + Md5);
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("data", fileString));
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(arrayList, "UTF-8"));
            HttpResponse execute = new DefaultHttpClient().execute(httpPost);
            if (execute == null) {
                return;
            }
            Log.d("qwe", new StringBuilder().append(execute.getStatusLine().getStatusCode()).toString());
            if (execute.getStatusLine().getStatusCode() != 200) {
                return;
            }
            String entityUtils = EntityUtils.toString(execute.getEntity());
            int parseHttpPostReturnJson = JsonHelper.parseHttpPostReturnJson(entityUtils);
            Log.d("LogReturnlog", entityUtils);
            Log.d("LogReturnlog", new JSONObject(entityUtils).getString("errorInfo"));
            if (parseHttpPostReturnJson != 1) {
                return;
            }
            File file = new File(logPath);
            if (!file.exists()) {
                return;
            }
            file.delete();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        } catch (Exception e3) {
            e3.printStackTrace();
        }
    }

    public void startLog(String str, String str2, String str3, String str4) {
        this.starting = true;
        if (this.logInfo.getData() == null) {
            this.logInfo.setData(new ArrayList());
        }
        Iterator<LogDataItem> it = this.logInfo.getData().iterator();
        while (true) {
            if (it.hasNext()) {
                LogDataItem next = it.next();
                if (str3.equals(next.getAssetsID())) {
                    this.logDataItem = next;
                    next.setVisitCount(new StringBuilder(String.valueOf(Integer.valueOf(next.getVisitCount()).intValue() + 1)).toString());
                    this.isResee = true;
                    break;
                }
            } else {
                break;
            }
        }
        if (!this.isResee) {
            this.logDataItem = new LogDataItem();
            this.logDataItem.setType(str);
            this.logDataItem.setSubjectID(this.SubjectID);
            this.logDataItem.setBookID(this.BookID);
            this.logDataItem.setBookName(this.BookName);
            this.logDataItem.setSectionsID(str2);
            this.logDataItem.setAssetsID(str3);
            this.logDataItem.setAssetsName(str4);
            this.logDataItem.setFirstTime(getCurrentFormatTime());
            this.logDataItem.setTotalTime("0");
            this.logDataItem.setVisitCount(TYPE_GUIDANCE);
            this.logDataItem.setLastTime("0");
            this.logInfo.getData().add(this.logDataItem);
        }
    }

    public void stopLog() {
        Log.i("qwe", "stopLog");
        if (this.starting) {
            this.logDataItem.setLastTime(getCurrentFormatTime());
        }
        this.starting = false;
    }

    public void writeLog() {
        if (this.logInfo.getData().size() > 0) {
            try {
                FileUtils.writeStringToFile(this.logFile, this.gson.toJson(this.logInfo), "UTF-8");
                this.logInfo.getData().clear();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
