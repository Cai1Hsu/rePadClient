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
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: classes.jar:com/edutech/idauthentication/Aduth.class */
public class Aduth {
    private static String filepath = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/CloudClient/.System/idau.xml";
    public static String filepathMobileStudyClient_NEW = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/CloudClient/.System/idau_new.xml";
    private static File idfile = new File(filepath);
    private static File idfile_new = new File(filepathMobileStudyClient_NEW);
    public static String seed = "Edutech@2013";
    private Context mContext;

    public Aduth(Context context) {
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
        boolean z = false;
        if (idfile_new.exists()) {
            z = true;
        }
        try {
            fileInputStream = z ? new FileInputStream(idfile_new) : new FileInputStream(idfile);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        try {
            XmlPullParser newPullParser = XmlPullParserFactory.newInstance().newPullParser();
            newPullParser.setInput(fileInputStream, "UTF-8");
            int eventType = newPullParser.getEventType();
            while (eventType != 1) {
                String name = newPullParser.getName();
                String str7 = str5;
                String str8 = str;
                String str9 = str2;
                String str10 = str3;
                String str11 = str4;
                String str12 = str6;
                switch (eventType) {
                    case 0:
                    case 1:
                    case 3:
                        break;
                    case 2:
                        if ("a1".equals(name)) {
                            str = newPullParser.nextText();
                        }
                        if ("b2".equals(name)) {
                            str2 = newPullParser.nextText();
                        }
                        if ("c3".equals(name)) {
                            str3 = newPullParser.nextText();
                        }
                        if ("d4".equals(name)) {
                            str4 = newPullParser.nextText();
                        }
                        if ("e5".equals(name)) {
                            str5 = newPullParser.nextText();
                        }
                        str7 = str5;
                        str8 = str;
                        str9 = str2;
                        str10 = str3;
                        str11 = str4;
                        str12 = str6;
                        if ("f6".equals(name)) {
                            str12 = newPullParser.nextText();
                            str7 = str5;
                            str8 = str;
                            str9 = str2;
                            str10 = str3;
                            str11 = str4;
                            break;
                        }
                        break;
                    default:
                        str12 = str6;
                        str11 = str4;
                        str10 = str3;
                        str9 = str2;
                        str8 = str;
                        str7 = str5;
                        break;
                }
                eventType = newPullParser.next();
                str5 = str7;
                str = str8;
                str2 = str9;
                str3 = str10;
                str4 = str11;
                str6 = str12;
            }
            try {
                fileInputStream.close();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
            arrayList.add("");
            arrayList.add("");
            arrayList.add("");
            arrayList.add("");
            arrayList.add("");
            arrayList.add("");
            if (new File(filepathMobileStudyClient_NEW).exists()) {
                z = true;
            }
            Log.e("idauth", "readIDFile:" + z);
            Log.e("idauth", "readIDFile:" + str + "," + str2 + "," + str3 + "," + str4 + "," + str5 + "," + str6);
            try {
                if (str != null) {
                    if (z) {
                        arrayList.set(0, BZip2Utils.Base64DecodeToString(str));
                    } else {
                        arrayList.set(0, AESUtils2.decrypt(seed, str));
                    }
                }
                if (str2 != null) {
                    if (z) {
                        arrayList.set(1, BZip2Utils.Base64DecodeToString(str2));
                    } else {
                        arrayList.set(1, AESUtils2.decrypt(seed, str2));
                    }
                }
                if (str3 != null) {
                    if (z) {
                        arrayList.set(2, BZip2Utils.Base64DecodeToString(str3));
                    } else {
                        arrayList.set(2, AESUtils2.decrypt(seed, str3));
                    }
                }
                if (str4 != null) {
                    if (z) {
                        arrayList.set(3, BZip2Utils.Base64DecodeToString(str4));
                    } else {
                        arrayList.set(3, AESUtils2.decrypt(seed, str4));
                    }
                }
                if (str5 != null) {
                    if (z) {
                        arrayList.set(4, BZip2Utils.Base64DecodeToString(str5));
                    } else {
                        arrayList.set(4, AESUtils2.decrypt(seed, str5));
                    }
                }
                if (str6 != null) {
                    if (z) {
                        arrayList.set(5, BZip2Utils.Base64DecodeToString(str6));
                    } else {
                        arrayList.set(5, AESUtils2.decrypt(seed, str6));
                    }
                }
            } catch (Exception e3) {
                e3.printStackTrace();
            }
        } catch (IOException e4) {
            e4.printStackTrace();
        } catch (XmlPullParserException e5) {
            e5.printStackTrace();
        } catch (Exception e6) {
            e6.printStackTrace();
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

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x012f -> B:17:0x0125). Please submit an issue!!! */
    public final String GetMachineID() {
        TelephonyManager telephonyManager = (TelephonyManager) this.mContext.getSystemService("phone");
        StringBuilder sb = new StringBuilder();
        sb.append("\nModel = " + Build.MODEL);
        sb.append("\nSerialNumber = " + Build.SERIAL);
        sb.append("\nDeviceId(IMEI) = " + telephonyManager.getDeviceId());
        sb.append("\nAndroidID = " + Settings.Secure.getString(this.mContext.getContentResolver(), "android_id"));
        WifiManager wifiManager = (WifiManager) this.mContext.getSystemService("wifi");
        String macAddress = wifiManager.getConnectionInfo().getMacAddress();
        String str = macAddress;
        if (macAddress == null) {
            int i = 0;
            while (true) {
                str = macAddress;
                if (i > 5) {
                    break;
                }
                macAddress = wifiManager.getConnectionInfo().getMacAddress();
                if (macAddress != null) {
                    str = macAddress;
                    if (macAddress.length() > 0) {
                        break;
                    }
                }
                try {
                    Thread.sleep(org.apache.tools.ant.util.FileUtils.FAT_FILE_TIMESTAMP_GRANULARITY);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                i++;
            }
        }
        String str2 = str;
        if (str == null) {
            str2 = "";
        }
        sb.append("\nMACAddress = " + str2);
        Log.d("info", sb.toString());
        return String.valueOf(toHexString(toMd5(sb.toString().getBytes()), "")) + ":" + str2.replaceAll(":", "");
    }

    public int checkIDAuth() {
        int i;
        if ((!idfile.exists() || idfile.length() <= 0) && (!idfile_new.exists() || idfile_new.length() <= 0)) {
            i = 1;
        } else {
            List<String> readIDFile = readIDFile();
            if (readIDFile == null || readIDFile.size() <= 0) {
                i = 2;
            } else {
                Log.e("idauth", "idInfo is" + readIDFile);
                String str = readIDFile.get(0);
                String str2 = readIDFile.get(1);
                String str3 = readIDFile.get(2);
                String str4 = readIDFile.get(3);
                String str5 = readIDFile.get(4);
                String str6 = readIDFile.get(5);
                Log.e("idauth", "idString is" + str);
                Log.e("idauth", "machineID is" + str2);
                Log.e("idauth", "resultString is" + str3);
                Log.e("idauth", "times is" + str4);
                Log.e("idauth", "date is" + str5);
                Log.e("idauth", "usedTimes is" + str6);
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
            }
        }
        return i;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x01b9 -> B:16:0x008c). Please submit an issue!!! */
    public void writeidFile(String str, int i, String str2, String str3, String str4) {
        FileOutputStream fileOutputStream;
        String str5 = str4;
        if (idfile_new.exists()) {
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
            idfile_new.delete();
        }
        idfile_new = FileUtils.setupOrOpenFile(filepathMobileStudyClient_NEW);
        try {
            fileOutputStream = new FileOutputStream(idfile_new);
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
            newSerializer.text(BZip2Utils.StringEncodeToBase64(str));
            newSerializer.endTag(null, "a1");
            newSerializer.startTag(null, "b2");
            newSerializer.text(BZip2Utils.StringEncodeToBase64(GetMachineID()));
            newSerializer.endTag(null, "b2");
            newSerializer.startTag(null, "c3");
            newSerializer.text(BZip2Utils.StringEncodeToBase64(String.valueOf(i)));
            newSerializer.endTag(null, "c3");
            newSerializer.startTag(null, "d4");
            newSerializer.text(BZip2Utils.StringEncodeToBase64(str2));
            newSerializer.endTag(null, "d4");
            newSerializer.startTag(null, "e5");
            newSerializer.text(BZip2Utils.StringEncodeToBase64(str3));
            newSerializer.endTag(null, "e5");
            newSerializer.startTag(null, "f6");
            newSerializer.text(BZip2Utils.StringEncodeToBase64(str5));
            newSerializer.endTag(null, "f6");
            newSerializer.endTag(null, "id");
            newSerializer.endDocument();
            newSerializer.flush();
            fileOutputStream.close();
        } catch (Exception e2) {
        }
    }
}
