package com.pgyersdk.feedback;

import android.content.DialogInterface;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class g implements DialogInterface.OnDismissListener {
    final /* synthetic */ c a;

    public g(c cVar) {
        this.a = cVar;
    }

    @Override // android.content.DialogInterface.OnDismissListener
    public final void onDismiss(DialogInterface dialogInterface) {
        c.f(this.a);
    }
}
