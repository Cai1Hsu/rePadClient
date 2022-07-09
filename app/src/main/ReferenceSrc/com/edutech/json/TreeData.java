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

/* loaded from: classes.jar:com/edutech/json/TreeData.class */
public class TreeData {
    private CommonJSONParser common = new CommonJSONParser();

    private ArrayList<HashMap<String, String>> addDaoToDownloadList(String str, String str2, HashMap<String, Object> hashMap, ArrayList<HashMap<String, String>> arrayList, String str3) {
        boolean z = false;
        if (hashMap.get("isdown") != null) {
            try {
                z = ((Boolean) hashMap.get("isdown")).booleanValue();
            } catch (Exception e) {
                e.printStackTrace();
                z = false;
            }
        }
        ArrayList<HashMap<String, String>> arrayList2 = arrayList;
        if (z) {
            ArrayList<HashMap<String, String>> updateDownloadlist = updateDownloadlist(str, str2, hashMap, arrayList, "size", KeyEnvironment.KEYWEBPATH, "path", "progress");
            ArrayList<Object> arrayList3 = new ArrayList<>();
            arrayList2 = updateDownloadlist;
            if (hashMap.get(getDataName(str3)) != null) {
                ArrayList<Object> valueList = getValueList(arrayList3, hashMap.get(getDataName(str3)));
                arrayList2 = updateDownloadlist;
                if (valueList != null) {
                    arrayList2 = updateDownloadlist;
                    if (valueList.size() > 0) {
                        Iterator<Object> it = valueList.iterator();
                        arrayList2 = updateDownloadlist;
                        while (it.hasNext()) {
                            Object next = it.next();
                            addToneedDownloadList(str, str2, next, arrayList2, str3);
                            HashMap<String, Object> hashMap2 = JsonParse.geteObjectToMap(next);
                            if (hashMap2 != null) {
                                arrayList2 = updateDownloadlist(str, str2, hashMap2, arrayList2, "sizes", KeyEnvironment.KEYWEBPATH, "path", "progress");
                            }
                        }
                    }
                }
            }
        }
        return arrayList2;
    }

    private ArrayList<HashMap<String, String>> addNewDaoToDownloadList(String str, String str2, HashMap<String, Object> hashMap, ArrayList<HashMap<String, String>> arrayList, String str3) {
        boolean z;
        ArrayList<HashMap<String, String>> arrayList2 = arrayList;
        if (hashMap != null) {
            arrayList2 = arrayList;
            if (hashMap.get("dxitems") != null) {
                ArrayList<Object> valueList = getValueList(new ArrayList<>(), hashMap.get("dxitems"));
                arrayList2 = arrayList;
                if (valueList != null) {
                    arrayList2 = arrayList;
                    if (valueList.size() > 0) {
                        int i = 0;
                        while (i < valueList.size()) {
                            HashMap<String, Object> hashMap2 = JsonParse.geteObjectToMap(valueList.get(i));
                            ArrayList<HashMap<String, String>> arrayList3 = arrayList;
                            if (hashMap2 != null) {
                                arrayList3 = arrayList;
                                if (hashMap2.get("dxid") != null) {
                                    arrayList3 = arrayList;
                                    if (hashMap2.get("isdown") != null) {
                                        try {
                                            z = ((Boolean) hashMap2.get("isdown")).booleanValue();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                            z = false;
                                        }
                                        arrayList3 = arrayList;
                                        if (z) {
                                            String str4 = String.valueOf(str2) + "_" + hashMap2.get("dxid").toString();
                                            ArrayList<HashMap<String, String>> updateDownloadlist = updateDownloadlist(str, str4, hashMap2, arrayList, "size", KeyEnvironment.KEYWEBPATH, "path", "progress");
                                            ArrayList<Object> arrayList4 = new ArrayList<>();
                                            arrayList3 = updateDownloadlist;
                                            if (hashMap2.get(getDataName(str3)) != null) {
                                                ArrayList<Object> valueList2 = getValueList(arrayList4, hashMap2.get(getDataName(str3)));
                                                arrayList3 = updateDownloadlist;
                                                if (valueList2 != null) {
                                                    arrayList3 = updateDownloadlist;
                                                    if (valueList2.size() > 0) {
                                                        Iterator<Object> it = valueList2.iterator();
                                                        arrayList3 = updateDownloadlist;
                                                        while (it.hasNext()) {
                                                            HashMap<String, Object> hashMap3 = JsonParse.geteObjectToMap(it.next());
                                                            if (hashMap3 != null) {
                                                                arrayList3 = updateDownloadlist(str, str4, hashMap3, arrayList3, "sizes", KeyEnvironment.KEYWEBPATH, "path", "progress");
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
                            arrayList = arrayList3;
                        }
                        arrayList2 = arrayList;
                    }
                }
            }
        }
        return arrayList2;
    }

    private ArrayList<Object> addNewKeys(ArrayList<Object> arrayList, String str) {
        HashMap<String, Object> hashMap;
        String dataIdKey = getDataIdKey(str);
        int i = 0;
        Iterator<Object> it = arrayList.iterator();
        while (it.hasNext()) {
            Object next = it.next();
            if (next != null && (hashMap = JsonParse.geteObjectToMap(next)) != null && hashMap.get(dataIdKey) != null) {
                if (hashMap.get(KeyEnvironment.KEYWEBPATH) != null && (str.equals("WrongQuestionSet") || str.equals(AppEnvironment.GeRenChengZhang))) {
                    addNewKeysChange(hashMap, arrayList, false, str, i);
                }
                if (hashMap.get("items") != null && str.equals(AppEnvironment.LessonPlanning)) {
                    addNewKeysLessonPlan(hashMap, arrayList, false, str, i);
                }
                if (str.equals(AppEnvironment.Homework) || str.equals(AppEnvironment.MyExaminationPaper)) {
                    addNewKeysChange(hashMap, arrayList, false, str, i);
                }
            }
            i++;
        }
        return arrayList;
    }

    private ArrayList<HashMap<String, String>> addPlanToneedDownloadList(String str, String str2, Object obj, ArrayList<HashMap<String, String>> arrayList, String str3) {
        HashMap<String, Object> hashMap = JsonParse.geteObjectToMap(obj);
        ArrayList<HashMap<String, String>> arrayList2 = arrayList;
        if (hashMap != null) {
            arrayList2 = arrayList;
            if (hashMap.get(KeyEnvironment.KEYWEBPATH) != null) {
                arrayList2 = updateLessonPlanDownloadlist(str, str2, hashMap, arrayList, getSizeKey(str3));
            }
        }
        return arrayList2;
    }

    private ArrayList<HashMap<String, String>> addQuestionListToDownloadList(String str, String str2, HashMap<String, Object> hashMap, ArrayList<HashMap<String, String>> arrayList) {
        ArrayList<HashMap<String, String>> arrayList2 = arrayList;
        if (hashMap.get("question") != null) {
            ArrayList<Object> valueList = getValueList(new ArrayList<>(), hashMap.get("question"));
            arrayList2 = arrayList;
            if (valueList != null) {
                arrayList2 = arrayList;
                if (valueList.size() > 0) {
                    int i = 0;
                    while (i < valueList.size()) {
                        HashMap<String, Object> hashMap2 = JsonParse.geteObjectToMap(valueList.get(i));
                        ArrayList<HashMap<String, String>> arrayList3 = arrayList;
                        if (hashMap2.get("questionid") != null) {
                            arrayList3 = updateDownloadlist(str, str2, hashMap2, updateDownloadlist(str, str2, hashMap2, arrayList, "size", KeyEnvironment.KEYWEBPATH, "path", "progress"), "qsize", "qwebpath", "qpath", "qprogress");
                        }
                        i++;
                        arrayList = arrayList3;
                    }
                    arrayList2 = arrayList;
                }
            }
        }
        return arrayList2;
    }

    private ArrayList<HashMap<String, String>> addToDownloadList(String str, String str2, ArrayList<Object> arrayList, ArrayList<HashMap<String, String>> arrayList2, String str3) {
        Iterator<Object> it = arrayList.iterator();
        while (it.hasNext()) {
            addToneedDownloadList(str, str2, it.next(), arrayList2, str3);
        }
        return arrayList2;
    }

    private ArrayList<HashMap<String, String>> addToneedDownloadList(String str, String str2, Object obj, ArrayList<HashMap<String, String>> arrayList, String str3) {
        String dataIdKey = getDataIdKey(str3);
        HashMap<String, Object> hashMap = JsonParse.geteObjectToMap(obj);
        ArrayList<HashMap<String, String>> arrayList2 = arrayList;
        if (hashMap != null) {
            arrayList2 = arrayList;
            if (hashMap.get(dataIdKey) != null) {
                String obj2 = "".equals(str2) ? hashMap.get(dataIdKey).toString() : String.valueOf(str2) + "_" + hashMap.get(dataIdKey).toString();
                if (str3.equals("ZuoYeFuDao")) {
                    boolean z = false;
                    if (hashMap.get("isdown") != null) {
                        try {
                            z = ((Boolean) hashMap.get("isdown")).booleanValue();
                        } catch (Exception e) {
                            e.printStackTrace();
                            z = false;
                        }
                    }
                    arrayList2 = arrayList;
                    if (z) {
                        arrayList2 = updateDownloadlist(str, obj2, hashMap, arrayList, getSizeKey(str3), KeyEnvironment.KEYWEBPATH, "path", "progress");
                    }
                } else if (str3.equals("WrongQuestionSet")) {
                    arrayList2 = updateDownloadlist(str, obj2, hashMap, arrayList, getSizeKey(str3), KeyEnvironment.KEYWEBPATH, "path", "progress");
                } else if (str3.equals(AppEnvironment.Homework) || str3.equals(AppEnvironment.MyExaminationPaper)) {
                    ArrayList<HashMap<String, String>> updateDownloadlist = updateDownloadlist(str, obj2, hashMap, arrayList, getSizeKey(str3), KeyEnvironment.KEYWEBPATH, "path", "progress");
                    ArrayList<HashMap<String, String>> arrayList3 = updateDownloadlist;
                    if (hashMap.get("attwebpath") != null) {
                        arrayList3 = updateDownloadlist;
                        if (hashMap.get("attpath") != null) {
                            arrayList3 = updateDownloadlist(str, obj2, hashMap, updateDownloadlist, "attsize", "attwebpath", "attpath", "attprogress");
                        }
                    }
                    arrayList2 = addQuestionListToDownloadList(str, obj2, hashMap, arrayList3);
                } else {
                    arrayList2 = arrayList;
                    if (str3.equals(AppEnvironment.LessonPlanning)) {
                        ArrayList<Object> arrayList4 = new ArrayList<>();
                        arrayList2 = arrayList;
                        if (hashMap.get("items") != null) {
                            ArrayList<Object> valueList = getValueList(arrayList4, hashMap.get("items"));
                            arrayList2 = arrayList;
                            if (valueList != null) {
                                arrayList2 = arrayList;
                                if (valueList.size() > 0) {
                                    Iterator<Object> it = valueList.iterator();
                                    while (true) {
                                        arrayList2 = arrayList;
                                        if (!it.hasNext()) {
                                            break;
                                        }
                                        addPlanToneedDownloadList(str, obj2, it.next(), arrayList, str3);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return arrayList2;
    }

    private ArrayList<HashMap<String, String>> addToneedDownloadListGeRen(String str, Object obj, ArrayList<HashMap<String, String>> arrayList, String str2) {
        String dataIdKey = getDataIdKey(str2);
        HashMap<String, Object> hashMap = JsonParse.geteObjectToMap(obj);
        ArrayList<HashMap<String, String>> arrayList2 = arrayList;
        if (hashMap != null) {
            arrayList2 = arrayList;
            if (hashMap.get(dataIdKey) != null) {
                String obj2 = "".equals(str) ? hashMap.get(dataIdKey).toString() : String.valueOf(str) + "_" + hashMap.get(dataIdKey).toString();
                arrayList2 = arrayList;
                if (str2.equals(AppEnvironment.GeRenChengZhang)) {
                    arrayList2 = updateDownloadlist("-1", obj2, hashMap, arrayList, getSizeKey(str2), KeyEnvironment.KEYWEBPATH, "path", "progress");
                }
            }
        }
        return arrayList2;
    }

    private ArrayList<Object> appendObject(String str, ArrayList<String> arrayList, ArrayList<Object> arrayList2, ArrayList<Object> arrayList3, String str2, ArrayList<HashMap<String, String>> arrayList4) {
        String appendid;
        String dataIdKey = getDataIdKey(str2);
        ArrayList<Object> arrayList5 = arrayList2;
        if (arrayList3 != null) {
            Iterator<Object> it = arrayList3.iterator();
            while (it.hasNext()) {
                Object next = it.next();
                HashMap<String, Object> hashMap = JsonParse.geteObjectToMap(next);
                boolean z = false;
                ArrayList<HashMap<String, String>> arrayList6 = arrayList4;
                if (arrayList2 != null) {
                    int i = 0;
                    while (true) {
                        if (i >= arrayList2.size()) {
                            arrayList6 = arrayList4;
                            z = false;
                            break;
                        }
                        HashMap<String, Object> hashMap2 = JsonParse.geteObjectToMap(arrayList2.get(i));
                        if (hashMap == null || hashMap2 == null || hashMap.get(dataIdKey) == null || hashMap2.get(dataIdKey) == null || !hashMap.get(dataIdKey).toString().equals(hashMap2.get(dataIdKey).toString())) {
                            i++;
                        } else {
                            z = true;
                            arrayList6 = arrayList4;
                            if (arrayList4 != null) {
                                z = true;
                                arrayList6 = arrayList4;
                                if (hashMap.get("question") != null) {
                                    ArrayList<Object> valueList = getValueList(new ArrayList<>(), hashMap.get("question"));
                                    String obj = "".equals(appendid(arrayList)) ? hashMap2.get(dataIdKey).toString() : String.valueOf(appendid) + "_" + hashMap2.get(dataIdKey).toString();
                                    z = true;
                                    arrayList6 = arrayList4;
                                    if (valueList != null) {
                                        z = true;
                                        arrayList6 = arrayList4;
                                        if (valueList.size() > 0) {
                                            ArrayList<Object> valueList2 = getValueList(new ArrayList<>(), hashMap2.get("question"));
                                            if (valueList2 == null || (valueList2 != null && valueList2.size() == 0)) {
                                                hashMap2.put("question", hashMap.get("question"));
                                                if (hashMap.get("question_num") != null) {
                                                    hashMap2.put("question_num", hashMap.get("question_num"));
                                                }
                                                arrayList2.set(i, JsonCreate.MaptoJSONObject(hashMap2));
                                                arrayList6 = addQuestionListToDownloadList(str, obj, hashMap2, arrayList4);
                                                z = true;
                                            } else {
                                                compareAndReplaceExamQuestion(str, obj, valueList, valueList2, arrayList4);
                                                if (hashMap.get("question_num") != null) {
                                                    hashMap2.put("question_num", hashMap.get("question_num"));
                                                }
                                                hashMap2.put("question", JsonCreate.toJSONArrayObject(valueList));
                                                arrayList2.set(i, JsonCreate.MaptoJSONObject(hashMap2));
                                                z = true;
                                                arrayList6 = arrayList4;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                arrayList4 = arrayList6;
                if (!z) {
                    ArrayList<Object> arrayList7 = arrayList2;
                    if (arrayList2 == null) {
                        arrayList7 = new ArrayList<>();
                    }
                    arrayList7.add(next);
                    arrayList2 = arrayList7;
                    arrayList4 = arrayList6;
                    if (arrayList6 != null) {
                        addToneedDownloadList(str, appendid(arrayList), next, arrayList6, str2);
                        arrayList2 = arrayList7;
                        arrayList4 = arrayList6;
                    }
                }
            }
            arrayList5 = arrayList2;
        }
        return arrayList5;
    }

    private ArrayList<Object> appendObjectGeRen(ArrayList<String> arrayList, ArrayList<Object> arrayList2, ArrayList<Object> arrayList3, String str, ArrayList<HashMap<String, String>> arrayList4) {
        String dataIdKey = getDataIdKey(str);
        ArrayList<Object> arrayList5 = arrayList2;
        if (arrayList3 != null) {
            Iterator<Object> it = arrayList3.iterator();
            while (it.hasNext()) {
                Object next = it.next();
                HashMap<String, Object> hashMap = JsonParse.geteObjectToMap(next);
                boolean z = false;
                if (arrayList2 != null) {
                    int i = 0;
                    while (true) {
                        if (i < arrayList2.size()) {
                            HashMap<String, Object> hashMap2 = JsonParse.geteObjectToMap(arrayList2.get(i));
                            if (hashMap != null && hashMap2 != null && hashMap.get(dataIdKey) != null && hashMap2.get(dataIdKey) != null && hashMap.get(dataIdKey).toString().equals(hashMap2.get(dataIdKey).toString())) {
                                z = true;
                                break;
                            }
                            i++;
                        } else {
                            z = false;
                            break;
                        }
                    }
                }
                if (!z) {
                    ArrayList<Object> arrayList6 = arrayList2;
                    if (arrayList2 == null) {
                        arrayList6 = new ArrayList<>();
                    }
                    arrayList6.add(next);
                    arrayList2 = arrayList6;
                    if (arrayList4 != null) {
                        addToneedDownloadListGeRen(appendid(arrayList), next, arrayList4, str);
                        arrayList2 = arrayList6;
                    }
                }
            }
            arrayList5 = arrayList2;
        }
        return arrayList5;
    }

    private ArrayList<Object> appendPlanIdObject(String str, ArrayList<String> arrayList, ArrayList<Object> arrayList2, ArrayList<Object> arrayList3, String str2, ArrayList<HashMap<String, String>> arrayList4) {
        String dataIdKey = getDataIdKey(str2);
        ArrayList<Object> arrayList5 = arrayList2;
        if (arrayList3 != null) {
            Iterator<Object> it = arrayList3.iterator();
            while (it.hasNext()) {
                Object next = it.next();
                HashMap<String, Object> hashMap = JsonParse.geteObjectToMap(next);
                boolean z = false;
                ArrayList<HashMap<String, String>> arrayList6 = arrayList4;
                if (arrayList2 != null) {
                    int i = 0;
                    while (true) {
                        if (i < arrayList2.size()) {
                            HashMap<String, Object> hashMap2 = JsonParse.geteObjectToMap(arrayList2.get(i));
                            if (hashMap != null && hashMap2 != null && hashMap.get(dataIdKey) != null && hashMap2.get(dataIdKey) != null && hashMap.get(dataIdKey).toString().equals(hashMap2.get(dataIdKey).toString())) {
                                arrayList6 = comparePlanItems(hashMap, hashMap2, str, String.valueOf(appendid(arrayList)) + "_" + hashMap.get(dataIdKey).toString(), str2, arrayList4);
                                Object MaptoJSONObject = JsonCreate.MaptoJSONObject(hashMap2);
                                arrayList2.remove(i);
                                arrayList2.add(i, MaptoJSONObject);
                                z = true;
                                break;
                            }
                            i++;
                        } else {
                            arrayList6 = arrayList4;
                            z = false;
                            break;
                        }
                    }
                }
                arrayList4 = arrayList6;
                if (!z) {
                    ArrayList<Object> arrayList7 = arrayList2;
                    if (arrayList2 == null) {
                        arrayList7 = new ArrayList<>();
                    }
                    arrayList7.add(next);
                    arrayList2 = arrayList7;
                    arrayList4 = arrayList6;
                    if (arrayList6 != null) {
                        ArrayList<Object> arrayList8 = new ArrayList<>();
                        arrayList2 = arrayList7;
                        arrayList4 = arrayList6;
                        if (hashMap != null) {
                            arrayList2 = arrayList7;
                            arrayList4 = arrayList6;
                            if (hashMap.get(dataIdKey) != null) {
                                String obj = hashMap.get(dataIdKey).toString();
                                arrayList2 = arrayList7;
                                arrayList4 = arrayList6;
                                if (hashMap != null) {
                                    arrayList2 = arrayList7;
                                    arrayList4 = arrayList6;
                                    if (hashMap.get("items") != null) {
                                        ArrayList<Object> valueList = getValueList(arrayList8, hashMap.get("items"));
                                        arrayList2 = arrayList7;
                                        arrayList4 = arrayList6;
                                        if (valueList != null) {
                                            arrayList2 = arrayList7;
                                            arrayList4 = arrayList6;
                                            if (valueList.size() > 0) {
                                                Iterator<Object> it2 = valueList.iterator();
                                                while (true) {
                                                    arrayList2 = arrayList7;
                                                    arrayList4 = arrayList6;
                                                    if (it2.hasNext()) {
                                                        addPlanToneedDownloadList(str, String.valueOf(appendid(arrayList)) + "_" + obj, it2.next(), arrayList6, str2);
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
            arrayList5 = arrayList2;
        }
        return arrayList5;
    }

    private void compareAndReplaceExamQuestion(String str, String str2, ArrayList<Object> arrayList, ArrayList<Object> arrayList2, ArrayList<HashMap<String, String>> arrayList3) {
        int i = 0;
        while (i < arrayList.size()) {
            HashMap<String, Object> hashMap = JsonParse.geteObjectToMap(arrayList.get(i));
            ArrayList<HashMap<String, String>> arrayList4 = arrayList3;
            if (hashMap != null) {
                arrayList4 = arrayList3;
                if (hashMap.get("questionid") != null) {
                    String obj = hashMap.get("questionid").toString();
                    boolean z = true;
                    if (hashMap.get("progress") != null) {
                        z = true;
                        if (hashMap.get(KeyEnvironment.KEYDOWNLOADSIZE) != null) {
                            z = true;
                            if (hashMap.get(KeyEnvironment.KEYWEBPATH) != null) {
                                z = true;
                                if (hashMap.get("size") != null) {
                                    z = true;
                                    if (hashMap.get("path") != null) {
                                        ArrayList<Object> arrayList5 = new ArrayList<>();
                                        ArrayList<Object> arrayList6 = new ArrayList<>();
                                        ArrayList<Object> arrayList7 = new ArrayList<>();
                                        ArrayList<Object> arrayList8 = new ArrayList<>();
                                        ArrayList<Object> arrayList9 = new ArrayList<>();
                                        ArrayList<Object> valueList = getValueList(arrayList5, hashMap.get(KeyEnvironment.KEYWEBPATH));
                                        ArrayList<Object> valueList2 = getValueList(arrayList6, hashMap.get(KeyEnvironment.KEYDOWNLOADSIZE));
                                        ArrayList<Object> valueList3 = getValueList(arrayList7, hashMap.get("progress"));
                                        ArrayList<Object> valueList4 = getValueList(arrayList8, hashMap.get("size"));
                                        ArrayList<Object> valueList5 = getValueList(arrayList9, hashMap.get("path"));
                                        z = true;
                                        if (valueList != null) {
                                            z = true;
                                            if (valueList2 != null) {
                                                z = true;
                                                if (valueList3 != null) {
                                                    z = true;
                                                    if (valueList4 != null) {
                                                        z = true;
                                                        if (valueList5 != null) {
                                                            z = true;
                                                            if (valueList.size() != 0) {
                                                                z = true;
                                                                if (valueList.size() == valueList5.size()) {
                                                                    z = true;
                                                                    if (valueList5.size() == valueList3.size()) {
                                                                        z = true;
                                                                        if (valueList3.size() == valueList4.size()) {
                                                                            z = true;
                                                                            if (valueList4.size() == valueList2.size()) {
                                                                                int i2 = 0;
                                                                                while (true) {
                                                                                    if (i2 >= arrayList2.size()) {
                                                                                        z = true;
                                                                                        break;
                                                                                    }
                                                                                    HashMap<String, Object> hashMap2 = JsonParse.geteObjectToMap(arrayList2.get(i2));
                                                                                    if (hashMap2 == null || hashMap2.get("questionid") == null || !obj.equals(hashMap2.get("questionid").toString())) {
                                                                                        i2++;
                                                                                    } else {
                                                                                        rePlaceProAndDown(hashMap, valueList, valueList5, valueList2, valueList4, valueList3, hashMap2, "progress", KeyEnvironment.KEYDOWNLOADSIZE, KeyEnvironment.KEYWEBPATH, "size", "path");
                                                                                        if (hashMap2.get("qprogress") != null) {
                                                                                            hashMap.put("qprogress", hashMap2.get("qprogress"));
                                                                                        }
                                                                                        if (hashMap2.get("qwebpath") != null) {
                                                                                            hashMap.put("qwebpath", hashMap2.get("qwebpath"));
                                                                                        }
                                                                                        if (hashMap2.get("qpath") != null) {
                                                                                            hashMap.put("qpath", hashMap2.get("qpath"));
                                                                                        }
                                                                                        if (hashMap2.get("qdownloadsize") != null) {
                                                                                            hashMap.put("qdownloadsize", hashMap2.get("qdownloadsize"));
                                                                                        }
                                                                                        if (hashMap2.get("qsize") != null) {
                                                                                            hashMap.put("qsize", hashMap2.get("qsize"));
                                                                                        }
                                                                                        arrayList.set(i, JsonCreate.MaptoJSONObject(hashMap));
                                                                                        arrayList2.remove(i2);
                                                                                        z = false;
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
                            }
                        }
                    }
                    arrayList4 = arrayList3;
                    if (!z) {
                        arrayList4 = updateDownloadlist(str, str2, hashMap, updateDownloadlist(str, str2, hashMap, arrayList3, "size", KeyEnvironment.KEYWEBPATH, "path", "progress"), "qsize", "qwebpath", "qpath", "qprogress");
                    }
                }
            }
            i++;
            arrayList3 = arrayList4;
        }
    }

    private void compareData(Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> tree2, HashMap<String, Object> hashMap, HashMap<String, Object> hashMap2, ArrayList<String> arrayList, String str, String str2, ArrayList<HashMap<String, String>> arrayList2) {
        ArrayList<Object> arrayList3;
        for (HashMap<String, Object> hashMap3 : tree2.getSuccessors(hashMap2)) {
            if (hashMap3.get(str) != null) {
                arrayList.add(hashMap3.get(str).toString());
                ArrayList<Object> arrayList4 = new ArrayList<>();
                if (arrayList2 == null || hashMap3.get("data") == null) {
                    arrayList3 = arrayList4;
                    if (arrayList2 == null) {
                        arrayList3 = arrayList4;
                        if (hashMap3.get(getDataName(str2)) != null) {
                            arrayList3 = getValueList(arrayList4, hashMap3.get(getDataName(str2)));
                        }
                    }
                } else {
                    arrayList3 = getValueList(arrayList4, hashMap3.get("data"));
                }
                if (arrayList3 != null && arrayList3.size() > 0) {
                    addDataToNewTree(tree, tree.getHead(), arrayList, arrayList3, str, str2, arrayList2);
                }
                if (hashMap3.get("children") != null) {
                    compareData(tree, tree2, tree.getHead(), hashMap3, arrayList, str, str2, arrayList2);
                }
                if (arrayList.size() > 0) {
                    arrayList.remove(arrayList.size() - 1);
                }
            }
        }
    }

    private ArrayList<HashMap<String, String>> comparePlanItems(HashMap<String, Object> hashMap, HashMap<String, Object> hashMap2, String str, String str2, String str3, ArrayList<HashMap<String, String>> arrayList) {
        ArrayList<Object> valueList;
        ArrayList<Object> arrayList2 = new ArrayList<>();
        if (hashMap != null && hashMap.get("items") != null && (valueList = getValueList(arrayList2, hashMap.get("items"))) != null && valueList.size() > 0) {
            ArrayList<Object> arrayList3 = new ArrayList<>();
            ArrayList<Object> arrayList4 = arrayList3;
            int i = 0;
            if (hashMap2 != null) {
                arrayList4 = arrayList3;
                i = 0;
                if (hashMap2.get("items") != null) {
                    ArrayList<Object> valueList2 = getValueList(arrayList3, hashMap2.get("items"));
                    arrayList4 = valueList2;
                    i = 0;
                    if (valueList2 != null) {
                        arrayList4 = valueList2;
                        i = 0;
                        if (valueList2.size() > 0) {
                            i = valueList2.size();
                            arrayList4 = valueList2;
                        }
                    }
                }
            }
            Iterator<Object> it = valueList.iterator();
            while (it.hasNext()) {
                Object next = it.next();
                HashMap<String, Object> hashMap3 = JsonParse.geteObjectToMap(next);
                if (hashMap3 != null && hashMap3.get(KeyEnvironment.KEYWEBPATH) != null) {
                    String obj = hashMap3.get(KeyEnvironment.KEYWEBPATH).toString();
                    boolean z = false;
                    if (i > 0) {
                        int i2 = 0;
                        while (true) {
                            if (i2 < i) {
                                HashMap<String, Object> hashMap4 = JsonParse.geteObjectToMap(arrayList4.get(i2));
                                if (hashMap4 != null && hashMap4.get(KeyEnvironment.KEYWEBPATH) != null && obj.equals(hashMap4.get(KeyEnvironment.KEYWEBPATH).toString())) {
                                    z = true;
                                    break;
                                }
                                i2++;
                            } else {
                                z = false;
                                break;
                            }
                        }
                    }
                    if (!z) {
                        ArrayList<Object> arrayList5 = arrayList4;
                        if (i == 0) {
                            arrayList5 = new ArrayList<>();
                        }
                        arrayList5.add(next);
                        arrayList4 = arrayList5;
                        if (arrayList != null) {
                            addPlanToneedDownloadList(str, str2, next, arrayList, str3);
                            arrayList4 = arrayList5;
                        }
                    }
                }
            }
            hashMap2.put("items", JsonCreate.toJSONArrayObject(arrayList4));
        }
        return arrayList;
    }

    private void deleteExamPath(HashMap<String, Object> hashMap, String str, String str2, String str3, String str4) {
        ArrayList<Object> valueList;
        if (hashMap.get("question") != null) {
            if ((!str4.equals(AppEnvironment.Homework) && !str4.equals(AppEnvironment.MyExaminationPaper)) || (valueList = getValueList(new ArrayList<>(), hashMap.get("question"))) == null || valueList.size() <= 0) {
                return;
            }
            for (int i = 0; i < valueList.size(); i++) {
                HashMap<String, Object> hashMap2 = JsonParse.geteObjectToMap(valueList.get(i));
                if (hashMap2 != null) {
                    getdeletePath(hashMap2, str, str2, str3, "path");
                    getdeletePath(hashMap2, str, str2, str3, "qpath");
                }
            }
        }
    }

    private HashMap<String, Object> deleteFile(Tree<HashMap<String, Object>> tree, String str, String str2, String str3) {
        ArrayList<String> treeToList = treeToList(str, str2, str3);
        HashMap<String, Object> hashMap = null;
        if (treeToList.size() > 0) {
            HashMap<String, Object> head = tree.getHead();
            hashMap = null;
            if (treeToList.get(0).equals(head.get(str2))) {
                int i = 1;
                HashMap<String, Object> hashMap2 = null;
                while (true) {
                    if (i < treeToList.size()) {
                        boolean z = false;
                        Iterator<HashMap<String, Object>> it = tree.getSuccessors(head).iterator();
                        while (true) {
                            if (!it.hasNext()) {
                                break;
                            }
                            HashMap<String, Object> next = it.next();
                            if (next.get(str2) != null) {
                                if (treeToList.get(i).equals(next.get(str2).toString())) {
                                    head = next;
                                    z = true;
                                    break;
                                }
                            }
                        }
                        hashMap = hashMap2;
                        if (!z) {
                            break;
                        }
                        if (i == treeToList.size() - 1) {
                            hashMap2 = head;
                        }
                        i++;
                    } else {
                        hashMap = hashMap2;
                        break;
                    }
                }
            }
        }
        return hashMap;
    }

    private ArrayList<String> deleteNoData(String str, ArrayList<String> arrayList, Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, ArrayList<String> arrayList2, String str2, String str3, String str4, String str5) {
        removeSourceNoData(str, arrayList, hashMap, arrayList2, str3, str4, str5);
        for (HashMap<String, Object> hashMap2 : tree.getSuccessors(hashMap)) {
            if (hashMap2.get(str2) != null) {
                arrayList.add(hashMap2.get(str2).toString());
                deleteNoData(str, arrayList, tree, hashMap2, arrayList2, str2, str3, str4, str5);
            }
        }
        if (arrayList.size() > 0) {
            arrayList.remove(arrayList.size() - 1);
        }
        return arrayList2;
    }

    private void deletePathFile(String str, String str2, String str3, String str4) {
        FileInOutHelper.deleteFile(String.valueOf(str) + str2 + "/" + str3 + "/" + str4);
    }

    private ArrayList<HashMap<String, String>> getBookDownList(ArrayList<HashMap<String, String>> arrayList, Books books, String str, String str2) {
        Tree<HashMap<String, Object>> parsejson = JsonParse.parsejson(null, JsonHelper.getFileString(str), "data", "children");
        ArrayList<HashMap<String, String>> arrayList2 = arrayList;
        if (parsejson != null) {
            arrayList2 = arrayList;
            if (parsejson.getHead() != null) {
                arrayList2 = arrayList;
                if (parsejson.getHead().get("id") != null) {
                    String obj = parsejson.getHead().get("id").toString();
                    arrayList2 = getDownList(obj, obj, parsejson, parsejson.getHead(), arrayList, "children", str2);
                }
            }
        }
        return arrayList2;
    }

    private ArrayList<HashMap<String, String>> getBookExamDownList(ArrayList<HashMap<String, String>> arrayList, Books books, String str, String str2) {
        HashMap<String, Object> parse = this.common.parse(JsonHelper.getFileString(str));
        if (parse != null && parse.get("id") != null && parse.get("data") != null) {
            String obj = parse.get("id").toString();
            ArrayList<Object> valueList = getValueList(new ArrayList<>(), parse.get("data"));
            if (valueList != null && valueList.size() > 0) {
                addToDownloadList(obj, obj, valueList, arrayList, str2);
            }
        }
        return arrayList;
    }

    private String getDataIdKey(String str) {
        return (str.equals("DaoXueBen") || str.equals("DaoXueBenNew")) ? "null" : str.equals("WrongQuestionSet") ? AppEnvironment.ErrorID : (str.equals(AppEnvironment.GeRenChengZhang) || str.equals("ZuoYeFuDao") || str.equals(AppEnvironment.LessonPlanning) || str.equals(AppEnvironment.MyExaminationPaper) || str.equals(AppEnvironment.Homework)) ? "id" : "null";
    }

    private String getDataName(String str) {
        return (str.equals("DaoXueBen") || str.equals("DaoXueBenNew")) ? "exams" : (str.equals("WrongQuestionSet") || str.equals("ZuoYeFuDao")) ? "question" : str.equals(AppEnvironment.LessonPlanning) ? "plan" : (str.equals(AppEnvironment.Homework) || str.equals(AppEnvironment.MyExaminationPaper)) ? "exam" : "question";
    }

    private ArrayList<HashMap<String, String>> getDownList(String str, String str2, Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, ArrayList<HashMap<String, String>> arrayList, String str3, String str4) {
        ArrayList<Object> valueList;
        for (HashMap<String, Object> hashMap2 : tree.getSuccessors(hashMap)) {
            if (hashMap2.get("id") != null) {
                String str5 = String.valueOf(str2) + "_" + hashMap2.get("id").toString();
                if (str4.equals("DaoXueBen")) {
                    addDaoToDownloadList(str, str5, hashMap2, arrayList, str4);
                } else if (str4.equals("DaoXueBenNew")) {
                    addNewDaoToDownloadList(str, str5, hashMap2, arrayList, str4);
                } else {
                    ArrayList<Object> arrayList2 = new ArrayList<>();
                    if (hashMap2.get(getDataName(str4)) != null && (valueList = getValueList(arrayList2, hashMap2.get(getDataName(str4)))) != null && valueList.size() > 0) {
                        addToDownloadList(str, str5, valueList, arrayList, str4);
                    }
                }
                if (hashMap2.get(str3) != null) {
                    getDownList(str, str5, tree, hashMap2, arrayList, str3, str4);
                }
                str2 = removeSourceId(str5);
            }
        }
        return arrayList;
    }

    private boolean getPlanPath(String str, String str2, String str3, HashMap<String, Object> hashMap, String str4) {
        boolean z = false;
        ArrayList<Object> valueList = getValueList(new ArrayList<>(), hashMap.get("items"));
        boolean z2 = false;
        if (valueList != null) {
            z2 = false;
            if (valueList.size() > 0) {
                int i = 0;
                while (true) {
                    z2 = z;
                    if (i >= valueList.size()) {
                        break;
                    }
                    HashMap<String, Object> hashMap2 = JsonParse.geteObjectToMap(valueList.get(i));
                    z = z2;
                    if (hashMap2.get("path") != null) {
                        if (str4 == null) {
                            deletePathFile(str, str2, str3, hashMap2.get("path").toString());
                            z = z2;
                        } else {
                            z = z2;
                            if (hashMap2.get(KeyEnvironment.KEYWEBPATH) != null) {
                                z = z2;
                                if (str4.equals(hashMap2.get(KeyEnvironment.KEYWEBPATH).toString())) {
                                    deletePathFile(str, str2, str3, hashMap2.get("path").toString());
                                    valueList.remove(i);
                                    hashMap.put("items", JsonCreate.toJSONArrayObject(valueList));
                                    z = true;
                                }
                            }
                        }
                    }
                    i++;
                }
            }
        }
        return z2;
    }

    private Object getRemoveItem(Object obj, String str) {
        ArrayList<Object> valueList;
        Object removeObject;
        try {
            HashMap<String, Object> parseJSONObject = this.common.parseJSONObject((JSONObject) obj);
            if (parseJSONObject.get("items") != null && (valueList = getValueList(new ArrayList<>(), parseJSONObject.get("items"))) != null && valueList.size() > 0 && (removeObject = getRemoveObject(valueList, KeyEnvironment.KEYWEBPATH, str)) != null) {
                valueList.remove(removeObject);
                parseJSONObject.put("items", JsonCreate.toJSONArrayObject(valueList));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        return obj;
    }

    private Object getRemoveObject(ArrayList<Object> arrayList, String str, String str2) {
        Object obj;
        Iterator<Object> it = arrayList.iterator();
        while (true) {
            if (!it.hasNext()) {
                obj = null;
                break;
            }
            obj = it.next();
            try {
                HashMap<String, Object> parseJSONObject = this.common.parseJSONObject((JSONObject) obj);
                if (str2 != null && parseJSONObject.get(str) != null && str2.equals(parseJSONObject.get(str))) {
                    break;
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        return obj;
    }

    private String getSizeKey(String str) {
        return (str.equals("DaoXueBenNew") || str.equals("DaoXueBen") || str.equals(AppEnvironment.LessonPlanning) || str.equals(AppEnvironment.Homework) || str.equals(AppEnvironment.MyExaminationPaper) || str.equals(AppEnvironment.GeRenChengZhang)) ? "size" : str.equals("ZuoYeFuDao") ? "size" : str.equals("WrongQuestionSet") ? "Size" : "Size";
    }

    private void getSourceIdList(String str, ArrayList<String> arrayList, Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> tree2, HashMap<String, Object> hashMap, HashMap<String, Object> hashMap2, ArrayList<String> arrayList2, String str2, String str3, String str4, String str5) {
        Collection<HashMap<String, Object>> successors = tree2.getSuccessors(hashMap2);
        if (successors == null || successors.size() <= 0) {
            if (tree2.getHead().get("data") != null) {
                removeSourceData(str, arrayList, tree, hashMap, arrayList2, tree2.getHead().get("data"), str3, str4, str5);
                return;
            }
            HashMap<String, Object> hashMap3 = getdeleteSourceHead(arrayList, tree, hashMap, str2);
            if (hashMap3 == null) {
                return;
            }
            deleteNoData(str, arrayList, tree, hashMap3, arrayList2, str2, str3, str4, str5);
            return;
        }
        for (HashMap<String, Object> hashMap4 : successors) {
            if (hashMap4.get(str2) != null) {
                arrayList.add(hashMap4.get(str2).toString());
                if (hashMap4.get("children") != null) {
                    getSourceIdList(str, arrayList, tree, tree2, tree.getHead(), hashMap4, arrayList2, str2, str3, str4, str5);
                } else if (hashMap4.get("data") != null) {
                    HashMap<String, Object> hashMap5 = getdeleteSourceHead(arrayList, tree, hashMap, str2);
                    hashMap = hashMap5;
                    if (hashMap5 != null) {
                        removeSourceData(str, arrayList, tree, hashMap5, arrayList2, hashMap4.get("data"), str3, str4, str5);
                        hashMap = hashMap5;
                    }
                } else {
                    HashMap<String, Object> hashMap6 = getdeleteSourceHead(arrayList, tree, hashMap, str2);
                    hashMap = hashMap6;
                    if (hashMap6 != null) {
                        arrayList2 = deleteNoData(str, arrayList, tree, hashMap6, arrayList2, str2, str3, str4, str5);
                        hashMap = hashMap6;
                    }
                }
            }
        }
        if (arrayList.size() <= 0) {
            return;
        }
        arrayList.remove(arrayList.size() - 1);
    }

    private void getdeletePath(HashMap<String, Object> hashMap, String str, String str2, String str3, String str4) {
        ArrayList<Object> valueList;
        if (hashMap.get(str4) == null || (valueList = getValueList(new ArrayList<>(), hashMap.get(str4))) == null || valueList.size() <= 0) {
            return;
        }
        for (int i = 0; i < valueList.size(); i++) {
            deletePathFile(str, str2, str3, valueList.get(i).toString());
        }
    }

    private HashMap<String, Object> getdeleteSourceHead(ArrayList<String> arrayList, Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, String str) {
        HashMap<String, Object> hashMap2;
        if (arrayList.size() == 0) {
            hashMap2 = null;
        } else if (arrayList.size() == 1) {
            hashMap2 = tree.getHead();
        } else {
            int i = 1;
            loop0: while (true) {
                if (i >= arrayList.size()) {
                    hashMap2 = null;
                    break;
                }
                HashMap<String, Object> hashMap3 = hashMap;
                for (HashMap<String, Object> hashMap4 : tree.getSuccessors(hashMap)) {
                    if (hashMap4.get(str) != null && arrayList.get(i).equals(hashMap4.get(str).toString())) {
                        hashMap3 = hashMap4;
                        if (i == arrayList.size() - 1) {
                            hashMap2 = hashMap4;
                            break loop0;
                        }
                    }
                }
                i++;
                hashMap = hashMap3;
            }
        }
        return hashMap2;
    }

    private HashMap<String, Object> getjsonObject(Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, ArrayList<String> arrayList) {
        HashMap<String, Object> hashMap2;
        int i = 1;
        loop0: while (true) {
            if (i >= arrayList.size()) {
                hashMap2 = null;
                break;
            }
            Iterator<HashMap<String, Object>> it = tree.getSuccessors(hashMap).iterator();
            HashMap<String, Object> hashMap3 = hashMap;
            while (it.hasNext()) {
                hashMap2 = it.next();
                if (hashMap2.get("id") != null && arrayList.get(i).equals(hashMap2.get("id").toString())) {
                    hashMap2.get("id").toString();
                    hashMap3 = hashMap2;
                    if (i == arrayList.size() - 2) {
                        break loop0;
                    }
                }
            }
            i++;
            hashMap = hashMap3;
        }
        return hashMap2;
    }

    private ArrayList<HashMap<String, String>> hashToDownloadlist(ArrayList<HashMap<String, String>> arrayList, String str, String str2, String str3, String str4, String str5, String str6) {
        HashMap<String, String> hashMap = new HashMap<>();
        hashMap.put("book_id", str);
        hashMap.put("source_id", str2);
        hashMap.put("source_webpath", str3);
        hashMap.put("source_path", str4);
        hashMap.put("source_progress", str5);
        hashMap.put("source_size", str6);
        arrayList.add(hashMap);
        return arrayList;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x003f, code lost:
        if (r6.get(r10) == null) goto L12;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean insertProDownsize(HashMap<String, Object> hashMap, boolean z, String str, String str2, String str3) {
        boolean z2 = z;
        if (hashMap.get(str) != null) {
            ArrayList<Object> valueList = getValueList(new ArrayList<>(), hashMap.get(str));
            z2 = z;
            if (valueList != null) {
                z2 = z;
                if (valueList.size() > 0) {
                    if (hashMap.get(str2) != null) {
                        z2 = z;
                    }
                    z2 = true;
                    ArrayList arrayList = new ArrayList();
                    ArrayList arrayList2 = new ArrayList();
                    for (int i = 0; i < valueList.size(); i++) {
                        arrayList.add("0");
                        arrayList2.add(0);
                    }
                    hashMap.put(str2, JsonCreate.toJSONArrayObject(arrayList));
                    hashMap.put(str3, JsonCreate.toJSONArrayObject(arrayList2));
                }
            }
        }
        return z2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x0030, code lost:
        if (r0.size() == 0) goto L10;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean isNullWebpath(HashMap<String, Object> hashMap, String str) {
        boolean z = false;
        if (hashMap.get(str) != null) {
            ArrayList<Object> valueList = getValueList(new ArrayList<>(), hashMap.get(str));
            if (valueList != null) {
                z = false;
                if (valueList != null) {
                    z = false;
                }
            }
            z = true;
        }
        return z;
    }

    private ArrayList<String> olddeleteNoData(String str, ArrayList<String> arrayList, Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, ArrayList<String> arrayList2, String str2, String str3, String str4, String str5) {
        for (HashMap<String, Object> hashMap2 : tree.getSuccessors(hashMap)) {
            if (hashMap2.get(str2) != null) {
                hashMap2.get(str2).toString();
                if (hashMap2.get(getDataName(str3)) != null) {
                    changeTreeData(tree, hashMap2, JsonCreate.toJSONArrayObject(new ArrayList()), getDataName(str3));
                }
                olddeleteNoData(str, arrayList, tree, hashMap2, arrayList2, str2, str3, str4, str5);
            }
        }
        return arrayList2;
    }

    private void rePlaceProAndDown(HashMap<String, Object> hashMap, ArrayList<Object> arrayList, ArrayList<Object> arrayList2, ArrayList<Object> arrayList3, ArrayList<Object> arrayList4, ArrayList<Object> arrayList5, HashMap<String, Object> hashMap2, String str, String str2, String str3, String str4, String str5) {
        if (hashMap2.get(str) == null || hashMap2.get(str2) == null || hashMap2.get(str3) == null || hashMap2.get(str4) == null || hashMap2.get(str5) == null) {
            return;
        }
        ArrayList<Object> arrayList6 = new ArrayList<>();
        ArrayList<Object> arrayList7 = new ArrayList<>();
        ArrayList<Object> arrayList8 = new ArrayList<>();
        ArrayList<Object> arrayList9 = new ArrayList<>();
        ArrayList<Object> arrayList10 = new ArrayList<>();
        ArrayList<Object> valueList = getValueList(arrayList6, hashMap2.get(str3));
        ArrayList<Object> valueList2 = getValueList(arrayList7, hashMap2.get(str2));
        ArrayList<Object> valueList3 = getValueList(arrayList8, hashMap2.get(str));
        ArrayList<Object> valueList4 = getValueList(arrayList9, hashMap2.get(str4));
        ArrayList<Object> valueList5 = getValueList(arrayList10, hashMap2.get(str5));
        if (valueList == null || valueList2 == null || valueList3 == null || valueList4 == null || valueList5 == null || valueList.size() == 0 || valueList.size() != valueList5.size() || valueList5.size() != valueList3.size() || valueList3.size() != valueList4.size() || valueList4.size() != valueList2.size()) {
            return;
        }
        boolean z = false;
        long j = 0;
        long j2 = 0;
        for (int i = 0; i < arrayList.size(); i++) {
            String obj = arrayList.get(i).toString();
            int i2 = 0;
            while (true) {
                if (i2 < valueList.size()) {
                    if (obj.equals(valueList.get(i2).toString())) {
                        z = true;
                        arrayList3.set(i, valueList2.get(i2));
                        arrayList5.set(i, valueList3.get(i2));
                        arrayList2.set(i, valueList5.get(i2));
                        arrayList4.set(i, valueList4.get(i2));
                        break;
                    }
                    i2++;
                }
            }
            j += Long.valueOf(arrayList3.get(i).toString()).longValue();
            j2 += Long.valueOf(arrayList4.get(i).toString()).longValue();
        }
        if (j2 == 0) {
            hashMap.put("questionprogress", "100");
        } else if (j2 == j) {
            hashMap.put("questionprogress", "100");
        } else {
            hashMap.put("questionprogress", Integer.toString((int) ((((float) j) * 100.0f) / ((float) j2))));
        }
        if (!z) {
            return;
        }
        hashMap.put(str5, JsonCreate.toJSONArrayObject(arrayList2));
        hashMap.put(str, JsonCreate.toJSONArrayObject(arrayList5));
        hashMap.put(str2, JsonCreate.toJSONArrayObject(arrayList3));
        hashMap.put(str4, JsonCreate.toJSONArrayObject(arrayList4));
    }

    private void removeSourceData(String str, ArrayList<String> arrayList, Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, ArrayList<String> arrayList2, Object obj, String str2, String str3, String str4) {
        HashMap<String, Object> hashMap2;
        String appendid;
        ArrayList<Object> arrayList3 = new ArrayList<>();
        if (!new File(String.valueOf(str3) + "/" + str + "/" + str4 + "/").exists() || hashMap.get(getDataName(str2)) == null || obj == null) {
            return;
        }
        ArrayList<Object> valueList = getValueList(new ArrayList<>(), obj);
        if (valueList.size() <= 0 || (hashMap2 = JsonParse.geteObjectToMap(valueList.get(0))) == null || hashMap2.get("id") == null) {
            return;
        }
        String obj2 = hashMap2.get("id").toString();
        ArrayList<Object> valueList2 = getValueList(arrayList3, hashMap.get(getDataName(str2)));
        if (valueList2 == null || valueList2.size() <= 0) {
            return;
        }
        for (int i = 0; i < valueList2.size(); i++) {
            Object obj3 = valueList2.get(i);
            HashMap<String, Object> hashMap3 = JsonParse.geteObjectToMap(obj3);
            String dataIdKey = getDataIdKey(str2);
            if (hashMap3.get(dataIdKey) != null && obj2.equals(hashMap3.get(dataIdKey))) {
                if ("".equals(appendid(arrayList))) {
                    arrayList2.add(hashMap3.get(dataIdKey).toString());
                } else {
                    arrayList2.add(String.valueOf(appendid) + "_" + hashMap3.get(dataIdKey).toString());
                }
                if (hashMap2.get(KeyEnvironment.KEYWEBPATH) == null) {
                    if (hashMap3.get("items") == null || !str2.equals(AppEnvironment.LessonPlanning)) {
                        getdeletePath(hashMap3, str3, str, str4, "path");
                        deleteExamPath(hashMap3, str3, str, str4, str2);
                    } else {
                        getPlanPath(str3, str, str4, hashMap3, null);
                    }
                    valueList2.remove(obj3);
                    changeTreeData(tree, hashMap, JsonCreate.toJSONArrayObject(valueList2), getDataName(str2));
                    return;
                }
                String obj4 = hashMap2.get(KeyEnvironment.KEYWEBPATH).toString();
                if (hashMap3.get("items") != null && getPlanPath(str3, str, str4, hashMap3, obj4)) {
                    Object MaptoJSONObject = JsonCreate.MaptoJSONObject(hashMap3);
                    valueList2.remove(i);
                    valueList2.add(i, MaptoJSONObject);
                    changeTreeData(tree, hashMap, JsonCreate.toJSONArrayObject(valueList2), getDataName(str2));
                }
            }
        }
    }

    private void removeSourceNoData(String str, ArrayList<String> arrayList, HashMap<String, Object> hashMap, ArrayList<String> arrayList2, String str2, String str3, String str4) {
        ArrayList<Object> arrayList3 = new ArrayList<>();
        if (!new File(String.valueOf(str3) + "/" + str + "/" + str4 + "/").exists() || hashMap.get(getDataName(str2)) == null) {
            return;
        }
        ArrayList<Object> valueList = getValueList(arrayList3, hashMap.get(getDataName(str2)));
        if (valueList != null && valueList.size() > 0) {
            Iterator<Object> it = valueList.iterator();
            while (it.hasNext()) {
                HashMap<String, Object> hashMap2 = JsonParse.geteObjectToMap(it.next());
                if (hashMap2.get("id") != null) {
                    String appendid = appendid(arrayList);
                    if ("".equals(appendid)) {
                        arrayList2.add(hashMap2.get("id").toString());
                    } else {
                        arrayList2.add(String.valueOf(appendid) + "_" + hashMap2.get("id").toString());
                    }
                    if (hashMap2.get("items") != null) {
                        getPlanPath(str3, str, str4, hashMap2, null);
                    } else {
                        getdeletePath(hashMap2, str3, str, str4, "path");
                        deleteExamPath(hashMap2, str3, str, str4, str2);
                    }
                }
            }
        }
        hashMap.remove(getDataName(str2));
    }

    private void sortInsertObject(ArrayList<Object> arrayList) {
        ArrayList arrayList2 = new ArrayList();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= arrayList.size()) {
                break;
            }
            Object obj = arrayList.get(i2);
            HashMap<String, Object> hashMap = JsonParse.geteObjectToMap(obj);
            int i3 = i2;
            if (!LogHelp.TYPE_GUIDANCE.equals((hashMap == null || hashMap.get("status") == null) ? "0" : hashMap.get("status").toString())) {
                arrayList2.add(obj);
                arrayList.remove(obj);
                i3 = i2 - 1;
            }
            i = i3 + 1;
        }
        Iterator it = arrayList2.iterator();
        while (it.hasNext()) {
            arrayList.add(it.next());
        }
    }

    private ArrayList<String> toList(ArrayList<String> arrayList, Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, String str, String str2) {
        for (HashMap<String, Object> hashMap2 : tree.getSuccessors(hashMap)) {
            if (0 > 0) {
                break;
            }
            if (hashMap2.get(str) != null) {
                arrayList.add((String) hashMap2.get(str));
            }
            if (hashMap2.get(str2) != null) {
                toList(arrayList, tree, hashMap2, str, str2);
            }
        }
        return arrayList;
    }

    private ArrayList<HashMap<String, String>> updateDownloadlist(String str, String str2, HashMap<String, Object> hashMap, ArrayList<HashMap<String, String>> arrayList, String str3, String str4, String str5, String str6) {
        ArrayList<HashMap<String, String>> arrayList2 = arrayList;
        if (hashMap.get(str4) != null) {
            arrayList2 = arrayList;
            if (hashMap.get(str5) != null) {
                arrayList2 = arrayList;
                if (hashMap.get(str6) != null) {
                    arrayList2 = arrayList;
                    if (hashMap.get(str3) != null) {
                        ArrayList<Object> arrayList3 = new ArrayList<>();
                        ArrayList<Object> arrayList4 = new ArrayList<>();
                        ArrayList<Object> arrayList5 = new ArrayList<>();
                        ArrayList<Object> arrayList6 = new ArrayList<>();
                        ArrayList<Object> valueList = getValueList(arrayList3, hashMap.get(str4));
                        ArrayList<Object> valueList2 = getValueList(arrayList4, hashMap.get(str5));
                        ArrayList<Object> valueList3 = getValueList(arrayList5, hashMap.get(str6));
                        ArrayList<Object> valueList4 = getValueList(arrayList6, hashMap.get(str3));
                        arrayList2 = arrayList;
                        if (valueList != null) {
                            arrayList2 = arrayList;
                            if (valueList2 != null) {
                                arrayList2 = arrayList;
                                if (valueList3 != null) {
                                    arrayList2 = arrayList;
                                    if (valueList4 != null) {
                                        arrayList2 = arrayList;
                                        if (valueList.size() != 0) {
                                            arrayList2 = arrayList;
                                            if (valueList.size() == valueList2.size()) {
                                                arrayList2 = arrayList;
                                                if (valueList2.size() == valueList3.size()) {
                                                    arrayList2 = arrayList;
                                                    if (valueList3.size() == valueList4.size()) {
                                                        int i = 0;
                                                        while (i < valueList.size()) {
                                                            ArrayList<HashMap<String, String>> arrayList7 = arrayList;
                                                            if (!"100".equals(valueList3.get(i).toString())) {
                                                                arrayList7 = hashToDownloadlist(arrayList, str, str2, valueList.get(i).toString(), valueList2.get(i).toString(), valueList3.get(i).toString(), valueList4.get(i).toString());
                                                            }
                                                            i++;
                                                            arrayList = arrayList7;
                                                        }
                                                        arrayList2 = arrayList;
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
        return arrayList2;
    }

    private String updateExamsProgress(Tree<HashMap<String, Object>> tree, boolean z, String str, HashMap<String, Object> hashMap, String str2, String str3, long j) {
        ArrayList<Object> valueList = getValueList(new ArrayList<>(), hashMap.get("exams"));
        Log.d("map1111", "exams == " + hashMap.get("exams"));
        String str4 = str;
        if (valueList != null) {
            str4 = str;
            if (valueList.size() > 0) {
                long j2 = 0;
                long j3 = 0;
                int i = 0;
                while (true) {
                    boolean z2 = z;
                    if (i >= valueList.size()) {
                        break;
                    }
                    Object obj = valueList.get(i);
                    long j4 = j3;
                    long j5 = j2;
                    z = z2;
                    if (obj != null) {
                        HashMap<String, Object> hashMap2 = JsonParse.geteObjectToMap(obj);
                        j4 = j3;
                        j5 = j2;
                        z = z2;
                        if (hashMap2 != null) {
                            j4 = j3;
                            j5 = j2;
                            z = z2;
                            if (hashMap2.get(KeyEnvironment.KEYWEBPATH) != null) {
                                j4 = j3;
                                j5 = j2;
                                z = z2;
                                if (hashMap2.get("path") != null) {
                                    j4 = j3;
                                    j5 = j2;
                                    z = z2;
                                    if (hashMap2.get("progress") != null) {
                                        j4 = j3;
                                        j5 = j2;
                                        z = z2;
                                        if (hashMap2.get("sizes") != null) {
                                            ArrayList<Object> arrayList = new ArrayList<>();
                                            ArrayList<Object> arrayList2 = new ArrayList<>();
                                            ArrayList<Object> arrayList3 = new ArrayList<>();
                                            ArrayList<Object> arrayList4 = new ArrayList<>();
                                            ArrayList<Object> arrayList5 = new ArrayList<>();
                                            ArrayList<Object> valueList2 = getValueList(arrayList, hashMap2.get(KeyEnvironment.KEYWEBPATH));
                                            ArrayList<Object> valueList3 = getValueList(arrayList2, hashMap2.get("path"));
                                            ArrayList<Object> valueList4 = getValueList(arrayList3, hashMap2.get("progress"));
                                            ArrayList<Object> valueList5 = getValueList(arrayList4, hashMap2.get("sizes"));
                                            ArrayList<Object> valueList6 = getValueList(arrayList5, hashMap2.get(KeyEnvironment.KEYDOWNLOADSIZE));
                                            j4 = j3;
                                            j5 = j2;
                                            z = z2;
                                            if (valueList2 != null) {
                                                j4 = j3;
                                                j5 = j2;
                                                z = z2;
                                                if (valueList3 != null) {
                                                    j4 = j3;
                                                    j5 = j2;
                                                    z = z2;
                                                    if (valueList4 != null) {
                                                        j4 = j3;
                                                        j5 = j2;
                                                        z = z2;
                                                        if (valueList6 != null) {
                                                            j4 = j3;
                                                            j5 = j2;
                                                            z = z2;
                                                            if (valueList2.size() != 0) {
                                                                j4 = j3;
                                                                j5 = j2;
                                                                z = z2;
                                                                if (valueList2.size() == valueList3.size()) {
                                                                    j4 = j3;
                                                                    j5 = j2;
                                                                    z = z2;
                                                                    if (valueList3.size() == valueList4.size()) {
                                                                        j4 = j3;
                                                                        j5 = j2;
                                                                        z = z2;
                                                                        if (valueList4.size() == valueList6.size()) {
                                                                            j4 = j3;
                                                                            j5 = j2;
                                                                            z = z2;
                                                                            if (valueList6.size() == valueList5.size()) {
                                                                                z = z2;
                                                                                if (!z2) {
                                                                                    boolean updateDownloadsize = updateDownloadsize(tree, z2, hashMap2, valueList2, valueList4, valueList6, valueList5, str2, str3, j, "Exams", KeyEnvironment.KEYDOWNLOADSIZE, "progress");
                                                                                    z = updateDownloadsize;
                                                                                    if (updateDownloadsize) {
                                                                                        Object MaptoJSONObject = JsonCreate.MaptoJSONObject(hashMap2);
                                                                                        valueList.remove(i);
                                                                                        valueList.add(i, MaptoJSONObject);
                                                                                        hashMap.put("exams", JsonCreate.toJSONArrayObject(valueList));
                                                                                        z = updateDownloadsize;
                                                                                    }
                                                                                }
                                                                                for (int i2 = 0; i2 < valueList5.size(); i2++) {
                                                                                    long longValue = Long.valueOf(valueList6.get(i2).toString()).longValue();
                                                                                    j3 += longValue;
                                                                                    long longValue2 = Long.valueOf(valueList5.get(i2).toString()).longValue();
                                                                                    long j6 = j2 + longValue2;
                                                                                    j2 = j6;
                                                                                    if (longValue2 == 0) {
                                                                                        j2 = j6;
                                                                                        if (j3 > 0) {
                                                                                            j2 = j6 + longValue;
                                                                                        }
                                                                                    }
                                                                                }
                                                                                j5 = j2;
                                                                                j4 = j3;
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
                    }
                    i++;
                    j3 = j4;
                    j2 = j5;
                }
                String num = j2 == 0 ? "0" : j2 == j3 ? "100" : Integer.toString((int) ((((float) j3) * 100.0f) / ((float) j2)));
                hashMap.put("examsprogress", num);
                str4 = num;
            }
        }
        return str4;
    }

    private boolean updateHMExamProAndSize(boolean z, Tree<HashMap<String, Object>> tree, String str, HashMap<String, Object> hashMap, String str2, String str3, long j, String str4, String str5, String str6, String str7, String str8, String str9) {
        boolean z2 = z;
        if (hashMap.get(str5) != null) {
            z2 = z;
            if (hashMap.get(str6) != null) {
                z2 = z;
                if (hashMap.get(str7) != null) {
                    z2 = z;
                    if (hashMap.get(str8) != null) {
                        z2 = z;
                        if (hashMap.get(str9) != null) {
                            ArrayList<Object> arrayList = new ArrayList<>();
                            ArrayList<Object> arrayList2 = new ArrayList<>();
                            ArrayList<Object> arrayList3 = new ArrayList<>();
                            ArrayList<Object> arrayList4 = new ArrayList<>();
                            ArrayList<Object> arrayList5 = new ArrayList<>();
                            ArrayList<Object> valueList = getValueList(arrayList, hashMap.get(str5));
                            ArrayList<Object> valueList2 = getValueList(arrayList2, hashMap.get(str6));
                            ArrayList<Object> valueList3 = getValueList(arrayList3, hashMap.get(str7));
                            ArrayList<Object> valueList4 = getValueList(arrayList4, hashMap.get(str9));
                            ArrayList<Object> valueList5 = getValueList(arrayList5, hashMap.get(str8));
                            z2 = z;
                            if (valueList != null) {
                                z2 = z;
                                if (valueList2 != null) {
                                    z2 = z;
                                    if (valueList3 != null) {
                                        z2 = z;
                                        if (valueList5 != null) {
                                            z2 = z;
                                            if (valueList4 != null) {
                                                z2 = z;
                                                if (valueList.size() != 0) {
                                                    z2 = z;
                                                    if (valueList.size() == valueList2.size()) {
                                                        z2 = z;
                                                        if (valueList2.size() == valueList3.size()) {
                                                            z2 = z;
                                                            if (valueList3.size() == valueList5.size()) {
                                                                z2 = z;
                                                                if (valueList5.size() == valueList4.size()) {
                                                                    boolean updateDownloadsize = updateDownloadsize(tree, z, hashMap, valueList, valueList3, valueList5, valueList4, str2, str3, j, str4, KeyEnvironment.KEYDOWNLOADSIZE, "progress");
                                                                    if (updateDownloadsize && (str4.equals(AppEnvironment.Homework) || str4.equals(AppEnvironment.MyExaminationPaper))) {
                                                                        hashMap.put("homeworkprogress", updateHMTotalProgress("0", valueList5, valueList4, valueList3));
                                                                        z2 = updateDownloadsize;
                                                                    } else if (updateDownloadsize && str4.equals("ExamMp")) {
                                                                        hashMap.put("questionprogress", updateHMTotalProgress("0", valueList5, valueList4, valueList3));
                                                                        z2 = updateDownloadsize;
                                                                    } else if (!updateDownloadsize || !str4.equals("ExamImage")) {
                                                                        z2 = updateDownloadsize;
                                                                        if (updateDownloadsize) {
                                                                            z2 = updateDownloadsize;
                                                                            if (str4.equals(AppEnvironment.GeRenChengZhang)) {
                                                                                hashMap.put("questionprogress", updateHMTotalProgress("0", valueList5, valueList4, valueList3));
                                                                                z2 = updateDownloadsize;
                                                                            }
                                                                        }
                                                                    } else {
                                                                        updateHMTotalProgress("0", valueList5, valueList4, valueList3);
                                                                        z2 = updateDownloadsize;
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
            }
        }
        return z2;
    }

    private String updateHMTotalProgress(String str, ArrayList<Object> arrayList, ArrayList<Object> arrayList2, ArrayList<Object> arrayList3) {
        long j = 0;
        long j2 = 0;
        boolean z = true;
        for (int i = 0; i < arrayList2.size(); i++) {
            j += Long.valueOf(arrayList2.get(i).toString()).longValue();
            j2 += Long.valueOf(arrayList.get(i).toString()).longValue();
            if (!"100".equals(arrayList3.get(i))) {
                z = false;
            }
        }
        return j == 0 ? !z ? "0" : "100" : j == j2 ? "100" : Integer.toString((int) ((((float) j2) * 100.0f) / ((float) j)));
    }

    private ArrayList<HashMap<String, String>> updateLessonPlanDownloadlist(String str, String str2, HashMap<String, Object> hashMap, ArrayList<HashMap<String, String>> arrayList, String str3) {
        ArrayList<HashMap<String, String>> arrayList2 = arrayList;
        if (hashMap.get(KeyEnvironment.KEYWEBPATH) != null) {
            arrayList2 = arrayList;
            if (hashMap.get("path") != null) {
                arrayList2 = arrayList;
                if (hashMap.get("progress") != null) {
                    arrayList2 = arrayList;
                    if (hashMap.get(str3) != null) {
                        String obj = hashMap.get(KeyEnvironment.KEYWEBPATH).toString();
                        String obj2 = hashMap.get("path").toString();
                        String obj3 = hashMap.get("progress").toString();
                        String obj4 = hashMap.get(str3).toString();
                        arrayList2 = arrayList;
                        if (!"100".equals(obj3)) {
                            arrayList2 = hashToDownloadlist(arrayList, str, str2, obj, obj2, obj3, obj4);
                        }
                    }
                }
            }
        }
        return arrayList2;
    }

    private String updateQprogress(HashMap<String, Object> hashMap, String str, String str2, String str3, String str4) {
        ArrayList<Object> valueList = getValueList(new ArrayList<>(), hashMap.get("question"));
        String str5 = str;
        if (valueList != null) {
            str5 = str;
            if (valueList.size() > 0) {
                int i = 0;
                while (true) {
                    str5 = str;
                    if (i >= valueList.size()) {
                        break;
                    }
                    str = str5;
                    if (JsonParse.geteObjectToMap(valueList.get(i)).get("questionid") != null) {
                        if (hashMap.get(str2) != null && hashMap.get(str3) != null && hashMap.get(str4) != null) {
                            ArrayList<Object> arrayList = new ArrayList<>();
                            ArrayList<Object> arrayList2 = new ArrayList<>();
                            ArrayList<Object> arrayList3 = new ArrayList<>();
                            ArrayList<Object> valueList2 = getValueList(arrayList, hashMap.get(str2));
                            ArrayList<Object> valueList3 = getValueList(arrayList2, hashMap.get(str4));
                            ArrayList<Object> valueList4 = getValueList(arrayList3, hashMap.get(str3));
                            if (valueList2 != null && valueList4 != null && valueList3 != null) {
                                if (valueList2.size() != 0 && valueList2.size() == valueList4.size() && valueList4.size() == valueList3.size()) {
                                    str = updateHMTotalProgress(str5, valueList4, valueList3, valueList2);
                                    str5 = str;
                                    if ("0".equals(str)) {
                                        break;
                                    }
                                } else {
                                    str = "100";
                                }
                            } else {
                                str = "100";
                            }
                        } else {
                            str = "100";
                        }
                    }
                    i++;
                }
            }
        }
        return str5;
    }

    public void UpdateGeRenOldJsonMap(HashMap<String, Object> hashMap, HashMap<String, Object> hashMap2, String str, ArrayList<HashMap<String, String>> arrayList) {
        ArrayList<String> arrayList2 = new ArrayList<>();
        ArrayList<Object> arrayList3 = new ArrayList<>();
        ArrayList<Object> arrayList4 = new ArrayList<>();
        ArrayList<Object> arrayList5 = arrayList3;
        if (hashMap.get("data") != null) {
            arrayList5 = getValueList(arrayList3, hashMap.get("data"));
        }
        ArrayList<Object> arrayList6 = arrayList4;
        if (hashMap2 != null) {
            arrayList6 = arrayList4;
            if (hashMap2.get("data") != null) {
                arrayList6 = getValueList(arrayList4, hashMap2.get("data"));
            }
        }
        ArrayList<Object> appendObjectGeRen = appendObjectGeRen(arrayList2, arrayList6, arrayList5, str, arrayList);
        Object obj = null;
        if (appendObjectGeRen != null) {
            obj = null;
            if (appendObjectGeRen.size() > 0) {
                obj = JsonCreate.toJSONArrayObject(appendObjectGeRen);
            }
        }
        if (hashMap2 != null) {
            hashMap2.put("data", obj);
        }
    }

    public void UpdateOldJsonMap(HashMap<String, Object> hashMap, HashMap<String, Object> hashMap2, String str, ArrayList<HashMap<String, String>> arrayList) {
        String obj = hashMap.get("id").toString();
        ArrayList<String> arrayList2 = new ArrayList<>();
        arrayList2.add(obj);
        ArrayList<Object> arrayList3 = new ArrayList<>();
        ArrayList<Object> arrayList4 = new ArrayList<>();
        ArrayList<Object> arrayList5 = arrayList3;
        if (hashMap.get("data") != null) {
            arrayList5 = getValueList(arrayList3, hashMap.get("data"));
        }
        ArrayList<Object> arrayList6 = arrayList4;
        if (hashMap2 != null) {
            arrayList6 = arrayList4;
            if (hashMap2.get("data") != null) {
                arrayList6 = getValueList(arrayList4, hashMap2.get("data"));
            }
        }
        ArrayList<Object> appendObject = appendObject(obj, arrayList2, arrayList6, arrayList5, str, arrayList);
        Object obj2 = null;
        if (appendObject != null) {
            obj2 = null;
            if (appendObject.size() > 0) {
                sortInsertObject(appendObject);
                obj2 = JsonCreate.toJSONArrayObject(appendObject);
            }
        }
        if (hashMap2 != null) {
            hashMap2.put("data", obj2);
        }
    }

    public void addDataToNewTree(Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, ArrayList<String> arrayList, ArrayList<Object> arrayList2, String str, String str2, ArrayList<HashMap<String, String>> arrayList3) {
        ArrayList<Object> arrayList4;
        HashMap<String, Object> hashMap2;
        Object obj;
        if (tree == null || hashMap == null || hashMap.get(str) == null || arrayList2 == null || arrayList == null || arrayList.size() <= 0 || !hashMap.get(str).toString().equals(arrayList.get(0))) {
            return;
        }
        String obj2 = hashMap.get(str).toString();
        int i = 1;
        ArrayList<Object> arrayList5 = arrayList2;
        while (true) {
            ArrayList<Object> arrayList6 = arrayList5;
            if (i >= arrayList.size()) {
                return;
            }
            Iterator<HashMap<String, Object>> it = tree.getSuccessors(hashMap).iterator();
            while (true) {
                if (!it.hasNext()) {
                    arrayList4 = arrayList6;
                    hashMap2 = hashMap;
                    break;
                }
                HashMap<String, Object> next = it.next();
                if (next.get(str) != null && next.get(str).toString().equals(arrayList.get(i))) {
                    hashMap2 = next;
                    arrayList4 = arrayList6;
                    if (i == arrayList.size() - 1) {
                        ArrayList<Object> arrayList7 = new ArrayList<>();
                        ArrayList<Object> addNewKeys = addNewKeys(arrayList6, str2);
                        if (next.get(getDataName(str2)) != null) {
                            ArrayList<Object> valueList = getValueList(arrayList7, next.get(getDataName(str2)));
                            ArrayList<Object> appendPlanIdObject = str2.equals(AppEnvironment.LessonPlanning) ? appendPlanIdObject(obj2, arrayList, valueList, addNewKeys, str2, arrayList3) : appendObject(obj2, arrayList, valueList, addNewKeys, str2, arrayList3);
                            obj = null;
                            if (appendPlanIdObject != null) {
                                obj = null;
                                if (appendPlanIdObject.size() > 0) {
                                    obj = JsonCreate.toJSONArrayObject(appendPlanIdObject);
                                }
                            }
                        } else {
                            ArrayList<Object> appendPlanIdObject2 = str2.equals(AppEnvironment.LessonPlanning) ? appendPlanIdObject(obj2, arrayList, arrayList7, addNewKeys, str2, arrayList3) : appendObject(obj2, arrayList, arrayList7, addNewKeys, str2, arrayList3);
                            obj = null;
                            if (appendPlanIdObject2 != null) {
                                obj = null;
                                if (appendPlanIdObject2.size() > 0) {
                                    obj = JsonCreate.toJSONArrayObject(appendPlanIdObject2);
                                }
                            }
                        }
                        hashMap2 = next;
                        arrayList4 = addNewKeys;
                        if (obj != null) {
                            changeTreeData(tree, next, obj, getDataName(str2));
                            hashMap2 = next;
                            arrayList4 = addNewKeys;
                        }
                    }
                }
            }
            i++;
            hashMap = hashMap2;
            arrayList5 = arrayList4;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0081, code lost:
        if (r13.equals(com.edutech.idauthentication.AppEnvironment.MyExaminationPaper) != false) goto L22;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void addNewKeysChange(HashMap<String, Object> hashMap, ArrayList<Object> arrayList, boolean z, String str, int i) {
        boolean z2;
        Object MaptoJSONObject;
        if (str.equals(AppEnvironment.GeRenChengZhang) || str.equals("WrongQuestionSet")) {
            if (hashMap.get("isdown") == null) {
                z = true;
                hashMap.put("isdown", true);
            }
            z2 = insertProDownsize(hashMap, z, KeyEnvironment.KEYWEBPATH, "progress", KeyEnvironment.KEYDOWNLOADSIZE);
            if (hashMap.get("questionprogress") == null) {
                z2 = true;
                hashMap.put("questionprogress", "0");
            }
        } else {
            if (!str.equals(AppEnvironment.Homework)) {
                z2 = z;
            }
            if (hashMap.get("isdown") == null) {
                z = true;
                hashMap.put("isdown", true);
            }
            boolean insertProDownsize = insertProDownsize(hashMap, z, KeyEnvironment.KEYWEBPATH, "progress", KeyEnvironment.KEYDOWNLOADSIZE);
            boolean z3 = insertProDownsize;
            if (hashMap.get("attwebpath") != null) {
                z3 = insertProDownsize(hashMap, insertProDownsize, "attwebpath", "attprogress", "attdownloadsize");
            }
            if (hashMap.get("homeworkprogress") == null) {
                z3 = true;
                if (isNullWebpath(hashMap, KeyEnvironment.KEYWEBPATH)) {
                    hashMap.put("homeworkprogress", "100");
                } else {
                    hashMap.put("homeworkprogress", "0");
                }
            }
            boolean z4 = true;
            z2 = z3;
            if (hashMap.get("question") != null) {
                ArrayList<Object> valueList = getValueList(new ArrayList<>(), hashMap.get("question"));
                z4 = true;
                z2 = z3;
                if (valueList != null) {
                    z4 = true;
                    z2 = z3;
                    if (valueList.size() > 0) {
                        int i2 = 0;
                        z4 = true;
                        while (i2 < valueList.size()) {
                            HashMap<String, Object> hashMap2 = JsonParse.geteObjectToMap(valueList.get(i2));
                            boolean z5 = z3;
                            if (hashMap2.get("questionid") != null) {
                                boolean insertProDownsize2 = insertProDownsize(hashMap2, insertProDownsize(hashMap2, z3, KeyEnvironment.KEYWEBPATH, "progress", KeyEnvironment.KEYDOWNLOADSIZE), "qwebpath", "qprogress", "qdownloadsize");
                                boolean isNullWebpath = isNullWebpath(hashMap2, "qwebpath");
                                if (hashMap2.get("questionprogress") == null) {
                                    insertProDownsize2 = true;
                                    if (isNullWebpath(hashMap2, KeyEnvironment.KEYWEBPATH)) {
                                        hashMap2.put("questionprogress", "100");
                                    } else {
                                        hashMap2.put("questionprogress", "0");
                                    }
                                }
                                z4 = isNullWebpath;
                                z5 = insertProDownsize2;
                                if (insertProDownsize2) {
                                    Object MaptoJSONObject2 = JsonCreate.MaptoJSONObject(hashMap2);
                                    valueList.remove(i2);
                                    valueList.add(i2, MaptoJSONObject2);
                                    hashMap.put("question", JsonCreate.toJSONArrayObject(valueList));
                                    z5 = insertProDownsize2;
                                    z4 = isNullWebpath;
                                }
                            }
                            i2++;
                            z3 = z5;
                        }
                        z2 = z3;
                    }
                }
            }
            if (hashMap.get("qprogress") == null) {
                z2 = true;
                if (z4) {
                    hashMap.put("qprogress", "100");
                } else {
                    hashMap.put("qprogress", "0");
                }
            }
        }
        if (!z2 || (MaptoJSONObject = JsonCreate.MaptoJSONObject(hashMap)) == null) {
            return;
        }
        arrayList.remove(i);
        arrayList.add(i, MaptoJSONObject);
    }

    public void addNewKeysLessonPlan(HashMap<String, Object> hashMap, ArrayList<Object> arrayList, boolean z, String str, int i) {
        boolean z2;
        ArrayList<Object> valueList = getValueList(new ArrayList<>(), hashMap.get("items"));
        if (valueList == null || valueList.size() <= 0) {
            return;
        }
        int i2 = 0;
        while (true) {
            z2 = z;
            if (i2 >= valueList.size()) {
                break;
            }
            HashMap<String, Object> hashMap2 = JsonParse.geteObjectToMap(valueList.get(i2));
            z = z2;
            if (hashMap2.get(KeyEnvironment.KEYWEBPATH) != null) {
                String obj = hashMap2.get(KeyEnvironment.KEYWEBPATH).toString();
                z = z2;
                if (obj != null) {
                    z = z2;
                    if (!"".equals(obj)) {
                        if (hashMap2.get("progress") != null) {
                            z = z2;
                            if (hashMap2.get(KeyEnvironment.KEYDOWNLOADSIZE) != null) {
                            }
                        }
                        hashMap2.put("progress", "0");
                        hashMap2.put(KeyEnvironment.KEYDOWNLOADSIZE, 0L);
                        Object MaptoJSONObject = JsonCreate.MaptoJSONObject(hashMap2);
                        z = true;
                        if (MaptoJSONObject != null) {
                            valueList.remove(i2);
                            valueList.add(i2, MaptoJSONObject);
                            z = true;
                        }
                    }
                }
            }
            i2++;
        }
        if (!z2) {
            return;
        }
        hashMap.put("items", JsonCreate.toJSONArrayObject(valueList));
        Object MaptoJSONObject2 = JsonCreate.MaptoJSONObject(hashMap);
        arrayList.remove(i);
        arrayList.add(i, MaptoJSONObject2);
    }

    public String appendid(ArrayList<String> arrayList) {
        String str = "";
        for (int i = 0; i < arrayList.size(); i++) {
            str = i + 1 == arrayList.size() ? String.valueOf(str) + arrayList.get(i) : String.valueOf(str) + arrayList.get(i) + "_";
        }
        return str;
    }

    public void changeTreeData(Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, Object obj, String str) {
        Tree<HashMap<String, Object>> tree2 = tree.getTree(hashMap);
        if (tree2 == null) {
            hashMap.put(str, obj);
            return;
        }
        tree2.removeHead(hashMap);
        hashMap.put(str, obj);
        tree2.setHead(hashMap);
    }

    public void createSubTrees(Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap) {
        ArrayList<Object> arrayList = null;
        try {
            arrayList = this.common.parseJSONArray((JSONArray) hashMap.get("children"));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        ArrayList arrayList2 = new ArrayList();
        arrayList2.add(hashMap);
        if (arrayList != null) {
            Iterator<Object> it = arrayList.iterator();
            while (it.hasNext()) {
                JsonParse.childrenlist(tree, arrayList2, this.common, it.next(), "children");
            }
        }
        tree.getSuccessors(hashMap);
    }

    public void deletePlanFile(Tree<HashMap<String, Object>> tree, String str, String str2, String str3, String str4, String str5) {
        ArrayList<Object> valueList;
        Object removeObject;
        HashMap<String, Object> deleteFile = deleteFile(tree, str, str4, str5);
        if (deleteFile.get(getDataName("DaoXueBen")) == null || (valueList = getValueList(new ArrayList<>(), deleteFile.get(getDataName("DaoXueBen")))) == null || valueList.size() <= 0 || (removeObject = getRemoveObject(valueList, str4, str2)) == null) {
            return;
        }
        getRemoveItem(removeObject, str3);
    }

    public void deleteSingleFile(Tree<HashMap<String, Object>> tree, String str, String str2, String str3, String str4) {
        ArrayList<Object> valueList;
        Object removeObject;
        HashMap<String, Object> deleteFile = deleteFile(tree, str, str3, str4);
        if (deleteFile.get(getDataName("DaoXueBen")) == null || (valueList = getValueList(new ArrayList<>(), deleteFile.get(getDataName("DaoXueBen")))) == null || valueList.size() <= 0 || (removeObject = getRemoveObject(valueList, str3, str2)) == null) {
            return;
        }
        valueList.remove(removeObject);
    }

    public ArrayList<String> deleteSourceFile(String str, String str2, String str3, ArrayList<String> arrayList, String str4, String str5) {
        Tree<HashMap<String, Object>> parsejson;
        Tree<HashMap<String, Object>> parsejson2 = JsonParse.parsejson(null, str, "children", "children");
        if (parsejson2 != null && parsejson2.getHead() != null) {
            String obj = parsejson2.getHead().get(str4).toString();
            String str6 = String.valueOf(str2) + obj + "/" + str3 + "/json.json";
            if (new File(str6).exists() && (parsejson = JsonParse.parsejson(null, JsonHelper.getFileString(str6), "data", "children")) != null && parsejson.getHead() != null && parsejson.getHead().get(str4) != null && obj.equals(parsejson.getHead().get(str4).toString())) {
                ArrayList<String> arrayList2 = new ArrayList<>();
                arrayList2.add(obj);
                getSourceIdList(obj, arrayList2, parsejson, parsejson2, parsejson.getHead(), parsejson2.getHead(), arrayList, str4, str5, str2, str3);
                JsonCreate.saveJsonToLocal(JsonCreate.createjson(parsejson), str6);
            }
        }
        return arrayList;
    }

    public HashMap<String, Object> examAddNewKeys(HashMap<String, Object> hashMap, String str) {
        ArrayList<Object> arrayList = new ArrayList<>();
        ArrayList<Object> arrayList2 = arrayList;
        boolean z = false;
        if (hashMap.get("data") != null) {
            ArrayList<Object> valueList = getValueList(arrayList, hashMap.get("data"));
            arrayList2 = valueList;
            z = false;
            if (valueList.size() > 0) {
                z = true;
                arrayList2 = addNewKeys(valueList, str);
            }
        }
        if (z) {
            hashMap.put("data", JsonCreate.toJSONArrayObject(arrayList2));
        }
        return hashMap;
    }

    public ArrayList<HashMap<String, String>> getAllBookNeedDownList(ArrayList<HashMap<String, String>> arrayList, String str, String str2, String str3, String str4) {
        Iterator<Books> it = JsonParse.parseBooksJson(new ArrayList(), str).iterator();
        while (it.hasNext()) {
            Books next = it.next();
            String str5 = next.getbook_id();
            next.getbook_path();
            if (str5 != null && !"".equals(str5)) {
                String str6 = String.valueOf(str2) + str5 + "/" + str3 + "/";
                if (str4.equals("DaoXueBenNew") || str4.equals("DaoXueBen") || str4.equals("ZuoYeFuDao")) {
                    str6 = String.valueOf(str2) + str5 + "/";
                }
                if (new File(str6).exists()) {
                    String str7 = String.valueOf(str6) + "json.json";
                    if (new File(str7).exists()) {
                        arrayList = (str4.equals(AppEnvironment.Homework) || str4.equals(AppEnvironment.MyExaminationPaper)) ? getBookExamDownList(arrayList, next, str7, str4) : getBookDownList(arrayList, next, str7, str4);
                    }
                }
            }
        }
        return arrayList;
    }

    public void getFileDownloadList(HashMap<String, Object> hashMap, ArrayList<HashMap<String, String>> arrayList, String str) {
        if (hashMap == null || hashMap.get("data") == null) {
            return;
        }
        Iterator<Object> it = getValueList(new ArrayList<>(), hashMap.get("data")).iterator();
        while (it.hasNext()) {
            addToneedDownloadListGeRen("", it.next(), arrayList, str);
        }
    }

    public HashMap<String, Object> getNeedDownHead(Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, ArrayList<String> arrayList, String str) {
        for (int i = 1; i < arrayList.size(); i++) {
            String str2 = arrayList.get(i);
            Iterator<HashMap<String, Object>> it = tree.getSuccessors(hashMap).iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                HashMap<String, Object> next = it.next();
                if (next.get(str) != null && str2.equals(next.get(str).toString())) {
                    hashMap = next;
                    break;
                }
            }
        }
        return hashMap;
    }

    public ArrayList<HashMap<String, String>> getNeedDownloadList(Tree<HashMap<String, Object>> tree, String str, String str2, String str3, ArrayList<HashMap<String, String>> arrayList) {
        Tree<HashMap<String, Object>> parsejson = JsonParse.parsejson(null, str, "children", "children");
        if (parsejson != null && parsejson.getHead() != null) {
            updateJsonTree(tree, parsejson, str2, str3, arrayList);
        }
        return arrayList;
    }

    public HashMap<String, Object> getUpdateJsonObject(Tree<HashMap<String, Object>> tree, ArrayList<String> arrayList) {
        return (arrayList.size() <= 0 || tree == null || tree.getHead() == null || tree.getHead().get("id") == null || !tree.getHead().get("id").toString().equals(arrayList.get(0))) ? null : getjsonObject(tree, tree.getHead(), arrayList);
    }

    public ArrayList<Object> getValueList(ArrayList<Object> arrayList, Object obj) {
        ArrayList<Object> parseValueList;
        if (arrayList != null && obj != null && this.common.isJsonArray(obj) && (parseValueList = parseValueList(obj)) != null && parseValueList.size() > 0) {
            Iterator<Object> it = parseValueList.iterator();
            while (it.hasNext()) {
                Object next = it.next();
                if (this.common.isJsonArray(next)) {
                    getValueList(arrayList, next);
                } else {
                    arrayList.add(next);
                }
            }
        }
        return arrayList;
    }

    public HashMap<String, String> getWebPathHashMap(Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> tree2) {
        return null;
    }

    public String getidList(Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, ArrayList<String> arrayList, String str, String str2) {
        for (HashMap<String, Object> hashMap2 : tree.getSuccessors(hashMap)) {
            if (hashMap2 != null && hashMap2.get(str) != null) {
                arrayList.add(hashMap2.get(str).toString());
                String str3 = str2;
                if (hashMap2.get("data") != null) {
                    ArrayList<Object> valueList = getValueList(new ArrayList<>(), hashMap2.get("data"));
                    str3 = str2;
                    if (valueList.size() > 0) {
                        try {
                            HashMap<String, Object> parseJSONObject = this.common.parseJSONObject((JSONObject) valueList.get(0));
                            str3 = str2;
                            if (parseJSONObject != null) {
                                str3 = str2;
                                if (parseJSONObject.get(str) != null) {
                                    str3 = parseJSONObject.get(str).toString();
                                }
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            str3 = str2;
                        }
                    }
                }
                str2 = getidList(tree, hashMap2, arrayList, str, str3);
            }
        }
        return str2;
    }

    public ArrayList<Object> parseValueList(Object obj) {
        ArrayList<Object> arrayList;
        try {
            arrayList = new CommonJSONParser().parseJSONArray((JSONArray) obj);
        } catch (JSONException e) {
            e.printStackTrace();
            arrayList = null;
        } catch (Exception e2) {
            e2.printStackTrace();
            arrayList = null;
        }
        return arrayList;
    }

    public String removeSourceId(String str) {
        return str.lastIndexOf("_") != -1 ? str.substring(0, str.lastIndexOf("_")) : "";
    }

    public ArrayList<String> sourceidToList(String str) {
        ArrayList<String> arrayList = new ArrayList<>();
        if (str != null && !"".equals(str)) {
            while (str.indexOf("_") != -1) {
                int indexOf = str.indexOf("_");
                arrayList.add(str.substring(0, indexOf));
                if (indexOf < str.length() - 1) {
                    str = str.substring(indexOf + 1);
                }
            }
            if (str.length() > 0) {
                arrayList.add(str);
            }
        }
        return arrayList;
    }

    public ArrayList<String> treeToList(String str, String str2, String str3) {
        ArrayList<String> list;
        ArrayList<String> arrayList = new ArrayList<>();
        Tree<HashMap<String, Object>> parsejson = JsonParse.parsejson(null, str, str3, str3);
        if (parsejson == null) {
            list = arrayList;
        } else {
            if (parsejson.getHead() != null && parsejson.getHead().get(str2) != null) {
                arrayList.add((String) parsejson.getHead().get(str2));
            }
            list = toList(arrayList, parsejson, parsejson.getHead(), str2, str3);
        }
        return list;
    }

    public boolean updateDownloadsize(Tree<HashMap<String, Object>> tree, boolean z, HashMap<String, Object> hashMap, ArrayList<Object> arrayList, ArrayList<Object> arrayList2, ArrayList<Object> arrayList3, ArrayList<Object> arrayList4, String str, String str2, long j, String str3, String str4, String str5) {
        int i = 0;
        while (true) {
            if (i >= arrayList.size()) {
                break;
            } else if (str.equals(arrayList.get(i).toString())) {
                arrayList3.remove(i);
                arrayList3.add(i, Long.valueOf(j));
                if (arrayList3.get(i).toString().equals(arrayList4.get(i).toString())) {
                    arrayList2.remove(i);
                    arrayList2.add(i, "100");
                } else {
                    arrayList2.remove(i);
                    arrayList2.add(i, str2);
                }
                if (str3.equals("DaoXueBen")) {
                    changeTreeData(tree, hashMap, JsonCreate.toJSONArrayObject(arrayList2), str5);
                    changeTreeData(tree, hashMap, JsonCreate.toJSONArrayObject(arrayList3), str4);
                } else if (str3.equals("DaoXueBenNew")) {
                    hashMap.put(str5, JsonCreate.toJSONArrayObject(arrayList2));
                    hashMap.put(str4, JsonCreate.toJSONArrayObject(arrayList3));
                } else if (str3.equals("ExamImage")) {
                    hashMap.put("qprogress", JsonCreate.toJSONArrayObject(arrayList2));
                    hashMap.put("qdownloadsize", JsonCreate.toJSONArrayObject(arrayList3));
                } else {
                    hashMap.put(str5, JsonCreate.toJSONArrayObject(arrayList2));
                    hashMap.put(str4, JsonCreate.toJSONArrayObject(arrayList3));
                }
                z = true;
            } else {
                i++;
            }
        }
        return z;
    }

    public String updateDxProgressAndSize(Tree<HashMap<String, Object>> tree, String str, HashMap<String, Object> hashMap, String str2, String str3, long j, String str4, String str5, String str6, String str7, String str8) {
        String str9 = "-1";
        String sizeKey = getSizeKey(str4);
        String str10 = str9;
        if (hashMap.get("dxitems") != null) {
            ArrayList<Object> valueList = getValueList(new ArrayList<>(), hashMap.get("dxitems"));
            str10 = str9;
            if (valueList != null) {
                str10 = str9;
                if (valueList.size() > 0) {
                    int i = 0;
                    while (true) {
                        if (i >= valueList.size()) {
                            break;
                        }
                        HashMap<String, Object> hashMap2 = JsonParse.geteObjectToMap(valueList.get(i));
                        if (hashMap2 == null || hashMap2.get("dxid") == null || !str.equals(hashMap2.get("dxid").toString())) {
                            i++;
                        } else {
                            boolean z = false;
                            String str11 = str9;
                            if (hashMap2.get(str5) != null) {
                                z = false;
                                str11 = str9;
                                if (hashMap2.get(str6) != null) {
                                    z = false;
                                    str11 = str9;
                                    if (hashMap2.get(str8) != null) {
                                        z = false;
                                        str11 = str9;
                                        if (hashMap2.get(str7) != null) {
                                            z = false;
                                            str11 = str9;
                                            if (hashMap2.get(sizeKey) != null) {
                                                ArrayList<Object> arrayList = new ArrayList<>();
                                                ArrayList<Object> arrayList2 = new ArrayList<>();
                                                ArrayList<Object> arrayList3 = new ArrayList<>();
                                                ArrayList<Object> arrayList4 = new ArrayList<>();
                                                ArrayList<Object> arrayList5 = new ArrayList<>();
                                                ArrayList<Object> valueList2 = getValueList(arrayList, hashMap2.get(str5));
                                                ArrayList<Object> valueList3 = getValueList(arrayList2, hashMap2.get(str6));
                                                ArrayList<Object> valueList4 = getValueList(arrayList3, hashMap2.get(str8));
                                                ArrayList<Object> valueList5 = getValueList(arrayList4, hashMap2.get(sizeKey));
                                                ArrayList<Object> valueList6 = getValueList(arrayList5, hashMap2.get(str7));
                                                z = false;
                                                str11 = str9;
                                                if (valueList2 != null) {
                                                    z = false;
                                                    str11 = str9;
                                                    if (valueList3 != null) {
                                                        z = false;
                                                        str11 = str9;
                                                        if (valueList4 != null) {
                                                            z = false;
                                                            str11 = str9;
                                                            if (valueList6 != null) {
                                                                z = false;
                                                                str11 = str9;
                                                                if (valueList5 != null) {
                                                                    boolean updateDownloadsize = updateDownloadsize(tree, false, hashMap2, valueList2, valueList4, valueList6, valueList5, str2, str3, j, str4, str7, str8);
                                                                    z = updateDownloadsize;
                                                                    str11 = str9;
                                                                    if (!updateDownloadsize) {
                                                                        z = updateDownloadsize;
                                                                        str11 = str9;
                                                                        if (str4.equals("DaoXueBenNew")) {
                                                                            z = updateDownloadsize;
                                                                            str11 = str9;
                                                                            if (hashMap2.get("exams") != null) {
                                                                                str11 = updateExamsProgress(tree, updateDownloadsize, "-1", hashMap2, str2, str3, j);
                                                                                hashMap2.put("examsprogress", str11);
                                                                                z = true;
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
                            str9 = str11;
                            if (z) {
                                Object MaptoJSONObject = JsonCreate.MaptoJSONObject(hashMap2);
                                str9 = str11;
                                if (MaptoJSONObject != null) {
                                    valueList.remove(i);
                                    valueList.add(i, MaptoJSONObject);
                                    str9 = str11;
                                }
                            }
                        }
                    }
                    changeTreeData(tree, hashMap, JsonCreate.toJSONArrayObject(valueList), "dxitems");
                    str10 = str9;
                }
            }
        }
        return str10;
    }

    public void updateErrorStatus(String str, String str2, String str3, int i, String str4, Tree<HashMap<String, Object>> tree) {
        String str5;
        Tree<HashMap<String, Object>> parsejson;
        Iterator<Books> it = JsonParse.parseBooksJson(new ArrayList(), str).iterator();
        while (it.hasNext()) {
            Books next = it.next();
            String str6 = next.getbook_id();
            next.getbook_path();
            if (str6 != null && !"".equals(str6) && str6.equals(str4)) {
                if (new File(String.valueOf(str3) + str6 + "/").exists()) {
                    String str7 = String.valueOf(str5) + "json.json";
                    if (new File(str7).exists() && (parsejson = JsonParse.parsejson(null, JsonHelper.getFileString(str7), "data", "children")) != null && parsejson.getHead() != null && parsejson.getHead().get("id") != null) {
                        boolean z = false;
                        ArrayList<String> arrayList = new ArrayList<>();
                        arrayList.add(str6);
                        String str8 = getidList(tree, tree.getHead(), arrayList, "id", "");
                        boolean z2 = false;
                        if (str8 != null) {
                            z2 = false;
                            if (!"".equals(str8)) {
                                parsejson.getHead();
                                z2 = false;
                                if (arrayList.size() > 1) {
                                    HashMap<String, Object> needDownHead = getNeedDownHead(parsejson, parsejson.getHead(), arrayList, "id");
                                    z2 = false;
                                    if (needDownHead.get("question") != null) {
                                        ArrayList<Object> valueList = getValueList(new ArrayList<>(), needDownHead.get("question"));
                                        z2 = false;
                                        if (valueList != null) {
                                            z2 = false;
                                            if (valueList.size() > 0) {
                                                int i2 = 0;
                                                while (true) {
                                                    z2 = z;
                                                    if (i2 >= valueList.size()) {
                                                        break;
                                                    }
                                                    HashMap<String, Object> hashMap = JsonParse.geteObjectToMap(valueList.get(i2));
                                                    z = z2;
                                                    if (hashMap.get("id") != null) {
                                                        z = z2;
                                                        if (hashMap.get("id").toString().equals(str8)) {
                                                            z = z2;
                                                            if (hashMap.get("inerror") != null) {
                                                                hashMap.put("inerror", Integer.valueOf(i));
                                                                z = true;
                                                            }
                                                        }
                                                    }
                                                    if (z) {
                                                        Object MaptoJSONObject = JsonCreate.MaptoJSONObject(hashMap);
                                                        z2 = z;
                                                        if (MaptoJSONObject != null) {
                                                            valueList.remove(i2);
                                                            valueList.add(i2, MaptoJSONObject);
                                                            z2 = z;
                                                        }
                                                    } else {
                                                        i2++;
                                                    }
                                                }
                                                changeTreeData(parsejson, needDownHead, JsonCreate.toJSONArrayObject(valueList), "question");
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (z2) {
                            JsonCreate.saveJsonToLocal(JsonCreate.createjson(parsejson), str7);
                        }
                    }
                }
            }
        }
    }

    public void updateFormJson(String str, String str2, int i) {
        HashMap<String, Object> parse = this.common.parse(JsonHelper.getFileString(str2));
        ArrayList<Object> arrayList = new ArrayList<>();
        ArrayList<Object> arrayList2 = arrayList;
        boolean z = false;
        if (parse != null) {
            arrayList2 = arrayList;
            z = false;
            if (parse.get("id") != null) {
                arrayList2 = arrayList;
                z = false;
                if (parse.get("data") != null) {
                    ArrayList<Object> valueList = getValueList(arrayList, parse.get("data"));
                    arrayList2 = valueList;
                    z = false;
                    if (valueList.size() > 0) {
                        int i2 = 0;
                        while (true) {
                            if (i2 >= valueList.size()) {
                                z = false;
                                arrayList2 = valueList;
                                break;
                            }
                            Object obj = valueList.get(i2);
                            HashMap<String, Object> hashMap = JsonParse.geteObjectToMap(obj);
                            if (hashMap == null || hashMap.get("id") == null || !str.equals(hashMap.get("id").toString())) {
                                i2++;
                            } else {
                                if (i == 1) {
                                    valueList.remove(obj);
                                } else if (i == 2 && hashMap.get("status") != null) {
                                    hashMap.put("status", LogHelp.TYPE_MYWORK);
                                    Object MaptoJSONObject = JsonCreate.MaptoJSONObject(hashMap);
                                    valueList.remove(i2);
                                    valueList.add(i2, MaptoJSONObject);
                                }
                                z = true;
                                arrayList2 = valueList;
                            }
                        }
                    }
                }
            }
        }
        if (z) {
            sortInsertObject(arrayList2);
            parse.put("data", JsonCreate.toJSONArrayObject(arrayList2));
            JsonCreate.saveJsonToLocal(JsonCreate.MaptoJSONObject(parse).toString(), str2);
        }
    }

    public void updateGeRenProgressAndSize(Tree<HashMap<String, Object>> tree, String str, HashMap<String, Object> hashMap, String str2, String str3, long j, String str4) {
        updateHMExamProAndSize(false, tree, str, hashMap, str2, str3, j, str4, KeyEnvironment.KEYWEBPATH, "path", "progress", KeyEnvironment.KEYDOWNLOADSIZE, "size");
    }

    public void updateHMProgressAndSize(Tree<HashMap<String, Object>> tree, String str, HashMap<String, Object> hashMap, String str2, String str3, long j, String str4) {
        ArrayList<Object> valueList;
        boolean updateHMExamProAndSize = updateHMExamProAndSize(false, tree, str, hashMap, str2, str3, j, str4, KeyEnvironment.KEYWEBPATH, "path", "progress", KeyEnvironment.KEYDOWNLOADSIZE, "size");
        if (updateHMExamProAndSize || hashMap.get("question") == null || (valueList = getValueList(new ArrayList<>(), hashMap.get("question"))) == null || valueList.size() <= 0) {
            return;
        }
        int i = 0;
        while (i < valueList.size()) {
            HashMap<String, Object> hashMap2 = JsonParse.geteObjectToMap(valueList.get(i));
            boolean z = updateHMExamProAndSize;
            if (hashMap2.get("questionid") != null) {
                z = updateHMExamProAndSize(updateHMExamProAndSize, tree, str, hashMap2, str2, str3, j, "ExamMp", KeyEnvironment.KEYWEBPATH, "path", "progress", KeyEnvironment.KEYDOWNLOADSIZE, "size");
                if (z) {
                    Object MaptoJSONObject = JsonCreate.MaptoJSONObject(hashMap2);
                    valueList.remove(i);
                    valueList.add(i, MaptoJSONObject);
                    hashMap.put("question", JsonCreate.toJSONArrayObject(valueList));
                } else {
                    boolean updateHMExamProAndSize2 = updateHMExamProAndSize(z, tree, str, hashMap2, str2, str3, j, "ExamImage", "qwebpath", "qpath", "qprogress", "qdownloadsize", "qsize");
                    z = updateHMExamProAndSize2;
                    if (updateHMExamProAndSize2) {
                        Object MaptoJSONObject2 = JsonCreate.MaptoJSONObject(hashMap2);
                        valueList.remove(i);
                        valueList.add(i, MaptoJSONObject2);
                        hashMap.put("question", JsonCreate.toJSONArrayObject(valueList));
                        hashMap.put("qprogress", updateQprogress(hashMap, "0", "qprogress", "qdownloadsize", "qsize"));
                        z = updateHMExamProAndSize2;
                    }
                }
            }
            i++;
            updateHMExamProAndSize = z;
        }
    }

    public void updateJsonTree(Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> tree2, String str, String str2, ArrayList<HashMap<String, String>> arrayList) {
        if (tree == null || tree2 == null || tree.getHead() == null || tree2.getHead() == null) {
            return;
        }
        String obj = tree.getHead().get(str).toString();
        String obj2 = tree2.getHead().get(str).toString();
        if (!obj.equals(obj2)) {
            return;
        }
        ArrayList<String> arrayList2 = new ArrayList<>();
        arrayList2.add(obj2);
        compareData(tree, tree2, tree.getHead(), tree2.getHead(), arrayList2, str, str2, arrayList);
    }

    public String updateProgressAndSize(Tree<HashMap<String, Object>> tree, String str, HashMap<String, Object> hashMap, String str2, String str3, long j, String str4, String str5, String str6, String str7, String str8) {
        String str9;
        String sizeKey = getSizeKey(str4);
        if (hashMap.get(str5) != null && hashMap.get(str6) != null && hashMap.get(str8) != null && hashMap.get(str7) != null && hashMap.get(sizeKey) != null) {
            ArrayList<Object> arrayList = new ArrayList<>();
            ArrayList<Object> arrayList2 = new ArrayList<>();
            ArrayList<Object> arrayList3 = new ArrayList<>();
            ArrayList<Object> arrayList4 = new ArrayList<>();
            ArrayList<Object> arrayList5 = new ArrayList<>();
            ArrayList<Object> valueList = getValueList(arrayList, hashMap.get(str5));
            ArrayList<Object> valueList2 = getValueList(arrayList2, hashMap.get(str6));
            ArrayList<Object> valueList3 = getValueList(arrayList3, hashMap.get(str8));
            ArrayList<Object> valueList4 = getValueList(arrayList4, hashMap.get(sizeKey));
            ArrayList<Object> valueList5 = getValueList(arrayList5, hashMap.get(str7));
            if (valueList != null && valueList2 != null && valueList3 != null && valueList5 != null && valueList4 != null && valueList.size() != 0 && valueList.size() == valueList2.size() && valueList2.size() == valueList3.size() && valueList3.size() == valueList5.size() && valueList5.size() == valueList4.size()) {
                boolean updateDownloadsize = updateDownloadsize(tree, false, hashMap, valueList, valueList3, valueList5, valueList4, str2, str3, j, str4, str7, str8);
                String updateTotalProgress = (!updateDownloadsize || (!str4.equals("WrongQuestionSet") && !str4.equals("ZuoYeFuDao"))) ? "-1" : updateTotalProgress("-1", valueList5, valueList4);
                str9 = updateTotalProgress;
                if (!updateDownloadsize) {
                    str9 = updateTotalProgress;
                    if (str4.equals("DaoXueBen")) {
                        str9 = updateTotalProgress;
                        if (hashMap.get("exams") != null) {
                            str9 = updateExamsProgress(tree, updateDownloadsize, updateTotalProgress, hashMap, str2, str3, j);
                        }
                    }
                }
                return str9;
            }
        }
        str9 = "-1";
        return str9;
    }

    public String updateTotalProgress(String str, ArrayList<Object> arrayList, ArrayList<Object> arrayList2) {
        long j = 0;
        long j2 = 0;
        for (int i = 0; i < arrayList2.size(); i++) {
            j += Long.valueOf(arrayList2.get(i).toString()).longValue();
            j2 += Long.valueOf(arrayList.get(i).toString()).longValue();
        }
        return j == 0 ? "0" : j == j2 ? "100" : Integer.toString((int) ((((float) j2) * 100.0f) / ((float) j)));
    }

    public String updateXINHomeworkProgressAndSize(Tree<HashMap<String, Object>> tree, String str, HashMap<String, Object> hashMap, String str2, String str3, long j, String str4, String str5, String str6, String str7, String str8) {
        String str9;
        getSizeKey(str4);
        ArrayList<Object> arrayList = new ArrayList<>();
        ArrayList<Object> arrayList2 = new ArrayList<>();
        ArrayList<Object> arrayList3 = new ArrayList<>();
        ArrayList arrayList4 = new ArrayList();
        ArrayList<Object> arrayList5 = new ArrayList<>();
        ArrayList<Object> arrayList6 = new ArrayList<>();
        ArrayList<Object> arrayList7 = new ArrayList<>();
        ArrayList<Object> arrayList8 = new ArrayList<>();
        ArrayList<Object> arrayList9 = new ArrayList<>();
        ArrayList<Object> arrayList10 = new ArrayList<>();
        ArrayList<Object> arrayList11 = new ArrayList<>();
        ArrayList<Object> valueList = getValueList(arrayList2, hashMap.get(KeyEnvironment.KEYWEBPATH));
        ArrayList<Object> valueList2 = getValueList(arrayList3, hashMap.get(KeyEnvironment.KEYRESWEB));
        ArrayList<Object> valueList3 = getValueList(arrayList5, hashMap.get("path"));
        ArrayList<Object> valueList4 = getValueList(arrayList6, hashMap.get(KeyEnvironment.KEYRESPATH));
        ArrayList<Object> valueList5 = getValueList(arrayList9, hashMap.get("size"));
        ArrayList<Object> valueList6 = getValueList(arrayList10, hashMap.get(KeyEnvironment.KEYRESSIZE));
        arrayList.addAll(valueList);
        arrayList.addAll(valueList2);
        arrayList4.addAll(valueList3);
        arrayList4.addAll(valueList4);
        arrayList8.addAll(valueList5);
        arrayList8.addAll(valueList6);
        ArrayList<Object> valueList7 = getValueList(arrayList7, hashMap.get(str8));
        ArrayList<Object> valueList8 = getValueList(arrayList11, hashMap.get(str7));
        Log.e("Test2:", "1213");
        if (arrayList == null || arrayList4 == null || valueList7 == null || valueList8 == null || arrayList8 == null || arrayList.size() == 0 || arrayList.size() != arrayList4.size() || arrayList4.size() != valueList7.size() || valueList7.size() != valueList8.size() || valueList8.size() != arrayList8.size()) {
            str9 = "-1";
        } else {
            Log.e("Test2:", "1216");
            Log.e("Test2:", String.valueOf(str2) + ">>>" + j);
            Log.e("Test2:", arrayList.toString());
            Log.e("Test2:", arrayList8.toString());
            Log.e("Test2:", valueList8.toString());
            boolean updateDownloadsize = updateDownloadsize(tree, false, hashMap, arrayList, valueList7, valueList8, arrayList8, str2, str3, j, str4, str7, str8);
            String updateTotalProgress = (!updateDownloadsize || (!str4.equals("WrongQuestionSet") && !str4.equals("ZuoYeFuDao"))) ? "-1" : updateTotalProgress("-1", valueList8, arrayList8);
            str9 = updateTotalProgress;
            if (!updateDownloadsize) {
                str9 = updateTotalProgress;
                if (str4.equals("DaoXueBen")) {
                    str9 = updateTotalProgress;
                    if (hashMap.get("exams") != null) {
                        str9 = updateExamsProgress(tree, updateDownloadsize, updateTotalProgress, hashMap, str2, str3, j);
                    }
                }
            }
        }
        return str9;
    }
}
