package com.edutech.daoxueben.until;

import android.os.Environment;
import com.edutech.idauthentication.AppEnvironment;
import com.edutech.json.KeyEnvironment;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import org.apache.http.util.EncodingUtils;
import org.jivesoftware.smackx.Form;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;
import org.json.JSONTokener;

/* loaded from: classes.jar:com/edutech/daoxueben/until/JsonHelper.class */
public class JsonHelper {
    private static String CreateDir() {
        String str = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "JSONFile" + File.separatorChar;
        File file = new File(str);
        if (!file.exists()) {
            file.mkdirs();
        }
        return str;
    }

    public static boolean CreateFile(String str, String str2) {
        boolean z = false;
        synchronized (JsonHelper.class) {
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
            } finally {
            }
        }
        return z;
    }

    public static String bookUpdatePostCreateJson(ArrayList<BookUpdateInfo> arrayList) {
        String jSONStringer;
        if (arrayList.size() == 0) {
            jSONStringer = "";
        } else {
            JSONStringer jSONStringer2 = new JSONStringer();
            try {
                jSONStringer2.object();
                jSONStringer2.key("data");
                jSONStringer2.array();
                for (int i = 0; i < arrayList.size(); i++) {
                    BookUpdateInfo bookUpdateInfo = arrayList.get(i);
                    jSONStringer2.object();
                    String idVar = bookUpdateInfo.getid();
                    String str = bookUpdateInfo.gettype();
                    String str2 = bookUpdateInfo.getsource();
                    String str3 = bookUpdateInfo.getupdatetime();
                    int i2 = bookUpdateInfo.gettotal();
                    jSONStringer2.key("id").value(idVar);
                    jSONStringer2.key("type").value(str);
                    jSONStringer2.key("source").value(str2);
                    jSONStringer2.key("updatetime").value(str3);
                    jSONStringer2.key("total").value(i2);
                    jSONStringer2.endObject();
                }
                jSONStringer2.endArray();
                jSONStringer2.endObject();
            } catch (Exception e) {
                e.printStackTrace();
            }
            jSONStringer = jSONStringer2.toString();
        }
        return jSONStringer;
    }

    public static String bookscreateJson(ArrayList<OldBooks> arrayList) {
        JSONStringer jSONStringer = new JSONStringer();
        try {
            jSONStringer.object();
            jSONStringer.key("data");
            jSONStringer.array();
            for (int i = 0; i < arrayList.size(); i++) {
                OldBooks oldBooks = arrayList.get(i);
                jSONStringer.object();
                String str = oldBooks.getbook_id();
                String str2 = oldBooks.getbook_name();
                long bookdownloadsize = oldBooks.getBookdownloadsize();
                long booksize = oldBooks.getBooksize();
                String str3 = oldBooks.getbook_path();
                String progress = oldBooks.getProgress();
                String book_updatetime = oldBooks.getBook_updatetime();
                int book_isnew = oldBooks.getBook_isnew();
                int book_total = oldBooks.getBook_total();
                jSONStringer.key("id").value(str);
                jSONStringer.key("name").value(str2);
                jSONStringer.key("path").value(str3);
                jSONStringer.key(KeyEnvironment.KEYDOWNLOADSIZE).value(bookdownloadsize);
                jSONStringer.key("size").value(booksize);
                jSONStringer.key("progress").value(progress);
                jSONStringer.key("updatetime").value(book_updatetime);
                jSONStringer.key(AppEnvironment.ISNEW).value(book_isnew);
                jSONStringer.key("total").value(book_total);
                jSONStringer.endObject();
            }
            jSONStringer.endArray();
            jSONStringer.endObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jSONStringer.toString();
    }

    public static ArrayList<OldBooks> booksparserJson(ArrayList<OldBooks> arrayList) {
        arrayList.clear();
        File file = new File(com.edutech.daoxueben.sysconfig.AppEnvironment.JSON_BOOKS_File);
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            String fileString = getFileString(com.edutech.daoxueben.sysconfig.AppEnvironment.JSON_BOOKS_File);
            if (!"".equals(fileString)) {
                try {
                    JSONArray jSONArray = ((JSONObject) new JSONTokener(fileString).nextValue()).getJSONArray("data");
                    for (int i = 0; i < jSONArray.length(); i++) {
                        JSONObject jSONObject = jSONArray.getJSONObject(i);
                        OldBooks oldBooks = new OldBooks();
                        String propertyName = getPropertyName(jSONObject, "id");
                        String propertyName2 = getPropertyName(jSONObject, "name");
                        long longValue = getLongPropertyName(jSONObject, KeyEnvironment.KEYDOWNLOADSIZE).longValue();
                        long longValue2 = getLongPropertyName(jSONObject, "size").longValue();
                        String propertyName3 = getPropertyName(jSONObject, "path");
                        String propertyName4 = getPropertyName(jSONObject, "progress");
                        String propertyName5 = getPropertyName(jSONObject, "updatetime");
                        int intPropertyName = getIntPropertyName(jSONObject, AppEnvironment.ISNEW);
                        int intPropertyName2 = getIntPropertyName(jSONObject, "total");
                        oldBooks.setbook_id(propertyName);
                        oldBooks.setbook_name(propertyName2);
                        oldBooks.setBookdownloadsize(longValue);
                        oldBooks.setBooksize(longValue2);
                        oldBooks.setbook_path(propertyName3);
                        oldBooks.setProgress(propertyName4);
                        oldBooks.setBook_updatetime(propertyName5);
                        oldBooks.setBook_isnew(intPropertyName);
                        oldBooks.setBook_total(intPropertyName2);
                        arrayList.add(oldBooks);
                    }
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
        }
        return arrayList;
    }

    public static void createExamsInfo(int i, String str, String str2, ArrayList<ExamsInfo> arrayList, String str3) {
        if (arrayList.size() <= 0 || "".equals(str) || "".equals(str2)) {
            return;
        }
        JSONStringer jSONStringer = new JSONStringer();
        try {
            jSONStringer.object();
            jSONStringer.key("studentid").value(str3);
            jSONStringer.key("exams");
            jSONStringer.array();
            Iterator<ExamsInfo> it = arrayList.iterator();
            while (it.hasNext()) {
                ExamsInfo next = it.next();
                jSONStringer.object();
                jSONStringer.key("id").value(next.getexams_id());
                jSONStringer.key("questionid").value(next.getquestion_id());
                jSONStringer.key("body").value(next.getexams_body());
                jSONStringer.key("type").value(next.getexams_type());
                jSONStringer.key("answer").value(next.getexams_answer());
                jSONStringer.key(Form.TYPE_RESULT).value(next.getexams_result());
                jSONStringer.key("studentresult").value(next.getexams_studentresult());
                setJsonArray(jSONStringer, next.getexams_webpath(), KeyEnvironment.KEYWEBPATH);
                setJsonArray(jSONStringer, next.getexams_path(), "path");
                setLongJsonArray(jSONStringer, next.getDownloadsize(), KeyEnvironment.KEYDOWNLOADSIZE);
                setLongJsonArray(jSONStringer, next.getSize(), "sizes");
                setJsonArray(jSONStringer, next.getexams_progress(), "progress");
                jSONStringer.key("size").value(next.getexams_totalsize());
                jSONStringer.key("updatetime").value(next.getExams_updatetime());
                jSONStringer.endObject();
            }
            jSONStringer.endArray();
            jSONStringer.endObject();
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        String jSONStringer2 = jSONStringer.toString();
        String str4 = String.valueOf(com.edutech.daoxueben.sysconfig.AppEnvironment.OFFLINE_DOWNLOAD) + str + "/" + str2 + "/" + str3 + "/";
        String str5 = String.valueOf(com.edutech.daoxueben.sysconfig.AppEnvironment.OFFLINE_DOWNLOAD) + str + "/" + str2 + "/" + str3 + "/" + str2 + ".json";
        File file = new File(str5);
        if (i == 0) {
            if (FileInOutHelper.fileIsExists(str4)) {
                return;
            }
            FileInOutHelper.createNewFile(file);
            CreateFile(jSONStringer2, str5);
        } else if (i != 1) {
        } else {
            if (file.exists()) {
                file.delete();
            }
            FileInOutHelper.createNewFile(file);
            CreateFile(jSONStringer2, str5);
        }
    }

    public static boolean getBooleanPropertyName(JSONObject jSONObject, String str) {
        boolean z;
        if (!jSONObject.isNull(str)) {
            try {
                z = jSONObject.getBoolean(str);
            } catch (JSONException e) {
                e.printStackTrace();
                z = false;
            }
        } else {
            z = false;
        }
        return z;
    }

    public static String getFileString(String str) {
        String str2;
        synchronized (JsonHelper.class) {
            try {
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
            } finally {
            }
        }
        return str2;
    }

    public static int getIntPropertyName(JSONObject jSONObject, String str) {
        int i;
        if (!jSONObject.isNull(str)) {
            try {
                i = jSONObject.getInt(str);
            } catch (JSONException e) {
                e.printStackTrace();
                i = 0;
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
        }
        return arrayList;
    }

    public static ArrayList<Long> getLongJsonArray(int i, String str) {
        ArrayList<Long> arrayList = new ArrayList<>();
        if (!"".equals(str)) {
            try {
                JSONArray jSONArray = new JSONArray(str);
                for (int i2 = 0; i2 < jSONArray.length(); i2++) {
                    arrayList.add(Long.valueOf(jSONArray.getLong(i2)));
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        } else if (i > 0) {
            for (int i3 = 0; i3 < i; i3++) {
                arrayList.add(0L);
            }
        }
        return arrayList;
    }

    private static Long getLongPropertyName(JSONObject jSONObject, String str) {
        long j;
        if (!jSONObject.isNull(str)) {
            try {
                j = jSONObject.getLong(str);
            } catch (JSONException e) {
                e.printStackTrace();
                j = 0;
            }
        } else {
            j = 0;
        }
        return Long.valueOf(j);
    }

    public static ArrayList<BookInfo> getNeedDownloadList(ArrayList<BookInfo> arrayList, String str, String str2) {
        String str3;
        String str4;
        ArrayList arrayList2 = new ArrayList();
        parsedownloadjson(str, arrayList2, new ArrayList());
        int size = arrayList2.size();
        for (int i = 0; i < size; i++) {
            int size2 = ((ArrayList) arrayList2.get(i)).size();
            String str5 = "";
            String str6 = "";
            String str7 = "";
            int i2 = 0;
            while (i2 < size2) {
                if (i2 == 0) {
                    str3 = (String) ((ArrayList) arrayList2.get(i)).get(i2);
                    str4 = str6;
                } else if (i2 == 1) {
                    str4 = (String) ((ArrayList) arrayList2.get(i)).get(i2);
                    str3 = str5;
                } else {
                    str3 = str5;
                    str4 = str6;
                    if (i2 == 2) {
                        str7 = (String) ((ArrayList) arrayList2.get(i)).get(i2);
                        str3 = str5;
                        str4 = str6;
                    }
                }
                i2++;
                str5 = str3;
                str6 = str4;
            }
            if ("".equals(str5) || "-2".equals(str5)) {
                break;
            }
            if ("".equals(str6)) {
                Iterator<BookInfo> it = arrayList.iterator();
                while (it.hasNext()) {
                    BookInfo next = it.next();
                    if (str5.equals(next.getBook_id())) {
                        next.setIsdown(true);
                        createExamsInfo(1, next.getBook_id(), next.getSection_dxid(), next.getExams(), str2);
                    }
                }
            } else if ("".equals(str7)) {
                Iterator<BookInfo> it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    BookInfo next2 = it2.next();
                    if (str5.equals(next2.getBook_id()) && str6.equals(next2.getChapter_id())) {
                        next2.setIsdown(true);
                        createExamsInfo(1, next2.getBook_id(), next2.getSection_dxid(), next2.getExams(), str2);
                    }
                }
            } else {
                Iterator<BookInfo> it3 = arrayList.iterator();
                while (it3.hasNext()) {
                    BookInfo next3 = it3.next();
                    if (str5.equals(next3.getBook_id()) && str6.equals(next3.getChapter_id()) && str7.equals(next3.getSection_id())) {
                        next3.setIsdown(true);
                        createExamsInfo(1, next3.getBook_id(), next3.getSection_dxid(), next3.getExams(), str2);
                    }
                }
            }
        }
        return arrayList;
    }

    public static OldBooks getNewBooInfo(String str, String str2, String str3) {
        OldBooks oldBooks = new OldBooks();
        oldBooks.setbook_id(str);
        oldBooks.setbook_id(str2);
        oldBooks.setbook_id(str3);
        return oldBooks;
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

    public static boolean isJsonArray(String str) {
        boolean z = false;
        if (str != null) {
            if ("".equals(str)) {
                z = false;
            } else {
                z = false;
                if (str.indexOf("{") != -1) {
                    z = true;
                }
            }
        }
        return z;
    }

    public static ArrayList<ExamsInfo> parseExamsInfo(String str, String str2, ArrayList<ExamsInfo> arrayList, String str3) {
        try {
            JSONArray jSONArray = new JSONArray(str3);
            for (int i = 0; i < jSONArray.length(); i++) {
                JSONObject jSONObject = jSONArray.getJSONObject(i);
                String propertyName = getPropertyName(jSONObject, "id");
                String propertyName2 = getPropertyName(jSONObject, "questionid");
                String propertyName3 = getPropertyName(jSONObject, "body");
                String propertyName4 = getPropertyName(jSONObject, "type");
                int intPropertyName = getIntPropertyName(jSONObject, "answer");
                String propertyName5 = getPropertyName(jSONObject, Form.TYPE_RESULT);
                String propertyName6 = getPropertyName(jSONObject, "studentresult");
                String propertyName7 = getPropertyName(jSONObject, KeyEnvironment.KEYWEBPATH);
                String propertyName8 = getPropertyName(jSONObject, "path");
                String propertyName9 = getPropertyName(jSONObject, KeyEnvironment.KEYDOWNLOADSIZE);
                long longValue = getLongPropertyName(jSONObject, "size").longValue();
                String propertyName10 = getPropertyName(jSONObject, "sizes");
                String propertyName11 = getPropertyName(jSONObject, "progress");
                String propertyName12 = getPropertyName(jSONObject, "updatetime");
                ExamsInfo examsInfo = new ExamsInfo();
                examsInfo.setexams_id(propertyName);
                examsInfo.setquestion_id(propertyName2);
                examsInfo.setexams_body(propertyName3);
                examsInfo.setexams_type(propertyName4);
                examsInfo.setexams_answer(intPropertyName);
                examsInfo.setexams_result(propertyName5);
                examsInfo.setexams_totalsize(longValue);
                examsInfo.setexams_studentresult(propertyName6);
                examsInfo.setexams_webpath(getJsonArray(propertyName7));
                examsInfo.setexams_path(getJsonArray(propertyName8));
                examsInfo.setExams_updatetime(propertyName12);
                int size = examsInfo.getexams_webpath().size();
                examsInfo.setDownloadsize(getLongJsonArray(size, propertyName9));
                examsInfo.setSize(getLongJsonArray(size, propertyName10));
                if (!"".equals(propertyName11)) {
                    examsInfo.setexams_progress(getJsonArray(propertyName11));
                } else if (examsInfo.getexams_webpath().size() > 0) {
                    ArrayList<String> arrayList2 = new ArrayList<>();
                    for (int i2 = 0; i2 < size; i2++) {
                        arrayList2.add("0");
                    }
                    examsInfo.setexams_progress(arrayList2);
                }
                arrayList.add(examsInfo);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        return arrayList;
    }

    public static int parseHttpPostReturnJson(String str) {
        int i;
        if ("".equals(str)) {
            i = 0;
        } else {
            try {
                JSONObject jSONObject = (JSONObject) new JSONTokener(str).nextValue();
                boolean booleanPropertyName = getBooleanPropertyName(jSONObject, "status");
                int intPropertyName = getIntPropertyName(jSONObject, "errorNum");
                String propertyName = getPropertyName(jSONObject, "errorInfo");
                i = 0;
                if (booleanPropertyName) {
                    i = 0;
                    if (intPropertyName == 0) {
                        i = 0;
                        if ("".equals(propertyName)) {
                            i = 1;
                        }
                    }
                }
            } catch (JSONException e) {
                e.printStackTrace();
                i = 0;
            } catch (Exception e2) {
                e2.printStackTrace();
                i = 0;
            }
        }
        return i;
    }

    public static void parsedownloadjson(String str, ArrayList<ArrayList<String>> arrayList, ArrayList<String> arrayList2) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            String propertyName = getPropertyName(jSONObject, "id");
            if ("".equals(getPropertyName(jSONObject, "items"))) {
                arrayList2.add(propertyName);
                ArrayList<String> arrayList3 = new ArrayList<>();
                Iterator<String> it = arrayList2.iterator();
                while (it.hasNext()) {
                    arrayList3.add(it.next());
                }
                arrayList.add(arrayList3);
                if (arrayList2.size() - 1 < 0) {
                    return;
                }
                arrayList2.remove(arrayList2.size() - 1);
                return;
            }
            JSONArray jSONArray = jSONObject.getJSONArray("items");
            if (jSONArray.length() == 0) {
                arrayList2.add(propertyName);
                ArrayList<String> arrayList4 = new ArrayList<>();
                Iterator<String> it2 = arrayList2.iterator();
                while (it2.hasNext()) {
                    arrayList4.add(it2.next());
                }
                arrayList.add(arrayList4);
                if (arrayList2.size() - 1 >= 0) {
                    arrayList2.remove(arrayList2.size() - 1);
                }
            } else {
                arrayList2.add(propertyName);
            }
            for (int i = 0; i < jSONArray.length(); i++) {
                parsedownloadjson(jSONArray.getJSONObject(i).toString(), arrayList, arrayList2);
                if (i + 1 == jSONArray.length()) {
                    arrayList2.remove(arrayList2.size() - 1);
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

    public static String peerbookcreateJson(ArrayList<BookInfo> arrayList) {
        String jSONStringer;
        if (arrayList.size() == 0) {
            jSONStringer = "";
        } else {
            String book_id = arrayList.get(0).getBook_id();
            String book_name = arrayList.get(0).getBook_name();
            long bookdownloadsize = arrayList.get(0).getBookdownloadsize();
            long booksize = arrayList.get(0).getBooksize();
            String book_updatetime = arrayList.get(0).getBook_updatetime();
            JSONStringer jSONStringer2 = new JSONStringer();
            try {
                jSONStringer2.object();
                jSONStringer2.key("id").value(book_id);
                jSONStringer2.key("name").value(book_name);
                jSONStringer2.key(KeyEnvironment.KEYDOWNLOADSIZE).value(bookdownloadsize);
                jSONStringer2.key("size").value(booksize);
                jSONStringer2.key("updatetime").value(book_updatetime);
                jSONStringer2.key("data");
                jSONStringer2.array();
                int i = 0;
                while (i < arrayList.size()) {
                    BookInfo bookInfo = arrayList.get(i);
                    jSONStringer2.object();
                    String chapter_id = bookInfo.getChapter_id();
                    String str = bookInfo.getchapter_name();
                    jSONStringer2.key("id").value(chapter_id);
                    jSONStringer2.key("name").value(str);
                    if (!bookInfo.isParent()) {
                        i++;
                        jSONStringer2.key("children");
                        jSONStringer2.array();
                        jSONStringer2.endArray();
                    } else {
                        jSONStringer2.key("children");
                        jSONStringer2.array();
                        jSONStringer2.object();
                        jSONStringer2.key("id").value(bookInfo.getSection_id());
                        jSONStringer2.key("dxid").value(bookInfo.getSection_dxid());
                        jSONStringer2.key("name").value(bookInfo.getsection_name());
                        jSONStringer2.key("examsprogress").value(bookInfo.getexams_progress());
                        jSONStringer2.key("exams");
                        jSONStringer2.array();
                        if (bookInfo.getExams().size() == 0) {
                            jSONStringer2.endArray();
                        } else {
                            Iterator<ExamsInfo> it = bookInfo.getExams().iterator();
                            while (it.hasNext()) {
                                ExamsInfo next = it.next();
                                jSONStringer2.object();
                                jSONStringer2.key("id").value(next.getexams_id());
                                jSONStringer2.key("questionid").value(next.getquestion_id());
                                jSONStringer2.key("body").value(next.getexams_body());
                                jSONStringer2.key("type").value(next.getexams_type());
                                jSONStringer2.key("answer").value(next.getexams_answer());
                                jSONStringer2.key(Form.TYPE_RESULT).value(next.getexams_result());
                                jSONStringer2.key("studentresult").value(next.getexams_studentresult());
                                setJsonArray(jSONStringer2, next.getexams_webpath(), KeyEnvironment.KEYWEBPATH);
                                setJsonArray(jSONStringer2, next.getexams_path(), "path");
                                setLongJsonArray(jSONStringer2, next.getDownloadsize(), KeyEnvironment.KEYDOWNLOADSIZE);
                                setLongJsonArray(jSONStringer2, next.getSize(), "sizes");
                                setJsonArray(jSONStringer2, next.getexams_progress(), "progress");
                                jSONStringer2.key("size").value(next.getexams_totalsize());
                                jSONStringer2.key("updatetime").value(next.getExams_updatetime());
                                jSONStringer2.endObject();
                            }
                            jSONStringer2.endArray();
                        }
                        setJsonArray(jSONStringer2, bookInfo.getSection_webpath(), KeyEnvironment.KEYWEBPATH);
                        setJsonArray(jSONStringer2, bookInfo.getSection_path(), "path");
                        jSONStringer2.key("tag").value(bookInfo.getsection_tag());
                        jSONStringer2.key("updatetime").value(bookInfo.getsection_updatetime());
                        setJsonArray(jSONStringer2, bookInfo.getSection_progress(), "progress");
                        setLongJsonArray(jSONStringer2, bookInfo.getDownloadsize(), KeyEnvironment.KEYDOWNLOADSIZE);
                        setLongJsonArray(jSONStringer2, bookInfo.getSize(), "size");
                        jSONStringer2.key("isdown").value(arrayList.get(i).isIsdown());
                        jSONStringer2.key(AppEnvironment.ISNEW).value(arrayList.get(i).isIsnew());
                        jSONStringer2.endObject();
                        while (true) {
                            i++;
                            if (i >= arrayList.size() || !str.equals(arrayList.get(i).getchapter_name())) {
                                break;
                            }
                            jSONStringer2.object();
                            jSONStringer2.key("id").value(arrayList.get(i).getSection_id());
                            jSONStringer2.key("dxid").value(arrayList.get(i).getSection_dxid());
                            jSONStringer2.key("name").value(arrayList.get(i).getsection_name());
                            jSONStringer2.key("examsprogress").value(arrayList.get(i).getexams_progress());
                            jSONStringer2.key("exams");
                            jSONStringer2.array();
                            if (arrayList.get(i).getExams().size() == 0) {
                                jSONStringer2.endArray();
                            } else {
                                Iterator<ExamsInfo> it2 = arrayList.get(i).getExams().iterator();
                                while (it2.hasNext()) {
                                    ExamsInfo next2 = it2.next();
                                    jSONStringer2.object();
                                    jSONStringer2.key("id").value(next2.getexams_id());
                                    jSONStringer2.key("questionid").value(next2.getquestion_id());
                                    jSONStringer2.key("body").value(next2.getexams_body());
                                    jSONStringer2.key("type").value(next2.getexams_type());
                                    jSONStringer2.key("answer").value(next2.getexams_answer());
                                    jSONStringer2.key(Form.TYPE_RESULT).value(next2.getexams_result());
                                    jSONStringer2.key("studentresult").value(next2.getexams_studentresult());
                                    setJsonArray(jSONStringer2, next2.getexams_webpath(), KeyEnvironment.KEYWEBPATH);
                                    setJsonArray(jSONStringer2, next2.getexams_path(), "path");
                                    setLongJsonArray(jSONStringer2, next2.getDownloadsize(), KeyEnvironment.KEYDOWNLOADSIZE);
                                    setLongJsonArray(jSONStringer2, next2.getSize(), "sizes");
                                    setJsonArray(jSONStringer2, next2.getexams_progress(), "progress");
                                    jSONStringer2.key("size").value(next2.getexams_totalsize());
                                    jSONStringer2.key("updatetime").value(next2.getExams_updatetime());
                                    jSONStringer2.endObject();
                                }
                                jSONStringer2.endArray();
                            }
                            setJsonArray(jSONStringer2, arrayList.get(i).getSection_webpath(), KeyEnvironment.KEYWEBPATH);
                            setJsonArray(jSONStringer2, arrayList.get(i).getSection_path(), "path");
                            jSONStringer2.key("tag").value(arrayList.get(i).getsection_tag());
                            jSONStringer2.key("updatetime").value(arrayList.get(i).getsection_updatetime());
                            setJsonArray(jSONStringer2, arrayList.get(i).getSection_progress(), "progress");
                            setLongJsonArray(jSONStringer2, arrayList.get(i).getDownloadsize(), KeyEnvironment.KEYDOWNLOADSIZE);
                            setLongJsonArray(jSONStringer2, arrayList.get(i).getSize(), "size");
                            jSONStringer2.key("isdown").value(arrayList.get(i).isIsdown());
                            jSONStringer2.key(AppEnvironment.ISNEW).value(arrayList.get(i).isIsnew());
                            jSONStringer2.endObject();
                        }
                        jSONStringer2.endArray();
                    }
                    jSONStringer2.endObject();
                }
                jSONStringer2.endArray();
                jSONStringer2.endObject();
            } catch (Exception e) {
                e.printStackTrace();
            }
            jSONStringer = jSONStringer2.toString();
        }
        return jSONStringer;
    }

    public static ArrayList<BookInfo> peerbookparserJson(ArrayList<BookInfo> arrayList, String str) {
        int i;
        int i2;
        int i3 = 0;
        int i4 = 0;
        arrayList.clear();
        if (!"".equals(str)) {
            try {
                JSONObject jSONObject = (JSONObject) new JSONTokener(str).nextValue();
                String propertyName = getPropertyName(jSONObject, "id");
                String propertyName2 = getPropertyName(jSONObject, "name");
                long longValue = getLongPropertyName(jSONObject, KeyEnvironment.KEYDOWNLOADSIZE).longValue();
                long longValue2 = getLongPropertyName(jSONObject, "size").longValue();
                String propertyName3 = getPropertyName(jSONObject, "updatetime");
                JSONArray jSONArray = jSONObject.getJSONArray("data");
                int i5 = 0;
                while (true) {
                    if (i5 >= jSONArray.length()) {
                        break;
                    }
                    JSONObject jSONObject2 = (JSONObject) new JSONTokener(jSONArray.getJSONObject(i5).toString()).nextValue();
                    String propertyName4 = getPropertyName(jSONObject2, "id");
                    String propertyName5 = getPropertyName(jSONObject2, "name");
                    String propertyName6 = getPropertyName(jSONObject2, "children");
                    if ("".equals(propertyName6)) {
                        BookInfo bookInfo = new BookInfo();
                        bookInfo.setBook_id(propertyName);
                        bookInfo.setBook_name(propertyName2);
                        bookInfo.setBookdownloadsize(longValue);
                        bookInfo.setBooksize(longValue2);
                        bookInfo.setBook_updatetime(propertyName3);
                        bookInfo.setChapter_id(propertyName4);
                        bookInfo.setchapter_name(propertyName5);
                        bookInfo.setParent(false);
                        arrayList.add(bookInfo);
                        i2 = i4;
                        i = i3;
                    } else {
                        JSONArray jSONArray2 = new JSONArray(propertyName6);
                        if (jSONArray2.length() == 0) {
                            BookInfo bookInfo2 = new BookInfo();
                            bookInfo2.setBook_id(propertyName);
                            bookInfo2.setBook_name(propertyName2);
                            bookInfo2.setBookdownloadsize(longValue);
                            bookInfo2.setBooksize(longValue2);
                            bookInfo2.setBook_updatetime(propertyName3);
                            bookInfo2.setChapter_id(propertyName4);
                            bookInfo2.setchapter_name(propertyName5);
                            bookInfo2.setParent(false);
                            arrayList.add(bookInfo2);
                            i = i3;
                            i2 = i4;
                        } else {
                            int i6 = 0;
                            while (true) {
                                i = i3;
                                i2 = i4;
                                if (i6 < jSONArray2.length()) {
                                    JSONObject jSONObject3 = (JSONObject) new JSONTokener(jSONArray2.getJSONObject(i6).toString()).nextValue();
                                    String propertyName7 = getPropertyName(jSONObject3, "id");
                                    String propertyName8 = getPropertyName(jSONObject3, "dxid");
                                    String propertyName9 = getPropertyName(jSONObject3, "name");
                                    String propertyName10 = getPropertyName(jSONObject3, KeyEnvironment.KEYWEBPATH);
                                    String propertyName11 = getPropertyName(jSONObject3, "path");
                                    String propertyName12 = getPropertyName(jSONObject3, "exams");
                                    String propertyName13 = getPropertyName(jSONObject3, "examsprogress");
                                    ArrayList<ExamsInfo> parseExamsInfo = parseExamsInfo(propertyName, propertyName8, new ArrayList(), propertyName12);
                                    long j = 0;
                                    Iterator<ExamsInfo> it = parseExamsInfo.iterator();
                                    while (it.hasNext()) {
                                        j += it.next().getexams_totalsize();
                                    }
                                    String propertyName14 = getPropertyName(jSONObject3, "tag");
                                    String propertyName15 = getPropertyName(jSONObject3, "updatetime");
                                    String propertyName16 = getPropertyName(jSONObject3, "progress");
                                    String propertyName17 = getPropertyName(jSONObject3, KeyEnvironment.KEYDOWNLOADSIZE);
                                    String propertyName18 = getPropertyName(jSONObject3, "size");
                                    boolean booleanPropertyName = getBooleanPropertyName(jSONObject3, "isdown");
                                    boolean booleanPropertyName2 = getBooleanPropertyName(jSONObject3, AppEnvironment.ISNEW);
                                    BookInfo bookInfo3 = new BookInfo();
                                    bookInfo3.setBook_id(propertyName);
                                    bookInfo3.setBook_name(propertyName2);
                                    bookInfo3.setBookdownloadsize(longValue);
                                    bookInfo3.setBooksize(longValue2);
                                    bookInfo3.setBook_updatetime(propertyName3);
                                    bookInfo3.setChapter_id(propertyName4);
                                    bookInfo3.setchapter_name(propertyName5);
                                    bookInfo3.setSection_id(propertyName7);
                                    bookInfo3.setSection_dxid(propertyName8);
                                    bookInfo3.setsection_name(propertyName9);
                                    bookInfo3.setExams(parseExamsInfo);
                                    bookInfo3.setSection_webpath(getJsonArray(propertyName10));
                                    bookInfo3.setSection_path(getJsonArray(propertyName11));
                                    int size = bookInfo3.getSection_webpath().size();
                                    bookInfo3.setDownloadsize(getLongJsonArray(size, propertyName17));
                                    bookInfo3.setSize(getLongJsonArray(size, propertyName18));
                                    bookInfo3.setsection_tag(propertyName14);
                                    bookInfo3.setsection_updatetime(propertyName15);
                                    bookInfo3.setIsdown(booleanPropertyName);
                                    bookInfo3.setIsnew(booleanPropertyName2);
                                    if ("".equals(propertyName13)) {
                                        if (j == 0) {
                                            bookInfo3.setexams_progress("100");
                                        } else {
                                            bookInfo3.setexams_progress("0");
                                        }
                                    } else if (j == 0) {
                                        bookInfo3.setexams_progress("100");
                                    } else {
                                        bookInfo3.setexams_progress(propertyName13);
                                    }
                                    if (!"".equals(propertyName16)) {
                                        bookInfo3.setSection_progress(getJsonArray(propertyName16));
                                    } else if (bookInfo3.getSection_webpath().size() > 0) {
                                        ArrayList<String> arrayList2 = new ArrayList<>();
                                        for (int i7 = 0; i7 < size; i7++) {
                                            arrayList2.add("0");
                                        }
                                        bookInfo3.setSection_progress(arrayList2);
                                    }
                                    bookInfo3.setParent(true);
                                    i3 = bookInfo3.getSection_webpath().size() + i3 + bookInfo3.getExams().size();
                                    int i8 = i4;
                                    if (bookInfo3.isIsnew()) {
                                        i8 = i4 + 1;
                                    }
                                    arrayList.add(bookInfo3);
                                    i6++;
                                    i4 = i8;
                                }
                            }
                        }
                    }
                    i5++;
                    i3 = i;
                    i4 = i2;
                }
                "".equals(propertyName);
                if (!"".equals(propertyName) && arrayList.size() > 0) {
                    ArrayList arrayList3 = new ArrayList();
                    OldBooks oldBooks = new OldBooks();
                    oldBooks.setbook_id(propertyName);
                    oldBooks.setbook_name(propertyName2);
                    oldBooks.setBookdownloadsize(longValue);
                    oldBooks.setBooksize(0L);
                    oldBooks.setBook_total(i3);
                    oldBooks.setProgress("100");
                    oldBooks.setbook_path("../offlinedownload/" + propertyName + "/");
                    oldBooks.setBook_updatetime(propertyName3);
                    oldBooks.setBook_isnew(0);
                    ArrayList<OldBooks> booksparserJson = booksparserJson(arrayList3);
                    boolean z = true;
                    Iterator<OldBooks> it2 = booksparserJson.iterator();
                    while (it2.hasNext()) {
                        OldBooks next = it2.next();
                        if (oldBooks.getbook_id().equals(next.getbook_id())) {
                            z = false;
                            next.setbook_id(oldBooks.getbook_id());
                            next.setbook_name(oldBooks.getbook_name());
                            next.setbook_path(oldBooks.getbook_path());
                            next.setBook_updatetime(oldBooks.getBook_updatetime());
                            next.setBook_total(oldBooks.getBook_total());
                            if (i4 == 0) {
                                next.setBook_isnew(oldBooks.getBook_isnew());
                            } else {
                                next.setBook_isnew(1);
                            }
                        }
                    }
                    if (z) {
                        booksparserJson.add(oldBooks);
                        if (CreateFile(bookscreateJson(booksparserJson), com.edutech.daoxueben.sysconfig.AppEnvironment.JSON_BOOKS_File) && !"".equals(propertyName)) {
                            File file = new File(String.valueOf(com.edutech.daoxueben.sysconfig.AppEnvironment.OFFLINE_DOWNLOAD) + propertyName);
                            if (!file.exists()) {
                                file.mkdirs();
                            }
                        }
                    } else if (CreateFile(bookscreateJson(booksparserJson), com.edutech.daoxueben.sysconfig.AppEnvironment.JSON_BOOKS_File)) {
                        "".equals(propertyName);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                arrayList.clear();
            }
        }
        return arrayList;
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

    public static void setLongJsonArray(JSONStringer jSONStringer, ArrayList<Long> arrayList, String str) {
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
        }
    }
}
