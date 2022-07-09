package com.edutech.idauthentication;

/* loaded from: classes.jar:com/edutech/idauthentication/OnConsoleHelper.class */
public class OnConsoleHelper {
    public static boolean goBackError(String str, String str2) {
        return (str == null || str.indexOf("Uncaught ReferenceError") == -1 || str.indexOf("is not defined") == -1 || str.indexOf(str2) == -1) ? false : true;
    }
}
