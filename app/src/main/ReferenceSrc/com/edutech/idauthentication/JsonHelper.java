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

/* loaded from: classes.dex */
public class JsonHelper {
    public static final String ID_XML_File = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "CloudClient" + File.separatorChar + ".System" + File.separatorChar + "id.xml";

    public static String idXmlParse(String userName) {
        if (userName != null && !"".equals(userName)) {
            String idjson = getStringJson(ID_XML_File);
            if ("".equals(idjson)) {
                return "-1";
            }
            try {
                JSONTokener jsonTokener = new JSONTokener(idjson);
                JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
                JSONArray array = jsonObject.getJSONArray("data");
                for (int i = 0; i < array.length(); i++) {
                    JSONObject object = array.getJSONObject(i);
                    String jsonUserName = getPropertyName(object, "username");
                    if (userName.equals(jsonUserName)) {
                        String stuId = getPropertyName(object, "stuid");
                        return stuId;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "-1";
        }
        return "-1";
    }

    public static String getStringJson(String path) {
        File idxmljson = new File(path);
        if (!idxmljson.exists()) {
            try {
                idxmljson.createNewFile();
                return "";
            } catch (IOException e) {
                e.printStackTrace();
                return "";
            }
        }
        String idjson = getFileString(path);
        return idjson;
    }

    public static void idXmlCreate(String username, String stuId) {
        if (username != null && stuId != null && !"".equals(username) && !"".equals(stuId)) {
            ArrayList<String> usernamelist = new ArrayList<>();
            ArrayList<String> stuidlist = new ArrayList<>();
            boolean isexistuser = false;
            String idjson = getStringJson(ID_XML_File);
            if ("".equals(idjson)) {
                if (0 == 0) {
                    usernamelist.add(username);
                    stuidlist.add(stuId);
                }
                idXmlFileCreate(usernamelist, stuidlist);
                return;
            }
            try {
                JSONTokener jsonTokener = new JSONTokener(idjson);
                JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
                JSONArray array = jsonObject.getJSONArray("data");
                for (int i = 0; i < array.length(); i++) {
                    JSONObject object = array.getJSONObject(i);
                    String jsonUserName = getPropertyName(object, "username");
                    String jsonStuId = getPropertyName(object, "stuid");
                    if (username.equals(jsonUserName)) {
                        isexistuser = true;
                        usernamelist.add(username);
                        stuidlist.add(stuId);
                    } else {
                        usernamelist.add(jsonUserName);
                        stuidlist.add(jsonStuId);
                    }
                }
                if (!isexistuser) {
                    usernamelist.add(username);
                    stuidlist.add(stuId);
                }
                idXmlFileCreate(usernamelist, stuidlist);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void idXmlFileCreate(ArrayList<String> usernamelist, ArrayList<String> stuidlist) {
        JSONStringer jsonStringer = new JSONStringer();
        try {
            jsonStringer.object();
            jsonStringer.key("data");
            jsonStringer.array();
            for (int i = 0; i < usernamelist.size() && i < stuidlist.size(); i++) {
                jsonStringer.object();
                jsonStringer.key("username").value(usernamelist.get(i));
                jsonStringer.key("stuid").value(stuidlist.get(i));
                jsonStringer.endObject();
            }
            jsonStringer.endArray();
            jsonStringer.endObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        CreateFile(jsonStringer.toString(), ID_XML_File);
    }

    public static LogInfo alogparserJson(String StudentId, String machineId, LogInfo loginfo, String logjson) {
        if (!"".equals(logjson)) {
            try {
                JSONObject object = new JSONObject(logjson);
                String UserID = setDefault(getPropertyName(object, "UserID"));
                String Type = setDefault(getPropertyName(object, "Type"));
                String SubjectID = setDefault(getPropertyName(object, "SubjectID"));
                String BookID = setDefault(getPropertyName(object, "BookID"));
                String BookName = setDefault(getPropertyName(object, "BookName"));
                String SectionsID = getPropertyName(object, "SectionsID");
                String AssetsID = setDefault(getPropertyName(object, "AssetsID"));
                String AssetsName = setDefault(getPropertyName(object, "AssetsName"));
                String FirstTime = setDefault(getPropertyName(object, "FirstTime"));
                String LastTime = setDefault(getPropertyName(object, "LastTime"));
                String TotalTime = getPropertyName(object, "TotalTime");
                String VisitCount = getPropertyName(object, "VisitCount");
                if ("".equals(TotalTime)) {
                    TotalTime = "0";
                }
                if ("".equals(VisitCount)) {
                    VisitCount = "0";
                }
                if ("".equals(UserID) || "NULL".equals(FirstTime)) {
                    UserID = StudentId;
                }
                if ("".equals(FirstTime) || "NULL".equals(FirstTime)) {
                    FirstTime = SystemTimeHelper.getTheSystemTime();
                }
                loginfo.setUserID(UserID);
                loginfo.setMachineID(machineId);
                loginfo.setType(Type);
                loginfo.setSubjectID(SubjectID);
                loginfo.setBookID(BookID);
                loginfo.setBookName(BookName);
                loginfo.setSectionsID(getJsonArray(SectionsID));
                loginfo.setAssetsID(AssetsID);
                loginfo.setAssetsName(AssetsName);
                loginfo.setFirstTime(FirstTime);
                loginfo.setLastTime(LastTime);
                loginfo.setTotalTime(Long.parseLong(TotalTime));
                loginfo.setVisitCount(Long.parseLong(VisitCount));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return loginfo;
    }

    public static LogInfo getExamLog(LogInfo loginfo, String MachineID, String Type, String UserID, String SubjectID, String BookID, String BookName, String AssetsID, String AssetsName) {
        loginfo.setUserID(setDefault(UserID));
        loginfo.setMachineID(setDefault(MachineID));
        loginfo.setType(setDefault(Type));
        loginfo.setSubjectID(setDefault(SubjectID));
        loginfo.setBookID(setDefault(BookID));
        loginfo.setBookName(setDefault(BookName));
        loginfo.setAssetsID(setDefault(AssetsID));
        loginfo.setAssetsName(setDefault(AssetsName));
        loginfo.setFirstTime(SystemTimeHelper.getTheSystemTime());
        loginfo.setLastTime(setDefault(""));
        loginfo.setTotalTime(0L);
        loginfo.setVisitCount(1L);
        return loginfo;
    }

    private static String setDefault(String strDate) {
        return "".equals(strDate) ? "NULL" : strDate;
    }

    public static ArrayList<LogInfo> logsparserJson(ArrayList<LogInfo> logs, String logPath) {
        logs.clear();
        File logjson = new File(logPath);
        if (!logjson.exists()) {
            try {
                logjson.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            String json = getFileString(logPath);
            if (!"".equals(json)) {
                try {
                    JSONTokener jsonTokener = new JSONTokener(json);
                    JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
                    String UserID = getPropertyName(jsonObject, "UserID");
                    String MachineID = getPropertyName(jsonObject, "MachineID");
                    JSONArray array = jsonObject.getJSONArray("data");
                    for (int i = 0; i < array.length(); i++) {
                        JSONObject object = array.getJSONObject(i);
                        LogInfo loginfo = new LogInfo();
                        String Type = getPropertyName(object, "Type");
                        String SubjectID = getPropertyName(object, "SubjectID");
                        String BookID = getPropertyName(object, "BookID");
                        String BookName = getPropertyName(object, "BookName");
                        String SectionsID = getPropertyName(object, "SectionsID");
                        String AssetsID = getPropertyName(object, "AssetsID");
                        String AssetsName = getPropertyName(object, "AssetsName");
                        String FirstTime = getPropertyName(object, "FirstTime");
                        String LastTime = getPropertyName(object, "LastTime");
                        String TotalTime = getPropertyName(object, "TotalTime");
                        String VisitCount = getPropertyName(object, "VisitCount");
                        if ("".equals(TotalTime)) {
                            TotalTime = "0";
                        }
                        if ("".equals(VisitCount)) {
                            VisitCount = "0";
                        }
                        loginfo.setUserID(UserID);
                        loginfo.setMachineID(MachineID);
                        loginfo.setType(Type);
                        loginfo.setSubjectID(SubjectID);
                        loginfo.setBookID(BookID);
                        loginfo.setBookName(BookName);
                        loginfo.setSectionsID(getJsonArray(SectionsID));
                        loginfo.setAssetsID(AssetsID);
                        loginfo.setAssetsName(AssetsName);
                        loginfo.setFirstTime(FirstTime);
                        loginfo.setLastTime(LastTime);
                        loginfo.setTotalTime(Long.parseLong(TotalTime));
                        loginfo.setVisitCount(Long.parseLong(VisitCount));
                        logs.add(loginfo);
                    }
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
        }
        return logs;
    }

    public static String logscreateJson(LogInfo logInfo, String logPath) {
        ArrayList<LogInfo> logs = updateLogInfo(new ArrayList<>(), logInfo, logPath);
        JSONStringer jsonStringer = new JSONStringer();
        String MachineID = "";
        String UserID = "";
        if (logs.size() > 0) {
            UserID = logs.get(0).getUserID();
            MachineID = logs.get(0).getMachineID();
        }
        try {
            jsonStringer.object();
            jsonStringer.key("UserID").value(UserID);
            jsonStringer.key("MachineID").value(MachineID);
            jsonStringer.key("data");
            jsonStringer.array();
            for (int i = 0; i < logs.size(); i++) {
                LogInfo loginfo = logs.get(i);
                jsonStringer.object();
                String Type = loginfo.getType();
                String SubjectID = loginfo.getSubjectID();
                String BookID = loginfo.getBookID();
                String BookName = loginfo.getBookName();
                ArrayList<String> SectionsID = loginfo.getSectionsID();
                String AssetsID = loginfo.getAssetsID();
                String AssetsName = loginfo.getAssetsName();
                String FirstTime = loginfo.getFirstTime();
                String LastTime = loginfo.getLastTime();
                String TotalTime = String.valueOf(loginfo.getTotalTime());
                String VisitCount = String.valueOf(loginfo.getVisitCount());
                jsonStringer.key("Type").value(Type);
                jsonStringer.key("SubjectID").value(SubjectID);
                jsonStringer.key("BookID").value(BookID);
                jsonStringer.key("BookName").value(BookName);
                setJsonArray(jsonStringer, SectionsID, "SectionsID");
                jsonStringer.key("AssetsID").value(AssetsID);
                jsonStringer.key("AssetsName").value(AssetsName);
                jsonStringer.key("FirstTime").value(FirstTime);
                jsonStringer.key("LastTime").value(LastTime);
                jsonStringer.key("TotalTime").value(TotalTime);
                jsonStringer.key("VisitCount").value(VisitCount);
                jsonStringer.endObject();
            }
            jsonStringer.endArray();
            jsonStringer.endObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonStringer.toString();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0091  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static ArrayList<LogInfo> updateLogInfo(ArrayList<LogInfo> logs, LogInfo loginfo, String logPath) {
        ArrayList<LogInfo> logs2 = logsparserJson(logs, logPath);
        String UserID = loginfo.getUserID();
        loginfo.getMachineID();
        String Type = loginfo.getType();
        String SubjectID = loginfo.getSubjectID();
        String BookID = loginfo.getBookID();
        String BookName = loginfo.getBookName();
        loginfo.getSectionsID();
        String AssetsID = loginfo.getAssetsID();
        String AssetsName = loginfo.getAssetsName();
        String FirstTime = loginfo.getFirstTime();
        String LastTime = loginfo.getLastTime();
        long TotalTime = loginfo.getTotalTime();
        long VisitCount = loginfo.getVisitCount();
        boolean isfoundLog = false;
        if (!"".equals(UserID) && !"-1".equals(UserID) && !"NULL".equals(UserID) && !"NULL".equals(FirstTime) && !"NULL".equals(LastTime)) {
            int longType = Integer.parseInt(Type);
            if ((longType >= 1 && longType <= 12) || longType == 14) {
                switch (longType) {
                    case 1:
                    case 2:
                    case 3:
                        if (!"NULL".equals(BookID) && !"NULL".equals(AssetsID) && TotalTime != 0) {
                            Iterator<LogInfo> it = logs2.iterator();
                            while (it.hasNext()) {
                                LogInfo log = it.next();
                                if (log.getType().equals(Type) && log.getBookID().equals(BookID) && log.getUserID().equals(UserID) && log.getAssetsID().equals(AssetsID)) {
                                    isfoundLog = updateTime_Count(log, LastTime, TotalTime, VisitCount);
                                }
                            }
                            if (!isfoundLog) {
                                logs2.add(loginfo);
                                break;
                            }
                        }
                        break;
                    case 4:
                        if (!"NULL".equals(AssetsID) && TotalTime != 0) {
                            Iterator<LogInfo> it2 = logs2.iterator();
                            while (it2.hasNext()) {
                                LogInfo log2 = it2.next();
                                if (log2.getType().equals(Type) && log2.getUserID().equals(UserID) && log2.getAssetsID().equals(AssetsID)) {
                                    isfoundLog = updateTime_Count(log2, LastTime, TotalTime, VisitCount);
                                }
                            }
                            if (!isfoundLog) {
                            }
                        }
                        break;
                    case 5:
                        if (!"NULL".equals(BookName) && !"NULL".equals(AssetsID) && !"NULL".equals(AssetsName) && TotalTime != 0) {
                            Iterator<LogInfo> it3 = logs2.iterator();
                            while (it3.hasNext()) {
                                LogInfo log3 = it3.next();
                                if (log3.getType().equals(Type) && log3.getUserID().equals(UserID) && log3.getAssetsID().equals(AssetsID)) {
                                    isfoundLog = updateTime_Count(log3, LastTime, TotalTime, VisitCount);
                                }
                            }
                            if (!isfoundLog) {
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
                        if (!"NULL".equals(SubjectID) && !"NULL".equals(AssetsID) && TotalTime != 0) {
                            Iterator<LogInfo> it4 = logs2.iterator();
                            while (it4.hasNext()) {
                                LogInfo log4 = it4.next();
                                if (log4.getType().equals(Type) && log4.getUserID().equals(UserID) && log4.getSubjectID().equals(SubjectID) && log4.getAssetsID().equals(AssetsID)) {
                                    isfoundLog = updateTime_Count(log4, LastTime, TotalTime, VisitCount);
                                }
                            }
                            if (!isfoundLog) {
                            }
                        }
                        break;
                    case 11:
                        if (!"NULL".equals(SubjectID) && !"NULL".equals(AssetsID) && !"NULL".equals(AssetsName)) {
                            Iterator<LogInfo> it5 = logs2.iterator();
                            while (it5.hasNext()) {
                                LogInfo log5 = it5.next();
                                if (log5.getType().equals(Type) && log5.getUserID().equals(UserID) && log5.getSubjectID().equals(SubjectID) && log5.getAssetsID().equals(AssetsID) && log5.getAssetsName().equals(AssetsName)) {
                                    isfoundLog = updateTime_Count(log5, LastTime, TotalTime, VisitCount);
                                }
                            }
                            if (!isfoundLog) {
                            }
                        }
                        break;
                    case 14:
                        if (!"NULL".equals(BookID) && !"NULL".equals(AssetsID) && !"NULL".equals(AssetsName)) {
                            Iterator<LogInfo> it6 = logs2.iterator();
                            while (it6.hasNext()) {
                                LogInfo log6 = it6.next();
                                if (log6.getType().equals(Type) && log6.getUserID().equals(UserID) && log6.getBookID().equals(BookID) && log6.getAssetsID().equals(AssetsID) && log6.getAssetsName().equals(AssetsName)) {
                                    isfoundLog = updateTime_Count(log6, LastTime, TotalTime, VisitCount);
                                }
                            }
                            if (!isfoundLog) {
                            }
                        }
                        break;
                    default:
                        if (!isfoundLog) {
                        }
                        break;
                }
            }
        }
        return logs2;
    }

    public static boolean updateTime_Count(LogInfo log, String LastTime, long TotalTime, long VisitCount) {
        log.setLastTime(LastTime);
        log.setTotalTime(log.getTotalTime() + TotalTime);
        log.setVisitCount(log.getVisitCount() + VisitCount);
        return true;
    }

    public static int parseHttpPostReturnJson(String json) {
        if ("".equals(json)) {
            return 0;
        }
        try {
            JSONTokener jsonTokener = new JSONTokener(json);
            JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
            boolean status = getBooleanPropertyName(jsonObject, "status");
            int errorNum = getIntPropertyName(jsonObject, "errorNum");
            String errorInfo = getPropertyName(jsonObject, "errorInfo");
            if (status && errorNum == 0) {
                if ("".equals(errorInfo)) {
                    return 0;
                }
            }
            if (!status && errorNum == 1) {
                return 1;
            }
            if (!status && errorNum == 2) {
                return 2;
            }
            if (!status && errorNum == 3) {
                return 3;
            }
            return (status || errorNum != 4) ? -1 : 4;
        } catch (JSONException e) {
            e.printStackTrace();
            return 0;
        } catch (Exception e2) {
            e2.printStackTrace();
            return 0;
        }
    }

    public static String parseSetPwdReturnJson(String json) {
        Log.i("strResult", "parseHttpPostReturnJson:" + json);
        if ("".equals(json)) {
            return "";
        }
        try {
            JSONTokener jsonTokener = new JSONTokener(json);
            JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
            boolean status = getBooleanPropertyName(jsonObject, "status");
            int errorNum = getIntPropertyName(jsonObject, "errorNum");
            String errorInfo = getPropertyName(jsonObject, "errorInfo");
            String data = getPropertyName(jsonObject, "data");
            if (status && errorNum == 0) {
                if ("".equals(errorInfo)) {
                    return data;
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        return "";
    }

    public static ArrayList<HashMap<String, String>> dataParse(ArrayList<HashMap<String, String>> dataInfo, String json) {
        try {
            JSONTokener jsonTokener = new JSONTokener(json);
            JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
            boolean status = getBooleanPropertyName(jsonObject, "status");
            int errorNum = getIntPropertyName(jsonObject, "errorNum");
            String errorInfo = getPropertyName(jsonObject, "errorInfo");
            if (status && errorNum == 0 && "".equals(errorInfo)) {
                JSONArray array = jsonObject.getJSONArray("data");
                Log.d("apkUpdate", "jsonAppInfoList = " + array.length());
                for (int i = 0; i < array.length(); i++) {
                    JSONObject object = array.getJSONObject(i);
                    HashMap<String, String> tempdatainfo = new HashMap<>();
                    if (object != null) {
                        Iterator<String> keyIter = object.keys();
                        while (keyIter.hasNext()) {
                            String keyStr = keyIter.next();
                            Object itemObject = object.opt(keyStr);
                            if (itemObject != null) {
                                tempdatainfo.put(keyStr, itemObject.toString());
                            }
                        }
                    }
                    tempdatainfo.put("is_down_finish", "0");
                    dataInfo.add(tempdatainfo);
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        return dataInfo;
    }

    public static void dataCreate(ArrayList<HashMap<String, String>> dataInfo) {
        JSONStringer jsonStringer = new JSONStringer();
        try {
            jsonStringer.object();
            jsonStringer.key("data");
            jsonStringer.array();
            for (int i = 0; i < dataInfo.size(); i++) {
                jsonStringer.object();
                jsonStringer.key("appname").value(getDefault(dataInfo.get(i).get("appname")));
                jsonStringer.key("packagename").value(getDefault(dataInfo.get(i).get("packagename")));
                jsonStringer.key("versioncode").value(getDefault(dataInfo.get(i).get("versioncode")));
                jsonStringer.key("versionname").value(getDefault(dataInfo.get(i).get("versionname")));
                jsonStringer.key("appwebpath").value(getDefault(dataInfo.get(i).get("appwebpath")));
                if ("".equals(getDefault(dataInfo.get(i).get("is_down_finish")))) {
                    dataInfo.get(i).put("is_down_finish", "0");
                }
                jsonStringer.key("is_down_finish").value(getDefault(dataInfo.get(i).get("is_down_finish")));
                jsonStringer.endObject();
            }
            jsonStringer.endArray();
            jsonStringer.endObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String apkpath = String.valueOf(AppEnvironment.FOLDER_EDUTECH) + "apk.json";
        File apkJsonFile = new File(apkpath);
        if (!apkJsonFile.exists()) {
            FileInOutHelper.createNewFile(apkJsonFile);
        }
        CreateFile(jsonStringer.toString(), apkpath);
    }

    public static String getDefault(String str) {
        if (str == null) {
            return "";
        }
        return str;
    }

    public static String getFileString(String path) {
        String res = "";
        File file = new File(path);
        if (!file.exists()) {
            return res;
        }
        try {
            FileInputStream fin = new FileInputStream(path);
            int length = fin.available();
            byte[] buffer = new byte[length];
            fin.read(buffer);
            res = EncodingUtils.getString(buffer, "UTF-8");
            fin.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res == null ? "" : res;
    }

    public static boolean CreateFile(String Json, String path) {
        File newFile = new File(path);
        try {
            try {
                FileOutputStream fos = new FileOutputStream(newFile);
                try {
                    fos.write(Json.getBytes("UTF-8"));
                    fos.close();
                    return true;
                } catch (IOException e) {
                    e.printStackTrace();
                    return false;
                }
            } catch (FileNotFoundException e2) {
                e2.printStackTrace();
                return false;
            }
        } catch (Exception e3) {
            e3.printStackTrace();
            return false;
        }
    }

    public static String getPropertyName(JSONObject jsonObject, String propertyName) {
        if (!jsonObject.isNull(propertyName)) {
            try {
                String Name = jsonObject.getString(propertyName);
                return Name;
            } catch (JSONException e) {
                e.printStackTrace();
                return "";
            }
        }
        return "";
    }

    public static boolean getBooleanPropertyName(JSONObject jsonObject, String propertyName) {
        if (!jsonObject.isNull(propertyName)) {
            try {
                boolean Name = jsonObject.getBoolean(propertyName);
                return Name;
            } catch (JSONException e) {
                e.printStackTrace();
                return false;
            } catch (Exception e2) {
                e2.printStackTrace();
                return false;
            }
        }
        return false;
    }

    public static int getIntPropertyName(JSONObject jsonObject, String propertyName) {
        if (!jsonObject.isNull(propertyName)) {
            try {
                int Name = jsonObject.getInt(propertyName);
                return Name;
            } catch (JSONException e) {
                e.printStackTrace();
                return 0;
            } catch (Exception e2) {
                e2.printStackTrace();
                return 0;
            }
        }
        return 0;
    }

    public static Long getLongPropertyName(JSONObject jsonObject, String propertyName) {
        long Name = 0;
        if (!jsonObject.isNull(propertyName)) {
            try {
                Name = jsonObject.getLong(propertyName);
            } catch (JSONException e) {
                e.printStackTrace();
                Name = 0;
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        } else {
            Name = 0;
        }
        return Long.valueOf(Name);
    }

    public static ArrayList<String> getJsonArray(String objectString) {
        ArrayList<String> temparray = new ArrayList<>();
        try {
            JSONArray jsonarray = new JSONArray(objectString);
            for (int k = 0; k < jsonarray.length(); k++) {
                temparray.add(jsonarray.getString(k));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        return temparray;
    }

    public static void setJsonArray(JSONStringer jsonStringer, ArrayList<String> arraylist, String propertyName) {
        int arraylistsize = arraylist.size();
        try {
            jsonStringer.key(propertyName);
            jsonStringer.array();
            for (int k = 0; k < arraylistsize; k++) {
                jsonStringer.value(arraylist.get(k));
            }
            jsonStringer.endArray();
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }
}
