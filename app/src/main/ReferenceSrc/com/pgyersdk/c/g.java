package com.pgyersdk.c;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import javax.net.ssl.HostnameVerifier;
import org.apache.http.HttpResponse;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class g {
    static final HostnameVerifier a = new h();

    public static String a(String str, List list) {
        InputStream inputStream = null;
        String str2 = "";
        HttpPost httpPost = new HttpPost(str);
        if (list != null) {
            try {
                try {
                    httpPost.setEntity(new UrlEncodedFormEntity(list, "UTF-8"));
                } catch (Exception e) {
                    System.out.println("log_tag:Error in http connection " + e.toString());
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (IOException e2) {
                            e2.printStackTrace();
                        }
                    }
                }
            } catch (Throwable th) {
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e3) {
                        e3.printStackTrace();
                    }
                }
                throw th;
            }
        }
        BasicHttpParams basicHttpParams = new BasicHttpParams();
        HttpConnectionParams.setConnectionTimeout(basicHttpParams, 10000);
        HttpConnectionParams.setSoTimeout(basicHttpParams, 10000);
        HttpResponse execute = new DefaultHttpClient(basicHttpParams).execute(httpPost);
        if (execute.getStatusLine().getStatusCode() == 200) {
            inputStream = execute.getEntity().getContent();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"), 8);
            StringBuilder sb = new StringBuilder();
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine == null) {
                    break;
                }
                sb.append(String.valueOf(readLine) + "\n");
            }
            str2 = sb.toString();
        }
        if (inputStream != null) {
            try {
                inputStream.close();
            } catch (IOException e4) {
                e4.printStackTrace();
            }
        }
        return str2;
    }
}
