package com.pgyersdk.b;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Color;
import android.util.Log;
import android.widget.TextView;
import com.pgyersdk.c.k;
import com.pgyersdk.c.m;
import com.pgyersdk.update.UpdateManagerListener;
import org.apache.commons.net.bsd.RCommandClient;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class b extends a {
    protected boolean d;
    private Activity f;
    private String h;
    private String i;
    private AlertDialog g = null;
    protected String e = "";

    public b(Activity activity, String str, String str2, UpdateManagerListener updateManagerListener) {
        super(activity, str, str2, updateManagerListener);
        this.f = null;
        this.d = false;
        this.f = activity;
        this.d = true;
    }

    @Override // com.pgyersdk.b.a
    public final void a() {
        super.a();
        this.f = null;
        if (this.g != null) {
            this.g.dismiss();
            this.g = null;
        }
    }

    @Override // com.pgyersdk.b.a
    protected final void a(String str) {
        if (m.a(str) || !this.d) {
            return;
        }
        String a = com.pgyersdk.a.b.a(this.c, RCommandClient.DEFAULT_PORT);
        try {
            JSONObject jSONObject = new JSONObject(str);
            if ("0".equals(jSONObject.getString("code"))) {
                JSONObject jSONObject2 = jSONObject.getJSONObject("data");
                if (jSONObject2.has("lastBuild")) {
                    this.i = jSONObject2.getString("lastBuild");
                    if (m.a(k.a(this.f, "buildNo"))) {
                        k.a("buildNo", this.i);
                        return;
                    }
                    Log.i("lastBuild buildNO", String.valueOf(this.i) + " " + k.a(this.f, "buildNo"));
                }
                if (!jSONObject2.has("releaseNote")) {
                    if (this.c == null) {
                        return;
                    }
                    this.c.onNoUpdateAvailable();
                    return;
                }
                a = jSONObject2.getString("releaseNote");
                if (jSONObject2.has("appUrl")) {
                    this.h = jSONObject2.getString("appUrl");
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        if (this.f == null || this.f.isFinishing()) {
            return;
        }
        AlertDialog.Builder builder = new AlertDialog.Builder(this.f);
        builder.setTitle(com.pgyersdk.a.b.a(this.c, 513));
        TextView textView = new TextView(this.f);
        textView.setText("更新提醒");
        textView.setTextSize(22.0f);
        textView.setTextColor(Color.parseColor("#56bc94"));
        textView.setPadding(30, 20, 0, 20);
        textView.setBackgroundColor(Color.parseColor("#56bc94"));
        builder.setMessage(a);
        builder.setNegativeButton(com.pgyersdk.a.b.a(this.c, 515), new c(this));
        builder.setPositiveButton(com.pgyersdk.a.b.a(this.c, 516), new d(this));
        this.g = builder.create();
        this.g.show();
        if (this.c == null) {
            return;
        }
        this.c.onUpdateAvailable();
    }

    @Override // com.pgyersdk.b.a
    protected final void b() {
        super.b();
        this.f = null;
        this.g = null;
    }
}
