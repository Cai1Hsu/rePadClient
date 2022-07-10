package com.pgyersdk.b;

import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import com.pgyersdk.c.k;
import com.pgyersdk.c.m;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class d implements DialogInterface.OnClickListener {
    final /* synthetic */ b a;

    public d(b bVar) {
        this.a = bVar;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i) {
        try {
            if (!m.a(b.a(this.a))) {
                k.a("buildNo", b.a(this.a));
            }
            Intent intent = new Intent();
            intent.setAction("android.intent.action.VIEW");
            intent.setData(Uri.parse(b.b(this.a)));
            if (b.c(this.a) == null) {
                return;
            }
            b.c(this.a).startActivity(intent);
        } catch (Exception e) {
        }
    }
}
