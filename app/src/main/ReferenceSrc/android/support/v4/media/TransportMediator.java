package android.support.v4.media;

import android.app.Activity;
import android.content.Context;
import android.media.AudioManager;
import android.os.Build;
import android.view.KeyEvent;
import android.view.View;
import java.util.ArrayList;
import org.apache.commons.compress.archivers.tar.TarConstants;
import org.apache.commons.net.finger.FingerClient;

@Deprecated
/* loaded from: classes.jar:android/support/v4/media/TransportMediator.class */
public class TransportMediator extends TransportController {
    @Deprecated
    public static final int FLAG_KEY_MEDIA_FAST_FORWARD = 64;
    @Deprecated
    public static final int FLAG_KEY_MEDIA_NEXT = 128;
    @Deprecated
    public static final int FLAG_KEY_MEDIA_PAUSE = 16;
    @Deprecated
    public static final int FLAG_KEY_MEDIA_PLAY = 4;
    @Deprecated
    public static final int FLAG_KEY_MEDIA_PLAY_PAUSE = 8;
    @Deprecated
    public static final int FLAG_KEY_MEDIA_PREVIOUS = 1;
    @Deprecated
    public static final int FLAG_KEY_MEDIA_REWIND = 2;
    @Deprecated
    public static final int FLAG_KEY_MEDIA_STOP = 32;
    @Deprecated
    public static final int KEYCODE_MEDIA_PAUSE = 127;
    @Deprecated
    public static final int KEYCODE_MEDIA_PLAY = 126;
    @Deprecated
    public static final int KEYCODE_MEDIA_RECORD = 130;
    final AudioManager mAudioManager;
    final TransportPerformer mCallbacks;
    final Context mContext;
    final TransportMediatorJellybeanMR2 mController;
    final Object mDispatcherState;
    final KeyEvent.Callback mKeyEventCallback;
    final ArrayList<TransportStateListener> mListeners;
    final TransportMediatorCallback mTransportKeyCallback;
    final View mView;

    @Deprecated
    public TransportMediator(Activity activity, TransportPerformer transportPerformer) {
        this(activity, null, transportPerformer);
    }

    private TransportMediator(Activity activity, View view, TransportPerformer transportPerformer) {
        this.mListeners = new ArrayList<>();
        this.mTransportKeyCallback = new TransportMediatorCallback() { // from class: android.support.v4.media.TransportMediator.1
            @Override // android.support.v4.media.TransportMediatorCallback
            public long getPlaybackPosition() {
                return TransportMediator.this.mCallbacks.onGetCurrentPosition();
            }

            @Override // android.support.v4.media.TransportMediatorCallback
            public void handleAudioFocusChange(int i) {
                TransportMediator.this.mCallbacks.onAudioFocusChange(i);
            }

            @Override // android.support.v4.media.TransportMediatorCallback
            public void handleKey(KeyEvent keyEvent) {
                keyEvent.dispatch(TransportMediator.this.mKeyEventCallback);
            }

            @Override // android.support.v4.media.TransportMediatorCallback
            public void playbackPositionUpdate(long j) {
                TransportMediator.this.mCallbacks.onSeekTo(j);
            }
        };
        this.mKeyEventCallback = new KeyEvent.Callback() { // from class: android.support.v4.media.TransportMediator.2
            @Override // android.view.KeyEvent.Callback
            public boolean onKeyDown(int i, KeyEvent keyEvent) {
                return TransportMediator.isMediaKey(i) ? TransportMediator.this.mCallbacks.onMediaButtonDown(i, keyEvent) : false;
            }

            @Override // android.view.KeyEvent.Callback
            public boolean onKeyLongPress(int i, KeyEvent keyEvent) {
                return false;
            }

            @Override // android.view.KeyEvent.Callback
            public boolean onKeyMultiple(int i, int i2, KeyEvent keyEvent) {
                return false;
            }

            @Override // android.view.KeyEvent.Callback
            public boolean onKeyUp(int i, KeyEvent keyEvent) {
                return TransportMediator.isMediaKey(i) ? TransportMediator.this.mCallbacks.onMediaButtonUp(i, keyEvent) : false;
            }
        };
        this.mContext = activity != null ? activity : view.getContext();
        this.mCallbacks = transportPerformer;
        this.mAudioManager = (AudioManager) this.mContext.getSystemService("audio");
        this.mView = activity != null ? activity.getWindow().getDecorView() : view;
        this.mDispatcherState = this.mView.getKeyDispatcherState();
        if (Build.VERSION.SDK_INT >= 18) {
            this.mController = new TransportMediatorJellybeanMR2(this.mContext, this.mAudioManager, this.mView, this.mTransportKeyCallback);
        } else {
            this.mController = null;
        }
    }

    @Deprecated
    public TransportMediator(View view, TransportPerformer transportPerformer) {
        this(null, view, transportPerformer);
    }

    private TransportStateListener[] getListeners() {
        TransportStateListener[] transportStateListenerArr;
        if (this.mListeners.size() <= 0) {
            transportStateListenerArr = null;
        } else {
            transportStateListenerArr = new TransportStateListener[this.mListeners.size()];
            this.mListeners.toArray(transportStateListenerArr);
        }
        return transportStateListenerArr;
    }

    static boolean isMediaKey(int i) {
        boolean z;
        switch (i) {
            case FingerClient.DEFAULT_PORT /* 79 */:
            case 85:
            case 86:
            case 87:
            case TarConstants.LF_PAX_EXTENDED_HEADER_UC /* 88 */:
            case 89:
            case 90:
            case 91:
            case KEYCODE_MEDIA_PLAY /* 126 */:
            case 127:
            case KEYCODE_MEDIA_RECORD /* 130 */:
                z = true;
                break;
            default:
                z = false;
                break;
        }
        return z;
    }

    private void pushControllerState() {
        if (this.mController != null) {
            this.mController.refreshState(this.mCallbacks.onIsPlaying(), this.mCallbacks.onGetCurrentPosition(), this.mCallbacks.onGetTransportControlFlags());
        }
    }

    private void reportPlayingChanged() {
        TransportStateListener[] listeners = getListeners();
        if (listeners != null) {
            for (TransportStateListener transportStateListener : listeners) {
                transportStateListener.onPlayingChanged(this);
            }
        }
    }

    private void reportTransportControlsChanged() {
        TransportStateListener[] listeners = getListeners();
        if (listeners != null) {
            for (TransportStateListener transportStateListener : listeners) {
                transportStateListener.onTransportControlsChanged(this);
            }
        }
    }

    @Deprecated
    public void destroy() {
        this.mController.destroy();
    }

    @Deprecated
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return keyEvent.dispatch(this.mKeyEventCallback, (KeyEvent.DispatcherState) this.mDispatcherState, this);
    }

    @Override // android.support.v4.media.TransportController
    @Deprecated
    public int getBufferPercentage() {
        return this.mCallbacks.onGetBufferPercentage();
    }

    @Override // android.support.v4.media.TransportController
    @Deprecated
    public long getCurrentPosition() {
        return this.mCallbacks.onGetCurrentPosition();
    }

    @Override // android.support.v4.media.TransportController
    @Deprecated
    public long getDuration() {
        return this.mCallbacks.onGetDuration();
    }

    @Deprecated
    public Object getRemoteControlClient() {
        return this.mController != null ? this.mController.getRemoteControlClient() : null;
    }

    @Override // android.support.v4.media.TransportController
    @Deprecated
    public int getTransportControlFlags() {
        return this.mCallbacks.onGetTransportControlFlags();
    }

    @Override // android.support.v4.media.TransportController
    @Deprecated
    public boolean isPlaying() {
        return this.mCallbacks.onIsPlaying();
    }

    @Override // android.support.v4.media.TransportController
    @Deprecated
    public void pausePlaying() {
        if (this.mController != null) {
            this.mController.pausePlaying();
        }
        this.mCallbacks.onPause();
        pushControllerState();
        reportPlayingChanged();
    }

    @Deprecated
    public void refreshState() {
        pushControllerState();
        reportPlayingChanged();
        reportTransportControlsChanged();
    }

    @Override // android.support.v4.media.TransportController
    @Deprecated
    public void registerStateListener(TransportStateListener transportStateListener) {
        this.mListeners.add(transportStateListener);
    }

    @Override // android.support.v4.media.TransportController
    @Deprecated
    public void seekTo(long j) {
        this.mCallbacks.onSeekTo(j);
    }

    @Override // android.support.v4.media.TransportController
    @Deprecated
    public void startPlaying() {
        if (this.mController != null) {
            this.mController.startPlaying();
        }
        this.mCallbacks.onStart();
        pushControllerState();
        reportPlayingChanged();
    }

    @Override // android.support.v4.media.TransportController
    @Deprecated
    public void stopPlaying() {
        if (this.mController != null) {
            this.mController.stopPlaying();
        }
        this.mCallbacks.onStop();
        pushControllerState();
        reportPlayingChanged();
    }

    @Override // android.support.v4.media.TransportController
    @Deprecated
    public void unregisterStateListener(TransportStateListener transportStateListener) {
        this.mListeners.remove(transportStateListener);
    }
}
