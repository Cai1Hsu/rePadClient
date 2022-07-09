package com.lee.demo.view;

import android.app.Activity;
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

/* loaded from: classes.jar:com/lee/demo/view/VideoPlayActivity.class */
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

    private void initViews() {
        this.surface_view = (SurfaceView) findViewById(R.id.surface_view);
        this.surface_holder = this.surface_view.getHolder();
        this.surface_holder.addCallback(this);
        this.play = (ImageView) findViewById(R.id.play);
        this.play.setOnClickListener(new View.OnClickListener() { // from class: com.lee.demo.view.VideoPlayActivity.6
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (AppEnvironment.getMedia() != null) {
                    if (AppEnvironment.getMedia().isPlaying()) {
                        VideoPlayActivity.this.pauseVideo();
                    } else {
                        VideoPlayActivity.this.playVideo();
                    }
                }
            }
        });
        this.tv_time = (TextView) findViewById(R.id.tv_time);
        this.seekBar = (SeekBar) findViewById(R.id.seekBar);
        this.seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() { // from class: com.lee.demo.view.VideoPlayActivity.7
            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
                if (z && AppEnvironment.getMedia() != null) {
                    AppEnvironment.getMedia().seekTo((int) (VideoPlayActivity.this.duration * (i / 7200000.0f)));
                }
                VideoPlayActivity.this.duration = AppEnvironment.getMedia().getDuration();
                VideoPlayActivity.this.tv_time.setText(String.valueOf(VideoPlayActivity.this.getTime(AppEnvironment.getMedia().getCurrentPosition())) + "/" + VideoPlayActivity.this.getTime(AppEnvironment.getMedia().getDuration()));
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
    }

    private void mpInitialize() {
        AppEnvironment.getMedia().setOnBufferingUpdateListener(new MediaPlayer.OnBufferingUpdateListener() { // from class: com.lee.demo.view.VideoPlayActivity.1
            @Override // android.media.MediaPlayer.OnBufferingUpdateListener
            public void onBufferingUpdate(MediaPlayer mediaPlayer, int i) {
                VideoPlayActivity.this.seekBar.setSecondaryProgress(i * 10);
            }
        });
        AppEnvironment.getMedia().setOnCompletionListener(new MediaPlayer.OnCompletionListener() { // from class: com.lee.demo.view.VideoPlayActivity.2
            @Override // android.media.MediaPlayer.OnCompletionListener
            public void onCompletion(MediaPlayer mediaPlayer) {
                VideoPlayActivity.this.pauseVideo();
            }
        });
        AppEnvironment.getMedia().setOnSeekCompleteListener(new MediaPlayer.OnSeekCompleteListener() { // from class: com.lee.demo.view.VideoPlayActivity.3
            @Override // android.media.MediaPlayer.OnSeekCompleteListener
            public void onSeekComplete(MediaPlayer mediaPlayer) {
            }
        });
        AppEnvironment.getMedia().setOnPreparedListener(new MediaPlayer.OnPreparedListener() { // from class: com.lee.demo.view.VideoPlayActivity.4
            @Override // android.media.MediaPlayer.OnPreparedListener
            public void onPrepared(MediaPlayer mediaPlayer) {
                VideoPlayActivity.this.duration = AppEnvironment.getMedia().getDuration();
                VideoPlayActivity.this.tv_time.setText(String.valueOf(VideoPlayActivity.this.getTime(AppEnvironment.getMedia().getCurrentPosition())) + "/" + VideoPlayActivity.this.getTime(AppEnvironment.getMedia().getDuration()));
                VideoPlayActivity.this.playVideo();
            }
        });
        AppEnvironment.getMedia().setOnVideoSizeChangedListener(new MediaPlayer.OnVideoSizeChangedListener() { // from class: com.lee.demo.view.VideoPlayActivity.5
            @Override // android.media.MediaPlayer.OnVideoSizeChangedListener
            public void onVideoSizeChanged(MediaPlayer mediaPlayer, int i, int i2) {
                ViewGroup.LayoutParams layoutParams = VideoPlayActivity.this.surface_view.getLayoutParams();
                float max = Math.max(AppEnvironment.getMedia().getVideoWidth() / VideoPlayActivity.this.dm.widthPixels, AppEnvironment.getMedia().getVideoHeight() / VideoPlayActivity.this.dm.heightPixels);
                layoutParams.width = (int) (AppEnvironment.getMedia().getVideoWidth() / max);
                layoutParams.height = (int) (AppEnvironment.getMedia().getVideoHeight() / max);
                VideoPlayActivity.this.surface_view.setLayoutParams(layoutParams);
            }
        });
    }

    public void pauseVideo() {
        if (AppEnvironment.getMedia() == null) {
            return;
        }
        if (AppEnvironment.getMedia().isPlaying()) {
            AppEnvironment.getMedia().pause();
            this.play.setImageResource(R.drawable.video_play);
        }
        if (this.timerTask == null || this.timer == null) {
            return;
        }
        this.timerTask.cancel();
        this.timerTask = null;
        this.timer.cancel();
        this.timer = null;
    }

    public void playVideo() {
        if (AppEnvironment.getMedia() != null && !AppEnvironment.getMedia().isPlaying()) {
            AppEnvironment.getMedia().start();
            this.play.setImageResource(R.drawable.video_stop);
            this.timer = new Timer();
            this.timerTask = new TimerTask() { // from class: com.lee.demo.view.VideoPlayActivity.8
                @Override // java.util.TimerTask, java.lang.Runnable
                public void run() {
                    if (AppEnvironment.getMedia() == null || !AppEnvironment.getMedia().isPlaying()) {
                        return;
                    }
                    VideoPlayActivity.this.seekBar.setProgress((int) ((AppEnvironment.getMedia().getCurrentPosition() / VideoPlayActivity.this.duration) * 7200000.0f));
                }
            };
            this.timer.schedule(this.timerTask, 0L, 500L);
        }
    }

    public String getTime(int i) {
        int rint = (int) Math.rint(i / 1000.0f);
        return String.valueOf(rint / 60 > 9 ? "" : "0") + (rint / 60) + ":" + (rint % 60 > 9 ? "" : "0") + (rint % 60);
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.dm = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(this.dm);
        setContentView(R.layout.fragment_video);
        initViews();
        Log.e("qwe", "dataSource:" + this.url);
        this.url = getIntent().getStringExtra("mediaurl");
        mpInitialize();
        try {
            AppEnvironment.getMedia().setDataSource(this.url);
            AppEnvironment.getMedia().prepareAsync();
            Log.e("qwe", "prepareAsync");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override // android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        this.isPlaying = false;
        this.timer = null;
        Log.e("qwe", "ondestory");
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        switch (i) {
            case 4:
                setResult(1024);
                finish();
                break;
        }
        return super.onKeyDown(i, keyEvent);
    }

    @Override // android.app.Activity
    public void onPause() {
        super.onPause();
        Log.e("qwe", "onpause");
        if (AppEnvironment.getMedia() == null || !AppEnvironment.getMedia().isPlaying()) {
            return;
        }
        pauseVideo();
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
        if (this.timerTask == null || this.timer == null) {
            return;
        }
        this.timerTask.cancel();
        this.timerTask = null;
        this.timer.cancel();
        this.timer = null;
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceCreated(SurfaceHolder surfaceHolder) {
        AppEnvironment.getMedia().setDisplay(surfaceHolder);
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        AppEnvironment.getMedia().setDisplay(null);
    }
}
