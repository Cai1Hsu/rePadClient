package com.pgyersdk.feedback;

import android.content.Context;
import android.media.MediaPlayer;
import android.net.Uri;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class k implements a {
    final /* synthetic */ j a;
    private final /* synthetic */ Context b;

    public k(j jVar, Context context) {
        this.a = jVar;
        this.b = context;
    }

    @Override // com.pgyersdk.feedback.a
    public final void a() {
        PgyFeedbackShakeManager.a(this.a.a).b();
        try {
            PgyFeedbackShakeManager.a(this.a.a, MediaPlayer.create(this.b, Uri.parse("file:///system/media/audio/ui/camera_click.ogg")));
            synchronized (PgyFeedbackShakeManager.b(this.a.a)) {
                PgyFeedbackShakeManager.b(this.a.a).setVolume(10.0f, 10.0f);
                PgyFeedbackShakeManager.b(this.a.a).start();
            }
        } catch (Exception e) {
        }
    }

    @Override // com.pgyersdk.feedback.a
    public final void b() {
        if (PgyFeedbackShakeManager.b(this.a.a) != null) {
            PgyFeedbackShakeManager.b(this.a.a).release();
            PgyFeedbackShakeManager.a(this.a.a, null);
        }
        PgyFeedbackShakeManager.a(this.a.a).a();
    }
}
