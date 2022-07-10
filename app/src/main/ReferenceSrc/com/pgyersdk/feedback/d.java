package com.pgyersdk.feedback;

import android.content.Context;
import android.content.DialogInterface;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class d implements DialogInterface.OnClickListener {
    final /* synthetic */ c a;
    private final /* synthetic */ Context b;

    public d(c cVar, Context context) {
        this.a = cVar;
        this.b = context;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i) {
        if (this.b.checkCallingOrSelfPermission("android.permission.INTERNET") != 0) {
            Toast.makeText(c.a(this.a), "需要添加android.permission.INTERNET权限", 0).show();
            return;
        }
        ArrayList arrayList = new ArrayList();
        if (!com.pgyersdk.c.m.a(c.b(this.a)) && c.c(this.a).b().isChecked()) {
            c cVar = this.a;
            if (c.b(this.b)) {
                arrayList.add(c.b(this.a));
            }
        }
        if (c.d(this.a)) {
            String b = com.pgyersdk.c.e.a().b(c.a(this.a));
            com.pgyersdk.c.e.a();
            List a = com.pgyersdk.c.e.a(b, ".jpg");
            if (c.c(this.a).b().isChecked()) {
                c cVar2 = this.a;
                if (c.b(this.b)) {
                    for (int i2 = 0; i2 < a.size(); i2++) {
                        arrayList.add((String) a.get(i2));
                    }
                }
            }
        }
        if (com.pgyersdk.c.m.a(c.c(this.a).a().getText().toString())) {
            c.a(dialogInterface, false);
            Toast.makeText(this.b, com.pgyersdk.a.b.a(), 0).show();
            return;
        }
        c.a(dialogInterface, true);
        com.pgyersdk.b.e eVar = new com.pgyersdk.b.e(this.b, "http://www.pgyer.com/apiv1/feedback/add", c.c(this.a).a().getText().toString().trim(), arrayList, "", c.e(this.a));
        eVar.a();
        com.pgyersdk.c.a.a(eVar);
    }
}
