package com.edutech.json;

import com.edutech.idauthentication.AppEnvironment;
import com.edutech.idauthentication.JsonHelper;
import com.edutech.publicedu.log.LogHelp;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class CheckUpdataHelper {
    private static TreeData checkdata = new TreeData();

    public static String getBookCheckUpdateJson(String booksJsonPath, String appName) {
        ArrayList<Books> books = new ArrayList<>();
        ArrayList<Books> books2 = JsonParse.parseBooksJson(books, booksJsonPath);
        ArrayList<Object> checkUpdataJsonList = new ArrayList<>();
        Iterator<Books> it = books2.iterator();
        while (it.hasNext()) {
            Books tempBook = it.next();
            String bookid = tempBook.getbook_id();
            tempBook.getbook_path();
            String book_updatetime = tempBook.getBook_updatetime();
            int book_total = tempBook.getBook_total();
            if (bookid != null && !"".equals(bookid)) {
                HashMap<String, Object> bookinfo = new HashMap<>();
                if (appName.equals("DaoXueBen")) {
                    getPostHashMap(bookinfo, bookid, LogHelp.TYPE_GUIDANCE, LogHelp.TYPE_GUIDANCE, book_updatetime, book_total);
                } else if (appName.equals("DaoXueBenNew")) {
                    getPostHashMap(bookinfo, bookid, LogHelp.TYPE_GUIDANCE, LogHelp.TYPE_GUIDANCE, book_updatetime, book_total);
                } else {
                    getPostHashMap(bookinfo, bookid, LogHelp.TYPE_GUIDANCE, LogHelp.TYPE_MYWORK, book_updatetime, book_total);
                }
                Object newObject = JsonCreate.MaptoJSONObject(bookinfo);
                if (newObject != null) {
                    checkUpdataJsonList.add(newObject);
                }
            }
        }
        String postJson = getPostJson("", checkUpdataJsonList);
        return postJson;
    }

    private static void getPostHashMap(HashMap<String, Object> bookinfo, String bookid, String type, String source, String updatetime, int count) {
        bookinfo.put("id", bookid);
        bookinfo.put("type", type);
        bookinfo.put("source", source);
        bookinfo.put("updatetime", updatetime);
        bookinfo.put("total", Integer.valueOf(count));
    }

    private static String getPostJson(String postJson, ArrayList<Object> checkUpdataJsonList) {
        Object JsonListObject;
        if (checkUpdataJsonList.size() > 0 && (JsonListObject = JsonCreate.toJSONArrayObject(checkUpdataJsonList)) != null) {
            HashMap<String, Object> postCheckJson = new HashMap<>();
            postCheckJson.put("data", JsonListObject);
            Object postObject = JsonCreate.MaptoJSONObject(postCheckJson);
            if (postObject != null) {
                return postObject.toString();
            }
            return postJson;
        }
        return postJson;
    }

    public static Tree<HashMap<String, Object>> getLocalTree(String offline_download, String bookid, String appName) {
        String bookJsonPath = String.valueOf(offline_download) + bookid + "/json.json";
        File bookJsonFile = new File(bookJsonPath);
        if (!bookJsonFile.exists()) {
            return null;
        }
        String localjson = JsonHelper.getFileString(bookJsonPath);
        Tree<HashMap<String, Object>> localTree = JsonParse.parsejson(null, localjson, "data", "children");
        return localTree;
    }

    public static String jsonUpdateHttpPost(String ip, String studentid, String json) {
        String url = AppEnvironment.UPDATEJSON_HTTPPOST_URL(ip, studentid);
        if (json == null || "".equals(json)) {
            return "";
        }
        HttpPost httpRequest = new HttpPost(url);
        List<NameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("data", json));
        try {
            httpRequest.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
            HttpResponse httpResponse = new DefaultHttpClient().execute(httpRequest);
            if (httpResponse.getStatusLine().getStatusCode() == 200) {
                String strResult = EntityUtils.toString(httpResponse.getEntity());
                return strResult;
            }
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        } catch (Exception e3) {
            e3.printStackTrace();
        }
        return "";
    }

    public static ArrayList<String> getNeedCheckLeafBookIdList(ArrayList<String> bookidList, HashMap<String, Object> tempMap) {
        boolean status = false;
        try {
            status = ((Boolean) tempMap.get("status")).booleanValue();
        } catch (Exception e) {
            e.printStackTrace();
        }
        int errorNum = Integer.valueOf(tempMap.get("errorNum").toString()).intValue();
        if (status && errorNum == 0 && tempMap.get("data") != null) {
            ArrayList<Object> dataList = new ArrayList<>();
            TreeData datatree = new TreeData();
            ArrayList<Object> dataList2 = datatree.getValueList(dataList, tempMap.get("data"));
            if (dataList2.size() > 0) {
                Iterator<Object> it = dataList2.iterator();
                while (it.hasNext()) {
                    Object tempDataObject = it.next();
                    HashMap<String, Object> tempDataMap = JsonParse.geteObjectToMap(tempDataObject);
                    if (tempDataMap != null && tempDataMap.get(MSVSSConstants.TIME_UPDATED) != null) {
                        boolean updated = false;
                        try {
                            updated = ((Boolean) tempDataMap.get(MSVSSConstants.TIME_UPDATED)).booleanValue();
                        } catch (Exception e2) {
                            e2.printStackTrace();
                        }
                        if (updated && tempDataMap.get("id") != null) {
                            String id = tempDataMap.get("id").toString();
                            bookidList.add(id);
                        }
                    }
                }
            }
        }
        return bookidList;
    }

    public static boolean aBookCheckUpdata(Tree<HashMap<String, Object>> localTree, String ip, String studentid, String bookid, String appName) {
        String leafReturnJson;
        boolean isNew = false;
        if (localTree.getHead() != null && localTree.getHead().get("id") != null) {
            String bookId = localTree.getHead().get("id").toString();
            ArrayList<HashMap<String, String>> idList = new ArrayList<>();
            ArrayList<HashMap<String, String>> countList = new ArrayList<>();
            getLeafCheckUpdateJson(countList, idList, bookId, localTree, localTree.getHead(), appName);
            ArrayList<Object> checkUpdataJsonList = new ArrayList<>();
            Iterator<HashMap<String, String>> it = idList.iterator();
            while (it.hasNext()) {
                HashMap<String, String> tempidList = it.next();
                String id = tempidList.get(KeyEnvironment.SOURCEID);
                String updatetime = tempidList.get(KeyEnvironment.UPDATETIME);
                int count = 0;
                boolean isneedupdate = false;
                Iterator<HashMap<String, String>> it2 = countList.iterator();
                while (it2.hasNext()) {
                    HashMap<String, String> tempcountList = it2.next();
                    String countid = tempcountList.get(KeyEnvironment.SOURCEIDLIST);
                    String strcount = tempcountList.get(KeyEnvironment.COUNT);
                    if (countid != null && id != null && countid.indexOf(id) != -1) {
                        count += Integer.valueOf(strcount).intValue();
                        String needcount = tempcountList.get(KeyEnvironment.ISNEEDUPDATE);
                        if (needcount != null && needcount.equals("true")) {
                            isneedupdate = true;
                        }
                    }
                }
                if (isneedupdate) {
                    tempidList.put(KeyEnvironment.COUNT, Integer.toString(count));
                    HashMap<String, Object> bookinfo = new HashMap<>();
                    if (appName.equals("DaoXueBen")) {
                        getPostHashMap(bookinfo, id, LogHelp.TYPE_MYWORK, LogHelp.TYPE_GUIDANCE, updatetime, count);
                    } else if (appName.equals("DaoXueBenNew")) {
                        getPostHashMap(bookinfo, id, LogHelp.TYPE_MYWORK, LogHelp.TYPE_GUIDANCE, updatetime, count);
                    } else {
                        getPostHashMap(bookinfo, id, "4", LogHelp.TYPE_MYWORK, updatetime, 1);
                    }
                    Object newObject = JsonCreate.MaptoJSONObject(bookinfo);
                    if (newObject != null) {
                        checkUpdataJsonList.add(newObject);
                    }
                }
            }
            String postJson = getPostJson("", checkUpdataJsonList);
            if (postJson != null && !"".equals(postJson) && (leafReturnJson = jsonUpdateHttpPost(ip, studentid, postJson)) != null && !"".equals(leafReturnJson)) {
                CommonJSONParser common = new CommonJSONParser();
                HashMap<String, Object> leaftempMap = common.parse(leafReturnJson);
                if (leaftempMap != null && leaftempMap.get("status") != null && leaftempMap.get("errorNum") != null) {
                    ArrayList<String> leafidList = new ArrayList<>();
                    getNeedCheckLeafBookIdList(leafidList, leaftempMap);
                    if (leafidList.size() > 0) {
                        Iterator<String> it3 = leafidList.iterator();
                        while (it3.hasNext()) {
                            String strleafid = it3.next();
                            Iterator<HashMap<String, String>> it4 = idList.iterator();
                            while (it4.hasNext()) {
                                HashMap<String, String> tempidList2 = it4.next();
                                String tempid = tempidList2.get(KeyEnvironment.SOURCEID);
                                if (strleafid.equals(tempid)) {
                                    String sourceIdList = tempidList2.get(KeyEnvironment.SOURCEIDLIST);
                                    ArrayList<String> stridList = checkdata.sourceidToList(sourceIdList);
                                    isNew = updateIsNew(isNew, stridList, localTree, localTree.getHead(), appName);
                                }
                            }
                        }
                    }
                }
            }
        }
        return isNew;
    }

    private static void getLeafCheckUpdateJson(ArrayList<HashMap<String, String>> countList, ArrayList<HashMap<String, String>> idList, String sourceId, Tree<HashMap<String, Object>> localTree, HashMap<String, Object> head, String appName) {
        Collection<HashMap<String, Object>> Successors = localTree.getSuccessors(head);
        for (HashMap<String, Object> tempSuccessors : Successors) {
            if (tempSuccessors.get("id") != null && tempSuccessors.get("updatetime") != null) {
                String id = tempSuccessors.get("id").toString();
                String sourceId2 = String.valueOf(sourceId) + "_" + id;
                String updatetime = tempSuccessors.get("updatetime").toString();
                if (appName.equals("DaoXueBen")) {
                    boolean boolisdown = false;
                    if (tempSuccessors.get("isdown") != null) {
                        try {
                            boolisdown = ((Boolean) tempSuccessors.get("isdown")).booleanValue();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    if (boolisdown) {
                        HashMap<String, String> hashList = new HashMap<>();
                        hashList.put(KeyEnvironment.SOURCEID, id);
                        hashList.put(KeyEnvironment.SOURCEIDLIST, sourceId2);
                        hashList.put(KeyEnvironment.ISUPDATED, "0");
                        hashList.put(KeyEnvironment.UPDATETIME, updatetime);
                        idList.add(hashList);
                    }
                    int leafcount = 0;
                    if (tempSuccessors.get(KeyEnvironment.KEYWEBPATH) != null) {
                        ArrayList<Object> webpathList = new ArrayList<>();
                        leafcount = 0 + checkdata.getValueList(webpathList, tempSuccessors.get(KeyEnvironment.KEYWEBPATH)).size();
                    }
                    if (tempSuccessors.get("exams") != null) {
                        ArrayList<Object> examsobjectList = new ArrayList<>();
                        leafcount += checkdata.getValueList(examsobjectList, tempSuccessors.get("exams")).size();
                    }
                    if (leafcount > 0) {
                        HashMap<String, String> hashcount = new HashMap<>();
                        hashcount.put(KeyEnvironment.SOURCEIDLIST, sourceId2);
                        hashcount.put(KeyEnvironment.COUNT, Integer.toString(leafcount));
                        countList.add(hashcount);
                    }
                } else if (appName.equals("DaoXueBenNew")) {
                    if (sourceId2 != null) {
                        HashMap<String, String> hashList2 = new HashMap<>();
                        hashList2.put(KeyEnvironment.SOURCEID, id);
                        hashList2.put(KeyEnvironment.SOURCEIDLIST, sourceId2);
                        hashList2.put(KeyEnvironment.ISUPDATED, "0");
                        hashList2.put(KeyEnvironment.UPDATETIME, updatetime);
                        idList.add(hashList2);
                    }
                    int leafcount2 = 0;
                    boolean isNeedUpdate = false;
                    if (tempSuccessors.get("dxitems") != null) {
                        ArrayList<Object> dxitemsobjectList = checkdata.getValueList(new ArrayList<>(), tempSuccessors.get("dxitems"));
                        if (dxitemsobjectList != null && dxitemsobjectList.size() > 0) {
                            for (int i = 0; i < dxitemsobjectList.size(); i++) {
                                HashMap<String, Object> tempMap = JsonParse.geteObjectToMap(dxitemsobjectList.get(i));
                                if (tempMap != null) {
                                    if (tempMap.get(KeyEnvironment.KEYWEBPATH) != null) {
                                        ArrayList<Object> webpathList2 = new ArrayList<>();
                                        leafcount2 += checkdata.getValueList(webpathList2, tempMap.get(KeyEnvironment.KEYWEBPATH)).size();
                                    }
                                    if (tempMap.get("exams") != null) {
                                        ArrayList<Object> examsobjectList2 = new ArrayList<>();
                                        leafcount2 += checkdata.getValueList(examsobjectList2, tempMap.get("exams")).size();
                                    }
                                    if (tempMap.get("isdown") != null && ((Boolean) tempMap.get("isdown")).booleanValue()) {
                                        isNeedUpdate = ((Boolean) tempMap.get("isdown")).booleanValue();
                                    }
                                }
                            }
                            if (leafcount2 > 0) {
                                HashMap<String, String> hashcount2 = new HashMap<>();
                                hashcount2.put(KeyEnvironment.SOURCEIDLIST, sourceId2);
                                hashcount2.put(KeyEnvironment.COUNT, Integer.toString(leafcount2));
                                hashcount2.put(KeyEnvironment.ISNEEDUPDATE, String.valueOf(isNeedUpdate));
                                countList.add(hashcount2);
                            }
                        }
                    }
                } else if (tempSuccessors.get("question") != null) {
                    ArrayList<Object> questionList = new ArrayList<>();
                    Iterator<Object> it = checkdata.getValueList(questionList, tempSuccessors.get("question")).iterator();
                    while (it.hasNext()) {
                        Object tempQues = it.next();
                        HashMap<String, Object> hashQuesMap = JsonParse.geteObjectToMap(tempQues);
                        if (hashQuesMap != null && hashQuesMap.get("id") != null && hashQuesMap.get("updatetime") != null) {
                            String quesid = hashQuesMap.get("id").toString();
                            String quesupdatetime = tempSuccessors.get("updatetime").toString();
                            boolean boolisdown2 = false;
                            if (hashQuesMap.get("isdown") != null) {
                                try {
                                    boolisdown2 = ((Boolean) hashQuesMap.get("isdown")).booleanValue();
                                } catch (Exception e2) {
                                    e2.printStackTrace();
                                }
                            }
                            if (boolisdown2) {
                                HashMap<String, String> hashList3 = new HashMap<>();
                                hashList3.put(KeyEnvironment.SOURCEID, quesid);
                                hashList3.put(KeyEnvironment.SOURCEIDLIST, String.valueOf(sourceId2) + "_" + quesid);
                                hashList3.put(KeyEnvironment.ISUPDATED, "0");
                                hashList3.put(KeyEnvironment.UPDATETIME, quesupdatetime);
                                hashList3.put(KeyEnvironment.COUNT, LogHelp.TYPE_GUIDANCE);
                                idList.add(hashList3);
                            }
                        }
                    }
                }
                if (tempSuccessors.get("children") != null) {
                    getLeafCheckUpdateJson(countList, idList, sourceId2, localTree, tempSuccessors, appName);
                }
                sourceId = checkdata.removeSourceId(sourceId2);
            }
        }
    }

    private static boolean updateIsNew(boolean isNew, ArrayList<String> idList, Tree<HashMap<String, Object>> localTree, HashMap<String, Object> head, String appName) {
        String quesid;
        for (int i = 1; i < idList.size(); i++) {
            String id = idList.get(i);
            Collection<HashMap<String, Object>> Successors = localTree.getSuccessors(head);
            Iterator<HashMap<String, Object>> it = Successors.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                HashMap<String, Object> tempSuccessors = it.next();
                if (tempSuccessors.get("id") != null) {
                    String leafid = tempSuccessors.get("id").toString();
                    if (id.equals(leafid)) {
                        head = tempSuccessors;
                        if (appName.equals("DaoXueBen")) {
                            if (i == idList.size() - 1) {
                                isNew = true;
                                checkdata.changeTreeData(localTree, head, true, AppEnvironment.ISNEW);
                            }
                        } else if (appName.equals("DaoXueBenNew")) {
                            if (i == idList.size() - 1) {
                                isNew = true;
                                checkdata.changeTreeData(localTree, head, true, AppEnvironment.ISNEW);
                            }
                        } else if (i == idList.size() - 2 && (quesid = idList.get(idList.size() - 1)) != null && !"".equals(quesid) && head.get("question") != null) {
                            ArrayList<Object> quesObjectList = checkdata.getValueList(new ArrayList<>(), head.get("question"));
                            if (quesObjectList != null && quesObjectList.size() > 0) {
                                int j = 0;
                                while (true) {
                                    if (j >= quesObjectList.size()) {
                                        break;
                                    }
                                    Object tempQues = quesObjectList.get(j);
                                    HashMap<String, Object> tempQuesMap = JsonParse.geteObjectToMap(tempQues);
                                    if (tempQuesMap != null && tempQuesMap.get("id") != null) {
                                        String tempQuesid = tempQuesMap.get("id").toString();
                                        if (quesid.equals(tempQuesid)) {
                                            isNew = true;
                                            tempQuesMap.put(AppEnvironment.ISNEW, true);
                                            Object newQuesObject = JsonCreate.MaptoJSONObject(tempQuesMap);
                                            quesObjectList.set(j, newQuesObject);
                                            break;
                                        }
                                    }
                                    j++;
                                }
                                Object newQuesListObject = JsonCreate.toJSONArrayObject(quesObjectList);
                                checkdata.changeTreeData(localTree, head, newQuesListObject, "question");
                            }
                        }
                    }
                }
            }
        }
        return isNew;
    }
}
