package com.lee.demo.view;

import android.app.Dialog;
import android.content.Context;
import android.graphics.drawable.AnimationDrawable;
import android.widget.ImageView;
import android.widget.TextView;
import com.launcher.activity.R;

/* loaded from: classes.jar:com/lee/demo/view/CustomProgressDialog.class */
public class CustomProgressDialog extends Dialog {
    private static CustomProgressDialog customProgressDialog = null;

    public CustomProgressDialog(Context context, int i) {
        super(context, i);
    }

    public static CustomProgressDialog createDialog(Context context) {
        customProgressDialog = new CustomProgressDialog(context, R.style.CustomProgressDialog);
        customProgressDialog.setContentView(R.layout.customprogressdialog);
        customProgressDialog.getWindow().getAttributes().gravity = 17;
        customProgressDialog.setCanceledOnTouchOutside(false);
        return customProgressDialog;
    }

    @Override // android.app.Dialog, android.view.Window.Callback
    public void onWindowFocusChanged(boolean z) {
        if (customProgressDialog == null) {
            return;
        }
        ((AnimationDrawable) ((ImageView) customProgressDialog.findViewById(R.id.loadingImageView)).getBackground()).start();
    }

    public CustomProgressDialog setMessage(String str) {
        TextView textView = (TextView) customProgressDialog.findViewById(R.id.id_tv_loadingmsg);
        if (textView != null) {
            textView.setText(str);
        }
        return customProgressDialog;
    }

    public CustomProgressDialog setTitile(String str) {
        return customProgressDialog;
    }
}
