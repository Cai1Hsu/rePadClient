package com.pgyersdk.crash;

import java.lang.ref.WeakReference;

/* loaded from: classes.dex */
final class c extends Thread {
    private final /* synthetic */ WeakReference a;
    private final /* synthetic */ g b = null;

    c(WeakReference weakReference) {
        this.a = weakReference;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() {
        PgyCrashManager.a(this.a, this.b);
        PgyCrashManager.c = false;
    }
}
