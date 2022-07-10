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
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class HttpUtils {
    static String TAG = "HttpUtils";

    public static String getNotification(String url, String username, String privatekey) {
        if (url.equals("") || url == null || username.equals("") || username == null) {
            Log.e(TAG, "getConfigData 入参有问题");
            return null;
        }
        try {
            HttpResponse httpResponse = Get_http_addheader(url, username, privatekey);
            Log.e(TAG, "解析返回的内容...");
            if (httpResponse == null) {
                return "";
            }
            if (httpResponse.getStatusLine().getStatusCode() == 200) {
                StringBuilder builder = new StringBuilder();
                BufferedReader bufferedReader2 = new BufferedReader(new InputStreamReader(httpResponse.getEntity().getContent(), "UTF-8"));
                for (String s = bufferedReader2.readLine(); s != null; s = bufferedReader2.readLine()) {
                    builder.append(s);
                }
                String sb = builder.toString();
                Log.e(TAG, "学校和用户个人信息获取完成。。。");
                return sb;
            }
            Log.e(TAG, "连接状态码Status=" + httpResponse.getStatusLine().getStatusCode());
            return null;
        } catch (ClientProtocolException e) {
            e.printStackTrace();
            return null;
        } catch (IOException e2) {
            e2.printStackTrace();
            return null;
        }
    }

    public static String getConfigData(String url, String username) {
        if (url.equals("") || url == null || username.equals("") || username == null) {
            Log.e(TAG, "getConfigData 入参有问题");
            return null;
        }
        try {
            HttpResponse httpResponse = Get_http_addheader(url, username);
            Log.e(TAG, "解析返回的内容...");
            if (httpResponse == null) {
                return "";
            }
            if (httpResponse.getStatusLine().getStatusCode() == 200) {
                StringBuilder builder = new StringBuilder();
                BufferedReader bufferedReader2 = new BufferedReader(new InputStreamReader(httpResponse.getEntity().getContent(), "UTF-8"));
                for (String s = bufferedReader2.readLine(); s != null; s = bufferedReader2.readLine()) {
                    builder.append(s);
                }
                return builder.toString();
            }
            Log.e(TAG, "连接状态码Status=" + httpResponse.getStatusLine().getStatusCode());
            return null;
        } catch (ClientProtocolException e) {
            e.printStackTrace();
            return null;
        } catch (IOException e2) {
            e2.printStackTrace();
            return null;
        }
    }

    private static HttpResponse Get_http_addheader(String url, String user_Name) throws IOException, ClientProtocolException {
        HttpGet request = new HttpGet(url);
        request.addHeader("X-Edutech-Entity", user_Name);
        long imestamp = System.currentTimeMillis();
        String sign = My_md5.Md5(String.valueOf(imestamp) + user_Name);
        request.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpResponse httpResponse = httpClient.execute(request);
            return httpResponse;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private static HttpResponse Get_http_addheader(String url, String user_Name, String privatekey) throws IOException, ClientProtocolException {
        HttpGet request = new HttpGet(url);
        request.addHeader("X-Edutech-Entity", user_Name);
        long imestamp = System.currentTimeMillis();
        String sign = My_md5.Md5(String.valueOf(imestamp) + user_Name + privatekey);
        request.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
            HttpResponse httpResponse = httpClient.execute(request);
            return httpResponse;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
