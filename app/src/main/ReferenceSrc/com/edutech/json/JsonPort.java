package com.edutech.json;

import com.edutech.idauthentication.AppEnvironment;
import com.edutech.idauthentication.JsonHelper;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/* loaded from: classes.jar:com/edutech/json/JsonPort.class */
public class JsonPort {
    public boolean ObjectToJosn(String str, String str2) {
        return JsonCreate.saveJsonToLocal(str, str2);
    }

    public void addBookToBooksJson(HashMap<String, Object> hashMap, String str) {
        BookJsonHelper.addBookToBooksJson(BookJsonHelper.getStringDefault(hashMap.get("id").toString()), BookJsonHelper.getStringDefault(hashMap.get("name").toString()), BookJsonHelper.getLongDefault(hashMap.get(KeyEnvironment.KEYDOWNLOADSIZE)), BookJsonHelper.getLongDefault(hashMap.get("size")), str);
    }

    public ArrayList<HashMap<String, String>> addExamToDownlist(HashMap<String, Object> hashMap, HashMap<String, Object> hashMap2, String str, String str2) {
        ArrayList<HashMap<String, String>> arrayList = new ArrayList<>();
        TreeData treeData = new TreeData();
        HashMap<String, Object> examAddNewKeys = treeData.examAddNewKeys(hashMap, str);
        if (str.equals(AppEnvironment.GeRenChengZhang)) {
            treeData.UpdateGeRenOldJsonMap(examAddNewKeys, hashMap2, str, arrayList);
        } else {
            treeData.UpdateOldJsonMap(examAddNewKeys, hashMap2, str, arrayList);
        }
        return arrayList;
    }

    public void changeTreeData(Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, Object obj, String str) {
        new TreeData().changeTreeData(tree, hashMap, obj, str);
    }

    public void checkResourceUpdate(String str, String str2, String str3, String str4, String str5) {
        String jsonUpdateHttpPost;
        HashMap<String, Object> stringToMap;
        String bookCheckUpdateJson = CheckUpdataHelper.getBookCheckUpdateJson(str, str2);
        if (bookCheckUpdateJson == null || "".equals(bookCheckUpdateJson) || (jsonUpdateHttpPost = CheckUpdataHelper.jsonUpdateHttpPost(str3, str4, bookCheckUpdateJson)) == null || "".equals(jsonUpdateHttpPost) || (stringToMap = getStringToMap(jsonUpdateHttpPost)) == null || stringToMap.get("status") == null || stringToMap.get("errorNum") == null) {
            return;
        }
        ArrayList arrayList = new ArrayList();
        CheckUpdataHelper.getNeedCheckLeafBookIdList(arrayList, stringToMap);
        if (arrayList.size() <= 0) {
            return;
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            String str6 = (String) it.next();
            Tree<HashMap<String, Object>> localTree = CheckUpdataHelper.getLocalTree(str5, str6, str2);
            if (localTree != null && CheckUpdataHelper.aBookCheckUpdata(localTree, str3, str4, str6, str2)) {
                BookJsonHelper.updateIsNewToBooksJson(str6, str);
                JsonCreate.saveJsonToLocal(JsonCreate.createjson(localTree), String.valueOf(str5) + str6 + "/json.json");
            }
        }
    }

    public void copyFile(String str, String str2) {
        FileHelper.copyAllDirectoryFile(str, str2);
    }

    public boolean createJson(Tree<HashMap<String, Object>> tree, String str) {
        return JsonCreate.saveJsonToLocal(JsonCreate.createjson(tree), str);
    }

    public void deleteBooksJsonInfo(String str, String str2) {
        BookJsonHelper.deleteBooksJsonInfo(str, str2);
    }

    public void deleteDir(String str) {
        FileHelper.deleteDir(str);
    }

    public ArrayList<String> deleteSourceFile(String str, String str2, String str3, ArrayList<String> arrayList, String str4, String str5) {
        new TreeData().deleteSourceFile(str, str2, str3, arrayList, str4, str5);
        return arrayList;
    }

    public ArrayList<HashMap<String, String>> getAllBooksNeedDownloadList(ArrayList<HashMap<String, String>> arrayList, String str, String str2, String str3, String str4) {
        return new TreeData().getAllBookNeedDownList(arrayList, str, str2, str3, str4);
    }

    public void getFileDownloadList(String str, ArrayList<HashMap<String, String>> arrayList, String str2) {
        if (new File(str).exists()) {
            new TreeData().getFileDownloadList(getStringToMap(JsonHelper.getFileString(str)), arrayList, str2);
        }
    }

    public HashMap<String, Object> getStringToMap(String str) {
        return new CommonJSONParser().parse(str);
    }

    public HashMap<String, Object> getUpdateJsonObject(Tree<HashMap<String, Object>> tree, ArrayList<String> arrayList) {
        return new TreeData().getUpdateJsonObject(tree, arrayList);
    }

    public ArrayList<Object> getValueList(ArrayList<Object> arrayList, Object obj) {
        return new TreeData().getValueList(arrayList, obj);
    }

    public boolean isJsonArray(Object obj) {
        return new CommonJSONParser().isJsonArray(obj);
    }

    public String listToSourceId(ArrayList<String> arrayList) {
        return new TreeData().appendid(arrayList);
    }

    public Object mapToObject(HashMap<String, Object> hashMap) {
        return JsonCreate.MaptoJSONObject(hashMap);
    }

    public boolean objectToBoolean(HashMap<String, Object> hashMap, String str) {
        return JsonParse.isBooleanTrue(hashMap, str);
    }

    public HashMap<String, Object> objectToMap(Object obj) {
        return JsonParse.geteObjectToMap(obj);
    }

    public Tree<HashMap<String, Object>> parseJson(Tree<HashMap<String, Object>> tree, String str, String str2, String str3) {
        return JsonParse.parsejson(tree, str, str2, str3);
    }

    public String removeSourceId(String str) {
        return new TreeData().removeSourceId(str);
    }

    public ArrayList<String> sourceidToList(String str) {
        return new TreeData().sourceidToList(str);
    }

    public Object toJSONArrayObject(ArrayList<Object> arrayList) {
        return JsonCreate.toJSONArrayObject(arrayList);
    }

    public void updateBooksJson(Books books, String str) {
        BookJsonHelper.getBooks(books, str);
    }

    public void updateErrorStatus(String str, String str2, String str3, int i, String str4, Tree<HashMap<String, Object>> tree) {
        new TreeData().updateErrorStatus(str, str2, str3, i, str4, tree);
    }

    public void updateFormJson(String str, String str2, int i) {
        new TreeData().updateFormJson(str, str2, i);
    }

    public void updateHMProgressAndSize(Tree<HashMap<String, Object>> tree, String str, HashMap<String, Object> hashMap, String str2, String str3, long j, String str4) {
        TreeData treeData = new TreeData();
        if (str4.equals(AppEnvironment.GeRenChengZhang)) {
            treeData.updateGeRenProgressAndSize(tree, str, hashMap, str2, str3, j, str4);
        } else {
            treeData.updateHMProgressAndSize(tree, str, hashMap, str2, str3, j, str4);
        }
    }

    public String updateHomeworkProgressAndSize(Tree<HashMap<String, Object>> tree, String str, HashMap<String, Object> hashMap, String str2, String str3, long j, String str4) {
        return new TreeData().updateXINHomeworkProgressAndSize(tree, str, hashMap, str2, str3, j, str4, KeyEnvironment.KEYWEBPATH, "path", KeyEnvironment.KEYDOWNLOADSIZE, "progress");
    }

    public String updateProgressAndSize(Tree<HashMap<String, Object>> tree, String str, HashMap<String, Object> hashMap, String str2, String str3, long j, String str4) {
        TreeData treeData = new TreeData();
        return str4.equals("DaoXueBenNew") ? treeData.updateDxProgressAndSize(tree, str, hashMap, str2, str3, j, str4, KeyEnvironment.KEYWEBPATH, "path", KeyEnvironment.KEYDOWNLOADSIZE, "progress") : treeData.updateProgressAndSize(tree, str, hashMap, str2, str3, j, str4, KeyEnvironment.KEYWEBPATH, "path", KeyEnvironment.KEYDOWNLOADSIZE, "progress");
    }

    public ArrayList<HashMap<String, String>> updateTree(Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> tree2, String str, String str2, String str3, String str4) {
        ArrayList<HashMap<String, String>> arrayList = new ArrayList<>();
        TreeData treeData = new TreeData();
        if (tree2 != null) {
            treeData.updateJsonTree(tree, tree2, str2, str3, null);
        }
        treeData.getNeedDownloadList(tree, str, str2, str3, arrayList);
        createJson(tree, str4);
        return arrayList;
    }
}
