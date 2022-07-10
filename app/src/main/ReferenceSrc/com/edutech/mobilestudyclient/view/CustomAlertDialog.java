package com.edutech.mobilestudyclient.view;

import android.app.AlertDialog;
import android.content.Context;
import android.support.v4.media.TransportMediator;
import android.support.v4.view.ViewCompat;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.edutech.mobilestudyclient.activity.CloudClientActivity;
import com.launcher.activity.R;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class CustomAlertDialog {
    AlertDialog ad;
    LinearLayout buttonLayout;
    Context context;
    TextView messageView;
    TextView titleView;

    public CustomAlertDialog(Context context) {
        this.context = context;
        this.ad = new AlertDialog.Builder(context).create();
        this.ad.show();
        Window window = this.ad.getWindow();
        window.setContentView(R.layout.layout_alertdialog);
        this.titleView = (TextView) window.findViewById(R.id.title);
        this.messageView = (TextView) window.findViewById(R.id.message);
        this.buttonLayout = (LinearLayout) window.findViewById(R.id.buttonLayout);
    }

    public void setTitle(int resId) {
        this.titleView.setText(resId);
    }

    public void setTitle(String title) {
        this.titleView.setText(title);
    }

    public void setMessage(int resId) {
        this.messageView.setText(resId);
    }

    public void setMessage(String message) {
        this.messageView.setText(message);
    }

    public void setPositiveButton(String text, View.OnClickListener listener) {
        LinearLayout.LayoutParams params;
        Button button = new Button(this.context);
        if (CloudClientActivity.mWidth == 1280) {
            params = new LinearLayout.LayoutParams((int) TransportMediator.KEYCODE_MEDIA_RECORD, 50);
        } else {
            params = new LinearLayout.LayoutParams(100, 40);
        }
        button.setLayoutParams(params);
        button.setBackgroundResource(R.drawable.button_positive);
        button.setText(text);
        button.setTextColor(-1);
        button.setTextSize(20.0f);
        button.setOnClickListener(listener);
        if (this.buttonLayout.getChildCount() > 0) {
            params.setMargins(20, 0, 0, 0);
            button.setLayoutParams(params);
            this.buttonLayout.addView(button, 1);
            return;
        }
        button.setLayoutParams(params);
        this.buttonLayout.addView(button);
    }

    public void setNegativeButton(String text, View.OnClickListener listener) {
        LinearLayout.LayoutParams params;
        Button button = new Button(this.context);
        if (CloudClientActivity.mWidth == 1280) {
            params = new LinearLayout.LayoutParams((int) TransportMediator.KEYCODE_MEDIA_RECORD, 50);
        } else {
            params = new LinearLayout.LayoutParams(100, 40);
        }
        button.setLayoutParams(params);
        button.setBackgroundResource(R.drawable.button_negative);
        button.setText(text);
        button.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        button.setTextSize(20.0f);
        button.setOnClickListener(listener);
        this.buttonLayout.addView(button);
    }

    public void dismiss() {
        this.ad.dismiss();
    }
}
