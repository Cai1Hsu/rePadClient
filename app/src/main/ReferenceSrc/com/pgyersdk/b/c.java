package com.pgyersdk.b;

import android.content.DialogInterface;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class c implements DialogInterface.OnClickListener {
    final /* synthetic */ b a;

    public c(b bVar) {
        this.a = bVar;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i) {
        this.a.b();
    }
}
