package com.pgyersdk.feedback;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.os.Build;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import java.lang.reflect.Field;

/* loaded from: classes.jar:com/pgyersdk/feedback/c.class */
public final class c {
    private static c a = null;
    private static b i;
    private com.pgyersdk.d.a b;
    private int c;
    private Handler f;
    private Context g;
    private a d = null;
    private boolean e = false;
    private String h = "";

    public static c a() {
        if (a == null) {
            a = new c();
        }
        return a;
    }

    static /* synthetic */ void a(DialogInterface dialogInterface, Boolean bool) {
        try {
            Field declaredField = dialogInterface.getClass().getSuperclass().getDeclaredField("mShowing");
            declaredField.setAccessible(true);
            try {
                try {
                    declaredField.set(dialogInterface, bool);
                } catch (IllegalArgumentException e) {
                    e.printStackTrace();
                }
            } catch (IllegalAccessException e2) {
                e2.printStackTrace();
            }
        } catch (NoSuchFieldException e3) {
            e3.printStackTrace();
        }
    }

    public static void a(b bVar) {
        i = bVar;
    }

    static /* synthetic */ boolean b(Context context) {
        return context.checkCallingOrSelfPermission("android.permission.WRITE_EXTERNAL_STORAGE") == 0;
    }

    static /* synthetic */ void f(c cVar) {
        com.pgyersdk.c.e.a();
        com.pgyersdk.c.e.b();
        com.pgyersdk.c.f.a();
        com.pgyersdk.c.f.b();
        if (cVar.d != null) {
            cVar.d.b();
        }
        cVar.b = null;
        a = null;
    }

    public final com.pgyersdk.d.a a(Context context) {
        com.pgyersdk.d.a aVar;
        this.g = context;
        this.f = new i(this);
        if (this.b != null) {
            aVar = this.b;
        } else {
            if (this.d != null) {
                this.d.a();
            }
            if (Build.VERSION.SDK_INT >= 11) {
                if (this.c == 0) {
                    this.c = 3;
                }
                this.b = new com.pgyersdk.d.a(context, this.c);
            } else {
                this.b = new com.pgyersdk.d.a(context);
            }
            if (context instanceof Activity) {
                if (!this.e) {
                    this.h = com.pgyersdk.c.e.a().a(context);
                    String str = this.h;
                    View decorView = ((Activity) context).getWindow().getDecorView();
                    decorView.setDrawingCacheEnabled(true);
                    Bitmap drawingCache = decorView.getDrawingCache();
                    Log.d("takeScreenshot filepath", str);
                    com.pgyersdk.c.a.a(new h(this, drawingCache, str));
                } else {
                    com.pgyersdk.c.f.a().a(context);
                    com.pgyersdk.c.f.a().c();
                }
            }
            this.b.setPositiveButton("提交", new d(this, context));
            this.b.setNegativeButton("取消", new e(this, context));
            this.b.setOnCancelListener(new f(this));
            AlertDialog create = this.b.create();
            create.setOnDismissListener(new g(this));
            create.show();
            aVar = this.b;
        }
        return aVar;
    }

    public final c a(a aVar) {
        this.d = aVar;
        return a;
    }

    public final c a(boolean z) {
        this.e = z;
        return a;
    }
}
