package com.edutech.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class CommonJSONParser {
    public HashMap<String, Object> parse(String jsonStr) {
        if (jsonStr == null) {
            return null;
        }
        try {
            JSONTokener jsonTokener = new JSONTokener(jsonStr);
            JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
            HashMap<String, Object> result = parseJSONObject(jsonObject);
            return result;
        } catch (JSONException e) {
            e.printStackTrace();
            return null;
        } catch (Exception e2) {
            e2.printStackTrace();
            return null;
        }
    }

    public Object parseValue(Object inputObject) throws JSONException {
        Object outputObject = null;
        if (inputObject != null) {
            try {
                if (inputObject instanceof JSONArray) {
                    outputObject = parseJSONArray((JSONArray) inputObject);
                } else if (inputObject instanceof JSONObject) {
                    outputObject = parseJSONObject((JSONObject) inputObject);
                } else if ((inputObject instanceof String) || (inputObject instanceof Boolean) || (inputObject instanceof Integer)) {
                    outputObject = inputObject;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return outputObject;
    }

    public boolean isJsonArray(Object inputObject) {
        if (inputObject != null) {
            try {
                if (inputObject instanceof JSONArray) {
                    return true;
                }
                if ((inputObject instanceof JSONObject) || (inputObject instanceof String) || (inputObject instanceof Boolean)) {
                    return false;
                }
                if (inputObject instanceof Integer) {
                }
                return false;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    public ArrayList<Object> parseJSONArray(JSONArray jsonArray) throws JSONException {
        ArrayList<Object> valueList = null;
        if (jsonArray != null) {
            valueList = new ArrayList<>();
            for (int i = 0; i < jsonArray.length(); i++) {
                Object itemObject = jsonArray.get(i);
                if (itemObject != null) {
                    valueList.add(itemObject);
                }
            }
        }
        return valueList;
    }

    public HashMap<String, Object> parseJSONObject(JSONObject jsonObject) throws JSONException {
        HashMap<String, Object> valueObject = null;
        if (jsonObject != null) {
            valueObject = new HashMap<>();
            Iterator<String> keyIter = jsonObject.keys();
            while (keyIter.hasNext()) {
                String keyStr = keyIter.next();
                Object itemObject = jsonObject.opt(keyStr);
                if (itemObject != null) {
                    valueObject.put(keyStr, itemObject);
                }
            }
        }
        return valueObject;
    }
}
