package com.cloudclientsetting.until;

import android.util.Log;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class JsonHelper {
    public static String Update_Pwd_HTTPPOST_URL(String ip) {
        return "http://" + ip + "/api/user/type/modpwd/";
    }

    public static String Reset_Pwd_HTTPPOST_URL(String ip) {
        return "http://" + ip + "/user/index/set-answer/";
    }

    public static int parseHttpPostReturnJson(String json) {
        Log.i("strResult", "parseHttpPostReturnJson:" + json);
        if ("".equals(json)) {
            return 0;
        }
        try {
            JSONTokener jsonTokener = new JSONTokener(json);
            JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
            boolean status = getBooleanPropertyName(jsonObject, "status");
            int errorNum = getIntPropertyName(jsonObject, "errorNum");
            String errorInfo = getPropertyName(jsonObject, "errorInfo");
            if (status && errorNum == 0) {
                if ("".equals(errorInfo)) {
                    return 0;
                }
            }
            if (!status && errorNum == 1) {
                return 1;
            }
            if (!status && errorNum == 2) {
                return 2;
            }
            if (!status && errorNum == 3) {
                return 3;
            }
            return (status || errorNum != 4) ? -1 : 4;
        } catch (JSONException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static String getPropertyName(JSONObject jsonObject, String propertyName) {
        if (!jsonObject.isNull(propertyName)) {
            try {
                String Name = jsonObject.getString(propertyName);
                return Name;
            } catch (JSONException e) {
                e.printStackTrace();
                return "";
            }
        }
        return "";
    }

    public static boolean getBooleanPropertyName(JSONObject jsonObject, String propertyName) {
        if (!jsonObject.isNull(propertyName)) {
            try {
                boolean Name = jsonObject.getBoolean(propertyName);
                return Name;
            } catch (JSONException e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    public static int getIntPropertyName(JSONObject jsonObject, String propertyName) {
        if (!jsonObject.isNull(propertyName)) {
            try {
                int Name = jsonObject.getInt(propertyName);
                return Name;
            } catch (JSONException e) {
                e.printStackTrace();
                return 0;
            }
        }
        return 0;
    }
}
