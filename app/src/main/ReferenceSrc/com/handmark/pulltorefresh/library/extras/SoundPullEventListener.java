package com.handmark.pulltorefresh.library.extras;

import android.content.Context;
import android.media.MediaPlayer;
import android.view.View;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
import java.util.HashMap;

/* loaded from: classes.dex */
public class SoundPullEventListener<V extends View> implements PullToRefreshBase.OnPullEventListener<V> {
    private final Context mContext;
    private MediaPlayer mCurrentMediaPlayer;
    private final HashMap<PullToRefreshBase.State, Integer> mSoundMap = new HashMap<>();

    public SoundPullEventListener(Context context) {
        this.mContext = context;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase.OnPullEventListener
    public final void onPullEvent(PullToRefreshBase<V> refreshView, PullToRefreshBase.State event, PullToRefreshBase.Mode direction) {
        Integer soundResIdObj = this.mSoundMap.get(event);
        if (soundResIdObj != null) {
            playSound(soundResIdObj.intValue());
        }
    }

    public void addSoundEvent(PullToRefreshBase.State event, int resId) {
        this.mSoundMap.put(event, Integer.valueOf(resId));
    }

    public void clearSounds() {
        this.mSoundMap.clear();
    }

    public MediaPlayer getCurrentMediaPlayer() {
        return this.mCurrentMediaPlayer;
    }

    private void playSound(int resId) {
        if (this.mCurrentMediaPlayer != null) {
            this.mCurrentMediaPlayer.stop();
            this.mCurrentMediaPlayer.release();
        }
        this.mCurrentMediaPlayer = MediaPlayer.create(this.mContext, resId);
        if (this.mCurrentMediaPlayer != null) {
            this.mCurrentMediaPlayer.start();
        }
    }
}
