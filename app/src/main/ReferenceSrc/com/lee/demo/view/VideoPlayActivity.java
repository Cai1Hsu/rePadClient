package com.lee.demo.view;

import android.app.Activity;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.KeyEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.SeekBar;
import android.widget.TextView;
import com.edutech.daoxueben.sysconfig.AppEnvironment;
import com.launcher.activity.R;
import java.util.Timer;
import java.util.TimerTask;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class VideoPlayActivity extends Activity implements SurfaceHolder.Callback {
    private DisplayMetrics dm;
    private int duration;
    private boolean isPlaying;
    private ImageView play;
    private SeekBar seekBar;
    private SurfaceHolder surface_holder;
    private SurfaceView surface_view;
    private Timer timer;
    private TimerTask timerTask;
    private TextView tv_time;
    private String url = "";

    static /* synthetic */ SurfaceView access$5(VideoPlayActivity videoPlayActivity) {
        return videoPlayActivity.surface_view;
    }

    static /* synthetic */ TextView access$3(VideoPlayActivity videoPlayActivity) {
        return videoPlayActivity.tv_time;
    }

    static /* synthetic */ SeekBar access$0(VideoPlayActivity videoPlayActivity) {
        return videoPlayActivity.seekBar;
    }

    static /* synthetic */ void access$2(VideoPlayActivity videoPlayActivity, int i) {
        videoPlayActivity.duration = i;
    }

    static /* synthetic */ int access$7(VideoPlayActivity videoPlayActivity) {
        return videoPlayActivity.duration;
    }

    static /* synthetic */ DisplayMetrics access$6(VideoPlayActivity videoPlayActivity) {
        return videoPlayActivity.dm;
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.dm = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(this.dm);
        setContentView(R.layout.fragment_video);
        initViews();
        Log.e("qwe", "dataSource:" + this.url);
        Intent intent = getIntent();
        this.url = intent.getStringExtra("mediaurl");
        mpInitialize();
        try {
            AppEnvironment.getMedia().setDataSource(this.url);
            AppEnvironment.getMedia().prepareAsync();
            Log.e("qwe", "prepareAsync");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void mpInitialize() {
        AppEnvironment.getMedia().setOnBufferingUpdateListener(new AnonymousClass1());
        AppEnvironment.getMedia().setOnCompletionListener(new AnonymousClass2());
        AppEnvironment.getMedia().setOnSeekCompleteListener(new AnonymousClass3());
        AppEnvironment.getMedia().setOnPreparedListener(new AnonymousClass4());
        AppEnvironment.getMedia().setOnVideoSizeChangedListener(new AnonymousClass5());
    }

    /* renamed from: com.lee.demo.view.VideoPlayActivity$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 implements MediaPlayer.OnBufferingUpdateListener {
        AnonymousClass1() {
            VideoPlayActivity.this = r1;
        }

        @Override // android.media.MediaPlayer.OnBufferingUpdateListener
        public void onBufferingUpdate(MediaPlayer arg0, int percent) {
            VideoPlayActivity.access$0(VideoPlayActivity.this).setSecondaryProgress(percent * 10);
        }
    }

    /* renamed from: com.lee.demo.view.VideoPlayActivity$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass2 implements MediaPlayer.OnCompletionListener {
        AnonymousClass2() {
            VideoPlayActivity.this = r1;
        }

        @Override // android.media.MediaPlayer.OnCompletionListener
        public void onCompletion(MediaPlayer arg0) {
            VideoPlayActivity.access$1(VideoPlayActivity.this);
        }
    }

    /* renamed from: com.lee.demo.view.VideoPlayActivity$3 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass3 implements MediaPlayer.OnSeekCompleteListener {
        AnonymousClass3() {
            VideoPlayActivity.this = r1;
        }

        @Override // android.media.MediaPlayer.OnSeekCompleteListener
        public void onSeekComplete(MediaPlayer mp) {
        }
    }

    /* renamed from: com.lee.demo.view.VideoPlayActivity$4 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass4 implements MediaPlayer.OnPreparedListener {
        AnonymousClass4() {
            VideoPlayActivity.this = r1;
        }

        @Override // android.media.MediaPlayer.OnPreparedListener
        public void onPrepared(MediaPlayer arg0) {
            VideoPlayActivity.access$2(VideoPlayActivity.this, AppEnvironment.getMedia().getDuration());
            VideoPlayActivity.access$3(VideoPlayActivity.this).setText(String.valueOf(VideoPlayActivity.this.getTime(AppEnvironment.getMedia().getCurrentPosition())) + "/" + VideoPlayActivity.this.getTime(AppEnvironment.getMedia().getDuration()));
            VideoPlayActivity.access$4(VideoPlayActivity.this);
        }
    }

    /* renamed from: com.lee.demo.view.VideoPlayActivity$5 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass5 implements MediaPlayer.OnVideoSizeChangedListener {
        AnonymousClass5() {
            VideoPlayActivity.this = r1;
        }

        @Override // android.media.MediaPlayer.OnVideoSizeChangedListener
        public void onVideoSizeChanged(MediaPlayer mp, int width, int height) {
            ViewGroup.LayoutParams layoutParams = VideoPlayActivity.access$5(VideoPlayActivity.this).getLayoutParams();
            float w = AppEnvironment.getMedia().getVideoWidth() / VideoPlayActivity.access$6(VideoPlayActivity.this).widthPixels;
            float h = AppEnvironment.getMedia().getVideoHeight() / VideoPlayActivity.access$6(VideoPlayActivity.this).heightPixels;
            float m = Math.max(w, h);
            layoutParams.width = (int) (AppEnvironment.getMedia().getVideoWidth() / m);
            layoutParams.height = (int) (AppEnvironment.getMedia().getVideoHeight() / m);
            VideoPlayActivity.access$5(VideoPlayActivity.this).setLayoutParams(layoutParams);
        }
    }

    public String getTime(int t) {
        int cRint = (int) Math.rint(t / 1000.0f);
        return String.valueOf(cRint / 60 > 9 ? "" : "0") + (cRint / 60) + ":" + (cRint % 60 > 9 ? "" : "0") + (cRint % 60);
    }

    private void initViews() {
        this.surface_view = (SurfaceView) findViewById(R.id.surface_view);
        this.surface_holder = this.surface_view.getHolder();
        this.surface_holder.addCallback(this);
        this.play = (ImageView) findViewById(R.id.play);
        this.play.setOnClickListener(new AnonymousClass6());
        this.tv_time = (TextView) findViewById(R.id.tv_time);
        this.seekBar = (SeekBar) findViewById(R.id.seekBar);
        this.seekBar.setOnSeekBarChangeListener(new AnonymousClass7());
    }

    /* renamed from: com.lee.demo.view.VideoPlayActivity$6 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass6 implements View.OnClickListener {
        AnonymousClass6() {
            VideoPlayActivity.this = r1;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (AppEnvironment.getMedia() != null) {
                if (AppEnvironment.getMedia().isPlaying()) {
                    VideoPlayActivity.access$1(VideoPlayActivity.this);
                } else {
                    VideoPlayActivity.access$4(VideoPlayActivity.this);
                }
            }
        }
    }

    /* renamed from: com.lee.demo.view.VideoPlayActivity$7 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass7 implements SeekBar.OnSeekBarChangeListener {
        AnonymousClass7() {
            VideoPlayActivity.this = r1;
        }

        @Override // android.widget.SeekBar.OnSeekBarChangeListener
        public void onStopTrackingTouch(SeekBar seekBar) {
        }

        @Override // android.widget.SeekBar.OnSeekBarChangeListener
        public void onStartTrackingTouch(SeekBar seekBar) {
        }

        @Override // android.widget.SeekBar.OnSeekBarChangeListener
        public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
            if (fromUser && AppEnvironment.getMedia() != null) {
                AppEnvironment.getMedia().seekTo((int) (VideoPlayActivity.access$7(VideoPlayActivity.this) * (progress / 7200000.0f)));
            }
            VideoPlayActivity.access$2(VideoPlayActivity.this, AppEnvironment.getMedia().getDuration());
            VideoPlayActivity.access$3(VideoPlayActivity.this).setText(String.valueOf(VideoPlayActivity.this.getTime(AppEnvironment.getMedia().getCurrentPosition())) + "/" + VideoPlayActivity.this.getTime(AppEnvironment.getMedia().getDuration()));
        }
    }

    static /* synthetic */ void access$4(VideoPlayActivity videoPlayActivity) {
        videoPlayActivity.playVideo();
    }

    private void playVideo() {
        if (AppEnvironment.getMedia() != null && !AppEnvironment.getMedia().isPlaying()) {
            AppEnvironment.getMedia().start();
            this.play.setImageResource(R.drawable.video_stop);
            this.timer = new Timer();
            this.timerTask = new AnonymousClass8();
            this.timer.schedule(this.timerTask, 0L, 500L);
        }
    }

    /* renamed from: com.lee.demo.view.VideoPlayActivity$8 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass8 extends TimerTask {
        AnonymousClass8() {
            VideoPlayActivity.this = r1;
        }

        @Override // java.util.TimerTask, java.lang.Runnable
        public void run() {
            if (AppEnvironment.getMedia() != null && AppEnvironment.getMedia().isPlaying()) {
                VideoPlayActivity.access$0(VideoPlayActivity.this).setProgress((int) ((AppEnvironment.getMedia().getCurrentPosition() / VideoPlayActivity.access$7(VideoPlayActivity.this)) * 7200000.0f));
            }
        }
    }

    static /* synthetic */ void access$1(VideoPlayActivity videoPlayActivity) {
        videoPlayActivity.pauseVideo();
    }

    private void pauseVideo() {
        if (AppEnvironment.getMedia() != null) {
            if (AppEnvironment.getMedia().isPlaying()) {
                AppEnvironment.getMedia().pause();
                this.play.setImageResource(R.drawable.video_play);
            }
            if (this.timerTask != null && this.timer != null) {
                this.timerTask.cancel();
                this.timerTask = null;
                this.timer.cancel();
                this.timer = null;
            }
        }
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceChanged(SurfaceHolder arg0, int arg1, int arg2, int arg3) {
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceCreated(SurfaceHolder arg0) {
        AppEnvironment.getMedia().setDisplay(arg0);
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceDestroyed(SurfaceHolder arg0) {
        AppEnvironment.getMedia().setDisplay(null);
    }

    @Override // android.app.Activity
    public void onResume() {
        super.onResume();
        if (AppEnvironment.getMedia() != null && this.isPlaying) {
            playVideo();
        }
        Log.e("qwe", "activity onresume");
    }

    @Override // android.app.Activity
    protected void onStop() {
        Log.e("qwe", "activity stop");
        super.onStop();
        if (this.timerTask != null && this.timer != null) {
            this.timerTask.cancel();
            this.timerTask = null;
            this.timer.cancel();
            this.timer = null;
        }
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        switch (keyCode) {
            case 4:
                setResult(1024);
                finish();
                break;
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override // android.app.Activity
    public void onPause() {
        super.onPause();
        Log.e("qwe", "onpause");
        if (AppEnvironment.getMedia() != null && AppEnvironment.getMedia().isPlaying()) {
            pauseVideo();
        }
    }

    @Override // android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        this.isPlaying = false;
        this.timer = null;
        Log.e("qwe", "ondestory");
    }
}
