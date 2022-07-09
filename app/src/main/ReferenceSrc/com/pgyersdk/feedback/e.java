package com.pgyersdk.feedback;

import android.content.Context;
import android.content.DialogInterface;

/* loaded from: classes.jar:com/pgyersdk/feedback/e.class */
final class e implements DialogInterface.OnClickListener {
    final /* synthetic */ c a;
    private final /* synthetic */ Context b;

    e(c cVar, Context context) {
        this.a = cVar;
        this.b = context;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i) {
        c.a(dialogInterface, true);
        dialogInterface.cancel();
        com.pgyersdk.c.e.a().a(com.pgyersdk.c.e.a().b(this.b));
    }
}
