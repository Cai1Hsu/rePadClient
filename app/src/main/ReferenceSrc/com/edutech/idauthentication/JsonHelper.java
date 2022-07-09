package com.edutech.idauthentication;

import android.os.Environment;
import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import org.apache.http.util.EncodingUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;
import org.json.JSONTokener;

/* loaded from: classes.jar:com/edutech/idauthentication/JsonHelper.class */
public class JsonHelper {
    public static final String ID_XML_File = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "CloudClient" + File.separatorChar + ".System" + File.separatorChar + "id.xml";

    public static boolean CreateFile(String str, String str2) {
        boolean z = false;
        try {
            try {
                FileOutputStream fileOutputStream = new FileOutputStream(new File(str2));
                try {
                    fileOutputStream.write(str.getBytes("UTF-8"));
                    fileOutputStream.close();
                    z = true;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } catch (FileNotFoundException e2) {
                e2.printStackTrace();
            }
        } catch (Exception e3) {
            e3.printStackTrace();
        }
        return z;
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x00ea, code lost:
        if ("NULL".equals(r0) != false) goto L30;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static LogInfo alogparserJson(String str, String str2, LogInfo logInfo, String str3) {
        String str4;
        if (!"".equals(str3)) {
            try {
                JSONObject jSONObject = new JSONObject(str3);
                String str5 = setDefault(getPropertyName(jSONObject, "UserID"));
                String str6 = setDefault(getPropertyName(jSONObject, "Type"));
                String str7 = setDefault(getPropertyName(jSONObject, "SubjectID"));
                String str8 = setDefault(getPropertyName(jSONObject, "BookID"));
                String str9 = setDefault(getPropertyName(jSONObject, "BookName"));
                String propertyName = getPropertyName(jSONObject, "SectionsID");
                String str10 = setDefault(getPropertyName(jSONObject, "AssetsID"));
                String str11 = setDefault(getPropertyName(jSONObject, "AssetsName"));
                String str12 = setDefault(getPropertyName(jSONObject, "FirstTime"));
                String str13 = setDefault(getPropertyName(jSONObject, "LastTime"));
                String propertyName2 = getPropertyName(jSONObject, "TotalTime");
                String propertyName3 = getPropertyName(jSONObject, "VisitCount");
                String str14 = propertyName2;
                if ("".equals(propertyName2)) {
                    str14 = "0";
                }
                String str15 = propertyName3;
                if ("".equals(propertyName3)) {
                    str15 = "0";
                }
                if ("".equals(str5) || "NULL".equals(str12)) {
                    str5 = str;
                }
                if (!"".equals(str12)) {
                    str4 = str12;
                }
                str4 = SystemTimeHelper.getTheSystemTime();
                logInfo.setUserID(str5);
                logInfo.setMachineID(str2);
                logInfo.setType(str6);
                logInfo.setSubjectID(str7);
                logInfo.setBookID(str8);
                logInfo.setBookName(str9);
                logInfo.setSectionsID(getJsonArray(propertyName));
                logInfo.setAssetsID(str10);
                logInfo.setAssetsName(str11);
                logInfo.setFirstTime(str4);
                logInfo.setLastTime(str13);
                logInfo.setTotalTime(Long.parseLong(str14));
                logInfo.setVisitCount(Long.parseLong(str15));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return logInfo;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x0158 -> B:8:0x002d). Please submit an issue!!! */
    public static void dataCreate(ArrayList<HashMap<String, String>> arrayList) {
        JSONStringer jSONStringer = new JSONStringer();
        try {
            jSONStringer.object();
            jSONStringer.key("data");
            jSONStringer.array();
            for (int i = 0; i < arrayList.size(); i++) {
                jSONStringer.object();
                jSONStringer.key("appname").value(getDefault(arrayList.get(i).get("appname")));
                jSONStringer.key("packagename").value(getDefault(arrayList.get(i).get("packagename")));
                jSONStringer.key("versioncode").value(getDefault(arrayList.get(i).get("versioncode")));
                jSONStringer.key("versionname").value(getDefault(arrayList.get(i).get("versionname")));
                jSONStringer.key("appwebpath").value(getDefault(arrayList.get(i).get("appwebpath")));
                if ("".equals(getDefault(arrayList.get(i).get("is_down_finish")))) {
                    arrayList.get(i).put("is_down_finish", "0");
                }
                jSONStringer.key("is_down_finish").value(getDefault(arrayList.get(i).get("is_down_finish")));
                jSONStringer.endObject();
            }
            jSONStringer.endArray();
            jSONStringer.endObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String str = String.valueOf(AppEnvironment.FOLDER_EDUTECH) + "apk.json";
        File file = new File(str);
        if (!file.exists()) {
            FileInOutHelper.createNewFile(file);
        }
        CreateFile(jSONStringer.toString(), str);
    }

    public static ArrayList<HashMap<String, String>> dataParse(ArrayList<HashMap<String, String>> arrayList, String str) {
        try {
            JSONObject jSONObject = (JSONObject) new JSONTokener(str).nextValue();
            boolean booleanPropertyName = getBooleanPropertyName(jSONObject, "status");
            int intPropertyName = getIntPropertyName(jSONObject, "errorNum");
            String propertyName = getPropertyName(jSONObject, "errorInfo");
            if (booleanPropertyName && intPropertyName == 0 && "".equals(propertyName)) {
                JSONArray jSONArray = jSONObject.getJSONArray("data");
                Log.d("apkUpdate", "jsonAppInfoList = " + jSONArray.length());
                for (int i = 0; i < jSONArray.length(); i++) {
                    JSONObject jSONObject2 = jSONArray.getJSONObject(i);
                    HashMap<String, String> hashMap = new HashMap<>();
                    if (jSONObject2 != null) {
                        Iterator<String> keys = jSONObject2.keys();
                        while (keys.hasNext()) {
                            String next = keys.next();
                            Object opt = jSONObject2.opt(next);
                            if (opt != null) {
                                hashMap.put(next, opt.toString());
                            }
                        }
                    }
                    hashMap.put("is_down_finish", "0");
                    arrayList.add(hashMap);
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        return arrayList;
    }

    public static boolean getBooleanPropertyName(JSONObject jSONObject, String str) {
        boolean z = false;
        if (!jSONObject.isNull(str)) {
            try {
                z = jSONObject.getBoolean(str);
            } catch (JSONException e) {
                e.printStackTrace();
                z = false;
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        } else {
            z = false;
        }
        return z;
    }

    public static String getDefault(String str) {
        String str2 = str;
        if (str == null) {
            str2 = "";
        }
        return str2;
    }

    public static LogInfo getExamLog(LogInfo logInfo, String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8) {
        logInfo.setUserID(setDefault(str3));
        logInfo.setMachineID(setDefault(str));
        logInfo.setType(setDefault(str2));
        logInfo.setSubjectID(setDefault(str4));
        logInfo.setBookID(setDefault(str5));
        logInfo.setBookName(setDefault(str6));
        logInfo.setAssetsID(setDefault(str7));
        logInfo.setAssetsName(setDefault(str8));
        logInfo.setFirstTime(SystemTimeHelper.getTheSystemTime());
        logInfo.setLastTime(setDefault(""));
        logInfo.setTotalTime(0L);
        logInfo.setVisitCount(1L);
        return logInfo;
    }

    public static String getFileString(String str) {
        String str2;
        if (!new File(str).exists()) {
            str2 = "";
        } else {
            String str3 = "";
            try {
                FileInputStream fileInputStream = new FileInputStream(str);
                byte[] bArr = new byte[fileInputStream.available()];
                fileInputStream.read(bArr);
                String string = EncodingUtils.getString(bArr, "UTF-8");
                str3 = string;
                fileInputStream.close();
                str3 = string;
            } catch (Exception e) {
                e.printStackTrace();
            }
            str2 = str3 == null ? "" : str3;
        }
        return str2;
    }

    public static int getIntPropertyName(JSONObject jSONObject, String str) {
        int i = 0;
        if (!jSONObject.isNull(str)) {
            try {
                i = jSONObject.getInt(str);
            } catch (JSONException e) {
                e.printStackTrace();
                i = 0;
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        } else {
            i = 0;
        }
        return i;
    }

    public static ArrayList<String> getJsonArray(String str) {
        ArrayList<String> arrayList = new ArrayList<>();
        try {
            JSONArray jSONArray = new JSONArray(str);
            for (int i = 0; i < jSONArray.length(); i++) {
                arrayList.add(jSONArray.getString(i));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        return arrayList;
    }

    public static Long getLongPropertyName(JSONObject jSONObject, String str) {
        long j = 0;
        if (!jSONObject.isNull(str)) {
            try {
                j = jSONObject.getLong(str);
            } catch (JSONException e) {
                e.printStackTrace();
                j = 0;
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        } else {
            j = 0;
        }
        return Long.valueOf(j);
    }

    public static String getPropertyName(JSONObject jSONObject, String str) {
        String str2;
        if (!jSONObject.isNull(str)) {
            try {
                str2 = jSONObject.getString(str);
            } catch (JSONException e) {
                e.printStackTrace();
                str2 = "";
            }
        } else {
            str2 = "";
        }
        return str2;
    }

    public static String getStringJson(String str) {
        String str2;
        File file = new File(str);
        if (!file.exists()) {
            try {
                file.createNewFile();
                str2 = "";
            } catch (IOException e) {
                e.printStackTrace();
                str2 = "";
            }
        } else {
            str2 = getFileString(str);
        }
        return str2;
    }

    public static void idXmlCreate(String str, String str2) {
        if (str == null || str2 == null || "".equals(str) || "".equals(str2)) {
            return;
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        boolean z = false;
        String stringJson = getStringJson(ID_XML_File);
        if ("".equals(stringJson)) {
            if (0 == 0) {
                arrayList.add(str);
                arrayList2.add(str2);
            }
            idXmlFileCreate(arrayList, arrayList2);
            return;
        }
        try {
            JSONArray jSONArray = ((JSONObject) new JSONTokener(stringJson).nextValue()).getJSONArray("data");
            for (int i = 0; i < jSONArray.length(); i++) {
                JSONObject jSONObject = jSONArray.getJSONObject(i);
                String propertyName = getPropertyName(jSONObject, "username");
                String propertyName2 = getPropertyName(jSONObject, "stuid");
                if (str.equals(propertyName)) {
                    z = true;
                    arrayList.add(str);
                    arrayList2.add(str2);
                } else {
                    arrayList.add(propertyName);
                    arrayList2.add(propertyName2);
                }
            }
            if (!z) {
                arrayList.add(str);
                arrayList2.add(str2);
            }
            idXmlFileCreate(arrayList, arrayList2);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void idXmlFileCreate(ArrayList<String> arrayList, ArrayList<String> arrayList2) {
        JSONStringer jSONStringer = new JSONStringer();
        try {
            jSONStringer.object();
            jSONStringer.key("data");
            jSONStringer.array();
            for (int i = 0; i < arrayList.size() && i < arrayList2.size(); i++) {
                jSONStringer.object();
                jSONStringer.key("username").value(arrayList.get(i));
                jSONStringer.key("stuid").value(arrayList2.get(i));
                jSONStringer.endObject();
            }
            jSONStringer.endArray();
            jSONStringer.endObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        CreateFile(jSONStringer.toString(), ID_XML_File);
    }

    public static String idXmlParse(String str) {
        String str2;
        if (str == null) {
            str2 = "-1";
        } else if ("".equals(str)) {
            str2 = "-1";
        } else {
            String stringJson = getStringJson(ID_XML_File);
            if ("".equals(stringJson)) {
                str2 = "-1";
            } else {
                try {
                    JSONArray jSONArray = ((JSONObject) new JSONTokener(stringJson).nextValue()).getJSONArray("data");
                    for (int i = 0; i < jSONArray.length(); i++) {
                        JSONObject jSONObject = jSONArray.getJSONObject(i);
                        if (str.equals(getPropertyName(jSONObject, "username"))) {
                            str2 = getPropertyName(jSONObject, "stuid");
                            break;
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                str2 = "-1";
            }
        }
        return str2;
    }

    public static String logscreateJson(LogInfo logInfo, String str) {
        ArrayList<LogInfo> updateLogInfo = updateLogInfo(new ArrayList(), logInfo, str);
        JSONStringer jSONStringer = new JSONStringer();
        String str2 = "";
        String str3 = "";
        if (updateLogInfo.size() > 0) {
            str3 = updateLogInfo.get(0).getUserID();
            str2 = updateLogInfo.get(0).getMachineID();
        }
        try {
            jSONStringer.object();
            jSONStringer.key("UserID").value(str3);
            jSONStringer.key("MachineID").value(str2);
            jSONStringer.key("data");
            jSONStringer.array();
            for (int i = 0; i < updateLogInfo.size(); i++) {
                LogInfo logInfo2 = updateLogInfo.get(i);
                jSONStringer.object();
                String type = logInfo2.getType();
                String subjectID = logInfo2.getSubjectID();
                String bookID = logInfo2.getBookID();
                String bookName = logInfo2.getBookName();
                ArrayList<String> sectionsID = logInfo2.getSectionsID();
                String assetsID = logInfo2.getAssetsID();
                String assetsName = logInfo2.getAssetsName();
                String firstTime = logInfo2.getFirstTime();
                String lastTime = logInfo2.getLastTime();
                long totalTime = logInfo2.getTotalTime();
                long visitCount = logInfo2.getVisitCount();
                jSONStringer.key("Type").value(type);
                jSONStringer.key("SubjectID").value(subjectID);
                jSONStringer.key("BookID").value(bookID);
                jSONStringer.key("BookName").value(bookName);
                setJsonArray(jSONStringer, sectionsID, "SectionsID");
                jSONStringer.key("AssetsID").value(assetsID);
                jSONStringer.key("AssetsName").value(assetsName);
                jSONStringer.key("FirstTime").value(firstTime);
                jSONStringer.key("LastTime").value(lastTime);
                jSONStringer.key("TotalTime").value(String.valueOf(totalTime));
                jSONStringer.key("VisitCount").value(String.valueOf(visitCount));
                jSONStringer.endObject();
            }
            jSONStringer.endArray();
            jSONStringer.endObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jSONStringer.toString();
    }

    public static ArrayList<LogInfo> logsparserJson(ArrayList<LogInfo> arrayList, String str) {
        arrayList.clear();
        File file = new File(str);
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            String fileString = getFileString(str);
            if (!"".equals(fileString)) {
                try {
                    JSONObject jSONObject = (JSONObject) new JSONTokener(fileString).nextValue();
                    String propertyName = getPropertyName(jSONObject, "UserID");
                    String propertyName2 = getPropertyName(jSONObject, "MachineID");
                    JSONArray jSONArray = jSONObject.getJSONArray("data");
                    for (int i = 0; i < jSONArray.length(); i++) {
                        JSONObject jSONObject2 = jSONArray.getJSONObject(i);
                        LogInfo logInfo = new LogInfo();
                        String propertyName3 = getPropertyName(jSONObject2, "Type");
                        String propertyName4 = getPropertyName(jSONObject2, "SubjectID");
                        String propertyName5 = getPropertyName(jSONObject2, "BookID");
                        String propertyName6 = getPropertyName(jSONObject2, "BookName");
                        String propertyName7 = getPropertyName(jSONObject2, "SectionsID");
                        String propertyName8 = getPropertyName(jSONObject2, "AssetsID");
                        String propertyName9 = getPropertyName(jSONObject2, "AssetsName");
                        String propertyName10 = getPropertyName(jSONObject2, "FirstTime");
                        String propertyName11 = getPropertyName(jSONObject2, "LastTime");
                        String propertyName12 = getPropertyName(jSONObject2, "TotalTime");
                        String propertyName13 = getPropertyName(jSONObject2, "VisitCount");
                        String str2 = propertyName12;
                        if ("".equals(propertyName12)) {
                            str2 = "0";
                        }
                        String str3 = propertyName13;
                        if ("".equals(propertyName13)) {
                            str3 = "0";
                        }
                        logInfo.setUserID(propertyName);
                        logInfo.setMachineID(propertyName2);
                        logInfo.setType(propertyName3);
                        logInfo.setSubjectID(propertyName4);
                        logInfo.setBookID(propertyName5);
                        logInfo.setBookName(propertyName6);
                        logInfo.setSectionsID(getJsonArray(propertyName7));
                        logInfo.setAssetsID(propertyName8);
                        logInfo.setAssetsName(propertyName9);
                        logInfo.setFirstTime(propertyName10);
                        logInfo.setLastTime(propertyName11);
                        logInfo.setTotalTime(Long.parseLong(str2));
                        logInfo.setVisitCount(Long.parseLong(str3));
                        arrayList.add(logInfo);
                    }
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
        }
        return arrayList;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x004a, code lost:
        if ("".equals(r0) == false) goto L12;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int parseHttpPostReturnJson(String str) {
        int i = 0;
        if (!"".equals(str)) {
            try {
                JSONObject jSONObject = (JSONObject) new JSONTokener(str).nextValue();
                boolean booleanPropertyName = getBooleanPropertyName(jSONObject, "status");
                int intPropertyName = getIntPropertyName(jSONObject, "errorNum");
                String propertyName = getPropertyName(jSONObject, "errorInfo");
                if (booleanPropertyName && intPropertyName == 0) {
                }
                i = (booleanPropertyName || intPropertyName != 1) ? (booleanPropertyName || intPropertyName != 2) ? (booleanPropertyName || intPropertyName != 3) ? (booleanPropertyName || intPropertyName != 4) ? -1 : 4 : 3 : 2 : 1;
            } catch (JSONException e) {
                e.printStackTrace();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return i;
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0066, code lost:
        if ("".equals(r0) != false) goto L5;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String parseSetPwdReturnJson(String str) {
        String str2;
        Log.i("strResult", "parseHttpPostReturnJson:" + str);
        if ("".equals(str)) {
            str2 = "";
        } else {
            try {
                JSONObject jSONObject = (JSONObject) new JSONTokener(str).nextValue();
                boolean booleanPropertyName = getBooleanPropertyName(jSONObject, "status");
                int intPropertyName = getIntPropertyName(jSONObject, "errorNum");
                String propertyName = getPropertyName(jSONObject, "errorInfo");
                str2 = getPropertyName(jSONObject, "data");
                if (booleanPropertyName && intPropertyName == 0) {
                }
            } catch (JSONException e) {
                e.printStackTrace();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
            str2 = "";
        }
        return str2;
    }

    private static String setDefault(String str) {
        if ("".equals(str)) {
            str = "NULL";
        }
        return str;
    }

    public static void setJsonArray(JSONStringer jSONStringer, ArrayList<String> arrayList, String str) {
        int size = arrayList.size();
        try {
            jSONStringer.key(str);
            jSONStringer.array();
            for (int i = 0; i < size; i++) {
                jSONStringer.value(arrayList.get(i));
            }
            jSONStringer.endArray();
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0101  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static ArrayList<LogInfo> updateLogInfo(ArrayList<LogInfo> arrayList, LogInfo logInfo, String str) {
        int parseInt;
        ArrayList<LogInfo> logsparserJson = logsparserJson(arrayList, str);
        String userID = logInfo.getUserID();
        logInfo.getMachineID();
        String type = logInfo.getType();
        String subjectID = logInfo.getSubjectID();
        String bookID = logInfo.getBookID();
        String bookName = logInfo.getBookName();
        logInfo.getSectionsID();
        String assetsID = logInfo.getAssetsID();
        String assetsName = logInfo.getAssetsName();
        String firstTime = logInfo.getFirstTime();
        String lastTime = logInfo.getLastTime();
        long totalTime = logInfo.getTotalTime();
        long visitCount = logInfo.getVisitCount();
        boolean z = false;
        boolean z2 = false;
        if (!"".equals(userID) && !"-1".equals(userID) && !"NULL".equals(userID) && !"NULL".equals(firstTime) && !"NULL".equals(lastTime) && (((parseInt = Integer.parseInt(type)) >= 1 && parseInt <= 12) || parseInt == 14)) {
            switch (parseInt) {
                case 1:
                case 2:
                case 3:
                    if (!"NULL".equals(bookID) && !"NULL".equals(assetsID) && totalTime != 0) {
                        Iterator<LogInfo> it = logsparserJson.iterator();
                        while (true) {
                            z2 = z;
                            if (!it.hasNext()) {
                                if (!z2) {
                                    logsparserJson.add(logInfo);
                                    break;
                                }
                            } else {
                                LogInfo next = it.next();
                                if (next.getType().equals(type) && next.getBookID().equals(bookID) && next.getUserID().equals(userID) && next.getAssetsID().equals(assetsID)) {
                                    z = updateTime_Count(next, lastTime, totalTime, visitCount);
                                }
                            }
                        }
                    }
                    break;
                case 4:
                    if (!"NULL".equals(assetsID) && totalTime != 0) {
                        Iterator<LogInfo> it2 = logsparserJson.iterator();
                        boolean z3 = false;
                        while (true) {
                            z2 = z3;
                            if (it2.hasNext()) {
                                LogInfo next2 = it2.next();
                                if (next2.getType().equals(type) && next2.getUserID().equals(userID) && next2.getAssetsID().equals(assetsID)) {
                                    z3 = updateTime_Count(next2, lastTime, totalTime, visitCount);
                                }
                            } else if (!z2) {
                            }
                        }
                    }
                    break;
                case 5:
                    if (!"NULL".equals(bookName) && !"NULL".equals(assetsID) && !"NULL".equals(assetsName) && totalTime != 0) {
                        Iterator<LogInfo> it3 = logsparserJson.iterator();
                        boolean z4 = false;
                        while (true) {
                            z2 = z4;
                            if (it3.hasNext()) {
                                LogInfo next3 = it3.next();
                                if (next3.getType().equals(type) && next3.getUserID().equals(userID) && next3.getAssetsID().equals(assetsID)) {
                                    z4 = updateTime_Count(next3, lastTime, totalTime, visitCount);
                                }
                            } else if (!z2) {
                            }
                        }
                    }
                    break;
                case 6:
                case 7:
                case 8:
                case 9:
                case 10:
                case 12:
                case 13:
                    if (!"NULL".equals(subjectID) && !"NULL".equals(assetsID) && totalTime != 0) {
                        Iterator<LogInfo> it4 = logsparserJson.iterator();
                        boolean z5 = false;
                        while (true) {
                            z2 = z5;
                            if (it4.hasNext()) {
                                LogInfo next4 = it4.next();
                                if (next4.getType().equals(type) && next4.getUserID().equals(userID) && next4.getSubjectID().equals(subjectID) && next4.getAssetsID().equals(assetsID)) {
                                    z5 = updateTime_Count(next4, lastTime, totalTime, visitCount);
                                }
                            } else if (!z2) {
                            }
                        }
                    }
                    break;
                case 11:
                    if (!"NULL".equals(subjectID) && !"NULL".equals(assetsID) && !"NULL".equals(assetsName)) {
                        Iterator<LogInfo> it5 = logsparserJson.iterator();
                        boolean z6 = false;
                        while (true) {
                            z2 = z6;
                            if (it5.hasNext()) {
                                LogInfo next5 = it5.next();
                                if (next5.getType().equals(type) && next5.getUserID().equals(userID) && next5.getSubjectID().equals(subjectID) && next5.getAssetsID().equals(assetsID) && next5.getAssetsName().equals(assetsName)) {
                                    z6 = updateTime_Count(next5, lastTime, totalTime, visitCount);
                                }
                            } else if (!z2) {
                            }
                        }
                    }
                    break;
                case 14:
                    if (!"NULL".equals(bookID) && !"NULL".equals(assetsID) && !"NULL".equals(assetsName)) {
                        Iterator<LogInfo> it6 = logsparserJson.iterator();
                        boolean z7 = false;
                        while (true) {
                            z2 = z7;
                            if (it6.hasNext()) {
                                LogInfo next6 = it6.next();
                                if (next6.getType().equals(type) && next6.getUserID().equals(userID) && next6.getBookID().equals(bookID) && next6.getAssetsID().equals(assetsID) && next6.getAssetsName().equals(assetsName)) {
                                    z7 = updateTime_Count(next6, lastTime, totalTime, visitCount);
                                }
                            } else if (!z2) {
                            }
                        }
                    }
                    break;
                default:
                    if (!z2) {
                    }
                    break;
            }
        }
        return logsparserJson;
    }

    public static boolean updateTime_Count(LogInfo logInfo, String str, long j, long j2) {
        logInfo.setLastTime(str);
        logInfo.setTotalTime(logInfo.getTotalTime() + j);
        logInfo.setVisitCount(logInfo.getVisitCount() + j2);
        return true;
    }
}
