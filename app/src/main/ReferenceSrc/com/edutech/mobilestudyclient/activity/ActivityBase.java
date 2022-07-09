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
import java.util.Iterator;
import java.util.List;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.apache.commons.net.imap.IMAPSClient;
import org.apache.http.client.HttpClient;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.tools.ant.util.DateUtils;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/ActivityBase.class */
public class ActivityBase extends Activity {
    protected static final int SHOW_TIME = 1;
    private static String filepathMobileStudyClient = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/CloudClient/.System/idau.xml";
    private static File idfileMobileStudyClient = new File(filepathMobileStudyClient);
    public static String seed = "Edutech@2013";
    protected ProgressDialog mProgressDialog;

    public static HashMap<String, String> loadIpXml() {
        File file = FileInOutHelper.setupOrOpenFile(AppEnvironment.URLFILEPATH);
        FileInputStream fileInputStream = null;
        HashMap<String, String> hashMap = new HashMap<>();
        try {
            fileInputStream = new FileInputStream(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        try {
            XmlPullParser newPullParser = XmlPullParserFactory.newInstance().newPullParser();
            newPullParser.setInput(fileInputStream, "UTF-8");
            for (int eventType = newPullParser.getEventType(); eventType != 1; eventType = newPullParser.next()) {
                String name = newPullParser.getName();
                switch (eventType) {
                    case 2:
                        if ("ip".equals(name)) {
                            hashMap.put("ip", newPullParser.nextText());
                        }
                        if ("username".equals(name)) {
                            try {
                                hashMap.put("username", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                            } catch (Exception e2) {
                                e2.printStackTrace();
                            }
                        }
                        if (com.edutech.idauthentication.AppEnvironment.PASSWORD.equals(name)) {
                            try {
                                hashMap.put(com.edutech.idauthentication.AppEnvironment.PASSWORD, BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
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
        } catch (XmlPullParserException e5) {
            e5.printStackTrace();
        }
        return hashMap;
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
            fileInputStream = new FileInputStream(idfileMobileStudyClient);
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

    public final String GetMachineID() {
        TelephonyManager telephonyManager = (TelephonyManager) getSystemService("phone");
        StringBuilder sb = new StringBuilder();
        sb.append("\nModel = " + Build.MODEL);
        sb.append("\nSerialNumber = " + Build.SERIAL);
        sb.append("\nDeviceId(IMEI) = " + telephonyManager.getDeviceId());
        sb.append("\nAndroidID = " + Settings.Secure.getString(getContentResolver(), "android_id"));
        String macAddress = ((WifiManager) getSystemService("wifi")).getConnectionInfo().getMacAddress();
        String str = macAddress;
        if (macAddress != null) {
            str = macAddress;
            if (macAddress.equals("02:00:00:00:00:00")) {
                str = getMacAddr();
            }
        }
        sb.append("\nMACAddress = " + str);
        return String.valueOf(toHexString(toMd5(sb.toString().getBytes()), "")) + ":" + str.replaceAll(":", "");
    }

    protected void ShowMsg(int i) {
        Toast.makeText(this, i, 1).show();
    }

    protected void ShowMsg(String str) {
        Toast makeText = Toast.makeText(this, str, 0);
        makeText.setGravity(17, 0, 0);
        makeText.show();
    }

    public int checkMobileStudyClientIDAuth() {
        int i;
        if (!idfileMobileStudyClient.exists() || idfileMobileStudyClient.length() <= 0) {
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

    protected void createMenu(Menu menu) {
        int[] iArr = {1, 2};
        for (int i = 0; i < iArr.length; i++) {
            switch (iArr[i]) {
                case 1:
                    menu.add(0, iArr[i], 0, "编辑");
                    break;
                case 2:
                    menu.add(0, iArr[i], 0, "删除");
                    break;
            }
        }
    }

    protected void dismissProgressDialog() {
        if (this.mProgressDialog != null) {
            this.mProgressDialog.dismiss();
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

    protected void openActivity(Class<?> cls) {
        Intent intent = new Intent();
        intent.setClass(this, cls);
        startActivity(intent);
    }

    public void setAlertDialogIsClose(DialogInterface dialogInterface, Boolean bool) {
        try {
            Field declaredField = dialogInterface.getClass().getSuperclass().getDeclaredField("mShowing");
            declaredField.setAccessible(true);
            declaredField.set(dialogInterface, bool);
        } catch (Exception e) {
        }
    }

    protected AlertDialog showAlertDialog(int i, String str, DialogInterface.OnClickListener onClickListener) {
        return showAlertDialog(getString(i), str, onClickListener);
    }

    protected AlertDialog showAlertDialog(String str, String str2, DialogInterface.OnClickListener onClickListener) {
        return new AlertDialog.Builder(this).setTitle(str).setMessage(str2).setPositiveButton("确定", onClickListener).setNegativeButton("取消", (DialogInterface.OnClickListener) null).show();
    }

    protected void showProgressDialog(int i, int i2) {
        this.mProgressDialog = new ProgressDialog(this);
        this.mProgressDialog.setTitle(getString(i));
        this.mProgressDialog.setMessage(getString(i2));
        this.mProgressDialog.show();
    }

    public HttpClient sslClient(HttpClient httpClient) {
        DefaultHttpClient defaultHttpClient;
        try {
            X509TrustManager x509TrustManager = new X509TrustManager() { // from class: com.edutech.mobilestudyclient.activity.ActivityBase.1
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

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x01cb -> B:16:0x008c). Please submit an issue!!! */
    public void writeidFile(String str, int i, String str2, String str3, String str4) {
        FileOutputStream fileOutputStream;
        String str5 = str4;
        if (idfileMobileStudyClient.exists()) {
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
            idfileMobileStudyClient.delete();
        }
        idfileMobileStudyClient = FileInOutHelper.setupOrOpenFile(filepathMobileStudyClient);
        try {
            fileOutputStream = new FileOutputStream(idfileMobileStudyClient);
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
        }
    }
}
