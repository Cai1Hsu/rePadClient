package com.pgyersdk.c;

import android.content.Context;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class f {
    private static String a = "GLSurfaceUtils";
    private static f b = null;
    private static com.pgyersdk.feedback.b f;
    private Context d;
    private boolean c = false;
    private int e = 0;

    public static f a() {
        if (b == null) {
            b = new f();
        }
        return b;
    }

    public static void a(com.pgyersdk.feedback.b bVar) {
        f = bVar;
    }

    public static void b() {
        b = null;
    }

    public final void a(Context context) {
        this.d = context;
    }

    public final void c() {
        this.c = true;
    }
}
