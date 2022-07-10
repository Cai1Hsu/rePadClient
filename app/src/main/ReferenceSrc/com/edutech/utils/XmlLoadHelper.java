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
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class XmlLoadHelper {
    public static void writeXml(String path, ArrayList<HashMap<String, String>> settinginfo) {
        if (settinginfo.size() != 0) {
            File xmlFile = FileInOutHelper.setupOrOpenFile(path);
            FileOutputStream fileos = null;
            try {
                FileOutputStream fileos2 = new FileOutputStream(xmlFile);
                fileos = fileos2;
            } catch (FileNotFoundException e) {
            }
            XmlSerializer serializer = Xml.newSerializer();
            try {
                serializer.setOutput(fileos, "UTF-8");
                serializer.startDocument("", true);
                serializer.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
                serializer.startTag("", "setting");
                Iterator<HashMap<String, String>> it = settinginfo.iterator();
                while (it.hasNext()) {
                    HashMap<String, String> tempsetting = it.next();
                    serializer.startTag("", "pwdinfo");
                    String type = tempsetting.get("type");
                    serializer.attribute("", "type", type);
                    String password = tempsetting.get(AppEnvironment.PASSWORD);
                    if (password == null) {
                        password = "";
                    }
                    serializer.attribute("", AppEnvironment.PASSWORD, password);
                    String createtime = tempsetting.get(AppEnvironment.CreatTime);
                    if (createtime == null) {
                        createtime = "";
                    }
                    serializer.attribute("", AppEnvironment.CreatTime, createtime);
                    String isnew = tempsetting.get(AppEnvironment.ISNEW);
                    if (isnew == null) {
                        isnew = "0";
                    }
                    serializer.attribute("", AppEnvironment.ISNEW, isnew);
                    serializer.endTag("", "pwdinfo");
                }
                serializer.endTag("", "setting");
                serializer.endDocument();
                serializer.flush();
                fileos.close();
            } catch (Exception e2) {
            }
        }
    }

    public static ArrayList<HashMap<String, String>> loadXml(ArrayList<HashMap<String, String>> settinginfo) {
        File file = new File(AppEnvironment.SETTING_PWD_SAVE_FILEPATH);
        if (file.exists()) {
            File xmlFile = FileInOutHelper.setupOrOpenFile(AppEnvironment.SETTING_PWD_SAVE_FILEPATH);
            try {
                FileInputStream filein = new FileInputStream(xmlFile);
                try {
                    XmlPullParserFactory pullParserFactory = XmlPullParserFactory.newInstance();
                    XmlPullParser xmlPullParser = pullParserFactory.newPullParser();
                    xmlPullParser.setInput(filein, "UTF-8");
                    for (int eventType = xmlPullParser.getEventType(); eventType != 1; eventType = xmlPullParser.next()) {
                        String nodeName = xmlPullParser.getName();
                        switch (eventType) {
                            case 2:
                                if ("pwdinfo".equals(nodeName)) {
                                    new HashMap();
                                    HashMap<String, String> hashMap = getItemData(xmlPullParser);
                                    settinginfo.add(hashMap);
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
            } catch (FileNotFoundException e1) {
                e1.printStackTrace();
            }
        }
        return settinginfo;
    }

    private static HashMap<String, String> getItemData(XmlPullParser xmlPullParser) {
        HashMap<String, String> hashMap = new HashMap<>();
        for (int i = xmlPullParser.getAttributeCount() - 1; i >= 0; i--) {
            hashMap.put(xmlPullParser.getAttributeName(i), xmlPullParser.getAttributeValue(i));
        }
        return hashMap;
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
                        if (AppEnvironment.PASSWORD.equals(nodeName)) {
                            try {
                                hashmap.put(AppEnvironment.PASSWORD, BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
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
