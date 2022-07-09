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

/* loaded from: classes.jar:com/edutech/daoxueben/until/UpOrDownFile.class */
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

    public static HttpPost Post_addheader(String str) {
        HttpPost httpPost;
        if (hashmap == null) {
            Get_Config_infor();
        }
        try {
            httpPost = Post_http_addheader(str, username, privatekey);
        } catch (ClientProtocolException e) {
            e.printStackTrace();
            httpPost = null;
            return httpPost;
        } catch (IOException e2) {
            e2.printStackTrace();
            httpPost = null;
            return httpPost;
        }
        return httpPost;
    }

    private static HttpPost Post_http_addheader(String str, String str2, String str3) throws IOException, ClientProtocolException {
        new HttpPost();
        HttpPost httpPost = new HttpPost(str);
        httpPost.addHeader("X-Edutech-Entity", String.valueOf(str2) + "+" + str3);
        long currentTimeMillis = System.currentTimeMillis();
        String Md5 = My_md5.Md5(String.valueOf(currentTimeMillis) + str2 + str3);
        Log.e("Test2", "timestamp=" + currentTimeMillis + "   sign=" + Md5);
        httpPost.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + Md5);
        return httpPost;
    }

    public static boolean downFile(String str, String str2, String str3) throws IOException {
        boolean z;
        if (str3 == null || str3 == "") {
            str3 = str.substring(str.lastIndexOf("/") + 1);
        }
        URLConnection openConnection = new URL(str).openConnection();
        openConnection.connect();
        InputStream inputStream = openConnection.getInputStream();
        if (inputStream == null) {
            z = false;
        } else {
            String headerField = openConnection.getHeaderField(MIME.CONTENT_DISPOSITION);
            if (headerField == null || headerField.length() <= 23) {
                AppEnvironment.DOWNFILENAME = str3;
            } else {
                AppEnvironment.DOWNFILENAME = headerField.substring(headerField.indexOf("attachment; filename=") + 22, headerField.length() - 1);
                AppEnvironment.DOWNFILENAME = new String(AppEnvironment.DOWNFILENAME.getBytes("8859_1"), "utf-8");
            }
            long contentLength = openConnection.getContentLength();
            File file = new File(String.valueOf(str2) + AppEnvironment.DOWNFILENAME);
            Log.e("sdcard", String.valueOf(contentLength) + "," + file.length());
            if (file.exists() && file.length() != contentLength) {
                file.delete();
            } else if (file.exists()) {
                z = true;
            }
            FileOutputStream fileOutputStream = new FileOutputStream(String.valueOf(str2) + AppEnvironment.DOWNFILENAME);
            byte[] bArr = new byte[1024];
            int i = 0;
            currentCacheLength = contentLength;
            while (true) {
                int read = inputStream.read(bArr);
                if (read != -1) {
                    fileOutputStream.write(bArr, 0, read);
                    i += read;
                    if (!isCacheFile) {
                        Log.e("iscache", new StringBuilder(String.valueOf(isCacheFile)).toString());
                        break;
                    }
                    currentCachePosition = i;
                }
            }
            try {
                inputStream.close();
                fileOutputStream.flush();
                fileOutputStream.close();
                z = isCacheFile;
            } catch (Exception e) {
                z = false;
            }
        }
        return z;
    }

    public static boolean downFileNormal(String str, String str2, String str3) throws IOException {
        boolean z;
        URLConnection openConnection = new URL(str).openConnection();
        openConnection.connect();
        InputStream inputStream = openConnection.getInputStream();
        if (inputStream == null) {
            z = false;
        } else {
            long contentLength = openConnection.getContentLength();
            File file = new File(String.valueOf(str2) + str3);
            Log.e("bookpicS", String.valueOf(contentLength) + "," + file.length() + "," + str3);
            if (file.exists() && file.length() != contentLength) {
                file.delete();
            } else if (file.exists()) {
                z = true;
            }
            FileOutputStream fileOutputStream = new FileOutputStream(String.valueOf(str2) + str3);
            byte[] bArr = new byte[1024];
            while (true) {
                int read = inputStream.read(bArr);
                if (read == -1) {
                    try {
                        break;
                    } catch (Exception e) {
                        z = false;
                    }
                } else {
                    fileOutputStream.write(bArr, 0, read);
                }
            }
            inputStream.close();
            fileOutputStream.flush();
            fileOutputStream.close();
            z = true;
        }
        return z;
    }

    /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x016a: INVOKE  (r2v14 int A[REMOVE]) = 
      (wrap: org.apache.http.StatusLine : 0x0165: INVOKE  (r2v13 org.apache.http.StatusLine A[REMOVE]) = (r0v55 org.apache.http.HttpResponse) type: INTERFACE call: org.apache.http.HttpResponse.getStatusLine():org.apache.http.StatusLine)
     type: INTERFACE call: org.apache.http.StatusLine.getStatusCode():int)] */
    public static int postAnswerFile(String str, String str2, String str3) {
        int i;
        if (str3 == null || str3.equals("")) {
            Log.i("Test", "put_correct 入参有问题。。。");
            i = -1;
        } else if (str2 == null || str2.equals("")) {
            i = -1;
        } else {
            try {
                HttpPost Post_http_addheader = Post_http_addheader(str3, username, privatekey);
                System.out.println("sendUrl:" + str3 + "," + privatekey);
                FileBody fileBody = new FileBody(new File(str2));
                StringBody stringBody = new StringBody("uploadedfile");
                MultipartEntity multipartEntity = new MultipartEntity();
                multipartEntity.addPart("uploadedfile", fileBody);
                multipartEntity.addPart(ClientCookie.COMMENT_ATTR, stringBody);
                multipartEntity.addPart("id", new StringBody(AppEnvironment.EXAM_ID));
                multipartEntity.addPart("studentid", new StringBody(AppEnvironment.StudentId));
                Post_http_addheader.setEntity(multipartEntity);
                Log.e("Test2", "代交作业提交HWID。。。" + AppEnvironment.EXAM_ID);
                Log.e("Test2", "代交作业提交STID。。。" + AppEnvironment.StudentId);
                Log.e("Test2", "代交作业提交URL。。。." + str3);
                Log.e("Test2", "代交作业提交。。。" + str2);
                HttpResponse execute = new DefaultHttpClient().execute(Post_http_addheader);
                Log.e("Test2", new StringBuilder().append(execute.getStatusLine().getStatusCode()).toString());
                if (execute.getStatusLine().getStatusCode() == 200) {
                    StringBuilder sb = new StringBuilder();
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(execute.getEntity().getContent(), "UTF-8"));
                    for (String readLine = bufferedReader.readLine(); readLine != null; readLine = bufferedReader.readLine()) {
                        sb.append(readLine);
                    }
                    String sb2 = sb.toString();
                    System.out.println("返回的信息  ：" + sb2);
                    Log.e("Test2", "批阅作业提交完成。。。");
                    JSONObject jSONObject = new JSONObject(sb2);
                    String string = jSONObject.getString("status");
                    String string2 = jSONObject.getString("errorNum");
                    String string3 = jSONObject.getString("errorInfo");
                    Log.i("Test2", "status " + string);
                    Log.i("Test2", "errorNum " + string2);
                    Log.i("Test2", "errorInfo " + string3);
                    File file = new File(str2);
                    if (file.exists()) {
                        file.delete();
                    }
                    i = (string2 == null || !string2.equals("0")) ? 4 : 1;
                } else {
                    Log.e("Test2", "与服务端连接失败。。。");
                    Log.e("Test2", "ddddd=" + execute.getStatusLine().getStatusCode());
                    Log.e("Test2", "ddddd=" + execute.getEntity());
                    i = 4;
                }
            } catch (Exception e) {
                e.printStackTrace();
                i = 4;
            }
        }
        return i;
    }

    public static boolean uploadFile(String str, String str2, String str3) {
        boolean z;
        String uuid = UUID.randomUUID().toString();
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str3).openConnection();
            httpURLConnection.setDoInput(true);
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setUseCaches(false);
            httpURLConnection.setRequestMethod(HttpPost.METHOD_NAME);
            httpURLConnection.setRequestProperty(HTTP.CONN_DIRECTIVE, HTTP.CONN_KEEP_ALIVE);
            httpURLConnection.setRequestProperty("Charset", "UTF-8");
            httpURLConnection.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + uuid);
            DataOutputStream dataOutputStream = new DataOutputStream(httpURLConnection.getOutputStream());
            dataOutputStream.writeBytes(String.valueOf("--") + uuid + "\r\n");
            dataOutputStream.writeBytes("Content-Disposition: form-data; name=\"uploadedfile\"; filename=\"" + str + "\"\r\n");
            dataOutputStream.writeBytes("\r\n");
            FileInputStream fileInputStream = new FileInputStream(str2);
            byte[] bArr = new byte[1024];
            while (true) {
                int read = fileInputStream.read(bArr);
                if (read == -1) {
                    break;
                }
                dataOutputStream.write(bArr, 0, read);
            }
            fileInputStream.close();
            dataOutputStream.writeBytes("\r\n");
            dataOutputStream.writeBytes(String.valueOf("--") + uuid + "--\r\n");
            dataOutputStream.flush();
            InputStream inputStream = httpURLConnection.getInputStream();
            StringBuffer stringBuffer = new StringBuffer();
            while (true) {
                int read2 = inputStream.read();
                if (read2 == -1) {
                    break;
                }
                stringBuffer.append((char) read2);
            }
            dataOutputStream.close();
            inputStream.close();
            z = true;
        } catch (Exception e) {
            z = false;
        }
        return z;
    }
}
