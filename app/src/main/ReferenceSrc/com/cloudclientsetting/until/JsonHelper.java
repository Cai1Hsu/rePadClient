package com.cloudclientsetting.until;

import android.util.Log;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* loaded from: classes.jar:com/cloudclientsetting/until/JsonHelper.class */
public class JsonHelper {
    public static String Reset_Pwd_HTTPPOST_URL(String str) {
        return "http://" + str + "/user/index/set-answer/";
    }

    public static String Update_Pwd_HTTPPOST_URL(String str) {
        return "http://" + str + "/api/user/type/modpwd/";
    }

    public static boolean getBooleanPropertyName(JSONObject jSONObject, String str) {
        boolean z;
        if (!jSONObject.isNull(str)) {
            try {
                z = jSONObject.getBoolean(str);
            } catch (JSONException e) {
                e.printStackTrace();
                z = false;
            }
        } else {
            z = false;
        }
        return z;
    }

    public static int getIntPropertyName(JSONObject jSONObject, String str) {
        int i;
        if (!jSONObject.isNull(str)) {
            try {
                i = jSONObject.getInt(str);
            } catch (JSONException e) {
                e.printStackTrace();
                i = 0;
            }
        } else {
            i = 0;
        }
        return i;
    }

    public static String getPropertyName(JSONObject jSONObject, String str) {
        String str2;
        if (!jSONObject.isNull(str)) {
            try {
                str2 = jSONObject.getString(str);
            } catch (JSONException e) {
                e.printStackTrace();
                str2 = "";
            }
        } else {
            str2 = "";
        }
        return str2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x005d, code lost:
        if ("".equals(r0) == false) goto L12;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int parseHttpPostReturnJson(String str) {
        int i = 0;
        Log.i("strResult", "parseHttpPostReturnJson:" + str);
        if (!"".equals(str)) {
            try {
                JSONObject jSONObject = (JSONObject) new JSONTokener(str).nextValue();
                boolean booleanPropertyName = getBooleanPropertyName(jSONObject, "status");
                int intPropertyName = getIntPropertyName(jSONObject, "errorNum");
                String propertyName = getPropertyName(jSONObject, "errorInfo");
                if (booleanPropertyName && intPropertyName == 0) {
                }
                i = (booleanPropertyName || intPropertyName != 1) ? (booleanPropertyName || intPropertyName != 2) ? (booleanPropertyName || intPropertyName != 3) ? (booleanPropertyName || intPropertyName != 4) ? -1 : 4 : 3 : 2 : 1;
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        return i;
    }
}
