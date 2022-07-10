package com.pgyersdk.d;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Color;
import android.os.Handler;
import android.os.Message;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import com.pgyersdk.c.f;
import com.pgyersdk.c.i;
import org.apache.commons.net.telnet.TelnetCommand;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class a extends AlertDialog.Builder implements com.pgyersdk.feedback.b {
    private Context b;
    private Activity c;
    private ScrollView d;
    private EditText e;
    private ImageView f;
    private CheckBox g;
    private int h;
    private String i;
    private String j;
    private String k;
    private int l;
    private int m;
    private Handler n = new b(this);
    View.OnTouchListener a = new c(this);

    public a(Context context) {
        super(context);
        if (context instanceof Activity) {
            this.c = (Activity) context;
        }
        this.b = context;
        com.pgyersdk.feedback.c.a(this);
        f.a(this);
    }

    @TargetApi(11)
    public a(Context context, int i) {
        super(context, i);
        if (context instanceof Activity) {
            this.c = (Activity) context;
        }
        if (i == 2) {
            this.b = new ContextThemeWrapper(context, 16973931);
        } else if (i == 3) {
            this.b = new ContextThemeWrapper(context, 16973934);
        } else {
            this.b = new ContextThemeWrapper(context, 16973829);
        }
        this.h = i;
        com.pgyersdk.feedback.c.a(this);
        f.a(this);
    }

    private View a(Context context, CharSequence charSequence) {
        TextView textView = new TextView(context);
        textView.setText(charSequence.toString());
        textView.setTextSize(22.0f);
        textView.setTextColor(Color.parseColor(this.i));
        textView.setPadding(30, 20, 0, 20);
        textView.setBackgroundColor(Color.parseColor("#56bc94"));
        return textView;
    }

    public static /* synthetic */ ImageView a(a aVar) {
        return aVar.f;
    }

    public static /* synthetic */ Handler b(a aVar) {
        return aVar.n;
    }

    public static /* synthetic */ Activity c(a aVar) {
        return aVar.c;
    }

    private static LinearLayout.LayoutParams c() {
        return new LinearLayout.LayoutParams(-1, -2);
    }

    public final EditText a() {
        return this.e;
    }

    @Override // com.pgyersdk.feedback.b
    public final void a(String str) {
        if (this.f != null) {
            this.f.setImageBitmap(i.a(str));
            return;
        }
        Message message = new Message();
        message.what = 20002;
        message.obj = str;
        this.n.sendMessageDelayed(message, 100L);
    }

    public final CheckBox b() {
        return this.g;
    }

    @Override // android.app.AlertDialog.Builder
    public final AlertDialog create() {
        int i = this.h;
        this.i = "#ffffff";
        this.j = "#56bc94";
        this.k = "#cccccc";
        this.l = Color.rgb((int) TelnetCommand.AO, (int) TelnetCommand.AO, (int) TelnetCommand.AO);
        this.m = Color.rgb(255, 255, 255);
        AlertDialog create = super.create();
        create.requestWindowFeature(1);
        this.d = new ScrollView(this.b);
        if (this.b.getResources().getConfiguration().orientation == 1) {
            ScrollView scrollView = this.d;
            Context context = this.b;
            LinearLayout linearLayout = new LinearLayout(context);
            linearLayout.setOnTouchListener(this.a);
            linearLayout.setBackgroundColor(-1);
            linearLayout.setOrientation(1);
            LinearLayout.LayoutParams c = c();
            linearLayout.addView(a(context, "反馈"));
            TextView textView = new TextView(context);
            textView.setText("描述");
            textView.setTextColor(Color.parseColor(this.j));
            textView.setTextSize(18.0f);
            textView.setBackgroundColor(this.l);
            textView.setPadding(30, 30, 0, 10);
            linearLayout.addView(textView, c);
            this.e = new EditText(context);
            this.e.setHint("请输入你要反馈的内容...");
            this.e.setHintTextColor(Color.parseColor(this.k));
            this.e.setMinLines(6);
            this.e.setTextSize(14.0f);
            this.e.setGravity(51);
            this.e.setBackgroundColor(this.m);
            linearLayout.addView(this.e, c);
            TextView textView2 = new TextView(context);
            textView2.setText("截图");
            textView2.setTextColor(Color.parseColor(this.j));
            textView2.setTextSize(18.0f);
            textView2.setBackgroundColor(this.l);
            textView2.setPadding(30, 30, 0, 10);
            linearLayout.addView(textView2, c);
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
            layoutParams.width = (int) TypedValue.applyDimension(1, 60.0f, context.getResources().getDisplayMetrics());
            layoutParams.height = (layoutParams.width * context.getResources().getDisplayMetrics().heightPixels) / context.getResources().getDisplayMetrics().widthPixels;
            layoutParams.setMargins(30, 0, 0, 0);
            layoutParams.gravity = 3;
            this.f = new ImageView(context);
            linearLayout.addView(this.f, layoutParams);
            LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-2, -2);
            layoutParams2.gravity = 3;
            layoutParams2.setMargins(30, 0, 0, 0);
            this.g = new CheckBox(context);
            this.g.setText("上传屏幕截图");
            this.g.setChecked(true);
            this.g.setOnCheckedChangeListener(new d(this));
            linearLayout.addView(this.g, layoutParams2);
            TextView textView3 = new TextView(context);
            textView3.setText("设备详情：" + com.pgyersdk.a.a.g + "\t" + com.pgyersdk.a.a.f);
            textView3.setTextColor(Color.parseColor(this.j));
            textView3.setTextSize(12.0f);
            textView3.setPadding(30, 20, 0, 20);
            linearLayout.addView(textView3, c);
            scrollView.addView(linearLayout, c());
        } else {
            ScrollView scrollView2 = this.d;
            Context context2 = this.b;
            LinearLayout linearLayout2 = new LinearLayout(context2);
            linearLayout2.setOrientation(1);
            linearLayout2.setOnTouchListener(this.a);
            LinearLayout.LayoutParams c2 = c();
            linearLayout2.addView(a(context2, "反馈"));
            this.e = new EditText(context2);
            this.e.setHint("请输入你要反馈的内容...");
            this.e.setMinLines(2);
            this.e.setHintTextColor(Color.parseColor(this.k));
            this.e.setGravity(51);
            this.e.setBackgroundColor(this.m);
            linearLayout2.addView(this.e, c2);
            TextView textView4 = new TextView(context2);
            textView4.setBackgroundColor(Color.parseColor("#f0f0f0"));
            textView4.setHeight(com.pgyersdk.c.d.a(context2));
            linearLayout2.addView(textView4, c2);
            LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(-2, -2);
            layoutParams3.setMargins(30, 10, 0, 10);
            this.g = new CheckBox(context2);
            this.g.setText("上传屏幕截图");
            this.g.setChecked(true);
            this.g.setBackgroundColor(this.l);
            this.g.setOnCheckedChangeListener(new e(this));
            linearLayout2.addView(this.g, layoutParams3);
            TextView textView5 = new TextView(context2);
            textView5.setBackgroundColor(Color.parseColor("#f0f0f0"));
            textView5.setHeight(com.pgyersdk.c.d.a(context2));
            linearLayout2.addView(textView5, c2);
            TextView textView6 = new TextView(context2);
            textView6.setText("设备详情：" + com.pgyersdk.a.a.g + "\t" + com.pgyersdk.a.a.f);
            textView6.setTextColor(Color.parseColor(this.j));
            textView6.setTextSize(12.0f);
            textView6.setBackgroundColor(-1);
            textView6.setPadding(30, 20, 0, 20);
            linearLayout2.addView(textView6, c2);
            scrollView2.addView(linearLayout2, c());
        }
        create.setView(this.d);
        create.setCancelable(false);
        return create;
    }

    @Override // android.app.AlertDialog.Builder
    public final AlertDialog.Builder setTitle(CharSequence title) {
        setCustomTitle(a(this.b, title));
        return super.setTitle(title);
    }

    @Override // android.app.AlertDialog.Builder
    public final AlertDialog show() {
        AlertDialog show = super.show();
        Window window = show.getWindow();
        WindowManager.LayoutParams attributes = window.getAttributes();
        attributes.gravity = 7;
        window.setAttributes(attributes);
        return show;
    }
}
