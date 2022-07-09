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

/* loaded from: classes.jar:com/pgyersdk/c/g.class */
public final class g {
    static final HostnameVerifier a = new h();

    /* JADX DEBUG: Another duplicated slice has different insns count: {[MOVE]}, finally: {[MOVE, INVOKE, INVOKE, MOVE_EXCEPTION, MOVE, INVOKE, INVOKE, INVOKE, MOVE_EXCEPTION, IF] complete} */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v8, types: [java.io.InputStream] */
    public static String a(String str, List list) {
        InputStream inputStream;
        String str2;
        String readLine;
        InputStream inputStream2 = null;
        HttpPost httpPost = new HttpPost(str);
        try {
            if (list != null) {
                inputStream = null;
                str = null;
                try {
                    httpPost.setEntity(new UrlEncodedFormEntity(list, "UTF-8"));
                } catch (Exception e) {
                    InputStream inputStream3 = inputStream;
                    InputStream inputStream4 = inputStream;
                    InputStream inputStream5 = inputStream;
                    System.out.println("log_tag:Error in http connection " + e.toString());
                    str2 = "";
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                            str2 = "";
                        } catch (IOException e2) {
                            e2.printStackTrace();
                            str2 = "";
                        }
                    }
                }
            }
            BasicHttpParams basicHttpParams = new BasicHttpParams();
            HttpConnectionParams.setConnectionTimeout(basicHttpParams, 10000);
            HttpConnectionParams.setSoTimeout(basicHttpParams, 10000);
            HttpResponse execute = new DefaultHttpClient(basicHttpParams).execute(httpPost);
            String str3 = "";
            if (execute.getStatusLine().getStatusCode() == 200) {
                InputStream content = execute.getEntity().getContent();
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(content, "UTF-8"), 8);
                StringBuilder sb = new StringBuilder();
                while (true) {
                    if (bufferedReader.readLine() == null) {
                        break;
                    }
                    sb.append(String.valueOf(readLine) + "\n");
                }
                inputStream = content;
                str = content;
                inputStream2 = content;
                str3 = sb.toString();
            }
            str2 = str3;
            if (inputStream2 != null) {
                try {
                    inputStream2.close();
                    str2 = str3;
                } catch (IOException e3) {
                    e3.printStackTrace();
                    str2 = str3;
                }
            }
            return str2;
        } catch (Throwable th) {
            if (str != null) {
                try {
                    str.close();
                } catch (IOException e4) {
                    e4.printStackTrace();
                }
            }
            throw th;
        }
    }
}
