package com.edutech.json;

import android.util.Log;
import com.edutech.idauthentication.AppEnvironment;
import com.edutech.idauthentication.FileInOutHelper;
import com.edutech.idauthentication.JsonHelper;
import com.edutech.publicedu.log.LogHelp;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public class TreeData {
    private CommonJSONParser common = new CommonJSONParser();

    public void changeTreeData(Tree<HashMap<String, Object>> tree, HashMap<String, Object> oldHead, Object object, String key) {
        Tree<HashMap<String, Object>> newTree = tree.getTree(oldHead);
        if (newTree != null) {
            newTree.removeHead(oldHead);
            oldHead.put(key, object);
            newTree.setHead(oldHead);
            return;
        }
        oldHead.put(key, object);
    }

    public void updateJsonTree(Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> localtree, String key, String appName, ArrayList<HashMap<String, String>> needDownloadList) {
        if (tree != null && localtree != null && tree.getHead() != null && localtree.getHead() != null) {
            String headid = tree.getHead().get(key).toString();
            String localheadid = localtree.getHead().get(key).toString();
            if (headid.equals(localheadid)) {
                ArrayList<String> localIdParentList = new ArrayList<>();
                localIdParentList.add(localheadid);
                compareData(tree, localtree, tree.getHead(), localtree.getHead(), localIdParentList, key, appName, needDownloadList);
            }
        }
    }

    private void compareData(Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> idtree, HashMap<String, Object> head, HashMap<String, Object> idhead, ArrayList<String> idParentList, String key, String appName, ArrayList<HashMap<String, String>> needDownloadList) {
        Collection<HashMap<String, Object>> idSuccessors = idtree.getSuccessors(idhead);
        for (HashMap<String, Object> tempidSuccessors : idSuccessors) {
            if (tempidSuccessors.get(key) != null) {
                idParentList.add(tempidSuccessors.get(key).toString());
                ArrayList<Object> idObjectList = new ArrayList<>();
                if (needDownloadList != null && tempidSuccessors.get("data") != null) {
                    idObjectList = getValueList(idObjectList, tempidSuccessors.get("data"));
                } else if (needDownloadList == null && tempidSuccessors.get(getDataName(appName)) != null) {
                    idObjectList = getValueList(idObjectList, tempidSuccessors.get(getDataName(appName)));
                }
                if (idObjectList != null && idObjectList.size() > 0) {
                    addDataToNewTree(tree, tree.getHead(), idParentList, idObjectList, key, appName, needDownloadList);
                }
                if (tempidSuccessors.get("children") != null) {
                    compareData(tree, idtree, tree.getHead(), tempidSuccessors, idParentList, key, appName, needDownloadList);
                }
                if (idParentList.size() > 0) {
                    idParentList.remove(idParentList.size() - 1);
                }
            }
        }
    }

    public void addDataToNewTree(Tree<HashMap<String, Object>> tree, HashMap<String, Object> head, ArrayList<String> idParentList, ArrayList<Object> idObjectList, String key, String appName, ArrayList<HashMap<String, String>> needDownloadList) {
        ArrayList<Object> dataObjectList;
        ArrayList<Object> dataObjectList2;
        if (tree != null && head != null && head.get(key) != null && idObjectList != null && idParentList != null && idParentList.size() > 0 && head.get(key).toString().equals(idParentList.get(0))) {
            String book_id = head.get(key).toString();
            for (int i = 1; i < idParentList.size(); i++) {
                Collection<HashMap<String, Object>> Successors = tree.getSuccessors(head);
                Iterator<HashMap<String, Object>> it = Successors.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    HashMap<String, Object> tempSuccessors = it.next();
                    if (tempSuccessors.get(key) != null && tempSuccessors.get(key).toString().equals(idParentList.get(i))) {
                        head = tempSuccessors;
                        if (i == idParentList.size() - 1) {
                            Object newDataObject = null;
                            ArrayList<Object> dataObjectList3 = new ArrayList<>();
                            idObjectList = addNewKeys(idObjectList, appName);
                            if (tempSuccessors.get(getDataName(appName)) != null) {
                                ArrayList<Object> dataObjectList4 = getValueList(dataObjectList3, tempSuccessors.get(getDataName(appName)));
                                if (appName.equals(AppEnvironment.LessonPlanning)) {
                                    dataObjectList2 = appendPlanIdObject(book_id, idParentList, dataObjectList4, idObjectList, appName, needDownloadList);
                                } else {
                                    dataObjectList2 = appendObject(book_id, idParentList, dataObjectList4, idObjectList, appName, needDownloadList);
                                }
                                if (dataObjectList2 != null && dataObjectList2.size() > 0) {
                                    newDataObject = JsonCreate.toJSONArrayObject(dataObjectList2);
                                }
                            } else {
                                if (appName.equals(AppEnvironment.LessonPlanning)) {
                                    dataObjectList = appendPlanIdObject(book_id, idParentList, dataObjectList3, idObjectList, appName, needDownloadList);
                                } else {
                                    dataObjectList = appendObject(book_id, idParentList, dataObjectList3, idObjectList, appName, needDownloadList);
                                }
                                if (dataObjectList != null && dataObjectList.size() > 0) {
                                    newDataObject = JsonCreate.toJSONArrayObject(dataObjectList);
                                }
                            }
                            if (newDataObject != null) {
                                changeTreeData(tree, tempSuccessors, newDataObject, getDataName(appName));
                            }
                        }
                    }
                }
            }
        }
    }

    public void createSubTrees(Tree<HashMap<String, Object>> tree, HashMap<String, Object> tempSuccessors) {
        ArrayList<Object> datalist = null;
        try {
            datalist = this.common.parseJSONArray((JSONArray) tempSuccessors.get("children"));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        ArrayList<HashMap<String, Object>> parentlist = new ArrayList<>();
        parentlist.add(tempSuccessors);
        if (datalist != null) {
            Iterator<Object> it = datalist.iterator();
            while (it.hasNext()) {
                Object children = it.next();
                JsonParse.childrenlist(tree, parentlist, this.common, children, "children");
            }
        }
        tree.getSuccessors(tempSuccessors);
    }

    public ArrayList<HashMap<String, String>> getNeedDownloadList(Tree<HashMap<String, Object>> tree, String downloadJson, String key, String appName, ArrayList<HashMap<String, String>> needDownloadList) {
        Tree<HashMap<String, Object>> idtree = JsonParse.parsejson(null, downloadJson, "children", "children");
        if (idtree != null && idtree.getHead() != null) {
            updateJsonTree(tree, idtree, key, appName, needDownloadList);
        }
        return needDownloadList;
    }

    private ArrayList<Object> addNewKeys(ArrayList<Object> dataObjectList, String appName) {
        HashMap<String, Object> tempDataMap;
        String key = getDataIdKey(appName);
        int i = 0;
        Iterator<Object> it = dataObjectList.iterator();
        while (it.hasNext()) {
            Object tempdataobject = it.next();
            if (tempdataobject != null && (tempDataMap = JsonParse.geteObjectToMap(tempdataobject)) != null && tempDataMap.get(key) != null) {
                if (tempDataMap.get(KeyEnvironment.KEYWEBPATH) != null && (appName.equals("WrongQuestionSet") || appName.equals(AppEnvironment.GeRenChengZhang))) {
                    addNewKeysChange(tempDataMap, dataObjectList, false, appName, i);
                }
                if (tempDataMap.get("items") != null && appName.equals(AppEnvironment.LessonPlanning)) {
                    addNewKeysLessonPlan(tempDataMap, dataObjectList, false, appName, i);
                }
                if (appName.equals(AppEnvironment.Homework) || appName.equals(AppEnvironment.MyExaminationPaper)) {
                    addNewKeysChange(tempDataMap, dataObjectList, false, appName, i);
                }
            }
            i++;
        }
        return dataObjectList;
    }

    public void addNewKeysChange(HashMap<String, Object> tempDataMap, ArrayList<Object> dataObjectList, boolean isChange, String appName, int i) {
        Object Newobejct;
        ArrayList<Object> quesObjectList;
        if (appName.equals(AppEnvironment.GeRenChengZhang) || appName.equals("WrongQuestionSet")) {
            if (tempDataMap.get("isdown") == null) {
                isChange = true;
                tempDataMap.put("isdown", true);
            }
            isChange = insertProDownsize(tempDataMap, isChange, KeyEnvironment.KEYWEBPATH, "progress", KeyEnvironment.KEYDOWNLOADSIZE);
            if (tempDataMap.get("questionprogress") == null) {
                isChange = true;
                tempDataMap.put("questionprogress", "0");
            }
        } else if (appName.equals(AppEnvironment.Homework) || appName.equals(AppEnvironment.MyExaminationPaper)) {
            if (tempDataMap.get("isdown") == null) {
                isChange = true;
                tempDataMap.put("isdown", true);
            }
            isChange = insertProDownsize(tempDataMap, isChange, KeyEnvironment.KEYWEBPATH, "progress", KeyEnvironment.KEYDOWNLOADSIZE);
            if (tempDataMap.get("attwebpath") != null) {
                isChange = insertProDownsize(tempDataMap, isChange, "attwebpath", "attprogress", "attdownloadsize");
            }
            if (tempDataMap.get("homeworkprogress") == null) {
                isChange = true;
                if (isNullWebpath(tempDataMap, KeyEnvironment.KEYWEBPATH)) {
                    tempDataMap.put("homeworkprogress", "100");
                } else {
                    tempDataMap.put("homeworkprogress", "0");
                }
            }
            boolean isqProgress = true;
            if (tempDataMap.get("question") != null && (quesObjectList = getValueList(new ArrayList<>(), tempDataMap.get("question"))) != null && quesObjectList.size() > 0) {
                for (int j = 0; j < quesObjectList.size(); j++) {
                    HashMap<String, Object> quesObjectMap = JsonParse.geteObjectToMap(quesObjectList.get(j));
                    if (quesObjectMap.get("questionid") != null) {
                        isChange = insertProDownsize(quesObjectMap, insertProDownsize(quesObjectMap, isChange, KeyEnvironment.KEYWEBPATH, "progress", KeyEnvironment.KEYDOWNLOADSIZE), "qwebpath", "qprogress", "qdownloadsize");
                        isqProgress = isNullWebpath(quesObjectMap, "qwebpath");
                        if (quesObjectMap.get("questionprogress") == null) {
                            isChange = true;
                            if (isNullWebpath(quesObjectMap, KeyEnvironment.KEYWEBPATH)) {
                                quesObjectMap.put("questionprogress", "100");
                            } else {
                                quesObjectMap.put("questionprogress", "0");
                            }
                        }
                        if (isChange) {
                            Object quesnewObject = JsonCreate.MaptoJSONObject(quesObjectMap);
                            quesObjectList.remove(j);
                            quesObjectList.add(j, quesnewObject);
                            Object quesArrayObject = JsonCreate.toJSONArrayObject(quesObjectList);
                            tempDataMap.put("question", quesArrayObject);
                        }
                    }
                }
            }
            if (tempDataMap.get("qprogress") == null) {
                isChange = true;
                if (isqProgress) {
                    tempDataMap.put("qprogress", "100");
                } else {
                    tempDataMap.put("qprogress", "0");
                }
            }
        }
        if (isChange && (Newobejct = JsonCreate.MaptoJSONObject(tempDataMap)) != null) {
            dataObjectList.remove(i);
            dataObjectList.add(i, Newobejct);
        }
    }

    private boolean isNullWebpath(HashMap<String, Object> tempDataMap, String keyWebpath) {
        if (tempDataMap.get(keyWebpath) == null) {
            return false;
        }
        ArrayList<Object> webpathList = getValueList(new ArrayList<>(), tempDataMap.get(keyWebpath));
        if (webpathList != null && (webpathList == null || webpathList.size() != 0)) {
            return false;
        }
        return true;
    }

    private boolean insertProDownsize(HashMap<String, Object> tempDataMap, boolean isChange, String keyWebpath, String keyProgress, String keyDownloadsize) {
        ArrayList<Object> webpathList;
        if (tempDataMap.get(keyWebpath) != null && (webpathList = getValueList(new ArrayList<>(), tempDataMap.get(keyWebpath))) != null && webpathList.size() > 0 && (tempDataMap.get(keyProgress) == null || tempDataMap.get(keyDownloadsize) == null)) {
            isChange = true;
            ArrayList<Object> progressList = new ArrayList<>();
            ArrayList<Object> downloadsizeList = new ArrayList<>();
            for (int j = 0; j < webpathList.size(); j++) {
                progressList.add("0");
                downloadsizeList.add(0);
            }
            tempDataMap.put(keyProgress, JsonCreate.toJSONArrayObject(progressList));
            tempDataMap.put(keyDownloadsize, JsonCreate.toJSONArrayObject(downloadsizeList));
        }
        return isChange;
    }

    public void addNewKeysLessonPlan(HashMap<String, Object> tempDataMap, ArrayList<Object> dataObjectList, boolean isChange, String appName, int i) {
        String webpath;
        ArrayList<Object> itemsObjectList = getValueList(new ArrayList<>(), tempDataMap.get("items"));
        if (itemsObjectList != null && itemsObjectList.size() > 0) {
            for (int j = 0; j < itemsObjectList.size(); j++) {
                HashMap<String, Object> tempItemMap = JsonParse.geteObjectToMap(itemsObjectList.get(j));
                if (tempItemMap.get(KeyEnvironment.KEYWEBPATH) != null && (webpath = tempItemMap.get(KeyEnvironment.KEYWEBPATH).toString()) != null && !"".equals(webpath) && (tempItemMap.get("progress") == null || tempItemMap.get(KeyEnvironment.KEYDOWNLOADSIZE) == null)) {
                    isChange = true;
                    tempItemMap.put("progress", "0");
                    tempItemMap.put(KeyEnvironment.KEYDOWNLOADSIZE, 0L);
                    Object NewItemobejct = JsonCreate.MaptoJSONObject(tempItemMap);
                    if (NewItemobejct != null) {
                        itemsObjectList.remove(j);
                        itemsObjectList.add(j, NewItemobejct);
                    }
                }
            }
            if (isChange) {
                Object arrayitemObject = JsonCreate.toJSONArrayObject(itemsObjectList);
                tempDataMap.put("items", arrayitemObject);
                Object newobject = JsonCreate.MaptoJSONObject(tempDataMap);
                dataObjectList.remove(i);
                dataObjectList.add(i, newobject);
            }
        }
    }

    public ArrayList<HashMap<String, String>> getAllBookNeedDownList(ArrayList<HashMap<String, String>> downloadlist, String booksJsonPath, String offlineDownloadDir, String studentId, String appName) {
        ArrayList<Books> books = new ArrayList<>();
        Iterator<Books> it = JsonParse.parseBooksJson(books, booksJsonPath).iterator();
        while (it.hasNext()) {
            Books tempBook = it.next();
            String bookid = tempBook.getbook_id();
            tempBook.getbook_path();
            if (bookid != null && !"".equals(bookid)) {
                String bookfilepath = String.valueOf(offlineDownloadDir) + bookid + "/" + studentId + "/";
                if (appName.equals("DaoXueBenNew") || appName.equals("DaoXueBen") || appName.equals("ZuoYeFuDao")) {
                    bookfilepath = String.valueOf(offlineDownloadDir) + bookid + "/";
                }
                File bookfiledir = new File(bookfilepath);
                if (bookfiledir.exists()) {
                    String bookjsonfilepath = String.valueOf(bookfilepath) + "json.json";
                    File bookjsonfile = new File(bookjsonfilepath);
                    if (bookjsonfile.exists()) {
                        if (appName.equals(AppEnvironment.Homework) || appName.equals(AppEnvironment.MyExaminationPaper)) {
                            downloadlist = getBookExamDownList(downloadlist, tempBook, bookjsonfilepath, appName);
                        } else {
                            downloadlist = getBookDownList(downloadlist, tempBook, bookjsonfilepath, appName);
                        }
                    }
                }
            }
        }
        return downloadlist;
    }

    private ArrayList<HashMap<String, String>> getBookDownList(ArrayList<HashMap<String, String>> downloadlist, Books book, String bookjsonfilepath, String appName) {
        String json = JsonHelper.getFileString(bookjsonfilepath);
        Tree<HashMap<String, Object>> tree = JsonParse.parsejson(null, json, "data", "children");
        if (tree != null && tree.getHead() != null && tree.getHead().get("id") != null) {
            String bookId = tree.getHead().get("id").toString();
            return getDownList(bookId, bookId, tree, tree.getHead(), downloadlist, "children", appName);
        }
        return downloadlist;
    }

    private ArrayList<HashMap<String, String>> getDownList(String bookId, String sourceId, Tree<HashMap<String, Object>> tree, HashMap<String, Object> head, ArrayList<HashMap<String, String>> downloadlist, String children, String appName) {
        ArrayList<Object> dataObjectList;
        Collection<HashMap<String, Object>> Successors = tree.getSuccessors(head);
        for (HashMap<String, Object> tempSuccessors : Successors) {
            if (tempSuccessors.get("id") != null) {
                String id = tempSuccessors.get("id").toString();
                String sourceId2 = String.valueOf(sourceId) + "_" + id;
                if (appName.equals("DaoXueBen")) {
                    addDaoToDownloadList(bookId, sourceId2, tempSuccessors, downloadlist, appName);
                } else if (appName.equals("DaoXueBenNew")) {
                    addNewDaoToDownloadList(bookId, sourceId2, tempSuccessors, downloadlist, appName);
                } else {
                    ArrayList<Object> dataObjectList2 = new ArrayList<>();
                    if (tempSuccessors.get(getDataName(appName)) != null && (dataObjectList = getValueList(dataObjectList2, tempSuccessors.get(getDataName(appName)))) != null && dataObjectList.size() > 0) {
                        addToDownloadList(bookId, sourceId2, dataObjectList, downloadlist, appName);
                    }
                }
                if (tempSuccessors.get(children) != null) {
                    getDownList(bookId, sourceId2, tree, tempSuccessors, downloadlist, children, appName);
                }
                sourceId = removeSourceId(sourceId2);
            }
        }
        return downloadlist;
    }

    private ArrayList<HashMap<String, String>> addDaoToDownloadList(String bookId, String sourceId, HashMap<String, Object> tempSuccessors, ArrayList<HashMap<String, String>> downloadlist, String appName) {
        ArrayList<Object> dataObjectList;
        boolean boolisdown = false;
        if (tempSuccessors.get("isdown") != null) {
            try {
                boolisdown = ((Boolean) tempSuccessors.get("isdown")).booleanValue();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (boolisdown) {
            downloadlist = updateDownloadlist(bookId, sourceId, tempSuccessors, downloadlist, "size", KeyEnvironment.KEYWEBPATH, "path", "progress");
            ArrayList<Object> dataObjectList2 = new ArrayList<>();
            if (tempSuccessors.get(getDataName(appName)) != null && (dataObjectList = getValueList(dataObjectList2, tempSuccessors.get(getDataName(appName)))) != null && dataObjectList.size() > 0) {
                Iterator<Object> it = dataObjectList.iterator();
                while (it.hasNext()) {
                    Object tempdataobject = it.next();
                    addToneedDownloadList(bookId, sourceId, tempdataobject, downloadlist, appName);
                    HashMap<String, Object> tempDataMap = JsonParse.geteObjectToMap(tempdataobject);
                    if (tempDataMap != null) {
                        downloadlist = updateDownloadlist(bookId, sourceId, tempDataMap, downloadlist, "sizes", KeyEnvironment.KEYWEBPATH, "path", "progress");
                    }
                }
            }
        }
        return downloadlist;
    }

    private ArrayList<HashMap<String, String>> addNewDaoToDownloadList(String bookId, String sourceId, HashMap<String, Object> tempSuccessors, ArrayList<HashMap<String, String>> downloadlist, String appName) {
        ArrayList<Object> dxitemsobjectList;
        ArrayList<Object> dataObjectList;
        if (tempSuccessors != null && tempSuccessors.get("dxitems") != null && (dxitemsobjectList = getValueList(new ArrayList<>(), tempSuccessors.get("dxitems"))) != null && dxitemsobjectList.size() > 0) {
            for (int i = 0; i < dxitemsobjectList.size(); i++) {
                HashMap<String, Object> tempMap = JsonParse.geteObjectToMap(dxitemsobjectList.get(i));
                if (tempMap != null && tempMap.get("dxid") != null && tempMap.get("isdown") != null) {
                    boolean isdown = false;
                    try {
                        isdown = ((Boolean) tempMap.get("isdown")).booleanValue();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    if (isdown) {
                        String newSourceId = String.valueOf(sourceId) + "_" + tempMap.get("dxid").toString();
                        downloadlist = updateDownloadlist(bookId, newSourceId, tempMap, downloadlist, "size", KeyEnvironment.KEYWEBPATH, "path", "progress");
                        ArrayList<Object> dataObjectList2 = new ArrayList<>();
                        if (tempMap.get(getDataName(appName)) != null && (dataObjectList = getValueList(dataObjectList2, tempMap.get(getDataName(appName)))) != null && dataObjectList.size() > 0) {
                            Iterator<Object> it = dataObjectList.iterator();
                            while (it.hasNext()) {
                                Object tempdataobject = it.next();
                                HashMap<String, Object> tempDataMap = JsonParse.geteObjectToMap(tempdataobject);
                                if (tempDataMap != null) {
                                    downloadlist = updateDownloadlist(bookId, newSourceId, tempDataMap, downloadlist, "sizes", KeyEnvironment.KEYWEBPATH, "path", "progress");
                                }
                            }
                        }
                    }
                }
            }
        }
        return downloadlist;
    }

    private ArrayList<HashMap<String, String>> addToDownloadList(String bookId, String sourceId, ArrayList<Object> dataObjectList, ArrayList<HashMap<String, String>> downloadlist, String appName) {
        Iterator<Object> it = dataObjectList.iterator();
        while (it.hasNext()) {
            Object tempdataobject = it.next();
            addToneedDownloadList(bookId, sourceId, tempdataobject, downloadlist, appName);
        }
        return downloadlist;
    }

    private ArrayList<HashMap<String, String>> addToneedDownloadList(String bookId, String sourceId, Object dataObject, ArrayList<HashMap<String, String>> downloadlist, String appName) {
        String sourceId2;
        ArrayList<Object> itemsObjectList;
        String key = getDataIdKey(appName);
        HashMap<String, Object> tempDataMap = JsonParse.geteObjectToMap(dataObject);
        if (tempDataMap != null && tempDataMap.get(key) != null) {
            if ("".equals(sourceId)) {
                sourceId2 = tempDataMap.get(key).toString();
            } else {
                sourceId2 = String.valueOf(sourceId) + "_" + tempDataMap.get(key).toString();
            }
            if (appName.equals("ZuoYeFuDao")) {
                boolean boolisdown = false;
                if (tempDataMap.get("isdown") != null) {
                    try {
                        boolisdown = ((Boolean) tempDataMap.get("isdown")).booleanValue();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (boolisdown) {
                    return updateDownloadlist(bookId, sourceId2, tempDataMap, downloadlist, getSizeKey(appName), KeyEnvironment.KEYWEBPATH, "path", "progress");
                }
                return downloadlist;
            } else if (appName.equals("WrongQuestionSet")) {
                return updateDownloadlist(bookId, sourceId2, tempDataMap, downloadlist, getSizeKey(appName), KeyEnvironment.KEYWEBPATH, "path", "progress");
            } else {
                if (appName.equals(AppEnvironment.Homework) || appName.equals(AppEnvironment.MyExaminationPaper)) {
                    ArrayList<HashMap<String, String>> downloadlist2 = updateDownloadlist(bookId, sourceId2, tempDataMap, downloadlist, getSizeKey(appName), KeyEnvironment.KEYWEBPATH, "path", "progress");
                    if (tempDataMap.get("attwebpath") != null && tempDataMap.get("attpath") != null) {
                        downloadlist2 = updateDownloadlist(bookId, sourceId2, tempDataMap, downloadlist2, "attsize", "attwebpath", "attpath", "attprogress");
                    }
                    return addQuestionListToDownloadList(bookId, sourceId2, tempDataMap, downloadlist2);
                } else if (appName.equals(AppEnvironment.LessonPlanning)) {
                    ArrayList<Object> itemsObjectList2 = new ArrayList<>();
                    if (tempDataMap.get("items") != null && (itemsObjectList = getValueList(itemsObjectList2, tempDataMap.get("items"))) != null && itemsObjectList.size() > 0) {
                        Iterator<Object> it = itemsObjectList.iterator();
                        while (it.hasNext()) {
                            Object itemObject = it.next();
                            addPlanToneedDownloadList(bookId, sourceId2, itemObject, downloadlist, appName);
                        }
                        return downloadlist;
                    }
                    return downloadlist;
                } else {
                    return downloadlist;
                }
            }
        }
        return downloadlist;
    }

    private ArrayList<HashMap<String, String>> addQuestionListToDownloadList(String bookId, String sourceId, HashMap<String, Object> tempDataMap, ArrayList<HashMap<String, String>> downloadlist) {
        ArrayList<Object> quesObjectList;
        if (tempDataMap.get("question") != null && (quesObjectList = getValueList(new ArrayList<>(), tempDataMap.get("question"))) != null && quesObjectList.size() > 0) {
            for (int j = 0; j < quesObjectList.size(); j++) {
                HashMap<String, Object> quesObjectMap = JsonParse.geteObjectToMap(quesObjectList.get(j));
                if (quesObjectMap.get("questionid") != null) {
                    downloadlist = updateDownloadlist(bookId, sourceId, quesObjectMap, updateDownloadlist(bookId, sourceId, quesObjectMap, downloadlist, "size", KeyEnvironment.KEYWEBPATH, "path", "progress"), "qsize", "qwebpath", "qpath", "qprogress");
                }
            }
        }
        return downloadlist;
    }

    private ArrayList<HashMap<String, String>> updateDownloadlist(String bookId, String sourceId, HashMap<String, Object> tempDataMap, ArrayList<HashMap<String, String>> downloadlist, String sizekey, String keyWebpath, String keyPath, String keyProgress) {
        if (tempDataMap.get(keyWebpath) != null && tempDataMap.get(keyPath) != null && tempDataMap.get(keyProgress) != null && tempDataMap.get(sizekey) != null) {
            ArrayList<Object> webpathList = new ArrayList<>();
            ArrayList<Object> pathList = new ArrayList<>();
            ArrayList<Object> progressList = new ArrayList<>();
            ArrayList<Object> sizeList = new ArrayList<>();
            ArrayList<Object> webpathList2 = getValueList(webpathList, tempDataMap.get(keyWebpath));
            ArrayList<Object> pathList2 = getValueList(pathList, tempDataMap.get(keyPath));
            ArrayList<Object> progressList2 = getValueList(progressList, tempDataMap.get(keyProgress));
            ArrayList<Object> sizeList2 = getValueList(sizeList, tempDataMap.get(sizekey));
            if (webpathList2 != null && pathList2 != null && progressList2 != null && sizeList2 != null && webpathList2.size() != 0 && webpathList2.size() == pathList2.size() && pathList2.size() == progressList2.size() && progressList2.size() == sizeList2.size()) {
                for (int i = 0; i < webpathList2.size(); i++) {
                    if (!"100".equals(progressList2.get(i).toString())) {
                        String webpath = webpathList2.get(i).toString();
                        String path = pathList2.get(i).toString();
                        String progress = progressList2.get(i).toString();
                        String size = sizeList2.get(i).toString();
                        downloadlist = hashToDownloadlist(downloadlist, bookId, sourceId, webpath, path, progress, size);
                    }
                }
            }
        }
        return downloadlist;
    }

    private ArrayList<HashMap<String, String>> updateLessonPlanDownloadlist(String bookId, String sourceId, HashMap<String, Object> tempDataMap, ArrayList<HashMap<String, String>> downloadlist, String sizekey) {
        if (tempDataMap.get(KeyEnvironment.KEYWEBPATH) != null && tempDataMap.get("path") != null && tempDataMap.get("progress") != null && tempDataMap.get(sizekey) != null) {
            String webpath = tempDataMap.get(KeyEnvironment.KEYWEBPATH).toString();
            String path = tempDataMap.get("path").toString();
            String progress = tempDataMap.get("progress").toString();
            String size = tempDataMap.get(sizekey).toString();
            if (!"100".equals(progress)) {
                return hashToDownloadlist(downloadlist, bookId, sourceId, webpath, path, progress, size);
            }
            return downloadlist;
        }
        return downloadlist;
    }

    private ArrayList<HashMap<String, String>> hashToDownloadlist(ArrayList<HashMap<String, String>> downloadlist, String bookId, String sourceId, String webpath, String path, String progress, String size) {
        HashMap<String, String> downInfo = new HashMap<>();
        downInfo.put("book_id", bookId);
        downInfo.put("source_id", sourceId);
        downInfo.put("source_webpath", webpath);
        downInfo.put("source_path", path);
        downInfo.put("source_progress", progress);
        downInfo.put("source_size", size);
        downloadlist.add(downInfo);
        return downloadlist;
    }

    public ArrayList<Object> parseValueList(Object dataObject) {
        CommonJSONParser common = new CommonJSONParser();
        try {
            ArrayList<Object> objectList = common.parseJSONArray((JSONArray) dataObject);
            return objectList;
        } catch (JSONException e) {
            e.printStackTrace();
            return null;
        } catch (Exception e2) {
            e2.printStackTrace();
            return null;
        }
    }

    public String removeSourceId(String sourceId) {
        if (sourceId.lastIndexOf("_") != -1) {
            return sourceId.substring(0, sourceId.lastIndexOf("_"));
        }
        return "";
    }

    public ArrayList<String> deleteSourceFile(String deletejson, String offlineDownloadDir, String studentId, ArrayList<String> sourceIdList, String key, String appName) {
        Tree<HashMap<String, Object>> deletetree = JsonParse.parsejson(null, deletejson, "children", "children");
        if (deletetree != null && deletetree.getHead() != null) {
            String bookId = deletetree.getHead().get(key).toString();
            String bookJsonPath = String.valueOf(offlineDownloadDir) + bookId + "/" + studentId + "/json.json";
            File bookJsonFile = new File(bookJsonPath);
            if (bookJsonFile.exists()) {
                String json = JsonHelper.getFileString(bookJsonPath);
                Tree<HashMap<String, Object>> tree = JsonParse.parsejson(null, json, "data", "children");
                if (tree != null && tree.getHead() != null && tree.getHead().get(key) != null && bookId.equals(tree.getHead().get(key).toString())) {
                    ArrayList<String> idList = new ArrayList<>();
                    idList.add(bookId);
                    getSourceIdList(bookId, idList, tree, deletetree, tree.getHead(), deletetree.getHead(), sourceIdList, key, appName, offlineDownloadDir, studentId);
                    String newjson = JsonCreate.createjson(tree);
                    JsonCreate.saveJsonToLocal(newjson, bookJsonPath);
                }
            }
        }
        return sourceIdList;
    }

    private void getSourceIdList(String bookid, ArrayList<String> idList, Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> idtree, HashMap<String, Object> head, HashMap<String, Object> idhead, ArrayList<String> sourceIdList, String key, String appName, String offlineDownloadDir, String studentId) {
        Collection<HashMap<String, Object>> idSuccessors = idtree.getSuccessors(idhead);
        if (idSuccessors != null && idSuccessors.size() > 0) {
            for (HashMap<String, Object> tempidSuccessors : idSuccessors) {
                if (tempidSuccessors.get(key) != null) {
                    String id = tempidSuccessors.get(key).toString();
                    idList.add(id);
                    if (tempidSuccessors.get("children") != null) {
                        getSourceIdList(bookid, idList, tree, idtree, tree.getHead(), tempidSuccessors, sourceIdList, key, appName, offlineDownloadDir, studentId);
                    } else if (tempidSuccessors.get("data") != null) {
                        head = getdeleteSourceHead(idList, tree, head, key);
                        if (head != null) {
                            removeSourceData(bookid, idList, tree, head, sourceIdList, tempidSuccessors.get("data"), appName, offlineDownloadDir, studentId);
                        }
                    } else {
                        head = getdeleteSourceHead(idList, tree, head, key);
                        if (head != null) {
                            sourceIdList = deleteNoData(bookid, idList, tree, head, sourceIdList, key, appName, offlineDownloadDir, studentId);
                        }
                    }
                }
            }
            if (idList.size() > 0) {
                idList.remove(idList.size() - 1);
            }
        } else if (idtree.getHead().get("data") == null) {
            HashMap<String, Object> head2 = getdeleteSourceHead(idList, tree, head, key);
            if (head2 != null) {
                deleteNoData(bookid, idList, tree, head2, sourceIdList, key, appName, offlineDownloadDir, studentId);
            }
        } else {
            removeSourceData(bookid, idList, tree, head, sourceIdList, idtree.getHead().get("data"), appName, offlineDownloadDir, studentId);
        }
    }

    private HashMap<String, Object> getdeleteSourceHead(ArrayList<String> idList, Tree<HashMap<String, Object>> tree, HashMap<String, Object> head, String key) {
        if (idList.size() == 0) {
            return null;
        }
        if (idList.size() == 1) {
            return tree.getHead();
        }
        for (int i = 1; i < idList.size(); i++) {
            Collection<HashMap<String, Object>> Successors = tree.getSuccessors(head);
            for (HashMap<String, Object> tempSuccessors : Successors) {
                if (tempSuccessors.get(key) != null && idList.get(i).equals(tempSuccessors.get(key).toString())) {
                    head = tempSuccessors;
                    if (i == idList.size() - 1) {
                        return tempSuccessors;
                    }
                }
            }
        }
        return null;
    }

    private ArrayList<String> olddeleteNoData(String bookid, ArrayList<String> idList, Tree<HashMap<String, Object>> tree, HashMap<String, Object> head, ArrayList<String> sourceIdList, String key, String appName, String offlineDownloadDir, String studentId) {
        Collection<HashMap<String, Object>> Successors = tree.getSuccessors(head);
        for (HashMap<String, Object> tempSuccessors : Successors) {
            if (tempSuccessors.get(key) != null) {
                tempSuccessors.get(key).toString();
                if (tempSuccessors.get(getDataName(appName)) != null) {
                    ArrayList<Object> questionlist = new ArrayList<>();
                    Object newObject = JsonCreate.toJSONArrayObject(questionlist);
                    changeTreeData(tree, tempSuccessors, newObject, getDataName(appName));
                }
                olddeleteNoData(bookid, idList, tree, tempSuccessors, sourceIdList, key, appName, offlineDownloadDir, studentId);
            }
        }
        return sourceIdList;
    }

    private ArrayList<String> deleteNoData(String bookid, ArrayList<String> idList, Tree<HashMap<String, Object>> tree, HashMap<String, Object> head, ArrayList<String> sourceIdList, String key, String appName, String offlineDownloadDir, String studentId) {
        removeSourceNoData(bookid, idList, head, sourceIdList, appName, offlineDownloadDir, studentId);
        Collection<HashMap<String, Object>> Successors = tree.getSuccessors(head);
        for (HashMap<String, Object> tempSuccessors : Successors) {
            if (tempSuccessors.get(key) != null) {
                String id = tempSuccessors.get(key).toString();
                idList.add(id);
                deleteNoData(bookid, idList, tree, tempSuccessors, sourceIdList, key, appName, offlineDownloadDir, studentId);
            }
        }
        if (idList.size() > 0) {
            idList.remove(idList.size() - 1);
        }
        return sourceIdList;
    }

    private void removeSourceNoData(String bookid, ArrayList<String> idList, HashMap<String, Object> head, ArrayList<String> sourceIdList, String appName, String offlineDownloadDir, String studentId) {
        ArrayList<Object> dataObjectList = new ArrayList<>();
        String deleteFileDir = String.valueOf(offlineDownloadDir) + "/" + bookid + "/" + studentId + "/";
        File deleteDirFile = new File(deleteFileDir);
        if (deleteDirFile.exists() && head.get(getDataName(appName)) != null) {
            ArrayList<Object> dataObjectList2 = getValueList(dataObjectList, head.get(getDataName(appName)));
            if (dataObjectList2 != null && dataObjectList2.size() > 0) {
                Iterator<Object> it = dataObjectList2.iterator();
                while (it.hasNext()) {
                    Object tempdataobject = it.next();
                    HashMap<String, Object> tempDataMap = JsonParse.geteObjectToMap(tempdataobject);
                    if (tempDataMap.get("id") != null) {
                        String sourceId = appendid(idList);
                        if ("".equals(sourceId)) {
                            sourceIdList.add(tempDataMap.get("id").toString());
                        } else {
                            sourceIdList.add(String.valueOf(sourceId) + "_" + tempDataMap.get("id").toString());
                        }
                        if (tempDataMap.get("items") != null) {
                            getPlanPath(offlineDownloadDir, bookid, studentId, tempDataMap, null);
                        } else {
                            getdeletePath(tempDataMap, offlineDownloadDir, bookid, studentId, "path");
                            deleteExamPath(tempDataMap, offlineDownloadDir, bookid, studentId, appName);
                        }
                    }
                }
            }
            head.remove(getDataName(appName));
        }
    }

    private void removeSourceData(String bookid, ArrayList<String> idList, Tree<HashMap<String, Object>> tree, HashMap<String, Object> head, ArrayList<String> sourceIdList, Object data, String appName, String offlineDownloadDir, String studentId) {
        HashMap<String, Object> dataMap;
        ArrayList<Object> dataObjectList = new ArrayList<>();
        String deleteFileDir = String.valueOf(offlineDownloadDir) + "/" + bookid + "/" + studentId + "/";
        File deleteDirFile = new File(deleteFileDir);
        if (deleteDirFile.exists() && head.get(getDataName(appName)) != null && data != null) {
            ArrayList<Object> sourcedataList = getValueList(new ArrayList<>(), data);
            if (sourcedataList.size() > 0 && (dataMap = JsonParse.geteObjectToMap(sourcedataList.get(0))) != null && dataMap.get("id") != null) {
                String deletesourceid = dataMap.get("id").toString();
                ArrayList<Object> dataObjectList2 = getValueList(dataObjectList, head.get(getDataName(appName)));
                if (dataObjectList2 != null && dataObjectList2.size() > 0) {
                    for (int m = 0; m < dataObjectList2.size(); m++) {
                        Object tempdataobject = dataObjectList2.get(m);
                        HashMap<String, Object> tempDataMap = JsonParse.geteObjectToMap(tempdataobject);
                        String IdKey = getDataIdKey(appName);
                        if (tempDataMap.get(IdKey) != null && deletesourceid.equals(tempDataMap.get(IdKey))) {
                            String sourceId = appendid(idList);
                            if ("".equals(sourceId)) {
                                sourceIdList.add(tempDataMap.get(IdKey).toString());
                            } else {
                                sourceIdList.add(String.valueOf(sourceId) + "_" + tempDataMap.get(IdKey).toString());
                            }
                            if (dataMap.get(KeyEnvironment.KEYWEBPATH) == null) {
                                if (tempDataMap.get("items") != null && appName.equals(AppEnvironment.LessonPlanning)) {
                                    getPlanPath(offlineDownloadDir, bookid, studentId, tempDataMap, null);
                                } else {
                                    getdeletePath(tempDataMap, offlineDownloadDir, bookid, studentId, "path");
                                    deleteExamPath(tempDataMap, offlineDownloadDir, bookid, studentId, appName);
                                }
                                dataObjectList2.remove(tempdataobject);
                                Object newobject = JsonCreate.toJSONArrayObject(dataObjectList2);
                                changeTreeData(tree, head, newobject, getDataName(appName));
                                return;
                            }
                            String webpath = dataMap.get(KeyEnvironment.KEYWEBPATH).toString();
                            if (tempDataMap.get("items") != null) {
                                boolean ischange = getPlanPath(offlineDownloadDir, bookid, studentId, tempDataMap, webpath);
                                if (ischange) {
                                    Object newDataObject = JsonCreate.MaptoJSONObject(tempDataMap);
                                    dataObjectList2.remove(m);
                                    dataObjectList2.add(m, newDataObject);
                                    Object newobject2 = JsonCreate.toJSONArrayObject(dataObjectList2);
                                    changeTreeData(tree, head, newobject2, getDataName(appName));
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    private boolean getPlanPath(String offlineDownloadDir, String bookid, String studentId, HashMap<String, Object> tempMap, String webpath) {
        boolean ischange = false;
        ArrayList<Object> itemsObjectList = getValueList(new ArrayList<>(), tempMap.get("items"));
        if (itemsObjectList != null && itemsObjectList.size() > 0) {
            for (int j = 0; j < itemsObjectList.size(); j++) {
                HashMap<String, Object> tempItemMap = JsonParse.geteObjectToMap(itemsObjectList.get(j));
                if (tempItemMap.get("path") != null) {
                    if (webpath == null) {
                        String path = tempItemMap.get("path").toString();
                        deletePathFile(offlineDownloadDir, bookid, studentId, path);
                    } else if (tempItemMap.get(KeyEnvironment.KEYWEBPATH) != null && webpath.equals(tempItemMap.get(KeyEnvironment.KEYWEBPATH).toString())) {
                        String path2 = tempItemMap.get("path").toString();
                        deletePathFile(offlineDownloadDir, bookid, studentId, path2);
                        itemsObjectList.remove(j);
                        Object newitemobject = JsonCreate.toJSONArrayObject(itemsObjectList);
                        tempMap.put("items", newitemobject);
                        ischange = true;
                    }
                }
            }
        }
        return ischange;
    }

    private void deleteExamPath(HashMap<String, Object> tempDataMap, String offlineDownloadDir, String bookid, String studentId, String appName) {
        ArrayList<Object> examquesObjectList;
        if (tempDataMap.get("question") != null) {
            if ((appName.equals(AppEnvironment.Homework) || appName.equals(AppEnvironment.MyExaminationPaper)) && (examquesObjectList = getValueList(new ArrayList<>(), tempDataMap.get("question"))) != null && examquesObjectList.size() > 0) {
                for (int i = 0; i < examquesObjectList.size(); i++) {
                    HashMap<String, Object> quesDataMap = JsonParse.geteObjectToMap(examquesObjectList.get(i));
                    if (quesDataMap != null) {
                        getdeletePath(quesDataMap, offlineDownloadDir, bookid, studentId, "path");
                        getdeletePath(quesDataMap, offlineDownloadDir, bookid, studentId, "qpath");
                    }
                }
            }
        }
    }

    private void getdeletePath(HashMap<String, Object> tempDataMap, String offlineDownloadDir, String bookid, String studentId, String keyPath) {
        ArrayList<Object> pathList;
        if (tempDataMap.get(keyPath) != null && (pathList = getValueList(new ArrayList<>(), tempDataMap.get(keyPath))) != null && pathList.size() > 0) {
            for (int i = 0; i < pathList.size(); i++) {
                deletePathFile(offlineDownloadDir, bookid, studentId, pathList.get(i).toString());
            }
        }
    }

    private void deletePathFile(String offlineDownloadDir, String bookid, String studentId, String path) {
        String deleteFilepath = String.valueOf(offlineDownloadDir) + bookid + "/" + studentId + "/" + path;
        FileInOutHelper.deleteFile(deleteFilepath);
    }

    public String appendid(ArrayList<String> idList) {
        String sourceId = "";
        for (int i = 0; i < idList.size(); i++) {
            if (i + 1 == idList.size()) {
                sourceId = String.valueOf(sourceId) + idList.get(i);
            } else {
                sourceId = String.valueOf(sourceId) + idList.get(i) + "_";
            }
        }
        return sourceId;
    }

    public ArrayList<String> sourceidToList(String sourceId) {
        ArrayList<String> idList = new ArrayList<>();
        if (sourceId != null && !"".equals(sourceId)) {
            while (sourceId.indexOf("_") != -1) {
                int end = sourceId.indexOf("_");
                String id = sourceId.substring(0, end);
                idList.add(id);
                if (end < sourceId.length() - 1) {
                    sourceId = sourceId.substring(end + 1);
                }
            }
            if (sourceId.length() > 0) {
                idList.add(sourceId);
            }
        }
        return idList;
    }

    public HashMap<String, Object> getUpdateJsonObject(Tree<HashMap<String, Object>> tree, ArrayList<String> idList) {
        if (idList.size() > 0 && tree != null && tree.getHead() != null && tree.getHead().get("id") != null) {
            String id = tree.getHead().get("id").toString();
            String sId = idList.get(0);
            if (id.equals(sId)) {
                return getjsonObject(tree, tree.getHead(), idList);
            }
        }
        return null;
    }

    private HashMap<String, Object> getjsonObject(Tree<HashMap<String, Object>> tree, HashMap<String, Object> head, ArrayList<String> idList) {
        for (int i = 1; i < idList.size(); i++) {
            Collection<HashMap<String, Object>> Successors = tree.getSuccessors(head);
            for (HashMap<String, Object> tempSuccessors : Successors) {
                if (tempSuccessors.get("id") != null && idList.get(i).equals(tempSuccessors.get("id").toString())) {
                    tempSuccessors.get("id").toString();
                    head = tempSuccessors;
                    if (i == idList.size() - 2) {
                        return head;
                    }
                }
            }
        }
        return null;
    }

    public String updateProgressAndSize(Tree<HashMap<String, Object>> tree, String sourceId, HashMap<String, Object> tempMap, String webpath, String oldProgress, long downloadsize, String appName, String keywebpath, String keypath, String keydownloadsize, String keyprogress) {
        String totalprogress;
        String sizekey = getSizeKey(appName);
        if (tempMap.get(keywebpath) != null && tempMap.get(keypath) != null && tempMap.get(keyprogress) != null && tempMap.get(keydownloadsize) != null && tempMap.get(sizekey) != null) {
            ArrayList<Object> webpathList = new ArrayList<>();
            ArrayList<Object> pathList = new ArrayList<>();
            ArrayList<Object> progressList = new ArrayList<>();
            ArrayList<Object> sizeList = new ArrayList<>();
            ArrayList<Object> downloadsizeList = new ArrayList<>();
            ArrayList<Object> webpathList2 = getValueList(webpathList, tempMap.get(keywebpath));
            ArrayList<Object> pathList2 = getValueList(pathList, tempMap.get(keypath));
            ArrayList<Object> progressList2 = getValueList(progressList, tempMap.get(keyprogress));
            ArrayList<Object> sizeList2 = getValueList(sizeList, tempMap.get(sizekey));
            ArrayList<Object> downloadsizeList2 = getValueList(downloadsizeList, tempMap.get(keydownloadsize));
            if (webpathList2 != null && pathList2 != null && progressList2 != null && downloadsizeList2 != null && sizeList2 != null && webpathList2.size() != 0 && webpathList2.size() == pathList2.size() && pathList2.size() == progressList2.size() && progressList2.size() == downloadsizeList2.size() && downloadsizeList2.size() == sizeList2.size()) {
                boolean ischange = updateDownloadsize(tree, false, tempMap, webpathList2, progressList2, downloadsizeList2, sizeList2, webpath, oldProgress, downloadsize, appName, keydownloadsize, keyprogress);
                if (!ischange || (!appName.equals("WrongQuestionSet") && !appName.equals("ZuoYeFuDao"))) {
                    totalprogress = "-1";
                } else {
                    totalprogress = updateTotalProgress("-1", downloadsizeList2, sizeList2);
                }
                if (!ischange && appName.equals("DaoXueBen") && tempMap.get("exams") != null) {
                    return updateExamsProgress(tree, ischange, totalprogress, tempMap, webpath, oldProgress, downloadsize);
                }
                return totalprogress;
            }
        }
        return "-1";
    }

    public String updateDxProgressAndSize(Tree<HashMap<String, Object>> tree, String sourceId, HashMap<String, Object> tempMap, String webpath, String oldProgress, long downloadsize, String appName, String keywebpath, String keypath, String keydownloadsize, String keyprogress) {
        ArrayList<Object> dxitemsobjectList;
        Object newObject;
        String totalprogress = "-1";
        String sizekey = getSizeKey(appName);
        if (tempMap.get("dxitems") != null && (dxitemsobjectList = getValueList(new ArrayList<>(), tempMap.get("dxitems"))) != null && dxitemsobjectList.size() > 0) {
            int i = 0;
            while (true) {
                if (i >= dxitemsobjectList.size()) {
                    break;
                }
                boolean ischange = false;
                HashMap<String, Object> dxitemstempMap = JsonParse.geteObjectToMap(dxitemsobjectList.get(i));
                if (dxitemstempMap == null || dxitemstempMap.get("dxid") == null || !sourceId.equals(dxitemstempMap.get("dxid").toString())) {
                    i++;
                } else {
                    if (dxitemstempMap.get(keywebpath) != null && dxitemstempMap.get(keypath) != null && dxitemstempMap.get(keyprogress) != null && dxitemstempMap.get(keydownloadsize) != null && dxitemstempMap.get(sizekey) != null) {
                        ArrayList<Object> webpathList = new ArrayList<>();
                        ArrayList<Object> pathList = new ArrayList<>();
                        ArrayList<Object> progressList = new ArrayList<>();
                        ArrayList<Object> sizeList = new ArrayList<>();
                        ArrayList<Object> downloadsizeList = new ArrayList<>();
                        ArrayList<Object> webpathList2 = getValueList(webpathList, dxitemstempMap.get(keywebpath));
                        ArrayList<Object> pathList2 = getValueList(pathList, dxitemstempMap.get(keypath));
                        ArrayList<Object> progressList2 = getValueList(progressList, dxitemstempMap.get(keyprogress));
                        ArrayList<Object> sizeList2 = getValueList(sizeList, dxitemstempMap.get(sizekey));
                        ArrayList<Object> downloadsizeList2 = getValueList(downloadsizeList, dxitemstempMap.get(keydownloadsize));
                        if (webpathList2 != null && pathList2 != null && progressList2 != null && downloadsizeList2 != null && sizeList2 != null && !(ischange = updateDownloadsize(tree, false, dxitemstempMap, webpathList2, progressList2, downloadsizeList2, sizeList2, webpath, oldProgress, downloadsize, appName, keydownloadsize, keyprogress)) && appName.equals("DaoXueBenNew") && dxitemstempMap.get("exams") != null) {
                            totalprogress = updateExamsProgress(tree, ischange, totalprogress, dxitemstempMap, webpath, oldProgress, downloadsize);
                            dxitemstempMap.put("examsprogress", totalprogress);
                            ischange = true;
                        }
                    }
                    if (ischange && (newObject = JsonCreate.MaptoJSONObject(dxitemstempMap)) != null) {
                        dxitemsobjectList.remove(i);
                        dxitemsobjectList.add(i, newObject);
                    }
                }
            }
            changeTreeData(tree, tempMap, JsonCreate.toJSONArrayObject(dxitemsobjectList), "dxitems");
        }
        return totalprogress;
    }

    public void updateHMProgressAndSize(Tree<HashMap<String, Object>> tree, String sourceId, HashMap<String, Object> tempMap, String webpath, String oldProgress, long downloadsize, String appName) {
        ArrayList<Object> quesObjectList;
        boolean isChange = updateHMExamProAndSize(false, tree, sourceId, tempMap, webpath, oldProgress, downloadsize, appName, KeyEnvironment.KEYWEBPATH, "path", "progress", KeyEnvironment.KEYDOWNLOADSIZE, "size");
        if (!isChange && tempMap.get("question") != null && (quesObjectList = getValueList(new ArrayList<>(), tempMap.get("question"))) != null && quesObjectList.size() > 0) {
            for (int j = 0; j < quesObjectList.size(); j++) {
                HashMap<String, Object> quesObjectMap = JsonParse.geteObjectToMap(quesObjectList.get(j));
                if (quesObjectMap.get("questionid") != null) {
                    isChange = updateHMExamProAndSize(isChange, tree, sourceId, quesObjectMap, webpath, oldProgress, downloadsize, "ExamMp", KeyEnvironment.KEYWEBPATH, "path", "progress", KeyEnvironment.KEYDOWNLOADSIZE, "size");
                    if (isChange) {
                        Object quesnewObject = JsonCreate.MaptoJSONObject(quesObjectMap);
                        quesObjectList.remove(j);
                        quesObjectList.add(j, quesnewObject);
                        Object quesArrayObject = JsonCreate.toJSONArrayObject(quesObjectList);
                        tempMap.put("question", quesArrayObject);
                    } else {
                        isChange = updateHMExamProAndSize(isChange, tree, sourceId, quesObjectMap, webpath, oldProgress, downloadsize, "ExamImage", "qwebpath", "qpath", "qprogress", "qdownloadsize", "qsize");
                        if (isChange) {
                            Object quesnewObject2 = JsonCreate.MaptoJSONObject(quesObjectMap);
                            quesObjectList.remove(j);
                            quesObjectList.add(j, quesnewObject2);
                            Object quesArrayObject2 = JsonCreate.toJSONArrayObject(quesObjectList);
                            tempMap.put("question", quesArrayObject2);
                            String totalprogress = updateQprogress(tempMap, "0", "qprogress", "qdownloadsize", "qsize");
                            tempMap.put("qprogress", totalprogress);
                        }
                    }
                }
            }
        }
    }

    private String updateQprogress(HashMap<String, Object> tempMap, String totalprogress, String keyProgress, String keyDownloadsize, String keySize) {
        ArrayList<Object> quesObjectList = getValueList(new ArrayList<>(), tempMap.get("question"));
        if (quesObjectList != null && quesObjectList.size() > 0) {
            for (int j = 0; j < quesObjectList.size(); j++) {
                HashMap<String, Object> quesObjectMap = JsonParse.geteObjectToMap(quesObjectList.get(j));
                if (quesObjectMap.get("questionid") != null) {
                    if (tempMap.get(keyProgress) != null && tempMap.get(keyDownloadsize) != null && tempMap.get(keySize) != null) {
                        ArrayList<Object> progressList = new ArrayList<>();
                        ArrayList<Object> sizeList = new ArrayList<>();
                        ArrayList<Object> downloadsizeList = new ArrayList<>();
                        ArrayList<Object> progressList2 = getValueList(progressList, tempMap.get(keyProgress));
                        ArrayList<Object> sizeList2 = getValueList(sizeList, tempMap.get(keySize));
                        ArrayList<Object> downloadsizeList2 = getValueList(downloadsizeList, tempMap.get(keyDownloadsize));
                        if (progressList2 != null && downloadsizeList2 != null && sizeList2 != null) {
                            if (progressList2.size() != 0 && progressList2.size() == downloadsizeList2.size() && downloadsizeList2.size() == sizeList2.size()) {
                                totalprogress = updateHMTotalProgress(totalprogress, downloadsizeList2, sizeList2, progressList2);
                                if ("0".equals(totalprogress)) {
                                    break;
                                }
                            } else {
                                totalprogress = "100";
                            }
                        } else {
                            totalprogress = "100";
                        }
                    } else {
                        totalprogress = "100";
                    }
                }
            }
        }
        return totalprogress;
    }

    private String updateHMTotalProgress(String totalprogress, ArrayList<Object> downloadsizeList, ArrayList<Object> sizeList, ArrayList<Object> progressList) {
        long totalsize = 0;
        long totaldownloadsize = 0;
        boolean isDownFinish = true;
        for (int i = 0; i < sizeList.size(); i++) {
            long tempsize = Long.valueOf(sizeList.get(i).toString()).longValue();
            totalsize += tempsize;
            long tempdownloadsize = Long.valueOf(downloadsizeList.get(i).toString()).longValue();
            totaldownloadsize += tempdownloadsize;
            if (!"100".equals(progressList.get(i))) {
                isDownFinish = false;
            }
        }
        if (totalsize == 0) {
            if (!isDownFinish) {
                return "0";
            }
            return "100";
        } else if (totalsize == totaldownloadsize) {
            return "100";
        } else {
            String totalprogress2 = Integer.toString((int) ((((float) totaldownloadsize) * 100.0f) / ((float) totalsize)));
            return totalprogress2;
        }
    }

    private boolean updateHMExamProAndSize(boolean isChange, Tree<HashMap<String, Object>> tree, String sourceId, HashMap<String, Object> tempMap, String webpath, String oldProgress, long downloadsize, String appName, String keyWebpath, String keyPath, String keyProgress, String keyDownloadsize, String keySize) {
        if (tempMap.get(keyWebpath) != null && tempMap.get(keyPath) != null && tempMap.get(keyProgress) != null && tempMap.get(keyDownloadsize) != null && tempMap.get(keySize) != null) {
            ArrayList<Object> webpathList = new ArrayList<>();
            ArrayList<Object> pathList = new ArrayList<>();
            ArrayList<Object> progressList = new ArrayList<>();
            ArrayList<Object> sizeList = new ArrayList<>();
            ArrayList<Object> downloadsizeList = new ArrayList<>();
            ArrayList<Object> webpathList2 = getValueList(webpathList, tempMap.get(keyWebpath));
            ArrayList<Object> pathList2 = getValueList(pathList, tempMap.get(keyPath));
            ArrayList<Object> progressList2 = getValueList(progressList, tempMap.get(keyProgress));
            ArrayList<Object> sizeList2 = getValueList(sizeList, tempMap.get(keySize));
            ArrayList<Object> downloadsizeList2 = getValueList(downloadsizeList, tempMap.get(keyDownloadsize));
            if (webpathList2 != null && pathList2 != null && progressList2 != null && downloadsizeList2 != null && sizeList2 != null && webpathList2.size() != 0 && webpathList2.size() == pathList2.size() && pathList2.size() == progressList2.size() && progressList2.size() == downloadsizeList2.size() && downloadsizeList2.size() == sizeList2.size()) {
                isChange = updateDownloadsize(tree, isChange, tempMap, webpathList2, progressList2, downloadsizeList2, sizeList2, webpath, oldProgress, downloadsize, appName, KeyEnvironment.KEYDOWNLOADSIZE, "progress");
                if (isChange && (appName.equals(AppEnvironment.Homework) || appName.equals(AppEnvironment.MyExaminationPaper))) {
                    String totalprogress = updateHMTotalProgress("0", downloadsizeList2, sizeList2, progressList2);
                    tempMap.put("homeworkprogress", totalprogress);
                } else if (isChange && appName.equals("ExamMp")) {
                    String totalprogress2 = updateHMTotalProgress("0", downloadsizeList2, sizeList2, progressList2);
                    tempMap.put("questionprogress", totalprogress2);
                } else if (isChange && appName.equals("ExamImage")) {
                    updateHMTotalProgress("0", downloadsizeList2, sizeList2, progressList2);
                } else if (isChange && appName.equals(AppEnvironment.GeRenChengZhang)) {
                    String totalprogress3 = updateHMTotalProgress("0", downloadsizeList2, sizeList2, progressList2);
                    tempMap.put("questionprogress", totalprogress3);
                }
            }
        }
        return isChange;
    }

    private String updateExamsProgress(Tree<HashMap<String, Object>> tree, boolean ischange, String totalprogress, HashMap<String, Object> map, String webpath, String oldProgress, long downloadsize) {
        HashMap<String, Object> tempMap;
        ArrayList<Object> objectList = getValueList(new ArrayList<>(), map.get("exams"));
        Log.d("map1111", "exams == " + map.get("exams"));
        if (objectList != null && objectList.size() > 0) {
            long totalsize = 0;
            long totaldownloadsize = 0;
            for (int i = 0; i < objectList.size(); i++) {
                Object object = objectList.get(i);
                if (object != null && (tempMap = JsonParse.geteObjectToMap(object)) != null && tempMap.get(KeyEnvironment.KEYWEBPATH) != null && tempMap.get("path") != null && tempMap.get("progress") != null && tempMap.get("sizes") != null) {
                    ArrayList<Object> webpathList = new ArrayList<>();
                    ArrayList<Object> pathList = new ArrayList<>();
                    ArrayList<Object> progressList = new ArrayList<>();
                    ArrayList<Object> sizeList = new ArrayList<>();
                    ArrayList<Object> downloadsizeList = new ArrayList<>();
                    ArrayList<Object> webpathList2 = getValueList(webpathList, tempMap.get(KeyEnvironment.KEYWEBPATH));
                    ArrayList<Object> pathList2 = getValueList(pathList, tempMap.get("path"));
                    ArrayList<Object> progressList2 = getValueList(progressList, tempMap.get("progress"));
                    ArrayList<Object> sizeList2 = getValueList(sizeList, tempMap.get("sizes"));
                    ArrayList<Object> downloadsizeList2 = getValueList(downloadsizeList, tempMap.get(KeyEnvironment.KEYDOWNLOADSIZE));
                    if (webpathList2 != null && pathList2 != null && progressList2 != null && downloadsizeList2 != null && webpathList2.size() != 0 && webpathList2.size() == pathList2.size() && pathList2.size() == progressList2.size() && progressList2.size() == downloadsizeList2.size() && downloadsizeList2.size() == sizeList2.size()) {
                        if (!ischange && (ischange = updateDownloadsize(tree, ischange, tempMap, webpathList2, progressList2, downloadsizeList2, sizeList2, webpath, oldProgress, downloadsize, "Exams", KeyEnvironment.KEYDOWNLOADSIZE, "progress"))) {
                            Object newobject = JsonCreate.MaptoJSONObject(tempMap);
                            objectList.remove(i);
                            objectList.add(i, newobject);
                            Object arrayObject = JsonCreate.toJSONArrayObject(objectList);
                            map.put("exams", arrayObject);
                        }
                        for (int j = 0; j < sizeList2.size(); j++) {
                            long tempdownloadsize = Long.valueOf(downloadsizeList2.get(j).toString()).longValue();
                            totaldownloadsize += tempdownloadsize;
                            long tempsize = Long.valueOf(sizeList2.get(j).toString()).longValue();
                            totalsize += tempsize;
                            if (tempsize == 0 && totaldownloadsize > 0) {
                                totalsize += tempdownloadsize;
                            }
                        }
                    }
                }
            }
            if (totalsize == 0) {
                totalprogress = "0";
            } else if (totalsize == totaldownloadsize) {
                totalprogress = "100";
            } else {
                totalprogress = Integer.toString((int) ((((float) totaldownloadsize) * 100.0f) / ((float) totalsize)));
            }
            map.put("examsprogress", totalprogress);
        }
        return totalprogress;
    }

    public String updateTotalProgress(String totalprogress, ArrayList<Object> downloadsizeList, ArrayList<Object> sizeList) {
        long totalsize = 0;
        long totaldownloadsize = 0;
        for (int i = 0; i < sizeList.size(); i++) {
            long tempsize = Long.valueOf(sizeList.get(i).toString()).longValue();
            totalsize += tempsize;
            long tempdownloadsize = Long.valueOf(downloadsizeList.get(i).toString()).longValue();
            totaldownloadsize += tempdownloadsize;
        }
        if (totalsize == 0) {
            return "0";
        }
        if (totalsize == totaldownloadsize) {
            return "100";
        }
        String totalprogress2 = Integer.toString((int) ((((float) totaldownloadsize) * 100.0f) / ((float) totalsize)));
        return totalprogress2;
    }

    public boolean updateDownloadsize(Tree<HashMap<String, Object>> tree, boolean ischange, HashMap<String, Object> tempMap, ArrayList<Object> webpathList, ArrayList<Object> progressList, ArrayList<Object> downloadsizeList, ArrayList<Object> sizeList, String webpath, String oldProgress, long downloadsize, String appName, String keydownloadsize, String keyprogress) {
        for (int i = 0; i < webpathList.size(); i++) {
            if (webpath.equals(webpathList.get(i).toString())) {
                downloadsizeList.remove(i);
                downloadsizeList.add(i, Long.valueOf(downloadsize));
                if (downloadsizeList.get(i).toString().equals(sizeList.get(i).toString())) {
                    progressList.remove(i);
                    progressList.add(i, "100");
                } else {
                    progressList.remove(i);
                    progressList.add(i, oldProgress);
                }
                if (appName.equals("DaoXueBen")) {
                    changeTreeData(tree, tempMap, JsonCreate.toJSONArrayObject(progressList), keyprogress);
                    changeTreeData(tree, tempMap, JsonCreate.toJSONArrayObject(downloadsizeList), keydownloadsize);
                } else if (appName.equals("DaoXueBenNew")) {
                    tempMap.put(keyprogress, JsonCreate.toJSONArrayObject(progressList));
                    tempMap.put(keydownloadsize, JsonCreate.toJSONArrayObject(downloadsizeList));
                } else if (appName.equals("ExamImage")) {
                    tempMap.put("qprogress", JsonCreate.toJSONArrayObject(progressList));
                    tempMap.put("qdownloadsize", JsonCreate.toJSONArrayObject(downloadsizeList));
                } else {
                    tempMap.put(keyprogress, JsonCreate.toJSONArrayObject(progressList));
                    tempMap.put(keydownloadsize, JsonCreate.toJSONArrayObject(downloadsizeList));
                }
                return true;
            }
        }
        return ischange;
    }

    private ArrayList<Object> appendPlanIdObject(String book_id, ArrayList<String> idParentList, ArrayList<Object> dataObjectList, ArrayList<Object> idObjectList, String appName, ArrayList<HashMap<String, String>> needDownloadList) {
        ArrayList<Object> itemsObjectList;
        String key = getDataIdKey(appName);
        if (idObjectList != null) {
            Iterator<Object> it = idObjectList.iterator();
            while (it.hasNext()) {
                Object tempobject = it.next();
                boolean isexist = false;
                HashMap<String, Object> tempMap = JsonParse.geteObjectToMap(tempobject);
                if (dataObjectList != null) {
                    int i = 0;
                    while (true) {
                        if (i < dataObjectList.size()) {
                            Object tempdataobject = dataObjectList.get(i);
                            HashMap<String, Object> tempDataMap = JsonParse.geteObjectToMap(tempdataobject);
                            if (tempMap == null || tempDataMap == null || tempMap.get(key) == null || tempDataMap.get(key) == null || !tempMap.get(key).toString().equals(tempDataMap.get(key).toString())) {
                                i++;
                            } else {
                                isexist = true;
                                String sourceId = appendid(idParentList);
                                needDownloadList = comparePlanItems(tempMap, tempDataMap, book_id, String.valueOf(sourceId) + "_" + tempMap.get(key).toString(), appName, needDownloadList);
                                Object newObject = JsonCreate.MaptoJSONObject(tempDataMap);
                                dataObjectList.remove(i);
                                dataObjectList.add(i, newObject);
                                break;
                            }
                        } else {
                            break;
                        }
                    }
                }
                if (!isexist) {
                    if (dataObjectList == null) {
                        dataObjectList = new ArrayList<>();
                    }
                    dataObjectList.add(tempobject);
                    if (needDownloadList != null) {
                        ArrayList<Object> itemsObjectList2 = new ArrayList<>();
                        if (tempMap != null && tempMap.get(key) != null) {
                            String planId = tempMap.get(key).toString();
                            if (tempMap != null && tempMap.get("items") != null && (itemsObjectList = getValueList(itemsObjectList2, tempMap.get("items"))) != null && itemsObjectList.size() > 0) {
                                Iterator<Object> it2 = itemsObjectList.iterator();
                                while (it2.hasNext()) {
                                    Object itemObject = it2.next();
                                    String sourceId2 = appendid(idParentList);
                                    addPlanToneedDownloadList(book_id, String.valueOf(sourceId2) + "_" + planId, itemObject, needDownloadList, appName);
                                }
                            }
                        }
                    }
                }
            }
        }
        return dataObjectList;
    }

    private ArrayList<HashMap<String, String>> addPlanToneedDownloadList(String bookId, String sourceId, Object dataObject, ArrayList<HashMap<String, String>> downloadlist, String appName) {
        HashMap<String, Object> tempDataMap = JsonParse.geteObjectToMap(dataObject);
        if (tempDataMap != null && tempDataMap.get(KeyEnvironment.KEYWEBPATH) != null) {
            return updateLessonPlanDownloadlist(bookId, sourceId, tempDataMap, downloadlist, getSizeKey(appName));
        }
        return downloadlist;
    }

    private ArrayList<HashMap<String, String>> comparePlanItems(HashMap<String, Object> localplanMap, HashMap<String, Object> planMap, String book_id, String sourceId, String appName, ArrayList<HashMap<String, String>> needDownloadList) {
        ArrayList<Object> localitemsObjectList;
        ArrayList<Object> localitemsObjectList2 = new ArrayList<>();
        if (localplanMap != null && localplanMap.get("items") != null && (localitemsObjectList = getValueList(localitemsObjectList2, localplanMap.get("items"))) != null && localitemsObjectList.size() > 0) {
            int itemsObjectListsize = 0;
            ArrayList<Object> itemsObjectList = new ArrayList<>();
            if (planMap != null && planMap.get("items") != null && (itemsObjectList = getValueList(itemsObjectList, planMap.get("items"))) != null && itemsObjectList.size() > 0) {
                itemsObjectListsize = itemsObjectList.size();
            }
            Iterator<Object> it = localitemsObjectList.iterator();
            while (it.hasNext()) {
                Object localitemObject = it.next();
                HashMap<String, Object> localitemsMap = JsonParse.geteObjectToMap(localitemObject);
                if (localitemsMap != null && localitemsMap.get(KeyEnvironment.KEYWEBPATH) != null) {
                    String localwebpath = localitemsMap.get(KeyEnvironment.KEYWEBPATH).toString();
                    boolean isfound = false;
                    if (itemsObjectListsize > 0) {
                        int i = 0;
                        while (true) {
                            if (i >= itemsObjectListsize) {
                                break;
                            }
                            HashMap<String, Object> itemsMap = JsonParse.geteObjectToMap(itemsObjectList.get(i));
                            if (itemsMap != null && itemsMap.get(KeyEnvironment.KEYWEBPATH) != null) {
                                String webpath = itemsMap.get(KeyEnvironment.KEYWEBPATH).toString();
                                if (localwebpath.equals(webpath)) {
                                    isfound = true;
                                    break;
                                }
                            }
                            i++;
                        }
                    }
                    if (!isfound) {
                        if (itemsObjectListsize == 0) {
                            itemsObjectList = new ArrayList<>();
                        }
                        itemsObjectList.add(localitemObject);
                        if (needDownloadList != null) {
                            addPlanToneedDownloadList(book_id, sourceId, localitemObject, needDownloadList, appName);
                        }
                    }
                }
            }
            planMap.put("items", JsonCreate.toJSONArrayObject(itemsObjectList));
        }
        return needDownloadList;
    }

    private ArrayList<Object> appendObject(String book_id, ArrayList<String> idParentList, ArrayList<Object> dataObjectList, ArrayList<Object> idObjectList, String appName, ArrayList<HashMap<String, String>> needDownloadList) {
        String sourceId;
        String key = getDataIdKey(appName);
        if (idObjectList != null) {
            Iterator<Object> it = idObjectList.iterator();
            while (it.hasNext()) {
                Object tempobject = it.next();
                boolean isexist = false;
                HashMap<String, Object> tempMap = JsonParse.geteObjectToMap(tempobject);
                if (dataObjectList != null) {
                    int i = 0;
                    while (true) {
                        if (i >= dataObjectList.size()) {
                            break;
                        }
                        Object tempdataobject = dataObjectList.get(i);
                        HashMap<String, Object> tempDataMap = JsonParse.geteObjectToMap(tempdataobject);
                        if (tempMap == null || tempDataMap == null || tempMap.get(key) == null || tempDataMap.get(key) == null || !tempMap.get(key).toString().equals(tempDataMap.get(key).toString())) {
                            i++;
                        } else {
                            isexist = true;
                            if (needDownloadList != null && tempMap.get("question") != null) {
                                ArrayList<Object> quesObjectList = getValueList(new ArrayList<>(), tempMap.get("question"));
                                String sourceId2 = appendid(idParentList);
                                if ("".equals(sourceId2)) {
                                    sourceId = tempDataMap.get(key).toString();
                                } else {
                                    sourceId = String.valueOf(sourceId2) + "_" + tempDataMap.get(key).toString();
                                }
                                if (quesObjectList != null && quesObjectList.size() > 0) {
                                    ArrayList<Object> localquesObjectList = getValueList(new ArrayList<>(), tempDataMap.get("question"));
                                    if (localquesObjectList == null || (localquesObjectList != null && localquesObjectList.size() == 0)) {
                                        tempDataMap.put("question", tempMap.get("question"));
                                        if (tempMap.get("question_num") != null) {
                                            tempDataMap.put("question_num", tempMap.get("question_num"));
                                        }
                                        Object newtempDataObject = JsonCreate.MaptoJSONObject(tempDataMap);
                                        dataObjectList.set(i, newtempDataObject);
                                        needDownloadList = addQuestionListToDownloadList(book_id, sourceId, tempDataMap, needDownloadList);
                                    } else {
                                        compareAndReplaceExamQuestion(book_id, sourceId, quesObjectList, localquesObjectList, needDownloadList);
                                        if (tempMap.get("question_num") != null) {
                                            tempDataMap.put("question_num", tempMap.get("question_num"));
                                        }
                                        Object newObject = JsonCreate.toJSONArrayObject(quesObjectList);
                                        tempDataMap.put("question", newObject);
                                        Object newtempDataObject2 = JsonCreate.MaptoJSONObject(tempDataMap);
                                        dataObjectList.set(i, newtempDataObject2);
                                    }
                                }
                            }
                        }
                    }
                }
                if (!isexist) {
                    if (dataObjectList == null) {
                        dataObjectList = new ArrayList<>();
                    }
                    dataObjectList.add(tempobject);
                    if (needDownloadList != null) {
                        addToneedDownloadList(book_id, appendid(idParentList), tempobject, needDownloadList, appName);
                    }
                }
            }
        }
        return dataObjectList;
    }

    private void compareAndReplaceExamQuestion(String book_id, String sourceId, ArrayList<Object> quesObjectList, ArrayList<Object> localquesObjectList, ArrayList<HashMap<String, String>> needDownloadList) {
        for (int j = 0; j < quesObjectList.size(); j++) {
            Object tempObject = quesObjectList.get(j);
            HashMap<String, Object> tempMap = JsonParse.geteObjectToMap(tempObject);
            if (tempMap != null && tempMap.get("questionid") != null) {
                String quesid = tempMap.get("questionid").toString();
                boolean isNew = true;
                if (tempMap.get("progress") != null && tempMap.get(KeyEnvironment.KEYDOWNLOADSIZE) != null && tempMap.get(KeyEnvironment.KEYWEBPATH) != null && tempMap.get("size") != null && tempMap.get("path") != null) {
                    ArrayList<Object> webpathList = new ArrayList<>();
                    ArrayList<Object> downloadsizeList = new ArrayList<>();
                    ArrayList<Object> progressList = new ArrayList<>();
                    ArrayList<Object> sizeList = new ArrayList<>();
                    ArrayList<Object> pathList = new ArrayList<>();
                    ArrayList<Object> webpathList2 = getValueList(webpathList, tempMap.get(KeyEnvironment.KEYWEBPATH));
                    ArrayList<Object> downloadsizeList2 = getValueList(downloadsizeList, tempMap.get(KeyEnvironment.KEYDOWNLOADSIZE));
                    ArrayList<Object> progressList2 = getValueList(progressList, tempMap.get("progress"));
                    ArrayList<Object> sizeList2 = getValueList(sizeList, tempMap.get("size"));
                    ArrayList<Object> pathList2 = getValueList(pathList, tempMap.get("path"));
                    if (webpathList2 != null && downloadsizeList2 != null && progressList2 != null && sizeList2 != null && pathList2 != null && webpathList2.size() != 0 && webpathList2.size() == pathList2.size() && pathList2.size() == progressList2.size() && progressList2.size() == sizeList2.size() && sizeList2.size() == downloadsizeList2.size()) {
                        int i = 0;
                        while (true) {
                            if (i >= localquesObjectList.size()) {
                                break;
                            }
                            Object localtempObject = localquesObjectList.get(i);
                            HashMap<String, Object> localtempMap = JsonParse.geteObjectToMap(localtempObject);
                            if (localtempMap != null && localtempMap.get("questionid") != null) {
                                String localquesid = localtempMap.get("questionid").toString();
                                if (quesid.equals(localquesid)) {
                                    isNew = false;
                                    rePlaceProAndDown(tempMap, webpathList2, pathList2, downloadsizeList2, sizeList2, progressList2, localtempMap, "progress", KeyEnvironment.KEYDOWNLOADSIZE, KeyEnvironment.KEYWEBPATH, "size", "path");
                                    if (localtempMap.get("qprogress") != null) {
                                        tempMap.put("qprogress", localtempMap.get("qprogress"));
                                    }
                                    if (localtempMap.get("qwebpath") != null) {
                                        tempMap.put("qwebpath", localtempMap.get("qwebpath"));
                                    }
                                    if (localtempMap.get("qpath") != null) {
                                        tempMap.put("qpath", localtempMap.get("qpath"));
                                    }
                                    if (localtempMap.get("qdownloadsize") != null) {
                                        tempMap.put("qdownloadsize", localtempMap.get("qdownloadsize"));
                                    }
                                    if (localtempMap.get("qsize") != null) {
                                        tempMap.put("qsize", localtempMap.get("qsize"));
                                    }
                                    quesObjectList.set(j, JsonCreate.MaptoJSONObject(tempMap));
                                    localquesObjectList.remove(i);
                                }
                            }
                            i++;
                        }
                    }
                }
                if (!isNew) {
                    needDownloadList = updateDownloadlist(book_id, sourceId, tempMap, updateDownloadlist(book_id, sourceId, tempMap, needDownloadList, "size", KeyEnvironment.KEYWEBPATH, "path", "progress"), "qsize", "qwebpath", "qpath", "qprogress");
                }
            }
        }
    }

    private void rePlaceProAndDown(HashMap<String, Object> tempMap, ArrayList<Object> webpathList, ArrayList<Object> pathList, ArrayList<Object> downloadsizeList, ArrayList<Object> sizeList, ArrayList<Object> progressList, HashMap<String, Object> localtempMap, String keyProgress, String keyDownloadsize, String keyWebpath, String keySize, String keyPath) {
        if (localtempMap.get(keyProgress) != null && localtempMap.get(keyDownloadsize) != null && localtempMap.get(keyWebpath) != null && localtempMap.get(keySize) != null && localtempMap.get(keyPath) != null) {
            ArrayList<Object> localwebpathList = new ArrayList<>();
            ArrayList<Object> localdownloadsizeList = new ArrayList<>();
            ArrayList<Object> localprogressList = new ArrayList<>();
            ArrayList<Object> localsizeList = new ArrayList<>();
            ArrayList<Object> localpathList = new ArrayList<>();
            ArrayList<Object> localwebpathList2 = getValueList(localwebpathList, localtempMap.get(keyWebpath));
            ArrayList<Object> localdownloadsizeList2 = getValueList(localdownloadsizeList, localtempMap.get(keyDownloadsize));
            ArrayList<Object> localprogressList2 = getValueList(localprogressList, localtempMap.get(keyProgress));
            ArrayList<Object> localsizeList2 = getValueList(localsizeList, localtempMap.get(keySize));
            ArrayList<Object> localpathList2 = getValueList(localpathList, localtempMap.get(keyPath));
            if (localwebpathList2 != null && localdownloadsizeList2 != null && localprogressList2 != null && localsizeList2 != null && localpathList2 != null && localwebpathList2.size() != 0 && localwebpathList2.size() == localpathList2.size() && localpathList2.size() == localprogressList2.size() && localprogressList2.size() == localsizeList2.size() && localsizeList2.size() == localdownloadsizeList2.size()) {
                boolean isChange = false;
                long totaldownloadsize = 0;
                long totalsize = 0;
                for (int m = 0; m < webpathList.size(); m++) {
                    String webpath = webpathList.get(m).toString();
                    int n = 0;
                    while (true) {
                        if (n >= localwebpathList2.size()) {
                            break;
                        }
                        String localwebpath = localwebpathList2.get(n).toString();
                        if (!webpath.equals(localwebpath)) {
                            n++;
                        } else {
                            isChange = true;
                            downloadsizeList.set(m, localdownloadsizeList2.get(n));
                            progressList.set(m, localprogressList2.get(n));
                            pathList.set(m, localpathList2.get(n));
                            sizeList.set(m, localsizeList2.get(n));
                            break;
                        }
                    }
                    totaldownloadsize += Long.valueOf(downloadsizeList.get(m).toString()).longValue();
                    totalsize += Long.valueOf(sizeList.get(m).toString()).longValue();
                }
                if (totalsize == 0) {
                    tempMap.put("questionprogress", "100");
                } else if (totalsize == totaldownloadsize) {
                    tempMap.put("questionprogress", "100");
                } else {
                    String totalprogress = Integer.toString((int) ((((float) totaldownloadsize) * 100.0f) / ((float) totalsize)));
                    tempMap.put("questionprogress", totalprogress);
                }
                if (isChange) {
                    tempMap.put(keyPath, JsonCreate.toJSONArrayObject(pathList));
                    tempMap.put(keyProgress, JsonCreate.toJSONArrayObject(progressList));
                    tempMap.put(keyDownloadsize, JsonCreate.toJSONArrayObject(downloadsizeList));
                    tempMap.put(keySize, JsonCreate.toJSONArrayObject(sizeList));
                }
            }
        }
    }

    private void sortInsertObject(ArrayList<Object> dataObjectList) {
        ArrayList<Object> finishObjectList = new ArrayList<>();
        int i = 0;
        while (i < dataObjectList.size()) {
            Object tempObject = dataObjectList.get(i);
            HashMap<String, Object> tempMap = JsonParse.geteObjectToMap(tempObject);
            String tempstatus = (tempMap == null || tempMap.get("status") == null) ? "0" : tempMap.get("status").toString();
            if (!LogHelp.TYPE_GUIDANCE.equals(tempstatus)) {
                finishObjectList.add(tempObject);
                dataObjectList.remove(tempObject);
                i--;
            }
            i++;
        }
        Iterator<Object> it = finishObjectList.iterator();
        while (it.hasNext()) {
            Object finishObject = it.next();
            dataObjectList.add(finishObject);
        }
    }

    private String getDataName(String appName) {
        if (appName.equals("DaoXueBen") || appName.equals("DaoXueBenNew")) {
            return "exams";
        }
        if (appName.equals("WrongQuestionSet") || appName.equals("ZuoYeFuDao")) {
            return "question";
        }
        if (appName.equals(AppEnvironment.LessonPlanning)) {
            return "plan";
        }
        if (appName.equals(AppEnvironment.Homework) || appName.equals(AppEnvironment.MyExaminationPaper)) {
            return "exam";
        }
        return "question";
    }

    private String getDataIdKey(String appName) {
        if (appName.equals("DaoXueBen") || appName.equals("DaoXueBenNew")) {
            return "null";
        }
        if (appName.equals("WrongQuestionSet")) {
            return AppEnvironment.ErrorID;
        }
        if (!appName.equals(AppEnvironment.GeRenChengZhang) && !appName.equals("ZuoYeFuDao") && !appName.equals(AppEnvironment.LessonPlanning) && !appName.equals(AppEnvironment.MyExaminationPaper) && !appName.equals(AppEnvironment.Homework)) {
            return "null";
        }
        return "id";
    }

    private String getSizeKey(String appName) {
        if (appName.equals("DaoXueBenNew") || appName.equals("DaoXueBen") || appName.equals(AppEnvironment.LessonPlanning) || appName.equals(AppEnvironment.Homework) || appName.equals(AppEnvironment.MyExaminationPaper) || appName.equals(AppEnvironment.GeRenChengZhang)) {
            return "size";
        }
        if (appName.equals("ZuoYeFuDao")) {
            return "size";
        }
        return appName.equals("WrongQuestionSet") ? "Size" : "Size";
    }

    public HashMap<String, String> getWebPathHashMap(Tree<HashMap<String, Object>> deletetree, Tree<HashMap<String, Object>> booktree) {
        return null;
    }

    public void deleteSingleFile(Tree<HashMap<String, Object>> booktree, String json, String sourceId, String key, String key1) {
        ArrayList<Object> objectList;
        Object removeObject;
        HashMap<String, Object> deletenode = deleteFile(booktree, json, key, key1);
        if (deletenode.get(getDataName("DaoXueBen")) != null && (objectList = getValueList(new ArrayList<>(), deletenode.get(getDataName("DaoXueBen")))) != null && objectList.size() > 0 && (removeObject = getRemoveObject(objectList, key, sourceId)) != null) {
            objectList.remove(removeObject);
        }
    }

    public void deletePlanFile(Tree<HashMap<String, Object>> booktree, String json, String sourceId, String webpath, String key, String key1) {
        ArrayList<Object> objectList;
        Object removeObject;
        HashMap<String, Object> deletenode = deleteFile(booktree, json, key, key1);
        if (deletenode.get(getDataName("DaoXueBen")) != null && (objectList = getValueList(new ArrayList<>(), deletenode.get(getDataName("DaoXueBen")))) != null && objectList.size() > 0 && (removeObject = getRemoveObject(objectList, key, sourceId)) != null) {
            getRemoveItem(removeObject, webpath);
        }
    }

    private HashMap<String, Object> deleteFile(Tree<HashMap<String, Object>> booktree, String json, String key, String key1) {
        HashMap<String, Object> returnhash = null;
        ArrayList<String> deletefilelist = treeToList(json, key, key1);
        if (deletefilelist.size() > 0) {
            HashMap<String, Object> head = booktree.getHead();
            if (deletefilelist.get(0).equals(head.get(key))) {
                for (int i = 1; i < deletefilelist.size(); i++) {
                    Collection<HashMap<String, Object>> Successors = booktree.getSuccessors(head);
                    boolean isfound = false;
                    Iterator<HashMap<String, Object>> it = Successors.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        HashMap<String, Object> tempSuccessors = it.next();
                        if (tempSuccessors.get(key) != null) {
                            String id = tempSuccessors.get(key).toString();
                            if (deletefilelist.get(i).equals(id)) {
                                head = tempSuccessors;
                                isfound = true;
                                break;
                            }
                        }
                    }
                    if (!isfound) {
                        break;
                    }
                    if (i == deletefilelist.size() - 1) {
                        returnhash = head;
                    }
                }
            }
        }
        return returnhash;
    }

    private Object getRemoveObject(ArrayList<Object> dataObjectList, String key, String sourceId) {
        Iterator<Object> it = dataObjectList.iterator();
        while (it.hasNext()) {
            Object tempdataobject = it.next();
            try {
                HashMap<String, Object> tempDataMap = this.common.parseJSONObject((JSONObject) tempdataobject);
                if (sourceId != null && tempDataMap.get(key) != null && sourceId.equals(tempDataMap.get(key))) {
                    return tempdataobject;
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    private Object getRemoveItem(Object removeObject, String webpath) {
        ArrayList<Object> objectList;
        Object removeitemObject;
        try {
            HashMap<String, Object> sourceMap = this.common.parseJSONObject((JSONObject) removeObject);
            if (sourceMap.get("items") != null && (objectList = getValueList(new ArrayList<>(), sourceMap.get("items"))) != null && objectList.size() > 0 && (removeitemObject = getRemoveObject(objectList, KeyEnvironment.KEYWEBPATH, webpath)) != null) {
                objectList.remove(removeitemObject);
                Object newDataObject = JsonCreate.toJSONArrayObject(objectList);
                sourceMap.put("items", newDataObject);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        return removeObject;
    }

    /* JADX WARN: Generic types in debug info not equals: java.lang.Object != java.util.ArrayList<java.lang.String> */
    public ArrayList<String> treeToList(String json, String key, String key1) {
        ArrayList<String> treeList = new ArrayList<>();
        Tree<HashMap<String, Object>> tree = JsonParse.parsejson(null, json, key1, key1);
        if (tree == null) {
            return treeList;
        }
        if (tree.getHead() != null && tree.getHead().get(key) != null) {
            treeList.add((String) tree.getHead().get(key));
        }
        return toList(treeList, tree, tree.getHead(), key, key1);
    }

    private ArrayList<String> toList(ArrayList<String> treeList, Tree<HashMap<String, Object>> tree, HashMap<String, Object> head, String key, String key1) {
        Collection<HashMap<String, Object>> Successors = tree.getSuccessors(head);
        for (HashMap<String, Object> tempSuccessors : Successors) {
            if (0 > 0) {
                break;
            }
            if (tempSuccessors.get(key) != null) {
                treeList.add((String) tempSuccessors.get(key));
            }
            if (tempSuccessors.get(key1) != null) {
                toList(treeList, tree, tempSuccessors, key, key1);
            }
        }
        return treeList;
    }

    public ArrayList<Object> getValueList(ArrayList<Object> objectList, Object object) {
        ArrayList<Object> newObjectList;
        if (objectList != null && object != null && this.common.isJsonArray(object) && (newObjectList = parseValueList(object)) != null && newObjectList.size() > 0) {
            Iterator<Object> it = newObjectList.iterator();
            while (it.hasNext()) {
                Object tempobject = it.next();
                if (this.common.isJsonArray(tempobject)) {
                    getValueList(objectList, tempobject);
                } else {
                    objectList.add(tempobject);
                }
            }
        }
        return objectList;
    }

    public HashMap<String, Object> examAddNewKeys(HashMap<String, Object> jsonMap, String appName) {
        boolean ischange = false;
        ArrayList<Object> examObjectList = new ArrayList<>();
        if (jsonMap.get("data") != null) {
            examObjectList = getValueList(examObjectList, jsonMap.get("data"));
            if (examObjectList.size() > 0) {
                ischange = true;
                examObjectList = addNewKeys(examObjectList, appName);
            }
        }
        if (ischange) {
            jsonMap.put("data", JsonCreate.toJSONArrayObject(examObjectList));
        }
        return jsonMap;
    }

    public void UpdateOldJsonMap(HashMap<String, Object> jsonMap, HashMap<String, Object> localJsonMap, String appName, ArrayList<HashMap<String, String>> needDownloadList) {
        String book_id = jsonMap.get("id").toString();
        ArrayList<String> idParentList = new ArrayList<>();
        idParentList.add(book_id);
        ArrayList<Object> examObjectList = new ArrayList<>();
        ArrayList<Object> localexamObjectList = new ArrayList<>();
        if (jsonMap.get("data") != null) {
            examObjectList = getValueList(examObjectList, jsonMap.get("data"));
        }
        if (localJsonMap != null && localJsonMap.get("data") != null) {
            localexamObjectList = getValueList(localexamObjectList, localJsonMap.get("data"));
        }
        Object newDataObject = null;
        ArrayList<Object> localexamObjectList2 = appendObject(book_id, idParentList, localexamObjectList, examObjectList, appName, needDownloadList);
        if (localexamObjectList2 != null && localexamObjectList2.size() > 0) {
            sortInsertObject(localexamObjectList2);
            newDataObject = JsonCreate.toJSONArrayObject(localexamObjectList2);
        }
        if (localJsonMap != null) {
            localJsonMap.put("data", newDataObject);
        }
    }

    private ArrayList<HashMap<String, String>> getBookExamDownList(ArrayList<HashMap<String, String>> downloadlist, Books book, String bookjsonfilepath, String appName) {
        String localjson = JsonHelper.getFileString(bookjsonfilepath);
        HashMap<String, Object> localJsonMap = this.common.parse(localjson);
        if (localJsonMap != null && localJsonMap.get("id") != null && localJsonMap.get("data") != null) {
            String book_id = localJsonMap.get("id").toString();
            ArrayList<Object> localJsonObjectList = getValueList(new ArrayList<>(), localJsonMap.get("data"));
            if (localJsonObjectList != null && localJsonObjectList.size() > 0) {
                addToDownloadList(book_id, book_id, localJsonObjectList, downloadlist, appName);
            }
        }
        return downloadlist;
    }

    public void updateFormJson(String questionid, String bookJsonPath, int status) {
        String localjson = JsonHelper.getFileString(bookJsonPath);
        HashMap<String, Object> jsonMap = this.common.parse(localjson);
        boolean ischange = false;
        ArrayList<Object> examObjectList = new ArrayList<>();
        if (jsonMap != null && jsonMap.get("id") != null && jsonMap.get("data") != null) {
            examObjectList = getValueList(examObjectList, jsonMap.get("data"));
            if (examObjectList.size() > 0) {
                int i = 0;
                while (true) {
                    if (i >= examObjectList.size()) {
                        break;
                    }
                    Object tempObject = examObjectList.get(i);
                    HashMap<String, Object> hashmap = JsonParse.geteObjectToMap(tempObject);
                    if (hashmap == null || hashmap.get("id") == null || !questionid.equals(hashmap.get("id").toString())) {
                        i++;
                    } else {
                        if (status == 1) {
                            examObjectList.remove(tempObject);
                        } else if (status == 2 && hashmap.get("status") != null) {
                            hashmap.put("status", LogHelp.TYPE_MYWORK);
                            Object newExamObject = JsonCreate.MaptoJSONObject(hashmap);
                            examObjectList.remove(i);
                            examObjectList.add(i, newExamObject);
                        }
                        ischange = true;
                    }
                }
            }
        }
        if (ischange) {
            sortInsertObject(examObjectList);
            Object newObject = JsonCreate.toJSONArrayObject(examObjectList);
            jsonMap.put("data", newObject);
            Object jsonObject = JsonCreate.MaptoJSONObject(jsonMap);
            JsonCreate.saveJsonToLocal(jsonObject.toString(), bookJsonPath);
        }
    }

    public void UpdateGeRenOldJsonMap(HashMap<String, Object> jsonMap, HashMap<String, Object> localJsonMap, String appName, ArrayList<HashMap<String, String>> needDownloadList) {
        ArrayList<String> idParentList = new ArrayList<>();
        ArrayList<Object> examObjectList = new ArrayList<>();
        ArrayList<Object> localexamObjectList = new ArrayList<>();
        if (jsonMap.get("data") != null) {
            examObjectList = getValueList(examObjectList, jsonMap.get("data"));
        }
        if (localJsonMap != null && localJsonMap.get("data") != null) {
            localexamObjectList = getValueList(localexamObjectList, localJsonMap.get("data"));
        }
        Object newDataObject = null;
        ArrayList<Object> localexamObjectList2 = appendObjectGeRen(idParentList, localexamObjectList, examObjectList, appName, needDownloadList);
        if (localexamObjectList2 != null && localexamObjectList2.size() > 0) {
            newDataObject = JsonCreate.toJSONArrayObject(localexamObjectList2);
        }
        if (localJsonMap != null) {
            localJsonMap.put("data", newDataObject);
        }
    }

    private ArrayList<Object> appendObjectGeRen(ArrayList<String> idParentList, ArrayList<Object> dataObjectList, ArrayList<Object> idObjectList, String appName, ArrayList<HashMap<String, String>> needDownloadList) {
        String key = getDataIdKey(appName);
        if (idObjectList != null) {
            Iterator<Object> it = idObjectList.iterator();
            while (it.hasNext()) {
                Object tempobject = it.next();
                boolean isexist = false;
                HashMap<String, Object> tempMap = JsonParse.geteObjectToMap(tempobject);
                if (dataObjectList != null) {
                    int i = 0;
                    while (true) {
                        if (i < dataObjectList.size()) {
                            Object tempdataobject = dataObjectList.get(i);
                            HashMap<String, Object> tempDataMap = JsonParse.geteObjectToMap(tempdataobject);
                            if (tempMap == null || tempDataMap == null || tempMap.get(key) == null || tempDataMap.get(key) == null || !tempMap.get(key).toString().equals(tempDataMap.get(key).toString())) {
                                i++;
                            } else {
                                isexist = true;
                                break;
                            }
                        } else {
                            break;
                        }
                    }
                }
                if (!isexist) {
                    if (dataObjectList == null) {
                        dataObjectList = new ArrayList<>();
                    }
                    dataObjectList.add(tempobject);
                    if (needDownloadList != null) {
                        String sourceId = appendid(idParentList);
                        addToneedDownloadListGeRen(sourceId, tempobject, needDownloadList, appName);
                    }
                }
            }
        }
        return dataObjectList;
    }

    private ArrayList<HashMap<String, String>> addToneedDownloadListGeRen(String sourceId, Object dataObject, ArrayList<HashMap<String, String>> downloadlist, String appName) {
        String sourceId2;
        String key = getDataIdKey(appName);
        HashMap<String, Object> tempDataMap = JsonParse.geteObjectToMap(dataObject);
        if (tempDataMap != null && tempDataMap.get(key) != null) {
            if ("".equals(sourceId)) {
                sourceId2 = tempDataMap.get(key).toString();
            } else {
                sourceId2 = String.valueOf(sourceId) + "_" + tempDataMap.get(key).toString();
            }
            if (appName.equals(AppEnvironment.GeRenChengZhang)) {
                return updateDownloadlist("-1", sourceId2, tempDataMap, downloadlist, getSizeKey(appName), KeyEnvironment.KEYWEBPATH, "path", "progress");
            }
            return downloadlist;
        }
        return downloadlist;
    }

    public void getFileDownloadList(HashMap<String, Object> localjsonMap, ArrayList<HashMap<String, String>> needDownloadList, String appName) {
        if (localjsonMap != null && localjsonMap.get("data") != null) {
            ArrayList<Object> fileObjectList = new ArrayList<>();
            Iterator<Object> it = getValueList(fileObjectList, localjsonMap.get("data")).iterator();
            while (it.hasNext()) {
                Object tempObject = it.next();
                addToneedDownloadListGeRen("", tempObject, needDownloadList, appName);
            }
        }
    }

    public void updateGeRenProgressAndSize(Tree<HashMap<String, Object>> tree, String sourceId, HashMap<String, Object> tempMap, String webpath, String oldProgress, long downloadsize, String appName) {
        updateHMExamProAndSize(false, tree, sourceId, tempMap, webpath, oldProgress, downloadsize, appName, KeyEnvironment.KEYWEBPATH, "path", "progress", KeyEnvironment.KEYDOWNLOADSIZE, "size");
    }

    public void updateErrorStatus(String booksJsonPath, String appName, String offlineDownloadDir, int inerror, String needUpdateBookid, Tree<HashMap<String, Object>> idtree) {
        ArrayList<Object> questionobjectList;
        ArrayList<Books> books = new ArrayList<>();
        Iterator<Books> it = JsonParse.parseBooksJson(books, booksJsonPath).iterator();
        while (it.hasNext()) {
            Books tempBook = it.next();
            String bookid = tempBook.getbook_id();
            tempBook.getbook_path();
            if (bookid != null && !"".equals(bookid) && bookid.equals(needUpdateBookid)) {
                String bookfilepath = String.valueOf(offlineDownloadDir) + bookid + "/";
                File bookfiledir = new File(bookfilepath);
                if (bookfiledir.exists()) {
                    String bookjsonfilepath = String.valueOf(bookfilepath) + "json.json";
                    File bookjsonfile = new File(bookjsonfilepath);
                    if (bookjsonfile.exists()) {
                        String json = JsonHelper.getFileString(bookjsonfilepath);
                        Tree<HashMap<String, Object>> tree = JsonParse.parsejson(null, json, "data", "children");
                        if (tree != null && tree.getHead() != null && tree.getHead().get("id") != null) {
                            boolean isTreeUpdate = false;
                            ArrayList<String> idList = new ArrayList<>();
                            idList.add(bookid);
                            String questionid = getidList(idtree, idtree.getHead(), idList, "id", "");
                            if (questionid != null && !"".equals(questionid)) {
                                tree.getHead();
                                if (idList.size() > 1) {
                                    HashMap<String, Object> head = getNeedDownHead(tree, tree.getHead(), idList, "id");
                                    if (head.get("question") != null && (questionobjectList = getValueList(new ArrayList<>(), head.get("question"))) != null && questionobjectList.size() > 0) {
                                        int i = 0;
                                        while (true) {
                                            if (i >= questionobjectList.size()) {
                                                break;
                                            }
                                            HashMap<String, Object> quesObjectMap = JsonParse.geteObjectToMap(questionobjectList.get(i));
                                            if (quesObjectMap.get("id") != null) {
                                                String qid = quesObjectMap.get("id").toString();
                                                if (qid.equals(questionid) && quesObjectMap.get("inerror") != null) {
                                                    quesObjectMap.put("inerror", Integer.valueOf(inerror));
                                                    isTreeUpdate = true;
                                                }
                                            }
                                            if (!isTreeUpdate) {
                                                i++;
                                            } else {
                                                Object newObject = JsonCreate.MaptoJSONObject(quesObjectMap);
                                                if (newObject != null) {
                                                    questionobjectList.remove(i);
                                                    questionobjectList.add(i, newObject);
                                                }
                                            }
                                        }
                                        changeTreeData(tree, head, JsonCreate.toJSONArrayObject(questionobjectList), "question");
                                    }
                                }
                            }
                            if (isTreeUpdate) {
                                String newjson = JsonCreate.createjson(tree);
                                JsonCreate.saveJsonToLocal(newjson, bookjsonfilepath);
                            }
                        }
                    }
                }
            }
        }
    }

    public String getidList(Tree<HashMap<String, Object>> idtree, HashMap<String, Object> idhead, ArrayList<String> idList, String key, String questionid) {
        Collection<HashMap<String, Object>> Successors = idtree.getSuccessors(idhead);
        for (HashMap<String, Object> tempSuccessors : Successors) {
            if (tempSuccessors != null && tempSuccessors.get(key) != null) {
                String id = tempSuccessors.get(key).toString();
                idList.add(id);
                if (tempSuccessors.get("data") != null) {
                    ArrayList<Object> dataidarraylist = getValueList(new ArrayList<>(), tempSuccessors.get("data"));
                    if (dataidarraylist.size() > 0) {
                        try {
                            HashMap<String, Object> dataMap = this.common.parseJSONObject((JSONObject) dataidarraylist.get(0));
                            if (dataMap != null && dataMap.get(key) != null) {
                                questionid = dataMap.get(key).toString();
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
                questionid = getidList(idtree, tempSuccessors, idList, key, questionid);
            }
        }
        return questionid;
    }

    public HashMap<String, Object> getNeedDownHead(Tree<HashMap<String, Object>> tree, HashMap<String, Object> head, ArrayList<String> idList, String key) {
        for (int i = 1; i < idList.size(); i++) {
            String id = idList.get(i);
            Collection<HashMap<String, Object>> Successors = tree.getSuccessors(head);
            Iterator<HashMap<String, Object>> it = Successors.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                HashMap<String, Object> tempSuccessors = it.next();
                if (tempSuccessors.get(key) != null && id.equals(tempSuccessors.get(key).toString())) {
                    head = tempSuccessors;
                    break;
                }
            }
        }
        return head;
    }

    public String updateXINHomeworkProgressAndSize(Tree<HashMap<String, Object>> tree, String sourceId, HashMap<String, Object> tempMap, String webpath, String oldProgress, long downloadsize, String appName, String keywebpath, String keypath, String keydownloadsize, String keyprogress) {
        String totalprogress;
        getSizeKey(appName);
        ArrayList<Object> webpathList = new ArrayList<>();
        ArrayList<Object> webpathList1 = new ArrayList<>();
        ArrayList<Object> webpathList2 = new ArrayList<>();
        ArrayList<Object> pathList = new ArrayList<>();
        ArrayList<Object> pathList1 = new ArrayList<>();
        ArrayList<Object> pathList2 = new ArrayList<>();
        ArrayList<Object> progressList = new ArrayList<>();
        ArrayList<Object> sizeList = new ArrayList<>();
        ArrayList<Object> sizeList1 = new ArrayList<>();
        ArrayList<Object> sizeList2 = new ArrayList<>();
        ArrayList<Object> downloadsizeList = new ArrayList<>();
        ArrayList<Object> webpathList12 = getValueList(webpathList1, tempMap.get(KeyEnvironment.KEYWEBPATH));
        ArrayList<Object> webpathList22 = getValueList(webpathList2, tempMap.get(KeyEnvironment.KEYRESWEB));
        ArrayList<Object> pathList12 = getValueList(pathList1, tempMap.get("path"));
        ArrayList<Object> pathList22 = getValueList(pathList2, tempMap.get(KeyEnvironment.KEYRESPATH));
        ArrayList<Object> sizeList12 = getValueList(sizeList1, tempMap.get("size"));
        ArrayList<Object> sizeList22 = getValueList(sizeList2, tempMap.get(KeyEnvironment.KEYRESSIZE));
        webpathList.addAll(webpathList12);
        webpathList.addAll(webpathList22);
        pathList.addAll(pathList12);
        pathList.addAll(pathList22);
        sizeList.addAll(sizeList12);
        sizeList.addAll(sizeList22);
        ArrayList<Object> progressList2 = getValueList(progressList, tempMap.get(keyprogress));
        ArrayList<Object> downloadsizeList2 = getValueList(downloadsizeList, tempMap.get(keydownloadsize));
        Log.e("Test2:", "1213");
        if (webpathList == null || pathList == null || progressList2 == null || downloadsizeList2 == null || sizeList == null || webpathList.size() == 0 || webpathList.size() != pathList.size() || pathList.size() != progressList2.size() || progressList2.size() != downloadsizeList2.size() || downloadsizeList2.size() != sizeList.size()) {
            return "-1";
        }
        Log.e("Test2:", "1216");
        Log.e("Test2:", String.valueOf(webpath) + ">>>" + downloadsize);
        Log.e("Test2:", webpathList.toString());
        Log.e("Test2:", sizeList.toString());
        Log.e("Test2:", downloadsizeList2.toString());
        boolean ischange = updateDownloadsize(tree, false, tempMap, webpathList, progressList2, downloadsizeList2, sizeList, webpath, oldProgress, downloadsize, appName, keydownloadsize, keyprogress);
        if (!ischange || (!appName.equals("WrongQuestionSet") && !appName.equals("ZuoYeFuDao"))) {
            totalprogress = "-1";
        } else {
            totalprogress = updateTotalProgress("-1", downloadsizeList2, sizeList);
        }
        if (!ischange && appName.equals("DaoXueBen") && tempMap.get("exams") != null) {
            return updateExamsProgress(tree, ischange, totalprogress, tempMap, webpath, oldProgress, downloadsize);
        }
        return totalprogress;
    }
}
