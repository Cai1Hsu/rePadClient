package com.pgyersdk.crash;

/* loaded from: classes.dex */
final class b extends Thread {
    final /* synthetic */ a a;
    private final /* synthetic */ Throwable b;

    b(a aVar, Throwable th) {
        this.a = aVar;
        this.b = th;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() {
        try {
            this.a.a(this.b);
        } catch (Exception e) {
        }
    }
}
