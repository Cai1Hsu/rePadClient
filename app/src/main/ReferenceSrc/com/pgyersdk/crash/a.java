package com.pgyersdk.crash;

import android.os.Process;
import android.util.Log;
import com.edutech.publicedu.log.LogHelp;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.Thread;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.cookie.ClientCookie;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

/* loaded from: classes.jar:com/pgyersdk/crash/a.class */
public final class a implements Thread.UncaughtExceptionHandler {
    private boolean a;
    private g b = null;
    private Thread.UncaughtExceptionHandler c;
    private String d;

    public a(Thread.UncaughtExceptionHandler uncaughtExceptionHandler, boolean z, String str) {
        this.a = false;
        this.c = uncaughtExceptionHandler;
        this.a = z;
        this.d = str;
    }

    private static void a(Throwable th, g gVar) {
        String uuid;
        Date date = new Date();
        StringWriter stringWriter = new StringWriter();
        th.printStackTrace(new PrintWriter(stringWriter));
        try {
            String str = String.valueOf(com.pgyersdk.a.a.a) + "/" + UUID.randomUUID().toString() + ".stacktrace";
            Log.d("PgyerSDK", "Writing unhandled exception to: " + str);
            BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(str));
            bufferedWriter.write("Package: " + com.pgyersdk.a.a.c + "\n");
            bufferedWriter.write("Version Code: " + com.pgyersdk.a.a.b + "\n");
            bufferedWriter.write("Version Name: " + com.pgyersdk.a.a.d + "\n");
            bufferedWriter.write("Android: " + com.pgyersdk.a.a.e + "\n");
            bufferedWriter.write("Manufacturer: " + com.pgyersdk.a.a.g + "\n");
            bufferedWriter.write("Model: " + com.pgyersdk.a.a.f + "\n");
            if (com.pgyersdk.a.a.h != null) {
                bufferedWriter.write("CrashReporter Key: " + com.pgyersdk.a.a.h + "\n");
            }
            bufferedWriter.write("Date: " + date + "\n");
            bufferedWriter.write("\n");
            bufferedWriter.write(stringWriter.toString());
            bufferedWriter.flush();
            bufferedWriter.close();
            if (gVar == null) {
                return;
            }
            b(String.valueOf(uuid) + ".user");
            b(String.valueOf(uuid) + ".contact");
            b(String.valueOf(uuid) + ".description");
        } catch (Exception e) {
            Log.e("PgyerSDK", "Error saving exception stacktrace!\n", e);
        }
    }

    private static void b(String str) {
        try {
            String str2 = String.valueOf(com.pgyersdk.a.a.a) + "/" + str;
            throw new NullPointerException();
        } catch (Exception e) {
        }
    }

    public final void a() {
        this.b = null;
    }

    public final void a(String str) {
        this.d = str;
    }

    public final void a(Throwable th) {
        Date date = new Date();
        Boolean bool = false;
        StringWriter stringWriter = new StringWriter();
        th.printStackTrace(new PrintWriter(stringWriter));
        try {
            try {
                StringBuffer stringBuffer = new StringBuffer();
                stringBuffer.append("Package: " + com.pgyersdk.a.a.c + "\n");
                stringBuffer.append("Version Code: " + com.pgyersdk.a.a.b + "\n");
                stringBuffer.append("Version Name: " + com.pgyersdk.a.a.d + "\n");
                if (this.b != null) {
                    g gVar = this.b;
                }
                stringBuffer.append("Android: " + com.pgyersdk.a.a.e + "\n");
                stringBuffer.append("Manufacturer: " + com.pgyersdk.a.a.g + "\n");
                stringBuffer.append("Model: " + com.pgyersdk.a.a.f + "\n");
                if (com.pgyersdk.a.a.h != null) {
                    if (this.b != null) {
                        g gVar2 = this.b;
                    }
                    stringBuffer.append("CrashReporter Key: " + com.pgyersdk.a.a.h + "\n");
                }
                stringBuffer.append("Date: " + date + "\n");
                stringBuffer.append("\n");
                stringBuffer.append(stringWriter.toString());
                Log.d("PgyerSDK", "Transmitting crash data: \n" + stringWriter.toString());
                DefaultHttpClient defaultHttpClient = (DefaultHttpClient) com.pgyersdk.c.b.a().b();
                HttpPost httpPost = new HttpPost("http://www.pgyer.com/apiv1/crash/add");
                ArrayList arrayList = new ArrayList();
                arrayList.add(new BasicNameValuePair("crashLog", stringBuffer.toString()));
                arrayList.add(new BasicNameValuePair("versionCode", com.pgyersdk.a.a.b));
                arrayList.add(new BasicNameValuePair(ClientCookie.VERSION_ATTR, com.pgyersdk.a.a.d));
                arrayList.add(new BasicNameValuePair("agKey", this.d));
                arrayList.add(new BasicNameValuePair("deviceId", com.pgyersdk.a.a.i));
                arrayList.add(new BasicNameValuePair("deviceName", com.pgyersdk.a.a.g));
                arrayList.add(new BasicNameValuePair("deviceModel", com.pgyersdk.a.a.f));
                arrayList.add(new BasicNameValuePair("osVersion", com.pgyersdk.a.a.e));
                arrayList.add(new BasicNameValuePair("resolution", com.pgyersdk.a.a.j));
                arrayList.add(new BasicNameValuePair("osType", LogHelp.TYPE_MYWORK));
                arrayList.add(new BasicNameValuePair("jailBroken", com.pgyersdk.a.a.a() ? LogHelp.TYPE_GUIDANCE : LogHelp.TYPE_MYWORK));
                arrayList.add(new BasicNameValuePair("freeSpace", String.valueOf(com.pgyersdk.a.a.b())));
                arrayList.add(new BasicNameValuePair("freeRam", LogHelp.TYPE_GUIDANCE));
                arrayList.add(new BasicNameValuePair("protrait", LogHelp.TYPE_GUIDANCE));
                arrayList.add(new BasicNameValuePair("network", LogHelp.TYPE_GUIDANCE));
                arrayList.add(new BasicNameValuePair("sdkVersion", "1.0.0"));
                arrayList.add(new BasicNameValuePair("_api_key", "305092bc73c180b55c26012a94809131"));
                httpPost.setEntity(new UrlEncodedFormEntity(arrayList, "UTF-8"));
                defaultHttpClient.execute(httpPost);
                Boolean bool2 = true;
                if (bool2.booleanValue()) {
                    Log.d("PgyerSDK", "Transmission succeeded");
                    return;
                }
                Log.d("PgyerSDK", "Transmission failed, will retry on next register() call");
                a(th, this.b);
            } catch (Exception e) {
                e.printStackTrace();
                if (bool.booleanValue()) {
                    Log.d("PgyerSDK", "Transmission succeeded");
                    return;
                }
                Log.d("PgyerSDK", "Transmission failed, will retry on next register() call");
                a(th, this.b);
            }
        } catch (Throwable th2) {
            if (bool.booleanValue()) {
                Log.d("PgyerSDK", "Transmission succeeded");
            } else {
                Log.d("PgyerSDK", "Transmission failed, will retry on next register() call");
                a(th, this.b);
            }
            throw th2;
        }
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public final void uncaughtException(Thread thread, Throwable th) {
        if (com.pgyersdk.a.a.a == null) {
            this.c.uncaughtException(thread, th);
            return;
        }
        new b(this, th).start();
        if (!this.a) {
            this.c.uncaughtException(thread, th);
            return;
        }
        Process.killProcess(Process.myPid());
        System.exit(10);
    }
}
