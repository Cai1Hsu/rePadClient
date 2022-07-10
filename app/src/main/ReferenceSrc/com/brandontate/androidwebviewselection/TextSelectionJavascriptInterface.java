package com.brandontate.androidwebviewselection;

import android.content.Context;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class TextSelectionJavascriptInterface {
    private static final String TAG = "TextSelectionJavascriptInterface";
    private final String interfaceName = "TextSelection";
    private TextSelectionJavascriptInterfaceListener listener;
    Context mContext;

    public TextSelectionJavascriptInterface(Context c) {
        this.mContext = c;
    }

    public TextSelectionJavascriptInterface(Context c, TextSelectionJavascriptInterfaceListener listener) {
        this.mContext = c;
        this.listener = listener;
    }

    public void jsError(String error) {
        if (this.listener != null) {
            this.listener.tsjiJSError(error);
        }
    }

    public String getInterfaceName() {
        return "TextSelection";
    }

    public void startSelectionMode() {
        if (this.listener != null) {
            this.listener.tsjiStartSelectionMode();
        }
    }

    public void endSelectionMode() {
        if (this.listener != null) {
            this.listener.tsjiEndSelectionMode();
        }
    }

    public void selectionChanged(String range, String text, String handleBounds, String menuBounds) {
        if (this.listener != null) {
            this.listener.tsjiSelectionChanged(range, text, handleBounds, menuBounds);
        }
    }

    public void setContentWidth(float contentWidth) {
        if (this.listener != null) {
            this.listener.tsjiSetContentWidth(contentWidth);
        }
    }
}
