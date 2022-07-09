package com.edutech.json;

import com.edutech.idauthentication.AppEnvironment;
import com.edutech.idauthentication.JsonHelper;
import com.edutech.publicedu.log.LogHelp;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;

/* loaded from: classes.jar:com/edutech/json/CheckUpdataHelper.class */
public class CheckUpdataHelper {
    private static TreeData checkdata = new TreeData();

    public static boolean aBookCheckUpdata(Tree<HashMap<String, Object>> tree, String str, String str2, String str3, String str4) {
        boolean z = false;
        if (tree.getHead() != null) {
            z = false;
            if (tree.getHead().get("id") != null) {
                String obj = tree.getHead().get("id").toString();
                ArrayList arrayList = new ArrayList();
                ArrayList arrayList2 = new ArrayList();
                getLeafCheckUpdateJson(arrayList2, arrayList, obj, tree, tree.getHead(), str4);
                ArrayList arrayList3 = new ArrayList();
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    HashMap hashMap = (HashMap) it.next();
                    String str5 = (String) hashMap.get(KeyEnvironment.SOURCEID);
                    String str6 = (String) hashMap.get(KeyEnvironment.UPDATETIME);
                    int i = 0;
                    boolean z2 = false;
                    Iterator it2 = arrayList2.iterator();
                    while (it2.hasNext()) {
                        HashMap hashMap2 = (HashMap) it2.next();
                        String str7 = (String) hashMap2.get(KeyEnvironment.SOURCEIDLIST);
                        String str8 = (String) hashMap2.get(KeyEnvironment.COUNT);
                        if (str7 != null && str5 != null && str7.indexOf(str5) != -1) {
                            int intValue = i + Integer.valueOf(str8).intValue();
                            String str9 = (String) hashMap2.get(KeyEnvironment.ISNEEDUPDATE);
                            i = intValue;
                            if (str9 != null) {
                                i = intValue;
                                if (str9.equals("true")) {
                                    z2 = true;
                                    i = intValue;
                                }
                            }
                        }
                    }
                    if (z2) {
                        hashMap.put(KeyEnvironment.COUNT, Integer.toString(i));
                        HashMap hashMap3 = new HashMap();
                        if (str4.equals("DaoXueBen")) {
                            getPostHashMap(hashMap3, str5, LogHelp.TYPE_MYWORK, LogHelp.TYPE_GUIDANCE, str6, i);
                        } else if (str4.equals("DaoXueBenNew")) {
                            getPostHashMap(hashMap3, str5, LogHelp.TYPE_MYWORK, LogHelp.TYPE_GUIDANCE, str6, i);
                        } else {
                            getPostHashMap(hashMap3, str5, "4", LogHelp.TYPE_MYWORK, str6, 1);
                        }
                        Object MaptoJSONObject = JsonCreate.MaptoJSONObject(hashMap3);
                        if (MaptoJSONObject != null) {
                            arrayList3.add(MaptoJSONObject);
                        }
                    }
                }
                String postJson = getPostJson("", arrayList3);
                z = false;
                if (postJson != null) {
                    z = false;
                    if (!"".equals(postJson)) {
                        String jsonUpdateHttpPost = jsonUpdateHttpPost(str, str2, postJson);
                        z = false;
                        if (jsonUpdateHttpPost != null) {
                            z = false;
                            if (!"".equals(jsonUpdateHttpPost)) {
                                HashMap<String, Object> parse = new CommonJSONParser().parse(jsonUpdateHttpPost);
                                z = false;
                                if (parse != null) {
                                    z = false;
                                    if (parse.get("status") != null) {
                                        z = false;
                                        if (parse.get("errorNum") != null) {
                                            ArrayList arrayList4 = new ArrayList();
                                            getNeedCheckLeafBookIdList(arrayList4, parse);
                                            z = false;
                                            if (arrayList4.size() > 0) {
                                                Iterator it3 = arrayList4.iterator();
                                                z = false;
                                                while (it3.hasNext()) {
                                                    String str10 = (String) it3.next();
                                                    Iterator it4 = arrayList.iterator();
                                                    boolean z3 = z;
                                                    while (true) {
                                                        z = z3;
                                                        if (it4.hasNext()) {
                                                            HashMap hashMap4 = (HashMap) it4.next();
                                                            if (str10.equals((String) hashMap4.get(KeyEnvironment.SOURCEID))) {
                                                                z3 = updateIsNew(z3, checkdata.sourceidToList((String) hashMap4.get(KeyEnvironment.SOURCEIDLIST)), tree, tree.getHead(), str4);
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return z;
    }

    public static String getBookCheckUpdateJson(String str, String str2) {
        ArrayList<Books> parseBooksJson = JsonParse.parseBooksJson(new ArrayList(), str);
        ArrayList arrayList = new ArrayList();
        Iterator<Books> it = parseBooksJson.iterator();
        while (it.hasNext()) {
            Books next = it.next();
            String str3 = next.getbook_id();
            next.getbook_path();
            String book_updatetime = next.getBook_updatetime();
            int book_total = next.getBook_total();
            if (str3 != null && !"".equals(str3)) {
                HashMap hashMap = new HashMap();
                if (str2.equals("DaoXueBen")) {
                    getPostHashMap(hashMap, str3, LogHelp.TYPE_GUIDANCE, LogHelp.TYPE_GUIDANCE, book_updatetime, book_total);
                } else if (str2.equals("DaoXueBenNew")) {
                    getPostHashMap(hashMap, str3, LogHelp.TYPE_GUIDANCE, LogHelp.TYPE_GUIDANCE, book_updatetime, book_total);
                } else {
                    getPostHashMap(hashMap, str3, LogHelp.TYPE_GUIDANCE, LogHelp.TYPE_MYWORK, book_updatetime, book_total);
                }
                Object MaptoJSONObject = JsonCreate.MaptoJSONObject(hashMap);
                if (MaptoJSONObject != null) {
                    arrayList.add(MaptoJSONObject);
                }
            }
        }
        return getPostJson("", arrayList);
    }

    private static void getLeafCheckUpdateJson(ArrayList<HashMap<String, String>> arrayList, ArrayList<HashMap<String, String>> arrayList2, String str, Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, String str2) {
        for (HashMap<String, Object> hashMap2 : tree.getSuccessors(hashMap)) {
            if (hashMap2.get("id") != null && hashMap2.get("updatetime") != null) {
                String obj = hashMap2.get("id").toString();
                String str3 = String.valueOf(str) + "_" + obj;
                String obj2 = hashMap2.get("updatetime").toString();
                if (str2.equals("DaoXueBen")) {
                    boolean z = false;
                    if (hashMap2.get("isdown") != null) {
                        try {
                            z = ((Boolean) hashMap2.get("isdown")).booleanValue();
                        } catch (Exception e) {
                            e.printStackTrace();
                            z = false;
                        }
                    }
                    if (z) {
                        HashMap<String, String> hashMap3 = new HashMap<>();
                        hashMap3.put(KeyEnvironment.SOURCEID, obj);
                        hashMap3.put(KeyEnvironment.SOURCEIDLIST, str3);
                        hashMap3.put(KeyEnvironment.ISUPDATED, "0");
                        hashMap3.put(KeyEnvironment.UPDATETIME, obj2);
                        arrayList2.add(hashMap3);
                    }
                    int i = 0;
                    if (hashMap2.get(KeyEnvironment.KEYWEBPATH) != null) {
                        i = 0 + checkdata.getValueList(new ArrayList<>(), hashMap2.get(KeyEnvironment.KEYWEBPATH)).size();
                    }
                    int i2 = i;
                    if (hashMap2.get("exams") != null) {
                        i2 = i + checkdata.getValueList(new ArrayList<>(), hashMap2.get("exams")).size();
                    }
                    if (i2 > 0) {
                        HashMap<String, String> hashMap4 = new HashMap<>();
                        hashMap4.put(KeyEnvironment.SOURCEIDLIST, str3);
                        hashMap4.put(KeyEnvironment.COUNT, Integer.toString(i2));
                        arrayList.add(hashMap4);
                    }
                } else if (str2.equals("DaoXueBenNew")) {
                    if (str3 != null) {
                        HashMap<String, String> hashMap5 = new HashMap<>();
                        hashMap5.put(KeyEnvironment.SOURCEID, obj);
                        hashMap5.put(KeyEnvironment.SOURCEIDLIST, str3);
                        hashMap5.put(KeyEnvironment.ISUPDATED, "0");
                        hashMap5.put(KeyEnvironment.UPDATETIME, obj2);
                        arrayList2.add(hashMap5);
                    }
                    int i3 = 0;
                    boolean z2 = false;
                    if (hashMap2.get("dxitems") != null) {
                        ArrayList<Object> valueList = checkdata.getValueList(new ArrayList<>(), hashMap2.get("dxitems"));
                        if (valueList != null && valueList.size() > 0) {
                            int i4 = 0;
                            while (i4 < valueList.size()) {
                                HashMap<String, Object> hashMap6 = JsonParse.geteObjectToMap(valueList.get(i4));
                                boolean z3 = z2;
                                int i5 = i3;
                                if (hashMap6 != null) {
                                    int i6 = i3;
                                    if (hashMap6.get(KeyEnvironment.KEYWEBPATH) != null) {
                                        i6 = i3 + checkdata.getValueList(new ArrayList<>(), hashMap6.get(KeyEnvironment.KEYWEBPATH)).size();
                                    }
                                    int i7 = i6;
                                    if (hashMap6.get("exams") != null) {
                                        i7 = i6 + checkdata.getValueList(new ArrayList<>(), hashMap6.get("exams")).size();
                                    }
                                    z3 = z2;
                                    i5 = i7;
                                    if (hashMap6.get("isdown") != null) {
                                        z3 = z2;
                                        i5 = i7;
                                        if (((Boolean) hashMap6.get("isdown")).booleanValue()) {
                                            z3 = ((Boolean) hashMap6.get("isdown")).booleanValue();
                                            i5 = i7;
                                        }
                                    }
                                }
                                i4++;
                                z2 = z3;
                                i3 = i5;
                            }
                            if (i3 > 0) {
                                HashMap<String, String> hashMap7 = new HashMap<>();
                                hashMap7.put(KeyEnvironment.SOURCEIDLIST, str3);
                                hashMap7.put(KeyEnvironment.COUNT, Integer.toString(i3));
                                hashMap7.put(KeyEnvironment.ISNEEDUPDATE, String.valueOf(z2));
                                arrayList.add(hashMap7);
                            }
                        }
                    }
                } else if (hashMap2.get("question") != null) {
                    Iterator<Object> it = checkdata.getValueList(new ArrayList<>(), hashMap2.get("question")).iterator();
                    while (it.hasNext()) {
                        HashMap<String, Object> hashMap8 = JsonParse.geteObjectToMap(it.next());
                        if (hashMap8 != null && hashMap8.get("id") != null && hashMap8.get("updatetime") != null) {
                            String obj3 = hashMap8.get("id").toString();
                            String obj4 = hashMap2.get("updatetime").toString();
                            boolean z4 = false;
                            if (hashMap8.get("isdown") != null) {
                                try {
                                    z4 = ((Boolean) hashMap8.get("isdown")).booleanValue();
                                } catch (Exception e2) {
                                    e2.printStackTrace();
                                    z4 = false;
                                }
                            }
                            if (z4) {
                                HashMap<String, String> hashMap9 = new HashMap<>();
                                hashMap9.put(KeyEnvironment.SOURCEID, obj3);
                                hashMap9.put(KeyEnvironment.SOURCEIDLIST, String.valueOf(str3) + "_" + obj3);
                                hashMap9.put(KeyEnvironment.ISUPDATED, "0");
                                hashMap9.put(KeyEnvironment.UPDATETIME, obj4);
                                hashMap9.put(KeyEnvironment.COUNT, LogHelp.TYPE_GUIDANCE);
                                arrayList2.add(hashMap9);
                            }
                        }
                    }
                }
                if (hashMap2.get("children") != null) {
                    getLeafCheckUpdateJson(arrayList, arrayList2, str3, tree, hashMap2, str2);
                }
                str = checkdata.removeSourceId(str3);
            }
        }
    }

    public static Tree<HashMap<String, Object>> getLocalTree(String str, String str2, String str3) {
        String str4 = String.valueOf(str) + str2 + "/json.json";
        Tree<HashMap<String, Object>> tree = null;
        if (new File(str4).exists()) {
            tree = JsonParse.parsejson(null, JsonHelper.getFileString(str4), "data", "children");
        }
        return tree;
    }

    public static ArrayList<String> getNeedCheckLeafBookIdList(ArrayList<String> arrayList, HashMap<String, Object> hashMap) {
        boolean z;
        try {
            z = ((Boolean) hashMap.get("status")).booleanValue();
        } catch (Exception e) {
            e.printStackTrace();
            z = false;
        }
        int intValue = Integer.valueOf(hashMap.get("errorNum").toString()).intValue();
        if (z && intValue == 0 && hashMap.get("data") != null) {
            ArrayList<Object> valueList = new TreeData().getValueList(new ArrayList<>(), hashMap.get("data"));
            if (valueList.size() > 0) {
                Iterator<Object> it = valueList.iterator();
                while (it.hasNext()) {
                    HashMap<String, Object> hashMap2 = JsonParse.geteObjectToMap(it.next());
                    if (hashMap2 != null && hashMap2.get(MSVSSConstants.TIME_UPDATED) != null) {
                        boolean z2 = false;
                        try {
                            z2 = ((Boolean) hashMap2.get(MSVSSConstants.TIME_UPDATED)).booleanValue();
                        } catch (Exception e2) {
                            e2.printStackTrace();
                        }
                        if (z2 && hashMap2.get("id") != null) {
                            arrayList.add(hashMap2.get("id").toString());
                        }
                    }
                }
            }
        }
        return arrayList;
    }

    private static void getPostHashMap(HashMap<String, Object> hashMap, String str, String str2, String str3, String str4, int i) {
        hashMap.put("id", str);
        hashMap.put("type", str2);
        hashMap.put("source", str3);
        hashMap.put("updatetime", str4);
        hashMap.put("total", Integer.valueOf(i));
    }

    private static String getPostJson(String str, ArrayList<Object> arrayList) {
        String str2 = str;
        if (arrayList.size() > 0) {
            Object jSONArrayObject = JsonCreate.toJSONArrayObject(arrayList);
            str2 = str;
            if (jSONArrayObject != null) {
                HashMap hashMap = new HashMap();
                hashMap.put("data", jSONArrayObject);
                Object MaptoJSONObject = JsonCreate.MaptoJSONObject(hashMap);
                str2 = str;
                if (MaptoJSONObject != null) {
                    str2 = MaptoJSONObject.toString();
                }
            }
        }
        return str2;
    }

    public static String jsonUpdateHttpPost(String str, String str2, String str3) {
        String str4;
        String UPDATEJSON_HTTPPOST_URL = AppEnvironment.UPDATEJSON_HTTPPOST_URL(str, str2);
        if (str3 == null || "".equals(str3)) {
            str4 = "";
        } else {
            HttpPost httpPost = new HttpPost(UPDATEJSON_HTTPPOST_URL);
            ArrayList arrayList = new ArrayList();
            arrayList.add(new BasicNameValuePair("data", str3));
            try {
                httpPost.setEntity(new UrlEncodedFormEntity(arrayList, "UTF-8"));
                HttpResponse execute = new DefaultHttpClient().execute(httpPost);
                if (execute.getStatusLine().getStatusCode() == 200) {
                    str4 = EntityUtils.toString(execute.getEntity());
                }
            } catch (ClientProtocolException e) {
                e.printStackTrace();
            } catch (IOException e2) {
                e2.printStackTrace();
            } catch (Exception e3) {
                e3.printStackTrace();
            }
            str4 = "";
        }
        return str4;
    }

    private static boolean updateIsNew(boolean z, ArrayList<String> arrayList, Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, String str) {
        HashMap<String, Object> hashMap2;
        boolean z2;
        int i = 1;
        boolean z3 = z;
        while (i < arrayList.size()) {
            String str2 = arrayList.get(i);
            Iterator<HashMap<String, Object>> it = tree.getSuccessors(hashMap).iterator();
            while (true) {
                if (!it.hasNext()) {
                    hashMap2 = hashMap;
                    z2 = z3;
                    break;
                }
                HashMap<String, Object> next = it.next();
                if (next.get("id") != null && str2.equals(next.get("id").toString())) {
                    if (str.equals("DaoXueBen")) {
                        z2 = z3;
                        hashMap2 = next;
                        if (i == arrayList.size() - 1) {
                            z2 = true;
                            checkdata.changeTreeData(tree, next, true, AppEnvironment.ISNEW);
                            hashMap2 = next;
                        }
                    } else if (str.equals("DaoXueBenNew")) {
                        z2 = z3;
                        hashMap2 = next;
                        if (i == arrayList.size() - 1) {
                            z2 = true;
                            checkdata.changeTreeData(tree, next, true, AppEnvironment.ISNEW);
                            hashMap2 = next;
                        }
                    } else {
                        z2 = z3;
                        hashMap2 = next;
                        if (i == arrayList.size() - 2) {
                            String str3 = arrayList.get(arrayList.size() - 1);
                            z2 = z3;
                            hashMap2 = next;
                            if (str3 != null) {
                                z2 = z3;
                                hashMap2 = next;
                                if (!"".equals(str3)) {
                                    z2 = z3;
                                    hashMap2 = next;
                                    if (next.get("question") != null) {
                                        ArrayList<Object> valueList = checkdata.getValueList(new ArrayList<>(), next.get("question"));
                                        z2 = z3;
                                        hashMap2 = next;
                                        if (valueList != null) {
                                            z2 = z3;
                                            hashMap2 = next;
                                            if (valueList.size() > 0) {
                                                int i2 = 0;
                                                while (true) {
                                                    if (i2 < valueList.size()) {
                                                        HashMap<String, Object> hashMap3 = JsonParse.geteObjectToMap(valueList.get(i2));
                                                        if (hashMap3 != null && hashMap3.get("id") != null && str3.equals(hashMap3.get("id").toString())) {
                                                            z2 = true;
                                                            hashMap3.put(AppEnvironment.ISNEW, true);
                                                            valueList.set(i2, JsonCreate.MaptoJSONObject(hashMap3));
                                                            break;
                                                        }
                                                        i2++;
                                                    } else {
                                                        z2 = z3;
                                                        break;
                                                    }
                                                }
                                                checkdata.changeTreeData(tree, next, JsonCreate.toJSONArrayObject(valueList), "question");
                                                hashMap2 = next;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            i++;
            z3 = z2;
            hashMap = hashMap2;
        }
        return z3;
    }
}
