package com.edutech.mobilestudyclient.activity;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Environment;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.util.Xml;
import android.view.Menu;
import android.widget.Toast;
import com.edutech.idauthentication.AES;
import com.edutech.idauthentication.FileInOutHelper;
import com.edutech.idauthentication.MySSLSocketFactory;
import com.edutech.mobilestudyclient.SysConfig.AppEnvironment;
import com.edutech.utils.BZip2Utils;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.net.NetworkInterface;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.apache.commons.net.imap.IMAPSClient;
import org.apache.http.client.HttpClient;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.tools.ant.util.DateUtils;
import org.bson.BSON;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: classes.dex */
public class ActivityBase extends Activity {
    protected static final int SHOW_TIME = 1;
    private static String filepathMobileStudyClient = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/CloudClient/.System/idau.xml";
    private static File idfileMobileStudyClient = new File(filepathMobileStudyClient);
    public static String seed = "Edutech@2013";
    protected ProgressDialog mProgressDialog;

    protected void ShowMsg(String pMsg) {
        Toast toast = Toast.makeText(this, pMsg, 0);
        toast.setGravity(17, 0, 0);
        toast.show();
    }

    protected void ShowMsg(int p_ResID) {
        Toast.makeText(this, p_ResID, 1).show();
    }

    protected void openActivity(Class<?> pClass) {
        Intent _Intent = new Intent();
        _Intent.setClass(this, pClass);
        startActivity(_Intent);
    }

    public void setAlertDialogIsClose(DialogInterface dialog, Boolean isClose) {
        try {
            Field field = dialog.getClass().getSuperclass().getDeclaredField("mShowing");
            field.setAccessible(true);
            field.set(dialog, isClose);
        } catch (Exception e) {
        }
    }

    protected AlertDialog showAlertDialog(int titleId, String message, DialogInterface.OnClickListener OnClickListener) {
        String title = getString(titleId);
        return showAlertDialog(title, message, OnClickListener);
    }

    protected AlertDialog showAlertDialog(String title, String message, DialogInterface.OnClickListener OnClickListener) {
        return new AlertDialog.Builder(this).setTitle(title).setMessage(message).setPositiveButton("确定", OnClickListener).setNegativeButton("取消", (DialogInterface.OnClickListener) null).show();
    }

    protected void showProgressDialog(int titleResID, int messageResID) {
        this.mProgressDialog = new ProgressDialog(this);
        this.mProgressDialog.setTitle(getString(titleResID));
        this.mProgressDialog.setMessage(getString(messageResID));
        this.mProgressDialog.show();
    }

    protected void dismissProgressDialog() {
        if (this.mProgressDialog != null) {
            this.mProgressDialog.dismiss();
        }
    }

    protected void createMenu(Menu p_Menu) {
        int[] p_ItemID = {1, 2};
        for (int i = 0; i < p_ItemID.length; i++) {
            switch (p_ItemID[i]) {
                case 1:
                    p_Menu.add(0, p_ItemID[i], 0, "编辑");
                    break;
                case 2:
                    p_Menu.add(0, p_ItemID[i], 0, "删除");
                    break;
            }
        }
    }

    public HttpClient sslClient(HttpClient client) {
        try {
            X509TrustManager tm = new X509TrustManager() { // from class: com.edutech.mobilestudyclient.activity.ActivityBase.1
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
        if (m_szWLANMAC != null && m_szWLANMAC.equals("02:00:00:00:00:00")) {
            m_szWLANMAC = getMacAddr();
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

    public int checkMobileStudyClientIDAuth() {
        if (!idfileMobileStudyClient.exists() || idfileMobileStudyClient.length() <= 0) {
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
            FileInputStream filein2 = new FileInputStream(idfileMobileStudyClient);
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
        if (idfileMobileStudyClient.exists()) {
            if (usedTimes.equals("0")) {
                List<String> idInfo = readIDFile();
                if (idInfo.get(0).equals(idString) && idInfo.get(5) != null && idInfo.get(5).length() > 0) {
                    hasUsedTimes = idInfo.get(5);
                }
            }
            idfileMobileStudyClient.delete();
        }
        idfileMobileStudyClient = FileInOutHelper.setupOrOpenFile(filepathMobileStudyClient);
        try {
            FileOutputStream fileos2 = new FileOutputStream(idfileMobileStudyClient);
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
        }
    }

    public static HashMap<String, String> loadIpXml() {
        File xmlFile = FileInOutHelper.setupOrOpenFile(AppEnvironment.URLFILEPATH);
        FileInputStream filein = null;
        HashMap<String, String> hashmap = new HashMap<>();
        try {
            FileInputStream filein2 = new FileInputStream(xmlFile);
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
                        if ("ip".equals(nodeName)) {
                            hashmap.put("ip", xmlPullParser.nextText());
                        }
                        if ("username".equals(nodeName)) {
                            try {
                                hashmap.put("username", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                        if (com.edutech.idauthentication.AppEnvironment.PASSWORD.equals(nodeName)) {
                            try {
                                hashmap.put(com.edutech.idauthentication.AppEnvironment.PASSWORD, BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
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
        } catch (XmlPullParserException e4) {
            e4.printStackTrace();
        }
        return hashmap;
    }
}
