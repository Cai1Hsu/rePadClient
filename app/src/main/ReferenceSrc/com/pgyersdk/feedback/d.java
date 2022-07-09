package com.pgyersdk.feedback;

import android.content.Context;
import android.content.DialogInterface;
import android.os.Handler;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.jar:com/pgyersdk/feedback/d.class */
final class d implements DialogInterface.OnClickListener {
    final /* synthetic */ c a;
    private final /* synthetic */ Context b;

    d(c cVar, Context context) {
        this.a = cVar;
        this.b = context;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i) {
        String str;
        boolean z;
        com.pgyersdk.d.a aVar;
        com.pgyersdk.d.a aVar2;
        Handler handler;
        Context context;
        com.pgyersdk.d.a aVar3;
        com.pgyersdk.d.a aVar4;
        String str2;
        Context context2;
        if (this.b.checkCallingOrSelfPermission("android.permission.INTERNET") != 0) {
            context2 = this.a.g;
            Toast.makeText(context2, "需要添加android.permission.INTERNET权限", 0).show();
            return;
        }
        ArrayList arrayList = new ArrayList();
        str = this.a.h;
        if (!com.pgyersdk.c.m.a(str)) {
            aVar4 = this.a.b;
            if (aVar4.b().isChecked()) {
                c cVar = this.a;
                if (c.b(this.b)) {
                    str2 = this.a.h;
                    arrayList.add(str2);
                }
            }
        }
        z = this.a.e;
        if (z) {
            com.pgyersdk.c.e a = com.pgyersdk.c.e.a();
            context = this.a.g;
            String b = a.b(context);
            com.pgyersdk.c.e.a();
            List a2 = com.pgyersdk.c.e.a(b, ".jpg");
            aVar3 = this.a.b;
            if (aVar3.b().isChecked()) {
                c cVar2 = this.a;
                if (c.b(this.b)) {
                    for (int i2 = 0; i2 < a2.size(); i2++) {
                        arrayList.add((String) a2.get(i2));
                    }
                }
            }
        }
        aVar = this.a.b;
        if (com.pgyersdk.c.m.a(aVar.a().getText().toString())) {
            c.a(dialogInterface, false);
            Toast.makeText(this.b, com.pgyersdk.a.b.a(), 0).show();
            return;
        }
        c.a(dialogInterface, true);
        Context context3 = this.b;
        aVar2 = this.a.b;
        String trim = aVar2.a().getText().toString().trim();
        handler = this.a.f;
        com.pgyersdk.b.e eVar = new com.pgyersdk.b.e(context3, "http://www.pgyer.com/apiv1/feedback/add", trim, arrayList, "", handler);
        eVar.a();
        com.pgyersdk.c.a.a(eVar);
    }
}
