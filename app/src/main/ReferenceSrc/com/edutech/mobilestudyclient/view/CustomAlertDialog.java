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

/* loaded from: classes.jar:com/edutech/mobilestudyclient/view/CustomAlertDialog.class */
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

    public void dismiss() {
        this.ad.dismiss();
    }

    public void setMessage(int i) {
        this.messageView.setText(i);
    }

    public void setMessage(String str) {
        this.messageView.setText(str);
    }

    public void setNegativeButton(String str, View.OnClickListener onClickListener) {
        Button button = new Button(this.context);
        button.setLayoutParams(CloudClientActivity.mWidth == 1280 ? new LinearLayout.LayoutParams((int) TransportMediator.KEYCODE_MEDIA_RECORD, 50) : new LinearLayout.LayoutParams(100, 40));
        button.setBackgroundResource(R.drawable.button_negative);
        button.setText(str);
        button.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        button.setTextSize(20.0f);
        button.setOnClickListener(onClickListener);
        this.buttonLayout.addView(button);
    }

    public void setPositiveButton(String str, View.OnClickListener onClickListener) {
        Button button = new Button(this.context);
        LinearLayout.LayoutParams layoutParams = CloudClientActivity.mWidth == 1280 ? new LinearLayout.LayoutParams((int) TransportMediator.KEYCODE_MEDIA_RECORD, 50) : new LinearLayout.LayoutParams(100, 40);
        button.setLayoutParams(layoutParams);
        button.setBackgroundResource(R.drawable.button_positive);
        button.setText(str);
        button.setTextColor(-1);
        button.setTextSize(20.0f);
        button.setOnClickListener(onClickListener);
        if (this.buttonLayout.getChildCount() <= 0) {
            button.setLayoutParams(layoutParams);
            this.buttonLayout.addView(button);
            return;
        }
        layoutParams.setMargins(20, 0, 0, 0);
        button.setLayoutParams(layoutParams);
        this.buttonLayout.addView(button, 1);
    }

    public void setTitle(int i) {
        this.titleView.setText(i);
    }

    public void setTitle(String str) {
        this.titleView.setText(str);
    }
}
