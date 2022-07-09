package com.edutech.mobilestudyclient.download;

import android.util.Log;
import com.edutech.mobilestudyclient.util.My_md5;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/download/HttpUtils.class */
public class HttpUtils {
    static String TAG = "HttpUtils";

    private static HttpResponse Get_http_addheader(String str, String str2) throws IOException, ClientProtocolException {
        HttpGet httpGet = new HttpGet(str);
        httpGet.addHeader("X-Edutech-Entity", str2);
        long currentTimeMillis = System.currentTimeMillis();
        httpGet.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + My_md5.Md5(String.valueOf(currentTimeMillis) + str2));
        HttpResponse httpResponse = null;
        try {
            httpResponse = new DefaultHttpClient().execute(httpGet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return httpResponse;
    }

    private static HttpResponse Get_http_addheader(String str, String str2, String str3) throws IOException, ClientProtocolException {
        HttpGet httpGet = new HttpGet(str);
        httpGet.addHeader("X-Edutech-Entity", str2);
        long currentTimeMillis = System.currentTimeMillis();
        httpGet.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + My_md5.Md5(String.valueOf(currentTimeMillis) + str2 + str3));
        HttpResponse httpResponse = null;
        try {
            httpResponse = new DefaultHttpClient().execute(httpGet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return httpResponse;
    }

    public static String getConfigData(String str, String str2) {
        String str3;
        if (str.equals("") || str == null || str2.equals("") || str2 == null) {
            Log.e(TAG, "getConfigData 入参有问题");
            str3 = null;
        } else {
            try {
                HttpResponse Get_http_addheader = Get_http_addheader(str, str2);
                Log.e(TAG, "解析返回的内容...");
                if (Get_http_addheader == null) {
                    str3 = "";
                } else if (Get_http_addheader.getStatusLine().getStatusCode() == 200) {
                    StringBuilder sb = new StringBuilder();
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(Get_http_addheader.getEntity().getContent(), "UTF-8"));
                    for (String readLine = bufferedReader.readLine(); readLine != null; readLine = bufferedReader.readLine()) {
                        sb.append(readLine);
                    }
                    str3 = sb.toString();
                } else {
                    Log.e(TAG, "连接状态码Status=" + Get_http_addheader.getStatusLine().getStatusCode());
                    str3 = null;
                }
            } catch (ClientProtocolException e) {
                e.printStackTrace();
                str3 = null;
            } catch (IOException e2) {
                e2.printStackTrace();
                str3 = null;
            }
        }
        return str3;
    }

    public static String getNotification(String str, String str2, String str3) {
        String str4;
        if (str.equals("") || str == null || str2.equals("") || str2 == null) {
            Log.e(TAG, "getConfigData 入参有问题");
            str4 = null;
        } else {
            try {
                HttpResponse Get_http_addheader = Get_http_addheader(str, str2, str3);
                Log.e(TAG, "解析返回的内容...");
                if (Get_http_addheader == null) {
                    str4 = "";
                } else if (Get_http_addheader.getStatusLine().getStatusCode() == 200) {
                    StringBuilder sb = new StringBuilder();
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(Get_http_addheader.getEntity().getContent(), "UTF-8"));
                    for (String readLine = bufferedReader.readLine(); readLine != null; readLine = bufferedReader.readLine()) {
                        sb.append(readLine);
                    }
                    str4 = sb.toString();
                    Log.e(TAG, "学校和用户个人信息获取完成。。。");
                } else {
                    Log.e(TAG, "连接状态码Status=" + Get_http_addheader.getStatusLine().getStatusCode());
                    str4 = null;
                }
            } catch (ClientProtocolException e) {
                e.printStackTrace();
                str4 = null;
                return str4;
            } catch (IOException e2) {
                e2.printStackTrace();
                str4 = null;
                return str4;
            }
        }
        return str4;
    }
}
