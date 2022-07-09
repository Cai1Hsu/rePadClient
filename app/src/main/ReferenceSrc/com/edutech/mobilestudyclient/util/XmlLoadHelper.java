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

/* loaded from: classes.jar:com/edutech/mobilestudyclient/util/XmlLoadHelper.class */
public class XmlLoadHelper {
    static HashMap<String, String> hashmap2 = new HashMap<>();
    public static final String APP_PATH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/EBag/.System/";
    public static final String CONFIG_FILE_PATH = String.valueOf(APP_PATH) + "userinfo.edu";
    public static final String CONFIG_FILET_PATH = String.valueOf(APP_PATH) + "usertinfo.edu";
    public static final String LANUAGE_FILE_PATH = String.valueOf(APP_PATH) + "language.edu";
    private static final String URLFILEPATH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/setting.xml";

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:13:0x0097 -> B:26:0x0030). Please submit an issue!!! */
    public static boolean createLanuage(String str) {
        boolean z = true;
        File file = new File(LANUAGE_FILE_PATH);
        if (!file.exists()) {
            File file2 = new File(APP_PATH);
            if (!file2.exists()) {
                file2.mkdirs();
            }
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            XmlSerializer newSerializer = Xml.newSerializer();
            newSerializer.setOutput(fileOutputStream, "UTF-8");
            newSerializer.startDocument("utf-8", true);
            newSerializer.startTag("", "Setting");
            newSerializer.startTag("", "language");
            newSerializer.text(str);
            newSerializer.endTag("", "language");
            newSerializer.endTag("", "Setting");
            newSerializer.endDocument();
            fileOutputStream.flush();
            fileOutputStream.close();
        } catch (FileNotFoundException e2) {
            z = false;
        } catch (IOException e3) {
            z = false;
        } catch (IllegalArgumentException e4) {
            z = false;
        } catch (IllegalStateException e5) {
            z = false;
        } catch (NullPointerException e6) {
        } catch (Exception e7) {
        }
        return z;
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[SPUT, MOVE]}, finally: {[SPUT, MOVE, MOVE, INVOKE, INVOKE, MOVE_EXCEPTION, MOVE, INVOKE, INVOKE, MOVE_EXCEPTION, IF] complete} */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:164:0x0412 -> B:18:0x005d). Please submit an issue!!! */
    public static HashMap<String, String> loadXml() {
        HashMap<String, String> hashMap;
        Log.i("XmlLoadHelper", "loadXml");
        File file = FileInOutHelper.setupOrOpenFile(AppEnvironment.URLFILEPATH);
        HashMap<String, String> hashMap2 = new HashMap<>();
        FileInputStream fileInputStream = null;
        if (file == null || !file.exists()) {
            hashMap = null;
        } else {
            try {
                fileInputStream = new FileInputStream(file);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
            try {
                try {
                    XmlPullParser newPullParser = XmlPullParserFactory.newInstance().newPullParser();
                    newPullParser.setInput(fileInputStream, "UTF-8");
                    for (int eventType = newPullParser.getEventType(); eventType != 1; eventType = newPullParser.next()) {
                        String name = newPullParser.getName();
                        switch (eventType) {
                            case 2:
                                if ("ip".equals(name)) {
                                    hashMap2.put("ip", newPullParser.nextText());
                                }
                                if ("stuid".equals(name)) {
                                    try {
                                        hashMap2.put("stuid", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                        Log.e("base64", BZip2Utils.Base64DecodeToString("QlpoOTFBWSZTWSUOoTAAAAEIABIAIAAwgEFGLuSKcKEgSh1CYA=="));
                                    } catch (Exception e2) {
                                        e2.printStackTrace();
                                    }
                                }
                                if ("username".equals(name)) {
                                    try {
                                        hashMap2.put("username", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e3) {
                                        e3.printStackTrace();
                                    }
                                }
                                if ("stuname".equals(name)) {
                                    try {
                                        hashMap2.put("stuname", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e4) {
                                        e4.printStackTrace();
                                    }
                                }
                                if ("usercode".equals(name)) {
                                    try {
                                        hashMap2.put("usercode", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e5) {
                                        e5.printStackTrace();
                                    }
                                }
                                if (com.edutech.idauthentication.AppEnvironment.PASSWORD.equals(name)) {
                                    try {
                                        hashMap2.put(com.edutech.idauthentication.AppEnvironment.PASSWORD, newPullParser.nextText());
                                    } catch (Exception e6) {
                                        e6.printStackTrace();
                                    }
                                }
                                if ("pwd".equals(name)) {
                                    try {
                                        hashMap2.put("pwd", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e7) {
                                        e7.printStackTrace();
                                    }
                                }
                                if (ClientCookie.DOMAIN_ATTR.equals(name)) {
                                    try {
                                        hashMap2.put(ClientCookie.DOMAIN_ATTR, BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e8) {
                                        e8.printStackTrace();
                                    }
                                }
                                if (ClientCookie.PORT_ATTR.equals(name)) {
                                    try {
                                        hashMap2.put(ClientCookie.PORT_ATTR, BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e9) {
                                        e9.printStackTrace();
                                    }
                                }
                                if ("tigase_ip".equals(name)) {
                                    try {
                                        hashMap2.put("tigase_ip", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e10) {
                                        e10.printStackTrace();
                                    }
                                }
                                if ("apihost".equals(name)) {
                                    try {
                                        hashMap2.put("apihost", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e11) {
                                        e11.printStackTrace();
                                    }
                                }
                                if ("privatekey".equals(name)) {
                                    try {
                                        hashMap2.put("privatekey", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e12) {
                                        e12.printStackTrace();
                                    }
                                }
                                if ("mongo_domain".equals(name)) {
                                    try {
                                        hashMap2.put("mongo_domain", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e13) {
                                        e13.printStackTrace();
                                    }
                                }
                                if ("mongo_port".equals(name)) {
                                    try {
                                        hashMap2.put("mongo_port", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e14) {
                                        e14.printStackTrace();
                                    }
                                }
                                if ("mongo_user".equals(name)) {
                                    try {
                                        hashMap2.put("mongo_user", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e15) {
                                        e15.printStackTrace();
                                    }
                                }
                                if ("mongo_pwd".equals(name)) {
                                    try {
                                        hashMap2.put("mongo_pwd", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e16) {
                                        e16.printStackTrace();
                                    }
                                }
                                if ("user_type".equals(name)) {
                                    try {
                                        hashMap2.put("user_type", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e17) {
                                        e17.printStackTrace();
                                    }
                                }
                                if ("schoolid".equals(name)) {
                                    try {
                                        hashMap2.put("schoolid", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e18) {
                                        e18.printStackTrace();
                                    }
                                }
                                if ("schoolname".equals(name)) {
                                    try {
                                        hashMap2.put("schoolname", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e19) {
                                        e19.printStackTrace();
                                    }
                                }
                                if ("owncloudip".equals(name)) {
                                    try {
                                        hashMap2.put("owncloudip", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                    } catch (Exception e20) {
                                        e20.printStackTrace();
                                    }
                                }
                                if ("gdstate".equals(name)) {
                                    try {
                                        hashMap2.put("gdstate", BZip2Utils.Base64DecodeToString(newPullParser.nextText()));
                                        break;
                                    } catch (Exception e21) {
                                        e21.printStackTrace();
                                        break;
                                    }
                                } else {
                                    break;
                                }
                        }
                    }
                    hashmap2 = hashMap2;
                    if (fileInputStream != null) {
                        try {
                            fileInputStream.close();
                        } catch (IOException e22) {
                            e22.printStackTrace();
                        }
                    }
                } catch (Exception e23) {
                    e23.printStackTrace();
                    hashmap2 = hashMap2;
                    if (fileInputStream != null) {
                        try {
                            fileInputStream.close();
                        } catch (IOException e24) {
                            e24.printStackTrace();
                        }
                    }
                }
                hashMap = hashmap2;
            } catch (Throwable th) {
                hashmap2 = hashMap2;
                if (fileInputStream != null) {
                    try {
                        fileInputStream.close();
                    } catch (IOException e25) {
                        e25.printStackTrace();
                    }
                }
                throw th;
            }
        }
        return hashMap;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static ArrayList<AppBean> loadXml2() {
        Throwable th;
        Exception e;
        ArrayList<AppBean> arrayList;
        HashMap<String, String> hashMap;
        AppBean appBean;
        AppBean appBean2;
        HashMap<String, String> hashMap2;
        Log.i("XmlLoadHelper", "loadXml");
        ArrayList<AppBean> arrayList2 = new ArrayList<>();
        HashMap<String, String> hashMap3 = new HashMap<>();
        File file = FileInOutHelper.setupOrOpenFile(XmlUtils.launcherDetail_path);
        new HashMap();
        FileInputStream fileInputStream = null;
        if (!file.exists()) {
            arrayList = null;
        } else {
            try {
                fileInputStream = new FileInputStream(file);
            } catch (FileNotFoundException e2) {
                e2.printStackTrace();
            }
            try {
                try {
                    XmlPullParser newPullParser = XmlPullParserFactory.newInstance().newPullParser();
                    newPullParser.setInput(fileInputStream, "UTF-8");
                    int eventType = newPullParser.getEventType();
                    AppBean appBean3 = null;
                    while (eventType != 1) {
                        try {
                            String name = newPullParser.getName();
                            switch (eventType) {
                                case 0:
                                    AppBean appBean4 = appBean3;
                                    hashMap = hashMap3;
                                    appBean = appBean4;
                                    break;
                                case 1:
                                default:
                                    AppBean appBean5 = appBean3;
                                    hashMap = hashMap3;
                                    appBean = appBean5;
                                    break;
                                case 2:
                                    if ("app".equals(name)) {
                                        appBean2 = new AppBean();
                                        try {
                                            hashMap2 = new HashMap<>();
                                        } catch (Exception e3) {
                                            e = e3;
                                            e.printStackTrace();
                                            arrayList = arrayList2;
                                            if (fileInputStream != null) {
                                                try {
                                                    fileInputStream.close();
                                                    arrayList = arrayList2;
                                                } catch (IOException e4) {
                                                    e4.printStackTrace();
                                                    arrayList = arrayList2;
                                                }
                                            }
                                            return arrayList;
                                        } catch (Throwable th2) {
                                            th = th2;
                                            if (fileInputStream != null) {
                                                try {
                                                    fileInputStream.close();
                                                } catch (IOException e5) {
                                                    e5.printStackTrace();
                                                }
                                            }
                                            throw th;
                                        }
                                    } else {
                                        appBean2 = appBean3;
                                        hashMap2 = hashMap3;
                                    }
                                    if ("code".equals(name)) {
                                        appBean2.setCode(newPullParser.nextText());
                                    }
                                    if ("name".equals(name)) {
                                        appBean2.setName(newPullParser.nextText());
                                    }
                                    if ("color".equals(name)) {
                                        appBean2.setColor(newPullParser.nextText());
                                    }
                                    if ("icon".equals(name)) {
                                        appBean2.setIcon(newPullParser.nextText());
                                    }
                                    if ("iconLocal".equals(name)) {
                                        appBean2.setIconLocal(newPullParser.nextText());
                                    }
                                    if (ClientCookie.COMMENT_ATTR.equals(name)) {
                                        hashMap2.put(ClientCookie.COMMENT_ATTR, newPullParser.nextText());
                                    }
                                    if ("download".equals(name)) {
                                        hashMap2.put("download", newPullParser.nextText());
                                    }
                                    appBean = appBean2;
                                    hashMap = hashMap2;
                                    if ("enable".equals(name)) {
                                        appBean2.setEnable(Integer.parseInt(newPullParser.nextText()));
                                        appBean = appBean2;
                                        hashMap = hashMap2;
                                        break;
                                    }
                                    break;
                                case 3:
                                    if ("app".equals(name)) {
                                        appBean3.setConfig(hashMap3);
                                        arrayList2.add(appBean3);
                                        AppBean appBean6 = appBean3;
                                        hashMap = hashMap3;
                                        appBean = appBean6;
                                        break;
                                    }
                                    AppBean appBean52 = appBean3;
                                    hashMap = hashMap3;
                                    appBean = appBean52;
                                    break;
                            }
                            eventType = newPullParser.next();
                            HashMap<String, String> hashMap4 = hashMap;
                            appBean3 = appBean;
                            hashMap3 = hashMap4;
                        } catch (Exception e6) {
                            e = e6;
                        } catch (Throwable th3) {
                            th = th3;
                        }
                    }
                    if (fileInputStream != null) {
                        try {
                            fileInputStream.close();
                            arrayList = arrayList2;
                        } catch (IOException e7) {
                            e7.printStackTrace();
                        }
                    }
                    arrayList = arrayList2;
                } catch (Exception e8) {
                    e = e8;
                }
            } catch (Throwable th4) {
                th = th4;
            }
        }
        return arrayList;
    }
}
