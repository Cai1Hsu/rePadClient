package com.edutech.idauthentication;

import android.content.Context;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Environment;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.util.Xml;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.tools.ant.util.DateUtils;
import org.bson.BSON;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;
import org.xmlpull.v1.XmlSerializer;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class Aduth {
    private static String filepath = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/CloudClient/.System/idau.xml";
    public static String filepathMobileStudyClient_NEW = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/CloudClient/.System/idau_new.xml";
    private static File idfile = new File(filepath);
    private static File idfile_new = new File(filepathMobileStudyClient_NEW);
    public static String seed = "Edutech@2013";
    private Context mContext;

    public Aduth(Context mContext) {
        this.mContext = mContext;
    }

    public int checkIDAuth() {
        if ((!idfile.exists() || idfile.length() <= 0) && (!idfile_new.exists() || idfile_new.length() <= 0)) {
            return 1;
        }
        List<String> idInfo = readIDFile();
        if (idInfo != null && idInfo.size() > 0) {
            Log.e("idauth", "idInfo is" + idInfo);
            String idString = idInfo.get(0);
            String machineID = idInfo.get(1);
            String resultString = idInfo.get(2);
            String times = idInfo.get(3);
            String date = idInfo.get(4);
            String usedTimes = idInfo.get(5);
            Log.e("idauth", "idString is" + idString);
            Log.e("idauth", "machineID is" + machineID);
            Log.e("idauth", "resultString is" + resultString);
            Log.e("idauth", "times is" + times);
            Log.e("idauth", "date is" + date);
            Log.e("idauth", "usedTimes is" + usedTimes);
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

    public final String GetMachineID() {
        TelephonyManager tm = (TelephonyManager) this.mContext.getSystemService("phone");
        StringBuilder sb = new StringBuilder();
        sb.append("\nModel = " + Build.MODEL);
        sb.append("\nSerialNumber = " + Build.SERIAL);
        sb.append("\nDeviceId(IMEI) = " + tm.getDeviceId());
        String android_id = Settings.Secure.getString(this.mContext.getContentResolver(), "android_id");
        sb.append("\nAndroidID = " + android_id);
        WifiManager wm = (WifiManager) this.mContext.getSystemService("wifi");
        String m_szWLANMAC = wm.getConnectionInfo().getMacAddress();
        if (m_szWLANMAC == null) {
            for (int i = 0; i <= 5 && ((m_szWLANMAC = wm.getConnectionInfo().getMacAddress()) == null || m_szWLANMAC.length() <= 0); i++) {
                try {
                    Thread.sleep(org.apache.tools.ant.util.FileUtils.FAT_FILE_TIMESTAMP_GRANULARITY);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
        if (m_szWLANMAC == null) {
            m_szWLANMAC = "";
        }
        sb.append("\nMACAddress = " + m_szWLANMAC);
        Log.d("info", sb.toString());
        return String.valueOf(toHexString(toMd5(sb.toString().getBytes()), "")) + ":" + m_szWLANMAC.replaceAll(":", "");
    }

    public static String toHexString(byte[] bytes, String separator) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            hexString.append(Integer.toHexString(b & BSON.MINKEY)).append(separator);
        }
        return hexString.toString();
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

    public static final List<String> readIDFile() {
        List<String> idInfo = new ArrayList<>();
        String idString = null;
        String machineID = null;
        String resultString = null;
        String times = null;
        String date = null;
        String usedTimes = null;
        FileInputStream filein = null;
        boolean userNewAuth = false;
        if (idfile_new.exists()) {
            userNewAuth = true;
        }
        try {
            if (userNewAuth) {
                FileInputStream filein2 = new FileInputStream(idfile_new);
                filein = filein2;
            } else {
                FileInputStream filein3 = new FileInputStream(idfile);
                filein = filein3;
            }
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
            File file = new File(filepathMobileStudyClient_NEW);
            if (file.exists()) {
                userNewAuth = true;
            }
            Log.e("idauth", "readIDFile:" + userNewAuth);
            Log.e("idauth", "readIDFile:" + idString + "," + machineID + "," + resultString + "," + times + "," + date + "," + usedTimes);
            try {
                if (idString != null) {
                    if (userNewAuth) {
                        idInfo.set(0, BZip2Utils.Base64DecodeToString(idString));
                    } else {
                        idInfo.set(0, AESUtils2.decrypt(seed, idString));
                    }
                }
                if (machineID != null) {
                    if (userNewAuth) {
                        idInfo.set(1, BZip2Utils.Base64DecodeToString(machineID));
                    } else {
                        idInfo.set(1, AESUtils2.decrypt(seed, machineID));
                    }
                }
                if (resultString != null) {
                    if (userNewAuth) {
                        idInfo.set(2, BZip2Utils.Base64DecodeToString(resultString));
                    } else {
                        idInfo.set(2, AESUtils2.decrypt(seed, resultString));
                    }
                }
                if (times != null) {
                    if (userNewAuth) {
                        idInfo.set(3, BZip2Utils.Base64DecodeToString(times));
                    } else {
                        idInfo.set(3, AESUtils2.decrypt(seed, times));
                    }
                }
                if (date != null) {
                    if (userNewAuth) {
                        idInfo.set(4, BZip2Utils.Base64DecodeToString(date));
                    } else {
                        idInfo.set(4, AESUtils2.decrypt(seed, date));
                    }
                }
                if (usedTimes != null) {
                    if (userNewAuth) {
                        idInfo.set(5, BZip2Utils.Base64DecodeToString(usedTimes));
                    } else {
                        idInfo.set(5, AESUtils2.decrypt(seed, usedTimes));
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (IOException e2) {
            e2.printStackTrace();
        } catch (XmlPullParserException e3) {
            e3.printStackTrace();
        } catch (Exception e4) {
            e4.printStackTrace();
        }
        return idInfo;
    }

    public void writeidFile(String idString, int result, String times, String date, String usedTimes) {
        FileOutputStream fileos = null;
        String hasUsedTimes = usedTimes;
        if (idfile_new.exists()) {
            if (usedTimes.equals("0")) {
                List<String> idInfo = readIDFile();
                if (idInfo.get(0).equals(idString) && idInfo.get(5) != null && idInfo.get(5).length() > 0) {
                    hasUsedTimes = idInfo.get(5);
                }
            }
            idfile_new.delete();
        }
        idfile_new = FileUtils.setupOrOpenFile(filepathMobileStudyClient_NEW);
        try {
            FileOutputStream fileos2 = new FileOutputStream(idfile_new);
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
            serializer.text(BZip2Utils.StringEncodeToBase64(idString));
            serializer.endTag(null, "a1");
            serializer.startTag(null, "b2");
            serializer.text(BZip2Utils.StringEncodeToBase64(GetMachineID()));
            serializer.endTag(null, "b2");
            serializer.startTag(null, "c3");
            serializer.text(BZip2Utils.StringEncodeToBase64(String.valueOf(result)));
            serializer.endTag(null, "c3");
            serializer.startTag(null, "d4");
            serializer.text(BZip2Utils.StringEncodeToBase64(times));
            serializer.endTag(null, "d4");
            serializer.startTag(null, "e5");
            serializer.text(BZip2Utils.StringEncodeToBase64(date));
            serializer.endTag(null, "e5");
            serializer.startTag(null, "f6");
            serializer.text(BZip2Utils.StringEncodeToBase64(hasUsedTimes));
            serializer.endTag(null, "f6");
            serializer.endTag(null, "id");
            serializer.endDocument();
            serializer.flush();
            fileos.close();
        } catch (Exception e2) {
        }
    }
}
