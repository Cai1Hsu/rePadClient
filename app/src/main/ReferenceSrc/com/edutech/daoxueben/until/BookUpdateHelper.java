package com.edutech.daoxueben.until;

import android.util.Log;
import com.edutech.daoxueben.sysconfig.AppEnvironment;
import com.edutech.json.JsonPort;
import com.edutech.json.KeyEnvironment;
import com.edutech.json.Tree;
import com.edutech.publicedu.log.LogHelp;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
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
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* loaded from: classes.jar:com/edutech/daoxueben/until/BookUpdateHelper.class */
public class BookUpdateHelper {
    public ArrayList<BookUpdateInfo> BookUpdateBook(ArrayList<BookUpdateInfo> arrayList) {
        Iterator<OldBooks> it = JsonHelper.booksparserJson(new ArrayList()).iterator();
        while (it.hasNext()) {
            OldBooks next = it.next();
            String str = next.getbook_id();
            String book_updatetime = next.getBook_updatetime();
            int book_total = next.getBook_total();
            BookUpdateInfo bookUpdateInfo = new BookUpdateInfo();
            bookUpdateInfo.setid(str);
            bookUpdateInfo.settype(LogHelp.TYPE_GUIDANCE);
            bookUpdateInfo.setsource(LogHelp.TYPE_GUIDANCE);
            bookUpdateInfo.setupdatetime(book_updatetime);
            bookUpdateInfo.settotal(book_total);
            arrayList.add(bookUpdateInfo);
        }
        return arrayList;
    }

    public ArrayList<BookUpdateInfo> BookUpdateChapter(ArrayList<BookUpdateInfo> arrayList, ArrayList<BookInfo> arrayList2) {
        return arrayList;
    }

    public ArrayList<BookInfo> BookUpdateGetPeerBook(String str, ArrayList<BookInfo> arrayList) {
        String str2 = String.valueOf(AppEnvironment.OFFLINE_DOWNLOAD) + str + "//json.json";
        ArrayList<BookInfo> arrayList2 = arrayList;
        if (new File(str2).exists()) {
            arrayList2 = JsonHelper.peerbookparserJson(arrayList, JsonHelper.getFileString(str2));
        }
        return arrayList2;
    }

    public void BookUpdateLocalBookJson(ArrayList<BookUpdateInfo> arrayList) {
        ArrayList<OldBooks> booksparserJson = JsonHelper.booksparserJson(new ArrayList());
        Iterator<BookUpdateInfo> it = arrayList.iterator();
        while (it.hasNext()) {
            BookUpdateInfo next = it.next();
            String idVar = next.getid();
            Iterator<OldBooks> it2 = booksparserJson.iterator();
            if (it2.hasNext()) {
                OldBooks next2 = it2.next();
                if (idVar.equals(next2.getbook_id())) {
                    next2.setBook_isnew(next.getBook_isnew());
                    next2.setBook_updatetime(next.getupdatetime());
                }
            }
        }
        JsonHelper.CreateFile(JsonHelper.bookscreateJson(booksparserJson), AppEnvironment.JSON_BOOKS_File);
    }

    public ArrayList<BookInfo> BookUpdateLocalJson(ArrayList<BookInfo> arrayList, String str) {
        int i = 0;
        while (true) {
            if (i >= arrayList.size()) {
                break;
            }
            BookInfo bookInfo = arrayList.get(i);
            if (bookInfo.isIsdown() && bookInfo.getSection_id().equals(str)) {
                arrayList.get(i).setIsnew(true);
                break;
            }
            i++;
        }
        return arrayList;
    }

    public void BookUpdateLocalJsonJson(ArrayList<BookInfo> arrayList, String str) {
        String str2 = String.valueOf(AppEnvironment.OFFLINE_DOWNLOAD) + str;
        String peerbookcreateJson = JsonHelper.peerbookcreateJson(arrayList);
        Log.d("CreateJson", "BookUpdateLocalJsonJson" + peerbookcreateJson);
        JsonHelper.CreateFile(peerbookcreateJson, String.valueOf(str2) + "//json.json");
    }

    public ArrayList<BookUpdateInfo> BookUpdateQuestion(ArrayList<BookUpdateInfo> arrayList, ArrayList<BookInfo> arrayList2) {
        for (int i = 0; i < arrayList2.size(); i++) {
            BookInfo bookInfo = arrayList2.get(i);
            if (bookInfo.isIsdown()) {
                bookInfo.getSection_id();
                bookInfo.getsection_updatetime();
                bookInfo.getSection_webpath().size();
                bookInfo.getExams().size();
            }
        }
        return arrayList;
    }

    public ArrayList<BookUpdateInfo> BookUpdateSection(ArrayList<BookUpdateInfo> arrayList, ArrayList<BookInfo> arrayList2) {
        for (int i = 0; i < arrayList2.size(); i++) {
            BookInfo bookInfo = arrayList2.get(i);
            if (bookInfo.isIsdown()) {
                String section_id = bookInfo.getSection_id();
                String str = bookInfo.getsection_updatetime();
                int size = bookInfo.getSection_webpath().size();
                int size2 = bookInfo.getExams().size();
                BookUpdateInfo bookUpdateInfo = new BookUpdateInfo();
                bookUpdateInfo.setid(section_id);
                bookUpdateInfo.settype(LogHelp.TYPE_HWHELP);
                bookUpdateInfo.setsource(LogHelp.TYPE_GUIDANCE);
                bookUpdateInfo.setupdatetime(str);
                bookUpdateInfo.settotal(size + size2);
                arrayList.add(bookUpdateInfo);
            }
        }
        return arrayList;
    }

    public ArrayList<BookUpdateInfo> JsonUpdateHttpPost(String str, String str2, String str3, ArrayList<BookUpdateInfo> arrayList) {
        ArrayList<BookUpdateInfo> arrayList2;
        String UPDATEJSON_HTTPPOST_URL = AppEnvironment.UPDATEJSON_HTTPPOST_URL(str, str2);
        if (str3 == null || "".equals(str3)) {
            arrayList2 = arrayList;
        } else {
            HttpPost httpPost = new HttpPost(UPDATEJSON_HTTPPOST_URL);
            ArrayList arrayList3 = new ArrayList();
            arrayList3.add(new BasicNameValuePair("data", str3));
            try {
                httpPost.setEntity(new UrlEncodedFormEntity(arrayList3, "UTF-8"));
                HttpResponse execute = new DefaultHttpClient().execute(httpPost);
                if (execute.getStatusLine().getStatusCode() == 200) {
                    arrayList2 = parseHttpPostReturnJson(EntityUtils.toString(execute.getEntity()), arrayList);
                }
            } catch (ClientProtocolException e) {
                e.printStackTrace();
            } catch (IOException e2) {
                e2.printStackTrace();
            } catch (Exception e3) {
                e3.printStackTrace();
            }
            arrayList2 = arrayList;
        }
        return arrayList2;
    }

    public int getIsDownTrue(String str, Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, JsonPort jsonPort, String str2, HashMap<String, Integer> hashMap2) {
        Collection<HashMap<String, Object>> successors = tree.getSuccessors(hashMap);
        ArrayList arrayList = new ArrayList();
        for (HashMap<String, Object> hashMap3 : successors) {
            if (hashMap3 != null && hashMap3.get(str2) != null) {
                String obj = hashMap3.get(str2).toString();
                int i = 0;
                if (hashMap3.get(KeyEnvironment.KEYWEBPATH) != null) {
                    ArrayList<Object> valueList = jsonPort.getValueList(new ArrayList<>(), hashMap3.get(KeyEnvironment.KEYWEBPATH));
                    i = 0;
                    if (valueList != null) {
                        i = 0;
                        if (valueList.size() > 0) {
                            i = 0 + valueList.size();
                        }
                    }
                }
                int i2 = i;
                if (hashMap3.get("exams") != null) {
                    ArrayList<Object> valueList2 = jsonPort.getValueList(new ArrayList<>(), hashMap3.get("exams"));
                    i2 = i;
                    if (valueList2 != null) {
                        i2 = i;
                        if (valueList2.size() > 0) {
                            i2 = i + valueList2.size();
                        }
                    }
                }
                hashMap2.put(obj, Integer.valueOf(i2));
                if (hashMap3.get("isdown") != null && jsonPort.objectToBoolean(hashMap3, "isdown")) {
                    arrayList.add(obj);
                }
            }
        }
        return 0;
    }

    public Tree<HashMap<String, Object>> getLocalJsonTree(String str, Tree<HashMap<String, Object>> tree, JsonPort jsonPort) {
        String str2 = String.valueOf(AppEnvironment.OFFLINE_DOWNLOAD) + str + "/json.json";
        Tree<HashMap<String, Object>> tree2 = tree;
        if (new File(str2).exists()) {
            tree2 = jsonPort.parseJson(tree, JsonHelper.getFileString(str2), "data", "children");
        }
        return tree2;
    }

    public ArrayList<BookUpdateInfo> parseHttpPostReturnJson(String str, ArrayList<BookUpdateInfo> arrayList) {
        if (!"".equals(str)) {
            try {
                JSONObject jSONObject = (JSONObject) new JSONTokener(str).nextValue();
                boolean booleanPropertyName = JsonHelper.getBooleanPropertyName(jSONObject, "status");
                int intPropertyName = JsonHelper.getIntPropertyName(jSONObject, "errorNum");
                String propertyName = JsonHelper.getPropertyName(jSONObject, "errorInfo");
                JSONArray jSONArray = jSONObject.getJSONArray("data");
                for (int i = 0; i < jSONArray.length(); i++) {
                    JSONObject jSONObject2 = jSONArray.getJSONObject(i);
                    String propertyName2 = JsonHelper.getPropertyName(jSONObject2, "id");
                    String propertyName3 = JsonHelper.getPropertyName(jSONObject2, "type");
                    String propertyName4 = JsonHelper.getPropertyName(jSONObject2, "source");
                    boolean booleanPropertyName2 = JsonHelper.getBooleanPropertyName(jSONObject2, MSVSSConstants.TIME_UPDATED);
                    String propertyName5 = JsonHelper.getPropertyName(jSONObject2, "updatetime");
                    if (booleanPropertyName2) {
                        Iterator<BookUpdateInfo> it = arrayList.iterator();
                        while (true) {
                            if (!it.hasNext()) {
                                break;
                            }
                            BookUpdateInfo next = it.next();
                            if (propertyName2.equals(next.getid()) && propertyName3.equals(next.gettype()) && propertyName4.equals(next.getsource())) {
                                next.setupdated(true);
                                next.setupdatetime(propertyName5);
                                break;
                            }
                        }
                    }
                }
                if (booleanPropertyName && intPropertyName == 0) {
                    if ("".equals(propertyName)) {
                    }
                }
            } catch (JSONException e) {
                e.printStackTrace();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return arrayList;
    }

    public Tree<HashMap<String, Object>> updateIsNew(Tree<HashMap<String, Object>> tree, JsonPort jsonPort) {
        if (tree != null && tree.getHead() != null && tree.getHead().get("id") != null) {
            tree.getHead().get("id").toString();
        }
        return tree;
    }
}
