package com.brandontate.androidwebviewselection;

/* loaded from: classes.dex */
public interface TextSelectionJavascriptInterfaceListener {
    void tsjiEndSelectionMode();

    void tsjiJSError(String str);

    void tsjiSelectionChanged(String str, String str2, String str3, String str4);

    void tsjiSetContentWidth(float f);

    void tsjiStartSelectionMode();
}
