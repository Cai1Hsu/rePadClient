package com.edutech.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* loaded from: classes.jar:com/edutech/json/CommonJSONParser.class */
public class CommonJSONParser {
    public boolean isJsonArray(Object obj) {
        boolean z = false;
        if (obj != null) {
            try {
                if (obj instanceof JSONArray) {
                    z = true;
                } else {
                    z = false;
                    if (!(obj instanceof JSONObject)) {
                        z = false;
                        if (!(obj instanceof String)) {
                            z = false;
                            if (!(obj instanceof Boolean)) {
                                z = false;
                                if (obj instanceof Integer) {
                                    z = false;
                                }
                            }
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                z = false;
            }
        }
        return z;
    }

    public HashMap<String, Object> parse(String str) {
        HashMap<String, Object> hashMap = null;
        if (str != null) {
            try {
                hashMap = parseJSONObject((JSONObject) new JSONTokener(str).nextValue());
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

    public ArrayList<Object> parseJSONArray(JSONArray jSONArray) throws JSONException {
        ArrayList<Object> arrayList = null;
        if (jSONArray != null) {
            arrayList = new ArrayList<>();
            for (int i = 0; i < jSONArray.length(); i++) {
                Object obj = jSONArray.get(i);
                if (obj != null) {
                    arrayList.add(obj);
                }
            }
        }
        return arrayList;
    }

    public HashMap<String, Object> parseJSONObject(JSONObject jSONObject) throws JSONException {
        HashMap<String, Object> hashMap = null;
        if (jSONObject != null) {
            hashMap = new HashMap<>();
            Iterator<String> keys = jSONObject.keys();
            while (keys.hasNext()) {
                String next = keys.next();
                Object opt = jSONObject.opt(next);
                if (opt != null) {
                    hashMap.put(next, opt);
                }
            }
        }
        return hashMap;
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x0045, code lost:
        if ((r4 instanceof java.lang.Integer) != false) goto L19;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object parseValue(Object obj) throws JSONException {
        ArrayList<Object> arrayList = null;
        if (obj != null) {
            try {
                if (obj instanceof JSONArray) {
                    arrayList = parseJSONArray((JSONArray) obj);
                } else if (obj instanceof JSONObject) {
                    arrayList = parseJSONObject((JSONObject) obj);
                } else {
                    if (!(obj instanceof String) && !(obj instanceof Boolean)) {
                        arrayList = null;
                    }
                    arrayList = obj;
                }
            } catch (Exception e) {
                e.printStackTrace();
                arrayList = null;
            }
        }
        return arrayList;
    }
}
