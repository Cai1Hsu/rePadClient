package com.brandontate.androidwebviewselection;

import android.content.Context;

/* loaded from: classes.jar:com/brandontate/androidwebviewselection/TextSelectionJavascriptInterface.class */
public class TextSelectionJavascriptInterface {
    private static final String TAG = "TextSelectionJavascriptInterface";
    private final String interfaceName = "TextSelection";
    private TextSelectionJavascriptInterfaceListener listener;
    Context mContext;

    public TextSelectionJavascriptInterface(Context context) {
        this.mContext = context;
    }

    public TextSelectionJavascriptInterface(Context context, TextSelectionJavascriptInterfaceListener textSelectionJavascriptInterfaceListener) {
        this.mContext = context;
        this.listener = textSelectionJavascriptInterfaceListener;
    }

    public void endSelectionMode() {
        if (this.listener != null) {
            this.listener.tsjiEndSelectionMode();
        }
    }

    public String getInterfaceName() {
        return "TextSelection";
    }

    public void jsError(String str) {
        if (this.listener != null) {
            this.listener.tsjiJSError(str);
        }
    }

    public void selectionChanged(String str, String str2, String str3, String str4) {
        if (this.listener != null) {
            this.listener.tsjiSelectionChanged(str, str2, str3, str4);
        }
    }

    public void setContentWidth(float f) {
        if (this.listener != null) {
            this.listener.tsjiSetContentWidth(f);
        }
    }

    public void startSelectionMode() {
        if (this.listener != null) {
            this.listener.tsjiStartSelectionMode();
        }
    }
}
