package com.edutech.json;

import com.edutech.idauthentication.AppEnvironment;
import com.edutech.idauthentication.JsonHelper;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/* loaded from: classes.dex */
public class JsonPort {
    public Tree<HashMap<String, Object>> parseJson(Tree<HashMap<String, Object>> tree, String json, String parkey, String leafKey) {
        return JsonParse.parsejson(tree, json, parkey, leafKey);
    }

    public boolean createJson(Tree<HashMap<String, Object>> tree, String jsonpath) {
        String json = JsonCreate.createjson(tree);
        return JsonCreate.saveJsonToLocal(json, jsonpath);
    }

    public ArrayList<Object> getValueList(ArrayList<Object> objectList, Object object) {
        TreeData getObjectlistData = new TreeData();
        return getObjectlistData.getValueList(objectList, object);
    }

    public Object mapToObject(HashMap<String, Object> map) {
        return JsonCreate.MaptoJSONObject(map);
    }

    public boolean ObjectToJosn(String json, String jsonpath) {
        return JsonCreate.saveJsonToLocal(json, jsonpath);
    }

    public HashMap<String, Object> objectToMap(Object object) {
        return JsonParse.geteObjectToMap(object);
    }

    public Object toJSONArrayObject(ArrayList<Object> objectList) {
        return JsonCreate.toJSONArrayObject(objectList);
    }

    public boolean objectToBoolean(HashMap<String, Object> dataMap, String key) {
        return JsonParse.isBooleanTrue(dataMap, key);
    }

    public ArrayList<String> sourceidToList(String sourceId) {
        TreeData sourceTreedata = new TreeData();
        return sourceTreedata.sourceidToList(sourceId);
    }

    public String listToSourceId(ArrayList<String> idList) {
        TreeData sourceTreedata = new TreeData();
        return sourceTreedata.appendid(idList);
    }

    public String removeSourceId(String sourceId) {
        TreeData sourceTreedata = new TreeData();
        return sourceTreedata.removeSourceId(sourceId);
    }

    public boolean isJsonArray(Object inputObject) {
        CommonJSONParser common = new CommonJSONParser();
        return common.isJsonArray(inputObject);
    }

    public HashMap<String, Object> getStringToMap(String json) {
        CommonJSONParser common = new CommonJSONParser();
        HashMap<String, Object> tempMap = common.parse(json);
        return tempMap;
    }

    public void deleteDir(String FileDir) {
        FileHelper.deleteDir(FileDir);
    }

    public void copyFile(String srcPath, String desPath) {
        FileHelper.copyAllDirectoryFile(srcPath, desPath);
    }

    public void changeTreeData(Tree<HashMap<String, Object>> tree, HashMap<String, Object> oldHead, Object object, String key) {
        TreeData changeTreeData = new TreeData();
        changeTreeData.changeTreeData(tree, oldHead, object, key);
    }

    public void addBookToBooksJson(HashMap<String, Object> head, String booksJsonPath) {
        String book_id = BookJsonHelper.getStringDefault(head.get("id").toString());
        String book_name = BookJsonHelper.getStringDefault(head.get("name").toString());
        long book_downloadsize = BookJsonHelper.getLongDefault(head.get(KeyEnvironment.KEYDOWNLOADSIZE));
        long book_size = BookJsonHelper.getLongDefault(head.get("size"));
        BookJsonHelper.addBookToBooksJson(book_id, book_name, book_downloadsize, book_size, booksJsonPath);
    }

    public void updateBooksJson(Books book, String booksJsonPath) {
        BookJsonHelper.getBooks(book, booksJsonPath);
    }

    public ArrayList<HashMap<String, String>> updateTree(Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> localtree, String downloadJson, String key, String appName, String jsonpath) {
        ArrayList<HashMap<String, String>> needDownloadList = new ArrayList<>();
        TreeData updataTreeData = new TreeData();
        if (localtree != null) {
            updataTreeData.updateJsonTree(tree, localtree, key, appName, null);
        }
        updataTreeData.getNeedDownloadList(tree, downloadJson, key, appName, needDownloadList);
        createJson(tree, jsonpath);
        return needDownloadList;
    }

    public ArrayList<HashMap<String, String>> getAllBooksNeedDownloadList(ArrayList<HashMap<String, String>> downloadlist, String booksJsonPath, String offlineDownloadDir, String studentId, String appName) {
        TreeData downlistTreeData = new TreeData();
        return downlistTreeData.getAllBookNeedDownList(downloadlist, booksJsonPath, offlineDownloadDir, studentId, appName);
    }

    public void deleteBooksJsonInfo(String bookId, String booksJsonPath) {
        BookJsonHelper.deleteBooksJsonInfo(bookId, booksJsonPath);
    }

    public ArrayList<String> deleteSourceFile(String deletejson, String offlineDownloadDir, String studentId, ArrayList<String> sourceIdList, String key, String appName) {
        TreeData deleteSourceData = new TreeData();
        deleteSourceData.deleteSourceFile(deletejson, offlineDownloadDir, studentId, sourceIdList, key, appName);
        return sourceIdList;
    }

    public HashMap<String, Object> getUpdateJsonObject(Tree<HashMap<String, Object>> tree, ArrayList<String> idList) {
        TreeData treedata = new TreeData();
        return treedata.getUpdateJsonObject(tree, idList);
    }

    public String updateProgressAndSize(Tree<HashMap<String, Object>> tree, String sourceId, HashMap<String, Object> tempMap, String webpath, String oldProgress, long downloadsize, String appName) {
        TreeData treedata = new TreeData();
        if (appName.equals("DaoXueBenNew")) {
            return treedata.updateDxProgressAndSize(tree, sourceId, tempMap, webpath, oldProgress, downloadsize, appName, KeyEnvironment.KEYWEBPATH, "path", KeyEnvironment.KEYDOWNLOADSIZE, "progress");
        }
        return treedata.updateProgressAndSize(tree, sourceId, tempMap, webpath, oldProgress, downloadsize, appName, KeyEnvironment.KEYWEBPATH, "path", KeyEnvironment.KEYDOWNLOADSIZE, "progress");
    }

    public void updateHMProgressAndSize(Tree<HashMap<String, Object>> tree, String sourceId, HashMap<String, Object> tempMap, String webpath, String oldProgress, long downloadsize, String appName) {
        TreeData treedata = new TreeData();
        if (appName.equals(AppEnvironment.GeRenChengZhang)) {
            treedata.updateGeRenProgressAndSize(tree, sourceId, tempMap, webpath, oldProgress, downloadsize, appName);
        } else {
            treedata.updateHMProgressAndSize(tree, sourceId, tempMap, webpath, oldProgress, downloadsize, appName);
        }
    }

    public void checkResourceUpdate(String booksJsonPath, String appName, String ip, String studentid, String offline_download) {
        String returnJson;
        HashMap<String, Object> tempMap;
        String bookcheckupdatejson = CheckUpdataHelper.getBookCheckUpdateJson(booksJsonPath, appName);
        if (bookcheckupdatejson != null && !"".equals(bookcheckupdatejson) && (returnJson = CheckUpdataHelper.jsonUpdateHttpPost(ip, studentid, bookcheckupdatejson)) != null && !"".equals(returnJson) && (tempMap = getStringToMap(returnJson)) != null && tempMap.get("status") != null && tempMap.get("errorNum") != null) {
            ArrayList<String> bookidList = new ArrayList<>();
            CheckUpdataHelper.getNeedCheckLeafBookIdList(bookidList, tempMap);
            if (bookidList.size() > 0) {
                Iterator<String> it = bookidList.iterator();
                while (it.hasNext()) {
                    String bookid = it.next();
                    Tree<HashMap<String, Object>> localTree = CheckUpdataHelper.getLocalTree(offline_download, bookid, appName);
                    if (localTree != null) {
                        boolean isNew = CheckUpdataHelper.aBookCheckUpdata(localTree, ip, studentid, bookid, appName);
                        if (isNew) {
                            BookJsonHelper.updateIsNewToBooksJson(bookid, booksJsonPath);
                            String newjson = JsonCreate.createjson(localTree);
                            String JsonPath = String.valueOf(offline_download) + bookid + "/json.json";
                            JsonCreate.saveJsonToLocal(newjson, JsonPath);
                        }
                    }
                }
            }
        }
    }

    public ArrayList<HashMap<String, String>> addExamToDownlist(HashMap<String, Object> jsonMap, HashMap<String, Object> localJsonMap, String appName, String jsonpath) {
        ArrayList<HashMap<String, String>> needDownloadList = new ArrayList<>();
        TreeData updataExamData = new TreeData();
        HashMap<String, Object> jsonMap2 = updataExamData.examAddNewKeys(jsonMap, appName);
        if (appName.equals(AppEnvironment.GeRenChengZhang)) {
            updataExamData.UpdateGeRenOldJsonMap(jsonMap2, localJsonMap, appName, needDownloadList);
        } else {
            updataExamData.UpdateOldJsonMap(jsonMap2, localJsonMap, appName, needDownloadList);
        }
        return needDownloadList;
    }

    public void updateFormJson(String questionid, String bookJsonPath, int status) {
        TreeData removeQuestionTreeData = new TreeData();
        removeQuestionTreeData.updateFormJson(questionid, bookJsonPath, status);
    }

    public void getFileDownloadList(String jsonpath, ArrayList<HashMap<String, String>> needDownloadList, String appName) {
        File newFileJson = new File(jsonpath);
        if (newFileJson.exists()) {
            String localjson = JsonHelper.getFileString(jsonpath);
            HashMap<String, Object> localjsonMap = getStringToMap(localjson);
            TreeData getFileTreeData = new TreeData();
            getFileTreeData.getFileDownloadList(localjsonMap, needDownloadList, appName);
        }
    }

    public void updateErrorStatus(String booksJsonPath, String appName, String offline_download, int inerror, String bookid, Tree<HashMap<String, Object>> tree) {
        TreeData updateErrorStatusTreeData = new TreeData();
        updateErrorStatusTreeData.updateErrorStatus(booksJsonPath, appName, offline_download, inerror, bookid, tree);
    }

    public String updateHomeworkProgressAndSize(Tree<HashMap<String, Object>> tree, String sourceId, HashMap<String, Object> tempMap, String webpath, String oldProgress, long downloadsize, String appName) {
        TreeData treedata = new TreeData();
        return treedata.updateXINHomeworkProgressAndSize(tree, sourceId, tempMap, webpath, oldProgress, downloadsize, appName, KeyEnvironment.KEYWEBPATH, "path", KeyEnvironment.KEYDOWNLOADSIZE, "progress");
    }
}
