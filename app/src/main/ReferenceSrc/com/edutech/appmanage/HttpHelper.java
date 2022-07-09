package com.edutech.appmanage;

import android.app.DownloadManager;
import android.content.Context;
import android.net.Uri;
import android.os.Environment;
import android.util.Log;
import com.edutech.mobilestudyclient.util.My_md5;
import com.launcher.activity.R;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.GZIPInputStream;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

/* loaded from: classes.jar:com/edutech/appmanage/HttpHelper.class */
public class HttpHelper {
    private static final String TAG = "HttpHelper";
    public static ArrayList<Map<String, Object>> install_num = new ArrayList<>();
    String string;

    private static HttpResponse Get_http_addheader(String str, String str2, String str3) throws IOException, ClientProtocolException {
        HttpGet httpGet = new HttpGet(str);
        httpGet.addHeader("X-Edutech-Entity", String.valueOf(str2) + "+" + str3);
        long currentTimeMillis = System.currentTimeMillis();
        String Md5 = My_md5.Md5(String.valueOf(currentTimeMillis) + str2 + str3);
        Log.e(TAG, "timestamp=" + currentTimeMillis + "   sign=" + Md5);
        httpGet.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + Md5);
        httpGet.addHeader("Accept-Encoding", "gzip,deflate");
        return new DefaultHttpClient().execute(httpGet);
    }

    public static void download(int i, int i2) {
        DownloadManager.Request request;
        File externalStoragePublicDirectory = Environment.getExternalStoragePublicDirectory(MainActivity.FOLDER_MAIN);
        if (!externalStoragePublicDirectory.exists() || !externalStoragePublicDirectory.isDirectory()) {
            externalStoragePublicDirectory.mkdirs();
        }
        HashMap hashMap = new HashMap();
        if (1 == i2) {
            request = new DownloadManager.Request(Uri.parse(MainActivity.market_applist.get(i).webpath.toString()));
            request.setDestinationInExternalPublicDir(MainActivity.FOLDER_MAIN, MainActivity.market_applist.get(i).apkname);
            hashMap.put("apkname", MainActivity.market_applist.get(i).apkname);
            hashMap.put("packagename", MainActivity.market_applist.get(i).packagename);
        } else {
            request = null;
            if (i2 == 0) {
                request = null;
                if (MainActivity.market_applist.get(i).webpath != null) {
                    for (int i3 = 0; i3 < MainActivity.market_applist.size(); i3++) {
                    }
                    request = new DownloadManager.Request(Uri.parse(MainActivity.market_applist.get(i).webpath.toString()));
                    request.setDestinationInExternalPublicDir(MainActivity.FOLDER_MAIN, MainActivity.market_applist.get(i).apkname);
                    hashMap.put("apkname", MainActivity.market_applist.get(i).apkname);
                    hashMap.put("packagename", MainActivity.market_applist.get(i).packagename);
                }
            }
        }
        request.setNotificationVisibility(1);
        long enqueue = MainActivity.downloadManager.enqueue(request);
        MainActivity.downloadManagerPro.getBytesAndStatus(enqueue);
        hashMap.put("downid", Long.valueOf(enqueue));
        hashMap.put("type", Integer.valueOf(i2));
        hashMap.put("position", Integer.valueOf(i));
        hashMap.put("setuped", false);
        install_num.add(hashMap);
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x003b, code lost:
        if (r5.equals("") != false) goto L13;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private String getContactJson(String str, String str2, String str3, String str4) {
        String str5;
        if (str == null || str.equals("")) {
            Log.i(TAG, "getContactJson 入参有问题。。。");
            str5 = null;
        } else {
            try {
                HttpResponse Get_http_addheader = Get_http_addheader(str, str2, str3);
                Log.e(TAG, "JSON 数据获取准备。。。");
                str5 = getJsonStringFromGZIP(Get_http_addheader);
                if (str5 != null) {
                }
                str5 = "";
            } catch (Exception e) {
                e.printStackTrace();
                str5 = "";
            }
        }
        return str5;
    }

    private static String getJsonStringFromGZIP(HttpResponse httpResponse) {
        String str;
        InputStream inputStream;
        try {
            if (httpResponse.getStatusLine().getStatusCode() == 200) {
                BufferedInputStream bufferedInputStream = new BufferedInputStream(httpResponse.getEntity().getContent());
                bufferedInputStream.mark(2);
                byte[] bArr = new byte[2];
                int read = bufferedInputStream.read(bArr);
                bufferedInputStream.reset();
                int i = getShort(bArr);
                if (read == -1 || i != 8075) {
                    Log.d(TAG, " not use GZIPInputStream");
                    inputStream = bufferedInputStream;
                } else {
                    Log.d(TAG, " use GZIPInputStream  ");
                    inputStream = new GZIPInputStream(bufferedInputStream);
                }
                InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
                char[] cArr = new char[100];
                StringBuffer stringBuffer = new StringBuffer();
                while (true) {
                    int read2 = inputStreamReader.read(cArr);
                    if (read2 <= 0) {
                        break;
                    }
                    stringBuffer.append(cArr, 0, read2);
                }
                str = stringBuffer.toString();
                bufferedInputStream.close();
                inputStreamReader.close();
            } else {
                Log.e(TAG, "与服务端连接失败。。。");
                Log.e(TAG, "ddddd=" + httpResponse.getStatusLine().getStatusCode());
                Log.e(TAG, "ddddd=" + httpResponse.getEntity());
                str = "";
            }
        } catch (Exception e) {
            Log.e(TAG, e.toString(), e);
            str = "";
        }
        Log.d(TAG, "getJsonStringFromGZIP net output : " + str);
        return str;
    }

    private static int getShort(byte[] bArr) {
        return (bArr[0] << 8) | (bArr[1] & 255);
    }

    /* JADX WARN: Code restructure failed: missing block: B:6:0x0037, code lost:
        if (r5.equals("") == false) goto L7;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String getin(String str, String str2, String str3) {
        String str4;
        Log.i(TAG, "httpUrl==>" + str);
        try {
            HttpResponse Get_http_addheader = Get_http_addheader(str, str2, str3);
            Log.e(TAG, "JSON 数据获取准备。。。");
            str4 = getJsonStringFromGZIP(Get_http_addheader);
            if (str4 != null) {
            }
            str4 = "";
        } catch (UnsupportedEncodingException e) {
            Log.e(TAG, "109-" + e.toString());
            str4 = null;
        } catch (ClientProtocolException e2) {
            Log.e(TAG, "114-" + e2.toString());
            str4 = null;
        } catch (IOException e3) {
            Log.e(TAG, "119-" + e3.toString());
            str4 = null;
        }
        return str4;
    }

    public static String httpDownload(String str, String str2, Context context) {
        String string;
        int i = 0;
        File file = new File(str2);
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                string = context.getResources().getString(R.string.appmanager_createfilefailed);
            }
        }
        try {
            try {
                InputStream inputStream = new URL(str).openConnection().getInputStream();
                FileOutputStream fileOutputStream = new FileOutputStream(str2);
                byte[] bArr = new byte[1204];
                while (true) {
                    int read = inputStream.read(bArr);
                    if (read == -1) {
                        break;
                    }
                    i += read;
                    System.out.println(i);
                    fileOutputStream.write(bArr, 0, read);
                }
                string = context.getResources().getString(R.string.appmanager_dirloadok);
            } catch (FileNotFoundException e2) {
                string = context.getResources().getString(R.string.appmanager_filenoerror);
            } catch (IOException e3) {
                string = context.getResources().getString(R.string.appmanager_filrwriteerror);
            }
        } catch (MalformedURLException e4) {
            string = context.getResources().getString(R.string.appmanager_serverurlerror);
        }
        return string;
    }
}
