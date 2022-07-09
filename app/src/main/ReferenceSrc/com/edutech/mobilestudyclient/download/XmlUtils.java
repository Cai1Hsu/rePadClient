package com.edutech.mobilestudyclient.download;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Environment;
import android.util.Log;
import android.util.Xml;
import com.cloudclientsetting.until.BZip2Utils;
import com.cloudclientsetting.until.FileInOutHelper;
import com.edutech.mobilestudyclient.SysConfig.AppEnvironment;
import com.edutech.mobilestudyclient.activity.AppBean;
import com.edutech.publicedu.log.LogHelp;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import org.apache.http.cookie.ClientCookie;
import org.apache.tools.ant.taskdefs.SQLExec;
import org.jivesoftware.smackx.workgroup.packet.UserID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/download/XmlUtils.class */
public class XmlUtils {
    static String TAG = "xmlUtils";
    public static String launcherDetail_path = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/launcher.xml";

    private static void addLauncherIconUrl(String str, String str2, SharedPreferences sharedPreferences) {
        if (sharedPreferences != null && str2 != null && !str2.equals("") && !str2.equals(sharedPreferences.getString(str, ""))) {
            sharedPreferences.edit().putString(str, str2).commit();
        }
    }

    private static void downLoadImage(ArrayList<String> arrayList, ArrayList<String> arrayList2, Context context) {
        if (arrayList == null || arrayList2 == null || arrayList.size() != arrayList2.size()) {
            return;
        }
        SharedPreferences sharedPreferences = context.getSharedPreferences("launcherpicture", 0);
        for (int i = 0; i < arrayList.size(); i++) {
            String str = arrayList2.get(i);
            if (sharedPreferences.contains(str)) {
                try {
                    HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(arrayList.get(i)).openConnection();
                    if (httpURLConnection.getResponseCode() == 200) {
                        savePic(httpURLConnection.getInputStream(), arrayList.get(i));
                        sharedPreferences.edit().remove(str).commit();
                    }
                    httpURLConnection.disconnect();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static int saveLauncher(String str, Context context) {
        int i;
        JSONObject jSONObject;
        boolean z;
        if (str == null || str.equals("") || context == null) {
            i = -1;
        } else {
            try {
                JSONObject jSONObject2 = new JSONObject(str);
                jSONObject2.getString("status");
                String string = jSONObject2.getString("errorNum");
                jSONObject2.getString("errorInfo");
                if (string.equals("0")) {
                    JSONObject jSONObject3 = jSONObject2.getJSONObject("data");
                    String string2 = jSONObject3.getString("privatekey");
                    String string3 = jSONObject3.getString("encrypt");
                    String string4 = jSONObject3.getString("apihost");
                    JSONObject jSONObject4 = jSONObject3.getJSONObject(UserID.ELEMENT_NAME);
                    jSONObject4.getString("pubkey");
                    String string5 = jSONObject4.getString("type");
                    if (string5.equals("03") || !string5.equals(LogHelp.TYPE_HWHELP)) {
                        String str2 = "-1";
                        try {
                            str2 = jSONObject4.getString("id");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        String str3 = "-1";
                        try {
                            str3 = jSONObject4.getString("usercode");
                        } catch (Exception e2) {
                            e2.printStackTrace();
                        }
                        SharedPreferences sharedPreferences = context.getSharedPreferences("privatekey", 0);
                        SharedPreferences.Editor edit = sharedPreferences.edit();
                        JSONObject jSONObject5 = null;
                        boolean z2 = false;
                        try {
                            JSONObject jSONObject6 = jSONObject3.getJSONObject("ebag");
                            jSONObject = jSONObject6;
                            z = false;
                            if (jSONObject6 != null) {
                                jSONObject = jSONObject6;
                                z = false;
                                if (!sharedPreferences.getString("updatetime", "").equals(jSONObject6.getString("updatetime"))) {
                                    Log.i("liu", "save time:" + sharedPreferences.getString("updatetime", ""));
                                    Log.i("liu", "request time:" + jSONObject6.getString("updatetime"));
                                    z2 = true;
                                    z = true;
                                    jSONObject5 = jSONObject6;
                                    edit.putString("updatetime", jSONObject6.getString("updatetime"));
                                    jSONObject = jSONObject6;
                                }
                            }
                        } catch (Exception e3) {
                            e3.printStackTrace();
                            jSONObject = jSONObject5;
                            z = z2;
                        }
                        edit.putString("userid", str2);
                        edit.commit();
                        ArrayList arrayList = new ArrayList();
                        String str4 = null;
                        String str5 = null;
                        String str6 = null;
                        String str7 = null;
                        String str8 = null;
                        try {
                            JSONObject jSONObject7 = jSONObject.getJSONObject("desktopicon");
                            String string6 = jSONObject7.getString("wifi");
                            String string7 = jSONObject7.getString("setting");
                            JSONObject jSONObject8 = jSONObject7.getJSONObject("background");
                            String string8 = jSONObject8.getString("large");
                            String string9 = jSONObject8.getString(SQLExec.DelimiterType.NORMAL);
                            String string10 = jSONObject8.getString("small");
                            SharedPreferences sharedPreferences2 = context.getSharedPreferences("launcherpicture", 0);
                            if (z) {
                                addLauncherIconUrl("wifi", string6, sharedPreferences2);
                                addLauncherIconUrl("setting", string7, sharedPreferences2);
                                addLauncherIconUrl("large", string8, sharedPreferences2);
                                addLauncherIconUrl(SQLExec.DelimiterType.NORMAL, string9, sharedPreferences2);
                                addLauncherIconUrl("small", string10, sharedPreferences2);
                            }
                            try {
                                HashMap hashMap = new HashMap();
                                hashMap.put(ClientCookie.COMMENT_ATTR, "-1");
                                hashMap.put("download", "-1");
                                arrayList.add(new AppBean("wifi", "wifi", "", string6, 1, hashMap, String.valueOf(AppEnvironment.icon) + string6.substring(string6.lastIndexOf("/") + 1)));
                                arrayList.add(new AppBean("setting", "setting", "", string7, 1, hashMap, String.valueOf(AppEnvironment.icon) + string7.substring(string7.lastIndexOf("/") + 1)));
                                arrayList.add(new AppBean("large", "large", "", string8, 1, hashMap, String.valueOf(AppEnvironment.icon) + string8.substring(string8.lastIndexOf("/") + 1)));
                                arrayList.add(new AppBean(SQLExec.DelimiterType.NORMAL, SQLExec.DelimiterType.NORMAL, "", string9, 1, hashMap, String.valueOf(AppEnvironment.icon) + string9.substring(string9.lastIndexOf("/") + 1)));
                                arrayList.add(new AppBean("small", "small", "", string10, 1, hashMap, String.valueOf(AppEnvironment.icon) + string10.substring(string10.lastIndexOf("/") + 1)));
                            } catch (Exception e4) {
                            }
                            JSONArray jSONArray = jSONObject.getJSONArray("app");
                            int i2 = 0;
                            while (true) {
                                str4 = string6;
                                str5 = string7;
                                str6 = string8;
                                str7 = string9;
                                str8 = string10;
                                if (i2 >= jSONArray.length()) {
                                    break;
                                }
                                HashMap hashMap2 = new HashMap();
                                String string11 = jSONArray.getJSONObject(i2).getString("code");
                                String string12 = jSONArray.getJSONObject(i2).getString("name");
                                String string13 = jSONArray.getJSONObject(i2).getString("color");
                                String string14 = jSONArray.getJSONObject(i2).getString("icon");
                                String str9 = String.valueOf(AppEnvironment.icon) + string14.substring(string14.lastIndexOf("/") + 1);
                                if (z) {
                                    addLauncherIconUrl(string11, string14, sharedPreferences2);
                                }
                                str4 = string6;
                                str5 = string7;
                                str6 = string8;
                                str7 = string9;
                                str8 = string10;
                                int i3 = jSONArray.getJSONObject(i2).getInt("enable");
                                try {
                                    str8 = new StringBuilder(String.valueOf(jSONArray.getJSONObject(i2).getJSONObject("config").getInt(ClientCookie.COMMENT_ATTR))).toString();
                                    str7 = new StringBuilder(String.valueOf(jSONArray.getJSONObject(i2).getJSONObject("config").getInt("download"))).toString();
                                    hashMap2.put(ClientCookie.COMMENT_ATTR, str8);
                                    hashMap2.put("download", str7);
                                } catch (Exception e5) {
                                    hashMap2.put(ClientCookie.COMMENT_ATTR, "-1");
                                    hashMap2.put("download", "-1");
                                    e5.printStackTrace();
                                }
                                arrayList.add(new AppBean(string11, string12, string13, string14, i3, hashMap2, str9));
                                i2++;
                            }
                            str8 = string10;
                            str7 = string9;
                            str6 = string8;
                            str5 = string7;
                            str4 = string6;
                        } catch (Exception e6) {
                            e6.printStackTrace();
                        }
                        writeXml_config(string2, string3, string4, str3, str2, arrayList, launcherDetail_path);
                        ArrayList arrayList2 = new ArrayList();
                        ArrayList arrayList3 = new ArrayList();
                        arrayList2.add(str4);
                        arrayList3.add("wifi");
                        arrayList2.add(str5);
                        arrayList3.add("setting");
                        arrayList2.add(str6);
                        arrayList3.add("large");
                        arrayList2.add(str7);
                        arrayList3.add(SQLExec.DelimiterType.NORMAL);
                        arrayList2.add(str8);
                        arrayList3.add("small");
                        for (int i4 = 0; i4 < arrayList.size(); i4++) {
                            arrayList2.add(((AppBean) arrayList.get(i4)).getIcon());
                            arrayList3.add(((AppBean) arrayList.get(i4)).getCode());
                        }
                        Log.i(TAG, "更新icon");
                        downLoadImage(arrayList2, arrayList3, context);
                        i = 1;
                    } else {
                        i = 2;
                    }
                } else {
                    Log.i(TAG, "配置信息 json数据  返回错误数据。。。");
                    i = -1;
                }
            } catch (JSONException e7) {
                Log.i(TAG, "配置信息 json数据  返回错误数据。。。" + e7.toString());
                e7.printStackTrace();
                i = -1;
            }
        }
        return i;
    }

    private static void savePic(InputStream inputStream, String str) {
        Throwable th;
        FileOutputStream fileOutputStream;
        FileOutputStream fileOutputStream2;
        if (inputStream == null) {
            return;
        }
        File file = FileInOutHelper.setupOrOpenFile(String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/icon", str.substring(str.lastIndexOf("/") + 1));
        FileOutputStream fileOutputStream3 = null;
        try {
            try {
                fileOutputStream2 = new FileOutputStream(file);
            } catch (Exception e) {
                e = e;
                fileOutputStream2 = null;
            }
        } catch (Throwable th2) {
            th = th2;
            fileOutputStream = fileOutputStream3;
        }
        try {
            byte[] bArr = new byte[1024];
            while (true) {
                int read = inputStream.read(bArr);
                if (read == -1) {
                    try {
                        inputStream.close();
                        fileOutputStream2.close();
                        return;
                    } catch (Exception e2) {
                        e2.printStackTrace();
                        return;
                    }
                }
                fileOutputStream2.write(bArr, 0, read);
            }
        } catch (Exception e3) {
            e = e3;
            e.printStackTrace();
            FileOutputStream fileOutputStream4 = fileOutputStream2;
            FileOutputStream fileOutputStream5 = fileOutputStream2;
            fileOutputStream3 = fileOutputStream2;
            Log.i("liu", "savePic:" + e);
            try {
                inputStream.close();
                fileOutputStream2.close();
            } catch (Exception e4) {
                e4.printStackTrace();
            }
        } catch (Throwable th3) {
            fileOutputStream = fileOutputStream2;
            th = th3;
            try {
                inputStream.close();
                fileOutputStream.close();
            } catch (Exception e5) {
                e5.printStackTrace();
            }
            throw th;
        }
    }

    private static void writeXml_config(String str, String str2, String str3, String str4, String str5, ArrayList<AppBean> arrayList, String str6) {
        String str7;
        Log.i(TAG, "writeXml");
        String str8 = "";
        String str9 = str;
        String str10 = str4;
        try {
            String StringEncodeToBase64 = BZip2Utils.StringEncodeToBase64(str);
            String StringEncodeToBase642 = BZip2Utils.StringEncodeToBase64(str3);
            String StringEncodeToBase643 = BZip2Utils.StringEncodeToBase64(str4);
            str8 = StringEncodeToBase642;
            str9 = StringEncodeToBase64;
            str10 = StringEncodeToBase643;
            str10 = StringEncodeToBase643;
            str9 = StringEncodeToBase64;
            str7 = BZip2Utils.StringEncodeToBase64(str5);
            str8 = StringEncodeToBase642;
        } catch (Exception e) {
            e.printStackTrace();
            str7 = "";
        }
        File file = FileInOutHelper.setupOrOpenFile(str6);
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
        }
        FileOutputStream fileOutputStream = null;
        try {
            fileOutputStream = new FileOutputStream(file);
        } catch (FileNotFoundException e3) {
            Log.e("FileNotFoundException", "can't create FileOutputStream");
        } catch (Exception e4) {
        }
        if (fileOutputStream == null) {
            return;
        }
        XmlSerializer newSerializer = Xml.newSerializer();
        try {
            newSerializer.setOutput(fileOutputStream, "UTF-8");
            newSerializer.startDocument(null, true);
            newSerializer.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
            try {
                newSerializer.startTag(null, "urlpath");
                try {
                    newSerializer.startTag(null, "ip");
                    newSerializer.text(str8);
                    newSerializer.endTag(null, "ip");
                } catch (Exception e5) {
                    e5.printStackTrace();
                }
                newSerializer.endTag(null, "urlpath");
            } catch (Exception e6) {
                e6.printStackTrace();
            }
            try {
                newSerializer.startTag(null, "student");
                try {
                    newSerializer.startTag(null, "stuid");
                    newSerializer.text(str7);
                    newSerializer.endTag(null, "stuid");
                    newSerializer.startTag(null, "usercode");
                    newSerializer.text(str10);
                    newSerializer.endTag(null, "usercode");
                } catch (Exception e7) {
                    e7.printStackTrace();
                }
                try {
                    newSerializer.startTag(null, "privatekey");
                    newSerializer.text(str9);
                    newSerializer.endTag(null, "privatekey");
                    newSerializer.startTag(null, "encrypt");
                    newSerializer.text(str2);
                    newSerializer.endTag(null, "encrypt");
                    newSerializer.startTag(null, "apihost");
                    newSerializer.text(str3);
                    newSerializer.endTag(null, "apihost");
                } catch (Exception e8) {
                    e8.printStackTrace();
                }
                newSerializer.endTag(null, "student");
            } catch (Exception e9) {
                e9.printStackTrace();
            }
            try {
                newSerializer.startTag(null, "apps");
                for (int i = 0; i < arrayList.size(); i++) {
                    newSerializer.startTag(null, "app");
                    newSerializer.startTag(null, "code");
                    newSerializer.text(arrayList.get(i).getCode());
                    newSerializer.endTag(null, "code");
                    newSerializer.startTag(null, "name");
                    newSerializer.text(arrayList.get(i).getName());
                    newSerializer.endTag(null, "name");
                    newSerializer.startTag(null, "color");
                    newSerializer.text(arrayList.get(i).getColor());
                    newSerializer.endTag(null, "color");
                    newSerializer.startTag(null, "icon");
                    newSerializer.text(arrayList.get(i).getIcon());
                    newSerializer.endTag(null, "icon");
                    newSerializer.startTag(null, "iconLocal");
                    newSerializer.text(arrayList.get(i).getIconLocal());
                    newSerializer.endTag(null, "iconLocal");
                    newSerializer.startTag(null, "enable");
                    newSerializer.text(new StringBuilder(String.valueOf(arrayList.get(i).getEnable())).toString());
                    newSerializer.endTag(null, "enable");
                    newSerializer.startTag(null, "config");
                    newSerializer.startTag(null, "download");
                    newSerializer.text(arrayList.get(i).getConfig().get("download"));
                    newSerializer.endTag(null, "download");
                    newSerializer.startTag(null, ClientCookie.COMMENT_ATTR);
                    newSerializer.text(arrayList.get(i).getConfig().get(ClientCookie.COMMENT_ATTR));
                    newSerializer.endTag(null, ClientCookie.COMMENT_ATTR);
                    newSerializer.endTag(null, "config");
                    newSerializer.endTag(null, "app");
                }
                newSerializer.endTag(null, "apps");
            } catch (Exception e10) {
                e10.printStackTrace();
                Log.e(TAG, "write to  xml file" + e10.toString());
            }
            newSerializer.endDocument();
            newSerializer.flush();
            fileOutputStream.close();
        } catch (Exception e11) {
            e11.printStackTrace();
        }
    }
}
