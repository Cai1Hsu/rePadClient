package com.pgyersdk.b;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import com.pgyersdk.c.k;
import com.pgyersdk.c.m;

/* loaded from: classes.dex */
final class d implements DialogInterface.OnClickListener {
    final /* synthetic */ b a;

    d(b bVar) {
        this.a = bVar;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i) {
        String str;
        String str2;
        Activity activity;
        Activity activity2;
        String str3;
        try {
            str = this.a.i;
            if (!m.a(str)) {
                str3 = this.a.i;
                k.a("buildNo", str3);
            }
            Intent intent = new Intent();
            intent.setAction("android.intent.action.VIEW");
            str2 = this.a.h;
            intent.setData(Uri.parse(str2));
            activity = this.a.f;
            if (activity == null) {
                return;
            }
            activity2 = this.a.f;
            activity2.startActivity(intent);
        } catch (Exception e) {
        }
    }
}
