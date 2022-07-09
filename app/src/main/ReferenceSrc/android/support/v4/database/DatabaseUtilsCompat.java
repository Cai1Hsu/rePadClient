package android.support.v4.database;

import android.text.TextUtils;

/* loaded from: classes.jar:android/support/v4/database/DatabaseUtilsCompat.class */
public final class DatabaseUtilsCompat {
    private DatabaseUtilsCompat() {
    }

    public static String[] appendSelectionArgs(String[] strArr, String[] strArr2) {
        String[] strArr3;
        if (strArr == null || strArr.length == 0) {
            strArr3 = strArr2;
        } else {
            String[] strArr4 = new String[strArr.length + strArr2.length];
            System.arraycopy(strArr, 0, strArr4, 0, strArr.length);
            System.arraycopy(strArr2, 0, strArr4, strArr.length, strArr2.length);
            strArr3 = strArr4;
        }
        return strArr3;
    }

    public static String concatenateWhere(String str, String str2) {
        if (!TextUtils.isEmpty(str)) {
            str2 = TextUtils.isEmpty(str2) ? str : "(" + str + ") AND (" + str2 + ")";
        }
        return str2;
    }
}
