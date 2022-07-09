package com.pgyersdk.feedback;

import android.content.Context;
import android.media.MediaPlayer;

/* loaded from: classes.jar:com/pgyersdk/feedback/PgyFeedbackShakeManager.class */
public class PgyFeedbackShakeManager {
    private static String a = "PgyFeedbackShake";
    private static PgyFeedbackShakeManager b = null;
    private l c = null;
    private MediaPlayer d = null;
    private Boolean e = false;

    private static PgyFeedbackShakeManager a() {
        if (b == null) {
            b = new PgyFeedbackShakeManager();
        }
        return b;
    }

    public static void register(Context context, String str) {
        try {
            com.pgyersdk.a.a.k = str;
            PgyFeedbackShakeManager a2 = a();
            a2.c = new l(context);
            a2.c.a(new j(a2, context));
            com.pgyersdk.a.a.a(context);
        } catch (Exception e) {
        }
    }

    public static PgyFeedbackShakeManager setGLSurface(boolean z) {
        a().e = Boolean.valueOf(z);
        return b;
    }

    public static void unregister() {
        try {
            PgyFeedbackShakeManager a2 = a();
            if (a2.c != null) {
                a2.c.b();
            }
            b = null;
        } catch (Exception e) {
        }
    }
}
