package com.edutech.idauthentication;

import com.edutech.publicedu.log.LogHelp;
import com.edutech.utils.XmlLoadHelper;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

/* loaded from: classes.jar:com/edutech/idauthentication/PostThreadHelper.class */
public class PostThreadHelper {
    public static void logPostHttp(String str, String str2) {
        String LOGJSON_HTTPPOST_URL = AppEnvironment.LOGJSON_HTTPPOST_URL(str);
        String fileString = JsonHelper.getFileString(str2);
        if (LOGJSON_HTTPPOST_URL == null || fileString == null || "".equals(LOGJSON_HTTPPOST_URL) || "".equals(fileString)) {
            return;
        }
        HttpPost httpPost = new HttpPost(LOGJSON_HTTPPOST_URL);
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("data", fileString));
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(arrayList, "UTF-8"));
            HttpResponse execute = new DefaultHttpClient().execute(httpPost);
            if (execute.getStatusLine().getStatusCode() != 200 || JsonHelper.parseHttpPostReturnJson(EntityUtils.toString(execute.getEntity())) != 0) {
                return;
            }
            File file = new File(str2);
            if (!file.exists()) {
                return;
            }
            file.delete();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        } catch (Exception e3) {
            e3.printStackTrace();
        }
    }

    public static String postHttp(String str) {
        String str2;
        if ("".equals(str)) {
            str2 = "";
        } else {
            str2 = "";
            if (str != null) {
                str2 = "";
                if (!"".equals(str)) {
                    HttpPost httpPost = new HttpPost(str);
                    try {
                        httpPost.setEntity(new UrlEncodedFormEntity(new ArrayList(), "UTF-8"));
                        HttpResponse execute = new DefaultHttpClient().execute(httpPost);
                        str2 = "";
                        if (execute.getStatusLine().getStatusCode() == 200) {
                            str2 = EntityUtils.toString(execute.getEntity());
                        }
                    } catch (ClientProtocolException e) {
                        e.printStackTrace();
                        str2 = "";
                    } catch (IOException e2) {
                        e2.printStackTrace();
                        str2 = "";
                    } catch (Exception e3) {
                        e3.printStackTrace();
                        str2 = "";
                    }
                }
            }
        }
        return str2;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:19:0x0090 -> B:9:0x0031). Please submit an issue!!! */
    public static void savdSettingPwd(String str, String str2) {
        ArrayList arrayList = new ArrayList();
        if (str2 == null || "".equals(str2)) {
            return;
        }
        String str3 = str2;
        if (str.equals(LogHelp.TYPE_GUIDANCE)) {
            try {
                str3 = AESSet.bytesToHex(new AESSet().encrypt(str2));
            } catch (Exception e) {
                e.printStackTrace();
                str3 = str2;
            }
        }
        String theSystemTime = SystemTimeHelper.getTheSystemTime();
        ArrayList<HashMap<String, String>> loadXml = XmlLoadHelper.loadXml(arrayList);
        boolean z = false;
        Iterator<HashMap<String, String>> it = loadXml.iterator();
        while (it.hasNext()) {
            HashMap<String, String> next = it.next();
            next.put(AppEnvironment.ISNEW, "0");
            if (str.equals(next.get("type"))) {
                next.put(AppEnvironment.PASSWORD, str3);
                next.put(AppEnvironment.CreatTime, theSystemTime);
                next.put(AppEnvironment.ISNEW, LogHelp.TYPE_GUIDANCE);
                z = true;
            }
        }
        if (!z) {
            HashMap<String, String> hashMap = new HashMap<>();
            hashMap.put("type", str);
            hashMap.put(AppEnvironment.PASSWORD, str3);
            hashMap.put(AppEnvironment.CreatTime, theSystemTime);
            hashMap.put(AppEnvironment.ISNEW, LogHelp.TYPE_GUIDANCE);
            loadXml.add(hashMap);
        }
        XmlLoadHelper.writeXml(AppEnvironment.SETTING_PWD_SAVE_FILEPATH, loadXml);
    }
}
