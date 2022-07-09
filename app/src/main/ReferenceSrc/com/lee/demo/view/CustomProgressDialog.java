package com.lee.demo.view;

import android.app.Dialog;
import android.content.Context;
import android.graphics.drawable.AnimationDrawable;
import android.widget.ImageView;
import android.widget.TextView;
import com.launcher.activity.R;

/* loaded from: classes.dex */
public class CustomProgressDialog extends Dialog {
    private static CustomProgressDialog customProgressDialog = null;

    public CustomProgressDialog(Context context, int theme) {
        super(context, theme);
    }

    public static CustomProgressDialog createDialog(Context context) {
        customProgressDialog = new CustomProgressDialog(context, R.style.CustomProgressDialog);
        customProgressDialog.setContentView(R.layout.customprogressdialog);
        customProgressDialog.getWindow().getAttributes().gravity = 17;
        customProgressDialog.setCanceledOnTouchOutside(false);
        return customProgressDialog;
    }

    @Override // android.app.Dialog, android.view.Window.Callback
    public void onWindowFocusChanged(boolean hasFocus) {
        if (customProgressDialog != null) {
            ImageView imageView = (ImageView) customProgressDialog.findViewById(R.id.loadingImageView);
            AnimationDrawable animationDrawable = (AnimationDrawable) imageView.getBackground();
            animationDrawable.start();
        }
    }

    public CustomProgressDialog setTitile(String strTitle) {
        return customProgressDialog;
    }

    public CustomProgressDialog setMessage(String strMessage) {
        TextView tvMsg = (TextView) customProgressDialog.findViewById(R.id.id_tv_loadingmsg);
        if (tvMsg != null) {
            tvMsg.setText(strMessage);
        }
        return customProgressDialog;
    }
}
