package com.edutech.mobilestudyclient.download;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Environment;
import android.util.Log;
import android.util.Xml;
import com.cloudclientsetting.until.BZip2Utils;
import com.cloudclientsetting.until.FileInOutHelper;
import com.edutech.mobilestudyclient.SysConfig.AppEnvironment;
import com.edutech.mobilestudyclient.activity.AppBean;
import com.edutech.publicedu.log.LogHelp;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import org.apache.http.cookie.ClientCookie;
import org.apache.tools.ant.taskdefs.SQLExec;
import org.jivesoftware.smackx.workgroup.packet.UserID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.xmlpull.v1.XmlSerializer;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class XmlUtils {
    static String TAG = "xmlUtils";
    public static String launcherDetail_path = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/launcher.xml";

    public static int saveLauncher(String json_str, Context mcontext) {
        String usercode;
        String userid;
        if (json_str == null || json_str.equals("") || mcontext == null) {
            return -1;
        }
        boolean isUpdate = false;
        try {
            JSONObject info = new JSONObject(json_str);
            info.getString("status");
            String errorNum = info.getString("errorNum");
            info.getString("errorInfo");
            if (errorNum.equals("0")) {
                JSONObject data = info.getJSONObject("data");
                String privatekey = data.getString("privatekey");
                String encrypt = data.getString("encrypt");
                String apihost = data.getString("apihost");
                JSONObject user = data.getJSONObject(UserID.ELEMENT_NAME);
                user.getString("pubkey");
                String type_user = user.getString("type");
                if (!type_user.equals("03") && type_user.equals(LogHelp.TYPE_HWHELP)) {
                    return 2;
                }
                try {
                    userid = user.getString("id");
                } catch (Exception e) {
                    e.printStackTrace();
                }
                try {
                    usercode = user.getString("usercode");
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
                SharedPreferences sharePre = mcontext.getSharedPreferences("privatekey", 0);
                SharedPreferences.Editor editor = sharePre.edit();
                JSONObject ebag = null;
                try {
                    ebag = data.getJSONObject("ebag");
                    if (ebag != null && !sharePre.getString("updatetime", "").equals(ebag.getString("updatetime"))) {
                        Log.i("liu", "save time:" + sharePre.getString("updatetime", ""));
                        Log.i("liu", "request time:" + ebag.getString("updatetime"));
                        isUpdate = true;
                        editor.putString("updatetime", ebag.getString("updatetime"));
                    }
                } catch (Exception e1) {
                    e1.printStackTrace();
                }
                editor.putString("userid", userid);
                editor.commit();
                String wifi = null;
                String setting = null;
                String large = null;
                String normal = null;
                String small = null;
                ArrayList<AppBean> apps = new ArrayList<>();
                try {
                    JSONObject desktopicon = ebag.getJSONObject("desktopicon");
                    wifi = desktopicon.getString("wifi");
                    setting = desktopicon.getString("setting");
                    JSONObject background = desktopicon.getJSONObject("background");
                    large = background.getString("large");
                    normal = background.getString(SQLExec.DelimiterType.NORMAL);
                    small = background.getString("small");
                    SharedPreferences sp = mcontext.getSharedPreferences("launcherpicture", 0);
                    if (isUpdate) {
                        addLauncherIconUrl("wifi", wifi, sp);
                        addLauncherIconUrl("setting", setting, sp);
                        addLauncherIconUrl("large", large, sp);
                        addLauncherIconUrl(SQLExec.DelimiterType.NORMAL, normal, sp);
                        addLauncherIconUrl("small", small, sp);
                    }
                    try {
                        HashMap<String, String> config2 = new HashMap<>();
                        config2.put(ClientCookie.COMMENT_ATTR, "-1");
                        config2.put("download", "-1");
                        apps.add(new AppBean("wifi", "wifi", "", wifi, 1, config2, String.valueOf(AppEnvironment.icon) + wifi.substring(wifi.lastIndexOf("/") + 1)));
                        apps.add(new AppBean("setting", "setting", "", setting, 1, config2, String.valueOf(AppEnvironment.icon) + setting.substring(setting.lastIndexOf("/") + 1)));
                        apps.add(new AppBean("large", "large", "", large, 1, config2, String.valueOf(AppEnvironment.icon) + large.substring(large.lastIndexOf("/") + 1)));
                        apps.add(new AppBean(SQLExec.DelimiterType.NORMAL, SQLExec.DelimiterType.NORMAL, "", normal, 1, config2, String.valueOf(AppEnvironment.icon) + normal.substring(normal.lastIndexOf("/") + 1)));
                        apps.add(new AppBean("small", "small", "", small, 1, config2, String.valueOf(AppEnvironment.icon) + small.substring(small.lastIndexOf("/") + 1)));
                    } catch (Exception e3) {
                    }
                    JSONArray app = ebag.getJSONArray("app");
                    for (int i = 0; i < app.length(); i++) {
                        HashMap<String, String> config = new HashMap<>();
                        String code = app.getJSONObject(i).getString("code");
                        String name = app.getJSONObject(i).getString("name");
                        String color = app.getJSONObject(i).getString("color");
                        String icon = app.getJSONObject(i).getString("icon");
                        String iconLocal = String.valueOf(AppEnvironment.icon) + icon.substring(icon.lastIndexOf("/") + 1);
                        if (isUpdate) {
                            addLauncherIconUrl(code, icon, sp);
                        }
                        int enable = app.getJSONObject(i).getInt("enable");
                        try {
                            String comment = new StringBuilder(String.valueOf(app.getJSONObject(i).getJSONObject("config").getInt(ClientCookie.COMMENT_ATTR))).toString();
                            String download = new StringBuilder(String.valueOf(app.getJSONObject(i).getJSONObject("config").getInt("download"))).toString();
                            config.put(ClientCookie.COMMENT_ATTR, comment);
                            config.put("download", download);
                        } catch (Exception e4) {
                            config.put(ClientCookie.COMMENT_ATTR, "-1");
                            config.put("download", "-1");
                            e4.printStackTrace();
                        }
                        apps.add(new AppBean(code, name, color, icon, enable, config, iconLocal));
                    }
                } catch (Exception e5) {
                    e5.printStackTrace();
                }
                writeXml_config(privatekey, encrypt, apihost, usercode, userid, apps, launcherDetail_path);
                ArrayList<String> urls = new ArrayList<>();
                ArrayList<String> codes = new ArrayList<>();
                urls.add(wifi);
                codes.add("wifi");
                urls.add(setting);
                codes.add("setting");
                urls.add(large);
                codes.add("large");
                urls.add(normal);
                codes.add(SQLExec.DelimiterType.NORMAL);
                urls.add(small);
                codes.add("small");
                for (int i2 = 0; i2 < apps.size(); i2++) {
                    urls.add(apps.get(i2).getIcon());
                    codes.add(apps.get(i2).getCode());
                }
                Log.i(TAG, "更新icon");
                downLoadImage(urls, codes, mcontext);
                return 1;
            }
            Log.i(TAG, "配置信息 json数据  返回错误数据。。。");
            return -1;
        } catch (JSONException e6) {
            Log.i(TAG, "配置信息 json数据  返回错误数据。。。" + e6.toString());
            e6.printStackTrace();
            return -1;
        }
    }

    private static void addLauncherIconUrl(String name, String url, SharedPreferences sp) {
        if (sp != null && url != null && !url.equals("")) {
            String tempurl = sp.getString(name, "");
            if (!url.equals(tempurl)) {
                sp.edit().putString(name, url).commit();
            }
        }
    }

    private static void downLoadImage(ArrayList<String> urls, ArrayList<String> codes, Context mcontext) {
        if (urls != null && codes != null && urls.size() == codes.size()) {
            SharedPreferences sp = mcontext.getSharedPreferences("launcherpicture", 0);
            for (int i = 0; i < urls.size(); i++) {
                String codestr = codes.get(i);
                if (sp.contains(codestr)) {
                    try {
                        URL url = new URL(urls.get(i));
                        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                        int code = conn.getResponseCode();
                        if (code == 200) {
                            InputStream in = conn.getInputStream();
                            savePic(in, urls.get(i));
                            sp.edit().remove(codestr).commit();
                        }
                        conn.disconnect();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    private static void savePic(InputStream in, String url) {
        Throwable th;
        FileOutputStream out;
        if (in == null) {
            return;
        }
        String picPath = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/icon";
        String name = url.substring(url.lastIndexOf("/") + 1);
        File file = FileInOutHelper.setupOrOpenFile(picPath, name);
        FileOutputStream out2 = null;
        try {
            try {
                out = new FileOutputStream(file);
            } catch (Exception e) {
                e = e;
            }
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            byte[] b = new byte[1024];
            while (true) {
                int length = in.read(b);
                if (length == -1) {
                    try {
                        in.close();
                        out.close();
                        return;
                    } catch (Exception e2) {
                        e2.printStackTrace();
                        return;
                    }
                }
                out.write(b, 0, length);
            }
        } catch (Exception e3) {
            e = e3;
            out2 = out;
            e.printStackTrace();
            Log.i("liu", "savePic:" + e);
            try {
                in.close();
                out2.close();
            } catch (Exception e4) {
                e4.printStackTrace();
            }
        } catch (Throwable th3) {
            th = th3;
            out2 = out;
            try {
                in.close();
                out2.close();
            } catch (Exception e5) {
                e5.printStackTrace();
            }
            throw th;
        }
    }

    private static void writeXml_config(String privatekey, String encrypt, String apihost, String usercode, String userid, ArrayList<AppBean> apps, String urlfilepath) {
        Log.i(TAG, "writeXml");
        String stuid = "";
        String ip = "";
        try {
            privatekey = BZip2Utils.StringEncodeToBase64(privatekey);
            ip = BZip2Utils.StringEncodeToBase64(apihost);
            usercode = BZip2Utils.StringEncodeToBase64(usercode);
            stuid = BZip2Utils.StringEncodeToBase64(userid);
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        File xmlFile = FileInOutHelper.setupOrOpenFile(urlfilepath);
        if (!xmlFile.exists()) {
            try {
                xmlFile.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        FileOutputStream fileos = null;
        try {
            fileos = new FileOutputStream(xmlFile);
        } catch (FileNotFoundException e2) {
            Log.e("FileNotFoundException", "can't create FileOutputStream");
        } catch (Exception e3) {
        }
        if (fileos != null) {
            XmlSerializer serializer = Xml.newSerializer();
            try {
                serializer.setOutput(fileos, "UTF-8");
                serializer.startDocument(null, true);
                serializer.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
                try {
                    serializer.startTag(null, "urlpath");
                    try {
                        serializer.startTag(null, "ip");
                        serializer.text(ip);
                        serializer.endTag(null, "ip");
                    } catch (Exception e4) {
                        e4.printStackTrace();
                    }
                    serializer.endTag(null, "urlpath");
                } catch (Exception e5) {
                    e5.printStackTrace();
                }
                try {
                    serializer.startTag(null, "student");
                    try {
                        serializer.startTag(null, "stuid");
                        serializer.text(stuid);
                        serializer.endTag(null, "stuid");
                        serializer.startTag(null, "usercode");
                        serializer.text(usercode);
                        serializer.endTag(null, "usercode");
                    } catch (Exception e6) {
                        e6.printStackTrace();
                    }
                    try {
                        serializer.startTag(null, "privatekey");
                        serializer.text(privatekey);
                        serializer.endTag(null, "privatekey");
                        serializer.startTag(null, "encrypt");
                        serializer.text(encrypt);
                        serializer.endTag(null, "encrypt");
                        serializer.startTag(null, "apihost");
                        serializer.text(apihost);
                        serializer.endTag(null, "apihost");
                    } catch (Exception e7) {
                        e7.printStackTrace();
                    }
                    serializer.endTag(null, "student");
                } catch (Exception e8) {
                    e8.printStackTrace();
                }
                try {
                    serializer.startTag(null, "apps");
                    for (int i = 0; i < apps.size(); i++) {
                        serializer.startTag(null, "app");
                        serializer.startTag(null, "code");
                        serializer.text(apps.get(i).getCode());
                        serializer.endTag(null, "code");
                        serializer.startTag(null, "name");
                        serializer.text(apps.get(i).getName());
                        serializer.endTag(null, "name");
                        serializer.startTag(null, "color");
                        serializer.text(apps.get(i).getColor());
                        serializer.endTag(null, "color");
                        serializer.startTag(null, "icon");
                        serializer.text(apps.get(i).getIcon());
                        serializer.endTag(null, "icon");
                        serializer.startTag(null, "iconLocal");
                        serializer.text(apps.get(i).getIconLocal());
                        serializer.endTag(null, "iconLocal");
                        serializer.startTag(null, "enable");
                        serializer.text(new StringBuilder(String.valueOf(apps.get(i).getEnable())).toString());
                        serializer.endTag(null, "enable");
                        serializer.startTag(null, "config");
                        serializer.startTag(null, "download");
                        serializer.text(apps.get(i).getConfig().get("download"));
                        serializer.endTag(null, "download");
                        serializer.startTag(null, ClientCookie.COMMENT_ATTR);
                        serializer.text(apps.get(i).getConfig().get(ClientCookie.COMMENT_ATTR));
                        serializer.endTag(null, ClientCookie.COMMENT_ATTR);
                        serializer.endTag(null, "config");
                        serializer.endTag(null, "app");
                    }
                    serializer.endTag(null, "apps");
                } catch (Exception e9) {
                    e9.printStackTrace();
                    Log.e(TAG, "write to  xml file" + e9.toString());
                }
                serializer.endDocument();
                serializer.flush();
                fileos.close();
            } catch (Exception e10) {
                e10.printStackTrace();
            }
        }
    }
}
