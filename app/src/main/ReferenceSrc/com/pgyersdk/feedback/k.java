package com.pgyersdk.feedback;

import android.content.Context;
import android.media.MediaPlayer;
import android.net.Uri;

/* loaded from: classes.jar:com/pgyersdk/feedback/k.class */
final class k implements a {
    final /* synthetic */ j a;
    private final /* synthetic */ Context b;

    k(j jVar, Context context) {
        this.a = jVar;
        this.b = context;
    }

    @Override // com.pgyersdk.feedback.a
    public final void a() {
        l lVar;
        MediaPlayer mediaPlayer;
        MediaPlayer mediaPlayer2;
        MediaPlayer mediaPlayer3;
        lVar = this.a.a.c;
        lVar.b();
        try {
            this.a.a.d = MediaPlayer.create(this.b, Uri.parse("file:///system/media/audio/ui/camera_click.ogg"));
            mediaPlayer = this.a.a.d;
            synchronized (mediaPlayer) {
                mediaPlayer2 = this.a.a.d;
                mediaPlayer2.setVolume(10.0f, 10.0f);
                mediaPlayer3 = this.a.a.d;
                mediaPlayer3.start();
            }
        } catch (Exception e) {
        }
    }

    @Override // com.pgyersdk.feedback.a
    public final void b() {
        MediaPlayer mediaPlayer;
        l lVar;
        MediaPlayer mediaPlayer2;
        mediaPlayer = this.a.a.d;
        if (mediaPlayer != null) {
            mediaPlayer2 = this.a.a.d;
            mediaPlayer2.release();
            this.a.a.d = null;
        }
        lVar = this.a.a.c;
        lVar.a();
    }
}
