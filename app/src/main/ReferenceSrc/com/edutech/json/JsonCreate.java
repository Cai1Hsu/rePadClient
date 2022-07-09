package com.edutech.json;

import com.edutech.idauthentication.AppEnvironment;
import com.edutech.idauthentication.JsonHelper;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;

/* loaded from: classes.jar:com/edutech/json/JsonCreate.class */
public class JsonCreate {
    public static Object MaptoJSONObject(HashMap<String, Object> hashMap) {
        JSONObject jSONObject;
        try {
            jSONObject = new JSONObject(hashMap);
        } catch (Exception e) {
            e.printStackTrace();
            jSONObject = null;
        }
        return jSONObject;
    }

    public static String createBooksJson(ArrayList<Books> arrayList) {
        JSONStringer jSONStringer = new JSONStringer();
        try {
            jSONStringer.object();
            jSONStringer.key("data");
            jSONStringer.array();
            for (int i = 0; i < arrayList.size(); i++) {
                Books books = arrayList.get(i);
                jSONStringer.object();
                String str = books.getbook_id();
                String str2 = books.getbook_name();
                long bookdownloadsize = books.getBookdownloadsize();
                long booksize = books.getBooksize();
                String str3 = books.getbook_path();
                String progress = books.getProgress();
                String book_updatetime = books.getBook_updatetime();
                int book_isnew = books.getBook_isnew();
                int book_total = books.getBook_total();
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

    private static JSONStringer createchildrenjson(JSONStringer jSONStringer, Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap) {
        for (HashMap<String, Object> hashMap2 : tree.getSuccessors(hashMap)) {
            try {
                jSONStringer.object();
                ArrayList arrayList = new ArrayList(hashMap2.keySet());
                Collections.sort(arrayList);
                boolean z = false;
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    String str = (String) it.next();
                    if ("children".equals(str)) {
                        z = true;
                    } else {
                        jSONStringer.key(str).value(hashMap2.get(str));
                    }
                }
                if (z) {
                    if (tree.getSuccessors(hashMap2).size() == 0) {
                        jSONStringer.key("children").value(hashMap2.get("children"));
                    } else {
                        jSONStringer.key("children");
                        jSONStringer.array();
                        createchildrenjson(jSONStringer, tree, hashMap2);
                        jSONStringer.endArray();
                    }
                }
                jSONStringer.endObject();
            } catch (JSONException e) {
                e.printStackTrace();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return jSONStringer;
    }

    public static String createjson(Tree<HashMap<String, Object>> tree) {
        HashMap<String, Object> head = tree.getHead();
        JSONStringer jSONStringer = new JSONStringer();
        if (head != null) {
            jSONStringer = new JSONStringer();
            try {
                jSONStringer.object();
                ArrayList arrayList = new ArrayList(head.keySet());
                Collections.sort(arrayList);
                boolean z = false;
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    String str = (String) it.next();
                    if ("data".equals(str)) {
                        z = true;
                    } else {
                        jSONStringer.key(str).value(head.get(str));
                    }
                }
                if (z) {
                    jSONStringer.key("data");
                    jSONStringer.array();
                    createchildrenjson(jSONStringer, tree, head);
                    jSONStringer.endArray();
                }
                jSONStringer.endObject();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return jSONStringer.toString();
    }

    public static boolean saveJsonToLocal(String str, String str2) {
        boolean z;
        File file = new File(str2);
        if (file.exists()) {
            String str3 = String.valueOf(file.getParent()) + "/newJson.Json";
            File file2 = new File(str3);
            if (JsonHelper.CreateFile(str, str3)) {
                z = true;
                if (file2.exists()) {
                    file.delete();
                    file2.renameTo(file);
                    z = true;
                }
            } else {
                z = false;
            }
        } else {
            z = true;
            if (!JsonHelper.CreateFile(str, str2)) {
                z = false;
            }
        }
        return z;
    }

    public static Object toJSONArrayObject(ArrayList<Object> arrayList) {
        JSONArray jSONArray;
        Object obj = new Object();
        JSONArray jSONArray2 = new JSONArray();
        try {
            Iterator<Object> it = arrayList.iterator();
            while (it.hasNext()) {
                jSONArray2.put(it.next());
            }
            jSONArray = jSONArray2;
        } catch (Exception e) {
            e.printStackTrace();
            jSONArray = obj;
        }
        return jSONArray;
    }
}
