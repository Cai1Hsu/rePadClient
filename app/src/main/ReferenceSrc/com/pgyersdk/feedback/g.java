package com.pgyersdk.feedback;

import android.content.DialogInterface;

/* loaded from: classes.jar:com/pgyersdk/feedback/g.class */
final class g implements DialogInterface.OnDismissListener {
    final /* synthetic */ c a;

    g(c cVar) {
        this.a = cVar;
    }

    @Override // android.content.DialogInterface.OnDismissListener
    public final void onDismiss(DialogInterface dialogInterface) {
        c.f(this.a);
    }
}