package com.pgyersdk.feedback;

import android.content.Context;
import android.media.MediaPlayer;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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

    public static /* synthetic */ l a(PgyFeedbackShakeManager pgyFeedbackShakeManager) {
        return pgyFeedbackShakeManager.c;
    }

    public static /* synthetic */ void a(PgyFeedbackShakeManager pgyFeedbackShakeManager, MediaPlayer mediaPlayer) {
        pgyFeedbackShakeManager.d = mediaPlayer;
    }

    public static /* synthetic */ MediaPlayer b(PgyFeedbackShakeManager pgyFeedbackShakeManager) {
        return pgyFeedbackShakeManager.d;
    }

    public static /* synthetic */ Boolean c(PgyFeedbackShakeManager pgyFeedbackShakeManager) {
        return pgyFeedbackShakeManager.e;
    }

    public static void register(Context context, String appId) {
        try {
            com.pgyersdk.a.a.k = appId;
            PgyFeedbackShakeManager a2 = a();
            a2.c = new l(context);
            a2.c.a(new j(a2, context));
            com.pgyersdk.a.a.a(context);
        } catch (Exception e) {
        }
    }

    public static PgyFeedbackShakeManager setGLSurface(boolean glSurface) {
        a().e = Boolean.valueOf(glSurface);
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
