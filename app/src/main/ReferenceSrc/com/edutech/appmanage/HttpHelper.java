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
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.GZIPInputStream;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.bson.BSON;

/* loaded from: classes.dex */
public class HttpHelper {
    private static final String TAG = "HttpHelper";
    public static ArrayList<Map<String, Object>> install_num = new ArrayList<>();
    String string;

    public static String httpDownload(String httpUrl, String saveFile, Context context) {
        int bytesum = 0;
        File file = new File(saveFile);
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                return context.getResources().getString(R.string.appmanager_createfilefailed);
            }
        }
        try {
            URL url = new URL(httpUrl);
            try {
                URLConnection conn = url.openConnection();
                InputStream inStream = conn.getInputStream();
                FileOutputStream fs = new FileOutputStream(saveFile);
                byte[] buffer = new byte[1204];
                while (true) {
                    int byteread = inStream.read(buffer);
                    if (byteread != -1) {
                        bytesum += byteread;
                        System.out.println(bytesum);
                        fs.write(buffer, 0, byteread);
                    } else {
                        return context.getResources().getString(R.string.appmanager_dirloadok);
                    }
                }
            } catch (FileNotFoundException e2) {
                return context.getResources().getString(R.string.appmanager_filenoerror);
            } catch (IOException e3) {
                return context.getResources().getString(R.string.appmanager_filrwriteerror);
            }
        } catch (MalformedURLException e4) {
            return context.getResources().getString(R.string.appmanager_serverurlerror);
        }
    }

    public static String getin(String httpUrl, String user_Name, String Random_number_10) {
        Log.i(TAG, "httpUrl==>" + httpUrl);
        try {
            HttpResponse httpResponse = Get_http_addheader(httpUrl, user_Name, Random_number_10);
            Log.e(TAG, "JSON 数据获取准备。。。");
            String resultString = getJsonStringFromGZIP(httpResponse);
            if (resultString != null) {
                if (!resultString.equals("")) {
                    return resultString;
                }
            }
            return "";
        } catch (UnsupportedEncodingException e) {
            Log.e(TAG, "109-" + e.toString());
            return null;
        } catch (ClientProtocolException e2) {
            Log.e(TAG, "114-" + e2.toString());
            return null;
        } catch (IOException e3) {
            Log.e(TAG, "119-" + e3.toString());
            return null;
        }
    }

    public static void download(int position, int type) {
        File folder = Environment.getExternalStoragePublicDirectory(MainActivity.FOLDER_MAIN);
        if (!folder.exists() || !folder.isDirectory()) {
            folder.mkdirs();
        }
        DownloadManager.Request request = null;
        HashMap<String, Object> map = new HashMap<>();
        if (1 == type) {
            request = new DownloadManager.Request(Uri.parse(MainActivity.market_applist.get(position).webpath.toString()));
            request.setDestinationInExternalPublicDir(MainActivity.FOLDER_MAIN, MainActivity.market_applist.get(position).apkname);
            map.put("apkname", MainActivity.market_applist.get(position).apkname);
            map.put("packagename", MainActivity.market_applist.get(position).packagename);
        } else if (type == 0 && MainActivity.market_applist.get(position).webpath != null) {
            for (int i = 0; i < MainActivity.market_applist.size(); i++) {
            }
            request = new DownloadManager.Request(Uri.parse(MainActivity.market_applist.get(position).webpath.toString()));
            request.setDestinationInExternalPublicDir(MainActivity.FOLDER_MAIN, MainActivity.market_applist.get(position).apkname);
            map.put("apkname", MainActivity.market_applist.get(position).apkname);
            map.put("packagename", MainActivity.market_applist.get(position).packagename);
        }
        request.setNotificationVisibility(1);
        long downloadId = MainActivity.downloadManager.enqueue(request);
        MainActivity.downloadManagerPro.getBytesAndStatus(downloadId);
        map.put("downid", Long.valueOf(downloadId));
        map.put("type", Integer.valueOf(type));
        map.put("position", Integer.valueOf(position));
        map.put("setuped", false);
        install_num.add(map);
    }

    private String getContactJson(String url_str, String user_Name, String Random_number_10, String The_client) {
        if (url_str == null || url_str.equals("")) {
            Log.i(TAG, "getContactJson 入参有问题。。。");
            return null;
        }
        try {
            HttpResponse httpResponse = Get_http_addheader(url_str, user_Name, Random_number_10);
            Log.e(TAG, "JSON 数据获取准备。。。");
            String resultString = getJsonStringFromGZIP(httpResponse);
            if (resultString != null) {
                if (!resultString.equals("")) {
                    return resultString;
                }
            }
            return "";
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    private static HttpResponse Get_http_addheader(String url, String user_Name, String Random_number_10) throws IOException, ClientProtocolException {
        HttpGet request = new HttpGet(url);
        request.addHeader("X-Edutech-Entity", String.valueOf(user_Name) + "+" + Random_number_10);
        long imestamp = System.currentTimeMillis();
        String sign = My_md5.Md5(String.valueOf(imestamp) + user_Name + Random_number_10);
        Log.e(TAG, "timestamp=" + imestamp + "   sign=" + sign);
        request.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
        request.addHeader("Accept-Encoding", "gzip,deflate");
        DefaultHttpClient httpClient = new DefaultHttpClient();
        HttpResponse httpResponse = httpClient.execute(request);
        return httpResponse;
    }

    private static String getJsonStringFromGZIP(HttpResponse response) {
        String jsonString;
        InputStream is;
        try {
            if (response.getStatusLine().getStatusCode() == 200) {
                InputStream is2 = response.getEntity().getContent();
                BufferedInputStream bis = new BufferedInputStream(is2);
                bis.mark(2);
                byte[] header = new byte[2];
                int result = bis.read(header);
                bis.reset();
                int headerData = getShort(header);
                if (result != -1 && headerData == 8075) {
                    Log.d(TAG, " use GZIPInputStream  ");
                    is = new GZIPInputStream(bis);
                } else {
                    Log.d(TAG, " not use GZIPInputStream");
                    is = bis;
                }
                InputStreamReader reader = new InputStreamReader(is, "utf-8");
                char[] data = new char[100];
                StringBuffer sb = new StringBuffer();
                while (true) {
                    int readSize = reader.read(data);
                    if (readSize <= 0) {
                        break;
                    }
                    sb.append(data, 0, readSize);
                }
                jsonString = sb.toString();
                bis.close();
                reader.close();
            } else {
                Log.e(TAG, "与服务端连接失败。。。");
                Log.e(TAG, "ddddd=" + response.getStatusLine().getStatusCode());
                Log.e(TAG, "ddddd=" + response.getEntity());
                jsonString = "";
            }
        } catch (Exception e) {
            Log.e(TAG, e.toString(), e);
            jsonString = "";
        }
        Log.d(TAG, "getJsonStringFromGZIP net output : " + jsonString);
        return jsonString;
    }

    private static int getShort(byte[] data) {
        return (data[0] << 8) | (data[1] & BSON.MINKEY);
    }
}
