package com.edutech.daoxueben.until;

import android.util.Log;
import com.edutech.daoxueben.sysconfig.AppEnvironment;
import com.edutech.mobilestudyclient.util.My_md5;
import com.edutech.mobilestudyclient.util.XmlLoadHelper;
import com.edutech.publicedu.log.LogHelp;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.cookie.ClientCookie;
import org.apache.http.entity.mime.MIME;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.HTTP;
import org.jivesoftware.smackx.entitycaps.EntityCapsManager;
import org.json.JSONObject;

/* loaded from: classes.dex */
public class UpOrDownFile {
    public static String apihost = "";
    public static String ip = "";
    public static String privatekey = "";
    public static String username = EntityCapsManager.ELEMENT;
    public static String userId = "";
    public static String deleteJsonString = "";
    public static int internetIsOk = 1;
    public static int onlineContent = 0;
    public static String examType = "";
    public static String BookId = "-1";
    public static String DXisNeedUpdate = "0";
    public static int DownloadPercent = 0;
    public static long currentDLsize = 0;
    public static long allDsize = 0;
    public static String typeHistory = "0";
    public static String exams = "";
    public static String mediaState = "0";
    public static int RefreshTimes = 0;
    public static HashMap<String, Long> isLoadingDxid = null;
    public static List<String> downloadedDX = new ArrayList();
    public static int OFFLINE = 1;
    public static String WebViewType = "-1";
    public static boolean isCacheFile = true;
    public static String firstInitSql = "0";
    public static long currentCacheLength = 0;
    public static long currentCachePosition = 0;
    public static int currentCacheTime = 0;
    public static String gdstate = LogHelp.TYPE_GUIDANCE;
    private static HashMap<String, String> hashmap = null;

    public static void Get_Config_infor() {
        hashmap = XmlLoadHelper.loadXml();
        username = hashmap.get("username");
        ip = hashmap.get("ip");
        if (hashmap.containsKey("privatekey")) {
            privatekey = hashmap.get("privatekey");
        }
        if (hashmap.containsKey("stuid")) {
            userId = hashmap.get("stuid");
        }
        if (hashmap.containsKey("apihost")) {
            apihost = hashmap.get("apihost");
        }
        if (hashmap.containsKey("gdstate")) {
            gdstate = hashmap.get("gdstate");
        }
        Log.d("CloudClientActivity", "ip:" + apihost);
        Log.d("CloudClientActivity", "username:" + username);
        Log.d("CloudClientActivity", "stuid:" + userId);
        Log.d("CloudClientActivity", "privatekey:" + privatekey);
    }

    public static HttpPost Post_addheader(String url) {
        if (hashmap == null) {
            Get_Config_infor();
        }
        try {
            return Post_http_addheader(url, username, privatekey);
        } catch (ClientProtocolException e) {
            e.printStackTrace();
            return null;
        } catch (IOException e2) {
            e2.printStackTrace();
            return null;
        }
    }

    /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x0133: INVOKE  (r25v12 int A[REMOVE]) = 
      (wrap: org.apache.http.StatusLine : 0x012f: INVOKE  (r25v11 org.apache.http.StatusLine A[REMOVE]) = (r13v0 'httpResponse' org.apache.http.HttpResponse A[D('httpResponse' org.apache.http.HttpResponse)]) type: INTERFACE call: org.apache.http.HttpResponse.getStatusLine():org.apache.http.StatusLine)
     type: INTERFACE call: org.apache.http.StatusLine.getStatusCode():int)] */
    public static int postAnswerFile(String filename, String load_zip, String url_str) {
        if (url_str == null || url_str.equals("")) {
            Log.i("Test", "put_correct 入参有问题。。。");
            return -1;
        } else if (load_zip == null || load_zip.equals("")) {
            return -1;
        } else {
            try {
                String user_Name = username;
                String Random_number_10 = privatekey;
                HttpPost request = Post_http_addheader(url_str, user_Name, Random_number_10);
                System.out.println("sendUrl:" + url_str + "," + privatekey);
                FileBody bin = new FileBody(new File(load_zip));
                StringBody comment = new StringBody("uploadedfile");
                MultipartEntity reqEntity = new MultipartEntity();
                reqEntity.addPart("uploadedfile", bin);
                reqEntity.addPart(ClientCookie.COMMENT_ATTR, comment);
                reqEntity.addPart("id", new StringBody(AppEnvironment.EXAM_ID));
                reqEntity.addPart("studentid", new StringBody(AppEnvironment.StudentId));
                request.setEntity(reqEntity);
                Log.e("Test2", "代交作业提交HWID。。。" + AppEnvironment.EXAM_ID);
                Log.e("Test2", "代交作业提交STID。。。" + AppEnvironment.StudentId);
                Log.e("Test2", "代交作业提交URL。。。." + url_str);
                Log.e("Test2", "代交作业提交。。。" + load_zip);
                DefaultHttpClient httpClient = new DefaultHttpClient();
                HttpResponse httpResponse = httpClient.execute(request);
                Log.e("Test2", new StringBuilder().append(httpResponse.getStatusLine().getStatusCode()).toString());
                if (httpResponse.getStatusLine().getStatusCode() == 200) {
                    StringBuilder builder = new StringBuilder();
                    BufferedReader bufferedReader2 = new BufferedReader(new InputStreamReader(httpResponse.getEntity().getContent(), "UTF-8"));
                    for (String s = bufferedReader2.readLine(); s != null; s = bufferedReader2.readLine()) {
                        builder.append(s);
                    }
                    String resultString = builder.toString();
                    System.out.println("返回的信息  ：" + resultString);
                    Log.e("Test2", "批阅作业提交完成。。。");
                    JSONObject result_json = new JSONObject(resultString);
                    String status = result_json.getString("status");
                    String errorNum = result_json.getString("errorNum");
                    String errorInfo = result_json.getString("errorInfo");
                    Log.i("Test2", "status " + status);
                    Log.i("Test2", "errorNum " + errorNum);
                    Log.i("Test2", "errorInfo " + errorInfo);
                    File file = new File(load_zip);
                    if (file.exists()) {
                        file.delete();
                    }
                    if (errorNum != null && errorNum.equals("0")) {
                        return 1;
                    }
                    return 4;
                }
                Log.e("Test2", "与服务端连接失败。。。");
                Log.e("Test2", "ddddd=" + httpResponse.getStatusLine().getStatusCode());
                Log.e("Test2", "ddddd=" + httpResponse.getEntity());
                return 4;
            } catch (Exception e) {
                e.printStackTrace();
                return 4;
            }
        }
    }

    private static HttpPost Post_http_addheader(String url, String user_Name, String Random_number_10) throws IOException, ClientProtocolException {
        new HttpPost();
        HttpPost request = new HttpPost(url);
        request.addHeader("X-Edutech-Entity", String.valueOf(user_Name) + "+" + Random_number_10);
        long imestamp = System.currentTimeMillis();
        String sign = My_md5.Md5(String.valueOf(imestamp) + user_Name + Random_number_10);
        Log.e("Test2", "timestamp=" + imestamp + "   sign=" + sign);
        request.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
        return request;
    }

    public static boolean uploadFile(String filename, String localfile, String actionUrl) {
        String boundary = UUID.randomUUID().toString();
        try {
            URL url = new URL(actionUrl);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setDoInput(true);
            con.setDoOutput(true);
            con.setUseCaches(false);
            con.setRequestMethod(HttpPost.METHOD_NAME);
            con.setRequestProperty(HTTP.CONN_DIRECTIVE, HTTP.CONN_KEEP_ALIVE);
            con.setRequestProperty("Charset", "UTF-8");
            con.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + boundary);
            DataOutputStream ds = new DataOutputStream(con.getOutputStream());
            ds.writeBytes(String.valueOf("--") + boundary + "\r\n");
            ds.writeBytes("Content-Disposition: form-data; name=\"uploadedfile\"; filename=\"" + filename + "\"\r\n");
            ds.writeBytes("\r\n");
            FileInputStream fStream = new FileInputStream(localfile);
            byte[] buffer = new byte[1024];
            while (true) {
                int length = fStream.read(buffer);
                if (length == -1) {
                    break;
                }
                ds.write(buffer, 0, length);
            }
            fStream.close();
            ds.writeBytes("\r\n");
            ds.writeBytes(String.valueOf("--") + boundary + "--\r\n");
            ds.flush();
            InputStream is = con.getInputStream();
            StringBuffer b = new StringBuffer();
            while (true) {
                int ch = is.read();
                if (ch != -1) {
                    b.append((char) ch);
                } else {
                    ds.close();
                    is.close();
                    return true;
                }
            }
        } catch (Exception e) {
            return false;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0101, code lost:
        r11.close();
        r10.flush();
        r10.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x010c, code lost:
        if (com.edutech.daoxueben.until.UpOrDownFile.isCacheFile != false) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x010e, code lost:
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0149, code lost:
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x014d, code lost:
        return true;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean downFile(String url, String path, String fileName) throws IOException {
        String myfilename;
        if (fileName == null || fileName == "") {
            myfilename = url.substring(url.lastIndexOf("/") + 1);
        } else {
            myfilename = fileName;
        }
        URL Url = new URL(url);
        URLConnection conn = Url.openConnection();
        conn.connect();
        InputStream is = conn.getInputStream();
        if (is == null) {
            return false;
        }
        String str_httprsponse = conn.getHeaderField(MIME.CONTENT_DISPOSITION);
        if (str_httprsponse != null && str_httprsponse.length() > 23) {
            AppEnvironment.DOWNFILENAME = str_httprsponse.substring(str_httprsponse.indexOf("attachment; filename=") + 22, str_httprsponse.length() - 1);
            AppEnvironment.DOWNFILENAME = new String(AppEnvironment.DOWNFILENAME.getBytes("8859_1"), "utf-8");
        } else {
            AppEnvironment.DOWNFILENAME = myfilename;
        }
        long length = conn.getContentLength();
        File file = new File(String.valueOf(path) + AppEnvironment.DOWNFILENAME);
        Log.e("sdcard", String.valueOf(length) + "," + file.length());
        if (file.exists() && file.length() != length) {
            file.delete();
        } else if (file.exists()) {
            return true;
        }
        FileOutputStream fos = new FileOutputStream(String.valueOf(path) + AppEnvironment.DOWNFILENAME);
        byte[] buf = new byte[1024];
        int downLoadFilePosition = 0;
        currentCacheLength = length;
        while (true) {
            int numread = is.read(buf);
            if (numread != -1) {
                fos.write(buf, 0, numread);
                downLoadFilePosition += numread;
                if (!isCacheFile) {
                    Log.e("iscache", new StringBuilder(String.valueOf(isCacheFile)).toString());
                    break;
                }
                currentCachePosition = downLoadFilePosition;
            }
        }
    }

    public static boolean downFileNormal(String url, String path, String fileName) throws IOException {
        URL Url = new URL(url);
        URLConnection conn = Url.openConnection();
        conn.connect();
        InputStream is = conn.getInputStream();
        if (is == null) {
            return false;
        }
        long length = conn.getContentLength();
        File file = new File(String.valueOf(path) + fileName);
        Log.e("bookpicS", String.valueOf(length) + "," + file.length() + "," + fileName);
        if (file.exists() && file.length() != length) {
            file.delete();
        } else if (file.exists()) {
            return true;
        }
        FileOutputStream fos = new FileOutputStream(String.valueOf(path) + fileName);
        byte[] buf = new byte[1024];
        while (true) {
            int numread = is.read(buf);
            if (numread != -1) {
                fos.write(buf, 0, numread);
            } else {
                try {
                    is.close();
                    fos.flush();
                    fos.close();
                    return true;
                } catch (Exception e) {
                    return false;
                }
            }
        }
    }
}
