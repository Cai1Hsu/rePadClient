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

/* loaded from: classes.jar:com/edutech/json/JsonParse.class */
public class JsonParse {
    public static void childrenlist(Tree<HashMap<String, Object>> tree, ArrayList<HashMap<String, Object>> arrayList, CommonJSONParser commonJSONParser, Object obj, String str) {
        try {
            HashMap<String, Object> parseJSONObject = commonJSONParser.parseJSONObject((JSONObject) obj);
            if (arrayList.size() > 0) {
                tree.addLeaf(arrayList.get(arrayList.size() - 1), parseJSONObject);
            }
            if (parseJSONObject.get(str) == null) {
                return;
            }
            arrayList.add(parseJSONObject);
            Iterator it = ((ArrayList) commonJSONParser.parseValue(parseJSONObject.get(str))).iterator();
            while (it.hasNext()) {
                childrenlist(tree, arrayList, commonJSONParser, it.next(), str);
            }
            if (arrayList.size() <= 0) {
                return;
            }
            arrayList.remove(arrayList.size() - 1);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public static HashMap<String, Object> geteObjectToMap(Object obj) {
        HashMap<String, Object> hashMap;
        CommonJSONParser commonJSONParser = new CommonJSONParser();
        if (obj == null) {
            hashMap = null;
        } else {
            try {
                hashMap = commonJSONParser.parseJSONObject((JSONObject) obj);
            } catch (JSONException e) {
                e.printStackTrace();
                hashMap = null;
            } catch (Exception e2) {
                e2.printStackTrace();
                hashMap = null;
            }
        }
        return hashMap;
    }

    public static boolean isBooleanTrue(HashMap<String, Object> hashMap, String str) {
        boolean z = false;
        try {
            z = ((Boolean) hashMap.get(str)).booleanValue();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return z;
    }

    private static void newchildrenlist(Tree<HashMap<String, Object>> tree, ArrayList<HashMap<String, Object>> arrayList, CommonJSONParser commonJSONParser, Object obj, String str) {
        try {
            HashMap<String, Object> parseJSONObject = commonJSONParser.parseJSONObject((JSONObject) obj);
            if (arrayList.size() > 0) {
                tree.addLeaf(arrayList.get(arrayList.size() - 1), parseJSONObject);
            }
            if (parseJSONObject.get(str) == null) {
                return;
            }
            arrayList.add(parseJSONObject);
            Iterator it = ((ArrayList) commonJSONParser.parseValue(parseJSONObject.get(str))).iterator();
            while (it.hasNext()) {
                childrenlist(tree, arrayList, commonJSONParser, it.next(), str);
            }
            if (arrayList.size() <= 0) {
                return;
            }
            arrayList.remove(arrayList.size() - 1);
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

    public static ArrayList<Books> parseBooksJson(ArrayList<Books> arrayList, String str) {
        arrayList.clear();
        File file = new File(str);
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            String fileString = JsonHelper.getFileString(str);
            if (!"".equals(fileString)) {
                try {
                    JSONArray jSONArray = ((JSONObject) new JSONTokener(fileString).nextValue()).getJSONArray("data");
                    for (int i = 0; i < jSONArray.length(); i++) {
                        JSONObject jSONObject = jSONArray.getJSONObject(i);
                        Books books = new Books();
                        String propertyName = JsonHelper.getPropertyName(jSONObject, "id");
                        long longValue = JsonHelper.getLongPropertyName(jSONObject, KeyEnvironment.KEYDOWNLOADSIZE).longValue();
                        long longValue2 = JsonHelper.getLongPropertyName(jSONObject, "size").longValue();
                        String propertyName2 = JsonHelper.getPropertyName(jSONObject, "name");
                        String propertyName3 = JsonHelper.getPropertyName(jSONObject, "path");
                        String propertyName4 = JsonHelper.getPropertyName(jSONObject, "progress");
                        String propertyName5 = JsonHelper.getPropertyName(jSONObject, "updatetime");
                        int intPropertyName = JsonHelper.getIntPropertyName(jSONObject, AppEnvironment.ISNEW);
                        int intPropertyName2 = JsonHelper.getIntPropertyName(jSONObject, "total");
                        books.setbook_id(propertyName);
                        books.setbook_name(propertyName2);
                        books.setBookdownloadsize(longValue);
                        books.setBooksize(longValue2);
                        books.setbook_path(propertyName3);
                        books.setProgress(propertyName4);
                        books.setBook_updatetime(propertyName5);
                        books.setBook_isnew(intPropertyName);
                        books.setBook_total(intPropertyName2);
                        arrayList.add(books);
                    }
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
        }
        return arrayList;
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x002b, code lost:
        if ("".equals(r9) == false) goto L14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:7:0x0014, code lost:
        if ("".equals(r8) == false) goto L8;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Tree<HashMap<String, Object>> parsejson(Tree<HashMap<String, Object>> tree, String str, String str2, String str3) {
        Tree<HashMap<String, Object>> tree2 = tree;
        if (str2 != null) {
            if (str2 != null) {
                tree2 = tree;
            }
            tree2 = tree;
            if (str3 != null) {
                if (str3 != null) {
                    tree2 = tree;
                }
                tree2 = tree;
                if (str != null) {
                    if (str == null || !"".equals(str)) {
                        CommonJSONParser commonJSONParser = new CommonJSONParser();
                        HashMap<String, Object> parse = commonJSONParser.parse(str);
                        tree2 = tree;
                        if (parse != null) {
                            Tree<HashMap<String, Object>> tree3 = new Tree<>(parse);
                            tree2 = tree3;
                            if (parse.get(str2) != null) {
                                try {
                                    ArrayList<Object> parseJSONArray = commonJSONParser.parseJSONArray((JSONArray) parse.get(str2));
                                    tree2 = tree3;
                                    if (parseJSONArray != null) {
                                        ArrayList arrayList = new ArrayList();
                                        arrayList.add(parse);
                                        int i = 0;
                                        Iterator<Object> it = parseJSONArray.iterator();
                                        while (true) {
                                            tree2 = tree3;
                                            if (!it.hasNext()) {
                                                break;
                                            }
                                            i++;
                                            childrenlist(tree3, arrayList, commonJSONParser, it.next(), str3);
                                        }
                                    }
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                    tree2 = tree3;
                                }
                            }
                        }
                    } else {
                        tree2 = tree;
                    }
                }
            }
        }
        return tree2;
    }
}
