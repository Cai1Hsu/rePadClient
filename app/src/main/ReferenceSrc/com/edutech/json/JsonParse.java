package com.edutech.json;

import com.edutech.idauthentication.AppEnvironment;
import com.edutech.idauthentication.JsonHelper;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* loaded from: classes.dex */
public class JsonParse {
    public static Tree<HashMap<String, Object>> parsejson(Tree<HashMap<String, Object>> tree, String json, String arraykey, String arraykey1) {
        CommonJSONParser common;
        HashMap<String, Object> book;
        if (arraykey != null && ((arraykey == null || !"".equals(arraykey)) && arraykey1 != null && ((arraykey1 == null || !"".equals(arraykey1)) && json != null && ((json == null || !"".equals(json)) && (book = (common = new CommonJSONParser()).parse(json)) != null)))) {
            tree = new Tree<>(book);
            if (book.get(arraykey) != null) {
                try {
                    ArrayList<Object> datalist = common.parseJSONArray((JSONArray) book.get(arraykey));
                    if (datalist != null) {
                        ArrayList<HashMap<String, Object>> parentlist = new ArrayList<>();
                        parentlist.add(book);
                        int i = 0;
                        Iterator<Object> it = datalist.iterator();
                        while (it.hasNext()) {
                            Object children = it.next();
                            i++;
                            childrenlist(tree, parentlist, common, children, arraykey1);
                        }
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }
        return tree;
    }

    public static void childrenlist(Tree<HashMap<String, Object>> tree, ArrayList<HashMap<String, Object>> parentlist, CommonJSONParser common, Object children, String arraykey1) {
        try {
            HashMap<String, Object> childrenhash = common.parseJSONObject((JSONObject) children);
            if (parentlist.size() > 0) {
                tree.addLeaf(parentlist.get(parentlist.size() - 1), childrenhash);
            }
            if (childrenhash.get(arraykey1) != null) {
                parentlist.add(childrenhash);
                ArrayList<Object> childrenlist1 = (ArrayList) common.parseValue(childrenhash.get(arraykey1));
                Iterator<Object> it = childrenlist1.iterator();
                while (it.hasNext()) {
                    Object children1 = it.next();
                    childrenlist(tree, parentlist, common, children1, arraykey1);
                }
                if (parentlist.size() > 0) {
                    parentlist.remove(parentlist.size() - 1);
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    private static void newchildrenlist(Tree<HashMap<String, Object>> tree, ArrayList<HashMap<String, Object>> parentlist, CommonJSONParser common, Object children, String arraykey1) {
        try {
            HashMap<String, Object> childrenhash = common.parseJSONObject((JSONObject) children);
            if (parentlist.size() > 0) {
                tree.addLeaf(parentlist.get(parentlist.size() - 1), childrenhash);
            }
            if (childrenhash.get(arraykey1) != null) {
                parentlist.add(childrenhash);
                ArrayList<Object> childrenlist1 = (ArrayList) common.parseValue(childrenhash.get(arraykey1));
                Iterator<Object> it = childrenlist1.iterator();
                while (it.hasNext()) {
                    Object children1 = it.next();
                    childrenlist(tree, parentlist, common, children1, arraykey1);
                }
                if (parentlist.size() > 0) {
                    parentlist.remove(parentlist.size() - 1);
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

    public static HashMap<String, Object> geteObjectToMap(Object object) {
        CommonJSONParser common = new CommonJSONParser();
        HashMap<String, Object> tempMap = null;
        if (object == null) {
            return null;
        }
        try {
            tempMap = common.parseJSONObject((JSONObject) object);
        } catch (JSONException e1) {
            e1.printStackTrace();
        } catch (Exception e12) {
            e12.printStackTrace();
        }
        return tempMap;
    }

    public static boolean isBooleanTrue(HashMap<String, Object> dataMap, String key) {
        try {
            boolean boolIsTrue = ((Boolean) dataMap.get(key)).booleanValue();
            return boolIsTrue;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static ArrayList<Books> parseBooksJson(ArrayList<Books> books, String path) {
        books.clear();
        File bookjson = new File(path);
        if (!bookjson.exists()) {
            try {
                bookjson.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            String json = JsonHelper.getFileString(path);
            if (!"".equals(json)) {
                try {
                    JSONTokener jsonTokener = new JSONTokener(json);
                    JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
                    JSONArray array = jsonObject.getJSONArray("data");
                    for (int i = 0; i < array.length(); i++) {
                        JSONObject object = array.getJSONObject(i);
                        Books book = new Books();
                        String book_id = JsonHelper.getPropertyName(object, "id");
                        long book_downloadsize = JsonHelper.getLongPropertyName(object, KeyEnvironment.KEYDOWNLOADSIZE).longValue();
                        long book_size = JsonHelper.getLongPropertyName(object, "size").longValue();
                        String book_name = JsonHelper.getPropertyName(object, "name");
                        String book_path = JsonHelper.getPropertyName(object, "path");
                        String book_progress = JsonHelper.getPropertyName(object, "progress");
                        String book_updatetime = JsonHelper.getPropertyName(object, "updatetime");
                        int book_isnew = JsonHelper.getIntPropertyName(object, AppEnvironment.ISNEW);
                        int book_total = JsonHelper.getIntPropertyName(object, "total");
                        book.setbook_id(book_id);
                        book.setbook_name(book_name);
                        book.setBookdownloadsize(book_downloadsize);
                        book.setBooksize(book_size);
                        book.setbook_path(book_path);
                        book.setProgress(book_progress);
                        book.setBook_updatetime(book_updatetime);
                        book.setBook_isnew(book_isnew);
                        book.setBook_total(book_total);
                        books.add(book);
                    }
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
        }
        return books;
    }
}
