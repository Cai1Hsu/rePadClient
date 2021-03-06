package com.pgyersdk.crash;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import com.edutech.publicedu.log.LogHelp;
import com.pgyersdk.c.j;
import com.pgyersdk.c.k;
import com.pgyersdk.c.m;
import com.pgyersdk.c.n;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.Thread;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.cookie.ClientCookie;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class PgyCrashManager {
    private static String a = null;
    private static String b = null;
    private static boolean c = false;
    private static Context d;

    private static int a(WeakReference weakReference) {
        String[] b2 = b();
        List list = null;
        if (b2 == null || b2.length <= 0) {
            return 0;
        }
        if (weakReference != null) {
            try {
                Context context = (Context) weakReference.get();
                if (context != null) {
                    list = Arrays.asList(context.getSharedPreferences("PgyerSDK", 0).getString("ConfirmedFilenames", "").split("\\|"));
                }
            } catch (Exception e) {
            }
        }
        if (list != null) {
            for (String str : b2) {
                if (list.contains(str)) {
                }
            }
            return 2;
        }
        return 1;
    }

    public static /* synthetic */ void a() {
        c = false;
    }

    public static /* synthetic */ void a(WeakReference weakReference, g gVar) {
        int i = 0;
        String[] b2 = b();
        if (b2 == null || b2.length <= 0) {
            return;
        }
        Log.d("PgyerSDK", "Found " + b2.length + " stacktrace(s).");
        Boolean bool = false;
        while (true) {
            int i2 = i;
            if (i2 >= b2.length) {
                return;
            }
            try {
                try {
                    String b3 = b(weakReference, b2[i2]);
                    if (b3.length() > 0) {
                        Log.d("PgyerSDK", "Transmitting crash data: \n" + b3);
                        DefaultHttpClient defaultHttpClient = (DefaultHttpClient) com.pgyersdk.c.b.a().b();
                        HttpPost httpPost = new HttpPost(String.valueOf(b) + "apiv1/crash/add");
                        ArrayList arrayList = new ArrayList();
                        arrayList.add(new BasicNameValuePair("crashLog", b3));
                        arrayList.add(new BasicNameValuePair("versionCode", com.pgyersdk.a.a.b));
                        arrayList.add(new BasicNameValuePair(ClientCookie.VERSION_ATTR, com.pgyersdk.a.a.d));
                        arrayList.add(new BasicNameValuePair("agKey", a));
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
                        bool = true;
                    }
                    if (bool.booleanValue()) {
                        Log.d("PgyerSDK", "Transmission succeeded");
                        a(weakReference, b2[i2]);
                        if (gVar != null) {
                        }
                    } else {
                        Log.d("PgyerSDK", "Transmission failed, will retry on next register() call");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    if (bool.booleanValue()) {
                        Log.d("PgyerSDK", "Transmission succeeded");
                        a(weakReference, b2[i2]);
                        if (gVar != null) {
                        }
                    } else {
                        Log.d("PgyerSDK", "Transmission failed, will retry on next register() call");
                        if (gVar != null) {
                        }
                    }
                }
                i = i2 + 1;
            } catch (Throwable th) {
                if (bool.booleanValue()) {
                    Log.d("PgyerSDK", "Transmission succeeded");
                    a(weakReference, b2[i2]);
                    if (gVar != null) {
                    }
                } else {
                    Log.d("PgyerSDK", "Transmission failed, will retry on next register() call");
                }
                throw th;
            }
        }
    }

    private static void a(WeakReference weakReference, String str) {
        Context context;
        if (weakReference == null || (context = (Context) weakReference.get()) == null) {
            return;
        }
        context.deleteFile(str);
        context.deleteFile(str.replace(".stacktrace", ".user"));
        context.deleteFile(str.replace(".stacktrace", ".contact"));
        context.deleteFile(str.replace(".stacktrace", ".description"));
    }

    private static void a(WeakReference weakReference, boolean z) {
        Context context;
        if (weakReference != null && (context = (Context) weakReference.get()) != null) {
            try {
                String[] b2 = b();
                SharedPreferences.Editor edit = context.getSharedPreferences("PgyerSDK", 0).edit();
                StringBuffer stringBuffer = new StringBuffer();
                for (int i = 0; i < b2.length; i++) {
                    stringBuffer.append(b2[i]);
                    if (i < b2.length - 1) {
                        stringBuffer.append("|");
                    }
                }
                edit.putString("ConfirmedFilenames", stringBuffer.toString());
                if (j.a().booleanValue()) {
                    edit.apply();
                } else {
                    edit.commit();
                }
            } catch (Exception e) {
            }
        }
        a(z);
        if (!c) {
            c = true;
            new c(weakReference).start();
        }
    }

    private static void a(boolean z) {
        if (com.pgyersdk.a.a.b == null || com.pgyersdk.a.a.c == null) {
            Log.d("PgyerSDK", "Exception handler not set because version or package is null.");
            return;
        }
        Thread.UncaughtExceptionHandler defaultUncaughtExceptionHandler = Thread.getDefaultUncaughtExceptionHandler();
        if (defaultUncaughtExceptionHandler != null) {
            Log.d("PgyerSDK", "Current handler class = " + defaultUncaughtExceptionHandler.getClass().getName());
        }
        if (!(defaultUncaughtExceptionHandler instanceof a)) {
            Thread.setDefaultUncaughtExceptionHandler(new a(defaultUncaughtExceptionHandler, z, a));
            return;
        }
        ((a) defaultUncaughtExceptionHandler).a();
        ((a) defaultUncaughtExceptionHandler).a(a);
    }

    /* JADX WARN: Removed duplicated region for block: B:42:0x0055 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static String b(WeakReference weakReference, String str) {
        Context context;
        BufferedReader bufferedReader;
        IOException e;
        BufferedReader bufferedReader2 = null;
        if (weakReference == null || (context = (Context) weakReference.get()) == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        try {
            try {
                bufferedReader = new BufferedReader(new InputStreamReader(context.openFileInput(str)));
                while (true) {
                    try {
                        String readLine = bufferedReader.readLine();
                        if (readLine == null) {
                            try {
                                break;
                            } catch (IOException e2) {
                            }
                        } else {
                            sb.append(readLine);
                            sb.append(System.getProperty("line.separator"));
                        }
                    } catch (FileNotFoundException e3) {
                        bufferedReader2 = bufferedReader;
                        if (bufferedReader2 != null) {
                            try {
                                bufferedReader2.close();
                            } catch (IOException e4) {
                            }
                        }
                        return sb.toString();
                    } catch (IOException e5) {
                        e = e5;
                        e.printStackTrace();
                        if (bufferedReader != null) {
                            try {
                                bufferedReader.close();
                            } catch (IOException e6) {
                            }
                        }
                        return sb.toString();
                    }
                }
                bufferedReader.close();
            } catch (Throwable th) {
                th = th;
                if (0 != 0) {
                    try {
                        bufferedReader2.close();
                    } catch (IOException e7) {
                    }
                }
                throw th;
            }
        } catch (FileNotFoundException e8) {
        } catch (IOException e9) {
            e = e9;
            bufferedReader = null;
        } catch (Throwable th2) {
            th = th2;
            if (0 != 0) {
            }
            throw th;
        }
        return sb.toString();
    }

    private static String[] b() {
        if (com.pgyersdk.a.a.a == null) {
            Log.d("PgyerSDK", "Can't search for exception as file path is null.");
            return null;
        }
        Log.d("PgyerSDK", "Looking for exceptions in: " + com.pgyersdk.a.a.a);
        File file = new File(String.valueOf(com.pgyersdk.a.a.a) + "/");
        return (file.mkdir() || file.exists()) ? file.list(new d()) : new String[0];
    }

    public static void register(Context context, String appId) {
        try {
            d = context;
            com.pgyersdk.a.a.k = appId;
            if (m.a(k.a(context, "install"))) {
                com.pgyersdk.c.a.a(new e());
            }
            com.pgyersdk.c.a.a(new f());
            if (context != null) {
                b = "http://www.pgyer.com/";
                a = n.a(appId);
                com.pgyersdk.a.a.a(context);
                if (a == null) {
                    a = com.pgyersdk.a.a.c;
                }
            }
            Boolean bool = false;
            WeakReference weakReference = new WeakReference(context);
            int a2 = a(weakReference);
            if (a2 == 1) {
                Boolean.valueOf(false);
                a(weakReference, bool.booleanValue());
            } else if (a2 == 2) {
                a(weakReference, bool.booleanValue());
            } else {
                a(bool.booleanValue());
            }
        } catch (Exception e) {
        }
    }
}
