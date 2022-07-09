package com.edutech.utils;

/* loaded from: classes.dex */
public class OnConsoleHelper {
    public static boolean goBackError(String errorMessage, String jsName) {
        return (errorMessage == null || errorMessage.indexOf("Uncaught ReferenceError") == -1 || errorMessage.indexOf("is not defined") == -1 || errorMessage.indexOf(jsName) == -1) ? false : true;
    }
}
