package com.edutech.idauthentication;

import com.edutech.publicedu.log.LogHelp;
import com.edutech.utils.XmlLoadHelper;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

/* loaded from: classes.dex */
public class PostThreadHelper {
    public static void logPostHttp(String ip, String logPath) {
        String url = AppEnvironment.LOGJSON_HTTPPOST_URL(ip);
        String json = JsonHelper.getFileString(logPath);
        if (url != null && json != null && !"".equals(url) && !"".equals(json)) {
            HttpPost httpRequest = new HttpPost(url);
            List<NameValuePair> params = new ArrayList<>();
            params.add(new BasicNameValuePair("data", json));
            try {
                httpRequest.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
                HttpResponse httpResponse = new DefaultHttpClient().execute(httpRequest);
                if (httpResponse.getStatusLine().getStatusCode() == 200) {
                    String strResult = EntityUtils.toString(httpResponse.getEntity());
                    int intResult = JsonHelper.parseHttpPostReturnJson(strResult);
                    if (intResult == 0) {
                        File Logfile = new File(logPath);
                        if (Logfile.exists()) {
                            Logfile.delete();
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

    public static String postHttp(String url) {
        if ("".equals(url) || url == null || "".equals(url)) {
            return "";
        }
        HttpPost httpRequest = new HttpPost(url);
        List<NameValuePair> params = new ArrayList<>();
        try {
            httpRequest.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
            HttpResponse httpResponse = new DefaultHttpClient().execute(httpRequest);
            if (httpResponse.getStatusLine().getStatusCode() != 200) {
                return "";
            }
            String strResult = EntityUtils.toString(httpResponse.getEntity());
            return strResult;
        } catch (ClientProtocolException e) {
            e.printStackTrace();
            return "";
        } catch (IOException e2) {
            e2.printStackTrace();
            return "";
        } catch (Exception e3) {
            e3.printStackTrace();
            return "";
        }
    }

    public static void savdSettingPwd(String type, String password) {
        ArrayList<HashMap<String, String>> settinginfo = new ArrayList<>();
        if (password != null && !"".equals(password)) {
            if (type.equals(LogHelp.TYPE_GUIDANCE)) {
                try {
                    AESSet aesSetting = new AESSet();
                    password = AESSet.bytesToHex(aesSetting.encrypt(password));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            String createTime = SystemTimeHelper.getTheSystemTime();
            ArrayList<HashMap<String, String>> settinginfo2 = XmlLoadHelper.loadXml(settinginfo);
            boolean isexist = false;
            Iterator<HashMap<String, String>> it = settinginfo2.iterator();
            while (it.hasNext()) {
                HashMap<String, String> tempsetting = it.next();
                tempsetting.put(AppEnvironment.ISNEW, "0");
                if (type.equals(tempsetting.get("type"))) {
                    tempsetting.put(AppEnvironment.PASSWORD, password);
                    tempsetting.put(AppEnvironment.CreatTime, createTime);
                    tempsetting.put(AppEnvironment.ISNEW, LogHelp.TYPE_GUIDANCE);
                    isexist = true;
                }
            }
            if (!isexist) {
                HashMap<String, String> tempsetting2 = new HashMap<>();
                tempsetting2.put("type", type);
                tempsetting2.put(AppEnvironment.PASSWORD, password);
                tempsetting2.put(AppEnvironment.CreatTime, createTime);
                tempsetting2.put(AppEnvironment.ISNEW, LogHelp.TYPE_GUIDANCE);
                settinginfo2.add(tempsetting2);
            }
            XmlLoadHelper.writeXml(AppEnvironment.SETTING_PWD_SAVE_FILEPATH, settinginfo2);
        }
    }
}
