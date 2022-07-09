package com.edutech.utils;

import android.util.Xml;
import com.edutech.idauthentication.AppEnvironment;
import com.edutech.idauthentication.FileInOutHelper;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: classes.jar:com/edutech/utils/XmlLoadHelper.class */
public class XmlLoadHelper {
    private static HashMap<String, String> getItemData(XmlPullParser xmlPullParser) {
        HashMap<String, String> hashMap = new HashMap<>();
        for (int attributeCount = xmlPullParser.getAttributeCount() - 1; attributeCount >= 0; attributeCount--) {
            hashMap.put(xmlPullParser.getAttributeName(attributeCount), xmlPullParser.getAttributeValue(attributeCount));
        }
        return hashMap;
    }

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
                        if (AppEnvironment.PASSWORD.equals(name)) {
                            try {
                                hashMap.put(AppEnvironment.PASSWORD, BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
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

    public static ArrayList<HashMap<String, String>> loadXml(ArrayList<HashMap<String, String>> arrayList) {
        if (new File(AppEnvironment.SETTING_PWD_SAVE_FILEPATH).exists()) {
            try {
                FileInputStream fileInputStream = new FileInputStream(FileInOutHelper.setupOrOpenFile(AppEnvironment.SETTING_PWD_SAVE_FILEPATH));
                try {
                    XmlPullParser newPullParser = XmlPullParserFactory.newInstance().newPullParser();
                    newPullParser.setInput(fileInputStream, "UTF-8");
                    for (int eventType = newPullParser.getEventType(); eventType != 1; eventType = newPullParser.next()) {
                        String name = newPullParser.getName();
                        switch (eventType) {
                            case 2:
                                if ("pwdinfo".equals(name)) {
                                    new HashMap();
                                    arrayList.add(getItemData(newPullParser));
                                    break;
                                } else {
                                    break;
                                }
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                } catch (XmlPullParserException e2) {
                    e2.printStackTrace();
                }
            } catch (FileNotFoundException e3) {
                e3.printStackTrace();
            }
        }
        return arrayList;
    }

    public static void writeXml(String str, ArrayList<HashMap<String, String>> arrayList) {
        if (arrayList.size() == 0) {
            return;
        }
        File file = FileInOutHelper.setupOrOpenFile(str);
        FileOutputStream fileOutputStream = null;
        try {
            fileOutputStream = new FileOutputStream(file);
        } catch (FileNotFoundException e) {
        }
        XmlSerializer newSerializer = Xml.newSerializer();
        try {
            newSerializer.setOutput(fileOutputStream, "UTF-8");
            newSerializer.startDocument("", true);
            newSerializer.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
            newSerializer.startTag("", "setting");
            Iterator<HashMap<String, String>> it = arrayList.iterator();
            while (it.hasNext()) {
                HashMap<String, String> next = it.next();
                newSerializer.startTag("", "pwdinfo");
                newSerializer.attribute("", "type", next.get("type"));
                String str2 = next.get(AppEnvironment.PASSWORD);
                String str3 = str2;
                if (str2 == null) {
                    str3 = "";
                }
                newSerializer.attribute("", AppEnvironment.PASSWORD, str3);
                String str4 = next.get(AppEnvironment.CreatTime);
                String str5 = str4;
                if (str4 == null) {
                    str5 = "";
                }
                newSerializer.attribute("", AppEnvironment.CreatTime, str5);
                String str6 = next.get(AppEnvironment.ISNEW);
                String str7 = str6;
                if (str6 == null) {
                    str7 = "0";
                }
                newSerializer.attribute("", AppEnvironment.ISNEW, str7);
                newSerializer.endTag("", "pwdinfo");
            }
            newSerializer.endTag("", "setting");
            newSerializer.endDocument();
            newSerializer.flush();
            fileOutputStream.close();
        } catch (Exception e2) {
        }
    }
}
