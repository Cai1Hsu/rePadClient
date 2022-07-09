package com.edutech.daoxueben.until;

import com.edutech.daoxueben.sysconfig.AppEnvironment;
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
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONStringer;

/* loaded from: classes.jar:com/edutech/daoxueben/until/InitDownLoad.class */
public class InitDownLoad {
    private long downloadsize = 0;
    private long size = 0;
    private int total = 0;
    private int isnewCount = 0;
    private JsonPort jsonPort = new JsonPort();
    private CommonJSONParser common = new CommonJSONParser();

    private ArrayList<HashMap<String, String>> addToneedDownloadList(String str, String str2, HashMap<String, Object> hashMap, ArrayList<HashMap<String, String>> arrayList) {
        if (hashMap != null) {
            try {
                if (hashMap.get("dxid") != null) {
                    String str3 = String.valueOf(str2) + "_" + hashMap.get("dxid").toString();
                    addToDownList(str, str3, hashMap, "size", arrayList);
                    if (hashMap.get("exams") != null) {
                        createExamsJson(1, str, hashMap.get("dxid").toString(), hashMap.get("exams"), AppEnvironment.StudentId);
                        ArrayList<Object> valueList = this.jsonPort.getValueList(new ArrayList<>(), hashMap.get("exams"));
                        if (valueList != null && valueList.size() > 0) {
                            for (int i = 0; i < valueList.size(); i++) {
                                HashMap<String, Object> objectToMap = this.jsonPort.objectToMap(valueList.get(i));
                                if (objectToMap != null) {
                                    addToDownList(str, str3, objectToMap, "sizes", arrayList);
                                }
                            }
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return arrayList;
    }

    private boolean compareTreewebpath(boolean z, ArrayList<String> arrayList, Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> tree2, HashMap<String, Object> hashMap, HashMap<String, Object> hashMap2, String str) {
        boolean z2;
        int i = 1;
        while (true) {
            if (i >= arrayList.size()) {
                break;
            }
            boolean z3 = false;
            for (HashMap<String, Object> hashMap3 : tree.getSuccessors(hashMap)) {
                if (hashMap3 != null && hashMap3.get(str) != null && arrayList.get(i).equals(hashMap3.get(str).toString())) {
                    z3 = true;
                    hashMap = hashMap3;
                    if (i == arrayList.size() - 1) {
                        z3 = true;
                        hashMap = hashMap3;
                        if (hashMap2 != null) {
                            z3 = true;
                            hashMap = hashMap3;
                            if (hashMap2.get(com.edutech.idauthentication.AppEnvironment.ISNEW) != null) {
                                try {
                                    z2 = ((Boolean) hashMap2.get(com.edutech.idauthentication.AppEnvironment.ISNEW)).booleanValue();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                    z2 = false;
                                }
                                z3 = true;
                                hashMap = hashMap3;
                                if (z2) {
                                    z = true;
                                    z3 = true;
                                    hashMap = hashMap3;
                                }
                            }
                        }
                    }
                }
            }
            if (!z3) {
                z = true;
                break;
            }
            i++;
        }
        return z;
    }

    private boolean compareWebpath(boolean z, HashMap<String, Object> hashMap, HashMap<String, Object> hashMap2, String str) {
        if ((hashMap.get(KeyEnvironment.KEYWEBPATH) != null && hashMap2.get(KeyEnvironment.KEYWEBPATH) == null) || (hashMap.get(KeyEnvironment.KEYWEBPATH) == null && hashMap2.get(KeyEnvironment.KEYWEBPATH) != null)) {
            z = true;
        } else if (hashMap.get(KeyEnvironment.KEYWEBPATH) != null && hashMap2.get(KeyEnvironment.KEYWEBPATH) != null) {
            ArrayList<Object> arrayList = new ArrayList<>();
            ArrayList<Object> arrayList2 = new ArrayList<>();
            ArrayList<Object> valueList = this.jsonPort.getValueList(arrayList, hashMap.get(KeyEnvironment.KEYWEBPATH));
            ArrayList<Object> valueList2 = this.jsonPort.getValueList(arrayList2, hashMap2.get(KeyEnvironment.KEYWEBPATH));
            if ((valueList != null && valueList.size() > 0 && valueList2.size() == 0) || (valueList.size() == 0 && valueList2 != null && valueList2.size() > 0)) {
                z = true;
            } else if (valueList != null && valueList2 != null) {
                if (valueList.size() == valueList2.size()) {
                    int i = 0;
                    while (true) {
                        if (i >= valueList.size()) {
                            break;
                        } else if (!valueList.get(i).equals(valueList2.get(i))) {
                            z = true;
                            break;
                        } else {
                            i++;
                        }
                    }
                } else {
                    z = true;
                }
            }
        }
        return z;
    }

    private boolean compareisDown(boolean z, ArrayList<String> arrayList, Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> tree2, HashMap<String, Object> hashMap, HashMap<String, Object> hashMap2, String str) {
        for (HashMap<String, Object> hashMap3 : tree2.getSuccessors(hashMap2)) {
            if (hashMap3 != null && hashMap3.get(str) != null) {
                arrayList.add(hashMap3.get(str).toString());
                z = compareTreewebpath(z, arrayList, tree, tree2, hashMap, hashMap3, str);
                if (z) {
                    break;
                }
                boolean compareisDown = compareisDown(z, arrayList, tree, tree2, hashMap, hashMap3, str);
                z = compareisDown;
                if (arrayList.size() > 0) {
                    arrayList.remove(arrayList.size() - 1);
                    z = compareisDown;
                }
            }
        }
        return z;
    }

    private void getSourceRemovepath(String str, HashMap<String, Object> hashMap, ArrayList<HashMap<String, String>> arrayList) {
        if (hashMap.get(KeyEnvironment.KEYWEBPATH) == null || hashMap.get("path") == null) {
            return;
        }
        ArrayList<Object> arrayList2 = new ArrayList<>();
        ArrayList<Object> arrayList3 = new ArrayList<>();
        ArrayList<Object> valueList = this.jsonPort.getValueList(arrayList2, hashMap.get(KeyEnvironment.KEYWEBPATH));
        ArrayList<Object> valueList2 = this.jsonPort.getValueList(arrayList3, hashMap.get("path"));
        if (valueList == null || valueList2 == null || valueList.size() == 0 || valueList.size() != valueList2.size()) {
            return;
        }
        for (int i = 0; i < valueList.size(); i++) {
            updateSourceNeedRemoveList(str, valueList.get(i).toString(), valueList2.get(i).toString(), arrayList);
        }
    }

    private void getidheadSourceRemoveList(String str, Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, ArrayList<HashMap<String, String>> arrayList) {
        ArrayList<Object> valueList;
        getSourceRemovepath(str, hashMap, arrayList);
        ArrayList<Object> arrayList2 = new ArrayList<>();
        if (hashMap.get("exams") == null || (valueList = this.jsonPort.getValueList(arrayList2, hashMap.get("exams"))) == null || valueList.size() <= 0) {
            return;
        }
        for (int i = 0; i < valueList.size(); i++) {
            HashMap<String, Object> objectToMap = this.jsonPort.objectToMap(valueList.get(i));
            if (objectToMap != null && objectToMap.get("questionid") != null) {
                getSourceRemovepath(str, objectToMap, arrayList);
            }
        }
    }

    private void getisDown(String str, ArrayList<String> arrayList, Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> tree2, HashMap<String, Object> hashMap, HashMap<String, Object> hashMap2, String str2, ArrayList<HashMap<String, String>> arrayList2, ArrayList<HashMap<String, String>> arrayList3) {
        for (HashMap<String, Object> hashMap3 : tree2.getSuccessors(hashMap2)) {
            if (hashMap3 != null && hashMap3.get(str2) != null) {
                arrayList.add(hashMap3.get(str2).toString());
                rePlaceTreewebpath(str, arrayList, tree, tree2, tree.getHead(), hashMap3, str2, arrayList2, arrayList3);
                getisDown(str, arrayList, tree, tree2, tree.getHead(), hashMap3, str2, arrayList2, arrayList3);
                if (arrayList.size() > 0) {
                    arrayList.remove(arrayList.size() - 1);
                }
            }
        }
    }

    private void rePlaceTreewebpath(String str, ArrayList<String> arrayList, Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> tree2, HashMap<String, Object> hashMap, HashMap<String, Object> hashMap2, String str2, ArrayList<HashMap<String, String>> arrayList2, ArrayList<HashMap<String, String>> arrayList3) {
        HashMap<String, Object> hashMap3;
        HashMap<String, Object> hashMap4;
        String str3 = "";
        if (arrayList.size() > 0) {
            str3 = arrayList.get(0);
        }
        int i = 1;
        while (i < arrayList.size()) {
            HashMap<String, Object> hashMap5 = hashMap;
            for (HashMap<String, Object> hashMap6 : tree.getSuccessors(hashMap)) {
                if (hashMap6 != null && hashMap6.get(str2) != null && arrayList.get(i).equals(hashMap6.get(str2).toString())) {
                    hashMap5 = hashMap6;
                    if (i == arrayList.size() - 1) {
                        if (hashMap2.get("isdown") != null) {
                            boolean z = false;
                            try {
                                z = ((Boolean) hashMap2.get("isdown")).booleanValue();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                            if (z) {
                                this.jsonPort.changeTreeData(tree, hashMap6, true, "isdown");
                            }
                        }
                        if (hashMap6.get("dxitems") != null) {
                            ArrayList<Object> valueList = this.jsonPort.getValueList(new ArrayList<>(), hashMap6.get("dxitems"));
                            if (valueList != null && valueList.size() > 0) {
                                for (int i2 = 0; i2 < valueList.size(); i2++) {
                                    Object obj = valueList.get(i2);
                                    if (obj != null && (hashMap3 = JsonParse.geteObjectToMap(obj)) != null && hashMap3.get("dxid") != null) {
                                        String obj2 = hashMap3.get("dxid").toString();
                                        if (hashMap2.get("dxitems") != null) {
                                            ArrayList<Object> valueList2 = this.jsonPort.getValueList(new ArrayList<>(), hashMap2.get("dxitems"));
                                            if (valueList2 != null && valueList2.size() > 0) {
                                                int i3 = 0;
                                                while (true) {
                                                    if (i3 >= valueList2.size()) {
                                                        break;
                                                    }
                                                    Object obj3 = valueList2.get(i3);
                                                    if (obj3 == null || (hashMap4 = JsonParse.geteObjectToMap(obj3)) == null || hashMap4.get("dxid") == null || !obj2.equals(hashMap4.get("dxid").toString()) || hashMap4.get("isdown") == null) {
                                                        i3++;
                                                    } else {
                                                        try {
                                                            ((Boolean) hashMap4.get("isdown")).booleanValue();
                                                        } catch (Exception e2) {
                                                            e2.printStackTrace();
                                                        }
                                                        if (1 != 0) {
                                                            rePlaceWebpath(str3, false, tree, hashMap3, hashMap4, arrayList2);
                                                            if (hashMap4.get("isdown") != null && hashMap4.get(com.edutech.idauthentication.AppEnvironment.ISNEW) != null && hashMap4.get("examsprogress") != null) {
                                                                hashMap3.put("isdown", hashMap4.get("isdown"));
                                                                hashMap3.put(com.edutech.idauthentication.AppEnvironment.ISNEW, false);
                                                                hashMap3.put("examsprogress", hashMap4.get("examsprogress"));
                                                            }
                                                            ArrayList<Object> arrayList4 = new ArrayList<>();
                                                            ArrayList<Object> arrayList5 = new ArrayList<>();
                                                            ArrayList<Object> arrayList6 = arrayList4;
                                                            int i4 = 0;
                                                            if (hashMap3.get("exams") != null) {
                                                                ArrayList<Object> valueList3 = this.jsonPort.getValueList(arrayList4, hashMap3.get("exams"));
                                                                arrayList6 = valueList3;
                                                                i4 = 0;
                                                                if (valueList3 != null) {
                                                                    arrayList6 = valueList3;
                                                                    i4 = 0;
                                                                    if (valueList3.size() > 0) {
                                                                        i4 = valueList3.size();
                                                                        arrayList6 = valueList3;
                                                                    }
                                                                }
                                                            }
                                                            ArrayList<Object> arrayList7 = arrayList5;
                                                            int i5 = 0;
                                                            if (hashMap4.get("exams") != null) {
                                                                ArrayList<Object> valueList4 = this.jsonPort.getValueList(arrayList5, hashMap4.get("exams"));
                                                                arrayList7 = valueList4;
                                                                i5 = 0;
                                                                if (valueList4 != null) {
                                                                    arrayList7 = valueList4;
                                                                    i5 = 0;
                                                                    if (valueList4.size() > 0) {
                                                                        i5 = valueList4.size();
                                                                        arrayList7 = valueList4;
                                                                    }
                                                                }
                                                            }
                                                            if (i4 != 0 && i4 == i5) {
                                                                for (int i6 = 0; i6 < arrayList6.size(); i6++) {
                                                                    HashMap<String, Object> objectToMap = this.jsonPort.objectToMap(arrayList6.get(i6));
                                                                    HashMap<String, Object> objectToMap2 = this.jsonPort.objectToMap(arrayList7.get(i6));
                                                                    if (objectToMap != null && objectToMap2 != null && objectToMap.get("questionid") != null && objectToMap2.get("questionid") != null) {
                                                                        rePlaceWebpath(str3, true, tree, objectToMap, objectToMap2, arrayList2);
                                                                        Object MaptoJSONObject = JsonCreate.MaptoJSONObject(objectToMap);
                                                                        arrayList6.remove(i6);
                                                                        arrayList6.add(i6, MaptoJSONObject);
                                                                    }
                                                                }
                                                                hashMap3.put("exams", JsonCreate.toJSONArrayObject(arrayList6));
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        Object MaptoJSONObject2 = JsonCreate.MaptoJSONObject(hashMap3);
                                        if (MaptoJSONObject2 != null) {
                                            valueList.remove(i2);
                                            valueList.add(i2, MaptoJSONObject2);
                                        }
                                    }
                                }
                                this.jsonPort.changeTreeData(tree, hashMap6, JsonCreate.toJSONArrayObject(valueList), "dxitems");
                            }
                        }
                        hashMap5 = hashMap6;
                        if ("-2".equals(str)) {
                            hashMap5 = hashMap6;
                            if (arrayList.size() > 0) {
                                hashMap5 = hashMap6;
                                if (!"".equals(str3)) {
                                    updateDxiditemsIsDown(tree, hashMap6, str3, this.jsonPort.listToSourceId(arrayList), arrayList3);
                                    hashMap5 = hashMap6;
                                }
                            }
                        }
                    }
                }
            }
            i++;
            hashMap = hashMap5;
        }
        if (0 != 0 || "".equals(str3)) {
            return;
        }
        getidheadSourceRemoveList(str3, tree2, hashMap2, arrayList2);
    }

    private void rePlaceWebpath(String str, boolean z, Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, HashMap<String, Object> hashMap2, ArrayList<HashMap<String, String>> arrayList) {
        boolean z2;
        if (hashMap2.get(KeyEnvironment.KEYWEBPATH) == null || hashMap2.get("progress") == null || hashMap2.get(KeyEnvironment.KEYDOWNLOADSIZE) == null) {
            return;
        }
        ArrayList<Object> arrayList2 = new ArrayList<>();
        ArrayList<Object> arrayList3 = new ArrayList<>();
        ArrayList<Object> arrayList4 = new ArrayList<>();
        ArrayList<Object> arrayList5 = new ArrayList<>();
        ArrayList<Object> valueList = this.jsonPort.getValueList(arrayList2, hashMap2.get(KeyEnvironment.KEYWEBPATH));
        ArrayList<Object> valueList2 = this.jsonPort.getValueList(arrayList3, hashMap2.get("progress"));
        ArrayList<Object> valueList3 = this.jsonPort.getValueList(arrayList4, hashMap2.get(KeyEnvironment.KEYDOWNLOADSIZE));
        ArrayList<Object> valueList4 = this.jsonPort.getValueList(arrayList5, hashMap2.get("path"));
        ArrayList<Object> arrayList6 = new ArrayList<>();
        ArrayList<Object> arrayList7 = new ArrayList<>();
        ArrayList<Object> arrayList8 = new ArrayList<>();
        if (valueList == null || valueList2 == null || valueList3 == null || valueList4 == null || valueList.size() <= 0 || valueList.size() != valueList2.size() || valueList2.size() != valueList3.size() || valueList3.size() != valueList4.size()) {
            return;
        }
        int i = 0;
        ArrayList<Object> arrayList9 = arrayList8;
        ArrayList<Object> arrayList10 = arrayList7;
        ArrayList<Object> arrayList11 = arrayList6;
        if (hashMap.get(KeyEnvironment.KEYWEBPATH) != null) {
            i = 0;
            arrayList9 = arrayList8;
            arrayList10 = arrayList7;
            arrayList11 = arrayList6;
            if (hashMap.get("progress") != null) {
                i = 0;
                arrayList9 = arrayList8;
                arrayList10 = arrayList7;
                arrayList11 = arrayList6;
                if (hashMap.get(KeyEnvironment.KEYDOWNLOADSIZE) != null) {
                    ArrayList<Object> valueList5 = this.jsonPort.getValueList(arrayList6, hashMap.get(KeyEnvironment.KEYWEBPATH));
                    ArrayList<Object> valueList6 = this.jsonPort.getValueList(arrayList7, hashMap.get("progress"));
                    ArrayList<Object> valueList7 = this.jsonPort.getValueList(arrayList8, hashMap.get(KeyEnvironment.KEYDOWNLOADSIZE));
                    i = 0;
                    arrayList9 = valueList7;
                    arrayList10 = valueList6;
                    arrayList11 = valueList5;
                    if (valueList5 != null) {
                        i = 0;
                        arrayList9 = valueList7;
                        arrayList10 = valueList6;
                        arrayList11 = valueList5;
                        if (valueList6 != null) {
                            i = 0;
                            arrayList9 = valueList7;
                            arrayList10 = valueList6;
                            arrayList11 = valueList5;
                            if (valueList7 != null) {
                                i = 0;
                                arrayList9 = valueList7;
                                arrayList10 = valueList6;
                                arrayList11 = valueList5;
                                if (valueList5.size() > 0) {
                                    i = 0;
                                    arrayList9 = valueList7;
                                    arrayList10 = valueList6;
                                    arrayList11 = valueList5;
                                    if (valueList5.size() == valueList6.size()) {
                                        i = 0;
                                        arrayList9 = valueList7;
                                        arrayList10 = valueList6;
                                        arrayList11 = valueList5;
                                        if (valueList6.size() == valueList7.size()) {
                                            i = valueList5.size();
                                            arrayList11 = valueList5;
                                            arrayList10 = valueList6;
                                            arrayList9 = valueList7;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        for (int i2 = 0; i2 < valueList.size(); i2++) {
            String obj = valueList.get(i2).toString();
            String obj2 = valueList4.get(i2).toString();
            int i3 = 0;
            while (true) {
                if (i3 >= i) {
                    z2 = false;
                    break;
                } else if (obj.equals(arrayList11.get(i3).toString())) {
                    arrayList10.remove(i3);
                    arrayList10.add(i3, valueList2.get(i2));
                    arrayList9.remove(i3);
                    arrayList9.add(i3, valueList3.get(i2));
                    z2 = true;
                    break;
                } else {
                    i3++;
                }
            }
            if (!z2) {
                updateSourceNeedRemoveList(str, obj, obj2, arrayList);
            }
        }
        hashMap.put("progress", JsonCreate.toJSONArrayObject(arrayList10));
        hashMap.put(KeyEnvironment.KEYDOWNLOADSIZE, JsonCreate.toJSONArrayObject(arrayList9));
    }

    private void updateBooksJson(Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap) {
        HashMap<String, Object> hashMap2;
        for (HashMap<String, Object> hashMap3 : tree.getSuccessors(hashMap)) {
            if (hashMap3.get("dxitems") != null) {
                ArrayList<Object> valueList = this.jsonPort.getValueList(new ArrayList<>(), hashMap3.get("dxitems"));
                if (valueList != null && valueList.size() > 0) {
                    for (int i = 0; i < valueList.size(); i++) {
                        Object obj = valueList.get(i);
                        if (obj != null && (hashMap2 = JsonParse.geteObjectToMap(obj)) != null && hashMap2.get("dxid") != null) {
                            boolean z = false;
                            if (hashMap2.get("isdown") != null) {
                                try {
                                    z = ((Boolean) hashMap2.get("isdown")).booleanValue();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                    z = false;
                                }
                            }
                            if (hashMap2.get(KeyEnvironment.KEYWEBPATH) != null) {
                                ArrayList<Object> valueList2 = this.jsonPort.getValueList(new ArrayList<>(), hashMap2.get(KeyEnvironment.KEYWEBPATH));
                                this.total += valueList2.size();
                                if (z) {
                                    getSize(hashMap2, "size", valueList2);
                                }
                            }
                            if (hashMap2.get("exams") != null) {
                                ArrayList<Object> valueList3 = this.jsonPort.getValueList(new ArrayList<>(), hashMap2.get("exams"));
                                if (valueList3 != null && valueList3.size() > 0) {
                                    this.total += valueList3.size();
                                    if (z) {
                                        for (int i2 = 0; i2 < valueList3.size(); i2++) {
                                            HashMap<String, Object> objectToMap = this.jsonPort.objectToMap(valueList3.get(i2));
                                            if (objectToMap != null && objectToMap.get(KeyEnvironment.KEYWEBPATH) != null) {
                                                ArrayList<Object> valueList4 = this.jsonPort.getValueList(new ArrayList<>(), objectToMap.get(KeyEnvironment.KEYWEBPATH));
                                                if (valueList4 != null && valueList4.size() > 0 && z) {
                                                    getSize(objectToMap, "sizes", valueList4);
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
            if (hashMap3.get(com.edutech.idauthentication.AppEnvironment.ISNEW) != null) {
                boolean z2 = false;
                try {
                    z2 = ((Boolean) hashMap3.get(com.edutech.idauthentication.AppEnvironment.ISNEW)).booleanValue();
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
                if (z2) {
                    this.isnewCount++;
                }
            }
            updateBooksJson(tree, hashMap3);
        }
    }

    private void updateSourceNeedRemoveList(String str, String str2, String str3, ArrayList<HashMap<String, String>> arrayList) {
        if (!"".equals(str)) {
            HashMap<String, String> hashMap = new HashMap<>();
            hashMap.put("book_id", str);
            hashMap.put("source_webpath", str2);
            hashMap.put("source_path", str3);
            arrayList.add(hashMap);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x00f7, code lost:
        if (r0.get(com.edutech.idauthentication.AppEnvironment.ISNEW) == null) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0184, code lost:
        if (r0.get(com.edutech.json.KeyEnvironment.KEYDOWNLOADSIZE) == null) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x035e, code lost:
        if (r0.get(com.edutech.json.KeyEnvironment.KEYDOWNLOADSIZE) == null) goto L91;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void addNewKeys(String str, Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, String str2) {
        Object MaptoJSONObject;
        boolean z;
        Object MaptoJSONObject2;
        for (HashMap<String, Object> hashMap2 : tree.getSuccessors(hashMap)) {
            if (hashMap2.get(str2) != null) {
                hashMap2.get(str2).toString();
                if (hashMap2.get("isdown") == null || hashMap2.get(com.edutech.idauthentication.AppEnvironment.ISNEW) == null) {
                    this.jsonPort.changeTreeData(tree, hashMap2, false, "isdown");
                    this.jsonPort.changeTreeData(tree, hashMap2, false, com.edutech.idauthentication.AppEnvironment.ISNEW);
                }
                if (hashMap2.get("dxitems") != null) {
                    ArrayList<Object> valueList = this.jsonPort.getValueList(new ArrayList<>(), hashMap2.get("dxitems"));
                    if (valueList != null && valueList.size() > 0) {
                        boolean z2 = false;
                        int i = 0;
                        while (i < valueList.size()) {
                            HashMap<String, Object> objectToMap = this.jsonPort.objectToMap(valueList.get(i));
                            boolean z3 = z2;
                            if (objectToMap != null) {
                                if (objectToMap.get("isdown") != null) {
                                    z = z2;
                                }
                                z = true;
                                objectToMap.put("isdown", false);
                                objectToMap.put(com.edutech.idauthentication.AppEnvironment.ISNEW, false);
                                boolean z4 = z;
                                if (objectToMap.get(KeyEnvironment.KEYWEBPATH) != null) {
                                    z4 = z;
                                    if (objectToMap.get("path") != null) {
                                        z4 = z;
                                        if (objectToMap.get("size") != null) {
                                            ArrayList<Object> valueList2 = this.jsonPort.getValueList(new ArrayList<>(), objectToMap.get(KeyEnvironment.KEYWEBPATH));
                                            z4 = z;
                                            if (valueList2 != null) {
                                                z4 = z;
                                                if (valueList2.size() > 0) {
                                                    if (objectToMap.get("progress") != null) {
                                                        z4 = z;
                                                    }
                                                    ArrayList arrayList = new ArrayList();
                                                    ArrayList arrayList2 = new ArrayList();
                                                    for (int i2 = 0; i2 < valueList2.size(); i2++) {
                                                        arrayList.add("0");
                                                        arrayList2.add(0);
                                                    }
                                                    z4 = true;
                                                    objectToMap.put("progress", JsonCreate.toJSONArrayObject(arrayList));
                                                    objectToMap.put(KeyEnvironment.KEYDOWNLOADSIZE, JsonCreate.toJSONArrayObject(arrayList2));
                                                }
                                            }
                                        }
                                    }
                                }
                                z3 = z4;
                                if (objectToMap.get("exams") != null) {
                                    if (objectToMap.get("dxid") != null) {
                                        createExamsJson(0, str, objectToMap.get("dxid").toString(), objectToMap.get("exams"), AppEnvironment.StudentId);
                                    }
                                    ArrayList<Object> arrayList3 = new ArrayList<>();
                                    if (objectToMap.get("0") == null) {
                                        z4 = true;
                                        objectToMap.put("examsprogress", "100");
                                    }
                                    ArrayList<Object> valueList3 = this.jsonPort.getValueList(arrayList3, objectToMap.get("exams"));
                                    z3 = z4;
                                    if (valueList3 != null) {
                                        z3 = z4;
                                        if (valueList3.size() > 0) {
                                            boolean z5 = false;
                                            int i3 = 0;
                                            while (i3 < valueList3.size()) {
                                                HashMap<String, Object> objectToMap2 = this.jsonPort.objectToMap(valueList3.get(i3));
                                                boolean z6 = z4;
                                                boolean z7 = z5;
                                                if (objectToMap2 != null) {
                                                    z6 = z4;
                                                    z7 = z5;
                                                    if (objectToMap2.get(KeyEnvironment.KEYWEBPATH) != null) {
                                                        z6 = z4;
                                                        z7 = z5;
                                                        if (objectToMap2.get("path") != null) {
                                                            z6 = z4;
                                                            z7 = z5;
                                                            if (objectToMap2.get("sizes") != null) {
                                                                ArrayList<Object> valueList4 = this.jsonPort.getValueList(new ArrayList<>(), objectToMap2.get(KeyEnvironment.KEYWEBPATH));
                                                                boolean z8 = z4;
                                                                if (valueList4 != null) {
                                                                    z8 = z4;
                                                                    if (valueList4.size() > 0) {
                                                                        z8 = true;
                                                                        objectToMap.put("examsprogress", "0");
                                                                    }
                                                                }
                                                                z6 = z8;
                                                                z7 = true;
                                                                if (valueList4 != null) {
                                                                    if (objectToMap2.get("progress") != null) {
                                                                        z6 = z8;
                                                                        z7 = true;
                                                                    }
                                                                    z6 = true;
                                                                    ArrayList arrayList4 = new ArrayList();
                                                                    ArrayList arrayList5 = new ArrayList();
                                                                    for (int i4 = 0; i4 < valueList4.size(); i4++) {
                                                                        arrayList4.add("0");
                                                                        arrayList5.add(0);
                                                                    }
                                                                    objectToMap2.put("progress", JsonCreate.toJSONArrayObject(arrayList4));
                                                                    objectToMap2.put(KeyEnvironment.KEYDOWNLOADSIZE, JsonCreate.toJSONArrayObject(arrayList5));
                                                                    z7 = true;
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                if (z7 && (MaptoJSONObject2 = JsonCreate.MaptoJSONObject(objectToMap2)) != null) {
                                                    valueList3.remove(i3);
                                                    valueList3.add(i3, MaptoJSONObject2);
                                                }
                                                i3++;
                                                z4 = z6;
                                                z5 = z7;
                                            }
                                            objectToMap.put("exams", JsonCreate.toJSONArrayObject(valueList3));
                                            z3 = z4;
                                        }
                                    }
                                }
                            }
                            if (z3 && (MaptoJSONObject = JsonCreate.MaptoJSONObject(objectToMap)) != null) {
                                valueList.remove(i);
                                valueList.add(i, MaptoJSONObject);
                            }
                            i++;
                            z2 = z3;
                        }
                        this.jsonPort.changeTreeData(tree, hashMap2, JsonCreate.toJSONArrayObject(valueList), "dxitems");
                    }
                }
                addNewKeys(str, tree, hashMap2, str2);
            }
        }
    }

    public void addToDownList(String str, String str2, HashMap<String, Object> hashMap, String str3, ArrayList<HashMap<String, String>> arrayList) {
        if (hashMap.get(KeyEnvironment.KEYWEBPATH) == null || hashMap.get("path") == null || hashMap.get("progress") == null || hashMap.get(str3) == null) {
            return;
        }
        ArrayList<Object> arrayList2 = new ArrayList<>();
        ArrayList<Object> arrayList3 = new ArrayList<>();
        ArrayList<Object> arrayList4 = new ArrayList<>();
        ArrayList<Object> arrayList5 = new ArrayList<>();
        ArrayList<Object> valueList = this.jsonPort.getValueList(arrayList2, hashMap.get(KeyEnvironment.KEYWEBPATH));
        ArrayList<Object> valueList2 = this.jsonPort.getValueList(arrayList3, hashMap.get("path"));
        ArrayList<Object> valueList3 = this.jsonPort.getValueList(arrayList4, hashMap.get("progress"));
        ArrayList<Object> valueList4 = this.jsonPort.getValueList(arrayList5, hashMap.get(str3));
        if (valueList == null || valueList2 == null || valueList3 == null || valueList4 == null || valueList.size() == 0 || valueList.size() != valueList2.size() || valueList2.size() != valueList3.size() || valueList3.size() != valueList4.size()) {
            return;
        }
        for (int i = 0; i < valueList.size(); i++) {
            if (!"100".equals(valueList3.get(i).toString())) {
                String obj = valueList.get(i).toString();
                String obj2 = valueList2.get(i).toString();
                String obj3 = valueList3.get(i).toString();
                String obj4 = valueList4.get(i).toString();
                HashMap<String, String> hashMap2 = new HashMap<>();
                hashMap2.put("book_id", str);
                hashMap2.put("source_id", str2);
                hashMap2.put("source_webpath", obj);
                hashMap2.put("source_path", obj2);
                hashMap2.put("source_progress", obj3);
                hashMap2.put("source_size", obj4);
                hashMap2.put(AppEnvironment.SOURCE_ISDOWN, LogHelp.TYPE_GUIDANCE);
                arrayList.add(hashMap2);
            }
        }
    }

    public void changeIsDown(Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> tree2, ArrayList<HashMap<String, String>> arrayList, ArrayList<HashMap<String, String>> arrayList2) {
        boolean z;
        if (tree == null || tree.getHead() == null || tree.getHead().get("id") == null) {
            return;
        }
        String obj = tree.getHead().get("id").toString();
        if (!obj.equals(tree2.getHead().get("id").toString())) {
            return;
        }
        ArrayList<String> arrayList3 = new ArrayList<>();
        arrayList3.add(obj);
        String str = getidList(tree2, tree2.getHead(), arrayList3, "id", "");
        String listToSourceId = this.jsonPort.listToSourceId(arrayList3);
        HashMap<String, Object> head = tree.getHead();
        if (arrayList3.size() > 1) {
            head = getNeedDownHead(tree, tree.getHead(), arrayList3, "id");
        }
        if (!str.equals("")) {
            updateDxiditemsIsDown(true, tree, head, str, obj, listToSourceId, arrayList, arrayList2);
            return;
        }
        tree.getSuccessors(head);
        if (head.get("isdown") != null) {
            try {
                z = ((Boolean) head.get("isdown")).booleanValue();
            } catch (Exception e) {
                e.printStackTrace();
                z = true;
            }
            if (!z) {
                this.jsonPort.changeTreeData(tree, head, true, "isdown");
            }
        }
        updateDxiditemsIsDown(false, tree, head, str, obj, listToSourceId, arrayList, arrayList2);
        getNeedDownLoadList(obj, listToSourceId, tree, head, arrayList, "id", arrayList, arrayList2);
    }

    public void createExamsJson(int i, String str, String str2, Object obj, String str3) {
        if (obj == null || "".equals(str) || "".equals(str2)) {
            return;
        }
        JSONStringer jSONStringer = new JSONStringer();
        try {
            jSONStringer.object();
            jSONStringer.key("studentid").value(str3);
            jSONStringer.key("exams").value(obj);
            jSONStringer.endObject();
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        String jSONStringer2 = jSONStringer.toString();
        String str4 = String.valueOf(AppEnvironment.OFFLINE_DOWNLOAD) + str + "/" + str2 + "/" + str3 + "/";
        String str5 = String.valueOf(AppEnvironment.OFFLINE_DOWNLOAD) + str + "/" + str2 + "/" + str3 + "/" + str2 + ".json";
        File file = new File(str5);
        if (i == 0) {
            if (FileInOutHelper.fileIsExists(str4)) {
                return;
            }
            FileInOutHelper.createNewFile(file);
            com.edutech.idauthentication.JsonHelper.CreateFile(jSONStringer2, str5);
        } else if (i != 1) {
        } else {
            if (file.exists()) {
                file.delete();
            }
            FileInOutHelper.createNewFile(file);
            com.edutech.idauthentication.JsonHelper.CreateFile(jSONStringer2, str5);
        }
    }

    public Books getBooks(Tree<HashMap<String, Object>> tree, Books books) {
        if (tree != null && tree.getHead() != null && tree.getHead().get("id") != null) {
            String obj = tree.getHead().get("id").toString();
            String obj2 = tree.getHead().get("name").toString();
            String obj3 = tree.getHead().get("updatetime").toString();
            if (obj != null) {
                books.setbook_id(obj);
                books.setbook_path("../offlinedownload/" + obj + "/");
            }
            if (obj2 != null) {
                books.setbook_name(obj2);
            }
            if (obj3 != null) {
                books.setBook_updatetime(obj3);
            }
            this.downloadsize = 0L;
            this.size = 0L;
            this.total = 0;
            this.isnewCount = 0;
            updateBooksJson(tree, tree.getHead());
            books.setBook_total(this.total);
            books.setBookdownloadsize(this.downloadsize);
            books.setBooksize(this.size);
            if (this.size == 0) {
                books.setProgress("100");
            } else {
                String l = Long.toString((((float) this.downloadsize) * 100.0f) / ((float) this.size));
                if (this.downloadsize == this.size) {
                    books.setProgress("100");
                } else if (this.downloadsize <= 0 || !"0".equals(l)) {
                    books.setProgress(l);
                } else {
                    books.setProgress(LogHelp.TYPE_GUIDANCE);
                }
            }
            if (this.isnewCount == 0) {
                books.setBook_isnew(0);
            } else {
                books.setBook_isnew(1);
            }
        }
        this.downloadsize = 0L;
        this.size = 0L;
        this.total = 0;
        this.isnewCount = 0;
        return books;
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

    public void getNeedDownLoadList(String str, String str2, Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, ArrayList<HashMap<String, String>> arrayList, String str3, ArrayList<HashMap<String, String>> arrayList2, ArrayList<HashMap<String, String>> arrayList3) {
        for (HashMap<String, Object> hashMap2 : tree.getSuccessors(hashMap)) {
            if (hashMap2 != null && hashMap2.get(str3) != null) {
                String obj = "".equals(str2) ? hashMap2.get(str3).toString() : String.valueOf(str2) + "_" + hashMap2.get(str3).toString();
                if (hashMap2.get("isdown") != null) {
                    boolean z = true;
                    try {
                        z = ((Boolean) hashMap2.get("isdown")).booleanValue();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    if (!z) {
                        this.jsonPort.changeTreeData(tree, hashMap2, true, "isdown");
                    }
                }
                updateDxiditemsIsDown(false, tree, hashMap2, "", str, obj, arrayList2, arrayList3);
                getNeedDownLoadList(str, obj, tree, hashMap2, arrayList, str3, arrayList2, arrayList3);
                str2 = this.jsonPort.removeSourceId(obj);
            }
        }
    }

    public void getSize(HashMap<String, Object> hashMap, String str, ArrayList<Object> arrayList) {
        if (hashMap.get(KeyEnvironment.KEYDOWNLOADSIZE) == null || hashMap.get(str) == null) {
            return;
        }
        ArrayList<Object> arrayList2 = new ArrayList<>();
        ArrayList<Object> arrayList3 = new ArrayList<>();
        ArrayList<Object> valueList = this.jsonPort.getValueList(arrayList2, hashMap.get(KeyEnvironment.KEYDOWNLOADSIZE));
        ArrayList<Object> valueList2 = this.jsonPort.getValueList(arrayList3, hashMap.get(str));
        if (arrayList == null || valueList == null || valueList2 == null || arrayList.size() == 0 || arrayList.size() != valueList.size() || valueList.size() != valueList2.size()) {
            return;
        }
        for (int i = 0; i < arrayList.size(); i++) {
            this.downloadsize += Long.valueOf(valueList.get(i).toString()).longValue();
            this.size += Long.valueOf(valueList2.get(i).toString()).longValue();
        }
    }

    public String getidList(Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, ArrayList<String> arrayList, String str, String str2) {
        for (HashMap<String, Object> hashMap2 : tree.getSuccessors(hashMap)) {
            if (hashMap2 != null && hashMap2.get(str) != null) {
                arrayList.add(hashMap2.get(str).toString());
                if (hashMap2.get("dxid") != null) {
                    str2 = hashMap2.get("dxid").toString();
                }
                str2 = getidList(tree, hashMap2, arrayList, str, str2);
            }
        }
        return str2;
    }

    public boolean treeIschange(boolean z, Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> tree2) {
        boolean z2 = z;
        if (tree != null) {
            z2 = z;
            if (tree2 != null) {
                z2 = z;
                if (tree.getHead() != null) {
                    z2 = z;
                    if (tree2.getHead() != null) {
                        z2 = z;
                        if (tree.getHead().get("id") != null) {
                            z2 = z;
                            if (tree2.getHead().get("id") != null) {
                                String obj = tree.getHead().get("id").toString();
                                z2 = z;
                                if (obj.equals(tree2.getHead().get("id").toString())) {
                                    ArrayList<String> arrayList = new ArrayList<>();
                                    arrayList.add(obj);
                                    z2 = compareisDown(z, arrayList, tree, tree2, tree.getHead(), tree2.getHead(), "id");
                                }
                            }
                        }
                    }
                }
            }
        }
        return z2;
    }

    public void treeReplace(String str, Tree<HashMap<String, Object>> tree, Tree<HashMap<String, Object>> tree2, ArrayList<HashMap<String, String>> arrayList, ArrayList<HashMap<String, String>> arrayList2) {
        if (tree == null || tree2 == null || tree.getHead() == null || tree2.getHead() == null || tree.getHead().get("id") == null || tree2.getHead().get("id") == null) {
            return;
        }
        String obj = tree.getHead().get("id").toString();
        if (!obj.equals(tree2.getHead().get("id").toString())) {
            return;
        }
        ArrayList<String> arrayList3 = new ArrayList<>();
        arrayList3.add(obj);
        getisDown(str, arrayList3, tree, tree2, tree.getHead(), tree2.getHead(), "id", arrayList2, arrayList);
    }

    public void updateBooksJson(Tree<HashMap<String, Object>> tree) {
        this.jsonPort.updateBooksJson(getBooks(tree, new Books()), AppEnvironment.JSON_BOOKS_File);
    }

    public void updateDxiditemsIsDown(Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, String str, String str2, ArrayList<HashMap<String, String>> arrayList) {
        boolean z;
        if (hashMap.get("dxitems") != null) {
            ArrayList<Object> valueList = this.jsonPort.getValueList(new ArrayList<>(), hashMap.get("dxitems"));
            if (valueList == null || valueList.size() <= 0) {
                return;
            }
            for (int i = 0; i < valueList.size(); i++) {
                HashMap<String, Object> objectToMap = this.jsonPort.objectToMap(valueList.get(i));
                if (objectToMap != null && objectToMap.get("dxid") != null) {
                    try {
                        z = ((Boolean) objectToMap.get("isdown")).booleanValue();
                    } catch (Exception e) {
                        e.printStackTrace();
                        z = true;
                    }
                    if (z) {
                        addToneedDownloadList(str, str2, objectToMap, arrayList);
                    }
                }
            }
        }
    }

    public void updateDxiditemsIsDown(boolean z, Tree<HashMap<String, Object>> tree, HashMap<String, Object> hashMap, String str, String str2, String str3, ArrayList<HashMap<String, String>> arrayList, ArrayList<HashMap<String, String>> arrayList2) {
        if (hashMap.get("dxitems") != null) {
            ArrayList<Object> valueList = this.jsonPort.getValueList(new ArrayList<>(), hashMap.get("dxitems"));
            if (valueList == null || valueList.size() <= 0) {
                return;
            }
            boolean z2 = false;
            int i = 0;
            while (i < valueList.size()) {
                HashMap<String, Object> objectToMap = this.jsonPort.objectToMap(valueList.get(i));
                boolean z3 = z2;
                if (objectToMap != null) {
                    z3 = z2;
                    if (objectToMap.get("dxid") != null) {
                        if (!z) {
                            z2 = true;
                            boolean z4 = true;
                            try {
                                z4 = ((Boolean) objectToMap.get("isdown")).booleanValue();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                            if (!z4) {
                                objectToMap.put("isdown", true);
                                addToneedDownloadList(str2, str3, objectToMap, arrayList);
                            } else {
                                addToneedDownloadList(str2, str3, objectToMap, arrayList2);
                            }
                        } else if (str.equals(objectToMap.get("dxid").toString())) {
                            z2 = true;
                            boolean z5 = true;
                            try {
                                z5 = ((Boolean) objectToMap.get("isdown")).booleanValue();
                            } catch (Exception e2) {
                                e2.printStackTrace();
                            }
                            if (!z5) {
                                objectToMap.put("isdown", true);
                                addToneedDownloadList(str2, str3, objectToMap, arrayList);
                            } else {
                                addToneedDownloadList(str2, str3, objectToMap, arrayList2);
                            }
                        }
                        z3 = z2;
                        if (z2) {
                            Object MaptoJSONObject = JsonCreate.MaptoJSONObject(objectToMap);
                            z3 = z2;
                            if (MaptoJSONObject != null) {
                                valueList.remove(i);
                                valueList.add(i, MaptoJSONObject);
                                z3 = z2;
                            }
                        }
                    }
                }
                i++;
                z2 = z3;
            }
            this.jsonPort.changeTreeData(tree, hashMap, JsonCreate.toJSONArrayObject(valueList), "dxitems");
        }
    }

    public void updateKeys(Tree<HashMap<String, Object>> tree) {
        if (tree == null || tree.getHead() == null || tree.getHead().get("id") == null) {
            return;
        }
        addNewKeys(tree.getHead().get("id").toString(), tree, tree.getHead(), "id");
    }
}
