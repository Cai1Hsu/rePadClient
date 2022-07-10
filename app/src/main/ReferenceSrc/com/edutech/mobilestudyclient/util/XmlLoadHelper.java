package com.edutech.mobilestudyclient.util;

import android.os.Environment;
import android.util.Log;
import android.util.Xml;
import com.edutech.daoxueben.sysconfig.AppEnvironment;
import com.edutech.mobilestudyclient.activity.AppBean;
import com.edutech.mobilestudyclient.download.XmlUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import org.apache.http.cookie.ClientCookie;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;
import org.xmlpull.v1.XmlSerializer;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class XmlLoadHelper {
    static HashMap<String, String> hashmap2 = new HashMap<>();
    public static final String APP_PATH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/EBag/.System/";
    public static final String CONFIG_FILE_PATH = String.valueOf(APP_PATH) + "userinfo.edu";
    public static final String CONFIG_FILET_PATH = String.valueOf(APP_PATH) + "usertinfo.edu";
    public static final String LANUAGE_FILE_PATH = String.valueOf(APP_PATH) + "language.edu";
    private static final String URLFILEPATH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/setting.xml";

    public static HashMap<String, String> loadXml() {
        Log.i("XmlLoadHelper", "loadXml");
        File xmlFile = FileInOutHelper.setupOrOpenFile(AppEnvironment.URLFILEPATH);
        HashMap<String, String> hashmap = new HashMap<>();
        FileInputStream filein = null;
        if (xmlFile == null || !xmlFile.exists()) {
            return null;
        }
        try {
            FileInputStream filein2 = new FileInputStream(xmlFile);
            filein = filein2;
        } catch (FileNotFoundException e1) {
            e1.printStackTrace();
        }
        try {
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
                            if ("stuid".equals(nodeName)) {
                                try {
                                    hashmap.put("stuid", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                    Log.e("base64", BZip2Utils.Base64DecodeToString("QlpoOTFBWSZTWSUOoTAAAAEIABIAIAAwgEFGLuSKcKEgSh1CYA=="));
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                            if ("username".equals(nodeName)) {
                                try {
                                    hashmap.put("username", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e2) {
                                    e2.printStackTrace();
                                }
                            }
                            if ("stuname".equals(nodeName)) {
                                try {
                                    hashmap.put("stuname", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e3) {
                                    e3.printStackTrace();
                                }
                            }
                            if ("usercode".equals(nodeName)) {
                                try {
                                    hashmap.put("usercode", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e4) {
                                    e4.printStackTrace();
                                }
                            }
                            if (com.edutech.idauthentication.AppEnvironment.PASSWORD.equals(nodeName)) {
                                try {
                                    hashmap.put(com.edutech.idauthentication.AppEnvironment.PASSWORD, xmlPullParser.nextText());
                                } catch (Exception e5) {
                                    e5.printStackTrace();
                                }
                            }
                            if ("pwd".equals(nodeName)) {
                                try {
                                    hashmap.put("pwd", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e6) {
                                    e6.printStackTrace();
                                }
                            }
                            if (ClientCookie.DOMAIN_ATTR.equals(nodeName)) {
                                try {
                                    hashmap.put(ClientCookie.DOMAIN_ATTR, BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e7) {
                                    e7.printStackTrace();
                                }
                            }
                            if (ClientCookie.PORT_ATTR.equals(nodeName)) {
                                try {
                                    hashmap.put(ClientCookie.PORT_ATTR, BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e8) {
                                    e8.printStackTrace();
                                }
                            }
                            if ("tigase_ip".equals(nodeName)) {
                                try {
                                    hashmap.put("tigase_ip", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e9) {
                                    e9.printStackTrace();
                                }
                            }
                            if ("apihost".equals(nodeName)) {
                                try {
                                    hashmap.put("apihost", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e10) {
                                    e10.printStackTrace();
                                }
                            }
                            if ("privatekey".equals(nodeName)) {
                                try {
                                    hashmap.put("privatekey", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e11) {
                                    e11.printStackTrace();
                                }
                            }
                            if ("mongo_domain".equals(nodeName)) {
                                try {
                                    hashmap.put("mongo_domain", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e12) {
                                    e12.printStackTrace();
                                }
                            }
                            if ("mongo_port".equals(nodeName)) {
                                try {
                                    hashmap.put("mongo_port", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e13) {
                                    e13.printStackTrace();
                                }
                            }
                            if ("mongo_user".equals(nodeName)) {
                                try {
                                    hashmap.put("mongo_user", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e14) {
                                    e14.printStackTrace();
                                }
                            }
                            if ("mongo_pwd".equals(nodeName)) {
                                try {
                                    hashmap.put("mongo_pwd", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e15) {
                                    e15.printStackTrace();
                                }
                            }
                            if ("user_type".equals(nodeName)) {
                                try {
                                    hashmap.put("user_type", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e16) {
                                    e16.printStackTrace();
                                }
                            }
                            if ("schoolid".equals(nodeName)) {
                                try {
                                    hashmap.put("schoolid", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e17) {
                                    e17.printStackTrace();
                                }
                            }
                            if ("schoolname".equals(nodeName)) {
                                try {
                                    hashmap.put("schoolname", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e18) {
                                    e18.printStackTrace();
                                }
                            }
                            if ("owncloudip".equals(nodeName)) {
                                try {
                                    hashmap.put("owncloudip", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                } catch (Exception e19) {
                                    e19.printStackTrace();
                                }
                            }
                            if ("gdstate".equals(nodeName)) {
                                try {
                                    hashmap.put("gdstate", BZip2Utils.Base64DecodeToString(xmlPullParser.nextText()));
                                    continue;
                                } catch (Exception e20) {
                                    e20.printStackTrace();
                                    continue;
                                }
                            } else {
                                continue;
                            }
                    }
                }
                hashmap2 = hashmap;
                if (filein != null) {
                    try {
                        filein.close();
                    } catch (IOException e21) {
                        e21.printStackTrace();
                    }
                }
            } catch (Exception e22) {
                e22.printStackTrace();
                hashmap2 = hashmap;
                if (filein != null) {
                    try {
                        filein.close();
                    } catch (IOException e23) {
                        e23.printStackTrace();
                    }
                }
            }
            return hashmap2;
        } catch (Throwable th) {
            hashmap2 = hashmap;
            if (filein != null) {
                try {
                    filein.close();
                } catch (IOException e24) {
                    e24.printStackTrace();
                }
            }
            throw th;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static ArrayList<AppBean> loadXml2() {
        Throwable th;
        Exception e;
        Log.i("XmlLoadHelper", "loadXml");
        ArrayList<AppBean> apps = new ArrayList<>();
        HashMap<String, String> config = new HashMap<>();
        AppBean app = null;
        File xmlFile = FileInOutHelper.setupOrOpenFile(XmlUtils.launcherDetail_path);
        new HashMap();
        FileInputStream filein = null;
        if (!xmlFile.exists()) {
            return null;
        }
        try {
            FileInputStream filein2 = new FileInputStream(xmlFile);
            filein = filein2;
        } catch (FileNotFoundException e1) {
            e1.printStackTrace();
        }
        try {
            try {
                XmlPullParserFactory pullParserFactory = XmlPullParserFactory.newInstance();
                XmlPullParser xmlPullParser = pullParserFactory.newPullParser();
                xmlPullParser.setInput(filein, "UTF-8");
                int eventType = xmlPullParser.getEventType();
                while (true) {
                    AppBean app2 = app;
                    HashMap<String, String> config2 = config;
                    if (eventType == 1) {
                        if (filein != null) {
                            try {
                                filein.close();
                                return apps;
                            } catch (IOException e2) {
                                e2.printStackTrace();
                            }
                        }
                        return apps;
                    }
                    try {
                        String nodeName = xmlPullParser.getName();
                        switch (eventType) {
                            case 0:
                                app = app2;
                                config = config2;
                                break;
                            case 1:
                            default:
                                app = app2;
                                config = config2;
                                break;
                            case 2:
                                if ("app".equals(nodeName)) {
                                    app = new AppBean();
                                    try {
                                        config = new HashMap<>();
                                    } catch (Exception e3) {
                                        e = e3;
                                        e.printStackTrace();
                                        if (filein == null) {
                                            return apps;
                                        }
                                        try {
                                            filein.close();
                                            return apps;
                                        } catch (IOException e4) {
                                            e4.printStackTrace();
                                            return apps;
                                        }
                                    } catch (Throwable th2) {
                                        th = th2;
                                        if (filein != null) {
                                            try {
                                                filein.close();
                                            } catch (IOException e5) {
                                                e5.printStackTrace();
                                            }
                                        }
                                        throw th;
                                    }
                                } else {
                                    app = app2;
                                    config = config2;
                                }
                                if ("code".equals(nodeName)) {
                                    app.setCode(xmlPullParser.nextText());
                                }
                                if ("name".equals(nodeName)) {
                                    app.setName(xmlPullParser.nextText());
                                }
                                if ("color".equals(nodeName)) {
                                    app.setColor(xmlPullParser.nextText());
                                }
                                if ("icon".equals(nodeName)) {
                                    app.setIcon(xmlPullParser.nextText());
                                }
                                if ("iconLocal".equals(nodeName)) {
                                    app.setIconLocal(xmlPullParser.nextText());
                                }
                                if (ClientCookie.COMMENT_ATTR.equals(nodeName)) {
                                    config.put(ClientCookie.COMMENT_ATTR, xmlPullParser.nextText());
                                }
                                if ("download".equals(nodeName)) {
                                    config.put("download", xmlPullParser.nextText());
                                }
                                if ("enable".equals(nodeName)) {
                                    app.setEnable(Integer.parseInt(xmlPullParser.nextText()));
                                    break;
                                }
                                break;
                            case 3:
                                if ("app".equals(nodeName)) {
                                    app2.setConfig(config2);
                                    apps.add(app2);
                                    app = app2;
                                    config = config2;
                                    break;
                                }
                                app = app2;
                                config = config2;
                                break;
                        }
                        eventType = xmlPullParser.next();
                    } catch (Exception e6) {
                        e = e6;
                    } catch (Throwable th3) {
                        th = th3;
                    }
                }
            } catch (Throwable th4) {
                th = th4;
            }
        } catch (Exception e7) {
            e = e7;
        }
    }

    public static boolean createLanuage(String language) {
        File xmlFile = new File(LANUAGE_FILE_PATH);
        if (!xmlFile.exists()) {
            File appFile = new File(APP_PATH);
            if (!appFile.exists()) {
                appFile.mkdirs();
            }
            try {
                xmlFile.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(xmlFile);
            XmlSerializer serial = Xml.newSerializer();
            serial.setOutput(fileOutputStream, "UTF-8");
            serial.startDocument("utf-8", true);
            serial.startTag("", "Setting");
            serial.startTag("", "language");
            serial.text(language);
            serial.endTag("", "language");
            serial.endTag("", "Setting");
            serial.endDocument();
            fileOutputStream.flush();
            fileOutputStream.close();
            return true;
        } catch (FileNotFoundException e2) {
            return false;
        } catch (IOException e3) {
            return false;
        } catch (IllegalArgumentException e4) {
            return false;
        } catch (IllegalStateException e5) {
            return false;
        } catch (NullPointerException e6) {
            return true;
        } catch (Exception e7) {
            return true;
        }
    }
}
