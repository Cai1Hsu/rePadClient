package com.edutech.json;

import com.edutech.idauthentication.AppEnvironment;
import com.edutech.idauthentication.JsonHelper;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;

/* loaded from: classes.dex */
public class JsonCreate {
    public static String createjson(Tree<HashMap<String, Object>> tree) {
        HashMap<String, Object> head = tree.getHead();
        JSONStringer jsonStringer = new JSONStringer();
        if (head != null) {
            jsonStringer = new JSONStringer();
            try {
                jsonStringer.object();
                Set<String> keyset = head.keySet();
                ArrayList<String> keylist = new ArrayList<>(keyset);
                Collections.sort(keylist);
                boolean islast = false;
                Iterator<String> it = keylist.iterator();
                while (it.hasNext()) {
                    String keyStr = it.next();
                    if ("data".equals(keyStr)) {
                        islast = true;
                    } else {
                        jsonStringer.key(keyStr).value(head.get(keyStr));
                    }
                }
                if (islast) {
                    jsonStringer.key("data");
                    jsonStringer.array();
                    createchildrenjson(jsonStringer, tree, head);
                    jsonStringer.endArray();
                }
                jsonStringer.endObject();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return jsonStringer.toString();
    }

    private static JSONStringer createchildrenjson(JSONStringer jsonStringer, Tree<HashMap<String, Object>> tree, HashMap<String, Object> head) {
        Collection<HashMap<String, Object>> Successors = tree.getSuccessors(head);
        for (HashMap<String, Object> successor : Successors) {
            try {
                jsonStringer.object();
                Set<String> keyset = successor.keySet();
                ArrayList<String> keylist = new ArrayList<>(keyset);
                Collections.sort(keylist);
                boolean islast = false;
                Iterator<String> it = keylist.iterator();
                while (it.hasNext()) {
                    String keyStr = it.next();
                    if ("children".equals(keyStr)) {
                        islast = true;
                    } else {
                        jsonStringer.key(keyStr).value(successor.get(keyStr));
                    }
                }
                if (islast) {
                    if (tree.getSuccessors(successor).size() == 0) {
                        jsonStringer.key("children").value(successor.get("children"));
                    } else {
                        jsonStringer.key("children");
                        jsonStringer.array();
                        createchildrenjson(jsonStringer, tree, successor);
                        jsonStringer.endArray();
                    }
                }
                jsonStringer.endObject();
            } catch (JSONException e) {
                e.printStackTrace();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return jsonStringer;
    }

    public static String createBooksJson(ArrayList<Books> books) {
        JSONStringer jsonStringer = new JSONStringer();
        try {
            jsonStringer.object();
            jsonStringer.key("data");
            jsonStringer.array();
            for (int i = 0; i < books.size(); i++) {
                Books book = books.get(i);
                jsonStringer.object();
                String bookid = book.getbook_id();
                String bookname = book.getbook_name();
                long bookdownloadsize = book.getBookdownloadsize();
                long booksize = book.getBooksize();
                String bookpath = book.getbook_path();
                String bookprogress = book.getProgress();
                String book_updatetime = book.getBook_updatetime();
                int book_isnew = book.getBook_isnew();
                int book_total = book.getBook_total();
                jsonStringer.key("id").value(bookid);
                jsonStringer.key("name").value(bookname);
                jsonStringer.key("path").value(bookpath);
                jsonStringer.key(KeyEnvironment.KEYDOWNLOADSIZE).value(bookdownloadsize);
                jsonStringer.key("size").value(booksize);
                jsonStringer.key("progress").value(bookprogress);
                jsonStringer.key("updatetime").value(book_updatetime);
                jsonStringer.key(AppEnvironment.ISNEW).value(book_isnew);
                jsonStringer.key("total").value(book_total);
                jsonStringer.endObject();
            }
            jsonStringer.endArray();
            jsonStringer.endObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonStringer.toString();
    }

    public static boolean saveJsonToLocal(String json, String jsonpath) {
        File jsonFile = new File(jsonpath);
        if (!jsonFile.exists()) {
            return JsonHelper.CreateFile(json, jsonpath);
        }
        String dir = jsonFile.getParent();
        String newjsonPath = String.valueOf(dir) + "/newJson.Json";
        File newJsonFile = new File(newjsonPath);
        if (!JsonHelper.CreateFile(json, newjsonPath)) {
            return false;
        }
        if (!newJsonFile.exists()) {
            return true;
        }
        jsonFile.delete();
        newJsonFile.renameTo(jsonFile);
        return true;
    }

    public static Object toJSONArrayObject(ArrayList<Object> objectList) {
        Object object = new Object();
        JSONArray jsonArray = new JSONArray();
        try {
            Iterator<Object> it = objectList.iterator();
            while (it.hasNext()) {
                Object tempObject = it.next();
                jsonArray.put(tempObject);
            }
            return jsonArray;
        } catch (Exception e) {
            e.printStackTrace();
            return object;
        }
    }

    public static Object MaptoJSONObject(HashMap<String, Object> data) {
        try {
            JSONObject jsonobject = new JSONObject(data);
            return jsonobject;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
