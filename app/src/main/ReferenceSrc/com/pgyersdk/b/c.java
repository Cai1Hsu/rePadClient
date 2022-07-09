package com.pgyersdk.b;

import android.content.DialogInterface;

/* loaded from: classes.dex */
final class c implements DialogInterface.OnClickListener {
    final /* synthetic */ b a;

    c(b bVar) {
        this.a = bVar;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i) {
        this.a.b();
    }
}
