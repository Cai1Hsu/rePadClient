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
import java.util.List;
import org.apache.commons.io.FileUtils;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.bson.BSON;
import org.json.JSONObject;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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

    public static LogHelp getInstance() {
        return logHelp;
    }

    public void initLog(Context context, String SubjectID, String BookID, String BookName, String id) {
        this.SubjectID = SubjectID;
        this.BookID = BookID;
        this.BookName = BookName;
        this.dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.logFile = new File(logPath);
        try {
            if (this.logFile != null && this.logFile.exists() && this.logFile.length() > 0) {
                this.logInfo = (LogInfo) this.gson.fromJson(FileUtils.readFileToString(this.logFile, "UTF-8"), (Class<Object>) LogInfo.class);
            } else {
                this.logInfo = new LogInfo();
                this.logInfo.setUserID(id);
                this.logInfo.setMachineID(getMachineID(context));
                this.logInfo.setData(new ArrayList());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void startLog(String Type, String SectionsID, String AssetsID, String AssetsName) {
        this.starting = true;
        if (this.logInfo.getData() == null) {
            this.logInfo.setData(new ArrayList());
        }
        Iterator<LogDataItem> it = this.logInfo.getData().iterator();
        while (true) {
            if (it.hasNext()) {
                LogDataItem logDataItem = it.next();
                if (AssetsID.equals(logDataItem.getAssetsID())) {
                    this.logDataItem = logDataItem;
                    logDataItem.setVisitCount(new StringBuilder(String.valueOf(Integer.valueOf(logDataItem.getVisitCount()).intValue() + 1)).toString());
                    this.isResee = true;
                    break;
                }
            } else {
                break;
            }
        }
        if (!this.isResee) {
            this.logDataItem = new LogDataItem();
            this.logDataItem.setType(Type);
            this.logDataItem.setSubjectID(this.SubjectID);
            this.logDataItem.setBookID(this.BookID);
            this.logDataItem.setBookName(this.BookName);
            this.logDataItem.setSectionsID(SectionsID);
            this.logDataItem.setAssetsID(AssetsID);
            this.logDataItem.setAssetsName(AssetsName);
            this.logDataItem.setFirstTime(getCurrentFormatTime());
            this.logDataItem.setTotalTime("0");
            this.logDataItem.setVisitCount(TYPE_GUIDANCE);
            this.logDataItem.setLastTime("0");
            this.logInfo.getData().add(this.logDataItem);
        }
    }

    public void continueLog() {
        Log.i("qwe", "continueLog");
        if (this.starting) {
            this.continueTime = System.currentTimeMillis();
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

    public void sendLog() {
        String url = AppEnvironment.LOGJSON_HTTPPOST_URL(UpOrDownFile.apihost);
        String json = JsonHelper.getFileString(logPath);
        Log.d("LogReturn", json);
        if (url != null && json != null && !"".equals(url) && !"".equals(json)) {
            HttpPost httpRequest = new HttpPost(url);
            httpRequest.addHeader("X-Edutech-Entity", String.valueOf(UpOrDownFile.username) + "+" + UpOrDownFile.privatekey);
            long imestamp = System.currentTimeMillis();
            String sign = My_md5.Md5(String.valueOf(imestamp) + UpOrDownFile.username + UpOrDownFile.privatekey);
            Log.e("Test2", "timestamp=" + imestamp + "   sign=" + sign);
            httpRequest.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
            List<NameValuePair> params = new ArrayList<>();
            params.add(new BasicNameValuePair("data", json));
            try {
                httpRequest.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
                HttpResponse httpResponse = new DefaultHttpClient().execute(httpRequest);
                if (httpResponse != null) {
                    Log.d("qwe", new StringBuilder().append(httpResponse.getStatusLine().getStatusCode()).toString());
                    if (httpResponse.getStatusLine().getStatusCode() == 200) {
                        String strResult = EntityUtils.toString(httpResponse.getEntity());
                        int intResult = JsonHelper.parseHttpPostReturnJson(strResult);
                        Log.d("LogReturnlog", strResult);
                        Log.d("LogReturnlog", new JSONObject(strResult).getString("errorInfo"));
                        if (intResult == 1) {
                            File Logfile = new File(logPath);
                            if (Logfile.exists()) {
                                Logfile.delete();
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
        }
    }

    public final String getMachineID(Context context) {
        TelephonyManager tm = (TelephonyManager) context.getSystemService("phone");
        StringBuilder sb = new StringBuilder();
        sb.append("\nModel = " + Build.MODEL);
        sb.append("\nSerialNumber = " + Build.SERIAL);
        sb.append("\nDeviceId(IMEI) = " + tm.getDeviceId());
        String android_id = Settings.Secure.getString(context.getContentResolver(), "android_id");
        sb.append("\nAndroidID = " + android_id);
        WifiManager wm = (WifiManager) context.getSystemService("wifi");
        String m_szWLANMAC = wm.getConnectionInfo().getMacAddress();
        if (m_szWLANMAC != null && m_szWLANMAC.equals("02:00:00:00:00:00")) {
            m_szWLANMAC = getMacAddr();
        }
        if (m_szWLANMAC == null) {
            m_szWLANMAC = "";
        }
        sb.append("\nMACAddress = " + m_szWLANMAC);
        return String.valueOf(toHexString(toMd5(sb.toString().getBytes()), "")) + ":" + m_szWLANMAC.replaceAll(":", "");
    }

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

    private String getCurrentFormatTime() {
        return this.dateFormat.format(new Date(System.currentTimeMillis()));
    }
}
