package com.edutech.daoxueben.until;

import com.edutech.idauthentication.AppEnvironment;
import com.edutech.json.Books;
import com.edutech.json.CommonJSONParser;
import com.edutech.json.JsonCreate;
import com.edutech.json.JsonParse;
import com.edutech.json.JsonPort;
import com.edutech.json.KeyEnvironment;
import com.edutech.json.Tree;
import com.edutech.publicedu.log.LogHelp;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONStringer;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class InitDownLoad {
    private long downloadsize = 0;
    private long size = 0;
    private int total = 0;
    private int isnewCount = 0;
    private JsonPort jsonPort = new JsonPort();
    private CommonJSONParser common = new CommonJSONParser();

    public void updateKeys(Tree<HashMap<String, Object>> tree) {
        if (tree != null && tree.getHead() != null && tree.getHead().get("id") != null) {
            String bookId = tree.getHead().get("id").toString();
            addNewKeys(bookId, tree, tree.getHead(), "id");
        }
    }

    public void addNewKeys(String bookId, Tree<HashMap<String, Object>> tree, HashMap<String, Object> head, String key) {
        Object newObject;
        Object newObject2;
        Collection<HashMap<String, Object>> Successors = tree.getSuccessors(head);
        for (HashMap<String, Object> tempSuccessors : Successors) {
            if (tempSuccessors.get(key) != null) {
                tempSuccessors.get(key).toString();
                if (tempSuccessors.get("isdown") == null || tempSuccessors.get(AppEnvironment.ISNEW) == null) {
                    this.jsonPort.changeTreeData(tree, tempSuccessors, false, "isdown");
                    this.jsonPort.changeTreeData(tree, tempSuccessors, false, AppEnvironment.ISNEW);
                }
                if (tempSuccessors.get("dxitems") != null) {
                    ArrayList<Object> dxitemsobjectList = this.jsonPort.getValueList(new ArrayList<>(), tempSuccessors.get("dxitems"));
                    if (dxitemsobjectList != null && dxitemsobjectList.size() > 0) {
                        boolean ischange = false;
                        for (int i = 0; i < dxitemsobjectList.size(); i++) {
                            HashMap<String, Object> tempMap = this.jsonPort.objectToMap(dxitemsobjectList.get(i));
                            if (tempMap != null) {
                                if (tempMap.get("isdown") == null || tempMap.get(AppEnvironment.ISNEW) == null) {
                                    ischange = true;
                                    tempMap.put("isdown", false);
                                    tempMap.put(AppEnvironment.ISNEW, false);
                                }
                                if (tempMap.get(KeyEnvironment.KEYWEBPATH) != null && tempMap.get("path") != null && tempMap.get("size") != null) {
                                    ArrayList<Object> webpathList = this.jsonPort.getValueList(new ArrayList<>(), tempMap.get(KeyEnvironment.KEYWEBPATH));
                                    if (webpathList != null && webpathList.size() > 0 && (tempMap.get("progress") == null || tempMap.get(KeyEnvironment.KEYDOWNLOADSIZE) == null)) {
                                        ArrayList<Object> progressList = new ArrayList<>();
                                        ArrayList<Object> downloadsizeList = new ArrayList<>();
                                        for (int j = 0; j < webpathList.size(); j++) {
                                            progressList.add("0");
                                            downloadsizeList.add(0);
                                        }
                                        ischange = true;
                                        tempMap.put("progress", JsonCreate.toJSONArrayObject(progressList));
                                        tempMap.put(KeyEnvironment.KEYDOWNLOADSIZE, JsonCreate.toJSONArrayObject(downloadsizeList));
                                    }
                                }
                                if (tempMap.get("exams") != null) {
                                    if (tempMap.get("dxid") != null) {
                                        String dxid = tempMap.get("dxid").toString();
                                        createExamsJson(0, bookId, dxid, tempMap.get("exams"), com.edutech.daoxueben.sysconfig.AppEnvironment.StudentId);
                                    }
                                    ArrayList<Object> examsobjectList = new ArrayList<>();
                                    if (tempMap.get("0") == null) {
                                        ischange = true;
                                        tempMap.put("examsprogress", "100");
                                    }
                                    ArrayList<Object> examsobjectList2 = this.jsonPort.getValueList(examsobjectList, tempMap.get("exams"));
                                    if (examsobjectList2 != null && examsobjectList2.size() > 0) {
                                        boolean isexamchange = false;
                                        for (int j2 = 0; j2 < examsobjectList2.size(); j2++) {
                                            HashMap<String, Object> examtempMap = this.jsonPort.objectToMap(examsobjectList2.get(j2));
                                            if (examtempMap != null && examtempMap.get(KeyEnvironment.KEYWEBPATH) != null && examtempMap.get("path") != null && examtempMap.get("sizes") != null) {
                                                isexamchange = true;
                                                ArrayList<Object> webpathList2 = this.jsonPort.getValueList(new ArrayList<>(), examtempMap.get(KeyEnvironment.KEYWEBPATH));
                                                if (webpathList2 != null && webpathList2.size() > 0) {
                                                    ischange = true;
                                                    tempMap.put("examsprogress", "0");
                                                }
                                                if (webpathList2 != null && (examtempMap.get("progress") == null || examtempMap.get(KeyEnvironment.KEYDOWNLOADSIZE) == null)) {
                                                    ischange = true;
                                                    ArrayList<Object> progressList2 = new ArrayList<>();
                                                    ArrayList<Object> downloadsizeList2 = new ArrayList<>();
                                                    for (int k = 0; k < webpathList2.size(); k++) {
                                                        progressList2.add("0");
                                                        downloadsizeList2.add(0);
                                                    }
                                                    examtempMap.put("progress", JsonCreate.toJSONArrayObject(progressList2));
                                                    examtempMap.put(KeyEnvironment.KEYDOWNLOADSIZE, JsonCreate.toJSONArrayObject(downloadsizeList2));
                                                }
                                            }
                                            if (isexamchange && (newObject2 = JsonCreate.MaptoJSONObject(examtempMap)) != null) {
                                                examsobjectList2.remove(j2);
                                                examsobjectList2.add(j2, newObject2);
                                            }
                                        }
                                        tempMap.put("exams", JsonCreate.toJSONArrayObject(examsobjectList2));
                                    }
                                }
                            }
                            if (ischange && (newObject = JsonCreate.MaptoJSONObject(tempMap)) != null) {
                                dxitemsobjectList.remove(i);
                                dxitemsobjectList.add(i, newObject);
                            }
                        }
                        this.jsonPort.changeTreeData(tree, tempSuccessors, JsonCreate.toJSONArrayObject(dxitemsobjectList), "dxitems");
                    }
                }
                addNewKeys(bookId, tree, tempSuccessors, key);
            }
        }
    }

    public void changeIsDown(Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> idtree, ArrayList<HashMap<String, String>> needDownloadList, ArrayList<HashMap<String, String>> isDownTrueDownloadList) {
        if (tree != null && tree.getHead() != null && tree.getHead().get("id") != null) {
            String bookId = tree.getHead().get("id").toString();
            if (bookId.equals(idtree.getHead().get("id").toString())) {
                ArrayList<String> idList = new ArrayList<>();
                idList.add(bookId);
                String dxid = getidList(idtree, idtree.getHead(), idList, "id", "");
                String sourceId = this.jsonPort.listToSourceId(idList);
                HashMap<String, Object> head = tree.getHead();
                if (idList.size() > 1) {
                    head = getNeedDownHead(tree, tree.getHead(), idList, "id");
                }
                if (dxid.equals("")) {
                    tree.getSuccessors(head);
                    if (head.get("isdown") != null) {
                        boolean isdown = true;
                        try {
                            isdown = ((Boolean) head.get("isdown")).booleanValue();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        if (!isdown) {
                            this.jsonPort.changeTreeData(tree, head, true, "isdown");
                        }
                    }
                    updateDxiditemsIsDown(false, tree, head, dxid, bookId, sourceId, needDownloadList, isDownTrueDownloadList);
                    getNeedDownLoadList(bookId, sourceId, tree, head, needDownloadList, "id", needDownloadList, isDownTrueDownloadList);
                    return;
                }
                updateDxiditemsIsDown(true, tree, head, dxid, bookId, sourceId, needDownloadList, isDownTrueDownloadList);
            }
        }
    }

    public void updateDxiditemsIsDown(boolean isSingle, Tree<HashMap<String, Object>> tree, HashMap<String, Object> head, String dxid, String bookid, String soucrceId, ArrayList<HashMap<String, String>> needDownloadList, ArrayList<HashMap<String, String>> isDownTrueDownloadList) {
        Object newObject;
        if (head.get("dxitems") != null) {
            ArrayList<Object> dxitemsobjectList = this.jsonPort.getValueList(new ArrayList<>(), head.get("dxitems"));
            if (dxitemsobjectList != null && dxitemsobjectList.size() > 0) {
                boolean ischange = false;
                for (int i = 0; i < dxitemsobjectList.size(); i++) {
                    HashMap<String, Object> tempMap = this.jsonPort.objectToMap(dxitemsobjectList.get(i));
                    if (tempMap != null && tempMap.get("dxid") != null) {
                        if (isSingle) {
                            if (dxid.equals(tempMap.get("dxid").toString())) {
                                ischange = true;
                                boolean isdown = true;
                                try {
                                    isdown = ((Boolean) tempMap.get("isdown")).booleanValue();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                                if (!isdown) {
                                    tempMap.put("isdown", true);
                                    addToneedDownloadList(bookid, soucrceId, tempMap, needDownloadList);
                                } else {
                                    addToneedDownloadList(bookid, soucrceId, tempMap, isDownTrueDownloadList);
                                }
                            }
                        } else {
                            ischange = true;
                            boolean isdown2 = true;
                            try {
                                isdown2 = ((Boolean) tempMap.get("isdown")).booleanValue();
                            } catch (Exception e2) {
                                e2.printStackTrace();
                            }
                            if (!isdown2) {
                                tempMap.put("isdown", true);
                                addToneedDownloadList(bookid, soucrceId, tempMap, needDownloadList);
                            } else {
                                addToneedDownloadList(bookid, soucrceId, tempMap, isDownTrueDownloadList);
                            }
                        }
                        if (ischange && (newObject = JsonCreate.MaptoJSONObject(tempMap)) != null) {
                            dxitemsobjectList.remove(i);
                            dxitemsobjectList.add(i, newObject);
                        }
                    }
                }
                this.jsonPort.changeTreeData(tree, head, JsonCreate.toJSONArrayObject(dxitemsobjectList), "dxitems");
            }
        }
    }

    public String getidList(Tree<HashMap<String, Object>> idtree, HashMap<String, Object> idhead, ArrayList<String> idList, String key, String dxid) {
        Collection<HashMap<String, Object>> Successors = idtree.getSuccessors(idhead);
        for (HashMap<String, Object> tempSuccessors : Successors) {
            if (tempSuccessors != null && tempSuccessors.get(key) != null) {
                String id = tempSuccessors.get(key).toString();
                idList.add(id);
                if (tempSuccessors.get("dxid") != null) {
                    dxid = tempSuccessors.get("dxid").toString();
                }
                dxid = getidList(idtree, tempSuccessors, idList, key, dxid);
            }
        }
        return dxid;
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

    public void getNeedDownLoadList(String bookId, String sourceId, Tree<HashMap<String, Object>> tree, HashMap<String, Object> head, ArrayList<HashMap<String, String>> downloadlist, String key, ArrayList<HashMap<String, String>> needDownloadList, ArrayList<HashMap<String, String>> isDownTrueDownloadList) {
        String sourceId2;
        Collection<HashMap<String, Object>> Successors = tree.getSuccessors(head);
        for (HashMap<String, Object> tempSuccessors : Successors) {
            if (tempSuccessors != null && tempSuccessors.get(key) != null) {
                if ("".equals(sourceId)) {
                    sourceId2 = tempSuccessors.get(key).toString();
                } else {
                    sourceId2 = String.valueOf(sourceId) + "_" + tempSuccessors.get(key).toString();
                }
                if (tempSuccessors.get("isdown") != null) {
                    boolean isdown = true;
                    try {
                        isdown = ((Boolean) tempSuccessors.get("isdown")).booleanValue();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    if (!isdown) {
                        this.jsonPort.changeTreeData(tree, tempSuccessors, true, "isdown");
                    }
                }
                updateDxiditemsIsDown(false, tree, tempSuccessors, "", bookId, sourceId2, needDownloadList, isDownTrueDownloadList);
                getNeedDownLoadList(bookId, sourceId2, tree, tempSuccessors, downloadlist, key, needDownloadList, isDownTrueDownloadList);
                sourceId = this.jsonPort.removeSourceId(sourceId2);
            }
        }
    }

    private ArrayList<HashMap<String, String>> addToneedDownloadList(String bookId, String sourceId, HashMap<String, Object> tempDataMap, ArrayList<HashMap<String, String>> downloadlist) {
        if (tempDataMap != null) {
            try {
                if (tempDataMap.get("dxid") != null) {
                    String SourceID = String.valueOf(sourceId) + "_" + tempDataMap.get("dxid").toString();
                    addToDownList(bookId, SourceID, tempDataMap, "size", downloadlist);
                    if (tempDataMap.get("exams") != null) {
                        String dxid = tempDataMap.get("dxid").toString();
                        createExamsJson(1, bookId, dxid, tempDataMap.get("exams"), com.edutech.daoxueben.sysconfig.AppEnvironment.StudentId);
                        ArrayList<Object> examsobjectList = this.jsonPort.getValueList(new ArrayList<>(), tempDataMap.get("exams"));
                        if (examsobjectList != null && examsobjectList.size() > 0) {
                            for (int j = 0; j < examsobjectList.size(); j++) {
                                HashMap<String, Object> examDataMap = this.jsonPort.objectToMap(examsobjectList.get(j));
                                if (examDataMap != null) {
                                    addToDownList(bookId, SourceID, examDataMap, "sizes", downloadlist);
                                }
                            }
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return downloadlist;
    }

    public void addToDownList(String bookId, String sourceId, HashMap<String, Object> tempDataMap, String sizekey, ArrayList<HashMap<String, String>> downloadlist) {
        if (tempDataMap.get(KeyEnvironment.KEYWEBPATH) != null && tempDataMap.get("path") != null && tempDataMap.get("progress") != null && tempDataMap.get(sizekey) != null) {
            ArrayList<Object> webpathList = new ArrayList<>();
            ArrayList<Object> pathList = new ArrayList<>();
            ArrayList<Object> progressList = new ArrayList<>();
            ArrayList<Object> sizeList = new ArrayList<>();
            ArrayList<Object> webpathList2 = this.jsonPort.getValueList(webpathList, tempDataMap.get(KeyEnvironment.KEYWEBPATH));
            ArrayList<Object> pathList2 = this.jsonPort.getValueList(pathList, tempDataMap.get("path"));
            ArrayList<Object> progressList2 = this.jsonPort.getValueList(progressList, tempDataMap.get("progress"));
            ArrayList<Object> sizeList2 = this.jsonPort.getValueList(sizeList, tempDataMap.get(sizekey));
            if (webpathList2 != null && pathList2 != null && progressList2 != null && sizeList2 != null && webpathList2.size() != 0 && webpathList2.size() == pathList2.size() && pathList2.size() == progressList2.size() && progressList2.size() == sizeList2.size()) {
                for (int i = 0; i < webpathList2.size(); i++) {
                    if (!"100".equals(progressList2.get(i).toString())) {
                        String webpath = webpathList2.get(i).toString();
                        String path = pathList2.get(i).toString();
                        String progress = progressList2.get(i).toString();
                        String size = sizeList2.get(i).toString();
                        HashMap<String, String> downInfo = new HashMap<>();
                        downInfo.put("book_id", bookId);
                        downInfo.put("source_id", sourceId);
                        downInfo.put("source_webpath", webpath);
                        downInfo.put("source_path", path);
                        downInfo.put("source_progress", progress);
                        downInfo.put("source_size", size);
                        downInfo.put(com.edutech.daoxueben.sysconfig.AppEnvironment.SOURCE_ISDOWN, LogHelp.TYPE_GUIDANCE);
                        downloadlist.add(downInfo);
                    }
                }
            }
        }
    }

    public void createExamsJson(int jsupdate, String bookid, String dxid, Object exams, String studentid) {
        if (exams != null && !"".equals(bookid) && !"".equals(dxid)) {
            JSONStringer jsonStringer = new JSONStringer();
            try {
                jsonStringer.object();
                jsonStringer.key("studentid").value(studentid);
                jsonStringer.key("exams").value(exams);
                jsonStringer.endObject();
            } catch (JSONException e) {
                e.printStackTrace();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
            String json = jsonStringer.toString();
            String pathdir = String.valueOf(com.edutech.daoxueben.sysconfig.AppEnvironment.OFFLINE_DOWNLOAD) + bookid + "/" + dxid + "/" + studentid + "/";
            String path = String.valueOf(com.edutech.daoxueben.sysconfig.AppEnvironment.OFFLINE_DOWNLOAD) + bookid + "/" + dxid + "/" + studentid + "/" + dxid + ".json";
            File outFile = new File(path);
            if (jsupdate == 0) {
                if (!FileInOutHelper.fileIsExists(pathdir)) {
                    FileInOutHelper.createNewFile(outFile);
                    com.edutech.idauthentication.JsonHelper.CreateFile(json, path);
                }
            } else if (jsupdate == 1) {
                if (outFile.exists()) {
                    outFile.delete();
                }
                FileInOutHelper.createNewFile(outFile);
                com.edutech.idauthentication.JsonHelper.CreateFile(json, path);
            }
        }
    }

    public void updateBooksJson(Tree<HashMap<String, Object>> tree) {
        Books book = new Books();
        this.jsonPort.updateBooksJson(getBooks(tree, book), com.edutech.daoxueben.sysconfig.AppEnvironment.JSON_BOOKS_File);
    }

    public Books getBooks(Tree<HashMap<String, Object>> tree, Books book) {
        if (tree != null && tree.getHead() != null && tree.getHead().get("id") != null) {
            String id = tree.getHead().get("id").toString();
            String name = tree.getHead().get("name").toString();
            String updatetime = tree.getHead().get("updatetime").toString();
            if (id != null) {
                book.setbook_id(id);
                book.setbook_path("../offlinedownload/" + id + "/");
            }
            if (name != null) {
                book.setbook_name(name);
            }
            if (updatetime != null) {
                book.setBook_updatetime(updatetime);
            }
            this.downloadsize = 0L;
            this.size = 0L;
            this.total = 0;
            this.isnewCount = 0;
            updateBooksJson(tree, tree.getHead());
            book.setBook_total(this.total);
            book.setBookdownloadsize(this.downloadsize);
            book.setBooksize(this.size);
            if (this.size == 0) {
                book.setProgress("100");
            } else {
                String newprogress = Long.toString((((float) this.downloadsize) * 100.0f) / ((float) this.size));
                if (this.downloadsize == this.size) {
                    book.setProgress("100");
                } else if (this.downloadsize > 0 && "0".equals(newprogress)) {
                    book.setProgress(LogHelp.TYPE_GUIDANCE);
                } else {
                    book.setProgress(newprogress);
                }
            }
            if (this.isnewCount == 0) {
                book.setBook_isnew(0);
            } else {
                book.setBook_isnew(1);
            }
        }
        this.downloadsize = 0L;
        this.size = 0L;
        this.total = 0;
        this.isnewCount = 0;
        return book;
    }

    private void updateBooksJson(Tree<HashMap<String, Object>> tree, HashMap<String, Object> head) {
        HashMap<String, Object> tempDxitemsMap;
        Collection<HashMap<String, Object>> Successors = tree.getSuccessors(head);
        for (HashMap<String, Object> tempSuccessors : Successors) {
            if (tempSuccessors.get("dxitems") != null) {
                ArrayList<Object> dxitemsList = this.jsonPort.getValueList(new ArrayList<>(), tempSuccessors.get("dxitems"));
                if (dxitemsList != null && dxitemsList.size() > 0) {
                    for (int i = 0; i < dxitemsList.size(); i++) {
                        Object dxitemsObject = dxitemsList.get(i);
                        if (dxitemsObject != null && (tempDxitemsMap = JsonParse.geteObjectToMap(dxitemsObject)) != null && tempDxitemsMap.get("dxid") != null) {
                            boolean booklisdown = false;
                            if (tempDxitemsMap.get("isdown") != null) {
                                try {
                                    booklisdown = ((Boolean) tempDxitemsMap.get("isdown")).booleanValue();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                            if (tempDxitemsMap.get(KeyEnvironment.KEYWEBPATH) != null) {
                                ArrayList<Object> webpathList = this.jsonPort.getValueList(new ArrayList<>(), tempDxitemsMap.get(KeyEnvironment.KEYWEBPATH));
                                this.total += webpathList.size();
                                if (booklisdown) {
                                    getSize(tempDxitemsMap, "size", webpathList);
                                }
                            }
                            if (tempDxitemsMap.get("exams") != null) {
                                ArrayList<Object> examsobjectList = this.jsonPort.getValueList(new ArrayList<>(), tempDxitemsMap.get("exams"));
                                if (examsobjectList != null && examsobjectList.size() > 0) {
                                    this.total += examsobjectList.size();
                                    if (booklisdown) {
                                        for (int j = 0; j < examsobjectList.size(); j++) {
                                            HashMap<String, Object> tempDataMap = this.jsonPort.objectToMap(examsobjectList.get(j));
                                            if (tempDataMap != null && tempDataMap.get(KeyEnvironment.KEYWEBPATH) != null) {
                                                ArrayList<Object> webpathList2 = this.jsonPort.getValueList(new ArrayList<>(), tempDataMap.get(KeyEnvironment.KEYWEBPATH));
                                                if (webpathList2 != null && webpathList2.size() > 0 && booklisdown) {
                                                    getSize(tempDataMap, "sizes", webpathList2);
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
            if (tempSuccessors.get(AppEnvironment.ISNEW) != null) {
                boolean boolisnew = false;
                try {
                    boolisnew = ((Boolean) tempSuccessors.get(AppEnvironment.ISNEW)).booleanValue();
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
                if (boolisnew) {
                    this.isnewCount++;
                }
            }
            updateBooksJson(tree, tempSuccessors);
        }
    }

    public void getSize(HashMap<String, Object> tempDataMap, String sizekey, ArrayList<Object> webpathList) {
        if (tempDataMap.get(KeyEnvironment.KEYDOWNLOADSIZE) != null && tempDataMap.get(sizekey) != null) {
            ArrayList<Object> downloadsizelist = new ArrayList<>();
            ArrayList<Object> sizeList = new ArrayList<>();
            ArrayList<Object> downloadsizelist2 = this.jsonPort.getValueList(downloadsizelist, tempDataMap.get(KeyEnvironment.KEYDOWNLOADSIZE));
            ArrayList<Object> sizeList2 = this.jsonPort.getValueList(sizeList, tempDataMap.get(sizekey));
            if (webpathList != null && downloadsizelist2 != null && sizeList2 != null && webpathList.size() != 0 && webpathList.size() == downloadsizelist2.size() && downloadsizelist2.size() == sizeList2.size()) {
                for (int i = 0; i < webpathList.size(); i++) {
                    this.downloadsize += Long.valueOf(downloadsizelist2.get(i).toString()).longValue();
                    this.size += Long.valueOf(sizeList2.get(i).toString()).longValue();
                }
            }
        }
    }

    public boolean treeIschange(boolean ischange, Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> localtree) {
        if (tree != null && localtree != null && tree.getHead() != null && localtree.getHead() != null && tree.getHead().get("id") != null && localtree.getHead().get("id") != null) {
            String bookid = tree.getHead().get("id").toString();
            if (bookid.equals(localtree.getHead().get("id").toString())) {
                ArrayList<String> idList = new ArrayList<>();
                idList.add(bookid);
                return compareisDown(ischange, idList, tree, localtree, tree.getHead(), localtree.getHead(), "id");
            }
            return ischange;
        }
        return ischange;
    }

    private boolean compareisDown(boolean ischange, ArrayList<String> idList, Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> localtree, HashMap<String, Object> head, HashMap<String, Object> idhead, String key) {
        Collection<HashMap<String, Object>> idSuccessors = localtree.getSuccessors(idhead);
        for (HashMap<String, Object> tempidSuccessors : idSuccessors) {
            if (tempidSuccessors != null && tempidSuccessors.get(key) != null) {
                idList.add(tempidSuccessors.get(key).toString());
                boolean ischange2 = compareTreewebpath(ischange, idList, tree, localtree, head, tempidSuccessors, key);
                if (ischange2) {
                    return ischange2;
                }
                ischange = compareisDown(ischange2, idList, tree, localtree, head, tempidSuccessors, key);
                if (idList.size() > 0) {
                    idList.remove(idList.size() - 1);
                }
            }
        }
        return ischange;
    }

    private boolean compareTreewebpath(boolean ischange, ArrayList<String> idList, Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> localtree, HashMap<String, Object> head, HashMap<String, Object> idhead, String key) {
        for (int i = 1; i < idList.size(); i++) {
            Collection<HashMap<String, Object>> Successors = tree.getSuccessors(head);
            boolean isfound = false;
            for (HashMap<String, Object> tempSuccessors : Successors) {
                if (tempSuccessors != null && tempSuccessors.get(key) != null && idList.get(i).equals(tempSuccessors.get(key).toString())) {
                    isfound = true;
                    head = tempSuccessors;
                    if (i == idList.size() - 1 && idhead != null && idhead.get(AppEnvironment.ISNEW) != null) {
                        boolean isnew = false;
                        try {
                            isnew = ((Boolean) idhead.get(AppEnvironment.ISNEW)).booleanValue();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        if (isnew) {
                            ischange = true;
                        }
                    }
                }
            }
            if (!isfound) {
                return true;
            }
        }
        return ischange;
    }

    private boolean compareWebpath(boolean ischange, HashMap<String, Object> head, HashMap<String, Object> idhead, String key) {
        if ((head.get(KeyEnvironment.KEYWEBPATH) != null && idhead.get(KeyEnvironment.KEYWEBPATH) == null) || (head.get(KeyEnvironment.KEYWEBPATH) == null && idhead.get(KeyEnvironment.KEYWEBPATH) != null)) {
            return true;
        }
        if (head.get(KeyEnvironment.KEYWEBPATH) != null && idhead.get(KeyEnvironment.KEYWEBPATH) != null) {
            ArrayList<Object> headwebpathList = new ArrayList<>();
            ArrayList<Object> idheadwebpathList = new ArrayList<>();
            ArrayList<Object> headwebpathList2 = this.jsonPort.getValueList(headwebpathList, head.get(KeyEnvironment.KEYWEBPATH));
            ArrayList<Object> idheadwebpathList2 = this.jsonPort.getValueList(idheadwebpathList, idhead.get(KeyEnvironment.KEYWEBPATH));
            if ((headwebpathList2 != null && headwebpathList2.size() > 0 && idheadwebpathList2.size() == 0) || (headwebpathList2.size() == 0 && idheadwebpathList2 != null && idheadwebpathList2.size() > 0)) {
                return true;
            }
            if (headwebpathList2 != null && idheadwebpathList2 != null) {
                if (headwebpathList2.size() != idheadwebpathList2.size()) {
                    return true;
                }
                for (int i = 0; i < headwebpathList2.size(); i++) {
                    if (!headwebpathList2.get(i).equals(idheadwebpathList2.get(i))) {
                        return true;
                    }
                }
            }
        }
        return ischange;
    }

    public void treeReplace(String downloadjsonbookid, Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> localtree, ArrayList<HashMap<String, String>> isDownTrueDownloadList, ArrayList<HashMap<String, String>> sourceNeedRemove) {
        if (tree != null && localtree != null && tree.getHead() != null && localtree.getHead() != null && tree.getHead().get("id") != null && localtree.getHead().get("id") != null) {
            String bookid = tree.getHead().get("id").toString();
            if (bookid.equals(localtree.getHead().get("id").toString())) {
                ArrayList<String> idList = new ArrayList<>();
                idList.add(bookid);
                getisDown(downloadjsonbookid, idList, tree, localtree, tree.getHead(), localtree.getHead(), "id", sourceNeedRemove, isDownTrueDownloadList);
            }
        }
    }

    private void getisDown(String downloadjsonbookid, ArrayList<String> idList, Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> localtree, HashMap<String, Object> head, HashMap<String, Object> idhead, String key, ArrayList<HashMap<String, String>> sourceNeedRemove, ArrayList<HashMap<String, String>> isDownTrueDownloadList) {
        Collection<HashMap<String, Object>> idSuccessors = localtree.getSuccessors(idhead);
        for (HashMap<String, Object> tempidSuccessors : idSuccessors) {
            if (tempidSuccessors != null && tempidSuccessors.get(key) != null) {
                idList.add(tempidSuccessors.get(key).toString());
                rePlaceTreewebpath(downloadjsonbookid, idList, tree, localtree, tree.getHead(), tempidSuccessors, key, sourceNeedRemove, isDownTrueDownloadList);
                getisDown(downloadjsonbookid, idList, tree, localtree, tree.getHead(), tempidSuccessors, key, sourceNeedRemove, isDownTrueDownloadList);
                if (idList.size() > 0) {
                    idList.remove(idList.size() - 1);
                }
            }
        }
    }

    private void rePlaceTreewebpath(String downloadjsonbookid, ArrayList<String> idList, Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> localtree, HashMap<String, Object> head, HashMap<String, Object> idhead, String key, ArrayList<HashMap<String, String>> sourceNeedRemove, ArrayList<HashMap<String, String>> isDownTrueDownloadList) {
        HashMap<String, Object> tempMap;
        HashMap<String, Object> idtempMap;
        String bookId = "";
        if (idList.size() > 0) {
            String bookId2 = idList.get(0);
            bookId = bookId2;
        }
        for (int i = 1; i < idList.size(); i++) {
            Collection<HashMap<String, Object>> Successors = tree.getSuccessors(head);
            for (HashMap<String, Object> tempSuccessors : Successors) {
                if (tempSuccessors != null && tempSuccessors.get(key) != null && idList.get(i).equals(tempSuccessors.get(key).toString())) {
                    head = tempSuccessors;
                    if (i == idList.size() - 1) {
                        if (idhead.get("isdown") != null) {
                            boolean isdown = false;
                            try {
                                isdown = ((Boolean) idhead.get("isdown")).booleanValue();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                            if (isdown) {
                                this.jsonPort.changeTreeData(tree, head, true, "isdown");
                            }
                        }
                        if (head.get("dxitems") != null) {
                            ArrayList<Object> dxitemsList = this.jsonPort.getValueList(new ArrayList<>(), head.get("dxitems"));
                            if (dxitemsList != null && dxitemsList.size() > 0) {
                                for (int j = 0; j < dxitemsList.size(); j++) {
                                    Object object = dxitemsList.get(j);
                                    if (object != null && (tempMap = JsonParse.geteObjectToMap(object)) != null && tempMap.get("dxid") != null) {
                                        String dxidString = tempMap.get("dxid").toString();
                                        if (idhead.get("dxitems") != null) {
                                            ArrayList<Object> iddxitemsList = this.jsonPort.getValueList(new ArrayList<>(), idhead.get("dxitems"));
                                            if (iddxitemsList != null && iddxitemsList.size() > 0) {
                                                int k = 0;
                                                while (true) {
                                                    if (k >= iddxitemsList.size()) {
                                                        break;
                                                    }
                                                    Object idobject = iddxitemsList.get(k);
                                                    if (idobject == null || (idtempMap = JsonParse.geteObjectToMap(idobject)) == null || idtempMap.get("dxid") == null || !dxidString.equals(idtempMap.get("dxid").toString()) || idtempMap.get("isdown") == null) {
                                                        k++;
                                                    } else {
                                                        try {
                                                            ((Boolean) idtempMap.get("isdown")).booleanValue();
                                                        } catch (Exception e2) {
                                                            e2.printStackTrace();
                                                        }
                                                        if (1 != 0) {
                                                            rePlaceWebpath(bookId, false, tree, tempMap, idtempMap, sourceNeedRemove);
                                                            if (idtempMap.get("isdown") != null && idtempMap.get(AppEnvironment.ISNEW) != null && idtempMap.get("examsprogress") != null) {
                                                                tempMap.put("isdown", idtempMap.get("isdown"));
                                                                tempMap.put(AppEnvironment.ISNEW, false);
                                                                tempMap.put("examsprogress", idtempMap.get("examsprogress"));
                                                            }
                                                            ArrayList<Object> headexamsobjectList = new ArrayList<>();
                                                            ArrayList<Object> idheadexamsobjectList = new ArrayList<>();
                                                            int headexamssize = 0;
                                                            int idheadexamssize = 0;
                                                            if (tempMap.get("exams") != null && (headexamsobjectList = this.jsonPort.getValueList(headexamsobjectList, tempMap.get("exams"))) != null && headexamsobjectList.size() > 0) {
                                                                headexamssize = headexamsobjectList.size();
                                                            }
                                                            if (idtempMap.get("exams") != null && (idheadexamsobjectList = this.jsonPort.getValueList(idheadexamsobjectList, idtempMap.get("exams"))) != null && idheadexamsobjectList.size() > 0) {
                                                                idheadexamssize = idheadexamsobjectList.size();
                                                            }
                                                            if (headexamssize != 0 && headexamssize == idheadexamssize) {
                                                                for (int m = 0; m < headexamsobjectList.size(); m++) {
                                                                    HashMap<String, Object> headtempMap = this.jsonPort.objectToMap(headexamsobjectList.get(m));
                                                                    HashMap<String, Object> iheadidtempMap = this.jsonPort.objectToMap(idheadexamsobjectList.get(m));
                                                                    if (headtempMap != null && iheadidtempMap != null && headtempMap.get("questionid") != null && iheadidtempMap.get("questionid") != null) {
                                                                        rePlaceWebpath(bookId, true, tree, headtempMap, iheadidtempMap, sourceNeedRemove);
                                                                        Object newobject = JsonCreate.MaptoJSONObject(headtempMap);
                                                                        headexamsobjectList.remove(m);
                                                                        headexamsobjectList.add(m, newobject);
                                                                    }
                                                                }
                                                                Object arrayObject = JsonCreate.toJSONArrayObject(headexamsobjectList);
                                                                tempMap.put("exams", arrayObject);
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        Object newObject = JsonCreate.MaptoJSONObject(tempMap);
                                        if (newObject != null) {
                                            dxitemsList.remove(j);
                                            dxitemsList.add(j, newObject);
                                        }
                                    }
                                }
                                this.jsonPort.changeTreeData(tree, head, JsonCreate.toJSONArrayObject(dxitemsList), "dxitems");
                            }
                        }
                        if ("-2".equals(downloadjsonbookid) && idList.size() > 0 && !"".equals(bookId)) {
                            String sourceId = this.jsonPort.listToSourceId(idList);
                            updateDxiditemsIsDown(tree, head, bookId, sourceId, isDownTrueDownloadList);
                        }
                    }
                }
            }
        }
        if (0 == 0 && !"".equals(bookId)) {
            getidheadSourceRemoveList(bookId, localtree, idhead, sourceNeedRemove);
        }
    }

    public void updateDxiditemsIsDown(Tree<HashMap<String, Object>> tree, HashMap<String, Object> head, String bookid, String soucrceId, ArrayList<HashMap<String, String>> isDownTrueDownloadList) {
        if (head.get("dxitems") != null) {
            ArrayList<Object> dxitemsobjectList = this.jsonPort.getValueList(new ArrayList<>(), head.get("dxitems"));
            if (dxitemsobjectList != null && dxitemsobjectList.size() > 0) {
                for (int i = 0; i < dxitemsobjectList.size(); i++) {
                    HashMap<String, Object> tempMap = this.jsonPort.objectToMap(dxitemsobjectList.get(i));
                    if (tempMap != null && tempMap.get("dxid") != null) {
                        boolean isdown = true;
                        try {
                            isdown = ((Boolean) tempMap.get("isdown")).booleanValue();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        if (isdown) {
                            addToneedDownloadList(bookid, soucrceId, tempMap, isDownTrueDownloadList);
                        }
                    }
                }
            }
        }
    }

    private void rePlaceWebpath(String bookId, boolean isexam, Tree<HashMap<String, Object>> tree, HashMap<String, Object> head, HashMap<String, Object> idhead, ArrayList<HashMap<String, String>> sourceNeedRemove) {
        if (idhead.get(KeyEnvironment.KEYWEBPATH) != null && idhead.get("progress") != null && idhead.get(KeyEnvironment.KEYDOWNLOADSIZE) != null) {
            ArrayList<Object> idheadwebpathList = new ArrayList<>();
            ArrayList<Object> idheadprogressList = new ArrayList<>();
            ArrayList<Object> idheaddownloadsizeList = new ArrayList<>();
            ArrayList<Object> idheadpathList = new ArrayList<>();
            ArrayList<Object> idheadwebpathList2 = this.jsonPort.getValueList(idheadwebpathList, idhead.get(KeyEnvironment.KEYWEBPATH));
            ArrayList<Object> idheadprogressList2 = this.jsonPort.getValueList(idheadprogressList, idhead.get("progress"));
            ArrayList<Object> idheaddownloadsizeList2 = this.jsonPort.getValueList(idheaddownloadsizeList, idhead.get(KeyEnvironment.KEYDOWNLOADSIZE));
            ArrayList<Object> idheadpathList2 = this.jsonPort.getValueList(idheadpathList, idhead.get("path"));
            ArrayList<Object> headwebpathList = new ArrayList<>();
            ArrayList<Object> headprogressList = new ArrayList<>();
            ArrayList<Object> headdownloadsizeList = new ArrayList<>();
            int headListSize = 0;
            if (idheadwebpathList2 != null && idheadprogressList2 != null && idheaddownloadsizeList2 != null && idheadpathList2 != null && idheadwebpathList2.size() > 0 && idheadwebpathList2.size() == idheadprogressList2.size() && idheadprogressList2.size() == idheaddownloadsizeList2.size() && idheaddownloadsizeList2.size() == idheadpathList2.size()) {
                if (head.get(KeyEnvironment.KEYWEBPATH) != null && head.get("progress") != null && head.get(KeyEnvironment.KEYDOWNLOADSIZE) != null) {
                    headwebpathList = this.jsonPort.getValueList(headwebpathList, head.get(KeyEnvironment.KEYWEBPATH));
                    headprogressList = this.jsonPort.getValueList(headprogressList, head.get("progress"));
                    headdownloadsizeList = this.jsonPort.getValueList(headdownloadsizeList, head.get(KeyEnvironment.KEYDOWNLOADSIZE));
                    if (headwebpathList != null && headprogressList != null && headdownloadsizeList != null && headwebpathList.size() > 0 && headwebpathList.size() == headprogressList.size() && headprogressList.size() == headdownloadsizeList.size()) {
                        headListSize = headwebpathList.size();
                    }
                }
                for (int i = 0; i < idheadwebpathList2.size(); i++) {
                    String idheadwebpath = idheadwebpathList2.get(i).toString();
                    String idpath = idheadpathList2.get(i).toString();
                    boolean isfound = false;
                    int j = 0;
                    while (true) {
                        if (j < headListSize) {
                            if (!idheadwebpath.equals(headwebpathList.get(j).toString())) {
                                j++;
                            } else {
                                headprogressList.remove(j);
                                headprogressList.add(j, idheadprogressList2.get(i));
                                headdownloadsizeList.remove(j);
                                headdownloadsizeList.add(j, idheaddownloadsizeList2.get(i));
                                isfound = true;
                                break;
                            }
                        } else {
                            break;
                        }
                    }
                    if (!isfound) {
                        updateSourceNeedRemoveList(bookId, idheadwebpath, idpath, sourceNeedRemove);
                    }
                }
                head.put("progress", JsonCreate.toJSONArrayObject(headprogressList));
                head.put(KeyEnvironment.KEYDOWNLOADSIZE, JsonCreate.toJSONArrayObject(headdownloadsizeList));
            }
        }
    }

    private void getidheadSourceRemoveList(String bookId, Tree<HashMap<String, Object>> localtree, HashMap<String, Object> idhead, ArrayList<HashMap<String, String>> sourceNeedRemove) {
        ArrayList<Object> idheadexamsobjectList;
        getSourceRemovepath(bookId, idhead, sourceNeedRemove);
        ArrayList<Object> idheadexamsobjectList2 = new ArrayList<>();
        if (idhead.get("exams") != null && (idheadexamsobjectList = this.jsonPort.getValueList(idheadexamsobjectList2, idhead.get("exams"))) != null && idheadexamsobjectList.size() > 0) {
            for (int k = 0; k < idheadexamsobjectList.size(); k++) {
                HashMap<String, Object> tempMap = this.jsonPort.objectToMap(idheadexamsobjectList.get(k));
                if (tempMap != null && tempMap.get("questionid") != null) {
                    getSourceRemovepath(bookId, tempMap, sourceNeedRemove);
                }
            }
        }
    }

    private void getSourceRemovepath(String bookId, HashMap<String, Object> idhead, ArrayList<HashMap<String, String>> sourceNeedRemove) {
        if (idhead.get(KeyEnvironment.KEYWEBPATH) != null && idhead.get("path") != null) {
            ArrayList<Object> idheadwebpathList = new ArrayList<>();
            ArrayList<Object> idheadpathList = new ArrayList<>();
            ArrayList<Object> idheadwebpathList2 = this.jsonPort.getValueList(idheadwebpathList, idhead.get(KeyEnvironment.KEYWEBPATH));
            ArrayList<Object> idheadpathList2 = this.jsonPort.getValueList(idheadpathList, idhead.get("path"));
            if (idheadwebpathList2 != null && idheadpathList2 != null && idheadwebpathList2.size() != 0 && idheadwebpathList2.size() == idheadpathList2.size()) {
                for (int i = 0; i < idheadwebpathList2.size(); i++) {
                    String idheadwebpath = idheadwebpathList2.get(i).toString();
                    String idpath = idheadpathList2.get(i).toString();
                    updateSourceNeedRemoveList(bookId, idheadwebpath, idpath, sourceNeedRemove);
                }
            }
        }
    }

    private void updateSourceNeedRemoveList(String bookId, String webpath, String path, ArrayList<HashMap<String, String>> sourceNeedRemove) {
        if (!"".equals(bookId)) {
            HashMap<String, String> sources = new HashMap<>();
            sources.put("book_id", bookId);
            sources.put("source_webpath", webpath);
            sources.put("source_path", path);
            sourceNeedRemove.add(sources);
        }
    }
}
